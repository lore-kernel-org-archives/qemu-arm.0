Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp609027lfb;
        Thu, 26 Aug 2021 06:24:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSn2vDyvdRrqeXfYyi0Bplr0zwfeb3uTB8+DcJwHljwmhwbx3f0N9oS4/+136T2glwuvBG
X-Received: by 2002:a1c:448a:: with SMTP id r132mr3638748wma.117.1629984271675;
        Thu, 26 Aug 2021 06:24:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629984271; cv=none;
        d=google.com; s=arc-20160816;
        b=nbzpBZyp85gfo2g+hG9xYpvuYtjeNxLfDcxtpCemfpU2OD+0yn35Gamr7FON4LHjMA
         F9P+IwXRngl6xMkHbvkp9GWSiJmBEgyQUmUONrbX5+j3Bwcjgvp+WIyEJT0qF7oVi0yR
         7cMB1ps8N2JgqMqwodFaG7jvWkVjC4E63d/faWzs3bedtfcsEmFugTyWfT+A5j/eSd2c
         YHb2G4nHWTyeRU8uc1cQeyxnnR+io3HtP66yjouO6rI7yb0/GjLSCnRkQ8d1XDep03Mi
         yEL9v16OBwcJsdUhEw7GS5ccpf80h4mNEJOOrDJ9fUD5V0xaox2pkDsMevviBydGOYKL
         xuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DvhXlYYlfomJDUJCbAefggwT30WTKJdIb0Q3AVXh8mM=;
        b=huymU5jwS0QY+7tuvXNkkSGPkoIkGl6pkAHP0Olcl1eeoVTb4rdIptohtoCcQHkxJm
         XHHLStutaJBBCjA6jwPsNiBmRiVGq5mjHx+fK2Kwi9B0b4tT6GYPj7RaYMhlIT6H+wuL
         tco/nXbsWL00NEXlBSvJASdI+0aakMklyQxepN+uV3YOJwG2GOVBpnpVXBv6H1AAsGss
         NGnSICxMPgm3OZAtZ/6XhZ/pRRhkEYsESWQ6pbeRsZf2hT+D0hGoCAv7U3zrDQGmtqT0
         Duc0ImSUUVTDRgu57aqLsopPvezuX/caN2dOVrsNl1fsx+3jlowcl1yD7YItJQOFNW0X
         kMkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uV7gnocg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si4222742wry.335.2021.08.26.06.24.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 06:24:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uV7gnocg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJFMs-0002Zo-KG
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 09:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGF-0005m1-0g
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:17:40 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGC-00051b-8u
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:17:38 -0400
Received: by mail-wr1-x42f.google.com with SMTP id f5so4956970wrm.13
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DvhXlYYlfomJDUJCbAefggwT30WTKJdIb0Q3AVXh8mM=;
 b=uV7gnocg7QyoQ0SZEor8AWM3Qdw+JYPG2LcEXM/w3vp2ZUwg4Jmf374e57dbU7EFCr
 E53k3yNqo1qhUTMsLbuCIiasAnjjMfX1piRBL9+0h60A/OIOEmM2vEwsK40gbujyM0lH
 rQwJiZmNG1I2zz6ZJZYHwVUMZ6WYqhhTD+BgYrzrhdxo6WJJLiz5Qgcf3NQuzldGB12X
 sGNnROf0iLv6XPIxyEKl6vSlK2ElFKSgY7pSPf+re4go36Eo5rTZj30g3M+N2f83Ishg
 oDqkKCCRBZmdHdEF7hWn3j6ioMFSDg27aZxGQxffMx+Cnv5gTTZ7Irkd7rtvrOO3AVnN
 smwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DvhXlYYlfomJDUJCbAefggwT30WTKJdIb0Q3AVXh8mM=;
 b=PNGXPaus0NIsptLaDoxTe62edfA7NBaY1DQv+ZxEtro0lS43CF3Rq0KtnXAMTYrQm1
 k3/lbBUZ1pJzgXaphNKSSZjSjAJGjqEVNglkR00vEUvQtu88BHtikJchAGkX9gL5GyA1
 k88Kir0AKcFXiH+VdaNFhHcqnroshMP33qVIF+q6GCs8p/I8HSlKzbiKuuFHOIEjFKxF
 ONixAswaGxlFljf5nOZuCZDRomCa44P2vRWHL5kao73rjVF7pZlSk/4FLk4F1NixhBZ7
 +mUWnlZaVlqjSu8jOXQlyIIxYHc55kD6bNoayK3fYdxsVaaJ6gIFz1bempaFMgYAdXoa
 gcMg==
X-Gm-Message-State: AOAM531qWWPjmsAkdEKKnjrAbJBb7T+RhZ1xNNU49ranhInyluav3xfR
 QEb/VzAQ+iVdKqDuCcznagOoR0KGSYwD0w==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr3986340wrn.122.1629983854977; 
 Thu, 26 Aug 2021 06:17:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 09/18] softfloat: Remove assertion preventing silencing of
 NaN in default-NaN mode
Date: Thu, 26 Aug 2021 14:17:16 +0100
Message-Id: <20210826131725.22449-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hzDdp2C5ETyv

In commit a777d6033447a we added an assertion to parts_silence_nan() that
prohibits calling float*_silence_nan() when in default-NaN mode.
This ties together a property of the output ("do we generate a default
NaN when the result is a NaN?") with an operation on an input ("silence
this input NaN").

It's true that most of the time when in default-NaN mode you won't
need to silence an input NaN, because you can just produce the
default NaN as the result instead.  But some functions like
float*_maxnum() are defined to be able to work with quiet NaNs, so
silencing an input SNaN is still reasonable.  In particular, the
upcoming implementation of MVE VMAXNMV would fall over this assertion
if we didn't delete it.

Delete the assertion.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-specialize.c.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 12467bb9bba..f2ad0f335e6 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -198,7 +198,6 @@ static void parts128_default_nan(FloatParts128 *p, float_status *status)
 static uint64_t parts_silence_nan_frac(uint64_t frac, float_status *status)
 {
     g_assert(!no_signaling_nans(status));
-    g_assert(!status->default_nan_mode);
 
     /* The only snan_bit_is_one target without default_nan_mode is HPPA. */
     if (snan_bit_is_one(status)) {
-- 
2.20.1

