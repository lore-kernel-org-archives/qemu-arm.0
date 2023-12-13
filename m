Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1535429ejo;
        Wed, 13 Dec 2023 02:59:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4u80G/6tzC+HjTIO9JfsfPDoC4pJYQxROg4DzrLw8IvmBY01QMtkGSsSZ/IhMBVzuktxZ
X-Received: by 2002:adf:ec51:0:b0:333:2fd2:68eb with SMTP id w17-20020adfec51000000b003332fd268ebmr3675498wrn.126.1702465145859;
        Wed, 13 Dec 2023 02:59:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702465145; cv=none;
        d=google.com; s=arc-20160816;
        b=Jvv2JufItD0NIkML9dbzGcyO6sSbQYwP7tAQylwOB09dBhp/NOM1tFYM4Ai7EN9ux2
         pMXpH+1B/6lP6eQMi3goppsmTczBcFEJ9inKtgXkp26peilJJtL0MRZ4+asK1ne6Fhz7
         Kn/6bLaX6ztFqBB2Hjv+m0SYNR+IprURHel4Ad8iYtp1D8S3Tse7RxxYpyqG9L3AwXi+
         adKJeHiYht0A9OFQjXAqm5xJTNL++LZJk4JNnwapspnpwd1cqKEZUYyum2HK/Lrx/WIv
         7fQvr4X/TSJ4gjLYex1DbZY+QnSkgMGSfpPjEq0pqJ5AivXKNNo+qzIyjh2in94f+eZF
         SmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=aEddrYkgGQER1OOkp2bRdEufjUq51d4bwJVsIHfi3MQ=;
        fh=XLW1C7I6Sn5JpHNpLRAk07iGFZcHqLv5S3LIVLs4uik=;
        b=OHj+i4Caa7/ljL4vqJ2RBJyE3nRVwah7FIoLUf2QHG280SbCToL4t8atam64ZnC9xA
         Icicpjk+YxHcQpCd6WrUGNwd+s9EOpky8UKAJENoXhkfngSySu5w7sY9SsOhh8cpjmeY
         DF+1lbr8QfAOMqA3dsXyiRgfJRJ7rsqhUJ3MA03IalbXmcfRE6I/ahJq4arf0AFFJ1ks
         gXii/nb+b/wjnlhL9rD2Uq38460vRliCHZ5IVjsuU6wBIxUJKDXCDakEP+CBJOhLoOnI
         meQTKSQO4mKFoEWhifqvPhAZb6wVg3R/JGWB+8C81CdMsI2Qkznpqn/4eyv5WXa0tdJ5
         RvfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b="klMKic/q";
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id c12-20020adfe70c000000b0033636408e41si1160049wrm.355.2023.12.13.02.59.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Dec 2023 02:59:05 -0800 (PST)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b="klMKic/q";
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=aEddrYkgGQER1OOkp2bRdEufjUq51d4bwJVsIHfi3MQ=; b=klMKic/qtuFI8u79wdlpNv1Iua
	JVkBVq/rElRK0qgYefUDA32irO1k8Yxf6LrZkv3/TZ7DBbm509ciOIrUdOLsFAMHwjAaEXj56dn93
	jqtpSjipOSRzxJl4gGrluf5XpQDNZfsSDvic5Un7tjAXtrjXnSXfYv5uI4RS81jMEt7w=;
Date: Wed, 13 Dec 2023 11:58:55 +0100
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>, 
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Warner Losh <imp@bsdimp.com>
Subject: Re: [PATCH v2 07/23] semihosting/guestfd: Remove unused
 'semihosting/uaccess.h' header
Message-ID: <xynfnvhe62bcihq3hsiesfen4btym626aop3anehdbfcugx2p7@nqgttxrtfpo2>
References: <20231212123401.37493-1-philmd@linaro.org>
 <20231212123401.37493-8-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212123401.37493-8-philmd@linaro.org>
X-TUID: +I0Lw8Qj0lKl

On 12/12/23, Philippe Mathieu-Daudé wrote:
> Nothing in guestfd.c requires "semihosting/uaccess.h" nor "qemu.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  semihosting/guestfd.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
> index 955c2efbd0..d3241434c5 100644
> --- a/semihosting/guestfd.c
> +++ b/semihosting/guestfd.c
> @@ -12,10 +12,7 @@
>  #include "gdbstub/syscalls.h"
>  #include "semihosting/semihost.h"
>  #include "semihosting/guestfd.h"
> -#ifdef CONFIG_USER_ONLY
> -#include "qemu.h"
> -#else
> -#include "semihosting/uaccess.h"
> +#ifndef CONFIG_USER_ONLY
>  #include CONFIG_DEVICES
>  #endif
>  
> -- 
> 2.41.0
> 

Reviewed-by: Anton Johansson <anjo@rev.ng>

-- 
Anton Johansson
rev.ng Labs Srl.
