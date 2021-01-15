Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp677759lfq;
        Fri, 15 Jan 2021 14:55:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwkVFGFj1H9uaMRw0sJJR1hWBRknLymj++DoC6vOIYdQz/1EEp5/5lfjieBwB5huc7+VqU
X-Received: by 2002:a25:2554:: with SMTP id l81mr11554763ybl.124.1610751349790;
        Fri, 15 Jan 2021 14:55:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610751349; cv=none;
        d=google.com; s=arc-20160816;
        b=QoWK9USNJxiUUD8OLEwJYJ1vFDYHbyUPuhe8niab0AOktykfpO6ATbmuQdlgZZDQci
         k8MV9k5zeXGl4iTfEx/zkr85a7HAQUPwyH6yxJxX2c/0wRnf0Dep64tinDcHc1xZM7VQ
         39pQbpypm/jn3FSBZWDRrNCQxwfk7dVRJ2z1uqHC6Db9K2A3DFhEgH4F48daIydCb3tb
         ENsS45kEgoNKKu0chn8WNDxKI3TvuSycJMFd5T8PolxDMI13UE/B+WT+Ef5LHhnt/7xj
         2TU94K9+7qmZbMXk6IHw8VDuXRrBY3jEDR80gekDtC6m4cEAWL2EGsZQD2dYRX67qvvC
         cvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6xhR+Wss/1TBEEfYwI3TvMrUfFA269smX1ho0M9IxOI=;
        b=NEkzwAPO0lY0LVKMAh7elLH47OZdadmxvvAFtCT392YBkUnklScgxcL769oVntInmc
         5J2NW2BOw2wTlqBsJ9awaiJaXfHh9MoP866MiEutW+ItqkHEAoTXFqjJJPE1cSgDMD2Q
         E3juE6w8wdISqu30+in3tjQLQ/1dh48sDg//0JgDci04HknEJCmnqDJnXjt5cSKdUTZf
         TTJf+CcvO+obpV/I50WxUozoPU7URanIQZczKqA2awjq0+wxtOLeFNzeXgAua9WUaby5
         HEF/BnPHHQgawhVRDHctlas/j7OwsGHq+YdgXwy8mU/PKShS04LqvotqZ/Mmh4C6f+Jq
         KSqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JnQ8QGg4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m184si11102637ybm.191.2021.01.15.14.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 14:55:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JnQ8QGg4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0Y0T-0003Np-1y
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 17:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsJ-0003mt-FS
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:23 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsD-0005Ie-KD
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:23 -0500
Received: by mail-pj1-x102a.google.com with SMTP id g15so1760177pjd.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6xhR+Wss/1TBEEfYwI3TvMrUfFA269smX1ho0M9IxOI=;
 b=JnQ8QGg4P0SWQVCDznCnfTfLo5HbgayFH1jkcgJ7cs43998FeIl9D0N8Wt7zS+RJZU
 d9YeASIk+w2OuLNvplylox7MKfrpxkPhmAGh9YOfWfLe3QjD7GxsVBexQSCjP50XFcIy
 BdYw3KVr1qb7IXePM4vP+aaxbicDjYyBXw0FPfGC1b+TGZRcXkHLZ/8omVtyBIEn2LrK
 eriD7Xwm/ffD9/M6nS8blO1+qQJS5IjEzQD3yaGs6zGtNca1GjOaCNATIp6qM22tSL5u
 2w1iZae0p2+c4CL36BVFiy1hBoAex7Z/SdD+oVXXg4fUv91i+NKizxWC1nE9IRKP9OYT
 A6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6xhR+Wss/1TBEEfYwI3TvMrUfFA269smX1ho0M9IxOI=;
 b=ZUrN1ZZYEwqyMwSd7E2o9UjNz+tOz6d1FFlTlXu5IkNXNZfzxQp78n0X1tM9xgsgud
 cdoyxCEx5jP2y29guxfeHQaW/ukMvIgfK6lWKbIKr0F8EBuAzK23zKT8naUctFDI4XR+
 xNJw0Gg8K/PK2Gr6ht859bRdQLcN4mezlrubRLWh2APj1vczym/c5fdkCIocNZ15e3+e
 b91fHoGDsHh3Mb5oviBVb085KeCGYNIIoNi9AX0SQWfBxkH3dIRospxJe+7zA6/xnwU5
 lXw5EaBy6wHplcxxDdohuj1PkT+FKfaJpZ97PdFqL5ksisnYzkqXkcCVGakSCa9BKqXy
 biOQ==
X-Gm-Message-State: AOAM531xB3Q2AjvMy52Fye756aTpCGByZC49jIBQhloJYZ5oFrvTj/44
 vB/Hn5xCM/tiM9YFaPLm/mz0wPbLNZmK9lzK
X-Received: by 2002:a17:90a:ae13:: with SMTP id
 t19mr13247354pjq.52.1610750836340; 
 Fri, 15 Jan 2021 14:47:16 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/21] linux-user/aarch64: Signal SEGV_MTESERR for sync tag
 check fault
Date: Fri, 15 Jan 2021 12:46:41 -1000
Message-Id: <20210115224645.1196742-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nuu3QQ+vYHYT

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h | 2 ++
 linux-user/aarch64/cpu_loop.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index ddd73169f0..777fb667fe 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -21,5 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
+
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif /* AARCH64_TARGET_SIGNAL_H */
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 7811440c68..6867f0db2b 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -133,6 +133,9 @@ void cpu_loop(CPUARMState *env)
             case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
                 info.si_code = TARGET_SEGV_ACCERR;
                 break;
+            case 0x11: /* Synchronous Tag Check Fault */
+                info.si_code = TARGET_SEGV_MTESERR;
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.25.1

