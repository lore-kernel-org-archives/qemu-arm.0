Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp308449lfu;
        Mon, 4 Apr 2022 09:14:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztilQv5hlYyj6sjYfZfK2B4Yt93FPe2zCMPoZ6JhpNDxL5ND0z5V8eahByMdMNYFdzPv9h
X-Received: by 2002:a5b:781:0:b0:63c:af6f:c8a0 with SMTP id b1-20020a5b0781000000b0063caf6fc8a0mr528383ybq.69.1649088895387;
        Mon, 04 Apr 2022 09:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649088895; cv=none;
        d=google.com; s=arc-20160816;
        b=txEFh4C06RpFCXlPkr766TZ2xJLrNIfZEhXYsX80Qw7ypPrrZmmQFuqejHIY4DYYY7
         SV1yyggsRx0XUlocA0PlG3uYvdjHDjb1zgqjut72etxldeAIZQCUMJZGTE5L4mzhHL4K
         Ah/myu3LsjS1vNggJR45WqB9meFHV6Qr6Sm+UY2jqOCTQoNDPRzqE+OPZ7zOoC5JlaZT
         0YkGe8cDba8kz+ITf+T8jnj+cEu39ksy/pHyUVtHwMQ75xsNPkxLGupbmlGhRE8gF49i
         fIZw1rBh2MwDFK8by00UytGgKl5u3qR4/epFT3oQ0BfU8ZBOwNCNLLTC7+65NIsYHPYk
         Y0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4asZSVeAXheX1HH9Rpk6RIrRHjEe4Cn0Dvpc2cvhklk=;
        b=hHc5R5o266pSEbe6brEOqAgwOM7B2Fr7b5c3IPOA7hEUZa9G8t7nKQy2w/USD6Dcgf
         xqe3n5JTTMuQimf2QaEAb8wTevKXthQlYFmjgVJTKqyPGYzBGhkjzvtabFxJBdP1/7yS
         ByxJRWTQoh5OxUiWBpM65mpIrv26aYN/cRbEZ9ZZfo7vBy0FAH2T/xwXHaVjbeiuqYRg
         GNpidqG/2s7iFIx3PUBylyi0M29j4qhG3EPjd+WOGsKS86aQ4f3jHKpHHwiSYirncRCQ
         0eZ/OqDe9Hfe1dUvV7QJlwEYfwnxaHQLDyj1rmX9XAwpQ+hzbKBO5nhu5KgTpY+4Ptsi
         sxMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U5YaGx5b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a815704000000b002e5bb9dcb8bsi7847074ywb.532.2022.04.04.09.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 09:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U5YaGx5b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbPLy-0001SU-Oz
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 12:14:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv8-0004o8-1q
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:10 -0400
Received: from [2a00:1450:4864:20::435] (port=43717
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv6-0000TO-Ix
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:09 -0400
Received: by mail-wr1-x435.google.com with SMTP id d29so9088995wra.10
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4asZSVeAXheX1HH9Rpk6RIrRHjEe4Cn0Dvpc2cvhklk=;
 b=U5YaGx5bcWOX8RyPZlPpAQoF8jt3emzvsZs0JokXfzB4+BvkmDlIoTZPw6sndiPuso
 IVN9QnumROP+UREWOwl3ULSZSRPX7InR7KoBs7o6K8x5DTZODcGt3o+qUkKgXlGGj9sO
 EJMNG90Ys5+RwWyGH3rwCC2DhGKsx29Gk3I26QmYOrEglVcYTU4qf71zZUAm0/SPOJ/n
 Rv+4hiv7Ppevnr69veSFVnW5GDlYjGQX4Kk0w6MLg8vF55IVB5Z3JItBdsLVeuqHJJr7
 ed/iAccTp5Wn+1tSsgNbDo/JZ4jBlojapPZQfCsHgRqiwRLnJojDn9YI2QQQ0+zvqaPG
 qPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4asZSVeAXheX1HH9Rpk6RIrRHjEe4Cn0Dvpc2cvhklk=;
 b=m1agYt1LoV3NiWKMJYCecFbXxH8oIsLsH+hWiLdyzhXcPGzUBlY485Y6KPSX+BAcXl
 B2gOKrjm1Jhn3ewjvWK+Oi2rfA/RvUEs/kgwZvNUrXyaf7ubOsSwSoNI+erYBT5TKx/Q
 7fskY6cgwotvkyxn1gr791NczMClLDlh3nUqhIeIDCcPZvTX60gQBIi9zfar3xIbdc8A
 k40zmJxdyIt/g7Kqfm0cqCLdMcps6ODf+m55jKqmyq5TiS6BcUdaDQtyMeb1ll1dHw2p
 CczTg0MN9JSRde062oHDoKZbPJJdZXdGd8blluxSjbVT+vgnE4n4/69FpgoFMGYcr1Vy
 5PTg==
X-Gm-Message-State: AOAM531qCbsv1uEzzEYb5t9CGDHuJGL5ucA0Odr7OFkuewQtGO6ouA2c
 XSh5CvtC3KbgPDSVjrb3CKObpg==
X-Received: by 2002:adf:dcc1:0:b0:206:1a02:95a0 with SMTP id
 x1-20020adfdcc1000000b002061a0295a0mr273424wrm.183.1649087226287; 
 Mon, 04 Apr 2022 08:47:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 06/18] hw/arm/exynos4210: Fix code style nit in
 combiner_grp_to_gic_id[]
Date: Mon,  4 Apr 2022 16:46:46 +0100
Message-Id: <20220404154658.565020-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 51JwRRIOTPVK

Fix a missing set of spaces around '-' in the definition of
combiner_grp_to_gic_id[]. We're about to move this code, so
fix the style issue first to keep checkpatch happy with the
code-motion patch.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/exynos4210_gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index ec79b96f6d1..3b77a485780 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -121,7 +121,7 @@ enum ExtInt {
  */
 
 static const uint32_t
-combiner_grp_to_gic_id[64-EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
+combiner_grp_to_gic_id[64 - EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
     /* int combiner groups 16-19 */
     { }, { }, { }, { },
     /* int combiner group 20 */
-- 
2.25.1

