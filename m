Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1602260lfy;
        Thu, 6 Aug 2020 05:55:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhzHXg3/V9L+4WT17FVcj5q5YHQgILYqHqklxe7rUjGTXsIBQHNbNdQGDVpxgMkqU1hcWl
X-Received: by 2002:a25:cbc5:: with SMTP id b188mr11668736ybg.268.1596718539788;
        Thu, 06 Aug 2020 05:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596718539; cv=none;
        d=google.com; s=arc-20160816;
        b=bTmnOo3d4VGyDx7/ThZKFjnJdOnrCY8ILumwkM6KBPweV0StQd8WhQ+H49gvUjf2I9
         +m3uL4GZeOrds/MU38L4SujYI1KAMIOgLuExt1BPYHKwoMkpxaLFXSdcS/AVYeCLCpb/
         fV0W9prgK0MpyMZZmXFTI5OwNnoZ1ueISsr7shNd8vmjGSAj3uvxrNI7xBFm9dn9mXX7
         Gt8nPewGZO+6i9NiYWHPnVsHE3tOQM0ANSXB1F4/I2rS+jmyolHcH25KJBx6iQK2j9VA
         ZpJO60FweyGMwJwJDcOMSc8mP9WSsWgd/1iqpQzlrFoLDWF3LNDLPOd+0vuP5PAehhbd
         HS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PQju2RyxO1lbrYUXrxcgdWwgDLJPYib9FQfWj5UiMfQ=;
        b=qokMXUs4pG/jWq3Dsqhq2UjdTjuYQomc2lHe/xq9VxVxyPe1p6WvRC0FWUsfy8gn2N
         PnDlYOmpwzr16UT1mU8wS/uJm8zDoCXmiM5dDmcFfTB3D3TlAhhSAuts4HaEDNWAblYB
         Lv05r0XZcJD+PsO4H04gW2Ir9j28dzQCVNJPotzHQIZ0Ps9bjNMHvy7AO17xDkobPUMY
         30nTwt62czySmkUJXfpajQpLAIgD4nVOODLsgZ3ADnO5aMmeVhLBWWmcMTLw8n4AlRbi
         zILC3aSJqAFg/8hp1vq4ejC8q4Xoghj2gqjcleRCAiVGG5XMFvB0rSuP0KERfBDhxxXf
         Ke7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gay2+h1e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si4576057ybm.57.2020.08.06.05.55.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 05:55:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gay2+h1e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3fQp-0005Bf-5g
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 08:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3fQf-000570-Tv
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 08:55:29 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3fQb-0006Bc-St
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 08:55:28 -0400
Received: by mail-ot1-x343.google.com with SMTP id z18so15576698otk.6
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2020 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PQju2RyxO1lbrYUXrxcgdWwgDLJPYib9FQfWj5UiMfQ=;
 b=gay2+h1ehcLHXfNO2lflVOXzNHG+CuQovdf93FLzjb7OrS1zhtwOgixDetKUesmWCO
 fDbekmxZAxTEW2CgaDyMLJRspmqO7VznmGddlN6uMQeA+7vtXS0EmJSwcIH+Q+uuV0tB
 uDff8vJW9XE4ILcvq7qjos+q/lpafHnWo3HFomhcSnU9lKnkhRUD+KTggNWM8OH0jDll
 PIknQxTj/QneIUqPv64bPhY7WdcpHnyuRQl8IYV8rhSQ4Jnz3O79/4r8H8KZegV79QBF
 HuAez9LU9WTE7oo0/80Nv/d6dTliWC8FcTgnnw0BfbIIBACL7/9kin8KzJflXoR432R/
 qiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PQju2RyxO1lbrYUXrxcgdWwgDLJPYib9FQfWj5UiMfQ=;
 b=eO0wvoNk2VR053CF+mScRXHmkYz/hTfyD2dmAOAXh2a89HYrUO6YchjrWgNHoPGXxg
 uvTfwInCd0KuAq+DVR2PstWvZCc06SGD/qpAPUfekNJzXMKzgok7h38q5sm/Hn6P3UyU
 VL8Kk8ewXFrjEFGTa3396mbUtUa/210Ja99lLH/PFVgvvZo+/JbBlYztllh38HXzBC19
 39m9clcG5LfnFTK4J+jzJNgNmcAqzJQCoXIrqrE78Ijh7lqlriirL/GcVztjGMQxliVJ
 mTXLhR25YiGp9UnvftIRvLIB8jpko6DQsvESJ2pBr94mGJyYvOKoo+qyehMyxEk1/h+O
 YbwA==
X-Gm-Message-State: AOAM530eYjqjqSua/WA6qDnINb+l+6KN3VDC88AdbOoyG3v56yRLmVw2
 MRw/kZZGaAJtno/JXtVOoN0DX79h7dd71n0Lk0oDgA==
X-Received: by 2002:a9d:39c2:: with SMTP id y60mr7002073otb.91.1596718524844; 
 Thu, 06 Aug 2020 05:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200728150815.11446-1-eric.auger@redhat.com>
 <CAFEAcA9Dh=cNr95ajznpQHCLQ0REFmjSZCTaygGOZEP8vg3swA@mail.gmail.com>
In-Reply-To: <CAFEAcA9Dh=cNr95ajznpQHCLQ0REFmjSZCTaygGOZEP8vg3swA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Aug 2020 13:55:13 +0100
Message-ID: <CAFEAcA8k--w5yvdhX_Cu_sS=KaUEg0KyirZ4=JG8NdGFKGRweQ@mail.gmail.com>
Subject: Re: [PATCH for-5.2 v4 00/11] SMMUv3.2 Range-based TLB Invalidation
 Support
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HpLXZK9aXD+K

On Thu, 30 Jul 2020 at 14:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 28 Jul 2020 at 16:08, Eric Auger <eric.auger@redhat.com> wrote:
> >
> > SMMU3.2 brings the support of range-based TLB invalidation and
> > level hint. When this feature is supported, the SMMUv3 driver
> > is allowed to send TLB invalidations for a range of IOVAs instead
> > of using page based invalidation.

> I think this is all reviewed now; I've put it on my list
> of series to apply to target-arm.next in once 5.1 is out
> and we reopen the trunk for 5.2.



Applied to target-arm.next for 5.2, thanks.

-- PMM
