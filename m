Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3546779lfb;
        Mon, 9 Nov 2020 03:43:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfrHI4HEdpNQEe8H2zANHq99ieMbhkvA+q+X/ZdTnXIznWLSqUoLAU0RrN0FDVX6rbKkQB
X-Received: by 2002:a25:e54:: with SMTP id 81mr15441513ybo.201.1604922187014;
        Mon, 09 Nov 2020 03:43:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604922187; cv=none;
        d=google.com; s=arc-20160816;
        b=1Ag5URcdWfUXSQ9QNYLB1BsUbQ+BW5fojjakytmIRKXEV4FREp/OGxvi0XylpH2768
         tkospAp4qn2j3vJF2700BbLguGgoPQreXYnUfSapl3lBN3T8w5uCMtQ5irMxKYCTjbem
         nFrPIFZTb+fjBmixZke+G+0W3pi+RPYQpry2oJS4DeIX338nzTTkxQ30J+HyIb+919w5
         xuRsPqTbOuIuIEF+eaJ7uhb0o6KtrORpbMOELmThck41Rs95yxDleaifbkguGv41HgZN
         Sd84iIQVud0jXcOBRlAeJbfOh49+CrCRZ7IFUXu759Dfo3Ck1wyseX4gDE9YykIRb6fG
         5pPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+BooO+D9VaFv9YPGlIazao/4N9f+P9VGABPAaSjRg3k=;
        b=vyEA603T9wKWY9CVgSIF0/SFlTzBKcQEh1t+CFnVk/mEgWr3sFtgthSlxAM3PFIKil
         NCSfnrQdCx2kwymnoMWss9s4xePMpiLw8+/fNu1bpnPS1CwhkwFfZmaNi9VsvA5NwuIR
         lT+i1FyNTUBDB2jMO1zfQ2bFPJuNEz5hghhzrROo6dsv1eT/C/l5LWAC3C7bGJk9pTSC
         rAT/RVHB2V9yRCBWszXchLzdBzgWyLkRAggzk+yIVsm43plzHtyOKLGaoaKTEi3YRACB
         JvuCUaqisNJlib68cbmIcno+THonLsAqilv1FNYtGyDNImK/2jWq37pFsa6g3axv0Brl
         qXpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xMmYOwl2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si6077616ybg.25.2020.11.09.03.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 03:43:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xMmYOwl2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kc5Zi-0003XX-Cc
	for alex.bennee@linaro.org; Mon, 09 Nov 2020 06:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc5ZL-0003VK-7P
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:42:43 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc5ZJ-0002B8-MP
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:42:42 -0500
Received: by mail-ed1-x52e.google.com with SMTP id o20so8392217eds.3
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 03:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+BooO+D9VaFv9YPGlIazao/4N9f+P9VGABPAaSjRg3k=;
 b=xMmYOwl2/eW/yEPY+/q2ZWQbSS6nZHAvpdkFlORjLQNo21aWO+szSwI9Fj/dXc5xLB
 bDdaYiNtlMeBCOFzE/qLPFXzxg6YqiDZdjGv6rsxWahdPCmmW1aGsJCEs5AlfJaSAFcA
 Fn0FMT1iORez+2FlSJteYpaqWp7ZKiD3+4NT/oe7qm0EwoRosDd/S/txk97tJqGRsVUY
 wb3EMO/q0KWWi2eMJv7cMeazI5KfOlLpRnzsk8ijL4MEHDq3G0iCqWOEUCKSOjBuVoPm
 EzFnVYWARJ94FHpTDt4YoRhum2vPGrd1gsW15CFdtXLTrsh8/PZ+B4qoZeGe8pn4Xwlf
 lBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+BooO+D9VaFv9YPGlIazao/4N9f+P9VGABPAaSjRg3k=;
 b=aIgCw1jK9I/3/qQs2F78gv/SbpJ4KDj0DHasVpN0QAgJgHGw9ngprXEjKbYBxUE9Rn
 xhgKJEKzrtNwzT6jBP7hB1yZq+dOSUD6t8b5FbbdhH2aeoB7+Xd5HEeEzj4kJMOVymMh
 U805Ov55196GhgPG+4WqxUIBL09kinmLB21SygkXfyUjjb4kd+ZbbOz9thp0D8ouPnwT
 Ovo5nfkh45iPpvUs7wHgzGIffdDtA++KPYgpx3w8kP+J8+0UFOI4neW3tHC/K4eRC75N
 l2ipfjziPej1rpuBxvLzhn+vLyuzgmj1Mj2TZzL+f4/er+SsGjlZNKVtvSlY0vjJEOem
 IVaQ==
X-Gm-Message-State: AOAM531eKYyaX6A//mgGnV91UvXq+f3G4UNjaX6wdPqGCkphEE9PzD17
 rM9bPoLiZ7/A7T9mEZVyLUgUUs2fjYqxhvBEGl0laStJud4=
X-Received: by 2002:a05:6402:30b5:: with SMTP id
 df21mr14533533edb.146.1604922160272; 
 Mon, 09 Nov 2020 03:42:40 -0800 (PST)
MIME-Version: 1.0
References: <20201107114852.271922-1-philmd@redhat.com>
In-Reply-To: <20201107114852.271922-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2020 11:42:28 +0000
Message-ID: <CAFEAcA9PrBczdwk+vBXOVGgYsNykz2jVNQcqM9-y5BQSkkMjXQ@mail.gmail.com>
Subject: Re: [RFC PATCH-for-5.2] hw/arm/virt: Remove dependency on Cortex-A15
 MPCore peripherals
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Miroslav Rezanina <mrezanin@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jlP3V6UTccnH

On Sat, 7 Nov 2020 at 11:48, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> When using a Cortex-A15, the Virt machine does not use any
> MPCore peripherals. Remove the dependency.
>
> Fixes: 7951c7b7c05 ("hw/arm: Express dependencies of the virt machine wit=
h Kconfig")
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> RFC because there might be some odd use case I'm not aware of
>     (like instantiating it via device tree?)
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/Kconfig | 1 -



Applied to target-arm.next, thanks.

-- PMM
