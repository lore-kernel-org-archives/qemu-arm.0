Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1259973eje;
        Mon, 10 Jul 2023 08:22:20 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGoNmwK2lB1Z4k4KAEasLtRD5TAsXvNMPW/eRe/NAYSQ2cXPMUiNsmR1fvCRZogA0AYVpv/
X-Received: by 2002:a05:620a:191a:b0:767:1772:4f4b with SMTP id bj26-20020a05620a191a00b0076717724f4bmr15245329qkb.68.1689002540602;
        Mon, 10 Jul 2023 08:22:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689002540; cv=none;
        d=google.com; s=arc-20160816;
        b=MJOcBmpGBvLYzRgNx6ydq9RmWPqIHzKHU8/NOf5FuopHqnF6kDqzkWqth7S4vSZ7Pe
         qemmEEW0kSA08N/XHJ+10a8Y++llLMNzIAAAGoxY7knPjUIJJ9gke82beAgGXaG6O/1u
         BFVkEC7v6xVc3zSZu0h7DKU2XM0u43LkbkLchIFEiEI+UeOnq8jcOzBVEjMiRmeunNw4
         lwhMi8Iiymypx0921dQGSSm8efU7tuQwtiDIM+hPYMGC5NvPg6BBOrOnczP1DrAvkNmY
         TGvX55tw55hjDGAuwPWoFWkGtPonSTdO6Sq52ebx/tgOQghOzmnf1eTJxj7HnyV4noH7
         fVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=qDBSFsSFjOCz+fG2xhV0OL5q7SIJFz78CKOUhxQJWV8=;
        fh=DjFcf5x540nYnyRj+nrzzvmu8+sx0bTdo0fYzBaWDzs=;
        b=HVE6wY0fO6k5mKgCU5+9vrqpl6M6sooT+RJHFONShBFbmHSBnBVRT/ytqFgMCg46uh
         UFNvQnSQe2F16epgxl7PKhEtuuXJtWNU1cmhkqZ7zHX7kZjNgls414JhdoBL4LE1W1Xo
         1U6ewYYe8JAiIF5GPc175urbSfIJiUoJR6YuHCmq4pxCAfdDssGGJKQIgpWjvtcW932x
         j9VJCFv/q2JRhSreVSBCM1ERZx2DSxOY0zYZ4038c0KAqeWyeeQbyo7zhEK6LOwJTxsy
         c409YgiCXKjp3LA48urzwb5T2L8hWXKiQmoG9WzmPTq+MynDSdtGNDlQoFRJUAfxMmiF
         Qu1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bUffP0/i";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj22-20020a05620a1d9600b0076704ce8da4si5579762qkn.323.2023.07.10.08.22.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jul 2023 08:22:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bUffP0/i";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qIsht-0007lL-T0; Mon, 10 Jul 2023 11:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qIshn-0007jV-Od
 for qemu-devel@nongnu.org; Mon, 10 Jul 2023 11:21:39 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qIshl-0007vU-Bm
 for qemu-devel@nongnu.org; Mon, 10 Jul 2023 11:21:39 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3159d5e409dso598530f8f.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jul 2023 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689002492; x=1691594492;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qDBSFsSFjOCz+fG2xhV0OL5q7SIJFz78CKOUhxQJWV8=;
 b=bUffP0/i7toNoG3cHgeMLuRsLZkV/H5jUgvKLCwNb7XkQbwrKeW/qCJniOMhXagh+k
 Ahzp4s/FR0m3orb/Xo6RH0b+YDfsA3uPs1c73WIDLBWOjrWSsP7+adTqZb1d9GeD928N
 Unik25yJikmucapsRQ2FsKp+7fVTEPyNdR4FQD+aUAwg0pg5eLeTz+1p+V465pexVQ4q
 ua1/T6SNHYEGP7EJh4lx3pwhRnbnXcGmI0AjYi9B+4gQBp9l7H4/CXYFYJS6ajRqHiF8
 +sZokaRAbkUTIVp5xdweqFXSr7xfzvQ+zzwXJI0mTtun1e6FCcwi770E+c94SsvcdFTL
 ZFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689002492; x=1691594492;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qDBSFsSFjOCz+fG2xhV0OL5q7SIJFz78CKOUhxQJWV8=;
 b=LZ/vD+tczKznRTc2RE9MqX2dTQIvZnObEsLnW/6elZgC87EJXlLQCJlafmehbX0Vo1
 yvGT8jkHybNd3YvQpQQOfrz76B6EgmoAITzFT1KNG5Er/hTz+/zMqRjuCz2S7T6AT02B
 5wVipjv04DZi5Cdj1g6e/PydTOwMievJqjgccBzWBNXuJoL6yAyV+9M5kK8uYciqXvYl
 GHn0C/2/qE+BFANE/Z+VJXu+/wk0waVZtdFlrIRAQqvkCdrvabVlhV3MQFsJMimtBPCo
 lzt2RYOpcFGOBrw2qI4t/pU+UVUNjLO0JmOIfu4F5tPCr5ul6amucGisDyZeMBz+t3/A
 p6sw==
X-Gm-Message-State: ABy/qLbLucgHAklTqWRcfx/WoiP/vamIQd6jyNEBXoyJ0aX2GYAFev9X
 jHHyUQSlg8NJ9hHee6BMUC4d+A==
X-Received: by 2002:a5d:5452:0:b0:314:2e95:1ed2 with SMTP id
 w18-20020a5d5452000000b003142e951ed2mr14792381wrv.1.1689002492353; 
 Mon, 10 Jul 2023 08:21:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a05600c215800b003fa95f328afsm10578798wml.29.2023.07.10.08.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 08:21:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-8.1 0/3] target/arm: Fix ptw bugs introduced by FEAT_RME
 changes
Date: Mon, 10 Jul 2023 16:21:27 +0100
Message-Id: <20230710152130.3928330-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hNsp/he3ZDkq

This patchset fixes a couple of bugs in the arm ptw code that were
inadvertently introduced by the recent changes to support FEAT_RME.
One is with the handling of debug accesses in Secure state with
EL2 disabled, reported by Jean-Philippe. The other is one I noticed
while reading the code where if VSTCR.SA/VTCR.NSA require the
output of a two-stage translation to be squashed to NS then we
don't also set the f.attrs.space accordingly.

I also think we need to refactor the ptw code to stop passing bool
in_secure around (both directly as function arguments and in the
S1Translate struct) and instead always use an ARMSecuritySpace.
However I don't think that will affect any use cases that don't
turn on the (experimental) FEAT_RME support, so it's not so
urgent as this bugfix.

Patch 1 is just documenting the meaning of some of the S1Translate
struct fields, since I've now had to think through this twice and
hope to avoid doing so a third time :-)

thanks
-- PMM

Peter Maydell (3):
  target/arm/ptw.c: Add comments to S1Translate struct fields
  target/arm: Fix S1_ptw_translate() debug path
  target/arm/ptw.c: Account for FEAT_RME when applying {N}SW,SA bits

 target/arm/ptw.c | 90 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 80 insertions(+), 10 deletions(-)

-- 
2.34.1

