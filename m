Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CE9C54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:43:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woi4y-0003Tt-5J; Tue, 28 Jul 2026 09:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woi4x-0003TQ-1r
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:42:43 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woi4v-00082P-HZ
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:42:42 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-6685001353fso3380315d50.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785246160; cv=none;
 d=google.com; s=arc-20260327;
 b=AyQ7JoG3E7q6NhVPWNslhE2lFjKybJEeJCdxrwWMyYF/YQgupvKG3wtRyA8m3cOsXv
 pbh1/kevLbvPOsG6InZAnJ7K+saGs3LUE2U9dr66ig/PADHdoC11PVLzKF5MIt7yeicM
 Qpqql1lra2av0sRJqyxq56NZ2SIaR/2GdBZ6q+u86l2+BnWsGzPQDo06ko7vqw4CnNbr
 d48o7w1gXDA+hKdrarLRI900xy6Czc4ew/bEP69CKxdpZUvSXYLhOX+m//QNT25wBZhj
 7yCL5q/xKzPl79OmLeDXLxgFrQ48i/J0GP5YVvAUx6YZocvuzDC01iNllf1PnO5CrMby
 GzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=SCYe+ZjD2Jng54r68tIvP0VPioDck0U9z+5IT9qUR7w=;
 fh=lCcAixEGIZbiIc7HzblFJCW6WhCGzx0LJkoK44o47YE=;
 b=cyIQf2VXALeOKTw2qzHsHpiUSOJAMCpM9r5tiNj2lAGdx5JQwG/XdsBthZK+0zSJad
 p1ch7WRFirXcoYFEc7jDRAl58dOQBVIViisxRepoks54lkMfmuI03j15jS6HRcw/PqRA
 9xE/eY+P52/xGtnhf4ZSnkh8ESTBUsAjcw278n/bJhl0yzgoYxkGnHbl1toHQT/CmNjK
 gKWcNXfGtj2gNJQh2DjhQ2ytBhMbK59AD9QjH4u/OD4XKcxMHpRYvJUteIBKc3mq5bla
 zBwQruf4pLG+NLa7CtTwe/6uruY9HAUiFbwc1fS+LPm7ryYKFYVFRfVq3vm3Vk+fQWzf
 6pGA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785246160; x=1785850960; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=SCYe+ZjD2Jng54r68tIvP0VPioDck0U9z+5IT9qUR7w=;
 b=EUY4VLRnjBBlgJRu4P5vRAaFVXg4vmMdIe7C8+SrTTbW6dOmr1OIqMIQcByBWynUch
 NrgDwdV3CPk8lW3JY5xNYv181VdhUEix9OYduI+aiw0f/HdNqIdMsz7/cy8jnrzca+cc
 g4vbpwiMUmsQMgCMkG6DPgoa501omGEmfO9qjgFIpBIIaktC93fnHkw22Z9ieJmv/uBL
 qgk31j51Z0Agdd4i5uBPApRZSrFMlL0/cq/h/d9F3mNV11apZ0yo4aAycnhTFIMqfSzM
 iDolaAGrshGRej3djKECwvZkQsQ/xye9oiwZO/VRfUudLWisBLc+GsftJZas1SO4wzUN
 3HCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785246160; x=1785850960;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=SCYe+ZjD2Jng54r68tIvP0VPioDck0U9z+5IT9qUR7w=;
 b=RFJNxxEcHdzfUb/6X3Ku9L852YnK9IJQz/Ojick2MeSlTONIcLiA0cnPpvSHY65uMj
 Ex3W5KWn9Ic1A9VvT2ZCMN7kP51DcMDoOENRHHDOMZkQRLDkfl9zIHAzUoAofMjXgjZI
 IwO+L2MhaGfubzo1eDeK7XU7P2XLfpe/sxruTGHXPe1jraESTgsdEkv+7PApW/L53xt7
 pMFvYQ4U5clof9PFTnoJQIOeGZqaBApmXeIPdc28Ial6LThBk3uBxZRdHzanU/Ygrf6b
 poZb3TWVwyUT4m0GjHwNq8fp1fpEGYGfo9Ey5+6KPjlvNmcrNnJZYEqe8TywoiGPljWV
 Hecw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rowa8laDt2rIm4iSwe78fIhLGvdUsqc53Xva436iGa0FBG4Czcq98brIDyIzyoMaF/8a8nCOicGdQ==@nongnu.org
X-Gm-Message-State: AOJu0YwXFmOmRMhFyhbLKlw6apsam7PKgbOcBZl0mUrxqKvXOUaJjosO
 n0UvJegMWQGJTEJKds9fcUO0FoDSz5yXAZYUcoRv3EGYAlJAwsC/CN3krqWdoCuiaQIJJz/2biw
 G7ssByMWlYIAuwYu0/gWiCwYRKvG09eUBIISgqKYTJg==
X-Gm-Gg: AR+sD113e4L2mRBHfgrj85rZVP0W/BHHOGojbiNYVUpkDgZqczLFaV9huS4ZKMpAbpL
 3fNDI/yYlzdNt7Eb4WaMs53egFgAoK5Qggi+KAjas9mQ5lw1w/5tsEtXcQU6gHTVGWsHp/JFjC5
 ydmX8OrXyIU57B8qa3cGGvqPmqTTWaulBRIy2LE4x2/gCzIpmhOvtt9oaY45ok6DygjfHoqG//F
 FvwiUS2xKwA09zUD/wp/uWZxkHAF3gP9ANf5OXyUQQrzj0zwfP7oGV3p7h9TGdCd9/srIitoftV
 mWJXlwA474s96dqf2CwILdHqdubRGzmDal6MVoiUmmhD+Q==
X-Received: by 2002:a05:690e:418a:b0:668:92ca:f50 with SMTP id
 956f58d0204a3-6690547b235mr781834d50.12.1785246160194; Tue, 28 Jul 2026
 06:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260719174905.420725-1-richard.henderson@linaro.org>
 <20260719174905.420725-4-richard.henderson@linaro.org>
In-Reply-To: <20260719174905.420725-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:42:28 +0100
X-Gm-Features: AUfX_mworB3lQD34Z8Xc0sLWFplkTyGk2qXOLXmLz1QHeqSB8yP0kZZDdcaSnFc
Message-ID: <CAFEAcA89_cs7YQRrJFxhHscryJ+BK54dy6jDNqUK4O35oCTHrg@mail.gmail.com>
Subject: Re: [PATCH 3/6] target/arm: Fix b16b16 feature test for SME2 BFCLAMP, 
 BFMAX, BFMIN
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Sun, 19 Jul 2026 at 18:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are controlled by FEAT_SVE_B16B16 not FEAT_SME_B16B16.
>
> Cc: qemu-stable@nongnu.org
> Fixes: bc65d2bd1cb ("target/arm: Implement SME2 Multiple and Single SVE Destructive")
> Fixes: 930760eb753 ("target/arm: Implement SME2 Multiple Vectors SVE Destructive")
> Fixes: 8b61eff8e72 ("target/arm: Implement SME2 FCLAMP, SCLAMP, UCLAMP")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Yes, FEAT_SME_B16B16 is for the ZA-targeting insns, and the Z-targeting
insns (even the SME ones) are FEAT_SVE_B16B16.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'll try to put this one patch into an arm pullreq for rc3.

thanks
-- PMM

