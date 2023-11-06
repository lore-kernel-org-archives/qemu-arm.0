Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c4c9400b004065e235417sm12186804wmp.21.2023.11.06.07.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 07:30:43 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CA4045F79F;
	Mon,  6 Nov 2023 15:30:42 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Song Gao <gaosong@loongson.cn>,
  qemu-arm@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
  Wainer dos Santos Moschetta <wainersm@redhat.com>,  Weiwei Li
 <liweiwei@iscas.ac.cn>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Ilya Leoshkevich <iii@linux.ibm.com>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Yanan Wang <wangyanan55@huawei.com>,
  =?utf-8?Q?C=C3=A9dric?= Le
 Goater <clg@kaod.org>,  Paolo Bonzini <pbonzini@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  Brian Cain <bcain@quicinc.com>,
  qemu-ppc@nongnu.org,  Palmer Dabbelt <palmer@dabbelt.com>,
  qemu-riscv@nongnu.org,  Eduardo Habkost <eduardo@habkost.net>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Alistair Francis
 <alistair.francis@wdc.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
  Cleber Rosa <crosa@redhat.com>,  qemu-s390x@nongnu.org,  Laurent Vivier
 <laurent@vivier.eu>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
  Nicholas Piggin <npiggin@gmail.com>,  Thomas Huth <thuth@redhat.com>,
  John Snow <jsnow@redhat.com>,  Alexandre Iooss <erdnaxe@crans.org>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Mahmoud
 Mandour
 <ma.mandourr@gmail.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Bin Meng <bin.meng@windriver.com>,  Beraldo
 Leal <bleal@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Michael Rolnik <mrolnik@gmail.com>,
  Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: Re: [PATCH 25/29] contrib/plugins: extend execlog to track register
 changes
In-Reply-To: <20231103195956.1998255-26-alex.bennee@linaro.org> ("Alex
	=?utf-8?Q?Benn=C3=A9e=22's?= message of "Fri, 3 Nov 2023 19:59:52 +0000 (2
 days, 19
	hours, 30 minutes ago)")
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
	<20231103195956.1998255-26-alex.bennee@linaro.org>
User-Agent: mu4e 1.11.24; emacs 29.1
Date: Mon, 06 Nov 2023 15:30:42 +0000
Message-ID: <87bkc6dhlp.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0qu9zih8I5q+

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> With the new plugin register API we can now track changes to register
> values. Currently the implementation is fairly dumb which will slow
> down if a large number of register values are being tracked. This
> could be improved by only instrumenting instructions which mention
> registers we are interested in tracking.
>
> Example usage:
>
>   ./qemu-aarch64 -D plugin.log -d plugin \
>      -cpu max,sve256=3Don \
>      -plugin contrib/plugins/libexeclog.so,reg=3Dsp,reg=3Dz\* \
>      ./tests/tcg/aarch64-linux-user/sha512-sve
>
> will display in the execlog any changes to the stack pointer (sp) and
> the SVE Z registers.
>
> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> Based-On: <20231025093128.33116-19-akihiko.odaki@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> vAJB:
>
> Changes for the new API with a simpler glob based "reg" specifier
> which can be specified multiple times.
> +/*
> + * Initialise a new vcpu/thread with:
> + *   - last_exec tracking data
> + *   - list of tracked registers
> + *   - initial value of registers
> + *
> + * As we could have multiple threads trying to do this we need to
> + * serialise the expansion under a lock.
> + */
> +static void vcpu_init(qemu_plugin_id_t id, unsigned int vcpu_index)
> +{
> +    g_rw_lock_writer_lock(&expand_array_lock);
> +
> +    if (vcpu_index >=3D num_cpus) {
> +        cpus =3D g_realloc_n(cpus, vcpu_index + 1, sizeof(*cpus));
> +        while (vcpu_index >=3D num_cpus) {
> +            cpus[num_cpus].last_exec =3D g_string_new(NULL);
> +
> +            /* Any registers to track? */
> +            if (rmatches && rmatches->len) {
> +                GPtrArray *registers =3D g_ptr_array_new();
> +
> +                /* For each pattern add the register definitions */
> +                for (int p =3D 0; p < rmatches->len; p++) {
> +                    g_autoptr(GArray) reg_list =3D
> +                        qemu_plugin_find_registers(vcpu_index, rmatches-=
>pdata[p]);
> +                    if (reg_list && reg_list->len) {
> +                        for (int r =3D 0; r < reg_list->len; r++) {
> +                            Register *reg =3D
> +                                init_vcpu_register(vcpu_index,
> +                                                   &g_array_index(reg_li=
st,
> +                                                                  qemu_p=
lugin_reg_descriptor, r));
> +                            g_ptr_array_add(registers, reg);
> +                        }
> +                    }
> +                }
> +                cpus[num_cpus].registers =3D registers;

Note to self:

modified   contrib/plugins/execlog.c
@@ -250,6 +250,8 @@ static void vcpu_init(qemu_plugin_id_t id, unsigned int=
 vcpu_index)
                     }
                 }
                 cpus[num_cpus].registers =3D registers;
+            } else {
+                cpus[num_cpus].registers =3D NULL;
             }
             num_cpus++;
         }


> +            }
> +            num_cpus++;
> +        }
> +    }
> +
> +    g_rw_lock_writer_unlock(&expand_array_lock);
> +}
> +
>  /**
>   * On plugin exit, print last instruction in cache
>   */
>  static void plugin_exit(qemu_plugin_id_t id, void *p)
>  {
>      guint i;
> -    GString *s;
> -    for (i =3D 0; i < last_exec->len; i++) {
> -        s =3D g_ptr_array_index(last_exec, i);
> -        if (s->str) {
> -            qemu_plugin_outs(s->str);
> +    for (i =3D 0; i < num_cpus; i++) {
> +        if (cpus[i].last_exec->str) {
> +            qemu_plugin_outs(cpus[i].last_exec->str);
>              qemu_plugin_outs("\n");
>          }
>      }
> @@ -212,6 +291,18 @@ static void parse_vaddr_match(char *match)
>      g_array_append_val(amatches, v);
>  }
--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
