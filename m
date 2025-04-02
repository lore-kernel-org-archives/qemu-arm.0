Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3462133njd;
        Wed, 2 Apr 2025 06:53:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfqMYvbrsP79dL8QjN6IXegbeAPy+DKQeIdLmHWkgvABdGwXcZO+ZoXcsdSPXgK6Bt8ot6Rs2n203sNg==@linaro.org
X-Google-Smtp-Source: AGHT+IFlT5n6qisyV6U5aHgqQQYQwQQObhyL58dA4vsC06GvHvjZCm8ol6jo2flieoti8kZk1GDL
X-Received: by 2002:a05:622a:1354:b0:476:6625:eed4 with SMTP id d75a77b69052e-477ed67a5femr231980611cf.38.1743601989648;
        Wed, 02 Apr 2025 06:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743601989; cv=none;
        d=google.com; s=arc-20240605;
        b=iXH838gU129CAEuJQQZlE9W7JO0yrKCPve2eh/j1B74PjPZG/oj2zgO+TPhB5KIAmC
         aSM/ulmty2AsouQ0FR9DYjBq1NXGLUD0cXFepAaS9954sSn6MCHU+zZR8s96X7q+ypFw
         dY5dMhR8CRkr7E23lzi0pK3yXDt+Py76v879ogR/m8O18jNgRTQDqW3eIdxPQ6S3OyBs
         FscjS53wTbX7E031dKU8gxXslQ9cwngZwvKCVp3T7zFql11qcZcpuYEWkPHGgci7IDt0
         uJFmdWylcGumt9E/juzu2fXp+gRLzyTiMdMeurRzOfD/mhnm2nPnaqSei/UfcKPp7iUi
         x3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZlWkA8Hnp4VhLorzaE2Emb2h6bKTBaRmXpXEi5waIDw=;
        fh=5y3keCLtsD5SnVtO9H4HEGBM2WO3bexKZtwkNvJJEt8=;
        b=PFnfOzFyzYvh1EVn+V0h7QSG1G/tT2T62E2h/kX8/kNc4ClCbl8SnKZeXD3K/wdfhA
         lW1XvzxMA7HzM16e+9Xbc0wSoIJ/8DeKIN7ZoFdnhXvwj4w94BRoPA5jgvMkTfW/imHJ
         30W9KpUeoHZ/tQGDClJaBlxUzppG4jPeuW8RZU8WBm+e9UoaZSQTC+mez1jMfzvaCYvC
         m3o6Qu6ems1CNY9IVyVLn0HXKcLcnDNIMX/2ajrPueF4EXjJCWWTeziM16srbS3WwdkB
         YN4nCA/w7MWTl+Awm+2NG7dRSjvECzxVycgnxmMZSNjj2TyEI6k1eT2LtpZn0uhy4Anj
         Mf/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=oTM0vdXi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47782a47707si105192601cf.142.2025.04.02.06.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 06:53:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=oTM0vdXi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzyWZ-0000JP-18; Wed, 02 Apr 2025 09:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1tzyWK-00008b-1k
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 09:52:50 -0400
Received: from qs51p00im-qukt01072502.me.com ([17.57.155.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1tzyWH-0004cB-N2
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 09:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 bh=ZlWkA8Hnp4VhLorzaE2Emb2h6bKTBaRmXpXEi5waIDw=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
 b=oTM0vdXi6/JsCZ6ixS3I+eY3MvBlZRK+1rtfVk7vZQ6WZF1R5ezUNPVZSQKgi1tpy
 8j0iPh6nZciehUQzUFDcrLTFpae5FNztxLQmF5y7KVLyWvzEhK5hhJXwG9M/25h7vO
 QLHrp5Lexc+8h7Sh3xfsfLtx6sUqEoeeFb6KefWAwM2wTVRqIZ0Zf7RlytkJ2UxC8F
 TWz06cxy49RD9kW7JNUGCqBGgZmkxIYv5Z1JCtR0nLbqIn2791AvsuscbO5gf3XEBg
 faQ8JCqFrXkgwrvk7E6YlGlKdFbLZAjSwYwldcdClwl9pNiu/x/9SxRHpxg56ZJ1ng
 Q1YFaWy746IVA==
Received: from localhost.localdomain (qs51p00im-dlb-asmtp-mailmevip.me.com
 [17.57.155.28])
 by qs51p00im-qukt01072502.me.com (Postfix) with ESMTPSA id 8800B6EC037A;
 Wed,  2 Apr 2025 13:52:36 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <m.ynddal@samsung.com>, Daniel Gomez <da.gomez@samsung.com>
Subject: [PATCH 1/2] hvf: avoid repeatedly setting trap debug for each cpu
Date: Wed,  2 Apr 2025 15:52:28 +0200
Message-ID: <20250402135229.28143-2-mads@ynddal.dk>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402135229.28143-1-mads@ynddal.dk>
References: <20250402135229.28143-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xM6SEoQOSrlsW6vloog1goXbFNz01ly8
X-Proofpoint-ORIG-GUID: xM6SEoQOSrlsW6vloog1goXbFNz01ly8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=619
 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504020088
Received-SPF: pass client-ip=17.57.155.15; envelope-from=mads@ynddal.dk;
 helo=qs51p00im-qukt01072502.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: FOCFYqJufcZx

From: Mads Ynddal <m.ynddal@samsung.com>

hvf_arch_set_traps is already called from a context of a specific
CPUState, so we don't need to do a nested CPU_FOREACH.

It also results in an error from hv_vcpu_set_sys_reg, as it may only be
called from the thread owning the vCPU.

Tested-by: Daniel Gomez <da.gomez@samsung.com>
Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
---
 target/arm/hvf/hvf.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 2439af63a0..48e4b12725 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2277,28 +2277,23 @@ static inline bool hvf_arm_hw_debug_active(CPUState *cpu)
     return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
 }
 
-static void hvf_arch_set_traps(void)
+static void hvf_arch_set_traps(CPUState *cpu)
 {
-    CPUState *cpu;
     bool should_enable_traps = false;
     hv_return_t r = HV_SUCCESS;
 
     /* Check whether guest debugging is enabled for at least one vCPU; if it
      * is, enable exiting the guest on all vCPUs */
-    CPU_FOREACH(cpu) {
-        should_enable_traps |= cpu->accel->guest_debug_enabled;
-    }
-    CPU_FOREACH(cpu) {
-        /* Set whether debug exceptions exit the guest */
-        r = hv_vcpu_set_trap_debug_exceptions(cpu->accel->fd,
-                                              should_enable_traps);
-        assert_hvf_ok(r);
+    should_enable_traps |= cpu->accel->guest_debug_enabled;
+    /* Set whether debug exceptions exit the guest */
+    r = hv_vcpu_set_trap_debug_exceptions(cpu->accel->fd,
+                                            should_enable_traps);
+    assert_hvf_ok(r);
 
-        /* Set whether accesses to debug registers exit the guest */
-        r = hv_vcpu_set_trap_debug_reg_accesses(cpu->accel->fd,
-                                                should_enable_traps);
-        assert_hvf_ok(r);
-    }
+    /* Set whether accesses to debug registers exit the guest */
+    r = hv_vcpu_set_trap_debug_reg_accesses(cpu->accel->fd,
+                                            should_enable_traps);
+    assert_hvf_ok(r);
 }
 
 void hvf_arch_update_guest_debug(CPUState *cpu)
@@ -2339,7 +2334,7 @@ void hvf_arch_update_guest_debug(CPUState *cpu)
             deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 0);
     }
 
-    hvf_arch_set_traps();
+    hvf_arch_set_traps(cpu);
 }
 
 bool hvf_arch_supports_guest_debug(void)
-- 
2.48.1

