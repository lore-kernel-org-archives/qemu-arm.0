Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1279101lfm;
        Wed, 17 Jun 2020 22:01:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypkhlKj3CofkTAvBVazjzNZctjnIwgCPKYRCVUTkXwh5YBdrQByVrERrww0uzmRbMzhZjE
X-Received: by 2002:a5b:14f:: with SMTP id c15mr3661602ybp.469.1592456468177;
        Wed, 17 Jun 2020 22:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456468; cv=none;
        d=google.com; s=arc-20160816;
        b=lYMU4Hay3BUOn1DqUGa5aO8zhCG77Hy2SVDUFMt53EinfrU7bAIxEwq9S9BpkVYngr
         xJfA5yTq/Ve6wcNFuAPU2GOerU2+eM9hhJgNc36+O8TlAjW2kKWV2XykdmJirOiorFcK
         FpMS1Sm4o1P3u9wNkCYbTlCB5upnpzJHbL4tbtgZccZnr8buipmYyboNGKnI/D2otSV4
         tGi3P4oMX5smqmjrzgT3B1rLmGCmRLcJ5xIP76E58WCNtNrOurtiA/RAXRgpdKCpAISq
         mWRhBl0TvZi3rQMBEQXhPT97abnlhDa8UcYNT++rDPlja2h1ve+qHprYMDbU89cHs2XE
         RWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GAkIUDgO8V3oOvXo3LsF2MLgsc+DjBVXnodAscreOV0=;
        b=JhjYMide6IY8zLiIVaF9zfXRX8eYkRXjvibuhur/pnNPioS76n7R/TUXdd9bWPNmwD
         bw79/FwdjSt6sxSbFHq7dpqMy3THiywEwyLrpvr4rg0m2gJYF9NJKPixF9hXZ+gO3hHf
         DYYEkX9wQhoWwVbekrs6CI2YE7x5zKvs3kyH+ldD5jQ6F6m3tfwKTL1zYMaWXOwxLyNA
         57EGP1y7JVidzMf/uJGICbbHzBzJFRWBHF9p+btYClXYfST4TXV1zO0s4gzl4baorwtX
         o2TUxsa/dfi/UM6PeMTEoGSrRomvVZNuDztlJsh+8WL+HwA+p/MdFf2JtfbzMIXOZ7Xo
         XS8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h+31fxzO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i145si1598919ybg.350.2020.06.17.22.01.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:01:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h+31fxzO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmfj-00055W-Fu
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmDY-0004xF-Rr
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:32:00 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:50190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmDX-0003Pq-Cs
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:32:00 -0400
Received: by mail-pj1-x1044.google.com with SMTP id jz3so1973289pjb.0
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 21:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GAkIUDgO8V3oOvXo3LsF2MLgsc+DjBVXnodAscreOV0=;
 b=h+31fxzODWT3ozuK8AeBDCzL72dq4Z/NeHnB1iLzi54oBJGaHNW4RdcdUXc+0RyV2f
 gMvVQyj7RXDpfsbJ1NKuVuoWb/3sBwnTeLmHNPZu5IBcwOXnjYyKFLN+wLGIe7odgpyg
 X9eYaZaza/uuvoTVpj2XYbiv6TagfRNSfbxJ4IYiwCtksHBEFea7mExIh47B3VbJKPX8
 vsJGtQtzrUKY20Yao/qSssyI9egnIFfEaIUzmeN31rxS6zZ3dUCHr2L6cnOL0Zlnzp7V
 wFGDLpBk0BH2/GW3n4NBNQAWnhY9YEVmABuxsxKnbN4AcVZ5kMwIbKe89R3NiC7+mXL2
 BbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GAkIUDgO8V3oOvXo3LsF2MLgsc+DjBVXnodAscreOV0=;
 b=pT+iZ2GwtLyV1kZKoVefA4WGEL5fL4E8WB7yj2lkxShy766w5nlQRuX2JTLVKnceYq
 sYac1PFONpXqJY11zvGvAhr7sTM0rhe7RCsaPAP81YbPhTsypFd3lH7rrYc5JMTHevMD
 oJqPFPRMCOOfVrL+qqpAx1M16hQ1ofjq+tvfFn0SmeaTqZwzCEnHCA1WaEGmP9XY2tTa
 IomvRHIxwPmLHslXIHAKUvfwBM0gFdGQixlVH8bh4V5hB6SGjgZ1gAp6jUw2rUvLBn7W
 hsg4yVO5g+3vUa81pk6Fts1ZjhRBQYQ3a5aMYERA1iCuZUAK+NNWv0xJbxPfrdrmcDuH
 CzJg==
X-Gm-Message-State: AOAM531gB+o2ThspGjZ5CQsa8cqkikUgrIv6dmurmiB0d1Qdci1J6KbM
 4WK/U2Eqp2Mok4di5h/RyPBs3mmFh68=
X-Received: by 2002:a17:902:9f8d:: with SMTP id
 g13mr2138887plq.292.1592454717796; 
 Wed, 17 Jun 2020 21:31:57 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s15sm1162840pgv.5.2020.06.17.21.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:31:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 072/100] target/arm: Use helper_gvec_mul_idx_* for aa64
 advsimd
Date: Wed, 17 Jun 2020 21:26:16 -0700
Message-Id: <20200618042644.1685561-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ry1TevsogTda

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 341b11f98d..a3135754ce 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13037,6 +13037,22 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                                data, gen_helper_gvec_fmlal_idx_a64);
         }
         return;
+
+    case 0x08: /* MUL */
+        if (!is_long && !is_scalar) {
+            static gen_helper_gvec_3 * const fns[3] = {
+                gen_helper_gvec_mul_idx_h,
+                gen_helper_gvec_mul_idx_s,
+                gen_helper_gvec_mul_idx_d,
+            };
+            tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
+                               vec_full_reg_offset(s, rn),
+                               vec_full_reg_offset(s, rm),
+                               is_q ? 16 : 8, vec_full_reg_size(s),
+                               index, fns[size - 1]);
+            return;
+        }
+        break;
     }
 
     if (size == 3) {
-- 
2.25.1

