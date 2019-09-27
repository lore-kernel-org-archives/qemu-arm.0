Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3321787wrp;
        Fri, 27 Sep 2019 03:44:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwYEYv8DKx1AncrOaEE+k7hV5ukkcLgkV9aQ7tGu5oVy3OjbX9K9QnRMV8O8EMQR4lJt+SA
X-Received: by 2002:adf:e64e:: with SMTP id b14mr2644924wrn.16.1569581072946;
        Fri, 27 Sep 2019 03:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569581072; cv=none;
        d=google.com; s=arc-20160816;
        b=IyQZveNZEIFnZIHE29+eHepT/rNIxAFF9gjUVmQepyjXHl9WGMjztEk/oxxw9C/5kC
         a5fD2DhLJhbF0x+/8I4aP9wrVMcbmuI7I34UspfD4tBijGJHtsGBhndJRnYnlSeBxIfH
         iRz6KrGC6qLuCLHUfcuknOej7qJyLmmVZV/ROrt/vDarzVc/1Tcnxpr7J4KjAmnx1mSc
         r0pXymKcVoOsy2dehI9BfTywsBjClLiBeleppJeBDMYtq2wugxSPnjIJKwzpvEvEKQcy
         VlTEvX/4lAkpT2U+dkUQSPonvTYWj884axZpWn9rBVcaddREhNFOm36QT2uNawRMdU6B
         e1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=subject:content-transfer-encoding:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:cc:to;
        bh=ed/pSNoOWLclgfJbPTkNNiopxqjaSy7dFyoQqXzD93k=;
        b=ZUif+PLnaxMpbX2LDMWKsBI6pC3JqURIW6dFKENvj2YeYvn2mEq6Pc+Nr/746VyKSK
         7AohmtmhIpfQyqWSGs4jkCoMvd1MXFNTWIsfepBx3NsZA5DGosRerBwxBTOJjlKtto/w
         JLqLrwucsZg0lMcqmP+1P52nN1fpMTfSGRGonp16yxSPhuUvr682At+7en8oog48DGwQ
         unDqlP7EKkExteinMqwbiV52a+wmx6eI7Iu/1+rm1R6UCgg6jadpzhxfzXQ906SH3583
         9QH90bdSGvV3omUjknbmVbpBjCHfp2nAqMpuRYPu8BqZ0SNJZHUHic889pNNCxb2pBCg
         VDTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 46.43.2.167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk
Return-Path: <mark.cave-ayland@ilande.co.uk>
Received: from mail.default.ilande.uk0.bigv.io (mail.ilande.co.uk. [46.43.2.167])
        by mx.google.com with ESMTPS id f67si3974328wmg.157.2019.09.27.03.44.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2019 03:44:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 46.43.2.167 as permitted sender) client-ip=46.43.2.167;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 46.43.2.167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk
Received: from host86-138-245-63.range86-138.btcentralplus.com ([86.138.245.63] helo=[192.168.1.65])
	by mail.default.ilande.uk0.bigv.io with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1iDnhu-0005eZ-JE; Fri, 27 Sep 2019 11:42:40 +0100
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-discuss@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnnu.org
References: <20190925233013.6449-1-alex.bennee@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 mQENBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAG0ME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPokB
 OAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63LkBDQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABiQEfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
Message-ID: <573abf48-b616-47d4-0296-cc0b4ad9e1f2@ilande.co.uk>
Date: Fri, 27 Sep 2019 11:42:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190925233013.6449-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.138.245.63
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.uk0.bigv.io
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	SUSPICIOUS_RECIPS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.2
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-TUID: KBp88rikO4h+

On 26/09/2019 00:30, Alex Bennée wrote:

> The 32 bit hosts are already a second class citizen especially with
> support for running 64 bit guests under TCG. We are also limited by
> testing as actual working 32 bit machines are getting quite rare in
> developers personal menageries. For TCG supporting newer types like
> Int128 is a lot harder with 32 bit calling conventions compared to
> their larger bit sized cousins. Fundamentally address space is the
> most useful thing for the translator to have even for a 32 bit guest a
> 32 bit host is quite constrained.
> 
> As far as I'm aware 32 bit KVM users are even less numerous. Even
> ILP32 doesn't make much sense given the address space QEMU needs to
> manage.
> 
> Lets mark these machines as deprecated so we can have the wailing and
> gnashing of teeth now and look to actually dropping the support in a
> couple of cycles.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/configure b/configure
> index 542f6aea3f..776fd460b5 100755
> --- a/configure
> +++ b/configure
> @@ -728,7 +728,7 @@ ARCH=
>  # Normalise host CPU name and set ARCH.
>  # Note that this case should only have supported host CPUs, not guests.
>  case "$cpu" in
> -  ppc|ppc64|s390|s390x|sparc64|x32|riscv32|riscv64)
> +  ppc64|s390|s390x|sparc64|riscv64)
>      supported_cpu="yes"
>    ;;
>    ppc64le)
> @@ -737,7 +737,6 @@ case "$cpu" in
>    ;;
>    i386|i486|i586|i686|i86pc|BePC)
>      cpu="i386"
> -    supported_cpu="yes"
>    ;;
>    x86_64|amd64)
>      cpu="x86_64"
> @@ -745,19 +744,22 @@ case "$cpu" in
>    ;;
>    armv*b|armv*l|arm)
>      cpu="arm"
> -    supported_cpu="yes"
>    ;;
>    aarch64)
>      cpu="aarch64"
>      supported_cpu="yes"
>    ;;
> -  mips*)
> +  mips64*)
>      cpu="mips"
>      supported_cpu="yes"
>    ;;
> +  mips*)
> +    cpu="mips"
> +  ;;
>    sparc|sun4[cdmuv])
>      cpu="sparc"
> -    supported_cpu="yes"
> +  ;;
> +  x32|riscv32)
>    ;;
>    *)
>      # This will result in either an error or falling back to TCI later
> @@ -6438,12 +6440,12 @@ if test "$supported_cpu" = "no"; then
>      echo "WARNING: SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE RELEASES!"
>      echo
>      echo "CPU host architecture $cpu support is not currently maintained."
> -    echo "The QEMU project intends to remove support for this host CPU in"
> -    echo "a future release if nobody volunteers to maintain it and to"
> -    echo "provide a build host for our continuous integration setup."
> -    echo "configure has succeeded and you can continue to build, but"
> -    echo "if you care about QEMU on this platform you should contact"
> -    echo "us upstream at qemu-devel@nongnu.org."
> +    echo "The QEMU project intends to remove support for all 32 bit host"
> +    echo "CPUs in a future release. 64 bit hosts will need a volunteer"
> +    echo "to maintain it and to provide a build host for our continuous"
> +    echo "integration setup. configure has succeeded and you can continue"
> +    echo "to build, but if you care about QEMU on this platform you"
> +    echo "should contact us upstream at qemu-devel@nongnu.org."
>  fi
>  
>  if test "$supported_os" = "no"; then

FWIW I still use my Mac Mini G4 (with KVM) to help debug bits of TCG for
qemu-system-ppc and so I would certainly miss this for bits of my Mac work.

Is it possible to reach a compromise based on host/target i.e. allow 32-bit hosts to
only run targets up to 32-bits? I'd only ever want to use qemu-system-ppc on the Mac
Mini for testing: for qemu-system-ppc64 it is clearly much quicker just to use the
nearest x86 box.


ATB,

Mark.
