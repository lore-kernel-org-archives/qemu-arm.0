Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2660877njc;
        Mon, 18 Nov 2024 07:25:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWCPjHphz/2TqazuuH4GIiEQJmUWMZUDehCzLzaukAIYRRCtKP6B8ngcq5Qtugd82EP61wmMQftSRhGuA==@linaro.org
X-Google-Smtp-Source: AGHT+IFfpPvkJ05zGBAbF2Y3fsj9+tz699Tn0NKzW9Tf8cEhwDZVeSiD8f9uhgnlRD6Ngr95pAFL
X-Received: by 2002:a05:622a:2993:b0:460:bba4:1efd with SMTP id d75a77b69052e-46363e97452mr148934581cf.35.1731943558802;
        Mon, 18 Nov 2024 07:25:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731943558; cv=none;
        d=google.com; s=arc-20240605;
        b=K9zraFNFWUL5nwc8zTzGyO79sTZ8kELP15GxlLIw3k9PcvI1aAxUxQT9t2Dxk6om2Z
         PSEMZZai8KYQC7jTeaUSRF9X+QGCiEyNZRy/9cPnvVD1usXc2SnP6HnE2UAlOwCGOWCy
         IrGT+qgG9c1f9Rd9CWfX+6HEaU6hYITUjtLSbzKnSH9RtAHtc0fMkXsHchZx8JIlcydi
         qBo8l2gNNTSVU7M8hJn2wLIWp3A2nooxe0V17XN5Pk8zdbOVTBiHO/JSqWEZI5g0PFpk
         1IOLxMLXjAV3E8SgsYvQRRoHPayd+rnytWZuKCVSe5U4XLssAGlmNnrR/ItuS7lpsjdJ
         e7zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=akSdSGiRTfyLnN0cC+NRUPJFGXfzjIlmKD+aKjcrBGM=;
        fh=X0KuuT9IACb2FY68Q6cm/aOJy+edGjFpokROxRULzPE=;
        b=ji3yu7aJ6wz++SSBxmywL6tzPn07TuvEbDKd1uAvXtylpUCCZq+nBYLGaHVfvuCckx
         Jcp14bgT7I6eiO53YFxtZPg0x2b3ZvlxypIixRBIyQmh8RWmCckswDgwqdfreuMlt8VP
         XLezJ/HsossE6+QG/dOqO03gjTHZTFc62H6FLzJfaNJPQPXktnec9Bx20zL7Bb/SY0Qg
         UBs2N8U75TPBWWCmQ6ifEFCwCqiNKJi/+9OW4MytEb0Le8c50rcGdQLRW4YEH33ZfGjF
         Wlh2LCQxerlmeOmikmyB9wdK0J+siTjBbnKDxP1e6vobAZa4D7tvG/w6E4TjuOHJcvkc
         l3rQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wl1Iq80K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635ab734ddsi105437321cf.643.2024.11.18.07.25.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 07:25:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wl1Iq80K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tD3dC-0002pJ-NP; Mon, 18 Nov 2024 10:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paskripkin@gmail.com>)
 id 1tD3dB-0002oc-7p; Mon, 18 Nov 2024 10:25:37 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paskripkin@gmail.com>)
 id 1tD3d9-0004b5-Bv; Mon, 18 Nov 2024 10:25:36 -0500
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2fb51e00c05so24456001fa.0; 
 Mon, 18 Nov 2024 07:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731943533; x=1732548333; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=akSdSGiRTfyLnN0cC+NRUPJFGXfzjIlmKD+aKjcrBGM=;
 b=Wl1Iq80KdRduFpRZvJwfGjVIqkd0SH7cC7QG7x2ExupnUu9meT0LowH0cABu/6vMCh
 b2ZDfQa+HuF2GAE9F4DS5g9Z50yMYEEtr0FkS4F+miZURX3HqIXL11Qt0W909EE18cvo
 FTUXsyaUhv5SGV/rj5X9gTcd76MHIJ9bUrMCqvdN7V0Gi143qun00MTM+0JYNwFVx2he
 UfHEl7wYwQ+zqiwNJRVklmQrLQXcBYIcEFvHHYcCMUpzFEzVXKeQZPXPPjiloN4AtfyQ
 prwcrK8f48cNkkCJWgMF1V8aCubVeh9wlTVdntNe/Oupq4hhIVO9MFf1yE2ybL8CDPNb
 mi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731943533; x=1732548333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=akSdSGiRTfyLnN0cC+NRUPJFGXfzjIlmKD+aKjcrBGM=;
 b=CZwo6YV+ejiwBmrkW+YjUoQmN8tiRpyLMY8BStMJkRq4wL5U7An2ucucF5gj5D5CwC
 SvIohUoVCAMxMFy8Ky4LURcy9df/tojmh8Lw6CmGNbTAzBFKTzarj8ckVXz/1wtj1ZgX
 Kz0Y4RIZV+fguqN1ZyCJl1EvjqOyfXSMpkP32tFKjcqpi3Mbz5y8imYImiokXN5hVorF
 nmdYue79rGQzYYa5WhC1hCyjQ5MkK8OPSrsNVWRPg2GszluRpnUFYuAzlKz5I2EpbUgQ
 BLrLTwinRg8ezLWQC6t/11uFT8sWyn/6WEiUWmVAcoIADNJYUiD15NQFcMsU0IqE1j/1
 z//w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF5zz7KjYlUe4TKedhE3//9SR0oACv4R8gTFiZnKmYIfybLc21qYwzbOtiA3WXJPQfWBwnLmZS7wfn@nongnu.org
X-Gm-Message-State: AOJu0YysVl46n4caYttncrR7+VdeQjIhreTGxpPjy+QEmMgBUIi0oDUQ
 uIU4zmkSgSkP/6G7Rx1ZVsiQyJlUnHJQT4e8tTTKGbupmvgRc48ltx+5VySl
X-Received: by 2002:a05:651c:50d:b0:2fa:de13:5c34 with SMTP id
 38308e7fff4ca-2ff60661742mr90143831fa.19.1731943533102; 
 Mon, 18 Nov 2024 07:25:33 -0800 (PST)
Received: from fedora.. ([2a00:1370:8180:90b:d00f:257f:ffb:ac70])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff69ae7fb8sm9498981fa.87.2024.11.18.07.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 07:25:31 -0800 (PST)
From: Pavel Skripkin <paskripkin@gmail.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v3 1/2] arm/ptw: make get_S1prot accept decoded AP
Date: Mon, 18 Nov 2024 10:25:26 -0500
Message-ID: <20241118152526.45185-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241118152507.45046-1-paskripkin@gmail.com>
References: <20241118152507.45046-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=paskripkin@gmail.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: A8JoA3pWRswb

AP in armv7 short descriptor mode has 3 bits and also domain, which
makes it incompatible with other arm schemas.

To make it possible to share get_S1prot between armv8, armv7 long
format, armv7 short format and armv6 it's easier to make caller
decode AP.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 target/arm/ptw.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9849949508..86d6255713 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1357,25 +1357,24 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
  * @env:     CPUARMState
  * @mmu_idx: MMU index indicating required translation regime
  * @is_aa64: TRUE if AArch64
- * @ap:      The 2-bit simple AP (AP[2:1])
+ * @user_rw: Translated AP for user access
+ * @prot_rw: Translated AP for privileged access
  * @xn:      XN (execute-never) bit
  * @pxn:     PXN (privileged execute-never) bit
  * @in_pa:   The original input pa space
  * @out_pa:  The output pa space, modified by NSTable, NS, and NSE
  */
 static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
-                      int ap, int xn, int pxn,
+                      int user_rw, int prot_rw, int xn, int pxn,
                       ARMSecuritySpace in_pa, ARMSecuritySpace out_pa)
 {
     ARMCPU *cpu = env_archcpu(env);
     bool is_user = regime_is_user(env, mmu_idx);
-    int prot_rw, user_rw;
     bool have_wxn;
     int wxn = 0;
 
     assert(!regime_is_stage2(mmu_idx));
 
-    user_rw = simple_ap_to_rw_prot_is_user(ap, true);
     if (is_user) {
         prot_rw = user_rw;
     } else {
@@ -1393,8 +1392,6 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
                    regime_is_pan(env, mmu_idx) &&
                    (regime_sctlr(env, mmu_idx) & SCTLR_EPAN) && !xn) {
             prot_rw = 0;
-        } else {
-            prot_rw = simple_ap_to_rw_prot_is_user(ap, false);
         }
     }
 
@@ -2044,6 +2041,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         int nse, ns = extract32(attrs, 5, 1);
         uint8_t attrindx;
         uint64_t mair;
+        int user_rw, prot_rw;
 
         switch (out_space) {
         case ARMSS_Root:
@@ -2110,11 +2108,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             xn = 0;
             ap &= ~1;
         }
+
+        user_rw = simple_ap_to_rw_prot_is_user(ap, true);
+        prot_rw = simple_ap_to_rw_prot_is_user(ap, false);
         /*
          * Note that we modified ptw->in_space earlier for NSTable, but
          * result->f.attrs retains a copy of the original security space.
          */
-        result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, xn, pxn,
+        result->f.prot = get_S1prot(env, mmu_idx, aarch64, user_rw, prot_rw, xn, pxn,
                                     result->f.attrs.space, out_space);
 
         /* Index into MAIR registers for cache attributes */
-- 
2.47.0

