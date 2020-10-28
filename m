Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp786812lfa;
        Wed, 28 Oct 2020 12:18:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8hcCLA5+HiXYiqgsSkXtlGuSpYasPnfmY3p5seWz+C6+r8RaHb9JnCgqB7aw19Emtq7jO
X-Received: by 2002:a25:24c7:: with SMTP id k190mr979832ybk.483.1603912687608;
        Wed, 28 Oct 2020 12:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603912687; cv=none;
        d=google.com; s=arc-20160816;
        b=C+g7R0S6cFyGA6aeoL+wjL5A1Plrh9r66IT20HAKdyHmfwWLUR/+ybCb6ZFqhHsYpm
         tRI5TrGR8rWy281cBzobaySE5UrlP3UCKNQAvLXv+D+xbWbZm3x5QFMVyHIYfuVAYXPN
         RAic94ans8w/cHqIc8/uvtbOCG8KDK9UeA9aRmVlWU/W08cDcAf22ln/a0HJKzxd7h5m
         fT1puwVMWFMsNF6c4lApdjGS3HznX/v1E/JNC12pUG1zfieCP201AJ2vZbkMLgEBEpNi
         m27Ryn8R2LGEKVl8X+o6VZROK/EGLLX1EyzF+dlt2jrQltbQgfdXO6CxlCHRrL80PDR5
         PlzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=U8T+0Mhujpk/WaABXyjdAKtr18CEtiJsfJ83860ndlw=;
        b=VAb4FCM7BgWpTiyrAQUxeLsPwMSF8O1PfDfPY/9hl5D+C7P3sOUzEWOSx2mH1xASJK
         1XPxOvtrPWxjkujn3zbT7SqEzFEYQ/EruQtUcT35Z1rgnt+iOC2vyAPUUtDihLJBNplG
         4D9pxEwrnqZHD40LlhGJPBDOWDlg+YWqvOybjIu67dbfcUfFQB0qUiFz3BwZFBGIRN1N
         bh9maBOv4y+8InZ6vRt6N4+aEi7ppCymV6kSlvukQbatMclxj3bXuLRJwBu8bii2T3iq
         1O8e/aOhakE2o5Db3oPPfvI9lrNM4suRcW0u/ZZL09Wgk839+U0ReStt8Kh78067rq66
         KKig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e5Wv2uGm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x130si544398ybx.179.2020.10.28.12.18.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 12:18:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e5Wv2uGm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXqxS-0004kk-Ut
	for alex.bennee@linaro.org; Wed, 28 Oct 2020 15:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXqwo-0004id-FY
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 15:17:27 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXqwi-0007aH-1S
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 15:17:26 -0400
Received: by mail-wr1-x444.google.com with SMTP id t9so245914wrq.11
 for <qemu-devel@nongnu.org>; Wed, 28 Oct 2020 12:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U8T+0Mhujpk/WaABXyjdAKtr18CEtiJsfJ83860ndlw=;
 b=e5Wv2uGmUQoaPNakhRk+lH2Cndq0TGY1ZNc2JfsHuR9bCyrh/u5UhZms9GZpnhBrrC
 f0B9EK3ToMmKqQjGYX84NcOUJG+FN2NtUA4iH9+CE/chQEOpwPSRcTrbmpNYXgiSRS2Z
 A+AnhqzxGFFlfh2yurriIzhFKF+9O+M2KbnKldNOgPWN/OW0y1EiMCcs+06+wE7PwFaB
 Mqmm1f/mbuG8r6OgNd/LFPx7xf66YC72crcKMs8XHqFMZVSrgX4RAY6ntu1ydZGjUSYs
 rJyMzSeR8vmJSJi7pXv4QppPKl1SV5rGd2vgvXgPPEHK8Ccl2W+Ht5h/HdDNuxPHqJpM
 3YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U8T+0Mhujpk/WaABXyjdAKtr18CEtiJsfJ83860ndlw=;
 b=oCANLtrN+UxWnuD5cyN114SXlqi1qMIv+Gl19R9B+75L1JiplA4CmzALpCZ3MHbdqB
 /8DzUnAVU9BsOCI6ng9BdfQZXGB2LQGiLW4sgnSXqyhJNvNwnEKOeCWkpTH85QiTyJaP
 k7c8rf4SB73uxdxcl/QQjP5wXu6h8AlS3vGE8S6hdsVamv3de4/oe3nbi5BxMeCFBrBg
 OMWHzw57V6xQ8wh8k6IytJBGsojtgtIMfNwwFf7hdM1zuwWAdyApOwHvPGLuqKTfoQX1
 s/XQWNcyiIKUj+x1LVMMBCwB3Vg3BzOT4ctRVwWjQ7JlLllV0u2o2PVtjHZATIrUqNZV
 0nJw==
X-Gm-Message-State: AOAM533obG/lOdjfFwdg3veTMLh5whA3vodGFELaMUJaauJkbfjn6mLM
 R7EYtwWik8NEXHuLbrbd6FZDdUnE9zIgCQ==
X-Received: by 2002:a05:6000:1051:: with SMTP id
 c17mr931493wrx.290.1603912637519; 
 Wed, 28 Oct 2020 12:17:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l16sm743953wrx.5.2020.10.28.12.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 12:17:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/arm: Fix VUDOT/VSDOT (scalar) on big-endian hosts
Date: Wed, 28 Oct 2020 19:17:12 +0000
Message-Id: <20201028191712.4910-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201028191712.4910-1-peter.maydell@linaro.org>
References: <20201028191712.4910-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8HroAMvpK0Hz

The helper functions for performing the udot/sdot operations against
a scalar were not using an address-swizzling macro when converting
the index of the scalar element into a pointer into the vm array.
This had no effect on little-endian hosts but meant we generated
incorrect results on big-endian hosts.

For these insns, the index is indexing over group of 4 8-bit values,
so 32 bits per indexed entity, and H4() is therefore what we want.
(For Neon the only possible input indexes are 0 and 1.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I believe that gvec_udot_idx_h and gvec_sdot_idx_h are OK
because the index there is over groups of 4*16-bit values,
which are 64 bits each.
---
 target/arm/vec_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 30d76d05beb..0f33127c4c4 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -293,7 +293,7 @@ void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
     intptr_t index = simd_data(desc);
     uint32_t *d = vd;
     int8_t *n = vn;
-    int8_t *m_indexed = (int8_t *)vm + index * 4;
+    int8_t *m_indexed = (int8_t *)vm + H4(index) * 4;
 
     /* Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
      * Otherwise opr_sz is a multiple of 16.
@@ -324,7 +324,7 @@ void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm, uint32_t desc)
     intptr_t index = simd_data(desc);
     uint32_t *d = vd;
     uint8_t *n = vn;
-    uint8_t *m_indexed = (uint8_t *)vm + index * 4;
+    uint8_t *m_indexed = (uint8_t *)vm + H4(index) * 4;
 
     /* Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
      * Otherwise opr_sz is a multiple of 16.
-- 
2.20.1

