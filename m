Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp4978541lfq;
        Mon, 21 Dec 2020 12:54:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvlmyZJFSJo+cC05/D9X0Q+RUblDqgXDtnXyZ9sTKk8MhaFlC4tP9wQBw63Nrl4JvbOfwY
X-Received: by 2002:a25:aa84:: with SMTP id t4mr25711459ybi.483.1608584064036;
        Mon, 21 Dec 2020 12:54:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608584064; cv=none;
        d=google.com; s=arc-20160816;
        b=VS5EiFBFXCz9pIkz2Nbh+Br4lPOdb8+HPv5Vx3ZPmaoSatcoeUgVIuCsjn5EdTm1CI
         tpE0fmHIR6CvF9cCEjz89BjxXubjsugZu8GcN9WgNmAKWFhVHrosHLQQYdxPKq8grZAl
         ET6tFkhzP7qBm+m6uQWxP8DZzk2ys3ZYFBFsO4KodydR6rbNBcGTmqihcI8u9GZ52Q5d
         JzWIkVYYQodkM0giayOoy7L+15HxcYboxuM9zOS+j57GP4Z+xevyy6+hiBgeA+wmDOyR
         exAf93Jv1wJd7F9hOODhlKpqdr30yn+WVozcrf067NFVsUOcyuSWfVzmLDKLWzL6iF9o
         jEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9+d1D6p6q9nnQAVg/smpfSaauZMJ89vyaM+obT51kOg=;
        b=vEDE9czFXsBClmiYOv20MM+DZ5etU8QhDjl41wGjjiO4iGT5lRIlMdHgE18d86quO9
         OTS21OBTW3LkwUhm5ERoe9VGgD/S4SEwCcDowAPF+LD/qzjt6QvZOytlO3Mq+OmuIinR
         THhtnuFKGvRFNV8FXcqsNnmZT4sqrkJ5fFLCBsKfR/lEaU9OdVty5s3wXLgChPcjjBrj
         9C6of2Ey1GEYlSfucIXwK6eKZ46XMo5KjfR9gjx06vLdY2PqClCwoV/EVP6Hzc1G/MUu
         i407X1W9HNt8dywU/2NS0pje7ui/LKddW+TWV4d1rRT5Q9Fl97hg4hwc0HBZxEQP/9r6
         vZyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qeD7VgYu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si13430122ybp.195.2020.12.21.12.54.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Dec 2020 12:54:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qeD7VgYu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1krSCF-0005LF-Dk
	for alex.bennee@linaro.org; Mon, 21 Dec 2020 15:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krSC6-0005Jl-EC
 for qemu-arm@nongnu.org; Mon, 21 Dec 2020 15:54:14 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krSC4-0001Ml-QD
 for qemu-arm@nongnu.org; Mon, 21 Dec 2020 15:54:14 -0500
Received: by mail-pj1-x1034.google.com with SMTP id b5so115473pjl.0
 for <qemu-arm@nongnu.org>; Mon, 21 Dec 2020 12:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9+d1D6p6q9nnQAVg/smpfSaauZMJ89vyaM+obT51kOg=;
 b=qeD7VgYuDG3nkOgv5uDP+T+0RQdQayvDvUdDlrGGJ8sPZlKn3NTgaRjtv1POI+qE16
 EcwM/PCfL0qBiE/WlsTfhxQRNcDQQ4dRN/BpMb4xT3vdfDoS11eRNfgKn9aYtxRu+JwL
 Z/z0ZGf8YJQO4T0yk12jmN8o5vSHClXmL3fzmzcS60Be0qLeHgHZC/wgPZT3EbQYAQvR
 ZCYW651tnlrDaSLx3rIooo/qUBHrMi4ChIO2Dm6pY4346lKeaOKcgmya9/ovyowGz2Jy
 zZZINOd02NaVRM3VMQMjhhUTUxMlpXN7d5tNe9H+mURj8m6e//Zil+esga/g15nhjQb+
 LVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9+d1D6p6q9nnQAVg/smpfSaauZMJ89vyaM+obT51kOg=;
 b=ran3IvPQ2dFNwU25i7SbIB3bX+ViWPDYJemaipzt33ni9oi84v7bu0/alta34tLR6d
 E0+gol4attNaijKXmgLAvvbejLKhdpqRVFENLPZmFR7PmswaKvpSXQyej0sohl63F+6z
 tIPX4EBUBbAh6Q+tr9xKGrFstPITl8fjAhrrJixn5vqgL9bwAR4BI2FFmBdujH79o9Hp
 HrewRZnK8EtkGN/kKqemUbnE8MI3vSysrOFzq9fCH21qjmJ8FIhDAO986ytnB5T9q4HI
 W8I0/rG8NcbVUlY1v3XbMN81RzEAcEzGBXKyPhz3CvRsOff5JwrtBN4GZqlHvT0IVJY1
 ka+A==
X-Gm-Message-State: AOAM533GD67We9VE+cXHNh+dVYbYk24KV09wZ5LmUY8n8JpeeBoiS3ai
 CQDstydrabTsYPTesKOwxRSPow==
X-Received: by 2002:a17:90b:350a:: with SMTP id
 ls10mr19090844pjb.192.1608584051294; 
 Mon, 21 Dec 2020 12:54:11 -0800 (PST)
Received: from [192.168.1.11] (174-21-139-177.tukw.qwest.net. [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id w9sm16988655pfj.128.2020.12.21.12.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 12:54:10 -0800 (PST)
Subject: Re: [PATCH 03/18] target/arm: use arm_is_el2_enabled() where
 applicable
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-3-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6f114b65-e6e8-e9a2-41f0-c3fda14680d0@linaro.org>
Date: Mon, 21 Dec 2020 12:54:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-3-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.233,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V8PSYybMkt5Z

On 12/18/20 2:37 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Do not assume that EL2 is available in non-secure context.

Just noticed this wording is off.  Should be
"Do not assume that EL2 is unavailable in a secure context"


> That equivalence is broken by ARMv8.4-SEL2.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h        |  4 ++--
>  target/arm/helper-a64.c |  8 +-------
>  target/arm/helper.c     | 33 +++++++++++++--------------------
>  3 files changed, 16 insertions(+), 29 deletions(-)

