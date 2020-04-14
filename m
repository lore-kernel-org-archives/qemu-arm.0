Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id k9sm20550119wrd.17.2020.04.14.09.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 09:09:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1C5F21FF7E;
	Tue, 14 Apr 2020 17:09:30 +0100 (BST)
References: <20200414102427.7459-1-philmd@redhat.com>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH-for-5.0] gdbstub: Do not use memset() on GByteArray
In-reply-to: <20200414102427.7459-1-philmd@redhat.com>
Date: Tue, 14 Apr 2020 17:09:30 +0100
Message-ID: <87y2qy82x1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /EV75jxr2nxv


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Introduce gdb_get_zeroes() to fill a GByteArray with zeroes.
>
> Fixes: a010bdbe719 ("extend GByteArray to read register helpers")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Queued to for-5.0/more-random-fixes with Peter's alternative.

> ---
>  include/exec/gdbstub.h  | 9 +++++++++
>  target/arm/gdbstub.c    | 3 +--
>  target/xtensa/gdbstub.c | 6 ++----
>  3 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 30b909ebd2..b52d9933ee 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -125,6 +125,15 @@ static inline int gdb_get_reg128(GByteArray *buf, ui=
nt64_t val_hi,
>      return 16;
>  }
>=20=20
> +static inline int gdb_get_zeroes(GByteArray *array, size_t len)
> +{
> +    for (size_t i =3D 0; i < len; i++) {
> +        gdb_get_reg8(array, '\0');
> +    }
> +
> +    return len;
> +}
> +
>  /**
>   * gdb_get_reg_ptr: get pointer to start of last element
>   * @len: length of element
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 8efc535f2a..063551df23 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -47,8 +47,7 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray =
*mem_buf, int n)
>          if (gdb_has_xml) {
>              return 0;
>          }
> -        memset(mem_buf, 0, 12);
> -        return 12;
> +        return gdb_get_zeroes(mem_buf, 12);
>      }
>      switch (n) {
>      case 24:
> diff --git a/target/xtensa/gdbstub.c b/target/xtensa/gdbstub.c
> index 0ee3feabe5..4d43f1340a 100644
> --- a/target/xtensa/gdbstub.c
> +++ b/target/xtensa/gdbstub.c
> @@ -105,8 +105,7 @@ int xtensa_cpu_gdb_read_register(CPUState *cs, GByteA=
rray *mem_buf, int n)
>          default:
>              qemu_log_mask(LOG_UNIMP, "%s from reg %d of unsupported size=
 %d\n",
>                            __func__, n, reg->size);
> -            memset(mem_buf, 0, reg->size);
> -            return reg->size;
> +            return gdb_get_zeroes(mem_buf, reg->size);
>          }
>=20=20
>      case xtRegisterTypeWindow: /*a*/
> @@ -115,8 +114,7 @@ int xtensa_cpu_gdb_read_register(CPUState *cs, GByteA=
rray *mem_buf, int n)
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s from reg %d of unsupported type %d\=
n",
>                        __func__, n, reg->type);
> -        memset(mem_buf, 0, reg->size);
> -        return reg->size;
> +        return gdb_get_zeroes(mem_buf, reg->size);
>      }
>  }


--=20
Alex Benn=C3=A9e
