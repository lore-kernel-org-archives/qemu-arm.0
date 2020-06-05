Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2073021lfc;
        Thu, 4 Jun 2020 21:19:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7hOMGz+bft8b4YoT2QC2q1q/dH/zrc8Q+cHCLIC/FNKMRZUh3Goaece8ThAnwpmQoUd7B
X-Received: by 2002:a25:c904:: with SMTP id z4mr13875260ybf.338.1591330769600;
        Thu, 04 Jun 2020 21:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591330769; cv=none;
        d=google.com; s=arc-20160816;
        b=x+7ZaDtUyOeul3yvHbFSUpdjUKEt5OaNMJTSG8PvDbaubwBsykuAKvxQvgOOMkJ85y
         61rkXwOo5mWKoEn68Mu0F1LIBejXZwqaD6WW30RvY5haVcYRFf/zwQkZCgXeWD6b8KXG
         H1mSqnJwPVh6Q769xyxdB5arB3ArDofTe5nOVylNpzqO9gZ3tSpP+t+IC2XkiSjjy9j3
         7KHYB4AwxUgRfdR3MzzdtGcrJg4+6yRe4JTxJ5nJKLnI5OnktPFMdLgpFfa0GXetNybQ
         +9J2hvFSuDVz1SjTHbNM46pmG02MeJnKPD2201GXNoefwjZqGVIYOO7iPrwsSLZaHA/q
         hSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OQXnnFtOsPYN4aWlItYREcPDVPLVM/BSGRYhyFhu/u4=;
        b=HnOqq2kCkzxdV+jlk4h9X7M/CxYQHoTLDeYK/ZiSjixiHJuv3bsbjjSaQmuM8vZY05
         /lJDNVPe7Joo3SKKVB4OkEq8zYRurso5sDCY2FlC91VFRLPU9qBa74oiNRFglvxMMymv
         GY2mD4ZAcq/2qD0WoM3oCHfAJEELoczIL22psg3sVihV57E/RBAqOS72udw5N/MxxqcY
         cEWKBKnla02LHk5OJ6QpW/VGTWvr2rWrGf8VhvB6Zw0JzqFeAb2b3aY02clA1+egqApY
         GvKuXbEuhekEbuJtO0awQ620C/FFOYzD+cNHZ86LxNc7uCjDZeGbRYkaKAM9F+2ipL24
         GQUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O9JjXFcZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d78si153708ybc.122.2020.06.04.21.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 21:19:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O9JjXFcZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh3pI-0007tL-M8
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 00:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nb-0004JG-Mu
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:43 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3na-0000jj-SA
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:43 -0400
Received: by mail-pl1-x642.google.com with SMTP id m7so3124598plt.5
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 21:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OQXnnFtOsPYN4aWlItYREcPDVPLVM/BSGRYhyFhu/u4=;
 b=O9JjXFcZnzH+YSBGRYdrGc/qCUzYaB6ZiEjMWnVqQCxxz/otE7MxzOQ/JMz9Y/Vw2D
 vnZd1Y2L/BM+yysvq91YzkFaUeTm3RZEDPqDKFilOIRiQ94V9s7GUFwsglPG7EeKEJm9
 grNbCjVQzE5Gi5+40pNdAxL8GG1Nre4Zfvsj3vPNWixXe3Y/26ynnUzoo3qP5XoXVY93
 eQy+1ClaHRVdRN7oTRgBHzjarax1ikbC4EfUrtEO116zJ0B51SeZx+Oit4FBgc7hcfYW
 j6sk6brBir2LeNo0J3XYoKcb/MpT0ObBcBKdlg2ZCsZeIXUVD29MxDZWV7i60sojO8XP
 6Crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OQXnnFtOsPYN4aWlItYREcPDVPLVM/BSGRYhyFhu/u4=;
 b=PetVSi3aEu9Nh5zvjdzVI9GLMO16p55RvAZ/H+B0GuC6KA+eI8NdtSJrcXb9dFuoHP
 b42jWtq0i/FgCFhgUGG4pl1ZdoXIsP/VjoeMzO4aEuUBWU4hEwh5i8ZNVffNKojyqHnc
 wwEnGSF2EUGz4SXY6nRexue8pgQxbopnEaKeN1Nsm1ONR5nJNGGKdJK1DFiFl47senlB
 XTSAbgeOsaSE4axF2/Alchvbe4pcG4RY2T95AVLTLQ1nQSv8C8I7Vlx/uHYKaa/A7Gbv
 RfC7d539AXcv0nNRXK83/lTNk+qpkNGfcUrNo8pIdxPNC/JzD+ZYLGh7liF0AkzGOWdC
 uZUg==
X-Gm-Message-State: AOAM531ciz3w47VfZw3jZqwHjct8MeV2hxiIaVXcbFHLIusiLDvYsQ9n
 W2y0XLzVtgcRWbZ8WjXcIB7hCkknooQ=
X-Received: by 2002:a17:90a:9604:: with SMTP id
 v4mr768386pjo.198.1591330661509; 
 Thu, 04 Jun 2020 21:17:41 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h15sm5440902pgl.12.2020.06.04.21.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 21:17:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/17] bsd-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Thu,  4 Jun 2020 21:17:21 -0700
Message-Id: <20200605041733.415188-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200605041733.415188-1-richard.henderson@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v/TYFUeOzDcG

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index f8bb1e5459..4076adabd0 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -218,13 +218,12 @@ extern unsigned long x86_stack_size;
 
 /* user access */
 
-#define VERIFY_READ 0
-#define VERIFY_WRITE 1 /* implies read access */
+#define VERIFY_READ  PAGE_READ
+#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
-static inline int access_ok(int type, abi_ulong addr, abi_ulong size)
+static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    return page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ : (PAGE_READ | PAGE_WRITE)) == 0;
+    return page_check_range((target_ulong)addr, size, type) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access. */
-- 
2.25.1

