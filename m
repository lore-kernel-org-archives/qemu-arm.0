Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2220166ejc;
        Wed, 24 Aug 2022 09:00:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ko34eG7LKpp52xWrK5ocFupPPsXtpNfFddZuZCSuAETHXtH059wvhFcGwCzui7stZfdb2
X-Received: by 2002:a05:620a:1476:b0:6bb:363e:519e with SMTP id j22-20020a05620a147600b006bb363e519emr19818137qkl.311.1661356811771;
        Wed, 24 Aug 2022 09:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661356811; cv=none;
        d=google.com; s=arc-20160816;
        b=S1WsbNh/BeNWR5gp2L45+88e+tBvMhzebzjZoOBsHSxGKOo8oUbOAiRC7PSn912DW+
         QmH2kkOJ2/HpmLBHnCik0gSByEWLnJfEtfdvoJNG25SBAhlXMgSdqlklWrI6wlDSct+3
         ci+WMJm4YvtEJjvHHlvE0uHND47rpi+s4sWpCOKLX7ej3d3wO01XsswfhnmnzOM2rByU
         l2YQWp+DGiGQNetqEVHYuyimLGeUNeTGyBnFr216XS6jfbOD/xSOGPEheI8c1Ij5e3C/
         OShfSbkNWY4f1pNfy5/rI/tCMB2A5AJYlUphCu6EPNinvs9CyQf3oEyxqMrHOPtrlS8B
         hGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Wxzqdi+mz10a5dL9bQmvPnzJspb9HKfQG9mi/kFyPd0=;
        b=YbLtKgaS5rO2AkTSSLY1DuXXrNdHPcxelpPMCOgiMLGb+mHAedfEysRCGdQYCR3rS6
         vspCX1MrhG0hsZp/UMVf5nKnEUxBcYIqdDBfTVNeGdiG+xUaaf3VB4+EVFuhgMIK1E1+
         WzpcYd1jn3IjtHNSesNT9ToxpTLTwQELyEu0+rPZ/rqmLVuEbfsiqkNu6/cMVUk0S893
         tE1PJCpxoVsfHSyCUnYNNpWZavGOlYIeg6AUS0Usy6cRhgbgQ751ClQSomfSBVHOi5hP
         b0LTW7pCVtCgusxrF3UclZsqD9B/Kc6Pkx8/5wRNwrQQNRQHhXOemumB8ZMOyJuHQ6Nv
         jAeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oNfi3TFF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8-20020a05620a404800b006b5cea10197si9738872qko.731.2022.08.24.09.00.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 09:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oNfi3TFF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQsnb-0000bX-65
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 12:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf8-00029V-El
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:27 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf5-0002FN-SA
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:26 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso1181118wmc.0
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 08:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Wxzqdi+mz10a5dL9bQmvPnzJspb9HKfQG9mi/kFyPd0=;
 b=oNfi3TFFRFzGLF0iMJJtspA0T8SSoBaGniumg6fYQcC5nU/NPFOY7ijCUNhsnADBuZ
 Fb62+FD/VrErLPfrU0/+Kl0v0BId2jvvFcud74GvRkCZ7UoudTCw/HXGPDUjACG03mP/
 2Vny4Rjfszh+P0OhWZoirjEFeyAbSH5nnKUV2oobiO6zZHKNNmoAwSycbeij70tp3Shl
 Ukb29zbWZG3gwK5qRdDDkQbID5kINZT20yVX+jG1TyfOxwEjst1YMpS2wyF13wAzgI3d
 pOvIjTDJ1TzoveGs13cZRNSzzW1rIfrdGmFsLA/FOUoeN+FrezqcgN4mCd6vShG/Zw5s
 o3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Wxzqdi+mz10a5dL9bQmvPnzJspb9HKfQG9mi/kFyPd0=;
 b=076QN6TBAw1HswaSHit/PTn5OyLzzbEC3Nl4uLAnNdIcoODy1zpX6QBcoHtzXqD6Pt
 TnMyAQK+B+JfT3bc8NQ+++EJlbyVVMnz1E3SNtq2DwjoBdX5zVsxWC7j7dHcn/eG4IsU
 TUrwLJkBXsiwv9md3ioHSOCnsfREYRfN67enuvc8PpKHwZ9XoLzNYnm0CgZ1SFwc6yBu
 +7haHswhIYHS+u2Ac2jplc4nElPUL+eVLY4D9OUZeZneq4fG+8k4P3yHeAfi43Etxjoo
 b1M4P3IhB6Z5Qd99h2fto+7w18cOpWxKl3iRyjygtmNAxgy70hLIrqx67eEJWqchtHGm
 iw2g==
X-Gm-Message-State: ACgBeo0CuU1DuQK4QIfTa0dD7vcyG9yEMxg4MLkBfYhcCHKFV2WgKdCP
 OLfRnU3m4FKrzR14CWr+sZpMMwVKMIYOVOVR
X-Received: by 2002:a05:600c:5010:b0:3a6:804:5b08 with SMTP id
 n16-20020a05600c501000b003a608045b08mr5581717wmr.10.1661356281578; 
 Wed, 24 Aug 2022 08:51:21 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:21 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 05/10] hw/arm/virt: Fix devicetree warning about the timer node
Date: Wed, 24 Aug 2022 16:51:09 +0100
Message-Id: <20220824155113.286730-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l8ZfY4gJkVH/

The compatible property of the Arm timer should contain either
"arm,armv7-timer" or "arm,armv8-timer", not both.

  timer: compatible: 'oneOf' conditional failed, one must be fixed:
  	['arm,armv8-timer', 'arm,armv7-timer'] is too long
  From schema: linux/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ca5d213895..5935f32a44 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -344,7 +344,7 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
 
     armcpu = ARM_CPU(qemu_get_cpu(0));
     if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
-        const char compat[] = "arm,armv8-timer\0arm,armv7-timer";
+        const char compat[] = "arm,armv8-timer";
         qemu_fdt_setprop(ms->fdt, "/timer", "compatible",
                          compat, sizeof(compat));
     } else {
-- 
2.37.1

