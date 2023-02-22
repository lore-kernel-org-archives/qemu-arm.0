Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3829312ejb;
        Tue, 21 Feb 2023 18:38:49 -0800 (PST)
X-Google-Smtp-Source: AK7set8f+8r+hXPBk9wfpCqzlYIkO1eW4U3xomFbm2uhDGK0hsc5ikrhrM4WXTamO4JH1GEegjG+
X-Received: by 2002:ad4:5d4c:0:b0:56e:fb1b:3c7b with SMTP id jk12-20020ad45d4c000000b0056efb1b3c7bmr14797074qvb.38.1677033529126;
        Tue, 21 Feb 2023 18:38:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677033529; cv=none;
        d=google.com; s=arc-20160816;
        b=mtS5vxfsGHHDOKYZ/SxmBrYNd67lw4BH9L0Iz8m23U7fj6n+szR9FP/gT67swUa+lN
         ns/nFMJeoWZtAA6KV933V0pUpkWWvDE0md3927GQJxbGeB2gAXP/AIG3c+SxLGFQ5Dnv
         O97J6HsCVOKbvbwjC7KT+dWeBXtlW7unnso19sxuEBVjfX0FHhQSRbN7LU3+bmA50qBQ
         lhvG5b+0+mne8dIGzGTsrBgp0+zLayp2D3ryAIhXVxkhJXhbvjF8oAhee6cz15ddOJsG
         dqVwLx+pPiJyJs7310+60lvez6l8nDgzI94tGTnSu0zrzIOla421RGkn6uxJXTlgUyIA
         rP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
        b=iuvA5d14fGToBKU4KCHLrRmMlviaSiK0l04FvuuFg253DgG6ssbee/t5UQrzUM8pGW
         AHgiptgM14+5FuPnMZ8IOchvGbLO7BFBhCrndInCGE1VUxbOqKuv21LyfUPdyWRqqcUx
         SkLO5wCMiSGSNVJ0vE00fYZexSKDtZt56rrTfs2IU9pdelPELsX7x6odL/fPqknPojT5
         cHR6InWxPEvdNj2rQcWee858FcaGd5BQv4xrrYGojr5cWloqhRO3NoKmTZeAX5RvnZyR
         FlfnQEKgaaGz9J99t2QIbg0bJ5AMSJ8QfhJbPX2veRcqrmz/CfTfMqd57qAgtYSxLzuD
         iQog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vAE0hyoL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1-20020a0c8c41000000b0053aa7392f59si1344963qvb.517.2023.02.21.18.38.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 18:38:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vAE0hyoL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUexT-0007gQ-E6; Tue, 21 Feb 2023 21:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexA-0007L5-1o
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 21:33:57 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUex8-0001Xg-Cv
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 21:33:55 -0500
Received: by mail-pl1-x62c.google.com with SMTP id ko13so7848596plb.13
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 18:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
 b=vAE0hyoLpcAzZ+66jQHG/RI//FDINCq6r7xYdlYqWVeK/KErV1uSa5x5YR+dsSC7ti
 K1ZaAmZvUUo1lvDa9es7zsZePW743U3IVZvYMJhT+a6dzzoCJfb7jHkTt13f8PZ/W/MM
 TwQlphHupr+Eig1uiaCmEybcBMCAe4mVU4rHXxPWUIrdg2kxwS/KJGhvUaMULPbnRQ6G
 OedEN+PaP4ERedfKjTDikVDD3hxYCAJOSfWJObn8hQtm7D+ixJbz1VlG2Gzi/iCNZXb5
 uNvEI6FCjcj13fd0SlRhGL02P3eSKnhftJxqabqo4vXo0fUXJL17tHQojiTWNaW3NVgO
 ggZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
 b=hdoKsmp25DWl/HzT5+7kAcvA+D+iObxMX3UgEeRRQ9l5V2HrOdlv4t+vVw3pYbSUVw
 eYjq2vUPT8cTEoTitQT6nWxLFqkKg0ZHAtP8VNdgqREwJ9AxV58VbamSqDbuwZurXugd
 azYGGozeiySJ2diBBFOHHSs+oioP5UQPBF+voVjptpBNg7sxMlBcKeLlUvrY3XQONjuS
 uaIdM1FDpabVMXL5Y0zQDKw2p+Ks5cNEjI4ajEDLNpetrRzFKNNqwTY5pD2joVKtQwyb
 PAtb99u3Km/4WaILDeSrfUjUvTfRawEOd9ID7rCdqADZnHYUaGsYJ+HFjJtJDuWzKTDQ
 MePg==
X-Gm-Message-State: AO0yUKXAdK9GhnUwHkAQ+i0P7tQQLSocVGStmmWGPgyIca9bBC6nPtyW
 K4OE/1UuoI1kmqsoNKpqULOKRpQVZx3QZxOLFFo=
X-Received: by 2002:a17:902:ecc3:b0:19a:9880:1764 with SMTP id
 a3-20020a170902ecc300b0019a98801764mr9517722plh.59.1677033233683; 
 Tue, 21 Feb 2023 18:33:53 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 10/25] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
Date: Tue, 21 Feb 2023 16:33:21 -1000
Message-Id: <20230222023336.915045-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: hf7RJ0Dk2vDM

We will need 2 bits to represent ARMSecurityState.

Do not attempt to replace or widen secure, even though it
logically overlaps the new field -- there are uses within
e.g. hw/block/pflash_cfi01.c, which don't know anything
specific about ARM.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memattrs.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..d04170aa27 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -29,10 +29,17 @@ typedef struct MemTxAttrs {
      * "didn't specify" if necessary.
      */
     unsigned int unspecified:1;
-    /* ARM/AMBA: TrustZone Secure access
+    /*
+     * ARM/AMBA: TrustZone Secure access
      * x86: System Management Mode access
      */
     unsigned int secure:1;
+    /*
+     * ARM: ArmSecuritySpace.  This partially overlaps secure, but it is
+     * easier to have both fields to assist code that does not understand
+     * ARMv9 RME, or no specific knowledge of ARM at all (e.g. pflash).
+     */
+    unsigned int space:2;
     /* Memory access is usermode (unprivileged) */
     unsigned int user:1;
     /*
-- 
2.34.1

