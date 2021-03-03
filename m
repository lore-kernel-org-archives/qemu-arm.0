Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706619lfg;
        Wed, 3 Mar 2021 13:48:55 -0800 (PST)
X-Received: by 2002:a5d:6411:: with SMTP id z17mr668899wru.119.1614808135437;
        Wed, 03 Mar 2021 13:48:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808135; cv=none;
        d=google.com; s=arc-20160816;
        b=NO2JIRHJBO1tmM9bJNOef/M2HiELDsWw3H1ZYerpFDUBicj6FEUsWZsM8808jp8yOk
         pOOgJxs34W6UFsyZyztiQY8uD0uVKYdPKpPt3hGpx+XQUEn71YjttsDAyVcIdGJNuJlb
         yiILSJ6XYBdjnY/gMx8QD/2pTiKrgy+21UIaMboMnLiF6aATCfXOEpPmJAcWAq0P0+K2
         58lzVhZ7TPINszafpFDJW7UydYh7AqztNnFNKQxChTm37AxsDzN66WMUP8wnx53GKP/U
         A4+j7MTXNmnY/hmWvMWAkYCjlvEAkih3Ba9ArWWA7QrxQoGNJwE1Qgiu7lPhYR8klClu
         JoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=YsyyPNDoTwAkeJjoy+M+xRx5h1vPHUVYHrANL4+RWD0=;
        b=AG4TjyBPcd5H/osv1Dy9NR3/a6gkAFLmmZF3Ze4v5QX1uARst3ltHnoiTYoahVg2Mj
         pKxSTUaxg6NqJKNr9e2mS3V6iOyxB05+gSci+/M9qluHxMVbz1vZbScvELZkQUtViaDC
         s5rQatMxvT4lwlYv8sQUB7Wlj6TO9Nw8iL5DmN35kF4jpSeJLf7wMAvetnqEpDZVlAJH
         tu8g4mexqEFO212rSZkEdtaUbqhGfGDtrWhiu26BCPQ2WIEa9ideu4ToXzLe3pgVEWHX
         BQsw7JIDdNgkNrLcoY8/xVORvHHefSR7Fb00r+5lPnprjOadgWJrRVdOJGG0Vfua86N3
         b49g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="V/SuZJ8S";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r22sor4140088wmq.22.2021.03.03.13.48.55
        (Google Transport Security);
        Wed, 03 Mar 2021 13:48:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="V/SuZJ8S";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YsyyPNDoTwAkeJjoy+M+xRx5h1vPHUVYHrANL4+RWD0=;
        b=V/SuZJ8SpGBxAstY6hDc0Qslhzv+bxiUGIKZv11yfSVv7Oxd7fKaGon1PaSAP2m3cl
         5IIZaFPA/PVQXdFegc9eeUxYDN3lmW/xaGkEK0XXE7dKas2ciX2wixCe4HtcyPuD+mp8
         nCiX14pCTeT/e8JakRCTYzembpCE31pZZwbB4kluwZfCdbYhw51dKrY48iV3pp9v1ZFC
         /fe8ThcxwPjexlTiPuuRltaw9TAQ4v7ft7Df1777KNAaM8BOXgLWCrRer+SPoqexmpJu
         L8MBJnoT9Q+6C1o7pXYwGGWjtzl+miEnSnLz5ois7+0QKF75aMlomznLo5pC3b61AnvJ
         NJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=YsyyPNDoTwAkeJjoy+M+xRx5h1vPHUVYHrANL4+RWD0=;
        b=szS2o1Q9sRlkrc3XtKqzAwjT9/OhkiNWIN4vq4vSc/u62IQs6ahQ/O0Oyew5QzGFyP
         G9KjsYEaT9BCrJsqAK9FwrBPKBMwcjM6dQJLaTq5sM3H3oA/INP7mHYlZy0+jMZogKw3
         7dOYEv78XcepWNpIkZbkQDawzQtHE2CKT2p/FcfzkLooMKLk7q/GWVS+9G2CU9dR0Wt9
         jEzrrk5vIn2v8OwPesYsh+2c+AVxEdG+lNwdmr7RXmihuzXWgyGJAVUtBo9g5kmg3MDe
         8ZZPnuAvKpFdAsiZZ7qzNOMaqAAZRnvafY1o3Md01fIloINu+I3JOpEktcFakL1D3M8v
         Of7g==
X-Gm-Message-State: AOAM530OPNLjzqvlHHfIN1L3tiGPc0ab5VQtryok5RuSdjxr7HUmLCpm
	S0nB43eIhPgJaB7+rQj4tKE=
X-Google-Smtp-Source: ABdhPJxZiYOlxTknALOe29KozWDyUp8ZjfKR71R0FW3hcWVdTXcU0Psr2cH26dTTPkD9n+nyIs/Kig==
X-Received: by 2002:a05:600c:203:: with SMTP id 3mr852297wmi.88.1614808135219;
        Wed, 03 Mar 2021 13:48:55 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id z13sm33854690wrh.65.2021.03.03.13.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:48:54 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 19/28] target/arm/internals: Fix code style for checkpatch.pl
Date: Wed,  3 Mar 2021 22:46:59 +0100
Message-Id: <20210303214708.1727801-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OZMrua/dTQFe

We are going to move this code, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 05cebc8597c..d6ace004855 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -251,7 +251,8 @@ static inline unsigned int arm_pamax(ARMCPU *cpu)
     return pamax_map[parange];
 }
 
-/* Return true if extended addresses are enabled.
+/*
+ * Return true if extended addresses are enabled.
  * This is always the case if our translation regime is 64 bit,
  * but depends on TTBCR.EAE for 32 bit.
  */
@@ -262,20 +263,24 @@ static inline bool extended_addresses_enabled(CPUARMState *env)
            (arm_feature(env, ARM_FEATURE_LPAE) && (tcr->raw_tcr & TTBCR_EAE));
 }
 
-/* Update a QEMU watchpoint based on the information the guest has set in the
+/*
+ * Update a QEMU watchpoint based on the information the guest has set in the
  * DBGWCR<n>_EL1 and DBGWVR<n>_EL1 registers.
  */
 void hw_watchpoint_update(ARMCPU *cpu, int n);
-/* Update the QEMU watchpoints for every guest watchpoint. This does a
+/*
+ * Update the QEMU watchpoints for every guest watchpoint. This does a
  * complete delete-and-reinstate of the QEMU watchpoint list and so is
  * suitable for use after migration or on reset.
  */
 void hw_watchpoint_update_all(ARMCPU *cpu);
-/* Update a QEMU breakpoint based on the information the guest has set in the
+/*
+ * Update a QEMU breakpoint based on the information the guest has set in the
  * DBGBCR<n>_EL1 and DBGBVR<n>_EL1 registers.
  */
 void hw_breakpoint_update(ARMCPU *cpu, int n);
-/* Update the QEMU breakpoints for every guest breakpoint. This does a
+/*
+ * Update the QEMU breakpoints for every guest breakpoint. This does a
  * complete delete-and-reinstate of the QEMU breakpoint list and so is
  * suitable for use after migration or on reset.
  */
@@ -284,7 +289,8 @@ void hw_breakpoint_update_all(ARMCPU *cpu);
 /* Callback function for checking if a watchpoint should trigger. */
 bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
 
-/* Adjust addresses (in BE32 mode) before testing against watchpoint
+/*
+ * Adjust addresses (in BE32 mode) before testing against watchpoint
  * addresses.
  */
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len);
-- 
2.26.2
