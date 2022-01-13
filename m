Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp52435lfj;
        Thu, 13 Jan 2022 08:00:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwa1Lz/4PP2oK0zgcEWtqCZ2lcBHOLUcBhMZps+ZdcgjjtvWoATR+K6LSPt73ez6jffMRDd
X-Received: by 2002:a67:c18a:: with SMTP id h10mr2356005vsj.58.1642089636577;
        Thu, 13 Jan 2022 08:00:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642089636; cv=none;
        d=google.com; s=arc-20160816;
        b=W6VBWPYabKHgOhdHI66wCdHndP731aa5Y4HUM+wMIICGUfN4eOkKhbMtyn2BWFg/yD
         0xc+S+7oUviiv4Tv1Sq2A4I7olxtJvWmzCnlfZSNiFW6eZeMN3n7+QR32g5KEotGa5t/
         mr5JJdrMgxOayFheOYijESUoeEPmhyugwprqUnnDJIUVmeIMmcDoDYJw6nmNQLpmV3QG
         dkFkJ6rmh7tENF7PQk481O1Rdz2Ijf76B12bZNwJixEg3mIWaV8DVIxagp5zaPvDDFFw
         PqQuyFEbeFMlUr9W2un2VyMHf/Iu+MyMPc0OB0wAtSKS+G5e7xdDRbwBb32lmCN48HoJ
         mTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature:dkim-signature;
        bh=L57YS6lcpOAlRLBLnhaZCF8uOjfOPhMnDq4J4As9pms=;
        b=C9RK0KUY4y8S4J/9YF00m87OR8vO7TMsixy/uF9NPJURpMNuWCqfhlYUwt7DNkEePb
         iw/+zHSr0h4gJMayFHGyD6UXQv4gRFngJLpEvB0KWQka+0EmwYfyFy5sV7UZ3rByE9Vh
         Cv5xJ8l5A9C9h/STyUZRfJlR+7x8U3AisGIYzVhqiwOlGZ64WJVs6HLR9eclOOpdJKpr
         P1CUyWH7gAbESO9ENuu2P+7HKtKHA1Ork1ASjC53uAfZHrYRENUYAAePqnqHEXnj90ME
         55P5dHh+EPiulj5fStQ9ZYLJGjDltdEGri9VP+lCKGJy6/6DJGXzY4T6hh53FtAQ8TRm
         jL6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.cz header.s=susede2_rsa header.b=1tk74+8w;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18si247444vko.284.2022.01.13.08.00.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jan 2022 08:00:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.cz header.s=susede2_rsa header.b=1tk74+8w;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n82Wh-00043P-PA
	for alex.bennee@linaro.org; Thu, 13 Jan 2022 11:00:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppavlu@suse.cz>)
 id 1n81tF-0007Bb-HX; Thu, 13 Jan 2022 10:19:49 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:44126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ppavlu@suse.cz>)
 id 1n81tD-0006ii-UN; Thu, 13 Jan 2022 10:19:49 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7BBC9218B1;
 Thu, 13 Jan 2022 15:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642087186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L57YS6lcpOAlRLBLnhaZCF8uOjfOPhMnDq4J4As9pms=;
 b=1tk74+8wru5P3a+0tZToxRnvaEIcup8E5apTLnkF/8Lq/09JcJrR/oGUip71+IadBkrwW+
 7WZp9rfcAsGOuCQ4vRfRVled6OdJR4eaWeYUBwhUOXyDB9j4Ekx3MXSWll3WBewQimpDjX
 1SmPhQrwQJLhCnmS+W9kbrZ99qeqcO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642087186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L57YS6lcpOAlRLBLnhaZCF8uOjfOPhMnDq4J4As9pms=;
 b=7lIZyfYXcWK8VN9k+DSmCC8Ik96jpnfR1+qWI3VaflnnjXeoe4joBiORbFRi862A4un16p
 ftU0PAjVCxHgRHAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 695DB13DD1;
 Thu, 13 Jan 2022 15:19:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8JkvGRJD4GEwFAAAMHmgww
 (envelope-from <ppavlu@suse.cz>); Thu, 13 Jan 2022 15:19:46 +0000
From: Petr Pavlu <ppavlu@suse.cz>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/intc/arm_gic: Allow reset of the running priority
Date: Thu, 13 Jan 2022 16:19:16 +0100
Message-Id: <20220113151916.17978-3-ppavlu@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220113151916.17978-1-ppavlu@suse.cz>
References: <20220113151916.17978-1-ppavlu@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=ppavlu@suse.cz;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 13 Jan 2022 10:59:44 -0500
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
Cc: petr.pavlu@suse.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J+ksfI3s5yVD

From: Petr Pavlu <petr.pavlu@suse.com>

When running Linux on a machine with GICv2, the kernel can crash while
processing an interrupt and can subsequently start a kdump kernel from
the active interrupt handler. In such a case, the crashed kernel might
not gracefully signal the end of interrupt to the GICv2 hardware. The
kdump kernel will however try to reset the GIC state on startup to get
the controller into a sane state, in particular the kernel writes ones
to GICD_ICACTIVERn and wipes out GICC_APRn to make sure that no
interrupt is active.

The patch adds a logic to recalculate the running priority when
GICC_APRn/GICC_NSAPRn is written which makes sure that the mentioned
reset works with the GICv2 emulation in QEMU too and the kdump kernel
starts receiving interrupts.

The described scenario can be reproduced on an AArch64 QEMU virt machine
with a kdump-enabled Linux system by using the softdog module. The kdump
kernel will hang at some point because QEMU still thinks the running
priority is that of the timer interrupt and asserts no new interrupts to
the system:
$ modprobe softdog soft_margin=10 soft_panic=1
$ cat > /dev/watchdog
[Press Enter to start the watchdog, wait for its timeout and observe
that the kdump kernel hangs on startup.]

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 hw/intc/arm_gic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 0cd9ceca8d..492b2421ab 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1736,6 +1736,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         } else {
             s->apr[regno][cpu] = value;
         }
+        s->running_priority[cpu] = gic_get_prio_from_apr_bits(s, cpu);
         break;
     }
     case 0xe0: case 0xe4: case 0xe8: case 0xec:
@@ -1752,6 +1753,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
             return MEMTX_OK;
         }
         s->nsapr[regno][cpu] = value;
+        s->running_priority[cpu] = gic_get_prio_from_apr_bits(s, cpu);
         break;
     }
     case 0x1000:
-- 
2.34.1

