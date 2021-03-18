Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp588048lfg;
        Thu, 18 Mar 2021 11:00:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB9xhwxdG1UyIu63jRmI3SLH1b6ZYg+Kpx/ok6YUFdAFfyiB963kfllK8gFfgdL7+eTWj/
X-Received: by 2002:aed:2fc6:: with SMTP id m64mr4894526qtd.267.1616090406175;
        Thu, 18 Mar 2021 11:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616090406; cv=none;
        d=google.com; s=arc-20160816;
        b=SWm2nTfdE7ukZ7ZqbjpmPLICB8QeNRMMnWmUVBoRIEOJBQpD7vtpKGISGcpLX2E/Ng
         HaX0jrXYnU/KJoF1J+zfghW2M8KN2UdMI10MCv4gaiQ9J13Pi5ZHt92sk7BZz/YTiVe4
         xbLUVJO3Nce3DogyBIXiH+0kz59u2tdyJCu7c56Sd7l1HtZC5mHfTBP/iTvDglFM0dA6
         uVV6x8raW9chtdta0bj7UG6fwjwJkToS4Szg0y/5rGHRvzZIPWg8Lz6F4XM0CzjaRBk3
         D5MpmmavnBjalfOeVi8Yg3lmIWQJti9kDDQyfaxYrLEM7waEFeJ3eVUv32tWVpqc2LQx
         0vvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ltq0MmJYBR2ITlK/HcsP6Y5oPeWSWBMuW1aZG5jSIoA=;
        b=XyUnTU1SCSrWiLf2w8si8trDG4afpu6BnAKaIjj3/BPmwFxdrde6kIuqPj1i0maOTy
         04XH0K3G3y/ChfwtE+aluIvU0tRNiWE/waOh7egCO3LPyLkvMrUfZkXyeoU168r+ZVQK
         u/MRjB7uCWgXL9tebugn+29P3hiShmHoLvXw9Id76+w3d94GqBXvx5wkaD4eYQyZd9ID
         yUe0WnauqL6JN+eDwIVRHhDXy1wHb/o7Cg0/hH1NX475FVxAWtgtnV2RxRKYvD+XPu7m
         rWLCeCfi94rvV0CFkzwDo1anJleK0zfRmi04RzASWQKyMwdXANnAeSnKLW87EFTAWKQm
         Yi/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rnZDFnw/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si2009556qvl.93.2021.03.18.11.00.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 11:00:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rnZDFnw/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMwwH-0008Eu-Ei
	for alex.bennee@linaro.org; Thu, 18 Mar 2021 14:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlW-0006cd-6x
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 13:48:58 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlA-0008DB-CO
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 13:48:53 -0400
Received: by mail-wr1-x429.google.com with SMTP id z2so6463368wrl.5
 for <qemu-arm@nongnu.org>; Thu, 18 Mar 2021 10:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ltq0MmJYBR2ITlK/HcsP6Y5oPeWSWBMuW1aZG5jSIoA=;
 b=rnZDFnw/4MhKkXvghdGv5WdIyo5d43780wBmHxFbTR9S+s1tO08nze4nd0LTB91vTA
 8y1JZ1eUDLIlOJ0gaUUUMaOrX6evjA50268+VV6N4u+UIB+hihk3IzUwf2ksDEbWUdqD
 mdf97oR816pNiF8n/9rF//u7bpV2+FiaogOtkl0m4b3cPfla/vUfaCzCoYPbk/T4uv/2
 iU36Njmbymrccf+j6B8ibvI3kbIq28tpnCUweATV0oKN5M0wy2abX/7SsBDUDA/3y+7P
 UH+1+5MF+4FXd6LP/0FDOW6wreF7Qh8s436iIRiOY6iNkE40xwkuvtf3q+7aftY3Kov3
 4Czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ltq0MmJYBR2ITlK/HcsP6Y5oPeWSWBMuW1aZG5jSIoA=;
 b=hHKzOTxGuvsLt9houS2GVvxYGRXhJR9kZ+HcUfiRJEf1EQloAZ5wdtSNBMWlw1jIDP
 t+LsWBaSkAtJ+3RFRbLclhk+172hGOwZmcBjXAyXtDqd7I+5sb+TGF2mF87T7FgqDaWY
 vHfu6icVIaFuXl0v0ky+dYRtXa1z/6nOtIcyt10l3vnxSbmXjJRhJ5GzVwr0AyVGxF/a
 AcgtFcrQ4Q1hSCcJLuYEhECIapD31iXimZ1hWrH3rUbrZkOrNHLlhIsIsPmENPVzEUS4
 slc4B84TcdSmRZATPD3tChaFkg482hljrRe04g4TBeC8I1pkA3ACN1eMx53Mdtbv6OSs
 vhFQ==
X-Gm-Message-State: AOAM530nrvGD8Vp3WqLuMN+p2Fl41b/knKHMuYI6e/8tmasmnbrx02Z6
 qy/u74q1M+8B7a8AxHGNzTeIqvvRpOzxou9Z
X-Received: by 2002:a5d:550b:: with SMTP id b11mr413920wrv.313.1616089708259; 
 Thu, 18 Mar 2021 10:48:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c26sm3845915wrb.87.2021.03.18.10.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 10:48:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 2/5] memory: Document flatview_for_each_range()
Date: Thu, 18 Mar 2021 17:48:20 +0000
Message-Id: <20210318174823.18066-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210318174823.18066-1-peter.maydell@linaro.org>
References: <20210318174823.18066-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SjUOIN9Kem3Y

Add a documentation comment describing flatview_for_each_range().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 22c10b8496a..71a1841943e 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -776,11 +776,33 @@ static inline FlatView *address_space_to_flatview(AddressSpace *as)
     return qatomic_rcu_read(&as->current_map);
 }
 
+/**
+ * typedef flatview_cb: callback for flatview_for_each_range()
+ *
+ * @start: start address of the range within the FlatView
+ * @len: length of the range in bytes
+ * @mr: MemoryRegion covering this range
+ * @opaque: data pointer passed to flatview_for_each_range()
+ *
+ * Returns: true to stop the iteration, false to keep going.
+ */
 typedef bool (*flatview_cb)(Int128 start,
                             Int128 len,
-                            const MemoryRegion*, void*);
+                            const MemoryRegion *mr,
+                            void *opaque);
 
-void flatview_for_each_range(FlatView *fv, flatview_cb cb , void *opaque);
+/**
+ * flatview_for_each_range: Iterate through a FlatView
+ * @fv: the FlatView to iterate through
+ * @cb: function to call for each range
+ * @opaque: opaque data pointer to pass to @cb
+ *
+ * A FlatView is made up of a list of non-overlapping ranges, each of
+ * which is a slice of a MemoryRegion. This function iterates through
+ * each range in @fv, calling @cb. The callback function can terminate
+ * iteration early by returning 'true'.
+ */
+void flatview_for_each_range(FlatView *fv, flatview_cb cb, void *opaque);
 
 /**
  * struct MemoryRegionSection: describes a fragment of a #MemoryRegion
-- 
2.20.1

