Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2072192lfc;
        Thu, 4 Jun 2020 21:18:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6cfAnT9DSGHtDAZmCvc1InAHvBjx4Qg7weRllbbNqXrqYkPNjZEt2B0pFN3vr4b6sjopm
X-Received: by 2002:a25:2488:: with SMTP id k130mr13038354ybk.241.1591330687777;
        Thu, 04 Jun 2020 21:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591330687; cv=none;
        d=google.com; s=arc-20160816;
        b=aiS2S4VFZF+V9ft/b/nezTGuAWNeuD4VXcv2iLDMTbQiV8IjW1j1aSgqEjLE3mBTot
         sj/eehN5ih8GQgK4ja4en6BIKdOHgrfj78K/guUPJJ7um8ommu2QvQsZG+3mGmONDcWb
         Uw/MyNoQ+e0tCw2/ea1uqyuXxPIBPe3mM3U7N+ZH+vAXYtoJx7T6aS/J+8L+JOutGbYx
         CgnGlzpa2thzLYUUS1uQzNGLo5M8pAka7FGaOCLBGcIcwkjUIpF/wV0JrNGWv/kvfsOO
         h+Infdg4m0iEBl4z5TIgm/fnuMSf27fU7HvdRjGjWywPFPUJ+EkTUWHVH/SE1dNJnpX2
         pdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eLZZtVFaB75BQS+spGGXnwizsOQKSuMWVvyzFk16uJw=;
        b=vB+JJJJ3yydFHVyK2/kDubjutmqdvItEQ06n0mcFBz4f7eMbu0e8XGIwlhpoKIJPRh
         KKCFyaLFtqMCYrKpSrXcVbGi0felaatfYDZt3cMkf4kgl9TvRSRPABrKT/ONtpLtrzzg
         3008at9KhJ7JXLmhx+i4PQ/VOZP6tAnVt1osqb6df+nuE1YJVYiox0E2d7/sB66dvHfQ
         xfYyedTK3zRce8NAf9GYguEeArGellbktiqmcK8FPxho/1oS6Y8L4qzTxdPkP1zNGdIV
         V7EyeLT4lL/5UAP/5YGVPUbCwToUaT0rUrUGrRRPppClBbrwfofi/z9QdoUbsFcWl7u5
         D3cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="dkGcpEw/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si5599755ybp.92.2020.06.04.21.18.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 21:18:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="dkGcpEw/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh3nz-0004bP-3d
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 00:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nY-00049u-2o
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:40 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:50426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nX-0000iq-69
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:39 -0400
Received: by mail-pj1-x1041.google.com with SMTP id jz3so2056833pjb.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 21:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eLZZtVFaB75BQS+spGGXnwizsOQKSuMWVvyzFk16uJw=;
 b=dkGcpEw/QA8qwpDaDFqgPmDutz39Gfwybi7llJl84hrNtzI8DD261uTAlCrwspeY25
 HDasxtEIgKSuUghhmyPWGmEDECPRG9uOGNweAyTvQG7KY/nY/AIlf/Lg8y7KdjTWnFXu
 +5Tjorxm6GtCjAlWDPyfcdqDcBlOxGX25Q/38/B1uZypAOf4K0qNv7ltf2b0f009/R18
 BoXlgvIDdRIboQY4TkqMxQjRGzPjGEeMTSKooxYqv7KRaUX5brtPitOGdnwSHrVXhsqm
 Y+ob45FpwXUlAE7GTJN+aTOAPOrgvq4lb+1RFzjz7OLxh1otKOH3PuoVmlC+NqlMf4++
 V/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eLZZtVFaB75BQS+spGGXnwizsOQKSuMWVvyzFk16uJw=;
 b=ocwmIM/RtxJCKWbFXYRequcDoPzQL3mM6oaLk8xw4MIqCqBbQphsnleXt4Wiz56d/H
 K8MV0SaDIaLxW8dIjoaLCLBWatCTPSEfubxPPCZXcQII4c4p2t/jHNpPWiGvVcaiZBZ0
 daGQFQ7j6iR6ZHDdoCGL/JAlJqzBTZxv9UC8KfVwNpf4k9WVK+ZhqCwXtywfYhtiGUUv
 QmkOncxTtAcY8veoMlGZeSC/17PSbaAbRBr/rcVFIgaDkVX8sWaybTXBHYj6Y8YXipV3
 chpyFCbMo+oq6rPhEhmMsiBYKeupay/72WJn1+D8iNDiIVtyyeIcdcGuy2GqOv9B6srR
 4zfA==
X-Gm-Message-State: AOAM531y+7Tx1U9U9GtdL0OT/luB4CcD46BAItfk9t9Tr4qRV6qNz7L/
 mFXfbvf71Wgui7/8zzs3D8oW0A==
X-Received: by 2002:a17:902:24d:: with SMTP id 71mr5345398plc.12.1591330657785; 
 Thu, 04 Jun 2020 21:17:37 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h15sm5440902pgl.12.2020.06.04.21.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 21:17:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/17] linux-user: Introduce PAGE_ANON
Date: Thu,  4 Jun 2020 21:17:18 -0700
Message-Id: <20200605041733.415188-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200605041733.415188-1-richard.henderson@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
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
X-TUID: CqO9eGsbpGyL

Record whether the backing page is anonymous, or if it has file
backing.  This will allow us to get close to the Linux AArch64
ABI for MTE, which allows tag memory only on ram-backed VMAs.

The real ABI allows tag memory on files, when those files are
on ram-backed filesystems, such as tmpfs.  We will not be able
to implement that in QEMU linux-user.

Thankfully, anonymous memory for malloc arenas is the primary
consumer of this feature, so this restricted version should
still be of use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 2 ++
 linux-user/mmap.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index e5f564fa1f..3cac7750e4 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -277,6 +277,8 @@ extern intptr_t qemu_host_page_mask;
 #define PAGE_WRITE_INV 0x0020
 /* For use with page_set_flags: page is being replaced; target_data cleared. */
 #define PAGE_RESET     0x0040
+/* For linux-user, indicates that the page is MAP_ANON. */
+#define PAGE_ANON      0x0080
 
 #if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
 /* FIXME: Code that sets/uses this is broken and needs to go away.  */
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index f9832609b0..fdd55986a1 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -599,6 +599,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
         }
     }
  the_end1:
+    if (flags & MAP_ANONYMOUS) {
+        page_flags |= PAGE_ANON;
+    }
     page_flags |= PAGE_RESET;
     page_set_flags(start, start + len, page_flags);
  the_end:
-- 
2.25.1

