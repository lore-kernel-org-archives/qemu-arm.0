Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2073278lfc;
        Thu, 4 Jun 2020 21:19:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3yAL4XRU40TLz84awqlO5t89PbT68ZebdgU0VXs0ZCPAqPQmNU4z0xjkz+x9fusLSgqk/
X-Received: by 2002:a25:1f57:: with SMTP id f84mr13824425ybf.336.1591330795239;
        Thu, 04 Jun 2020 21:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591330795; cv=none;
        d=google.com; s=arc-20160816;
        b=jmPpwy3EKBi+iAClssc5i/ut1Ocg1mpv/f4Qi8RMSGfYp64shvneGJSqzIPP0IHLun
         ghtWEHRFfkGUqidY1VG1D7RxUPw7IpMcI7wAlKh8kuYOG1YhM4smUr3XBSaRW0cjhy5h
         DroKO0JmPYImQMTTK4cCrmXmiCWS9/AmHyCz/ZBkqK2wsFlziBA7k86ubE63eqRjm45A
         lUgQE9AjIdRk1JW+D/5X9m12xwLB90Gr7kZtFu3p/nz+c8t35rqG+SdB4SDb+mp36XAE
         9fw4hrmDvtXiq226cjDHdaa+f250uD8IQPBXCAvVIgP9yzU41EeK1xHwLTeoXsbZxonU
         HR7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=p6D0SimXYVXC4E7m3TGAGtyiw9jb/y2AGrQNgRl17pM=;
        b=xnrqeWeITKC6jZT4V416QiXdM7Kn91d5unHW5SIJVn5sQnsoJYEa4DDxvL5tnDu6kL
         COZp251HcDQy3LYzcAOU1cH9aHX7AmbaXMIurrP2WOWCgiYaeD06peEDV5ZC+4wBFR6l
         IOgqyIA0TLK0ee3XxWS94LB0jSv6qLaUDuIp6E971i5w4brNCW8QlgIljYhlKUUo5it5
         4rTfAXxignZcp2F6jfAFod6eQNbTPZdC79+wmJdsbQzL09V4bT0b5y2YGXdM7pcvvAFu
         Ejqcqb6Ujjb84sAbZs1qOjjMWMUA64x4CwzJVYF+hbhvHNTChVjJonTuFlfyNeCIVPuu
         T5lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WmdMO5TG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si5804480ybf.87.2020.06.04.21.19.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 21:19:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WmdMO5TG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh3pi-0000ig-JZ
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 00:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3ni-0004eK-Ol
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:50 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nh-0000lL-SB
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:50 -0400
Received: by mail-pl1-x644.google.com with SMTP id t16so3112023plo.7
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 21:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p6D0SimXYVXC4E7m3TGAGtyiw9jb/y2AGrQNgRl17pM=;
 b=WmdMO5TGkw0TnA4jGXKKBq8eFbnXqVpmqipAkp2psIxZU2FVAlXYOpKCeWGu3u14h5
 rqwhBMb01muYtUfwrASzv28qgOClQh9AEmb84yEjxzawxX6Idj8ecE4WGi/PXRVOil1y
 A2D+oCWfXLnGq8C6ip3DbknI9L1w05tugi7hWQ0CmKAjNYq2Ptg9kwEB85JouCSHtyIL
 lV7qkPK4RA5407gvDD1W/TluVUQp7940TTYE7iyg1xUkSrGEnRkQpR8oRnLBRPf+rF+0
 WQEGfG4jcIa02qbA2Lfn5hS+VHHjrLHmKce7Ll32LMd5uGy1Kzku7iJ/py4vTeri3QOB
 Pg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p6D0SimXYVXC4E7m3TGAGtyiw9jb/y2AGrQNgRl17pM=;
 b=gDXA88eejxI8z/0rIwWQvfIysopn4umWqUsLVU7MR+3O9U67vuV/tc7n4iy+UFv0Q3
 274tBJnSXCVBne2RTKqaGSZkQSBXv6F8cYSx/8jdH/NMjrL36kKitzu3PS1tZvidqGJu
 oh36wyV208398KTmDoRdEv8KJLxfgOqUiNpnt8kRCp2W4WHP2FzGIvclCjznvmsy9kLG
 hGfCPQRaD6we/BL9sk53Rp7VgK1ys1RpVJI1PfR3jHQow8sAZOy//KFSKJ7Nrzqg2RAO
 W1cEseLm6snKmCxPF7mOFJEik7umpgKxCQ3u+Ba5jkE9cTLfwAHWDWE8NYWUfoIOyLKm
 aeIg==
X-Gm-Message-State: AOAM531Uv1c/VIpL6pJC5h8X5hSUVShK0EZGT9bYn8FxiJtoFYkiDYUd
 7em0KdhZY66RE5yiJM1TcSVKcQ==
X-Received: by 2002:a17:902:564:: with SMTP id
 91mr8130642plf.212.1591330668657; 
 Thu, 04 Jun 2020 21:17:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h15sm5440902pgl.12.2020.06.04.21.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 21:17:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/17] linux-user/aarch64: Implement PROT_MTE
Date: Thu,  4 Jun 2020 21:17:27 -0700
Message-Id: <20200605041733.415188-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200605041733.415188-1-richard.henderson@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
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
X-TUID: O2BLYxooP3pA

Remember the PROT_MTE bit as PAGE_TARGET_2.
Otherwise this does not yet have effect.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h    |  1 +
 linux-user/syscall_defs.h |  1 +
 linux-user/mmap.c         | 20 ++++++++++++--------
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 3cac7750e4..7ff10a8b08 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -286,6 +286,7 @@ extern intptr_t qemu_host_page_mask;
 #endif
 /* Target-specific bits that will be used via page_get_flags().  */
 #define PAGE_TARGET_1  0x0080
+#define PAGE_TARGET_2  0x0100
 
 #if defined(CONFIG_USER_ONLY)
 void page_dump(FILE *f);
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 36bdafb3f1..f2bfa3b17f 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1196,6 +1196,7 @@ struct target_winsize {
 
 #ifdef TARGET_AARCH64
 #define TARGET_PROT_BTI         0x10
+#define TARGET_PROT_MTE         0x20
 #endif
 
 /* Common */
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index fdd55986a1..b5618c40bd 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -84,18 +84,22 @@ static int validate_prot_to_pageflags(int *host_prot, int prot)
                | (prot & PROT_EXEC ? PROT_READ : 0);
 
 #ifdef TARGET_AARCH64
-    /*
-     * The PROT_BTI bit is only accepted if the cpu supports the feature.
-     * Since this is the unusual case, don't bother checking unless
-     * the bit has been requested.  If set and valid, record the bit
-     * within QEMU's page_flags as PAGE_TARGET_1.
-     */
-    if (prot & TARGET_PROT_BTI) {
+    {
         ARMCPU *cpu = ARM_CPU(thread_cpu);
-        if (cpu_isar_feature(aa64_bti, cpu)) {
+        /*
+         * The PROT_BTI bit is only accepted if the cpu supports the feature.
+         * If set and valid, record the bit within QEMU's page_flags
+         * as PAGE_TARGET_1.
+         */
+        if ((prot & TARGET_PROT_BTI) && cpu_isar_feature(aa64_bti, cpu)) {
             valid |= TARGET_PROT_BTI;
             page_flags |= PAGE_TARGET_1;
         }
+        /* Similarly for the PROT_MTE bit; set PAGE_TARGET_2. */
+        if ((prot & TARGET_PROT_MTE) && cpu_isar_feature(aa64_mte, cpu)) {
+            valid |= TARGET_PROT_MTE;
+            page_flags |= PAGE_TARGET_2;
+        }
     }
 #endif
 
-- 
2.25.1

