Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5375671lfm;
        Wed, 26 May 2021 05:20:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbXozjatUqhKk7iscng3R3A67TRSWlpTv963jkTJWaiIVZQBWURUBF56RJv7EFJUzeh+2U
X-Received: by 2002:a17:906:ac1:: with SMTP id z1mr20929577ejf.463.1622031634012;
        Wed, 26 May 2021 05:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622031634; cv=none;
        d=google.com; s=arc-20160816;
        b=ixU4Hwf5sZm0VYqVu7AoOo7D3YofoCgRBdEW1feCW6CMLJKQy+rXe4hn788E/qDbfi
         lyAthFo+n1TD51/gejEu1KV5tPJo5EU9tRbQpyPg/TanKuDSJbTX+F9ybMRoMPXKJD0V
         +thUUEPmfz0VIwSZ8c3BRZIDnQe1US082sDPZtsXyG8wneECNDuVE6Kk8EhqRJ1BIrBD
         ov0E8IOfPk7waXzXw/P23KvQyjXcfEOsFjdsBYVe9vFzUmCtjDMivF4dONsydL3qeaz7
         5VImFUyHPHiJgTcNywvaAhKNMnw6spgG5IA2zyBHD3NewRneiYMA6p2vxMViFq6IxaH6
         f2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KfA8qXEUy9bbVVK/akFipulP2A2BpZIpjv1lSajdBSk=;
        b=YX5WnREHBtm5LkX8al74BLneJQtze2l50YGFdhdAXGo5k43OUKPXpB+DxORUZ4Z4Pg
         myTgqJD3Gk6EP5pGBUEHfMedmq5LMHVHz/N1KFF3TVSSLPA9ZNBngxL6twO4W/CWiWY2
         436gJeoMOISLTOoVTSwoPHkKTTLpAAzcnF6h1RnGNFl/TE6fy9NA2cBPLx6co2QZvIMA
         rBQFhIpnO5nlkAdRz5ayQg+sxqaq9s1OcewznEl3zOd9hoXCxrTtFAtYGtnvSHiwJ3F7
         0aVqB0bVmqoC77PJihj5syWYjc2+GYnVOkvOicVCSykY4FYuWtOs5KXK3efxgrmJvbXk
         S8xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=MrJtjQcW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si21040691ejj.281.2021.05.26.05.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 May 2021 05:20:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=MrJtjQcW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llsWX-0002NC-4y
	for alex.bennee@linaro.org; Wed, 26 May 2021 08:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsV6-0001aW-LR
 for qemu-arm@nongnu.org; Wed, 26 May 2021 08:19:04 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:50748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsUy-00032j-43
 for qemu-arm@nongnu.org; Wed, 26 May 2021 08:19:04 -0400
Received: by mail-wm1-x332.google.com with SMTP id t206so614697wmf.0
 for <qemu-arm@nongnu.org>; Wed, 26 May 2021 05:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KfA8qXEUy9bbVVK/akFipulP2A2BpZIpjv1lSajdBSk=;
 b=MrJtjQcW06ZUIL9QbU926bZ+aJOBv0P8zFwQThgWw1iweY40rFyvXSbKwmEBdYVwut
 T80BuEKPokFRIXVpZ0DSSbh2o9PKG8KFPcy0q59MIVtsIs5NbdT9wVnv89Mr3V0ok17K
 8oCIA4Uv/nmQAvOsIg6wZp/vO3U7tFIpacOXtIyU6GE7LFDy3y5ZeNDc1blMhFdgL0I8
 PavNUPsZ/voZg8iRC0eFOoQ1MuGnc9WVieTA9Wkskyq0G+cgAROdAuIGSfM8oa8HKpKL
 cKow6NhOwDnc2yQ0M69iSd9sHjNU5Tnqc32TrJ/TDxAr71Ec0m3Tywmfg/YgaYRS2tTP
 Qd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KfA8qXEUy9bbVVK/akFipulP2A2BpZIpjv1lSajdBSk=;
 b=CfEaOdwWTBNDzU4VRFN6YstA0S90YIHUj+EPHgmeV2w+Z3ITZfeSf1kpE6l8+WnOFg
 tbUU4QEe2LUUxapocIG9/R4FAbICuR32XDJ3LV6pNkcKqd5uEIBmpfQcHqCQxD/UxcPM
 REjZp0k8nhSEgm5yuMiy+wtL6NkXYmBpTga7so05PdP98vSeF7jAnPqM8OmAmbLRK/hx
 QPbe1fTITYYNzeL3Jo4vTJXOeAgQdwlB+/ZHow2OC+rpKurQjIfI+04MlNEK6SLOwYiU
 JKCjTmnHdBV/rBbtoUTj8OVjr/wyKu2FNgo7ZlAzuNY5Xrqg5zt6rKQtld/y4rppwF3t
 8zGw==
X-Gm-Message-State: AOAM532CDHgmT0HASlDJq2BYJaPPRozTPQ2KENDJbwA9a5G0sB9BYsr8
 jZgO1kxVYucdsUdtFmlkcnmG+sLctsFI6uNLtBOLjWkt0sSiHFTd0jesaLyhZkgeQbLRIXvqZ0e
 qY1FrzmvRDthDCerzXT//q7tNKW9DEQDmMXtfk8ouvDfCMFwWvoxeeqRa9l1en+Ynog==
X-Received: by 2002:a05:600c:219:: with SMTP id
 25mr3096259wmi.156.1622031533102; 
 Wed, 26 May 2021 05:18:53 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id c7sm19811030wrs.23.2021.05.26.05.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:18:52 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCHv2 1/4] target/arm: fix missing exception class
Date: Wed, 26 May 2021 13:18:44 +0100
Message-Id: <20210526121847.1935454-2-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526121847.1935454-1-jamie@nuviainc.com>
References: <20210526121847.1935454-1-jamie@nuviainc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=jamie@nuviainc.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jamie Iles <jamie@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o/QnrXRzCMTq

The DAIF and PAC checks used raise_exception_ra to raise an exception
and unwind CPU state but raise_exception_ra is currently designed for
handling data aborts as the syndrome is partially precomputed and
encoded in the TB and then merged in merge_syn_data_abort when handling
the data abort.  Using raise_exception_ra for DAIF and PAC checks
results in an empty syndrome being retrieved from data[2] in
restore_state_to_opc and setting ESR to 0.  This manifested as:

  kvm [571]: Unknown exception class: esr: 0x000000 –
  Unknown/Uncategorized

when launching a KVM guest when the host qemu used a CPU supporting
EL2+pointer authentication and enabling pointer authentication in the
guest.

Rework raise_exception_ra such that the state is restored before raising
the exception so that the exception is not clobbered by
restore_state_to_opc.

Fixes: 0d43e1a2d29a ("target/arm: Add PAuth helpers")
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---
 target/arm/op_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index efcb60099277..078ed74ab962 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -63,8 +63,10 @@ void raise_exception(CPUARMState *env, uint32_t excp,
 void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
                         uint32_t target_el, uintptr_t ra)
 {
-    CPUState *cs = do_raise_exception(env, excp, syndrome, target_el);
-    cpu_loop_exit_restore(cs, ra);
+    CPUState *cs = env_cpu(env);
+
+    cpu_restore_state(cs, ra, true);
+    raise_exception(env, excp, syndrome, target_el);
 }
 
 uint64_t HELPER(neon_tbl)(CPUARMState *env, uint32_t desc,
-- 
2.30.2

