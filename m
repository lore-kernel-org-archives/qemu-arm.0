Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AC2CD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:05:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waYuF-0003Oh-NM; Fri, 19 Jun 2026 09:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waYuC-0003Ko-NL
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:05:09 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waYuA-0003Mn-B3
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:05:07 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-662fa4a4470so1414004d50.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781874305; cv=none;
 d=google.com; s=arc-20240605;
 b=YrFIg6recvJ2MqruPlxUMcOUFWk/mhEy1c5zJKwaiS4fP3HfSp4ZSpia5D/5niW1Rh
 XBH8YF8w+MxmOEwbgRqGARxAKcLuNyvgdAF5dIheS+In9ncjw5aPcj+7+CX/VbU6yCj9
 tDQIb3Yzu5KXaUFoVlxRI4OBFfyohtysAZUBRXHsb/ElP2GmBGl7LnBdVPd63cl7NWw+
 hFMa48+t064lBOumzJxGRYdvmWegRp+xpnktB5XPsVlM4EzllRdCJCV/+Kd/WLSBfYJn
 00SoyajIzgncyF898Mm2iaK/bWKLIR7cwQFNHDKhZ1OWQodVuYeZYw+gK9RyYk6mIKHF
 tTLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=RqlRoDWHmLfvS9rD6ZtcTX1mUk0I/tN/zqNz77rFEVo=;
 fh=Z4RqW9yXCrKsj2FWyFZa9KbaAlyrxHLUylZ4/PAHgTc=;
 b=A/r8+rKIMfRvTwIWDZEY1xKd/x/bvQdveIM9M02GDxQ3ulg+6ab8MpeAQzeHqkvH1z
 4pWE/LRhcm+5VvRVy0AQ430xfEIsqLoMBM78r1z7mRYgj+mw0eCwhwr7E4hA+fna1ryj
 osbzWU6+vDx+ua9BGYftxaCDdZwfUqWNOX7ozn8GdFuXgPE9ML54cQnTePZdmMZN5fx3
 BwvxenYlWLHKUuBE6KEgegp22m18KAxm2PHp22NjxcOpcPD4pmxFj3MwbJ1M4uOSRCEs
 A/FYuBMmHlfLmL1f4iC21gGyK9F2kBCDrAKFqYgH59DDrm+qF1bKWx6zbeFD9c8AxODa
 8syA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781874305; x=1782479105; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RqlRoDWHmLfvS9rD6ZtcTX1mUk0I/tN/zqNz77rFEVo=;
 b=CxVB90Ak/KpaAt3KwXjS9CRJQRtbBM98MdBvVfNWwrAdLKXRS5p+GvAC/oUpalNC5B
 TV5NzYCzYlLrRg0Vu0hZCNj+Tcj4kb9Tq/jdgkIDulPk/vSj77+QIH4iVnbpCMEKpquk
 mMOYHZI28zL8OBS20d8+CoL+iEk7LDz56I32dRacYF83OK9yDveRm+37D4f2lCSKwu0H
 6wfZR4w6288HHJzA/fXJz7PV7J6w7ZPN/iW0sHoYoVAz+0LTZ546p6tN548Kcw60Ngpi
 fEr77iMA7hZ1PBh90NeXbBfUEBlV3Ti83TlLvKr3WzdLnCXNZlRqSOmQjJV+jvt5jusS
 fl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781874305; x=1782479105;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqlRoDWHmLfvS9rD6ZtcTX1mUk0I/tN/zqNz77rFEVo=;
 b=engg0JEKzDVW1O9UTLiSMYZubm52lNkumU2BbIXEE3v7DRGOrJJaCVwStegKdh3pl1
 8MilWqJVQJVZISbobD7O+OyYZA0qt/RqTr5E+Hqs2+BjRA5a/xooIcGPaLPDvfmiW0RI
 po6NgJJlyyvC68c5XEWL4blENSeKAKXvaVXyYwJn778MKHKOYkEurH1IFipcbqfelf3G
 XjarGK4bwiKgw0sX227LFWk963Ke/ikr7sHO5H+T4Xm6QWL8Q1Hdiwi+WxjCCvGqjbuq
 OWIbtJZgW76MV86Emiw8pnN0Pe6PAaKt9Ipa8aHiXalNr7vwE517M1wsZEnZ66O8pcFx
 DjVA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Jpubrw9YWEQ00G8HqXo9PtUCxhkHyVkzGFC7QRnO9jrv94lwuRNevDMlqV2t97uyua5NRtRjLRQ==@nongnu.org
X-Gm-Message-State: AOJu0YxBg2N0E6/SuhvrPTfbx/1gY2WpOGbmG+5ABbfYiO94VTtk+p3X
 DFRATNZrH7UUI4CzWDHgEIwZHbgjjS1sSPOs7E65dtHjX/5txIMD4u1MFBv/rpd9uYKJdgWpUM2
 aJZwf3chtyAdGKs9EwsZn7mlchjexSnpdaMPXd4olJ4y8sxgIr8YE
X-Gm-Gg: AfdE7cme9X0Gru3qqpxN5PkWpFwMHTNgMZGjrQScNIvJLBMZHuZBaQ2z14b6Nrc3Plf
 LlxtDvOUZL9Z5D85Ghqh+NNi9dTnpzm3tNeWixiuDyr3dcCfOrlkNu0NicldeszDCbHXrkloV0k
 u31wmm83IUJfLHH83cC/Boxl8Ag1YiUUNvdFqSHPhmTltsZhGZ8ezXTu5WUqNqm5+TgsEjDlGmZ
 Sf7Kvxus2mOiDbu8TF5GssNdQ1TQR+21k6p96KiH5va7D8s8u1YVLj7L/iYG56rC81xldi8HC7H
 QYeDO93+vl0UTzLpr0RzAxhJfa1QqrvtWXRuMk+9dRywvc1bi3eO+ExC
X-Received: by 2002:a05:690e:43c5:b0:660:a41d:d156 with SMTP id
 956f58d0204a3-662fca03b57mr2625501d50.35.1781874304907; Fri, 19 Jun 2026
 06:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260618040718.572950-1-richard.henderson@linaro.org>
 <20260618040718.572950-7-richard.henderson@linaro.org>
In-Reply-To: <20260618040718.572950-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:04:52 +0100
X-Gm-Features: AVVi8Ccwq7_qgOIYmBDgx1ADH5-ZqL-Rl0iAFLFGx0rj7ZVwLPBhfzWMPlfEK2Q
Message-ID: <CAFEAcA9n63_5MVVx=QRkryrS+FQW3hiQd78yD_0MWEXfC17S+A@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] target/arm: Rename isar_feature_aa64_sve_aes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Thu, 18 Jun 2026 at 05:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from isar_feature_aa64_sve2_aes to match
> the feature name: FEAT_SVE_AES.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

