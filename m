Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp439873wme;
        Fri, 18 May 2018 07:57:37 -0700 (PDT)
X-Received: by 2002:a37:bd7:: with SMTP id 206-v6mr9011238qkl.407.1526655457348;
        Fri, 18 May 2018 07:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526655457; cv=none;
        d=google.com; s=arc-20160816;
        b=KOE7GK9SYNDCJMPrajjFD3VDMmk7f+JCSVSqqa7XXuqEshxY7v9aEvyY8dJfe8rINI
         onJE+jWK2UnSKx3ad0WznkvPHJoC2c7FuAHZeN3XZP6I2D6K9EV2N70gFWzT5kTjyg16
         X+6Zn6p1UB9zDwOtPlB/+tMm2Wg2Gyth/a69T+YVUIcwKKfB62RgNjvQJ5aXiBJAew2U
         MKgUsWih7DPf+Z+P7TlY90KtaY/Ycrii+5NR46jWFk3jwG7OUeayYk1WGcmb+7zyz/2S
         1PR6vmxc5R9WpDBYYzvw3m1ymfae7OPjDw5X9yvwxxl3V7a9sYLpI8DPdpePaC8gchAg
         GDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :sender:dkim-signature:arc-authentication-results;
        bh=jQzvPS4Nfq2gJ9jVAsTQrYljTLoC6lIXgMJGiJNbAlE=;
        b=Tcs2lJj/ze3aNjMD9l1jreLBCifjQBHdv59WTZy+qkknsnIokyY/9XBkhncXIL4Mx/
         yFafdFs7n5Sdz9pXlqAwaxuVlED+s3rSKNB3iFtMNvG1v92A2NOX9uQP11HfUPwrzVME
         6uPspC8nyMloJbFlqwDrL5i4Hz+v3zsx7ps1ph5ppJt1NV9sXn5ILa9EIYMijOR9kTdo
         hgWH49JFka+BueSI89V7+a1UeHJFiSnJ+lDNLThsPrjYV6tQa/EVY5SQvdQVzGN6oq2v
         +lMlnJL00U9OiC3lQ9aC9gClCnAFBvWWrZTPHWzPvvDenEF54dMABOBvX3vP2ePrB9KN
         xtXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GZBsQfWH;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t34-v6sor6236349qth.85.2018.05.18.07.57.37
        (Google Transport Security);
        Fri, 18 May 2018 07:57:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GZBsQfWH;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jQzvPS4Nfq2gJ9jVAsTQrYljTLoC6lIXgMJGiJNbAlE=;
        b=GZBsQfWHXLExLEanaN7efIlEnkyDkjtHK1/QjiMfo/oOIDNfmZM6/rAWDmU8WmMNZE
         0LNQzEg/ZTOVyemmbT/atN5h/E1tEcmjFNXWF7aWyDFbd/8TEBCj42qD0+rQKkRrKkni
         TyfkLDWV007/2/hwIGKm0TqDOovVws+tMYkaS3J7PloW6+7g+XnqYgwV120OxvAGYj3w
         6aaDGOcx+RffWawfk6yOkBsnkT8mdoWBZFe1Q3P+RSjNbkgyGWpBjFkSe0il/Izqg1Xq
         wOsgnIQlhfDQHYsqAgpTgmw55u6dWGN/+9T1v/HpcnNtv6vcXShtLEgjKEGg16TZKvtj
         YTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jQzvPS4Nfq2gJ9jVAsTQrYljTLoC6lIXgMJGiJNbAlE=;
        b=c+c7kZeCVvUqWxvA6ZF80mWPr8IaCR564924ys4V+nG7Bki5B/tQi06uwJyptTSQR3
         lze4u6mkPckv8dXWeUfPbl/AcX21LalAL6JBavJdsiTGc/gUWN5MLxTkcGIeH/1Avzdh
         cdjOq3yNYXEMaawHyeHKGeir3Dpr+p/CsxI5pv0OR8pL0bntoEOe4Xl7wLy2vjQWjIfO
         r6BAqfvVtQHxHTX28ineKr2jt1GTEtqz3Z/3+2nsnqY6iceeDEm6c1+RrY+hSN6yMRNe
         UVqth+wX3jcsxQfU4ux6CYswYMfMmbh5KE6nVLpWqvSuuCYe/uQi8tlnUzctwgoegkkp
         zNFw==
X-Gm-Message-State: ALKqPwcNKzQXj338s7hOJVmjl/H1kQiCAOKaH6eJCLpBc06XlAs+ynxT
	x5FYJsKvFv8GFz7nDOYVNzw=
X-Google-Smtp-Source: AB8JxZpvTZIm3ei+l3KtQC1ZJN+9Qyd4tJ3W3DmMQvAOTXErfs0CP19/VcZW0KqAKzOmjcJgV5kSeQ==
X-Received: by 2002:ac8:10d:: with SMTP id e13-v6mr9189351qtg.403.1526655456949;
        Fri, 18 May 2018 07:57:36 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.11] ([138.117.48.222])
        by smtp.gmail.com with ESMTPSA id g67-v6sm5519461qkb.51.2018.05.18.07.57.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 May 2018 07:57:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v4 30/49] tests/tcg: enable building for AArch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, cota@braap.org,
 famz@redhat.com, berrange@redhat.com, richard.henderson@linaro.org,
 balrogg@gmail.com, aurelien@aurel32.net, agraf@suse.de
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
 <20180517174718.10107-31-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <a21256f7-d319-11c2-9b81-f422008f0cab@amsat.org>
Date: Fri, 18 May 2018 11:57:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180517174718.10107-31-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: YX3/7nzKAHow

On 05/17/2018 02:46 PM, Alex Bennée wrote:
> We only have compilers for the (default) little endian variants.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> ---
> v4
>   - update MAINTAINERS
> ---
>  MAINTAINERS                        | 1 +
>  tests/tcg/aarch64/Makefile.include | 8 ++++++++
>  2 files changed, 9 insertions(+)
>  create mode 100644 tests/tcg/aarch64/Makefile.include
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4e331c4db4..ee7f101890 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -136,6 +136,7 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: target/arm/
>  F: tests/tcg/arm/
> +F: tests/tcg/aarch64/
>  F: hw/arm/
>  F: hw/cpu/a*mpcore.c
>  F: include/hw/cpu/a*mpcore.h
> diff --git a/tests/tcg/aarch64/Makefile.include b/tests/tcg/aarch64/Makefile.include
> new file mode 100644
> index 0000000000..de32c91235
> --- /dev/null
> +++ b/tests/tcg/aarch64/Makefile.include
> @@ -0,0 +1,8 @@
> +# Makefile.include for AArch64 targets
> +#
> +# We don't have any bigendian build tools so we only use this for AArch64
> +
> +ifeq ($(TARGET_NAME),aarch64)
> +DOCKER_IMAGE=debian-arm64-cross
> +DOCKER_CROSS_COMPILER=aarch64-linux-gnu-gcc
> +endif
> 
