Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp719945wrp;
        Thu, 19 Sep 2019 01:54:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwBK38QhJdVRmzvwNT4Vjnj9QBWuVInCKeHb5tfiXoXuUTc6cdbnU/ivhSIP+ebUswnUfiE
X-Received: by 2002:a2e:8943:: with SMTP id b3mr4709465ljk.165.1568883264303;
        Thu, 19 Sep 2019 01:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568883264; cv=none;
        d=google.com; s=arc-20160816;
        b=Q8F2Kvi8Cq2VxS5iMSTGCPoRLuqGfzNqjbMaMuJzYdC4wT5e6Uq40ZrxIDuklvgIgs
         X84+DdKggEpqIEVIZCDhmtMNgkkYl7xQ1a/hv7T/Z5DQMdNw18n3LeWq+xiC2gT311jr
         8BxpsxA7z1gvpl424Js0HaKQwzgUuYdHM1rvUCDVI7SVk2RTxmBZ2HyFCH2a9/W5cQAD
         8bDrrzIZM8z1/GZFlCi0XRfsoxiQkOaD50pgdzdtodoKBk1lDE4geWHh0ESOM5JyKWWf
         BICIyDQfqlsT/aaxXbZIgoRNSyih+T/tRc50gG45JvH7DclVqdYVVcU5CS5v6eIZH3zE
         nUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:thread-index:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from;
        bh=a+JrWP1Q9bmUSf53gxhDkp2A2s7j6xC3NFwbq2nwZY8=;
        b=CyFjxvWP4BzTFo0zJUYeHIgrOJuOQXZi8P/8lkzE2IMssEH/jFs/pQi3f+EURQNvun
         5m0OThn0274OIZb0HFU3dwi1ZL/y/ulb6Hna5GPArK7GT2DSXWC0oAjfRFB7IuQTGs1t
         dzDk9YRP+oNdtkQ03dgi0V0mfkywIZ07hvjZK5gHyC9ibATjIUWjnFr8gaOlS0AL+4e6
         sY+8UCBBcHl6Nl06QHOEAt3tm03Iv3uiyvTi9CZhjh3Npg2HYEnmcif+ZI1hDmHNnRgg
         FIX6g8RxtFlgPKpm9txnu0nJNx5tRIgQZGvZ6vXKtS/gVLwfmtOy4nE1MNiQ0E4duovd
         CtaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dovgaluk@ispras.ru designates 83.149.199.45 as permitted sender) smtp.mailfrom=dovgaluk@ispras.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Return-Path: <dovgaluk@ispras.ru>
Received: from mail.ispras.ru (mail.ispras.ru. [83.149.199.45])
        by mx.google.com with ESMTP id a19si582895ljk.37.2019.09.19.01.54.24;
        Thu, 19 Sep 2019 01:54:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of dovgaluk@ispras.ru designates 83.149.199.45 as permitted sender) client-ip=83.149.199.45;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dovgaluk@ispras.ru designates 83.149.199.45 as permitted sender) smtp.mailfrom=dovgaluk@ispras.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Received: from PASHAISP (unknown [85.142.117.226])
	by mail.ispras.ru (Postfix) with ESMTPSA id 73F71540081;
	Thu, 19 Sep 2019 11:54:23 +0300 (MSK)
From: "Pavel Dovgalyuk" <dovgaluk@ispras.ru>
To: =?UTF-8?Q?'Alex_Benn=C3=A9e'?= <alex.bennee@linaro.org>,
	<qemu-devel@nongnu.org>
Cc: "'Peter Maydell'" <peter.maydell@linaro.org>,
	"'open list:ARM TCG CPUs'" <qemu-arm@nongnu.org>
References: <20190918153335.20797-1-alex.bennee@linaro.org>
In-Reply-To: <20190918153335.20797-1-alex.bennee@linaro.org>
Subject: RE: [PATCH] tests/tcg: add simple record/replay smoke test for aarch64
Date: Thu, 19 Sep 2019 11:54:27 +0300
Message-ID: <001801d56ec7$d80940d0$881bc270$@ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdVuNoszH7q5RfvASfiDKqZTDLZgqwAkGOsg
Content-Language: ru
X-TUID: BOIo+sbG81FM

Thanks!

This seem to correctly run record and replay command lines.
When I break the replay correctness, then the test reports a timeout =
error.

However, we need some kind of a manual for tcg testing. I had to dig =
through makefile and configure
scripts to undestand that testing needs the cross compilers to be =
installed.
Then I installed a random cross compiler and everything worked normally.

Pavel Dovgalyuk

> -----Original Message-----
> From: Alex Benn=C3=A9e [mailto:alex.bennee@linaro.org]
> Sent: Wednesday, September 18, 2019 6:34 PM
> To: qemu-devel@nongnu.org
> Cc: Alex Benn=C3=A9e; Pavel Dovgalyuk; Peter Maydell; open list:ARM =
TCG CPUs
> Subject: [PATCH] tests/tcg: add simple record/replay smoke test for =
aarch64
>=20
> This adds two new tests that re-use the memory test to check basic
> record replay functionality is still working. We have to define our
> own runners rather than using the default pattern as we want to change
> the test name but re-use the memory binary.
>=20
> We declare the test binaries as PHONY as they don't rely exist.
>=20
> [AJB: A better test would output some sort of timer value or other
> otherwise variable value so we could compare the record and replay
> outputs and ensure they match]
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Pavel Dovgalyuk <dovgaluk@ispras.ru>
> ---
>  tests/tcg/aarch64/Makefile.softmmu-target | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/tests/tcg/aarch64/Makefile.softmmu-target =
b/tests/tcg/aarch64/Makefile.softmmu-
> target
> index 4c4aaf61dd3..b4b39579634 100644
> --- a/tests/tcg/aarch64/Makefile.softmmu-target
> +++ b/tests/tcg/aarch64/Makefile.softmmu-target
> @@ -32,3 +32,24 @@ memory: CFLAGS+=3D-DCHECK_UNALIGNED=3D1
>=20
>  # Running
>  QEMU_OPTS+=3D-M virt -cpu max -display none -semihosting-config
> enable=3Don,target=3Dnative,chardev=3Doutput -kernel
> +
> +# Simple Record/Replay Test
> +.PHONY: memory-record
> +run-memory-record: memory-record memory
> +	$(call run-test, $<, \
> +	  $(QEMU) -monitor none -display none \
> +		  -chardev file$(COMMA)path=3D$<.out$(COMMA)id=3Doutput \
> +		  -icount shift=3D5$(COMMA)rr=3Drecord$(COMMA)rrfile=3Drecord.bin \
> +	   	  $(QEMU_OPTS) memory, \
> +	  "$< on $(TARGET_NAME)")
> +
> +.PHONY: memory-replay
> +run-memory-replay: memory-replay run-memory-record
> +	$(call run-test, $<, \
> +	  $(QEMU) -monitor none -display none \
> +		  -chardev file$(COMMA)path=3D$<.out$(COMMA)id=3Doutput \
> +		  -icount shift=3D5$(COMMA)rr=3Dreplay$(COMMA)rrfile=3Drecord.bin \
> +	   	  $(QEMU_OPTS) memory, \
> +	  "$< on $(TARGET_NAME)")
> +
> +TESTS+=3Dmemory-record memory-replay
> --
> 2.20.1

