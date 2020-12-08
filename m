Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4239680lfb;
        Tue, 8 Dec 2020 10:10:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJGMtJ6bRP8Nvyxf2oFUeG+Xl0iJdJyuOjEnzGq+4WX0n5/9zhTc4gC45EBSPhfIQoyrGH
X-Received: by 2002:a25:d392:: with SMTP id e140mr31120794ybf.70.1607451056139;
        Tue, 08 Dec 2020 10:10:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607451056; cv=none;
        d=google.com; s=arc-20160816;
        b=PmTYEU7dwodSWuxZwC8tdH5YcQFkbUpnTVuzkUmqNzsETeSD3yF+TvUG1B+PhCpfnb
         n9xbRyPmvd5+/NLym8SlFEzo75VCf1674vpqXmQc3MacLopaU5iYNFrztXUzzuupTZyt
         RC1H+jkoU1mhIb7MNc2b/AyH7guPA2bPV1WEdM8H01nkQa0h+6i4eMKuNKFxDPWzTJZy
         e2ZMXBiC12HM85bdGBriz5dIcey57RmUgpA81LPJUIfGO6k57ll0aXjLQJ/EOo7Pj3Fo
         QJxaUZQKKI+g4H94U4YaFt70U4Lc3+OspAV2srzHRDYFwbrus73RCiw29Y4K3RiKEPIn
         3cyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=udYZfRYde9RuoZ6aJDkOn2J2xIM6qQOMYu44RcbdTs4=;
        b=dxwRy87NO5+Lnz3SbejtdxXN3rieCu3V8Q/U+Gq5AL0bsIwWyMq/JqxQ25fnPPlU98
         pXNU9g+2MYIOco3yi/4tm6J3lDv3HdIM326yxw9fiZJQxI6vMQr+dRfikkYIpFVDm2Mp
         IPZG7wT6GHgwkibIXI33KGBYmotwzkUz+cWvkcYiMrnhUvWxA+nsgqg0phamwKsIF1H3
         3KA2915brf88olrKlveEePakolioVbEwgxp66bVveL7r4dKhgb/bMXVuVKtAcJP/MD+4
         P4gBJsAmxJu+z+qcljj54GGiUVUebuKU7S4msBHCF+/oZU21AfECvXIJSVgsyeoMbQ0u
         9mCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vXPEzaB5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si14916671ybi.444.2020.12.08.10.10.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:10:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vXPEzaB5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhRv-000858-F1
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJ5-0007qU-VK
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:48 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJ4-0006Ob-DW
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:47 -0500
Received: by mail-ot1-x343.google.com with SMTP id h18so12644078otq.12
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 10:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=udYZfRYde9RuoZ6aJDkOn2J2xIM6qQOMYu44RcbdTs4=;
 b=vXPEzaB5ym5Vrz2Ljv6+4zS5HJgg7g7mlZoHVwliMlXyMVzz0/rc6VZDvgI5644/rM
 u9gMNg3JwFeje26eHyS+ascdRHZs8+p31tpW1d5ACOa/lK1vW2SNUM/f5n5wbrSw+KN+
 AHEC92T0D3GgzYVmaFZXYDD3CZkZwuMCftnPnFDHOTQOehZESSxr8NfPVkoJQFHx3Nxm
 zT8c5Q1noLp7WFTDtf3BYr9g3SwcyQTPYFntqLNysHrglfBBZeiDrqGS86lQOQIclU32
 fhuWs67U5jP4kokXX90fbDZLG6q8qrCHz4xu2AbE1J8MIArPq8CSTwac6MDdqXUn9o3V
 OrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=udYZfRYde9RuoZ6aJDkOn2J2xIM6qQOMYu44RcbdTs4=;
 b=i3jZeFi0qWjQJfo6Gvvmi0XOCQ/vWQXwnrj5UHeQpeR9c4B0M3Ztj2YGvECImS2gNS
 MZ7vvoIoIKje0t/s8vib73BJ7bQsMOTcOG6ScLJEsfx5bKNJcLwTQkvji5nr02z8qlQZ
 l1xT4ze/vMXK2MKL16lOS1AVD5oxJ0whXBPdJ2lq0sQ+b8sVisDz3jqXZEIvEmIB15te
 38i37AU82seS1Zjj05qezFyZLp/7vb5QRyArGREirKg4dgAXQEO3Hp570nUH+tc1G6R4
 1eiRMLCx+EewV9HnT54yax83I0vlZRzGxMD+m8bWLhl+8tvlfp9XEvSjby2z4Y3N8W6N
 TWyA==
X-Gm-Message-State: AOAM5327O/HV2PJnW9KtKZ4EmuWpX7niUNeB8Lz4k8fWgvpo8r6j6Nt7
 FiwZXo/fmoUGeWSI8W8hNwISbg==
X-Received: by 2002:a9d:3664:: with SMTP id w91mr17715504otb.227.1607450505257; 
 Tue, 08 Dec 2020 10:01:45 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/24] target/arm: Enforce alignment for VLD1 (all lanes)
Date: Tue,  8 Dec 2020 12:01:08 -0600
Message-Id: <20201208180118.157911-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qa0PlL57aosm

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 18d9042130..7cb89b18e0 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -522,6 +522,7 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
     int size = a->size;
     int nregs = a->n + 1;
     TCGv_i32 addr, tmp;
+    MemOp mop;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
         return false;
@@ -556,12 +557,12 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
      */
     stride = a->t ? 2 : 1;
     vec_size = nregs == 1 ? stride * 8 : 8;
-
+    mop = size | (a->a ? MO_ALIGN : 0);
     tmp = tcg_temp_new_i32();
     addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
     for (reg = 0; reg < nregs; reg++) {
-        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), size);
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
         if ((vd & 1) && vec_size == 16) {
             /*
              * We cannot write 16 bytes at once because the
-- 
2.25.1

