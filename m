Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3714073wrh;
        Tue, 7 May 2019 07:45:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwwHpSeluIMkp6Fdrq/enNIgXKpvMpexnK35iPXJuuexbBSPPutqkPFqHe+5Lh/cZd5SFZC
X-Received: by 2002:a5d:53c8:: with SMTP id a8mr438676wrw.152.1557240325770;
        Tue, 07 May 2019 07:45:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557240325; cv=none;
        d=google.com; s=arc-20160816;
        b=jGt77UiuDHhqC0c0xGntLO2r+Ml0DkZy6trSU05rXQSJYX9NqWzsSMGggzCnVv4OnE
         nfVpceT7c0fZEPU5o1pUnPjTEanc3S0IHw8nJh3AKgWaL+9xuCl+JPom+yBtDs7Ely3s
         xEJi4Hr/ZQwasRJJCeK4+9eig+t6X5knNxin6M0GsMrSqBNiNduR8aUSkGMbKVb5ccQW
         bf1P4SsO4uCXd5Xh+CmeXRRe6uQuexVyI8b0G3hiB9SIZzjGrZvwKEiXQ/EDsCVrnSfR
         N57u8xudRVfC/rtlFmY7TPVg3YZ/a9E9KU6SWZOXKPILu6noCpTIJRSifHNiezbdNyP9
         odtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=aPx4BEzw0Wo4BvUPECMicSeSSByw6ht50DFBLd74wxw=;
        b=OMvRtValCEwOUUiCFZl5MIa0KgmtGG1LMyxTehVb/qoT44AawgcGuOSw6gmLyhu2sn
         50qeN+102BlVFEgDEJVSRfVOCfXGJzwrXbzyOhRN4S0rnGtDa0IkmT1Io7/znKYteYBf
         rFMZv2eB1a4TBJh1IDPSTOp0LEKayqtbfPYn+mIxToJ0HCEHjAMR/y9CDxlt6SfGvutN
         Fpk00H1gipm7DvZJfCRbtiy35rztJKDfn9TOELQmJVxpK255olN4SL8C+kWa55Sza30o
         8JyE6+DrxlEGBDkeDuLhR3pKDK/SN8yZYxBfyx6g4BmGsIZ24YN9mw8Ffes2Je0qVYfr
         jTeg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si9713284wrq.13.2019.05.07.07.45.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 07:45:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO1LQ-000848-QT
	for alex.bennee@linaro.org; Tue, 07 May 2019 10:45:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hO1LF-00080R-26
	for qemu-arm@nongnu.org; Tue, 07 May 2019 10:45:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hO1LA-0000jc-Bf
	for qemu-arm@nongnu.org; Tue, 07 May 2019 10:45:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60588)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1hO1LA-0000j6-5Y; Tue, 07 May 2019 10:45:08 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7AEAA3091786;
	Tue,  7 May 2019 14:45:07 +0000 (UTC)
Received: from [10.40.204.24] (ovpn-204-24.brq.redhat.com [10.40.204.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7456610027CC;
	Tue,  7 May 2019 14:45:06 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190506173353.32206-1-richard.henderson@linaro.org>
	<20190506173353.32206-19-richard.henderson@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <966c2985-1266-05dc-890b-09554a2cc758@redhat.com>
Date: Tue, 7 May 2019 16:45:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190506173353.32206-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 07 May 2019 14:45:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 18/24] hw/misc/nrf51_rng: Use
 qemu_guest_getrandom_nofail
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8pfXOlOBp3hq

On 06/05/2019 19:33, Richard Henderson wrote:
> The random number is intended for use by the guest.  As such, we should
> honor the -seed argument for reproducibility.  Use the *_nofail routine
> instead of error_abort directly.
> 
> Cc: qemu-arm@nongnu.org
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/misc/nrf51_rng.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


