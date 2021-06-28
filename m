Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4032275lfg;
        Mon, 28 Jun 2021 07:04:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgv9SyMIRWMYjVaG844VBpahhvvUwDoGd+CjxScEb175brdZR5vXsBi/51pNNfX7G+i+JN
X-Received: by 2002:a37:bce:: with SMTP id 197mr25760923qkl.423.1624889072006;
        Mon, 28 Jun 2021 07:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624889071; cv=none;
        d=google.com; s=arc-20160816;
        b=at24qCRdMewCKKqWmkmon864/5HlaMOU3i3CBMOzdmEhfq4m23+8DYno6XF+ojQf4z
         Ws3uNslUG9TRAuy+RwJATd40dQVxqfQx8jYF8Lie5hrJVgVJPIe8k3d3xf8aFPlJyh8q
         VnUYcMG0u7jaVH7pSB//KbAS+jGGwWmUvbwp1B+JsZsZNP9SS+Hv1n5dbs3oO+vP8eBS
         PYhyHoWkmhkhr9oxSgavmw04/tbGe78yaYZUiuH1pAMt29qJhl83O7LDrXbKCkkncvzS
         w+GMWRTp7dcza+ngVTR0u/KOxLn0/im/SDiAgkYoGuGgIQEkfzR3XLtpNy5nEuPer3DM
         oOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6ECd1CqiW7oll4Lgyq4I+GHa5FBDnDyrRFiDMwgYQx4=;
        b=tDw+jFBU9vkTst5h4jG56OMo5zuK3mqTb6F29E3CooTfFdjW0wXn+5lkyfiGKI4I1r
         ZsqNLcHV+f2F9bFDJEv/e6bPeGSt8R/1CXW2k/JZJwNbm7i0arilGJxQ5oqGKdrFIEHV
         t6wJq+XZ/vRf+zpQaaRg3JwXTsg9Jo2blA7AaXczO36RsHzS+vg7GCl0HhfOc6Whqscd
         NaNNge+ZcwPmEB6uIFmQarZl8u309851vf7lA6R0lFi4yxWcNIu80rsIszU2f1uXqZLB
         JmYfjWvOmVPNVq97VJBglm2NIaTlKvztSgS8DSciJwuCIDtHrYmC71tEKO7AwGphOfmx
         gUhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5tb+hHy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20si4905130ybe.182.2021.06.28.07.04.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 07:04:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5tb+hHy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxrsF-0003Np-81
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 10:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmo-0002vk-Oi
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 09:58:54 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmc-000625-8o
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 09:58:54 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso55485wmj.0
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 06:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6ECd1CqiW7oll4Lgyq4I+GHa5FBDnDyrRFiDMwgYQx4=;
 b=y5tb+hHy82XfmJgI553WqiveiC7YvZ8eXmFoj+T8j3MnZbtCGGywzoKELe37JDcTmp
 +M8g0OKVbWNI6aGNFmvhECQpi3HedOwlYFqJBphTwNf7CKZ9ScAtIwlbmluABO0MgwkB
 C3/UyQk8knJQZG7DoC3gUUoEgeUsvLonPNT1vWFqB3KZ+igyB/+lIlW49dXaJ3eCK62X
 U+7uFPVCz12l/eCSVb9zF4jDeYkGQYNdDhwJn83ngsI8KjsipK972LTGmqAhUewPv3Fn
 YsfqXMmT2m/mlgFl6UkWX4F2W6gz9v6yTWWb8fw+qZr+T/gT9BNhE5zn0sEbPLgq66zL
 3D9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ECd1CqiW7oll4Lgyq4I+GHa5FBDnDyrRFiDMwgYQx4=;
 b=lekXqIqZ95ygpn5LgHt1A7d30RZB3n1Bq4EQqmN6muLihf9KhM6IuUe6afAzddJAko
 BVlc7HwRkuv8E5vC6ymebpQPo6ecv+bzGV15oeSkI7Y14x6kj4PdA2HbOu/2gTd5AZPd
 CdZ9oXHg6CsGu0XLGnOMK18BH1ZxxdtRkaXAEv3V8vMJneU0WHKQwprxvl3ATMpJYm5c
 MZ3WE1OhH5LoAfjL+uv86LoMTBdh/w0cThm8F9r7/O2EIePXrHt//IRB9y52cHmLyzRP
 M3HXWxNK5vD4AmahmV6z8kvs4jhw/shMuKZ2fRJouy58O80VlQ1YO2XzgXr3ehw17eeC
 YxJQ==
X-Gm-Message-State: AOAM530ZszeL7bAXLvXIOPBv11j5+kdsuyFYJXWOVGOP/WZ7fWrUiATa
 l6nfUdBBfkYBtqDLcoPu9PTypMfI9RJn3pHB
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr14600wmh.145.1624888720848;
 Mon, 28 Jun 2021 06:58:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/18] target/arm: Use dup_const() instead of
 bitfield_replicate()
Date: Mon, 28 Jun 2021 14:58:22 +0100
Message-Id: <20210628135835.6690-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: PGtUCc8r+kBH

Use dup_const() instead of bitfield_replicate() in
disas_simd_mod_imm().

(We can't replace the other use of bitfield_replicate() in this file,
in logic_imm_decode_wmask(), because that location needs to handle 2
and 4 bit elements, which dup_const() cannot.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 97b4a41a0c7..02730397e3d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -8221,7 +8221,7 @@ static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
         /* FMOV (vector, immediate) - half-precision */
         imm = vfp_expand_imm(MO_16, abcdefgh);
         /* now duplicate across the lanes */
-        imm = bitfield_replicate(imm, 16);
+        imm = dup_const(MO_16, imm);
     } else {
         imm = asimd_imm_const(abcdefgh, cmode, is_neg);
     }
-- 
2.20.1

