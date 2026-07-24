Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C80FC531FA
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 09:05:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnBqV-0001mJ-Rd; Fri, 24 Jul 2026 05:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wnBqR-0001lG-7d
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 05:05:27 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wnBqP-0007s5-Oh
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 05:05:26 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-66771ded50aso132487d50.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 02:05:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784883922; cv=none;
 d=google.com; s=arc-20260327;
 b=W19DiGGc+NFsNMQDht9nXQ/f9uVcQe8j0X72HgAYVPZadcDafAq0dcYjB5wz4qp63q
 f79DPvpTI0Es6zl9DIVey/vvjSGo+wVJVmRyh4nv0wwRPigf7AwevFk/XgeJoUnHjRmm
 va582gET++OoH5k6JJeGdtGqsgQHZpg4hHgeUwijiS24JS+Vi86mF66IeS4BlsfTxu6P
 sSgRqG+cafAe1hmbpxCuzkZYn2UIYpWTIel7C2pZKnvWXDvu+gcVQPq/y0dvBfsmoBK1
 mMPKGVvE8vxy9KrEZi53BVsyD51Rv1mdC3H+ss36FBGp007lodnBWmeJiPKA1j7zl0Rs
 Kdvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wB2BU+1Vc1TG15tTSEPTTjNW5RsQoKo5eo/pDr5JZkI=;
 fh=X1Cs51Mp3btRewFwg4eXM4sPZg8EtqbbeWGp/7kmHh4=;
 b=Y1x+hOIk4Y3JtZSs4f18X67uaO0rWSWirvpcMIJYknPY1kdtnaO9+/+EF2PbLdO5fm
 6Cmvj7NOZX+fXIiOSaf2e/ffyq4AOK/lXUBooIFyP/P/aUMP/8u+TuGnw+wGERMGp5LZ
 I9b8/VsoTYR+30EX05oJWuMb0hC0HTHp8nppMdaViNaC5FCbnIVtiSdwqVbfAhdZ+ZTB
 k3nwL7NpzoN7PAQ1RMZaHTwU6p2hC5SzR4STjnBWZaW0aOSzW0aI4twT61+5tJHFAww2
 ULhND48Ml5a6okge5VtGRtkQkZpskR8IjViumUamm+U+i9YpztsISVQPUo7sqey0Y3rJ
 5GZw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784883922; x=1785488722; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wB2BU+1Vc1TG15tTSEPTTjNW5RsQoKo5eo/pDr5JZkI=;
 b=KMATxNakjl8F/HCMaywH1FRniJ5wehSRGEttzyhD87vWl7ZkkYHjyhrf6VvZY2BPen
 j5VaAnz8Xj7CNvFdqtk4d0Kx35zLL4Fam4fcZo9X6KZ02GIzgM+RPwZ1NBpHKvh5F3eK
 BpGhCM/bEFCAvgh8LPpt73nw5ObMdRkF76kezm27BsdSuAQwmVJcxfn2iToFKxj8FsUK
 wSLxsbYAtLgcgfYLjyxbBaXhRFixN5DNl9Uo9EOjfHrp96s3Y+1pcyBwcbIw8exoAYRs
 cr2OQXO8+qYjHgj9I5X7LP2mqWG+0FK61o9WLT2e3xGtHpGA9DbAoMGrHCMoembYiMGo
 OS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784883922; x=1785488722;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wB2BU+1Vc1TG15tTSEPTTjNW5RsQoKo5eo/pDr5JZkI=;
 b=AxOzjPBTe4TebRGmPtnfoCDDkJ4LjeHm/+CJabACDCZUutVLiOMgDQbwHDL/Yt5GR+
 6iAcjGXbLiio4IOvKFX6np7zLm4tg/pq5aT4Gyy1Vmv+pFmcD/dXTtGN/foT1hOtryF9
 iAr7QC2INuVAlaO1iGMqgoMszz457tNU52RgCyrifU+ay94Q5VZCWh7reUnwJwTh3+2+
 V/J8qldy/7ApC5/dmQoJoiOJZACTIkIzRjTAmu6cxN/PpzSZePzMHZq8gLnsg0ZHnBAV
 OntiqqDOROTFLIdDcQFggxzaDiJFS5EhD/5bJ6cwu94ItsqzprPd85jB5QGQCd92wB6t
 ++9A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqQIiF11X5teBssaKoMk2NQSPbFFKKFhpHZhFWJV2kqWfsZlSgyEndP+VBMyS8kXT71eE3wquxjFg==@nongnu.org
X-Gm-Message-State: AOJu0YyKQxrA6BQ8K6ItYKi0aF7Zw8jxKaZLl0ZTxnWHFdHgBAtzLNRd
 BrxHg2WZS8sxsoRa23iNA5hUqJ3L3OfdYuoaHqhZGewspfgvAmvZvqhqfYz8bE47aKxoOgAMMSo
 51ZDI7IiwKQ9Be6MnHXziZfAAPHQ9ufF0nsSD3i523Q==
X-Gm-Gg: AR+sD10LHi26WYPdSIfGhiFDOi14iatgkeyy7I0DlfFcSx1X1JhJfO2J32cq4Bb/j9W
 WkkTCflO48mhrtQ4zX3W96Ji5iKDbYX2l6m3d68kJ2e/kHykVzC4/sDmIGVtzNBziv2VXAH3nRr
 NytGe7s8mE3IvRqbnJ/2g/hHrtOn9oV3VfY+cboRmIC+jmKfE2o0523aiwA1JmfGACGvfJxnJVy
 /8j3TSGGO9AtiLHxnEUZNay0tHzUxmjjJUEwMemZDR/7s3MkDHMPXnzLM7pIU1nkhQCUChVSPec
 LLiZGYw7yT1K1AFllURmMr4JFT0zBCaYTZOPiK4W8ktvwVftqyvHEQfM
X-Received: by 2002:a53:b3ca:0:b0:667:8a13:c3f with SMTP id
 956f58d0204a3-668a4ca8e4amr1459639d50.42.1784883921570; Fri, 24 Jul 2026
 02:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260721122135.6288-1-philmd@oss.qualcomm.com>
In-Reply-To: <20260721122135.6288-1-philmd@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jul 2026 10:05:10 +0100
X-Gm-Features: AUfX_mwaGCJT00JZd7RJaLMRTv0VuNAvviznYWPT_k44VupjCN1PJ8QRgka4u80
Message-ID: <CAFEAcA82mU4y_qbHOSacXEutgR3FALUuzk2kEKmXbV2YDD_tqw@mail.gmail.com>
Subject: Re: [PATCH 0/4] target/arm: Build fixes related to GICv3/v5 and hw
 accelerators
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Tue, 21 Jul 2026 at 13:21, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Build fixes for when QEMU is configured using --disable-tcg
> or --without-default-devices. First 3 patches might be
> candidate for the next release, but still these configs are
> not covered on our CI, I can't complain.
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   hw/intc/arm_gicv3: Fix ARM_GICV3 dependency for KVM / WHPX
>   target/arm: Add stub for define_gicv5_cpuif_regs()
>   target/arm: Only compile gicv5-cpuif.c when GICv5 is selected
>   target/arm: Build TCG stubs as stub library
>




Applied to target-arm.next, thanks.

-- PMM

