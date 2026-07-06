Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B824C43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 09:28:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgfcR-0001VU-LN; Mon, 06 Jul 2026 05:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgfcQ-0001VD-Sf
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 05:28:02 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgfcP-0007PL-9A
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 05:28:02 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-80a123ef90aso41761517b3.0
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 02:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783330080; cv=none;
 d=google.com; s=arc-20260327;
 b=M8GP7fO7Z3ALECIKGC9dzc+77u8rUpCssPhh41ZegzMP8o9pSIRDwZD3dBpHVcsYYi
 MN+78s9kZDaARl46Fae+zw14CggBs2+ctDn9sSH/5j+Lb2Hufav1u17EacqdADRVFYTz
 qr6jNiH+3Zhu8uMNGJmRNHJympU/V+XhIHch5E9fkIE+COdf1R2DyC1dtr9kVT9aA8u9
 klxqekbn9v27UJZEJ63VKeyQi16JMJDJf3qzdUYlqnSzwPnhZb4HZJBowgKrciNr+iwP
 fTyb80PQl6FwqJ6ZZg/ZyhZz1mo+RL1MKkQEiq3Z3mqDXnrH2YE9XsPRMwrJB0tg4HKJ
 3D6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=bh7GO0M+dUyn53qu8M6jvvi+CwUOmFEEXyMs+kH1nh4=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=EIH8HDCBbH9SdJog/A766nbdNTBQJqc/6JWM2nv6e4oF8k1BwYEfrgCNrm4q4ph3wd
 e+sGHtU/RKZW8xwZDV0Pvwl1TmoS2P3A7F6Mcr/nxg2NTU2hTxM/AiPqP1bfc1aZNanN
 zRxVhQ+hsATUU/C7Wqqf9rATWG4EOofjN/vum+v89/phtdFq4+gAmGKmR5kNUnWHZRQt
 Y9o+G+372xLcsD3n2HTZ3LR6rB4QYQtuCdVZ8FRCv3/xyj+3x4zC3ATYJfvRprxIt/Te
 UH6Kf9Bp/kBobZz5DcRMXW/BhbgRmjnKOa+U4auMWmd7oxsDNY280dkkRDGGrqUg+x7U
 ZgjA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783330080; x=1783934880; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bh7GO0M+dUyn53qu8M6jvvi+CwUOmFEEXyMs+kH1nh4=;
 b=xTQkbI1WYJx73srelCDf8vHmGyzfRf4+B6X0idMMzvaOnOJpkJBK0oZtEmDjyrDZpA
 lgfuQMbhWUCENhvAcN/JbsYKay/Zano0jM8ejPZbBYqJT6YiNNs53O2tJtgKBGQSKBYd
 AVRvwI7ZbsjfMsfXamB7xfhk1QRa7nEQzi0JhA4AXTlC6JAwtaWy5H1zSDqwCafPLXsL
 X+AM6stS4V5zwigSqDu1Tqnu8K5A3zAo8nkpx60+YlYLIU7W7yCTXntmQTUnHFdsiWQ/
 StjWxFmsZhsxFvp15+ReBrqJeRg+0vkyQj2dygwlxkiKlkKtFuDm5uRICLjfEKWcJpE+
 HAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783330080; x=1783934880;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bh7GO0M+dUyn53qu8M6jvvi+CwUOmFEEXyMs+kH1nh4=;
 b=sRk2MMl5CmEWlmQQhcmXay09U5GXLw8E/UPlj0SXaB5vbxA491DtHaMZunhtn1N1hU
 iHMAF38qtM+xZxA481aIxnK1lwMJS8H1Uz1kMCxT6Zawb0FucJM3USeSxikTtBuWlJOU
 ElW7ne8Pak3RuXvxDMFfVk0Uz+AMq92fnbkzX6OnPlF1xIHmY6kaRXYLkQttuVpAvHjP
 bug4PXI45fXfWTxpttqRH15J1W17XUwUq9KfJu646ch9if/+K8hMi1sCJzz3W/OxGsi/
 Kx1TamLZ6I0UEIzrtV+B7+Y7dgU4bySu7jcdrDGzJhYN59g+wp8kwBPGZYS39kBlBPci
 NZcg==
X-Gm-Message-State: AOJu0YxS16bcOh+9qHYQHOEVAGkSIqehx+QhiUhRZRA9xBDtgu7fm1Oz
 t9c4AqOjnIgfUTAgQAeHLBsKRaFkI8WbZC4oxp8m5Vb03LZQHHcI+5ucVRwfDCGwIaKn0TBGWyf
 o+C4UkWCB/eYtRGal1sCSHXSqO5HY1MghShB1kYEor/ipxd3y6jAm
X-Gm-Gg: AfdE7cmvTsFDNSlacyOaJz93m42QxaOsGGE1k/7GXvQk04BafEuIpR7LgLv0PypvVgl
 ywid+eTlukNA8J9vp55TSaQs63SjSbou+MDRyNYVnp4CWgocI/FLod5CLXN8iJQQOVOQMpC9Fir
 kn6966ApMwpvw50fkLp7ko5EzhgT1G/H7h28Bg9AEe9uHfXKXOzTA4o9HA6LNS/amLvQ7Xpjy48
 zoFmQzwTle9u1mpO6meR2tVhe26yU56t7UEqjReMskXqQYz6FmxFMXzCWCOlQH9+C38ls+hDSQZ
 kz4WOEHGZirazC3sqt6/DhRcwebTN6L3Itm/7eybtaT41tdIdCVAOAwN
X-Received: by 2002:a05:690c:9b04:b0:7e9:ea36:f256 with SMTP id
 00721157ae682-815bbf9a729mr136861567b3.17.1783330079837; Mon, 06 Jul 2026
 02:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260702184019.3431139-1-peter.maydell@linaro.org>
In-Reply-To: <20260702184019.3431139-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2026 10:27:47 +0100
X-Gm-Features: AVVi8CfhMYfADXeJQl5yBNylrzjffkP2MsnyWfKd6aqVUCS5WOQ1TE_aXbHW39s
Message-ID: <CAFEAcA9m-yPx0HZTLjQFR1vZYmAZyXgrkBfbAuJKA9oh1vetNw@mail.gmail.com>
Subject: Re: [PATCH 00/11] target/arm: Fix some Neon trapping corner cases
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 2 Jul 2026 at 19:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> There are a couple of corner cases in trapping of A32 Neon insns that
> have been kicking around as issues in the bug tracker for ages; I
> got round to fixing them today. They're related in that they both
> need us to distinguish Neon from VFP insns at the point of checking
> for traps.
>
> The first one is a bug, where we aren't reporting the correct syndrome
> information for A32 VFP and Neon insns that are trapped to AArch32
> EL2. These have COPROC and TA fields in the syndrome which we weren't
> filling in correctly. (When the trap goes to AArch64 EL2, the fields
> are RES0, which we do get right.) It's pretty obscure, though, and I
> know of no guest software which might actually care about distinguishing
> Neon from VFP insns in the hyp trap handler, so I don't think it worth
> backporting to stable.
>
> The second one is a missing optional feature: there is a CPACR.ASEDIS
> bit that lets software force Neon insns to UNDEF, and also a hyp trap
> bit HCPTR.TACE that lets the hypervisor force Neon insns to trap to
> it. These are architecturally optional but in practice implemented on
> all CPUs except for the Cortex-A8.
>
> The third one is another missing optional feature: CPACR.D32DIS lets
> software force VFP (not Neon) insns that use D16..D31 to trap. This
> is rather obscure as it goes away in v8A, and of the CPUs we implement
> it's only present in the Cortex-A7 and Cortex-A9.
>
> -- PMM
>
> Peter Maydell (11):
>   target/arm: Separate out Neon from VFP access checks
>   target/arm: Separate syndrome functions for A32 and A64
>   target/arm: Report correct syndrome to AArch32 EL2 for trapped
>     Neon/VFP insns
>   target/arm: Define fields for NSACR

I'm going to take these four patches into target-arm.next, since
the "wrong syndrome" is a bug, and the fourth patch is an
uncontroversial little cleanup.

>   target/arm: Handle NSACR.NSASEDIS in CPACR accesses
>   target/arm: Handle NSACR.NSASEDIS in HCPTR accesses
>   target/arm: Update confusing comment in cpacr_write()
>   target/arm: Add new feature ARM_FEATURE_NO_NEON_TRAPS
>   target/arm: Implement CPACR.ASEDIS and HCPTR.TASE
>   target/arm: Pull VFP "can we use D16-D31" checks out into a function
>   target/arm: Implement CPACR.D32DIS

These ones had review issues I need to address, and they're
more on the "feature" side than the "bug fix" side, so they've
missed the boat for 11.1. I'll do a v2 at some point so we
can get them into 11.2.

thanks
-- PMM

