Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp120616lfa;
        Thu, 3 Jun 2021 04:01:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMq85IwFJxFJZDMSqw+ZqM1X9jhf1IUDBznqEU4zjqeqedaebNThiBEmWw5rE8yF/wuLG4
X-Received: by 2002:a05:6102:241a:: with SMTP id j26mr782320vsi.59.1622718094546;
        Thu, 03 Jun 2021 04:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622718094; cv=none;
        d=google.com; s=arc-20160816;
        b=YaWqFshitBNexpT/eZnzzJpmMWKxSIu7245fhKzwqx+tWAR/j1n6ygflqDtSwV+MMO
         DMGr5dRGu9rFWX+OJ8KUq1xR50wBWZ4TLC8hIDdYjk3SAClN0VcHbOHUl5vBNdlCqVzH
         cd1xxVhBJ15U1DJlFp/j/I0rIxp4VNWdtDYyE3x+0JVV+LwO8n5Vwc87IVNQlXsXU2E0
         /Z1m0rrMXCZE7Dq/6t3Kp3zWBSDFz3iECBgoK75RCVjjo1qdRK7SDeYQ7YdVjmCUVf1r
         JiL4RpkMadJaa/Ra2RNbNtINb+Ery5wCH8I4Ff2K0ts4UMWHeTRDgV4S41OXL+stBfjw
         zqpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=gycSz+LrCPwHp/tuXa4oFID4bRu6diM6F7pjskolva0=;
        b=pGDhjjOpOK2YpPHMa5CI/I5J6qIb5/s6BbE31YmHhKqgSehXeOzNEITywyQhIoYyoR
         ZtGBmRt9voulkXu3cYnQ1FFUTMQ4Def6rb+d9PPF6jmgwxhAm6BM8E5RSXoRzT8DrHAk
         AUTglkSx/XdtiBcBYQiJp17KNCzNVww87nJUWtxO2FALxrLNO1T4yNqsoYhKhaIQMvw3
         3V58L32pOgkM8q8DeGfj7z1CEafAKbrX/RM70eZDDXQ9nSIs9Q5JVoL0mw6bQ8kiR8xZ
         C0ZWoQdNfU2m4suJbf9rx+w9tpXLoBrXqP8Gaou4Qhw2BgXAx7mr8I8IxApfVrB/5Ze9
         8KGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pmtFCOvD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18si975952uap.136.2021.06.03.04.01.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 04:01:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pmtFCOvD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lol6T-00008n-QW
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 07:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lol6J-00008V-Mr
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 07:01:23 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lol6I-0003ik-0O
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 07:01:23 -0400
Received: by mail-ej1-x62c.google.com with SMTP id c10so8538484eja.11
 for <qemu-arm@nongnu.org>; Thu, 03 Jun 2021 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gycSz+LrCPwHp/tuXa4oFID4bRu6diM6F7pjskolva0=;
 b=pmtFCOvDWPchwUemN3tNn5CCQeKuOlHlz6ssCPJH86BozMTuyrfnnuWL4UDjHjvPUD
 cgX2LCav9ZP+tSgFvfzaIwRZh9vxQ34OFrOeHxQf7mi2j+Cf4D+5Gqvd8SpmAEdiRY1l
 fm7IirAEZs+kutVx5twHEzGpvmzxVI2ppVVWgiEj1IgJ0Dh408ZtkojHRoOsOwtzfg5c
 0S3lNBUjR7YZlmBB0gW/atY/hkhwgyVc4/wBnds2Wy7g/iumXbH0YMPhB63WpJ+QLOiN
 o652KO5brNDVwFmtFlDH10KXgSVycd5VPIynMJHQNy5Xl+soz8LfIbhqFEwUcanHTm67
 uvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gycSz+LrCPwHp/tuXa4oFID4bRu6diM6F7pjskolva0=;
 b=gwo72OJaqySgR8WvxNR5MOHqNjtY8hvfAXR+bsSnZwLoIjMwPNWLm9mq3fxPBxW/Si
 ksxqGfKiAUJLKAxxZuY9Q0QfasESZtEwXodY0NUjT9fFP9TzKCaYmhp6WqBeoDMWv2N2
 y2KagQJCcaaj3Sbkjsf6LEAFiuwita9dFeHwpX90dFtlHKBPDQPcTtbs5Qrv4bG2vZRn
 GItxS0AAm8qegMZxO0lqi1gTzJNFn6HJ6nyOKkrXgLhVZIVnfFRS0UpWPR7BtSpKbPDT
 m/N1TyJmmd2ary3jskKx502l25dYbgf6uCx9coBgkU2++fhaJPhaCVHrjB/ndw38QCbo
 cEgQ==
X-Gm-Message-State: AOAM532L/NRt434EdOSN6llREfNqZnhEEDlJ2Jii7vV6Mcrw8Me57og+
 ng1sgyOCK9ZZz2P2QhN4QaNxtg==
X-Received: by 2002:a17:907:c1c:: with SMTP id
 ga28mr39855552ejc.320.1622718079034; 
 Thu, 03 Jun 2021 04:01:19 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id c7sm1388145ejs.26.2021.06.03.04.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 04:01:18 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Subject: [PATCH] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
Date: Thu,  3 Jun 2021 13:00:13 +0200
Message-Id: <20210603110012.1182530-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5UW4wykP4L7g

Commit 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access
check logic") added an assert_not_reached() if the guest writes the EOIR
register while no interrupt is active.

It turns out some software does this: EDK2, in GicV3ExitBootServicesEvent(),
unconditionally write EOIR for all interrupts that it manages. This now
causes QEMU to abort when running UEFI on a VM with GICv3. Although it
is UNPREDICTABLE behavior and EDK2 does need fixing, the punishment
seems a little harsh, especially since icc_eoir_write() already
tolerates writes of nonexistent interrupt numbers. Simply ignore
spurious EOIR writes.

Fixes: 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic")
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 81f94c7f4a..1d0964c9bf 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1357,7 +1357,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         break;
     default:
-        g_assert_not_reached();
+        /* No interrupt was active, this is UNPREDICTABLE. Ignore it. */
+        return;
     }
 
     icc_drop_prio(cs, grp);
-- 
2.31.1

