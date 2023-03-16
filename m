Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp165473ejb;
        Thu, 16 Mar 2023 03:58:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set+lBLSHrFG0THCXEaoKucvkA3eXZTnBynGJrbCIeqzhrWAQLDg90ED3ZSkijySQ8f7ND47P
X-Received: by 2002:a05:622a:1909:b0:3b6:2e9b:cf2b with SMTP id w9-20020a05622a190900b003b62e9bcf2bmr5688877qtc.14.1678964314353;
        Thu, 16 Mar 2023 03:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678964314; cv=none;
        d=google.com; s=arc-20160816;
        b=Q/gtXNbR42HnNFEvKoiqsX6DZPy63B9KDy1UfkPDLwjE2Um0D3QLh/mVB34+yU105x
         VS5DTph4b68urTNiyLkcZRf1fAJ47StZg7pAGCqcXpNPg8WFEwoOc9jZ1y1L5WQnLXL6
         lhbrysk16BxHUvqMIiE0JBi1/aHLQ1q/tKyvYzb63q3r481hJmYfmq5tIXA9yK4S1SLh
         HhOsXQ8fJkNkYrvMKEefpCOK9pZ2mDwa6XlnJraas0D2gN8vPbZZgIm/StBaNvaTOaJt
         rIRW/gSxDCVV0YxR1ft6uW/WQmvIHFSvVHSgpxeYSGRKh5MIMdRJdvnDEO1KEzEO71y7
         NgvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Pg1jZON4duZyKMHBrOX8HJjuZRqYcy7K1Mi69iN6ey8=;
        b=SsgpO3pg3uuo1+kIq4GWsMYyYcXWzo3F7GXrbOSRjZq+zmf5hiOklzDSu+Qelrrkww
         s+8os8kG0lrTb9AyPLiKqsCfzGXEcub3k3ihn6tMiiGGnQUdINNWSfLr9BcinAUwjq5k
         HGW0cLdPiqpWxUqGBvK2cqdzaNjEKcWHRxE1oPWArSZQWSyXCpiV+aqkjkICkWbOlIM5
         15OqI82fK0W2XE8tXxL8nY+cETtup3x8C5j+rpR9otvf3RNVz0fHn9KT4ST1jDcsEM6H
         8mhTfRS7dTJcNSCIOjKZZkzKMNJcmFLTXzzkR/5J2DHXSYHIOOhnvOPgwg0uXG3CazlA
         jLsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qgwKpFjM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16-20020a05622a059000b003b85176c841si7088808qtb.527.2023.03.16.03.58.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Mar 2023 03:58:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qgwKpFjM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pclJI-0005oh-AU; Thu, 16 Mar 2023 06:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pclJG-0005ih-NJ
 for qemu-arm@nongnu.org; Thu, 16 Mar 2023 06:58:14 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pclJE-0003vX-Iv
 for qemu-arm@nongnu.org; Thu, 16 Mar 2023 06:58:14 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 bh21-20020a05600c3d1500b003ed1ff06fb0so784379wmb.3
 for <qemu-arm@nongnu.org>; Thu, 16 Mar 2023 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678964291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pg1jZON4duZyKMHBrOX8HJjuZRqYcy7K1Mi69iN6ey8=;
 b=qgwKpFjMB6nDA380I9G5u5OhhkIF4tU2dV/MCsOoTVubrZV50UCsD0n8aoWS18AOr+
 xuNz2Y4GFKcuovDhvK37Ft2TYphZIHZQ6l2m0qaiRBK1Jl8XD6jXMcMhIXvlWrn1budr
 pkY1+yspqWW1+N+naQ5bEVff96dJVUor2kPfiKGNoRwipnwjtS2Z/1jB3Orgtn2ZBakG
 XyaipPV42dh1rMzONcgOCloq+YiSVg75Ew/ucRSw4XS4ByW5jVx5L0dXrisjAvB7qbd3
 oU6+1IZTSmMojyEPepQiIEViuyLH3P+FvaHLo2Hu4f+vSi2krmQoZiWl14lgsRfMjLFb
 yWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678964291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pg1jZON4duZyKMHBrOX8HJjuZRqYcy7K1Mi69iN6ey8=;
 b=LL6kXviTh5tRvGxXwwJF/hQRcUyGnMvdLlOhTqIbv5qTpnke4y8KqrzEnGmpB68Nc4
 BDbaBjlsCV/K/2S67hTpYvlYm68r07zVwGNNYBPXtCWvYwu7wgN3x2Pw+ZzIqHjXgeWP
 QWSefeD0brez1EAkqiktWqm0gmN1bcBJPGgOdZY1yPWkLVMQBzhSaQhtokndS3CyYOm/
 w6O/EDIL04FNErsDwwQaDdZmBgnUtKeCMlkZot7n80vwiSbUajLqcgGLU6MUEJ89m1DK
 75sYe+k8Up2MNyJNz/xo9mcGrhCDbw/xF8CY2SMiJYXVzIjG1dUox+QXMLjKZBQgP1kd
 YhOg==
X-Gm-Message-State: AO0yUKWDlekkEQMbYCwIFykpam0KE2d0AsVBFfmckOzTwyvxaLsgp0Kw
 bjqNZjox4DOkmnhhX/ePDcGWSd2a5feeoUwuFew=
X-Received: by 2002:a05:600c:1d1c:b0:3ed:3038:b9b5 with SMTP id
 l28-20020a05600c1d1c00b003ed3038b9b5mr6260364wms.4.1678964290673; 
 Thu, 16 Mar 2023 03:58:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b003ebff290a52sm4996764wmo.28.2023.03.16.03.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 03:58:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0] docs/system/arm/cpu-features.rst: Fix formatting
Date: Thu, 16 Mar 2023 10:58:08 +0000
Message-Id: <20230316105808.1414003-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: DSUzMxcXnfKp

The markup for the Arm CPU feature documentation is incorrect,
and results in the HTML not rendering correctly -- the first
line of each description is rendered in boldface as if it
were part of the option name.

Reformat to match the styling used in cpu-models-x86.rst.inc.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1479
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/cpu-features.rst | 68 ++++++++++++++------------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 00c444042ff..2b1a28422fb 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -177,39 +177,32 @@ are named with the prefix "kvm-".  KVM VCPU features may be probed,
 enabled, and disabled in the same way as other CPU features.  Below is
 the list of KVM VCPU features and their descriptions.
 
-  kvm-no-adjvtime          By default kvm-no-adjvtime is disabled.  This
-                           means that by default the virtual time
-                           adjustment is enabled (vtime is not *not*
-                           adjusted).
+``kvm-no-adjvtime``
+  By default kvm-no-adjvtime is disabled.  This means that by default
+  the virtual time adjustment is enabled (vtime is not *not* adjusted).
 
-                           When virtual time adjustment is enabled each
-                           time the VM transitions back to running state
-                           the VCPU's virtual counter is updated to ensure
-                           stopped time is not counted.  This avoids time
-                           jumps surprising guest OSes and applications,
-                           as long as they use the virtual counter for
-                           timekeeping.  However it has the side effect of
-                           the virtual and physical counters diverging.
-                           All timekeeping based on the virtual counter
-                           will appear to lag behind any timekeeping that
-                           does not subtract VM stopped time.  The guest
-                           may resynchronize its virtual counter with
-                           other time sources as needed.
+  When virtual time adjustment is enabled each time the VM transitions
+  back to running state the VCPU's virtual counter is updated to
+  ensure stopped time is not counted.  This avoids time jumps
+  surprising guest OSes and applications, as long as they use the
+  virtual counter for timekeeping.  However it has the side effect of
+  the virtual and physical counters diverging.  All timekeeping based
+  on the virtual counter will appear to lag behind any timekeeping
+  that does not subtract VM stopped time.  The guest may resynchronize
+  its virtual counter with other time sources as needed.
 
-                           Enable kvm-no-adjvtime to disable virtual time
-                           adjustment, also restoring the legacy (pre-5.0)
-                           behavior.
+  Enable kvm-no-adjvtime to disable virtual time adjustment, also
+  restoring the legacy (pre-5.0) behavior.
 
-  kvm-steal-time           Since v5.2, kvm-steal-time is enabled by
-                           default when KVM is enabled, the feature is
-                           supported, and the guest is 64-bit.
+``kvm-steal-time``
+  Since v5.2, kvm-steal-time is enabled by default when KVM is
+  enabled, the feature is supported, and the guest is 64-bit.
 
-                           When kvm-steal-time is enabled a 64-bit guest
-                           can account for time its CPUs were not running
-                           due to the host not scheduling the corresponding
-                           VCPU threads.  The accounting statistics may
-                           influence the guest scheduler behavior and/or be
-                           exposed to the guest userspace.
+  When kvm-steal-time is enabled a 64-bit guest can account for time
+  its CPUs were not running due to the host not scheduling the
+  corresponding VCPU threads.  The accounting statistics may influence
+  the guest scheduler behavior and/or be exposed to the guest
+  userspace.
 
 TCG VCPU Features
 =================
@@ -217,16 +210,15 @@ TCG VCPU Features
 TCG VCPU features are CPU features that are specific to TCG.
 Below is the list of TCG VCPU features and their descriptions.
 
-  pauth-impdef             When ``FEAT_Pauth`` is enabled, either the
-                           *impdef* (Implementation Defined) algorithm
-                           is enabled or the *architected* QARMA algorithm
-                           is enabled.  By default the impdef algorithm
-                           is disabled, and QARMA is enabled.
+``pauth-impdef``
+  When ``FEAT_Pauth`` is enabled, either the *impdef* (Implementation
+  Defined) algorithm is enabled or the *architected* QARMA algorithm
+  is enabled.  By default the impdef algorithm is disabled, and QARMA
+  is enabled.
 
-                           The architected QARMA algorithm has good
-                           cryptographic properties, but can be quite slow
-                           to emulate.  The impdef algorithm used by QEMU
-                           is non-cryptographic but significantly faster.
+  The architected QARMA algorithm has good ryptographic properties,
+  but can be quite slow to emulate.  The impdef algorithm used by QEMU
+  is non-cryptographic but significantly faster.
 
 SVE CPU Properties
 ==================
-- 
2.34.1

