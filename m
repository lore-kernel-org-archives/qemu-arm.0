Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9675D13C2E
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 14:57:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkO1g-0006do-31; Mon, 26 Jan 2026 09:57:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkO1c-0006TC-2I
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 09:57:08 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkO1Z-0001Ht-PW
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 09:57:07 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-790992528f6so43269207b3.1
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 06:57:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769439424; cv=none;
 d=google.com; s=arc-20240605;
 b=Bx+T2nrI7UwGp09VKYdbVj0hrVXgJmdTrrKS9e3yewW1B2sW/Z5iTlyjWWUP0lIOMC
 nsw/gDJpVysr392NQ7OnK4SGhUC/oPu0ioYMmiCj6OQgyU6UjF5ON4JMPptz/IAt22XT
 fTgTBbLFRlG8TaHCljdzETzz82XtVrbTrWFe42f42mkGKiys6IU0PIJdVbx7NYxbwhte
 oOGuIynJr48FVsdFrp89WPiZMsCXD24T+4UxJIB/4TPoV9da404wNqcGT399CXa6BKfL
 uZ7hV9VJLJ/wgB2SLy+zASldkPRodPh9yB0YAbcKWgjZNaYnyk38fKA0mwC6BMYxsoNJ
 MGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=XvPngEILyd1XfkneDIt9fB/fYr3v3mP0gtY1lU/Qjt4=;
 fh=6s96zzEsVsRgYeSD/qwyCqNMYKOojemzF/r7+jwA7PU=;
 b=YjP2bAMHM58mWmljAEWCbv7ojQKApqYCuLliZl/WUaosu7LKBeY9ypbIIVmYBaLvL8
 9mgzTfFC8/x9CG3wG8iJhJDD2ym2zPXv/y5C8fscxJm41rVriyEEBEbjdhILgrsjChCi
 Qn0qO8uYScZ8yEnGJ7MxelJq7WyBkmcKtI9QotpKj/xqotcIwpZAkkrL44gBEyy0ebsq
 fiYdF0G52U2fU6z5wmQp6soqsdoLyP4HvOOOWBUs+xtenEvMhT7nU+2SX0TcUg+/ujBD
 b4+OjpSSEg0dlHqwsC3jZRCcIheiEh3VQXp2M+ng3cON7bpSkmaIX4OXEV4X3ECg51fE
 b9mw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769439424; x=1770044224; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XvPngEILyd1XfkneDIt9fB/fYr3v3mP0gtY1lU/Qjt4=;
 b=WzE4vjvx/YwO0S4xSgzSXPyozAFhJXp/E1x5TL9zjvt+3S9fv/cHQrFLvI4D66J0xb
 5QoS9GGDm9h+eBt7zuyL9MvW5oMxFRlZkeF63upFGcRBMfCDRTrFmdiss7U9S2l3X5cY
 5GnF4q5E/IZWrAbOEs/zsKnUaiatHn2o8OrjjCKmLIdChh8Gy6tmhdvIQhGuLYXzL4GR
 ZerpHw8fBoNY/xVglnDNl2ZckyN3MOmumSdfML10R8tVAWZMeh9KT3ABWzx00HMX/Mi6
 eKdCgbQ/FwGXEE0lQpHBik8vgV1v25CxWXEwaIqoAr+hx0bUP3SS8Dacoy5+mNH9JyAb
 qdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769439424; x=1770044224;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XvPngEILyd1XfkneDIt9fB/fYr3v3mP0gtY1lU/Qjt4=;
 b=dWhTDCOUBKMzxbNKILilyWILyPl4zQ3L3O2RqjlBOCOrkz99a/EuxYVofLhPN9s80J
 c+viBSYDZwxBnd5OEJpXPTHwiR6ziDuajzDPCpkuum8HVEh8c43OGBTlC1Yrhaqp2ByH
 +mx3hklZSb09EsPeH15bD7tnvmVKAL/HTolvO1edF/i2eyDp1PSkthYJjjxXvdUWn+Kw
 LzFzx7EaBELbGagdnbQ9Z7ZH6W4aeu3/eOiurnrcUPU/+IlP3BK3F4KoymbhweSkqmYc
 cQYnNemxeQsFaz34Ug8IKjlhbsLff5Ig+wwPbU43i6TfgHERpI48aHcUVfR1rMA3lYP0
 sXEQ==
X-Gm-Message-State: AOJu0YzNHBOJ6DxP13rmiO8AVJRhO/wCLTPcuI6uvW3wgtnErsg/x5le
 zCMpwRR8gP2TynbZIbXsb/zNFB3auKZoUyBbpG4SP4ddNJTSqJ6VnJs5tdsREwsaSuHiJshrvh4
 UscNjnzqN4WWk3u0iWETN4GNH9WaZD7DgCBsY4/tneA==
X-Gm-Gg: AZuq6aI8lrv6VEadDQtCe18xdjNhtGtVhk/k1/jfo/kluc4D3IdROSYO2jAKcIffNY/
 K4vTS2Wfz7Eb+pez5+qbXab02dTm1HBHhW22M9Vui/pr6o92d5+h0OKzZYDXEqtYVmB8l1Hb1jm
 Rz+F0wABhboB79yNswGBRh4/x/ybGqC/SSytr5Pms1T43Sq0uRCUchuOOyxnFgFCjZ6aueW4LE9
 lWjkkmDDuE/GVV56bKbuwRwUUeBzvOZIbP01GvS3YvGqQmOMA1zn9m8qXrD36lRpU94MfKetluW
 JRnd
X-Received: by 2002:a05:690c:d92:b0:793:d0ae:d8ed with SMTP id
 00721157ae682-7945a863d52mr36472867b3.18.1769439424307; Mon, 26 Jan 2026
 06:57:04 -0800 (PST)
MIME-Version: 1.0
References: <20260126104342.253965-1-skolothumtho@nvidia.com>
In-Reply-To: <20260126104342.253965-1-skolothumtho@nvidia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jan 2026 14:56:53 +0000
X-Gm-Features: AZwV_Qh5MV5xhvYVTM94g3pYpzo8WGWvwmk4TmBCljGeLV9ip9t35OvTT3k7Uns
Message-ID: <CAFEAcA_ziaNu_xdDVcLb8s8Jb7YnyBF=Sda5=Q-Dk7gNhRVvHg@mail.gmail.com>
Subject: Re: [PATCH v9 00/37] hw/arm/virt: Add support for user-creatable
 accelerated SMMUv3
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 jgg@nvidia.com, nicolinc@nvidia.com, ddutile@redhat.com, berrange@redhat.com, 
 clg@redhat.com, alex@shazbot.org, nathanc@nvidia.com, mochs@nvidia.com, 
 smostafa@google.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com, 
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org, 
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, kjaju@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Mon, 26 Jan 2026 at 10:44, Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>
> Hi,
>
> Changes from v8:
>  https://lore.kernel.org/qemu-devel/20260121175248.87649-1-skolothumtho@nvidia.com/
>  - Collected R-b tags. Thanks!.
>  - Initialise the AcpiIortSMMUv3Dev struct(patch #25) to fix the reported
>    CI test failure[0]. Please find the latest CI run results here[1].

Thanks for investigating the CI failure -- I've applied this version
to target-arm.next.

-- PMM

