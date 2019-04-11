Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp6981154wrx;
        Thu, 11 Apr 2019 02:53:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+WrTluLOqnoYYOO2uXndZyPtqMBPSISHXYIh8awiEmfaP2H9Z+FgjjvvSP1f3naX+7JfV
X-Received: by 2002:a1c:ef08:: with SMTP id n8mr5885538wmh.85.1554976395745;
        Thu, 11 Apr 2019 02:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554976395; cv=none;
        d=google.com; s=arc-20160816;
        b=VCWgOX0bYp/GM2dbfwibfH5sUasPHT3p/4YBQLJZJudlFeHTp1rn2rflhd4Kpkkp8J
         UJXoR9cUlxOBFTT6iOKuSB2E9rfWPWt4wUgEHSsgpSShEGnk/NgFgdz0HQuDmskrR5NO
         HnCdvnmavzBAV7ea1NfznsE1tVJrHrLRQG2ToQD6NPKUsw24drx/EOdd+kJedLg9X+Hb
         u3wpLu56K5K+G4Dser//a5Xid9jNkotuOaS2w9tLUb2o2lBfpznXix77yBgMSWOCIkDI
         20kyxz2Frlw7e9AZXMnf6HgucmkKAPkesPCgR5mGIYZGS52eBf+aKN9iS0FXun6RTE93
         AKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=TUxPRAUluTvAnTHxv57v0NOLWb7K/HpHWUgipakNcXs=;
        b=YqVcrSomBlmmJgJFhRJdOk29reE5O5XUkqxloWStdMMAN3nrj3hhnxPwHkaZvd9oB0
         gdpoGLgANFCh5l1HrJxNncMMIo6l1KsGeCJJeLPASpavFA1kLKVrr8ylKDxbow+6aFQC
         UpHVbp2xl4muM61NPzgfHQCxD1jSQ6xy8YYWxy1YePC+hUQBgFfVzlY8xLToDXSQQwHO
         Yq7FZR+jkhnUF5ThPK4JcRY0TRvlNOuoy18GAvTrZA1hNLkazDK2lDsrwP5tR2n1YehS
         YZm59t6mFZ/+gIy0KwznUsEpttk0bshyByfSC/dojyATl20U9XgqZn5WorEZDgFTj9OW
         w9WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si2868025wmf.149.2019.04.11.02.53.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 02:53:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEWOQ-00039H-NU
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 05:53:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEWOB-00037a-Pv
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 05:53:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEWOA-0006fp-Gm
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 05:52:59 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35651)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hEWOA-0006fK-7C
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 05:52:58 -0400
Received: by mail-wr1-f65.google.com with SMTP id w1so6483127wrp.2
	for <qemu-arm@nongnu.org>; Thu, 11 Apr 2019 02:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TUxPRAUluTvAnTHxv57v0NOLWb7K/HpHWUgipakNcXs=;
	b=BVY66ebvT4RhjmaHSGjJBVNuzuQXrMBa5uGI0RRZUPMP6st4w1G9u+kI6e2BsX7G6z
	VL6wLJXl9TIh8EHV/GITlFH22um1lL78A4kmfUgBxWDkpOGBU7uZcbU4jfHdGKf/SoZ6
	qtBlWzq/SMOzZi3vq66UenOXZCsUsol72nXYW+2XOIfAfS2MNZKbuKCT8+w/QMawZRIJ
	CtNj+HfjORZTHCezl8JNyzd2+Q5S6uvqbEQbk/ibuByfCVqfCNoPVlBVQeHMrQoj15BC
	9zZ0dTJc+4RSr+hDJ9jlAQ+5Cvd4gT90sU7TauH2Fo4DAaonhcQwHUInqDPTuos5OrSN
	sUvQ==
X-Gm-Message-State: APjAAAUpcV+KTaeByOcdoWjIUsjQQt5qpClo7nqjiSUumhVMdAtqaa2V
	v7XAiP1SYa0PDpcnNUCc6y9svQ==
X-Received: by 2002:adf:e40b:: with SMTP id g11mr29289053wrm.207.1554976377309;
	Thu, 11 Apr 2019 02:52:57 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	f11sm48579184wrm.30.2019.04.11.02.52.56
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Apr 2019 02:52:56 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190315032629.21234-1-richard.henderson@linaro.org>
	<20190315032629.21234-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <86c380e4-de29-2ab7-1107-74b8ab2a5b34@redhat.com>
Date: Thu, 11 Apr 2019 11:52:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190315032629.21234-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 18/23] hw/misc/bcm2835_rng:
 Use qemu_guest_getrandom_nofail
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6+WXmDO98mmH

On 3/15/19 4:26 AM, Richard Henderson wrote:
> The random number is intended for use by the guest.  As such, we should
> honor the -seed argument for reproducibility.  Use the *_nofail routine
> instead of rolling our own error handling locally.
> 
> Cc: qemu-arm@nongnu.org
> Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/misc/bcm2835_rng.c | 32 ++++++++++++++------------------
>  1 file changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/misc/bcm2835_rng.c b/hw/misc/bcm2835_rng.c
> index 4d62143b24..fe59c868f5 100644
> --- a/hw/misc/bcm2835_rng.c
> +++ b/hw/misc/bcm2835_rng.c
> @@ -9,30 +9,26 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> -#include "qapi/error.h"
> -#include "crypto/random.h"
> +#include "qemu/guest-random.h"
>  #include "hw/misc/bcm2835_rng.h"
>  
>  static uint32_t get_random_bytes(void)
>  {
>      uint32_t res;
> -    Error *err = NULL;
>  
> -    if (qcrypto_random_bytes((uint8_t *)&res, sizeof(res), &err) < 0) {
> -        /* On failure we don't want to return the guest a non-random
> -         * value in case they're really using it for cryptographic
> -         * purposes, so the best we can do is die here.
> -         * This shouldn't happen unless something's broken.
> -         * In theory we could implement this device's full FIFO
> -         * and interrupt semantics and then just stop filling the
> -         * FIFO. That's a lot of work, though, so we assume any
> -         * errors are systematic problems and trust that if we didn't
> -         * fail as the guest inited then we won't fail later on
> -         * mid-run.
> -         */
> -        error_report_err(err);
> -        exit(1);
> -    }
> +    /*
> +     * On failure we don't want to return the guest a non-random
> +     * value in case they're really using it for cryptographic
> +     * purposes, so the best we can do is die here.
> +     * This shouldn't happen unless something's broken.
> +     * In theory we could implement this device's full FIFO
> +     * and interrupt semantics and then just stop filling the
> +     * FIFO. That's a lot of work, though, so we assume any
> +     * errors are systematic problems and trust that if we didn't
> +     * fail as the guest inited then we won't fail later on
> +     * mid-run.
> +     */
> +    qemu_guest_getrandom_nofail(&res, sizeof(res));
>      return res;
>  }
>  
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
