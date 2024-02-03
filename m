X-Forwarded-Encrypted: i=0; AJvYcCWOjB+MbAchR7jaNpDzLGcatmt9xJy2EZzefqQOW3rcLVp0VxdDGRvt1FNSL++FSbr6/nolkbnFzMUc9PInbcm9VA+o88XM88OoPFbqG7EniWRg9NQ1iv/16badwiKZza4bKTzAnqyazLlkQM7/HvYHKju/lzuMvVHggk7A6vffBI9VY2bWdbZtsB53UcqrbttBKaLb6kNfaythwn4ennkRFX5nFReVbe8cwnrNdXSBEtXb4oePw7glrtdhjbljEIKaL6fvuU2KnFYiLefUa/2bVrlS9r3/Bw+VtfjGVYiFo2T72OHMxqnyzsY5b8x2ccG/VufB0nLekrPJKHGma+Sou1ZcFkndSLrLFr3hlK8inwFpiRA9gTbbWumRd7K7AYhsdztMZCYmYEYq/csdWADJDSZx/+QtSSuSjjox4redsEXMVme59wYgDQvRbSlKv9+lxb69ArxYz1ktvYPR9064vQ0KE4/dvFFmLNVZpYqAaKQahtEHT6HP9iWK2khnjo0+Ef2a9usXJq6etSf1QgfybnWs+6Q6Bah2MFhAd3O6RbOgYPHm2Co8FDaucDhAWa4olZ+5oZ3BQ5G2q5lkqu7+2JhM8KcrffaIEM4/QaYsjIntLFtz3gHMRHTUdcKO+yjD9xz1ufSN2dObcT1k7P+HVKeWW1pYWj4AFtiPQgMRx6CTEVIygg83RogTRoiol4ySrxdmsvg46DQ2XBxfENjENutLbU/C27HE6vX1VDF4s11IdNFwyIuqpT7thZmHC3afZGUaxa311N3K6xsRdJKV5Lpi7s6PRxBZjuBVKAkrGzP3sACBobcc7D9vRLZF8pLK9U8z8k5p6ZGLj0ublVTuuebv3fhkVGfxfUmhspkjMTr/cV3x+IN55Ue81xiwZmt/peO/puTUcMbeVcqZo8kC28UUan4Uz6lwcRLnJGWYnk0M7EJqelxJKlSIjGafx7aLf8
 UdBasNsIoPsBDxz4u0Iitm3boftlZRaV5eIOibH3LBgQ2XwIEMtIgfHdSeLaj+PaG7Qp4y0XibYmseXzulbTJkVQVEayr+evC5IUyiYu7vmhM3XuxTHdDT52XHG7JCA4u10WJFNWlpjOU20SQyScTUMBXS3gft7qOJImc7BzTONBnGVv44tf5PJVknK+rO0aaj806/uM1//oVmG+2XAbcF/ChA2MKFRgqGX9QaDqKbZLBuFisZKIzezv/URo6HmlqumzLQSRI3XVY6eCpEL0l8ZJb5h+a48UYKgLyYr2xW8+aHL5LX3alIVi/gU9/9R999T826
Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id y4-20020a056000108400b0033ae593e830sm3894552wrw.23.2024.02.03.03.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 03:44:29 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 177825F7A9;
	Sat,  3 Feb 2024 11:44:29 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,  Philippe =?utf-8?Q?Math?=
 =?utf-8?Q?ieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Michael Rolnik <mrolnik@gmail.com>,  =?utf-8?Q?Marc?=
 =?utf-8?Q?-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Laurent Vivier
 <lvivier@redhat.com>,  kvm@vger.kernel.org,  Yoshinori Sato
 <ysato@users.sourceforge.jp>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  Palmer Dabbelt <palmer@dabbelt.com>,  Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>,  Laurent Vivier
 <laurent@vivier.eu>,  Yanan Wang <wangyanan55@huawei.com>,
  qemu-ppc@nongnu.org,  Weiwei Li <liwei1518@gmail.com>,
  qemu-s390x@nongnu.org,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
  Peter Maydell
 <peter.maydell@linaro.org>,  Alexandre Iooss <erdnaxe@crans.org>,  John
 Snow <jsnow@redhat.com>,  Mahmoud Mandour <ma.mandourr@gmail.com>,  Wainer
 dos Santos Moschetta <wainersm@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Ilya Leoshkevich <iii@linux.ibm.com>,
  Alistair Francis <alistair.francis@wdc.com>,  David Woodhouse
 <dwmw2@infradead.org>,  Cleber Rosa <crosa@redhat.com>,  Beraldo Leal
 <bleal@redhat.com>,  Bin Meng <bin.meng@windriver.com>,  Nicholas Piggin
 <npiggin@gmail.com>,  Aurelien Jarno <aurelien@aurel32.net>,  Daniel
 Henrique Barboza <danielhb413@gmail.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Thomas Huth <thuth@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  qemu-riscv@nongnu.org,
  qemu-arm@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Song Gao
 <gaosong@loongson.cn>,  Eduardo Habkost <eduardo@habkost.net>,  Brian Cain
 <bcain@quicinc.com>,  Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 16/21] gdbstub: expose api to find registers
In-Reply-To: <1c9a2e94-0c54-446b-99a2-69e25e9725df@daynix.com> (Akihiko
	Odaki's message of "Sat, 3 Feb 2024 20:23:46 +0900")
References: <20240122145610.413836-1-alex.bennee@linaro.org>
	<20240122145610.413836-17-alex.bennee@linaro.org>
	<1c9a2e94-0c54-446b-99a2-69e25e9725df@daynix.com>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Sat, 03 Feb 2024 11:44:29 +0000
Message-ID: <875xz5pyaq.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Af+wELPnZEOl

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2024/01/22 23:56, Alex Benn=C3=A9e wrote:
>> Expose an internal API to QEMU to return all the registers for a vCPU.
>> The list containing the details required to called gdb_read_register().
>> Based-on: <20231025093128.33116-15-akihiko.odaki@daynix.com>
>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Message-Id: <20240103173349.398526-38-alex.bennee@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>> v3
>>    - rm unused api functions left over
>> ---
>>   include/exec/gdbstub.h | 28 ++++++++++++++++++++++++++++
>>   gdbstub/gdbstub.c      | 27 ++++++++++++++++++++++++++-
>>   2 files changed, 54 insertions(+), 1 deletion(-)
>> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
>> index da9ddfe54c5..eb14b91139b 100644
>> --- a/include/exec/gdbstub.h
>> +++ b/include/exec/gdbstub.h
>> @@ -111,6 +111,34 @@ void gdb_feature_builder_end(const GDBFeatureBuilde=
r *builder);
>>    */
>>   const GDBFeature *gdb_find_static_feature(const char *xmlname);
>>   +/**
>> + * gdb_read_register() - Read a register associated with a CPU.
>> + * @cpu: The CPU associated with the register.
>> + * @buf: The buffer that the read register will be appended to.
>> + * @reg: The register's number returned by gdb_find_feature_register().
>> + *
>> + * Return: The number of read bytes.
>> + */
>> +int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>> +
>> +/**
>> + * typedef GDBRegDesc - a register description from gdbstub
>> + */
>> +typedef struct {
>
> nit: Add struct name; docs/devel/style.rst says struct has a CamelCase
> name *and* corresponding typedef, though this rule is apparently not
> strictly enforced.

I think the wording is a little ambiguous here, especially with the
reference to typedefs.h where the anonymous structure typedefs are held.
In this case we don't need the structname because there is no internal
reference to itself.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
