Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679A4FF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 13:22:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIRLi-0002H7-2K; Thu, 30 Apr 2026 09:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIRLS-0002Bp-4P
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 09:22:22 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIRLQ-0007r8-Mr
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 09:22:21 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-35fc2b18363so938763a91.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 06:22:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777555339; cv=none;
 d=google.com; s=arc-20240605;
 b=Rmd8uzzhAZrBI12tKvOfe9R1GOVZinlslFLacEZDoKQvLN6qSDVbXAr7uDiI/wHzwJ
 fxoWUsO9mDIFld21KsY1aKydWhtRmhx3dRTPOVfA202o2LmujU745kHzcA2xFb5a7yTt
 Rs+h9BOo6u00uhRhatXyd2X2dnPJsK1XQKwUv29a9X7JgUcfB5sc0BGLVPEuDYrWOwRC
 sJlTltPeXVXSiNFkVL6kT35bnswhKQfAo5tIc87EDrc5iTPua2xgvWXrncZw3SVOHV/J
 vjroYbd8tO5DnQHqSfKn1LlelSmZ7WLh/kS72H5pD+X9bt5eeoJqx4jIRuURvdCJLOKG
 FpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=FxbWF8KbXOGlfQKsgorPOT1msBKMLNNbj2kYslbT5dc=;
 fh=CTXXC38/yBVsN9uXZTTi5r6EksD2g/K9AewOmMKIFUI=;
 b=Yh9YZHmksiZGDIEiVgo7VHGibBwQ5MYJyfdMeU6TyyEziYTjtt/U+rzUp/8gNddlwE
 HkSBFG4LkC+OnXsIslokndU65BfPOVLKsMJOI3a5F3NJY+DhMOdwNfL6olhYinEXAHLN
 x142LkHJjpXNofN9kCF2ra7Cj8kwbetWuhdyM2a3tQPwflQhT+kvtPi0UAhE0xldWIVQ
 Wg7R05vDoSUSwfSbeYFa83FRXIPR3Ov3xFSUC4j2AUHe4tUpQwpoqqbP5JE3cphNYOaV
 lsx8VM1DpXCTXx8oKpkGg4HB/dDAwhO3pn3fc5BAjATrt2QJ2jaCwFnwevhgV5x5Fkwc
 mtMQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777555339; x=1778160139; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FxbWF8KbXOGlfQKsgorPOT1msBKMLNNbj2kYslbT5dc=;
 b=cuWiPD+kLyCZLy43azMxrV1wPYSs7dXdxJjTA7HbWTq6gnCK+MBiZ1D0o8RpWoAoVN
 1cXV75igyAZ5uRTn3Fj0iObcURVm/3EPZS2xdAzjWzR9sX5P9KvPyu3BkF11t87UX1mI
 I5jyDSKgtoe4wR6qPyBHGcOzl6bT4GGDQNd8qxb+gUS2oQj/f4xLwVLiA//zU8mAKkW6
 dJfe6KARaCwjNGQRYVHZBv5ffC3CSAEeb7UixQwG7rUU6GRSAGgqO3yqFovnIoi4Cb7r
 CI8tWNu7UPBNXboN5JxgXibv9bALuHnMs+SZn/nmILEIKKuM6kIJ/gIeR4v1V5En8D8y
 4hyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777555339; x=1778160139;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FxbWF8KbXOGlfQKsgorPOT1msBKMLNNbj2kYslbT5dc=;
 b=RUx3aDRsZduHcGpRGsV22FPDk5NgdMpoFTc8WhNy5plumYJR6ZpBIOJww/ZaMpwokn
 yE2FMVVPpA5FHjmY+tayGNycSBUU3hXenFz0oHzTrSGif0GhjB4K+dTDShcAD/t1W/Ll
 h090WrZCfxv2xD0CQcZ2dI/kwq2qhHWwoGPoPSqy5a7UlLtk7xX/N6F1S1ZYq4nxVcVB
 drIApMdfNCv38162CoXKVlOq/nLLcjUU2KHipMdT5vSk13l9+vWELe3H2lxXtrmkA2AH
 B18dQMv5mm678F02dq9FsknzXXD3zUZwzfaIheGlTdps1A/co19R8Dw0Yrj8PZZAyuvP
 ZDnQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ84DQZTZ1LR50n+HT94qFCEGrT63Zu057Obya3ZEEbpojYdAp/p/2T6yG5N5XfgD5B2R6JivUwWaQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxgq/M8/UtFpJfMjLFG7G2FGd4qLc8cWN6pF3ly8fBoj+xJ7jiQ
 ueEu8gS3SkoVuD+Ijeh8QN2anDhkzZ8z06KHTPCgECw7jFyuk2lutKTdkCAK0MHzzFHu0bgyT3Y
 BRFFExpSpxmbVuoh/kOc1gP+YLQ8eQCoXBq268S7MkugPVmcjO1sj
X-Gm-Gg: AeBDies4vLNgO8t0Cv24bA5Bqe2dl+hh/q9/7jK06RnFOPGDkkdMoQgH/3Xr1P4X96X
 GcTgKvh/O+LTq5a1eEFDTSZhgKRJD6Due0kKN6rrvCYLOIwmxm+qiB71efzxSpmLXTNazEl3QZX
 gCxyL9ICX2LSl3Mmk9x+2Ue/GEs02e87RgU/frT9fiBed6RFxiJJ4je78lIYDA0yJda+kr+X25d
 HiiDT3Up+dQiRaWjfpowNZ/hxmttskNAUptMN1fJyc+48Sld5XBTA0H6rSL7o6jf6elaYlbki/r
 ofKEGoWE3G3dOB87C9Oh/VjTb8D41gjUd9lu7wnubdm/j6wv5GEhBvauEUog7wgVtMbs30hFu1A
 2lg==
X-Received: by 2002:a05:690e:2451:b0:649:ed08:1a01 with SMTP id
 956f58d0204a3-65c18de27b4mr1561059d50.35.1777554591429; Thu, 30 Apr 2026
 06:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260428-features-v1-1-1841b39da7e6@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260428-features-v1-1-1841b39da7e6@rsg.ci.i.u-tokyo.ac.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 14:09:40 +0100
X-Gm-Features: AVHnY4ISyJss64q1Mf2DvH6h2BtrzOWFl1ukcMtkQZ4nxtYAaw3YZoAhJwZVxFM
Message-ID: <CAFEAcA9_Sc=+Cn7JiPOo9GjOZFU4KCc7nFVqU=9=QAsNBG6AsQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm/kvm: Cache host CPU probe failure
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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

On Tue, 28 Apr 2026 at 09:07, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> kvm_arm_set_cpu_features_from_host() does not properly handle host CPU
> probe failure with caching. The current algorithm can be summarized as
> follows:
>
>     If dtb_compatible is not cached:
>         If kvm_arm_create_scratch_host_vcpu() fails:
>             Report failure
>
>         Cache dtb_compatible
>
>         If getting register values fails:
>             Report failure
>
>     Report success
>
> This algorithm has the following problems:
>
> - If kvm_arm_create_scratch_host_vcpu() fails, probing may be repeated.
> - If getting register values fails, later invocations incorrectly report
>   success.
>
> Make two changes to fix them:
>
> - Cache dtb_compatible whenever a probe is attempted.
> - Record probe failure by assigning QEMU_KVM_ARM_TARGET_NONE to
>   arm_host_cpu_features.target.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
> Supersedes: <20260422-arm-v1-1-106a9a9e22dd@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

