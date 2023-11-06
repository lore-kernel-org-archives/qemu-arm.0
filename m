Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m1-20020a056000180100b0031980783d78sm9737891wrh.54.2023.11.06.07.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 07:35:50 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7EE9A5F79F;
	Mon,  6 Nov 2023 15:35:50 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  "Edgar E. Iglesias"
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
 <richard.henderson@linaro.org>,  Michael Rolnik <mrolnik@gmail.com>
Subject: Re: [PATCH 13/29] target/riscv: Use GDBFeature for dynamic XML
In-Reply-To: <87a5rrdy6d.fsf@draig.linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9?=
 =?utf-8?Q?e=22's?= message of
	"Mon, 06 Nov 2023 09:32:42 +0000 (6 hours, 1 minute, 47 seconds ago)")
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
	<20231103195956.1998255-14-alex.bennee@linaro.org>
	<87a5rrdy6d.fsf@draig.linaro.org>
User-Agent: mu4e 1.11.24; emacs 29.1
Date: Mon, 06 Nov 2023 15:35:50 +0000
Message-ID: <875y2edhd5.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2VTL1HhsSSpr

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>>
>> In preparation for a change to use GDBFeature as a parameter of
>> gdb_register_coprocessor(), convert the internal representation of
>> dynamic feature from plain XML to GDBFeature.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Message-Id: <20231025093128.33116-7-akihiko.odaki@daynix.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> I bisected the following failure:
>
>  ./qemu-riscv64 -g 1234 ./tests/tcg/riscv64-linux-user/sha512
>
> and:
>
>  gdb-multiarch ./tests/tcg/riscv64-linux-user/sha512 -ex "target remote l=
ocalhost:1234" -x ../../tests/tcg/multiarch/gdbstub/registers.py
>
> gives:
>
> warning: Architecture rejected target-supplied description
> Ignoring packet error, continuing...
> Ignoring packet error, continuing...
> Ignoring packet error, continuing...
> Ignoring packet error, continuing...

I don't know if the discontinuous register numbering could be the
problem:

  <feature name=3D"org.gnu.gdb.riscv.csr">
    <reg name=3D"fflags" bitsize=3D"64" type=3D"int" regnum=3D"67"/>
    <reg name=3D"frm" bitsize=3D"64" type=3D"int" regnum=3D"68"/>
    <reg name=3D"fcsr" bitsize=3D"64" type=3D"int" regnum=3D"69"/>
    <reg name=3D"cycle" bitsize=3D"64" type=3D"int" regnum=3D"3138"/>
    <reg name=3D"time" bitsize=3D"64" type=3D"int" regnum=3D"3139"/>
    <reg name=3D"instret" bitsize=3D"64" type=3D"int" regnum=3D"3140"/>
  </feature>

?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
