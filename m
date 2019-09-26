Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1814669wrp;
        Thu, 26 Sep 2019 00:55:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxp4tHGQSJ2zq3l03HsOBfU3gKwNgBmaQzwtn99fHUVtBQL8RRXkDaEy2r8dFDmlhmv0gEs
X-Received: by 2002:a5d:87d0:: with SMTP id q16mr2210495ios.157.1569484550065;
        Thu, 26 Sep 2019 00:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569484550; cv=none;
        d=google.com; s=arc-20160816;
        b=OrB7zZxCERaFoCWNAlz7aeZ+09O+LHoTwV3fLI/c+sborzfMMa6rjtjwtt/xiiBtTU
         bn1jGGYyYDxQdPR2zKIcpVZoZNVaGPzfpMROtf7pHMjAiw7ag9KtmjN0tNU9ejjuAwsb
         UQEaSc2/strO7v2FnEZljQ+wP6YtosCtbXXZZ2Jp+qR5oZQAyTyvQpowfO5lvCScuovW
         0JNERaSq8Fu2Hr9q3jFvOz80i/Qv5WYYTcLyPBzpKGoleQTl6DA21DwD4ULMn6RfjO8A
         cIpsfHjtZtyHY2E2EnheouuHGJAhWWRC76X7so+1NIjxmr6XBw8oOtSyakmyfA6Ad7s/
         r9sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:cc:to:subject;
        bh=3s8lebVBtfg+Eff3X2AJrA1MsiFxIc6N5M1kNZIVI1w=;
        b=IDiyEP/Osi0IuKjbiaY+WCKfXEg+qAIemJPmWeVL8Ytq7UgsxNirWAdGSUGpMOyYXM
         oUOdl5w5pp/g5hw5SuozF7bIBB6bk7B/XAz1H8lNaaVbEjjLBYnPh6tiin/9cxdlt2T8
         0TkkwiJxVHVD49kG2MDyIiNKXkhmHUwfkB2cwRlDh5ohGi3PnoQsNWKGDbaCKSD9SLiU
         v6LDwFEvPf0YQz91Nia8NShTk6NBOgUmtIl9JQDrtApWVV+H/q1Ba/GilplRQWRROB6s
         ZOk9t/OJWj17F4YBaeAv8tPUoqHrU/u1gvKizRTP2mjmo68QyzX0zjm9jYyS2ezSjfh+
         VIIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g190si1652886jac.25.2019.09.26.00.55.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 00:55:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A333C08E2A3;
	Thu, 26 Sep 2019 07:55:49 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-127.ams2.redhat.com [10.36.116.127])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14B6F1001B12;
	Thu, 26 Sep 2019 07:55:46 +0000 (UTC)
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-discuss@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20190925233013.6449-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat
Message-ID: <0a2c56da-173e-2abd-de76-e38a649e8f25@redhat.com>
Date: Thu, 26 Sep 2019 09:55:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190925233013.6449-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 26 Sep 2019 07:55:49 +0000 (UTC)
X-TUID: M2lIHQJRhof3

On 26/09/2019 01.30, Alex Bennée wrote:
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

I think you can also remove "s390". "s390" is the 32-bit variant,
"s390x" is the 64-bit variant.

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

You forgot to add "ppc" (and "s390") here.

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

In case this gets accepted, we also might want to deprecate the
qemu-system-i386, qemu-system-arm and qemu-system-ppc targets, since
they are AFAIK just a subset of qemu-system-x86_64, qemu-system-aarch64
and qemu-system-ppc64. But that's likely something for a later patch, I
think.

 Thomas
