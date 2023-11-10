Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1320747ejq;
        Fri, 10 Nov 2023 08:26:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGceFaszqNevg/OoRGsxEGXBPkZScSaDq/Mx5CPeAcApQNJxT8BP0DxpVTURKvLvCvZucX1
X-Received: by 2002:a05:6214:762:b0:66d:1fcf:e1c9 with SMTP id f2-20020a056214076200b0066d1fcfe1c9mr8206305qvz.35.1699633570685;
        Fri, 10 Nov 2023 08:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699633570; cv=none;
        d=google.com; s=arc-20160816;
        b=FHv/1R4Dt2qUEOdmC4Ut9ikAtXB8Z6oEvz7VE9O5o7rXxDWJBxY7JJFUPwthsUX0gy
         ZoGeiSICNAuJeGjgVXyoFrlFlYAVz0BEfGCS9p6V9471yczlGMeAkGYoGTq9rfV6eHtP
         YqH2U2MFQTbnVdNbnYf+roE3NJ/o0wgV/a210pwcKEB9i7HzUYGjQwoCm2eokf8tfvv1
         luWgP1IcJ2a5sRHbWezDIVgwqeg+ePxCZGWT3UU/Jok0jCZq4GZiM1xnTnMtoF2awTim
         FW35mwXisi60jf6LVdMeYdAcpjJeyhrEpYRGC7CSs1K5mKd3eO7TUhRE6B3HLNccvjxh
         bFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Lo0s4E9VAyW8d5OaBWPJCklNoeQk2Ll0b3VfRkrX+V0=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=mN1IJdfAnfYpzepTEA8Z8LXiWY6TT2F/xOe3P9yK4XMbGUn9YYs4sB+x/eZJhsq9rI
         ypWoixqVb+QAS0G8dCgjrzxetA41lZ+/rF7RWs3/ZpJMFmVhARZRA1VJzPUKTZ/Zr5Kx
         860r+JEDCzL7BW1TGUbn0I5sjulj5O5y1vKlJuzjAsvhS4htX0/7gi8Gw53188Mq7gWa
         H4g1BKUp4aL0lmiA9B84ZJM+bHV2lCQHgSpkZWGSuTxIQqZc5yvzPE+U+X+YtNW65nn5
         N4WnYt1bfhDvPGbrQhUrxHJlTNQ3TrlZlcTF6QHkIlMiLkQN9sXrM7jvdLz3ljtarohp
         JDhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UyDcVVoX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5-20020a05621414e500b0065892c14203si4746497qvw.412.2023.11.10.08.26.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 08:26:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UyDcVVoX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1UKR-0001O3-Ap; Fri, 10 Nov 2023 11:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r1UKP-0001Nm-Ju
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 11:25:54 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r1UKN-0006ec-B4
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 11:25:52 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-407da05f05aso15496325e9.3
 for <qemu-arm@nongnu.org>; Fri, 10 Nov 2023 08:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699633548; x=1700238348; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lo0s4E9VAyW8d5OaBWPJCklNoeQk2Ll0b3VfRkrX+V0=;
 b=UyDcVVoX34e0qcfZDVXVQRE3cOUMN/iOer3CIyNpXRsHeJRT/stMiJKb55MV026Hn/
 kjMG2HtdpHpXu24K/NhmgThwJx/PVyv/XbgEHyWRwwCFigxfhjaYq5Fd72rhama9RzpM
 dE+j/I8Iy6yY1m+ud1zIFhqmRpAHveiQFdo0oiXa7gjrBvEQRQM8yFy7wHvVtlGsT2cU
 Oid5lW09ei7ac17ORx3JWhXE+6tMyhiZIapobw/fJyIGXl4dl43pYLmmy8NZp25aHwZI
 O++s7F+Z5MXuy8si8AjMPRKUSTRcjRQVDtZ5b+3PjRGpIV4kd7aFfJWb0CaUu0jOIQ2h
 aZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699633548; x=1700238348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lo0s4E9VAyW8d5OaBWPJCklNoeQk2Ll0b3VfRkrX+V0=;
 b=ZJt3uUbVXV1tY1904AspkLv/FavsbWPx+XN+bUcAjbBUP/FDewxAfL0QZynvfiWu82
 1yI0FzH+x+MtLa40WXrFBaA10WAGJmbx3YzJZ1KkyTQ3aJ4UZBMzjqKZueyGSQqs2UXP
 aoAWA5CIPoVFaL9yL+Xpuzkjzlq+fVHuCm+MoCmSt0nUy++QkGmVNr+y/+Nq6e1Uhm12
 TeKw7ihzm1gCN0m3jzf7FGAmDFNHrRocbD44IIzpP1W0RsNOJmfVEk0JDg4Sbb/x3tu2
 ZsOjbafuwFrTfbpDHKfJs5WqhRNHUvgMHBLCKQZ/M5kd/zQ7+QG2i7Hidf2Tn050jqIi
 Lqig==
X-Gm-Message-State: AOJu0YypRS1fA5eBf1AwSPKBbgQl8m+8EiTVIYOXblqobt01Nd4sP6vp
 6z7Xvfb4PItpn64ORzEQy8sZL8ZTWZ4j/mxSSEA=
X-Received: by 2002:a7b:ce96:0:b0:409:45e6:f8e9 with SMTP id
 q22-20020a7bce96000000b0040945e6f8e9mr7260809wmj.14.1699633547835; 
 Fri, 10 Nov 2023 08:25:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a05600c470e00b0040a47091602sm1934183wmo.31.2023.11.10.08.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:25:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Correct MTE tag checking for reverse-copy MOPS
Date: Fri, 10 Nov 2023 16:25:46 +0000
Message-Id: <20231110162546.2192512-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: xP8WgKVkpRac

When we are doing a FEAT_MOPS copy that must be performed backwards,
we call mte_mops_probe_rev(), passing it the address of the last byte
in the region we are probing.  However, allocation_tag_mem_probe()
wants the address of the first byte to get the tag memory for.
Because we passed it (ptr, size) we could incorrectly trip the
allocation_tag_mem_probe() check for "does this access run across to
the following page", and if that following page happened not to be
valid then we would assert.

We know we will always be only dealing with a single page because the
code that calls mte_mops_probe_rev() ensures that.  We could make
mte_mops_probe_rev() pass 'ptr - (size - 1)' to
allocation_tag_mem_probe(), but then we would have to adjust the
returned 'mem' pointer to get back to the tag RAM for the last byte
of the region.  It's simpler to just pass in a size of 1 byte,
because we know that allocation_tag_mem_probe() in pure-probe
single-page mode doesn't care about the size.

Fixes: 69c51dc3723b ("target/arm: Implement MTE tag-checking functions for FEAT_MOPS copies")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/mte_helper.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 70ac876105f..ffb8ea1c349 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -1101,10 +1101,18 @@ uint64_t mte_mops_probe_rev(CPUARMState *env, uint64_t ptr, uint64_t size,
     uint32_t n;
 
     mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
-    /* True probe; this will never fault */
+    /*
+     * True probe; this will never fault. Note that our caller passes
+     * us a pointer to the end of the region, but allocation_tag_mem_probe()
+     * wants a pointer to the start. Because we know we don't span a page
+     * boundary and that allocation_tag_mem_probe() doesn't otherwise care
+     * about the size, pass in a size of 1 byte. This is simpler than
+     * adjusting the ptr to point to the start of the region and then having
+     * to adjust the returned 'mem' to get the end of the tag memory.
+     */
     mem = allocation_tag_mem_probe(env, mmu_idx, ptr,
                                    w ? MMU_DATA_STORE : MMU_DATA_LOAD,
-                                   size, MMU_DATA_LOAD, true, 0);
+                                   1, MMU_DATA_LOAD, true, 0);
     if (!mem) {
         return size;
     }
-- 
2.34.1

