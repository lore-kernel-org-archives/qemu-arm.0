Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1926641ejb;
        Tue, 24 Oct 2023 02:37:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFStyjSbhSxWZAbKhdqHuru0PpSE7lmsfFRuoB1FDCvR5RyTT1LU9y12ciDEDSz2ptl7YNQ
X-Received: by 2002:a05:620a:1a9f:b0:775:cf5f:8a77 with SMTP id bl31-20020a05620a1a9f00b00775cf5f8a77mr14062968qkb.34.1698140255631;
        Tue, 24 Oct 2023 02:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698140255; cv=none;
        d=google.com; s=arc-20160816;
        b=KduANUuAJrqFhfYPfIP29LBv0Mbpw/zxna3FsT5OGPDerzLMqdW0QSNdFzxZtKCQSY
         Eo++FzdPDn3E+AIihI/zOvOCSE02NAtxjTG2MluJEs2kFa9tjbsZQeMVgrgSdG+1fZG2
         xjngni1yNz8OQHzIXwWtm9PLh1zDY7qS3g8LOKZHAbFP0ofUIbH5djEJdBBG84X5Psho
         TXVpygjedNXeQOVkRqM9KwRlANM37olYKsNGD9tF+hVLQ/vAYbCL/QRZq6iBFFLgVEjg
         plKcvlaqVeELhf/eN8uJB/8ccSgXvFH/AF7xtclSvRBgDAdYryqMFrT0xEBIFmR62z6v
         rc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=KHIgQspkOek2SAsOccdbUd9/p371slSfrctX3flIw4E=;
        fh=IBEMdZSCUz2uu5kRekkZv6sX69at44dLvDZEK0mMKb8=;
        b=HWJimYpF+EOeOjv/sg5ppCB4FTpSElUtcZyA2JQ5ZUVlAz9VyBSd89IQIf1rpoEdOj
         QeqizoZsdJ2vr1LG9pOoy8H+X4/tPUndUCi6B01WdSuOmoklM21hE97imdLxWE+ZtSmy
         24O6gvMBQLLRafHNBveJu+P6PQnRSQlNIS7surUYR42OdA6cdQhRJQgaQszIBMGwe0pA
         CjmAEw6z5kNmofLGqA2m2QiEYZsmOg3RlMndbAy8EvWi8/1zX2+96GyUmeH1moDUYOCG
         n3FbFKmjZidGgsCMB2uTrinpC74Zzzw8wr7MSjYEPrBjhVDFjdJXcY6NnQEP35XPfLEP
         Sufg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d30-20020a05620a205e00b0076eefa391ebsi6501140qka.208.2023.10.24.02.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 02:37:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvDqe-0001tp-Kw; Tue, 24 Oct 2023 05:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=1ohf=GG=kaod.org=clg@ozlabs.org>)
 id 1qvDqd-0001r7-4c; Tue, 24 Oct 2023 05:37:15 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=1ohf=GG=kaod.org=clg@ozlabs.org>)
 id 1qvDqb-00082R-4N; Tue, 24 Oct 2023 05:37:14 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SF6Qp74F5z4xF4;
 Tue, 24 Oct 2023 20:37:06 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SF6Ql3NZkz4x7V;
 Tue, 24 Oct 2023 20:37:03 +1100 (AEDT)
Message-ID: <aaa71ccc-e7d4-46f4-b902-22a422ff895a@kaod.org>
Date: Tue, 24 Oct 2023 11:36:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: aspeed: Update Andrew's email address
Content-Language: en-US
To: Andrew Jeffery <andrew@codeconstruct.com.au>, andrew@aj.id.au
Cc: joel@jms.id.au, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20230925062212.66112-1-andrew@codeconstruct.com.au>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230925062212.66112-1-andrew@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=1ohf=GG=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AeRoDHlGT+Kg

On 9/25/23 08:22, Andrew Jeffery wrote:
> I've changed employers, have company email that deals with patch-based
> workflows without too much of a headache, and am trying to steer some
> content out of my personal mail.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
> 
> Hi Cédric, do you mind including this in your Aspeed queue?


I am not sure to send an Aspeed PR. May be this change could go
through qemu-trivial ?

Thanks,

C.


> 
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 355b1960ce46..b142c09628b9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1108,7 +1108,7 @@ F: docs/system/arm/emcraft-sf2.rst
>   ASPEED BMCs
>   M: Cédric Le Goater <clg@kaod.org>
>   M: Peter Maydell <peter.maydell@linaro.org>
> -R: Andrew Jeffery <andrew@aj.id.au>
> +R: Andrew Jeffery <andrew@codeconstruct.com.au>
>   R: Joel Stanley <joel@jms.id.au>
>   L: qemu-arm@nongnu.org
>   S: Maintained

