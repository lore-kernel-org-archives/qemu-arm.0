Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED992CC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 12:23:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHKU3-00073O-Ia; Thu, 15 Oct 2026 08:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHKTg-0006Pb-Rq
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:22:35 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHKTe-0005eS-VC
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:22:32 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8b0c5a64de8so15000937b3.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 05:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792066949; cv=none;
 d=google.com; s=arc-20260327;
 b=krYyt6PLyzM8QFCHkBnZbhPMmATFwerqzvXohATb9k2F6q8L+0J3mic3JqVRweH1Uz
 f1tWnV9+nP5Lf3/FZ5Y49qN7i09BdspDMQe7tsZSTkoGFIZ1grUJzxHc9IpGTr9EZJ6M
 sLIHm3VqZ3uoBrI5eAdu9y5G2MKURoqALMEFTpU48g1UKcZEexrOGY1YE8cP2r4AOmLq
 6MV7/SM0Z/bOPekMluE1iCZV9d8DTGWjBp+mZv3JnnnM71FeDeSZTj+rvxxWjdPq0zTZ
 eVLF18nNjkooVMvbwCU8GNcOJLSc/TeVDPTshEQMiICPUutg4J5L3EkaS8Dv4JvOriBO
 /8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=U92CGQXLWP/g3pVsOzf+GbrF6oRwn/h4Pu4vLDCB2+g=;
 fh=ZUa3fm1ydEKAmgfI2OCbZ7QvoWwmuVW2nsw/HJUHv1o=;
 b=TcN1U1Fdr5zFG3OUtIcLsccfEgE3+oQVxggozPEE7xLKjltRfxzkFjAg051wk9lnno
 4fdY2YMMusDTMTR7HUR7m+2CifYrKCx8wiJ3CaPkwajJwpEbiqQYeTV773RK2rl02c9L
 EUVBuykcR1GVRMyBlznNxOhm8+G4iHh3jfAYHwZ/kQ45IyDLIIzNY67Hg/NJpsjnrnK1
 LLTh+d3zgMjz9BcGn78g2T6dsbj3kVzr3dAJHD2pSgaJvJAhyEV6vRswGpRRMBBYkkhA
 kJqXwLIMk00VXL4FhRSYaGqOg99iS/bvUyfIKBiaRf5rKgeSyNj/Fbj6WcploTkN+9lU
 MgHw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792066949; x=1792671749; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=U92CGQXLWP/g3pVsOzf+GbrF6oRwn/h4Pu4vLDCB2+g=;
 b=a0LoPnyYqhYxBX0kE4C/Hq+k0uLEJ1dBG1mHHstIyiPNtMriLQKsmGEbbyIzOoydgg
 XDRh5d/gYd/kIrexMx6mSlQSxKCYP73D7H7u2Gc0Ew2z3qEHNARsgjwBoEGCRwNXL04v
 e6qUfVU0pE/K6GpJIZ0wkff7H++Vz2TaGi02v/4lR4ddzD3NVQJ0u3OnqXIn24wc5q9Q
 NTMKkKpFPIywKuzfW9/4w8tX3i/41XbCgbhfdV3dkjfe05XyUD28SLd9VlxRrwkYrO0+
 ja1X9Fs7JltzA00kvwSlXbswGojTQix4GKwnTUSP3X3q+VzT1kiZ8t/3/j0p87HDbymS
 iQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792066949; x=1792671749;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=U92CGQXLWP/g3pVsOzf+GbrF6oRwn/h4Pu4vLDCB2+g=;
 b=LDyipBsBIZ8jRm60E7SwlvMu992Fp17x8XZYf34pq283ANtJlON8gq7J5mQHcnxK60
 kORUtx4Wgbd1qXkavAFj/0heKxV6jSs5bX5+v+J/pFtC3QmJV4MvdeZI1x2PbdySJc5G
 pfiokFGgL+WZGuE8ToQcO3YfSo6SjlrnOVLEvbK1OecREScj3BrV5Opg16HG5RUr7pbr
 BziQv2CIPe3+9219XRXdlXqecFFluLWVAYjFy1nug2SpJJ216fmpn+hF/BmSHK+Ud5zX
 MhQmEWR1V76Y4jP65UFXi3RD0CT7bEuH9b7tpZ6Fzs5pPwftMJdc567CUVUi2OqvVrgM
 DHKw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz8LXMyd4gUqzTfCwx7dlTPSJ6kbji16oTGma7TjLnm8xbtNQwyx8TgMUkOjUA53YiKunhxJGa9Wg==@nongnu.org
X-Gm-Message-State: AFq9FYL0yZgFfdv2O8fuSAaEy7iAyxORJ5TvOAbvuPvkMO/LmL9aoxVL
 WI5xIrwfBnKzX8Az/kp16VxA7FHh9sUKT9pYGDEHRIpSqgvJ/CM/stgZVKooEjKeCCCrJ1VUw1n
 L6Heoe0sixJE+queqqgQcjbf2FPZtLXxiSwTwWQAmVQ==
X-Gm-Gg: AYBFou0hHFVCOWmzaM/qeLZ6Bojf0C9A/fLaF0iXqdytRTRheN5Nuhhbqbe3d/yoFT0
 QRankdVt8gvCKvcXWiYzTBObHG/Qp9kxJNpkcjLsGnRL1wZ4nBYMt4NjvLQ8z+PgmQw6EvnGTNz
 5YeEvhCcXy/qD3METrbFMTHCGjxsOv7iW5pDIlNNsNF5Z0V8UkLoku50AMFpZ0ydw/RxCjvNFwR
 d97qmXwm12XWXfssyn8m4mIw2T9ck+KVOkQASoEtpGdgCHBF5Eq09K9qdi3bZPat1Od73QUlDqj
 ZeMjWrzd91I6e8vubwi7qdbeelf7KdnCCW1EEqRWZVp8bt9z2j/7fZ7Eh0nCTvtR3Qc29FMbtPR
 Fpt2Lki3baiBKT3ycWInDxZjKp5fTftpxvgQSwd0=
X-Received: by 2002:a05:690c:9e:b0:8a9:a1e9:2665 with SMTP id
 00721157ae682-8b07d3c4195mr64805667b3.6.1792066949108; Thu, 15 Oct 2026
 05:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-15-khushit.shah@nutanix.com>
 <395b66c9-4173-401b-b469-8972b710aae2@redhat.com>
In-Reply-To: <395b66c9-4173-401b-b469-8972b710aae2@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 13:22:15 +0100
X-Gm-Features: AclHuK8Tght3x1FGlR6vM-L7TqSFJaoIQpJthPwaxOxww4lF0LHqC4u2oGFG92Y
Message-ID: <CAFEAcA8DcLLYJeE_NUKrFTKfYvHp+6YYAmCdZnBfz2AjRNDnzw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 14/25] target/arm: add neoverse-v2-v2 named CPU
 model
To: eric.auger@redhat.com
Cc: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, cohuck@redhat.com, richard.henderson@linaro.org, 
 maz@kernel.org, oliver.upton@linux.dev, berrange@redhat.com, 
 abologna@redhat.com, jdenemar@redhat.com, gshan@redhat.com, 
 skolothumtho@nvidia.com, sebott@redhat.com, armbru@redhat.com, 
 philmd@linaro.org, yangjinqian1@huawei.com, shaju.abraham@nutanix.com, 
 mark.caveayland@nutanix.com, ping@khushitshah.com, sandesh.patel@nutanix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Thu, 15 Oct 2026 at 13:13, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Khushit,
>
> On 9/21/26 2:32 PM, Khushit Shah wrote:
> > Add a KVM-only named CPU model for Neoverse V2 r0p1 (TRM 102375),
> > inheriting from neoverse-v2-v1 (r0p0).
> >
> > r0p1 only changes MIDR_EL1.Revision and adds FEAT_ECBHB
> > (ID_AA64MMFR1_EL1.ECBHB).

> >  static const ArmNamedCpuModel arm_cpu_models[] = {
> >      {"arm-v9.0-a-v1", NULL, arm_v9_0_a_v1_props},
> >      {"neoverse-v2-v1", "arm-v9.0-a-v1", neoverse_v2_v1_props},
> > +    {"neoverse-v2-v2", "neoverse-v2-v1", neoverse_v2_v2_props},
> nit I would call it directly neoverse-v2-r0p1 and leave the -v<n> suffix
> for potential fixes. Same for r0p0 obviously.

I'm not very enthusiastic about accumulating different CPU models
for all the different rXpY variations that appear. We used to have
a ton of basically identical pxa720 variants and I was glad to be
able to drop those when we deprecated-and-dropped the pxa support.

Is any user actually going to care about the difference between
r0p0 and r0p1 ? In particular pX changes are just hardware
bugfixes that QEMU was unlikely to be modelling in the first place.

thanks
-- PMM

