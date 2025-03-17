Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2284755njb;
        Mon, 17 Mar 2025 07:29:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJ99cUi4ERsS3IKpYpuHUtX4BjUQj16OuONL3larWeL9ji1Mxy7JJq7GWaXUjI9hdpe3RF2cs2ADKuXg==@linaro.org
X-Google-Smtp-Source: AGHT+IGlw2HG5Ok+DCQY7bRxf9g4BLSKb4U+1Tqoa6hqprV32jS8oQHO2i7N5MR1/6//cpm0OF44
X-Received: by 2002:a05:6122:210e:b0:523:91e8:324c with SMTP id 71dfb90a1353d-524499d562dmr6967270e0c.8.1742221791695;
        Mon, 17 Mar 2025 07:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742221791; cv=none;
        d=google.com; s=arc-20240605;
        b=lrnD8tAhTNMHr4B4aVpivyFgnAbL5GLztt/IoQFVQvR3Y0erdgp4mlbHdUM+PhOCV8
         Ow2Nc+dM2tM+MSiHOzJLXIReZ4rkhcnL3cqSB/bcYqnmaixL/z44P2BW0g/AVI9i5VuX
         cgAi4uxuPq5r1tK/mcSoupjYGn4lItfe8LHXjS/eaHFNr8BOQ3aV/7KAHe1DfM6gdilA
         VKwOlKGh41qbX6D6iP5XPNC8W2tUMYcyt2WvDl97FZx218RG1wqQ+fv5hxLd8Bq3sONq
         38djHqchhcVaxInDcDGhyYlDm/4xD+65Zy2j/4+aD+p4ylrQQrXxDdR3FcyFOsO7v2wI
         Ba1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tYj3G1szAGFvKi0B3MWQ+0XMe12lN1gxPElsZir29Jg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=gUqcEbKeeC2S/3p9Tbqppbt+euTlwAiliVNA3sgtmiXcxb+u7Eo25LqkKpZle9NYsB
         Cfnw4q5lLaWvmnYW6bnFko+F735Nv1UODGyOiMCjh+ZS/1Hu9qtrOdyEXb4aJ4HQKaz/
         fZFkac5f2dUvgTthtrJqy+crms5qrn0lo1uZzMlC6m6uFyxAWx+vPPRp/TuWh96bWajo
         SMhtn4e8LZ6TY6c5A3PZfUm2wfR2NQTUHcNk4sriv24puXUFJ0fjDbmHuMIYiOYMhQ87
         iWBo7a7iK/q9q9angXdxkplFY2W5izvkaKbFqUzydz76k+6Ca2wcmLcoAL2K9NfdGvoR
         FwCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b3XIUzhU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5243a7027cesi2589920e0c.217.2025.03.17.07.29.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 07:29:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b3XIUzhU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuBSM-0000mV-Qn; Mon, 17 Mar 2025 10:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuBSE-0000ej-Q9
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 10:28:34 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuBSA-0001BO-GF
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 10:28:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso14435425e9.2
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 07:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742221707; x=1742826507; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tYj3G1szAGFvKi0B3MWQ+0XMe12lN1gxPElsZir29Jg=;
 b=b3XIUzhUe0vQRqU+ffWKcVh4kDU4rMY4cf0/8+JNq3VTxOTB7MWCAHrGxKRPx4vQx1
 EkHPCRDbFmGScneDxVq+ZLRlUeThYtpDRJdQ8OMhgMfLJQ44un/UjUuteDucl3YJo6lv
 ooDJuaIozPXtGdjZOHTUQugX7zo1fpm8DH4SYekbi7PxVoSHuoRHwaXJDFolyhcHahFy
 Z0XwgJ+wYWEodJY6hZIGt8/u8YE0ILIbSMWCJbmXTYnDm16cn/l2i+Lp9KH8snurLNre
 WbNvLvwMKTvDYjjPYuAukdgt+YmKuE77NrY5kBilIPX3urrpC89BY4TXQl8f47og+C/I
 2bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742221707; x=1742826507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tYj3G1szAGFvKi0B3MWQ+0XMe12lN1gxPElsZir29Jg=;
 b=Mg/FgYL2kOlFizm+Py5EWBpbj+BTTTTbnaBJhUeNVMavJBVMShhD3EoC5evXiWACtR
 doSOK5BWZtHdzP9azkM/V/TmAVChju1iLjtY2AbhjBDylgye0hBWi50THPDJ5+FG2Nth
 BNoMvazz8dQdl+SSfL2v3mqX2lpy/dkgaYXJKri9c7Jf7G9w38/RHPg0a3dGUVPztZip
 YFykoOjNu14+robZVxNdYtZCb7W+iTLKscELk0HCZkSbymM+U+Kuy0Ywu7o7QLSHx8z9
 aRu4cSJymIodXj818VyzqaYsZhjNa2UisvKaH113Eg8GQyrRBeWB3duYq40tcyd15YBt
 OSgQ==
X-Gm-Message-State: AOJu0Yy2k7VSQ7XIIhDHRX5WVLTe6UZ82ftt7cNEPPyGhDpk17zqSiPj
 oTN2gZV9IVwx97/7XvS9/8NCEidV0dFCnTZaZJILKTqyuZasioHmiXbH5jWcWWoWUroFoKKsMoo
 W
X-Gm-Gg: ASbGncu6xaxRQCdmUc3KHqPzudDiNcz1RZOWesAbwIWCdlPpB5p1ptU2ap5ZU4U4BDZ
 hwKnv9bvARuTCYujvQUYhIVDZbtHXg2R/AmELprLgJXRQO5s5df18AcfS8Rzvy0+F4kTNWtHXIk
 ONwfJYknj+z7bDw/t9+XSGYodiHSdBUDt2KXKzzjBLTRvIuUIse3VEdFBT9MF7+akZb9Dp92Fn6
 wXM/OnJd6lC4gQ6/0FH0VQAXj8ONEw7qbWgVKn63/oV/vaJJj1iwhgCSAWXyjt0YGNLISPYzOLp
 zThRRQy9u2AVTKrrhkU5RPwQz4bUq1XRgNyHOLZBm78P4WblvpM=
X-Received: by 2002:a05:600c:3146:b0:43d:db5:7b1a with SMTP id
 5b1f17b1804b1-43d1ecb33b0mr126241885e9.12.1742221707629; 
 Mon, 17 Mar 2025 07:28:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe60ad4sm107914985e9.29.2025.03.17.07.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 07:28:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-10.1 6/9] target/arm: Present AArch64 gdbstub based on
 ARM_FEATURE_AARCH64
Date: Mon, 17 Mar 2025 14:28:16 +0000
Message-ID: <20250317142819.900029-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317142819.900029-1-peter.maydell@linaro.org>
References: <20250317142819.900029-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Upmf3oz1vwoF

Currently we provide an AArch64 gdbstub for CPUs which are
TYPE_AARCH64_CPU, and an AArch32 gdbstub for those which are only
TYPE_ARM_CPU.  This mostly does the right thing, except in the
corner case of KVM with -cpu host,aarch64=off.  That produces a CPU
which is TYPE_AARCH64_CPU but which has ARM_FEATURE_AARCH64 removed
and which to the guest is in AArch32 mode.

Now we have moved all the handling of AArch64-vs-AArch32 gdbstub
behaviour into TYPE_ARM_CPU we can change the condition we use for
whether to select the AArch64 gdbstub to look at ARM_FEATURE_AARCH64.
This will mean that we now correctly provide an AArch32 gdbstub for
aarch64=off CPUs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a14c269fa5a..a18d87fa28b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1694,7 +1694,7 @@ void aarch64_add_sme_properties(Object *obj);
 /* Return true if the gdbstub is presenting an AArch64 CPU */
 static inline bool arm_gdbstub_is_aarch64(ARMCPU *cpu)
 {
-    return object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU);
+    return arm_feature(&cpu->env, ARM_FEATURE_AARCH64);
 }
 
 /* Read the CONTROL register as the MRS instruction would. */
-- 
2.43.0

