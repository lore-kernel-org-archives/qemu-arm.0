Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9081463lfc;
        Fri, 19 Feb 2021 06:54:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaBG3CIK3+0m01/UaVmkPXrS6qbgT+FNuOC8vCkGH2MeJnKynkwZbJuxMq6SYaPB7ukRKf
X-Received: by 2002:a25:2f97:: with SMTP id v145mr14982416ybv.221.1613746461957;
        Fri, 19 Feb 2021 06:54:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613746461; cv=none;
        d=google.com; s=arc-20160816;
        b=lCIbrzd6CY0TJzgYO2IyREkGtbMXoDbLxOiuZrtxV3grlVcbwuyWtpG1ZxubtTrMo+
         +8X5npNrh+jSfGvxpnipTuQVlOQWFcm/vEkjHJoo1aGLXs87LJrpUs6dte8Sc+Wg0pHd
         x9T52BzZ/RM5nwZPp2Fc53aQCKxWPoN9TYNowm4tnlBybckS8kZtVQrOgwGdftTnUNUg
         0DaMWuDYbHVZIyHqzgiviLO7xuX+xw8D0KlirTT7Rv9DeGXX0yGjAc5NjwU5riQWYjJN
         kcA7/cuaQ7A1KiI8pQVo8Mwv19bUGfySXngoaF9E/AWZ1G1mK6vTZbDg08VqCxpLXUfq
         MMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VlIXUUm5ExpVQJSv3wuqQbS06DQIaBTiir8iebjqnw0=;
        b=sS2zAq0mvtJ/S65Pb806IkZKjzP3yCzchTZOowAe/cunrPblRe/5PoXRLuXtJlSWs+
         5/Ce1GbSJ3EO0EFlqr+nVHFSKnUmHNQtUOeDCqtfwSntyC+8ZQuIEFXkcucPPxctoF4l
         m+2JBCSQ2WtiaIRVMle1XUDXQFu+LG0E+vALT1z7l7UGjsK7ZmrPQDo3tQJciudsnhUI
         ZC336wHvQyTb4lrSmrvZoDMOwrrT75M4KQaRJ9Kq3RYuJvFEQx14rK9Kie98+EzZ19CD
         mehQmrFpHZe/ha3ua9hCPKx24mm8Bij9HHKtZ7s7Q2OGB/Z0kksAKJUTt0vi5NpKCm/o
         VwRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VcScL0gC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 206si8571831ybq.133.2021.02.19.06.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 06:54:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VcScL0gC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7Aj-00029q-AA
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 09:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73P-0002HD-Vj
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:46:48 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD739-0003SJ-Q9
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:46:47 -0500
Received: by mail-wr1-x431.google.com with SMTP id v14so8880514wro.7
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 06:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VlIXUUm5ExpVQJSv3wuqQbS06DQIaBTiir8iebjqnw0=;
 b=VcScL0gCuf9fLD21jw6ORKCliUJiHUmUmTIjoJ5/X3BayI9sf7zhETvGiM/BT3cup2
 WdijjovxoGOpypQkrKjO4sL6ANa+LVp68bNDqjfoegDVOWi+AkOXmx3Cc79YSvdJHwiQ
 FbSPX+UG9XJkvPC8hlewJOa3uPkiumE5/38dgr7oDhItPhkcAMu7EH+XrqG76ZbprBqu
 LAu/ylL6iMC2ouiCfsTrI1YLYIA9QNA3Is/l+/QYe7vUJ4kWQ7prWFuwTrM8m2gN8dPz
 Lacx0SU16kR30nEv1gGq2bKlobopkjsHMFN9X0y0Pu4UVGhx0igcn5i6IXt492GQy2OM
 9Mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VlIXUUm5ExpVQJSv3wuqQbS06DQIaBTiir8iebjqnw0=;
 b=NE+gbqWbWFzL44NvZJMjo5k8Qzk4uzvL1kZ/VGa8eTr3/Gz189uOITac1Su4WDrtLi
 xwB8pvSOaiRYmlT9MFwqcCJd/+KEWP9HN7LhTp8A/4kBJ/YWUu4LgJOjYqQboGZGLBG/
 WJZSKt+y1Wm4xhmuhPt5Tiav33sjsrOQNyf0kw9K7WT3qyQyl23MWmjUcYvSwMFe1VR4
 FhuZLYUnUUAgJwT7KGYT2peO9vf29IWuKsy4bsv+1zObXtREXRB5B/vBs/mKtvhSrKh1
 dxEjCOYsINjg92CyWfeZ0SYjdIW1HguLzcBKpvCRp/RbZYhoUBlJj8hGCFhXxaPWm7+A
 nHbw==
X-Gm-Message-State: AOAM531jTmyHxQa5uzj/OcGCN7TJNerPj8JvZ1glq+LgU5Gkavq6eo9N
 seVrqgDYDFAR9qCLti3ynlFcsgRxPj9DjA==
X-Received: by 2002:adf:9c8a:: with SMTP id d10mr9729887wre.266.1613745990431; 
 Fri, 19 Feb 2021 06:46:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/44] hw/misc/iotkit-sysctl: Add SSE-300 cases which match
 SSE-200 behaviour
Date: Fri, 19 Feb 2021 14:45:46 +0000
Message-Id: <20210219144617.4782-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0awqmVPEeVxz

The SSE-300's iokit-sysctl device is similar to the SSE-200, but
some registers have moved address or have different behaviours.
In this commit we add case statements for the registers where
the SSE-300 and SSE-200 have the same behaviour. Some registers
are the same on all SSE versions and so need no code change at all.
Putting both of these categories together covers:

0x0 SECDBGSTAT
0x4 SECDBGSET
0x8 SECDBGCLR
0xc SCSECCTRL
0x10 CLK_CFG0 -- this is like SSE-200 FCLK_DIV but with a
   different set of clocks being controlled; our implementation
   is a dummy reads-as-written anyway
0x14 CLK_CFG1 -- similar to SSE-200 SYSCLK_DIV; our implementation
   is a dummy
0x18 CLK_FORCE -- similar to SSE-200 but different bit allocations;
   we have a dummy implementation
0x100 RESET_SYNDROME -- bit allocation differs from SSE-200 but our
   implementation is a dummy
0x104 RESET_MASK -- bit allocation differs from SSE-200 but our
   implementation is a dummy
0x108 SWRESET
0x10c GRETREG
0x200 PDCM_PD_SYS_SENSE -- some bit allocations differ, but our
   implementation is a dummy

We also need to migrate the state of these registers which are shared
between the SSE-200 and SSE-300, so update the vmstate 'needed'
function to do this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/iotkit-sysctl.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index c67f5b320ab..7f8608c814c 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -105,6 +105,7 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             r = s->scsecctrl;
             break;
         default:
@@ -116,6 +117,7 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             r = s->fclk_div;
             break;
         default:
@@ -127,6 +129,7 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             r = s->sysclk_div;
             break;
         default:
@@ -138,6 +141,7 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             r = s->clock_force;
             break;
         default:
@@ -202,6 +206,7 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             r = s->pdcm_pd_sys_sense;
             break;
         default:
@@ -348,6 +353,7 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl SCSECCTRL unimplemented\n");
             s->scsecctrl = value;
             break;
@@ -360,6 +366,7 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl FCLK_DIV unimplemented\n");
             s->fclk_div = value;
             break;
@@ -372,6 +379,7 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl SYSCLK_DIV unimplemented\n");
             s->sysclk_div = value;
             break;
@@ -384,6 +392,7 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl CLOCK_FORCE unimplemented\n");
             s->clock_force = value;
             break;
@@ -420,6 +429,7 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         case ARMSSE_IOTKIT:
             goto bad_offset;
         case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
             qemu_log_mask(LOG_UNIMP,
                           "IoTKit SysCtl PDCM_PD_SYS_SENSE unimplemented\n");
             s->pdcm_pd_sys_sense = value;
@@ -569,7 +579,7 @@ static bool sse200_needed(void *opaque)
 {
     IoTKitSysCtl *s = IOTKIT_SYSCTL(opaque);
 
-    return s->sse_version == ARMSSE_SSE200;
+    return s->sse_version != ARMSSE_IOTKIT;
 }
 
 static const VMStateDescription iotkit_sysctl_sse200_vmstate = {
-- 
2.20.1

