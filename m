Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp916172ejy;
        Wed, 14 Sep 2022 03:53:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4/BsO5eWo8VEeL/cadUD9ulyISVBuYgRdnIH0C+jjYD7igzWZnVtbo9ZRnImWhc5n6cXW7
X-Received: by 2002:a37:5385:0:b0:6cd:e7a3:d000 with SMTP id h127-20020a375385000000b006cde7a3d000mr16835647qkb.463.1663152813054;
        Wed, 14 Sep 2022 03:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663152813; cv=none;
        d=google.com; s=arc-20160816;
        b=sOmZy+wQDT4uFOvsn/v96I8x/FK/31Ya8OmCwua27M7FM2xQZK/3r+OETWCdjyEVTL
         G9kswyentXLnu3bnLoCUpWDC9RVHo4t6XvkU++hJmvpOKMimLEB6oTFMi0LEvPJqAe5P
         9yCO9fKU90VPwz5qlTgd2rf3j9VABbEsiFuyoMFz6cXo3h9dbuOHtCVFM8EpJ2TG8Tqr
         3Fkjn9M6Vx7bQWr5b6mzXkGpvzJQT0hGIndn+SQlZLbYbiWx+uxY6N3DJS0zJxyq/lg3
         Q7upZlEkKWjROAbz1ze0yus9TtyeOOtKzfmI90llHoOkazfv6gblPIb/FXwF61xxF5JY
         oEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=3EixDPZiTh1cu5bzXVUfqmmOq21DRcvjlj7CM3XcdWs=;
        b=bklgXYZbXVab9xApK0s7gJC3cZEqZA6Bto3sWYJWQtNvrXm6yfYDyUfjOYsh5J/p6s
         6qUFm8wO9D33BjdGmRTSnhFNivAR9WQA0r07PqNij8aEnSK8dZPVCdUYXwo2RqqAiUyf
         wa5UK4FjEGsfMRgILBumqq2jIGosUg78YHdgACjdVBEBhZjV8ZDow7eYS4I8bl6EK8hr
         G/zSHx9pbZdNm4PCRDSyY0o4PUc7DFV9XzttRTHF3t1fMJ6Z2mpIY909iP4DVQ0b+aSL
         EY11gmH9VOyVEGv7PD6NZUA5w6zFzOzrZ2mtuo61Zzk57CKdBEagvtWlabWvLARKWSRZ
         L9CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b="eq/knprL";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=adacore.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q21-20020a05620a0d9500b006be7bc45cabsi1165491qkl.101.2022.09.14.03.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 03:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b="eq/knprL";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=adacore.com
Received: from localhost ([::1]:41056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYQ1M-0002u4-JN
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 06:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oYPzj-00026s-7K
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 06:51:51 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oYPzi-0004vK-4w
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 06:51:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id k9so25110729wri.0
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=3EixDPZiTh1cu5bzXVUfqmmOq21DRcvjlj7CM3XcdWs=;
 b=eq/knprLKEJigiTWJYlneRztqMEOjrQaE6sJ0l8yq1oFrdLMfN4PIVHeRoj4NK33hZ
 B/VvNdcI/GKxKibPY3Cpxj4KDQxfux0gIuLvN9P40DRYAHMLIVGjZnM++1wVgGdQvd4K
 YLDrsR/MW4fVfZf1kY5/YHb4PwM2QL9apOSW+J9wzflxKX/AfqbODw62XTJoD+N7GAdW
 BaDfBbrW7jMRYLVH0ENfhLAwy31L3CNjD7573DiX50nDFP0Bd8qkAretKD4l/8C5PVdc
 b8eH+G64EfWJyn5MXg4M4NBc1iAXpWvFFZzt4qwfdxMAouukvEl5bdRP3OAETxZ2qRzV
 c8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=3EixDPZiTh1cu5bzXVUfqmmOq21DRcvjlj7CM3XcdWs=;
 b=VX/cwaUMv75uu46XRkHiRK5HuXwBRu/8sOOlej4B8KFLg88syVsVx7Gw5gomKZ8KB3
 uIie2hagg64RLdb/vCeUBM1g80cExSKsnvDU5dGrNF9I9E0Y3tUSHVaU1y+P4T+QHk4w
 /qU14CCMt3GN2jnlcjNvPooJdhJ0viBOmFyo3SyyDea32D1s+o+dxzOczIWBus2WF3sB
 f7w7sEGYsBCe5aebJF1u4H/t5b7+3TdJvwxmGQVzjAH3IX8PH0jBTJ1YLqxF6VekIWvw
 +0njExfad/JI3pnlZQ3vKZr4R1fLWUYWI3o78XOjAi1gSFXo+oxbb95L3EqYoJXEUbja
 Y0hA==
X-Gm-Message-State: ACgBeo28CDaOKlChYpUnh/DMqLEnsewz3XvbVHY3nJbp2mwh3zMbbTjr
 x3OZ5+yJBot0SoB+DbhqVdnuvg==
X-Received: by 2002:adf:fbca:0:b0:225:2ac9:e306 with SMTP id
 d10-20020adffbca000000b002252ac9e306mr21490128wrs.259.1663152708074; 
 Wed, 14 Sep 2022 03:51:48 -0700 (PDT)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b003b3180551c8sm17591567wmq.40.2022.09.14.03.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 03:51:47 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH] target/arm: Fix alignment for VLD4.32
Date: Wed, 14 Sep 2022 12:50:59 +0200
Message-Id: <20220914105058.2787404-1-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /XcjA0iPM460

When requested, the alignment for VLD4.32 is 8 and not 16.

See ARM documentation about VLD4 encoding:
    ebytes = 1 << UInt(size);
    if size == '10' then
        alignment = if a == '0' then 1 else 8;
    else
        alignment = if a == '0' then 1 else 4*ebytes;

Signed-off-by: Clément Chigot <chigot@adacore.com>
---
 target/arm/translate-neon.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 321c17e2c7..4016339d46 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -584,7 +584,11 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
         case 3:
             return false;
         case 4:
-            align = pow2_align(size + 2);
+            if (size == 2) {
+                align = pow2_align(3);
+            } else {
+                align = pow2_align(size + 2);
+            }
             break;
         default:
             g_assert_not_reached();
-- 
2.25.1

