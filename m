Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1149794wrt;
        Tue, 27 Nov 2018 03:38:29 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XgLBn55bn58F+DGbEcGR/x5bnDb/IOllMQX6FZS6nU9ABfZaIM2oWy8B7m75fbUfejXvw6
X-Received: by 2002:a25:4509:: with SMTP id s9-v6mr32371861yba.51.1543318709367;
        Tue, 27 Nov 2018 03:38:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543318709; cv=none;
        d=google.com; s=arc-20160816;
        b=d8o58Q6Uri5p31iQpypwF1X9gGq+N2agdMKfkwbyWAcJGVgqZxvKFl3+abfAN88MVt
         rYbyT8mLyXyxmqFAiqkeWbW2HNCyu738E+bAnF0gUAuIZZOx+ssdj0GhJB1g6pFAZjOB
         3w229LexDAioOM1xL7pGE6Hd4afs3ORfiaEEp1AzvNKkDS0fGCYsQJ8u4ZEOw2SSzFuq
         S+2/EqTPzCY9aJYHoZ86ojV++OIqVj17MJrp+0LTCENDOprm2L5X/bluEi6eJKh0HqUd
         WXsts+ehzHs1WjunJEB8dGJdDD1C1udT1Gy0WxHV3ru3ZphFt9JMXmeXzTNBFeQ5injN
         sWeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=Wv+MULaM66O+Gsqmx0Rz6K3p1VUgwLaOEv+Prx2+7jc=;
        b=iYiKW52eRfhIP01LAYm7NfJb58i6TCVsXEVuEkUkbRSHeh8uV4mhLlKCNqV0sWxy1E
         DDbOxVnxyV3QJ6QOPLDaNnLgGiSYoHHc/gl+jSrGgqcvRtI3HPT4HGxG04/Gk2TdIyky
         Lj77x+VDwqowd6dVIJqCEwmoY3p5I/MMcrDQhUyhWoT/p9FSkGLwHIZ6kX2YPSz0umWz
         91mnk2b/V/RXYDIy8KJG+kMJFxGyxlvKoxc4g8hkGgpxr/jzUxziLj9yhZOn6FyHd4p1
         AZuN09sC1kp4AJE5Drqw4lBZj2g58CX3QjnnJUuzeBN82JtoYHrTWRTDHurdLR3loDKO
         RONg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 127-v6si2551572ybh.412.2018.11.27.03.38.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 03:38:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41568 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRbhE-0003oW-Fo
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 06:38:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRbgy-0003iv-V8
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 06:38:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRbgw-0005lU-RI
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 06:38:12 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:39425)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gRbgq-0005i5-0l; Tue, 27 Nov 2018 06:38:05 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MeCxd-1friho1PHD-00bJGo; Tue, 27 Nov 2018 12:37:55 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>, "Edgar E . Iglesias"
	<edgar.iglesias@gmail.com>, Alistair Francis <alistair@alistair23.me>, 
	Peter Maydell <peter.maydell@linaro.org>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-7-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <bbd65041-d216-f063-8d94-a11db5d730c9@vivier.eu>
Date: Tue, 27 Nov 2018 12:37:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181125205000.10324-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZxlbSKwcto2jkl1DWDBPmCkC3ggBH76I6ILflPtr3103swNC7bP
	zr5dGETbBT5+RjPfT/JQNWgR3ztZjUNoLePNm7Uaz8Z5JnMQDK0JEZL7PbN/bDOR29oTp9C
	H3hcw/Hb7G3WdJOgC0zGGD4uQbVgLg7qQ3UQS/ZkM+emmhKoGDkoTZQlfvNJGzkltMQ9T5s
	Bzka8X8WdYEnP3BxpStpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sKusO2esoxE=:bulM+LHT6llylvrVYPelU1
	HVV+1D85FxJWwvAMYli4WLcqhEiVMumVVkfhdD/N1e6bFQXy5A524lYcQUmBQRfteKVN6fUrO
	fqC1xMXYIc4fSB4dPZ5TYPvg+El7Pg4eS7YIL7Gn2LDK/fKbEqiJieP85vQsDatgDdJgUrZlY
	QU4dKs6jJp0fH+7EZhy8OsFG20blZ256noJ9eKmczRA3S5HD2GsfZ0Zc2QzzyfQ51aZI1405n
	r2QbeOcJTI3trUBYnXjfJ/s1iv2LVJTLrKrv28bF2KfsDKo90eWTDs1G4GHxJFB/X9k3KNEu4
	EGTee+cNjZEXOte/Bbz4V/zRNorsUvj9Iy4VnajR21MvLqPdM/Wg5gWB58JPVySlIxWo6lVZR
	bkERt3iSukywbGrz64ucUcAzvcpNtxrEXLiflTv0Q0LF1VCVy9RwmHpGFaEqduSvkkZfoInn9
	GC05+hUWVe//rgocY5zzsS72FvaGqMN1YG4WjORsPrade46hQtnTKxFnFWJR5fcCvBTK+ccD4
	Ov0PLIWo8wjNB+K7vL21kQQ3zUIdU85ke0cgJVPE4QZa2Emue2TEjkKM8LpyfE5HGBDfrZpWD
	6L1oLs1r/KN6Sd87owUFY5NpGR7g34tH2dwb4oRU1YEq1eUXNU4Vn5Qlxrehbo+Pg3XR1LAcc
	VKQlNBMGqEg/OeU8n1j/9UJDgDSUdFNXxgH4U87JoVxV1K+hc/+eJFQrIWcM9cVOPSkRTTxDZ
	frOf20Q5H/Ak6f3y5VkUTXkhzqrkXlJy+QCqUHRlYhb0ExQB5aG4okmm5C1W4CpMA3u45MGqH
	7gdXPqxMhAe9gAko9jaO+GkokAgkw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-arm] [Qemu-trivial] [PATCH for-3.1 06/25] MAINTAINERS:
 Add a missing entry for the Xilinx S3A-DSP 1800 machine
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t9aHlu+90cSb

On 25/11/2018 21:49, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4e396cbe71..aa17e9bbd3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -822,6 +822,7 @@ petalogix_s3adsp1800
>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>  S: Maintained
>  F: hw/microblaze/petalogix_s3adsp1800_mmu.c
> +include/hw/char/xilinx_uartlite.h
>  
>  petalogix_ml605
>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> 

I've added the missing 'F:' field.

Applied to my trivial-patches branch.

Thanks,
Laurent
