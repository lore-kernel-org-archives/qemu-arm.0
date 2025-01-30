Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp181933njb;
        Thu, 30 Jan 2025 10:23:24 -0800 (PST)
X-Received: by 2002:a05:6000:1449:b0:38a:88ac:ed10 with SMTP id ffacd0b85a97d-38c51973c01mr8569723f8f.25.1738261404456;
        Thu, 30 Jan 2025 10:23:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261404; cv=none;
        d=google.com; s=arc-20240605;
        b=i2VvHcJvf94EwgMbHEqzoKiUJEoCkWoR4nNyA1DYjakENqKcZ3aleJp+KYl2kuqv7E
         CXzxQUOTZqQbMjLvsOg876bhmxNK5rcnsiEHedKRPX/6GoS+vvgtPafm+jJI9POoRXqI
         bGZVj1bwole35LgR+mdd0C2SBRkbthJNXrFTSZG00PSu9plP3PHNZM8hWoJ9EvHAtx+a
         PWYolrIr6LFONLZ0nwXHtodYHlfqgiil0irrxKyTV1Ic6fNlbn90FSf2JbrK4iI50rhB
         49LDSeSSbpNZOSSO7kqTz4RFzjlGZrnvTHEaKXPn3a2fxwhzkXqHIXO7u9qTfXzHgZLD
         LLZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UzWUoCV36n6hAnw3YSCmnofxu0Xpqe1BV6caUwzw2Oc=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=QqZjhr8MsKRnyYdwFALypZbea8ClgEO9TmIz7LUBRfQkaGqEMAhquQ5fmhPi66HoS+
         u6YmCOm0oGTvRpUCTIuT5SQ4e2IdHp0d+MXKnbXMKqLwqSoU6ce/xXhGw7qxGUM2GY+x
         cWM3AcpYedMdThGr37HMfCXK66y7FKEOSCdc+Ruagt184wHlMGfgswtAmH95ULrJ73pO
         O4qVenmH5wS14axxgDqxU249gmucfDZvnW2+jnYiDnrSH3ofaKUKvy9cu/Mk874Z96Re
         CUM3nTRarKV1R6vi/vLfNxvTiPQdLB20OZ8Snhz78V+DveQizR4fggr1o010IIQbwoOE
         ldUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xwSJjhjt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c0dd870sor661213f8f.2.2025.01.30.10.23.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jan 2025 10:23:24 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xwSJjhjt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738261404; x=1738866204; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzWUoCV36n6hAnw3YSCmnofxu0Xpqe1BV6caUwzw2Oc=;
        b=xwSJjhjtpTjmhDOAr4CvmJgFW8vIhXMoZ9Wi2W27inBBKsDbU62cq2198+ucJIWQfN
         ymtvYzvIMVJJUErSzFbTfLa4tOCuAdfvfuSFFloiJXXVv6+dPOlKDJUPPe1jIsftrok5
         eaeYejHzaP3auuTZ+fagKrEahPXPsmreUh/AwnmExvx9wr/HhILHvJqVeYievy0zHrig
         U1b9Gyul9C7QmrKKE5sGKR9dZWsNSQqvZwSuBowLXGKFf4h1pDla/Oh50QObLbdT+oWH
         LeQ7RXapTR7Y4cuexf9bcSwGMndqDwT6SgK2eggmS+yvAMSA04xPnvphU5tHm2PgFFOw
         HP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738261404; x=1738866204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzWUoCV36n6hAnw3YSCmnofxu0Xpqe1BV6caUwzw2Oc=;
        b=u2agoAyPTKsVASkxrQqKDjqmuW+0OOnO4XQOq2gYtM0J9Gslzcc6UcJdBkeY1UXilS
         KCFMP0fx16BbiK/aFkfjB51iHbgKPUH48lfaVslstLwnyM3hHJUc7/K5kmfgJLoVluvw
         XnJztzkCnaZ65KuMWY/CzctPVyUyF8db3yPVdPWy5/FoGP66beCkpcpe6lUZ3DyfCtTM
         nKUqE4/4qtpT5B87BNk0AcsYohTIHiXyLoIpRMonWiNZ2Le9L6qLINqtGxMSiU2Vu6hN
         tpcvmNprwBSo7dWSZiWgCECBm4ue8v4s04w4JyXTPcr48+UePQX0G/ZhtbIzbxiG4/l6
         IGLw==
X-Gm-Message-State: AOJu0YzoVyt1Y+JS9QOaUUDfIQd1CXPEkLotEu2XEwDiDW9GGFmSJu16
	qskrne/RIBiRqAt27ILa0Khkeeg5i6L3yAl65mQn3neqDxfaTl1ya8obMAUW9dp2Fk1CIzQTlVg
	uejw=
X-Gm-Gg: ASbGncuK7T/SJxeIfxEgFwxeEpM9qEUa0OTDxNZSRKtezV8LeAtN5tg8ygNB25poKiu
	qRuV/cnGkmSI1drL/DGa2zKan0Lj++CniLmf6mwVxEwJ04gkp0pBLpxa3v1TakP0FDqwHzQS/YK
	gzv4iIB5/lWyBL09eswkgiRiA7US7I5F8u36UoFo5pCeIHd3ciBgqRkxidc6XUn/y2TnnzotfZF
	naQu/Jb8MkIAVIgyxJlVLzcN9NFFSTqqzfk++MzQgBt/qdUC+czi7xHcW1ePaJCpGKII1ufejj3
	ew6xKUySP3bVz4QDIwnRfw==
X-Google-Smtp-Source: AGHT+IHv5gF70a4Mqx8gdcoaCrYuQ74X9HkaiJE7S7DYI8dtyyZsPjQ0YXE5YOYaMCY55s/ktOPz4w==
X-Received: by 2002:a5d:64c3:0:b0:38a:a117:3da1 with SMTP id ffacd0b85a97d-38c51946048mr7119768f8f.5.1738261403930;
        Thu, 30 Jan 2025 10:23:23 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm2634426f8f.23.2025.01.30.10.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:23:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 12/14] target/arm: Remove CP_ACCESS_TRAP handling
Date: Thu, 30 Jan 2025 18:23:07 +0000
Message-Id: <20250130182309.717346-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130182309.717346-1-peter.maydell@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8CU67A05F1k5

There are no longer any uses of CP_ACCESS_TRAP in access functions,
because we have converted them all to use either CP_ACCESS_TRAP_EL1
or CP_ACCESS_TRAP_UNCATEGORIZED, as appropriate. Remove the handling
of bare CP_ACCESS_TRAP from the access_check_cp_reg() helper, so that
it now asserts if an access function returns it.

Rename CP_ACCESS_TRAP to CP_ACCESS_TRAP_BIT, to make it clearer
that this is an internal-only definition, not something that
it makes sense to return from an access function. This should
help to avoid future bugs where we return the wrong syndrome
value by mistake.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h        | 11 ++++++-----
 target/arm/tcg/op_helper.c | 13 ++++++++-----
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index fbf5798069d..fb3b84baa1e 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -328,12 +328,13 @@ typedef enum CPAccessResult {
      * Access fails due to a configurable trap or enable which would
      * result in a categorized exception syndrome giving information about
      * the failing instruction (ie syndrome category 0x3, 0x4, 0x5, 0x6,
-     * 0xc or 0x18).
+     * 0xc or 0x18). These traps are always to a specified target EL,
+     * never to the usual target EL.
      */
-    CP_ACCESS_TRAP = (1 << 2),
-    CP_ACCESS_TRAP_EL1 = CP_ACCESS_TRAP | 1,
-    CP_ACCESS_TRAP_EL2 = CP_ACCESS_TRAP | 2,
-    CP_ACCESS_TRAP_EL3 = CP_ACCESS_TRAP | 3,
+    CP_ACCESS_TRAP_BIT = (1 << 2),
+    CP_ACCESS_TRAP_EL1 = CP_ACCESS_TRAP_BIT | 1,
+    CP_ACCESS_TRAP_EL2 = CP_ACCESS_TRAP_BIT | 2,
+    CP_ACCESS_TRAP_EL3 = CP_ACCESS_TRAP_BIT | 3,
 
     /*
      * Access fails and results in an exception syndrome 0x0 ("uncategorized").
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index c69d2ac643f..fcee11e29ad 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -853,21 +853,24 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
 
  fail:
     excp = EXCP_UDEF;
-    switch (res & ~CP_ACCESS_EL_MASK) {
-    case CP_ACCESS_TRAP:
+    switch (res) {
+        /* CP_ACCESS_TRAP* traps are always direct to a specified EL */
+    case CP_ACCESS_TRAP_EL3:
         /*
          * If EL3 is AArch32 then there's no syndrome register; the cases
          * where we would raise a SystemAccessTrap to AArch64 EL3 all become
          * raising a Monitor trap exception. (Because there's no visible
          * syndrome it doesn't matter what we pass to raise_exception().)
          */
-        if ((res & CP_ACCESS_EL_MASK) == 3 && !arm_el_is_aa64(env, 3)) {
+        if (!arm_el_is_aa64(env, 3)) {
             excp = EXCP_MON_TRAP;
         }
         break;
+    case CP_ACCESS_TRAP_EL2:
+    case CP_ACCESS_TRAP_EL1:
+        break;
     case CP_ACCESS_TRAP_UNCATEGORIZED:
-        /* Only CP_ACCESS_TRAP traps are direct to a specified EL */
-        assert((res & CP_ACCESS_EL_MASK) == 0);
+        /* CP_ACCESS_TRAP_UNCATEGORIZED is never direct to a specified EL */
         if (cpu_isar_feature(aa64_ids, cpu) && isread &&
             arm_cpreg_in_idspace(ri)) {
             /*
-- 
2.34.1
