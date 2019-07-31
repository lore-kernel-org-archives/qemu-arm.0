Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071182wrv;
        Wed, 31 Jul 2019 13:38:22 -0700 (PDT)
X-Received: by 2002:a17:902:42a5:: with SMTP id h34mr126042223pld.16.1564605502006;
        Wed, 31 Jul 2019 13:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605502; cv=none;
        d=google.com; s=arc-20160816;
        b=OV2kZEiTIbNhTBl3jpLvMWCJ9MzztHTbEsoI5ToHMQY0FGmPLfUgNwrPW6JR5H80Vz
         eXLzvrQ2sMoKB9i/ud7ildZ67c2nOEnztyRHCU482cClCFVQwOS4fUZPc6YbmfXlp2AA
         TPoZheFOZAToQA28TMUxczzMzuJIBYcB7AjCsveYpVf/MwMOrLB1idVpVOul3F6W2Hnb
         VKP4kr80L2Bp58pRsU5VBM2VwJ5iRanDxCZ+9SF16VEcptH78VAAxvL8lBP9NcxpyP26
         QuGkXtK9MuTTIFCRkUVEZ5vTKkr3whowxrfjmygbCFJHPqzPRnDOr/5BPHqfuG4ATbsp
         Vhew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hV2eslCkM9+11E22XGBDo1tPxuDz+vxwGvc3iXR5Q+U=;
        b=Z0y3xIf+axT3jTHUqTN0g8iHcqYncptfSgd/J77+coxrwr9YBN/mj0MoYlfTNvQUCu
         SKaujuaEhNR8/rFujO4SLuhKJVy2v2F10lYwtwhTKlUbv7spFmvosSSLkSh5ritTWu/O
         KpW2FthWv7nf7YqDgcwzVPDmQKoF/c/hOzXxBi56CCgXzi+zgrgPz4g+V8w3JR2McEHL
         Ap9qOPRCb2U7rRKZPKoGIPiCjII5zuBi/QDLpALacBG62U0TKCnaEt21TKkVrIFvCaMF
         BKmZYpiRdV4cV+KsvNcdw7UR9gkpFd9wrqffOum3aY4PIA1DFbZgPD7LFIWS1tXVSsx4
         xKQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNmCPw3G;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o11sor84171887plk.18.2019.07.31.13.38.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNmCPw3G;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hV2eslCkM9+11E22XGBDo1tPxuDz+vxwGvc3iXR5Q+U=;
        b=QNmCPw3GCuujd8LoT8j4bsCJSixD7op8PTLgNifr81NcecAEkA9d/fNMyHEA/3bPl1
         EiN7CzYJbcBQAHqYrBVOkNpnJWkTqJSNeZ+rlLVnDTfVsYVqMi6Yoj/q7Dvy59N7Vgtz
         mJka6IEPmGDCnUAb0ogeiP7XOzvbfjiupgMvRLVzS9MFGibnBjtyq+RPH6PzaiZzP+VN
         KDXE/qyFcvcXMHouwvNzY+Y6OKs/Dgp3aL0sDLLFm9HyDLG9FbXMbXOeCD2ysmSluVLi
         DXlO9v5a31ollQGNny6RsqgeupPNNtM234csP23pUHdMX+760AQ4e/E23fAmqvMfbJjl
         DLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hV2eslCkM9+11E22XGBDo1tPxuDz+vxwGvc3iXR5Q+U=;
        b=QUcqwuNZUVedJEk4wRDzZ3rqDGt9c/N3l91wo+oADQF93/VNgHqUyH0aKsJggl8EQA
         ZQKbd3VQvN00kHMSsdtrwf5M59Qlh38n/bCPM3nFrMb+gg85g8scKEfsBfHzgSBM5o1r
         UXWfNjEQbiCnl8/mjNDUFXtbtWRFads0/55D4lZAyEg7fPE1uByDeCyy/B4ZjcLYEJes
         59beIMoiwkSsdzUVCbI5m6mJXuqxYvMGfrgGiQg3FX9ij7M18SDv9TqvKG0a6m+xqvO1
         rxuf2n1dYv0TzJw8q1AIwe3599mKSJixA0aquHSKkM5U12eoZNLVuSyeyygM6bn+VRqS
         5cHw==
X-Gm-Message-State: APjAAAUEO1k2AOFaqTmydwpq/LvUtXoJrawoWK/Mdob3upgMQEA3VZcM
	28h26drDJwbg6QWXxPRzTIJVee+r
X-Google-Smtp-Source: APXvYqxOiDSAeJ+RBMLE5SPQtY//yIxMGzLsjoYBWLyI3JToLrJ4Or80Gl67YMLSVzHF3NPv+CWSVA==
X-Received: by 2002:a17:902:aa8a:: with SMTP id d10mr124813523plr.154.1564605501580;
        Wed, 31 Jul 2019 13:38:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 05/32] target/arm: Install ASIDs for EL2
Date: Wed, 31 Jul 2019 13:37:46 -0700
Message-Id: <20190731203813.30765-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xfPYkghMq7ad

The VMID is the ASID for the 2nd stage page lookup.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c0dc76ed41..65e3ffbb43 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3452,17 +3452,23 @@ static void vmsa_ttbr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUState *cs = env_cpu(env);
+    int vmid;
 
-    /* Accesses to VTTBR may change the VMID so we must flush the TLB.  */
-    if (raw_read(env, ri) != value) {
-        tlb_flush_by_mmuidx(cs,
-                            ARMMMUIdxBit_S12NSE1 |
-                            ARMMMUIdxBit_S12NSE0 |
-                            ARMMMUIdxBit_S2NS);
-        raw_write(env, ri, value);
-    }
+    raw_write(env, ri, value);
+
+    /*
+     * TODO: with ARMv8.1-VMID16, aarch64 must examine VTCR.VS
+     * (re-evaluating with changes to VTCR) then use bits [63:48].
+     */
+    vmid = extract64(value, 48, 8);
+
+    /*
+     * A change in VMID to the stage2 page table (S2NS) invalidates
+     * the combined stage 1&2 tlbs (S12NSE1 and S12NSE0).
+     */
+    tlb_set_asid_for_mmuidx(cs, vmid, ARMMMUIdxBit_S2NS,
+                            ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0);
 }
 
 static const ARMCPRegInfo vmsa_pmsa_cp_reginfo[] = {
-- 
2.17.1
