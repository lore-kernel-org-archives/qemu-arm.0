Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2654670ejm;
        Wed, 3 May 2023 00:13:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ58qI4K5UgPhn7z9/Vxmo2QbkUTrWRxVLpwsU0pkOXI4Jr6ZDYcguV4FFQUBzJ0p52MGHGQ
X-Received: by 2002:ad4:5aa5:0:b0:5ef:8161:cb9a with SMTP id u5-20020ad45aa5000000b005ef8161cb9amr1763822qvg.7.1683098008286;
        Wed, 03 May 2023 00:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683098008; cv=none;
        d=google.com; s=arc-20160816;
        b=rFN+zrHCdKuRC8oc08UIcCv4MJafKSvMfYSRHUY/BFyZ8LtnMwk3y7GikOs9hoULh8
         PeNNlemIyRartj4F8AFL9CMc2taLyj9W5hka/+MCZHpKt/ESTq6Q1jrz+cUvVA1/qEkN
         wq/ijUzAICGAs/oF0dEVeuZRxZZMIAhmLmVBQr5+434QsisqX4Srk8sfET51D90F4+rG
         DB1ve0afQwySNBzpRAQySMxu8Lr7tGv5FoPohrcsED00yRBkBVOOvSKjKGtws7OF+BKZ
         l16GIBaeDMNag3n/z8tkQY+qmyDXrJYGSZilMRdJnUkme/r/P0jYQA3F2wGHEBuL511E
         /IaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5+Rgd6h8ypNJWz++9VNujvYl5qeiVkqzvRz2suad2+I=;
        b=Imgytsp+yvyyRsQbF43U4CAf13dY9/56GEHqr8ccwCaZA1I0AbynMlbr3Ep8+80s/F
         2t5GgQYexwReaiAl7zksFr9bAw6xWGvKhvlxvPbYPBklIGRNlaG5U8O6/V2jygjRdQHU
         StZn9TTqKNqJJ+mEf9SL+sIbMwNEmQJExExoTWujlm0+leXdATOqep1kxPdHEMfP2GeN
         RWpMEj662vgnGRtLanR5pg723fhgK6YLjdYwLYsgfPT6mbVwOj12+wY0RNs396mwrbBK
         usgCzTfQSWtqa2DRngGSDtNGaIQ5Raj/3HdpYsW26A25rbpVlFjNizP95apPsPCoxGWx
         Javw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eYCmvUQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jv12-20020a05621429ec00b0061860aece41si3601478qvb.252.2023.05.03.00.13.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:13:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eYCmvUQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6dw-0004wK-62; Wed, 03 May 2023 03:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dU-0002wP-3W
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:10:50 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dL-00071k-6D
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:10:45 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so30874945e9.3
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097836; x=1685689836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5+Rgd6h8ypNJWz++9VNujvYl5qeiVkqzvRz2suad2+I=;
 b=eYCmvUQ7jW+zifuuVm6g7CyarVPdggpG4tmso//8686ULorCizgcwd53eoCKRxT6VB
 tbEh7m7sVf5ANunCPxQE3+XWM9c+v+wocXRryH1DN0hToxkUmcxjC+ERWNJsQ+kqm9cm
 HDI4s12+4orfxFOSuObx8MozUPXXXRm7e/bv987BQatu3G/+y+ELEgW+KGnJVcs2SAPY
 svWpnL5RUUEdR92qTd5Dm2mM++KOO5ujK4ueMJXgsyUWMYql7GXFByLsbXI4vhQdLVRL
 KWYS1oH2WT4znWVh6LRkyRy61wlBncGZP4Gow9ITv4jZcejYEulP/4+DnrgE1nzNyjrW
 wO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097836; x=1685689836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5+Rgd6h8ypNJWz++9VNujvYl5qeiVkqzvRz2suad2+I=;
 b=QEQw5maLd11KQet9rLutRr76heMB6E1UGh6DfyF7+UJ3lXfHEif4OQnzDPLJC35Kor
 kFyJqFv5s7/ZCEeCWrQXDkDN0AAPO654yQZknwWaEfF8eUREI6AOBHqeRs4yLSknFxdd
 qz2wntfhJboSnuvG78RUH0s5w1f6oqFHTvl234pRbqHVwGoRJ5ABfxfPCzqa+8S1XxsE
 wvxitifz+SBQDIXKK8dTJ92Nm2//pkwHOIopq8VPjZ+WrcjlUXo6kvEhnO+Kn4eDV11c
 fdOXmdBwL1sBExX2cZKlVHSpEqEVazBihmznoV2U5L2que/UhcbNckFYLKBRZFsMbmW/
 CGrQ==
X-Gm-Message-State: AC+VfDz7ZT8LNauStQqPJ+632bLdU3kCrpxRg2nFKDaXXidSFkUfQ30l
 nHUHFfaXT5Muh30Osl2RK3w5cg==
X-Received: by 2002:a05:600c:d7:b0:3f1:93c2:4df6 with SMTP id
 u23-20020a05600c00d700b003f193c24df6mr13402268wmm.12.1683097836219; 
 Wed, 03 May 2023 00:10:36 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 51/57] tcg/sparc64: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:50 +0100
Message-Id: <20230503070656.1746170-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: O/ZU3SCY1BjB

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index bb23038529..4f9ec02b1f 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1028,11 +1028,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_bits = opc & MO_SIZE;
+    MemOp s_bits = opc & MO_SIZE;
+    MemOp a_bits, atom_a, atom_u;
     unsigned a_mask;
 
     /* We don't support unaligned accesses. */
+    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
     a_bits = MAX(a_bits, s_bits);
     a_mask = (1u << a_bits) - 1;
 
-- 
2.34.1

