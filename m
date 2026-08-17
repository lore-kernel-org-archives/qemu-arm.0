Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCA7C5B572
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 15:08:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvyvt-00049X-CT; Mon, 17 Aug 2026 11:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvyvs-00049E-I5
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:07:24 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvyvr-0007Os-20
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:07:24 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-836ce5d6e85so50404077b3.1
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 08:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786979242; cv=none;
 d=google.com; s=arc-20260327;
 b=AFH2lSXIwVQHXmVKZHsYTozYKzuiqsnf6Ae0RDKpGFir0l8P9ISStYLXVVb89x4YgB
 n7gjzL11hWC9yvy1Tpezzw1qozVLP0DGZxC4mg/veloiGwd8dChchHzH3/m7jHec1Sh7
 oWrgWYBzdN3kK/NvU7bryEO5W6TJ3ipRMPMx452HV//BJ/vv9kkNiqSVcTu+nnC9g1k2
 75XJZjPNeS7rLthE5mzWP/YN4N1a1Bow+b36+Sc3tFj0x/ialz/+nzfnOFD1RkLVHEHU
 wPRT2xT2+opbWT0td23Uma0Ywu7Tfy22BGCHqcLRLRnFbyySpw1POD8f2Rhglm/9FcFt
 WT/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=eKmBegf8fZE2l/hyagB4w+ITWbNMFMbHGZPlbexBH4Q=;
 fh=tfAt9iCDR+cectGen3gJ52JlXA+gjmpTQmu0POo8qXM=;
 b=mDvkzxvx091iNRZNFDT4s4ULaruWB+gRMEiExJFPGOWvylQ/e6VU/T4ZedKUnQdZnb
 qUQwinBMgO4GEYl+h2HSKGrtH2/DPKenpp5VXGapxx24LQpQ8mPNL4piLcSPTAIDMs5K
 0t7Gjf9JQ5FqDjcjSU4/A4xESfsOEPrvrNaVtPfiKk+SQIaxn3DywhGQovyW8azGUJru
 IJBEEyTeywsg+9eBS26WUVqsvWu1lO3idvZXcv9o3Z73ELi5z7QgMySb6ABrxqsE502J
 qavFY+eCQXt3YReyWNkqdjK7EOORNg2X093Htg7kY2di3vt21mTtDIr3GHhm5ZFAJT38
 Ztog==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786979242; x=1787584042; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=eKmBegf8fZE2l/hyagB4w+ITWbNMFMbHGZPlbexBH4Q=;
 b=HCX6S1HZxb16qeDghsRR+hm9765uNDLY2rAL4epw72IcWfPkxtJOs4NoA+pex3Lnfs
 skkgd9xqwcfYb33QlCpEBV8L19HXmbcmiqUORM//UMy+PQAS8KrxKaZjqtXpC5sbZJkm
 c9r3gbNVfZzVN2KNaBjCMEPyOPGPh3w4wWSbrGaHSEsaUnYRRco9zFPwfhZm7Avg29rd
 MPEUOZKg6DYpKwFI3fo+NeAVWsbWDOHlINau03VS+vZ5bh9ugEsmW1g3IYR4/Ubx7ohn
 HjpBPf3Tce7/7s0NAH1GfeI8Tqpd1PDGXZnT4JIBLGwlxOYhARh0lTMDF/FLb93S1rFn
 wAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786979242; x=1787584042;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=eKmBegf8fZE2l/hyagB4w+ITWbNMFMbHGZPlbexBH4Q=;
 b=lPBw3+zASqTsZT0qKWduIOKURR5bD80ezgLXGR9iI6JPcP4iPh/oS29JQ7Ifdt/HYp
 7gu9LskB6i5v2W1eVy5PN0hE+WfP+J4hApAoHulf6qGN0WylAPBmUff/ihoKfyv30swc
 5XoSq3ptkKmoS5LLBDfteYjRoVAYxEwLTFfrvAAg5mw1+0Reucf0Pwc/QMKbaQ9nUOU7
 pSAvucvthrfIewjK1X2MQ49yE8UMmJ0jpwOqiJvhYOctzaWW5jU9XHuMg98I4ZB4Tvjw
 rXvBEyrO0Bc7BfQoG/fKOQON9DU+aMKzyulNlqCECbz11Wy8CeChyps5DfyDJJ0CEwfG
 Ohgw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpYe8hM/D4nXw2yO0btcXoCnG5HD2qpyAe8VCaJ6n8hwPJrkAGoAe2WLVzn0g270MoO87Dek57QPg==@nongnu.org
X-Gm-Message-State: AOJu0Yz0a7http9Ek2+73r3mj8cIVwYTi4/SdPkzCjRNx+7r5BDp/E4P
 /E3xA2hevV/C9SWUwgR0sKXiqhA+Ock/dLHZ8YdUeTRB3BQRd9OqU8lCW8ekVX72nRFZMkHnd//
 UpcKHtrSj1SVfsvl4+5wGDl/qYb7VpPpolgPNIaDSyA==
X-Gm-Gg: AR+sD12+x0dfFRCmRwgUXDstDGgwo/XJwLiDD0VOrtwLrBQ+MwPvitYfe5v8Ir8qFBS
 1TelItVszZNMZAXJg1IiF1yOocJooksGT66wnRtqW1My7f7OT5ipuw6hHoDmDWsVzVekZrRnee3
 XCW74fAL8Eam7IZolCZuoz+DRc4j97bm1BE313RAGqVIUVhqzHpWt5iIY2jtfZPfuocvgosqgPY
 30lpKs1GO3I56ef8zAnM2hMGI9B54t0WcC+mggK0o6gBq5wNDyd6bVJYnKZ1Uh39N+J6agMEGDG
 MN+3H9BTrrC4TqSIwa7OUkeQ/NGezKy/V1RaqQLIgRE+WgxaPAyCtmhOrNJ4m5Cm0jzAk3si/ql
 vXbk5wU6MkyAsnEthJ0ScHkxr3YTH
X-Received: by 2002:a05:690c:c3a6:b0:833:968e:c223 with SMTP id
 00721157ae682-83710a93e86mr66950627b3.21.1786979241822; Mon, 17 Aug 2026
 08:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260812200308.289238-1-richard.henderson@linaro.org>
In-Reply-To: <20260812200308.289238-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 16:07:10 +0100
X-Gm-Features: AcwNN1Ul1ks14Qa_lI_pvTFwLCdvqe98gz4PU7VRwSOlajCMVOwYjhHhBJ-emCU
Message-ID: <CAFEAcA9wqo3tqC=GU2vmGJZowRfrLQZL=US+1vnf6pJsZ18DDg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: Fix arm kvm gicv3 selection
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 12 Aug 2026 at 21:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While 39a8c3941e may have fixed WHPX, it certainly didn't help KVM:
>
>   $ QTEST_QEMU_BINARY=./qemu-system-aarch64 ./tests/qtest/arm-cpu-features
>   ...
>   qemu-system-aarch64: unknown type 'kvm-arm-gicv3'
>
> That patch did remove a test for TARGET_AARCH64, which is fine because
> it has been a long time since we supported KVM for AArch32.
>
> Fixes: 39a8c3941e ("hw/intc/arm_gicv3: Fix ARM_GICV3 dependency for KVM / WHPX")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM

