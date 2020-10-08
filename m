Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1320638lfq;
        Thu, 8 Oct 2020 06:05:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG2gn5U70m4uUnSp3JpAQ/vMEJky7ZWmuZG1ckJ4Bq7aS9dIpdgH8HMIVLYnueJlussOfU
X-Received: by 2002:a25:5484:: with SMTP id i126mr1847739ybb.467.1602162309200;
        Thu, 08 Oct 2020 06:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602162309; cv=none;
        d=google.com; s=arc-20160816;
        b=EY5ImUOxtBNaR9S1afvxTkIXna59WxYLEZj9aPfnRpbYr9b5inui6DfqB0AhCRztY9
         wIWUzvrsy3ztONlWeuFAyIyMKV1LXczMeFhFgwwfri9T8WCJ06db6PB+wOAe6jxYWTwR
         0FbH2XbCEn2GNAIDE0uhBAFM8L/587Xxjnxy0Vl6WFdNIqLYbAYgECKMMg00UCVk/RBf
         vciZNfvYetWarbU7sc/vWZEybui5LBf4sfGH7HlSCiRZQBPiZdwyRD7hXNNzl0dYioHa
         URnD+Cs99IIdJqouem9/5nx8BtWeXlxC+93VTF8Pq5BoeG0vHmW7dpesAatLJWDbt0Zw
         PftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gtCY0H0tDDkagqZGl/vsnIabsWlIPf7O8k8VgvISuf8=;
        b=I9AKDX//Hq/C8JCOE3lQmaBXbLIrPF2te1ustjMVA2rebcG2Jvu8e5qx7hq3XFunOJ
         iFT6Ne1Q/ZB7155p8m5lKhsRDgzZyUK3IXunQq1usb4WCfoT49BWkxTDTQyGsoVdmaNC
         I+F80O49O81/AoXPdkg4N8OK53/Yi4hf7StzTwYKelbAYQIgQvYmgJeyEUyAqYVehwb8
         W5ZVEWJIqUr+CylUMUBrRAUR1O2iq+9s0jJykAWoTMOLNhfXCFyEnBxZKwocFZq+k1od
         CGR0efYnw6LmJxRLMqOWJq7/Me3HReCn0AGyKub+ILHjWGT9ox5EhzjxeXhXGUeoEraR
         ZmGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Tf22zBFr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f197si4635189yba.276.2020.10.08.06.05.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 06:05:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Tf22zBFr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQVbY-00037X-E8
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 09:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQVY1-0007tC-72
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 09:01:29 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:44201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQVXz-0002Zb-4L
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 09:01:28 -0400
Received: by mail-ed1-x544.google.com with SMTP id b12so5708812edz.11
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 06:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gtCY0H0tDDkagqZGl/vsnIabsWlIPf7O8k8VgvISuf8=;
 b=Tf22zBFr87pkjIFAFKhNWRxi8mcbvUV7F+I70KvjtGCsytn4XKlPHl70kpo8ybFbtd
 oTRGbH66k8djj53fFVaj1ArS2jC5l3JQFCZqy6feMfMfDS94CSyaia4yxmdHd68o2vH5
 tzs578mPc2eaydlvAoP2A5lXcP69GYi1OpMyugmT80u0ev6zm+7OHYxAfzvWZ7Wb5gwj
 kpvYfOFmMouL88E9A8S+KPrYaW1Dnqb1vkkwi3YDpuruYgWjCi9sVFmyPNNfzqTXMuQp
 93A69BAADjCRdsN0VwVMaoqd0WqDZfR7d2BWozY1AIIHnASo7Q52dTo8PuxUh/qfFLy6
 VfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gtCY0H0tDDkagqZGl/vsnIabsWlIPf7O8k8VgvISuf8=;
 b=jnAF7jjtC37NhAGgRw8QWeGK9rlHF7SOYo1s+9gHo/cJ9faVCKyA7uUNLVzb5SmPGR
 +FbW6rx5JPKdcrcdPix268XJR83h3/t2oaFCfBg1LbxhbVmsmAn2bFycnOUHv6EosKFU
 r8B2NoWPDN0ANgwq8e35jo/Yt1FWraEDxLdzEmKTI99plstDeT5syOYLNflfWM0/n5Rg
 bfeTVBwWa5id6PGQsVWcH2zcA6VZUC+vrE66tl7dcjp3o5R0wWiGaKKZ8VDxX75DXnxC
 WdfJri1vGb1/IWAteB/dGEWsIuUj2E62f+KIgbUcSHdwSNHW+3X5OPK0GTgJXgzDmhkk
 ZNTA==
X-Gm-Message-State: AOAM530c8Urfk+aoH4SfaEaict0TK9maAWNSR4mvAeT7P+LY8yYH7Z7W
 xZympZojTQncSmapYdWZzvr5sjam0hC1OZi/7kIy2w==
X-Received: by 2002:a50:e68a:: with SMTP id z10mr9145545edm.100.1602162082163; 
 Thu, 08 Oct 2020 06:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201001061718.101915-1-drjones@redhat.com>
In-Reply-To: <20201001061718.101915-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 14:01:11 +0100
Message-ID: <CAFEAcA-KntvrdrxL33CdxAt2gPyxF=EuQ_iGsLK4NvSNyNrZvg@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] hw/arm/virt: Introduce kvm-steal-time
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JGJL6ffu1oNF

On Thu, 1 Oct 2020 at 07:17, Andrew Jones <drjones@redhat.com> wrote:
>
> v4:
>   - Rebased to latest master
>   - Added an official linux header synch patch, replacing the
>     hack patch used in v3
>   - Added a patch to restore the arm-cpu-features test for AArch64
>     that got lost in the meson shuffle
>   - Added Eric's R-b's
>
> v3:
>   - Rebased: 5.2 machine type and kvm32 drop now included
>   - Switched to using new KVM cap that has been merged upstream
>   - Picked up some r-b's and some of Eric's comments from v2
>
> v2: https://www.mail-archive.com/qemu-devel@nongnu.org/msg727588.html



Applied to target-arm.next, thanks.

-- PMM
