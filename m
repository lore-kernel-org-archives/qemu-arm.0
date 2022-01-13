Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp52603lfj;
        Thu, 13 Jan 2022 08:00:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVE4Aj7W+91ud8YZ0IlsDgRqG2FhhWBU5Ygt1J2w+tz2x+r99qHHyruniHREmURZrkTPbW
X-Received: by 2002:a05:6122:d84:: with SMTP id bc4mr2475046vkb.22.1642089651167;
        Thu, 13 Jan 2022 08:00:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642089651; cv=none;
        d=google.com; s=arc-20160816;
        b=WTDy/KoewyknEJUHMEQ32RzuG3SjadaA+XBhGZFLiBxVWloC4ZCW27qByMemZQKywy
         zdpg71tmRgYGovT93CKgbo9KCeS/TFhm7u/yyPOIo9GWkJBju1nwjK0KmKEIgKUiVGVK
         lwtryUeT2HJvWKx0rycPl7oe4LcrQ1e1aP4IU5J7NjIMzm+/R4eT9JNZPvrXgU9QAmR3
         HXhdX42rPXhWDQPRmX+uUD3zPOnKiVaz/2AEqb0R57gs+GUdKpfaCZc75JM3ux2Yty1v
         yTH3P7lQUgPwfXao0jsqMfjC5apc0f4cmklP74JO5SZGcMRsNbDn+m2Mppr9ivO8uYhZ
         Ud4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature:dkim-signature;
        bh=RRjphleUIqLoOTBWPa4kIgEwVvOePPoVPrFG6Zq3duI=;
        b=gjT4v/dgbjQ9kbDAt10sMRzworkOVMQDxgT1DC/zCPgodjqJXd3VEv07DfW4xmm8NB
         v2kynwJvjoPkj+EKaUulL7Zf0pKVWgu9wUkhnIh9qkFlFE1QTX0I2p8h53epkQTmUaAz
         sw1iOmA9Qno6KHu2WNKl8UqQ+Udor8R1SGdTVXwgwgkiWHcWs+69FQb3iUqMnP+Zwu00
         kM/+S6jZ9wMvQ8v4utIN5yJPL1aJO7snlTVq1ZjVoB1bMoWXPobmqz/H3DsajYexNAmF
         TtQPPM+1ucwQ2JTEGefmIJ+GYBOPGX7XD568G2kWbRxkrk3aQ3u5FXX9BmD8OBf1Z6pR
         GOJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.cz header.s=susede2_rsa header.b=wu+kcCgW;
       dkim=neutral (no key) header.i=@suse.cz header.s=susede2_ed25519 header.b=SpSTO3P2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r202si252193vkr.255.2022.01.13.08.00.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jan 2022 08:00:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.cz header.s=susede2_rsa header.b=wu+kcCgW;
       dkim=neutral (no key) header.i=@suse.cz header.s=susede2_ed25519 header.b=SpSTO3P2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n82Ww-00056K-Iw
	for alex.bennee@linaro.org; Thu, 13 Jan 2022 11:00:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppavlu@suse.cz>)
 id 1n81tC-0007Aw-T6; Thu, 13 Jan 2022 10:19:46 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:44120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ppavlu@suse.cz>)
 id 1n81tB-0006iP-DP; Thu, 13 Jan 2022 10:19:46 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BAEF6210EC;
 Thu, 13 Jan 2022 15:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642087183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RRjphleUIqLoOTBWPa4kIgEwVvOePPoVPrFG6Zq3duI=;
 b=wu+kcCgWYsDFlRKXNVr4blE23J1E+AAMmvjH+i0f8HYC4YfOhiYZptN+bjHLFat6edDde7
 25AFaMOvwiV9wMv5lQyOZSHQpjupS5duHtVnyb4DkW9Ko/p+68IefggE3oT+vuRs0ILq8d
 iueh69Yt9DvLOy2wT9FmoxyRkLNO4bU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642087183;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RRjphleUIqLoOTBWPa4kIgEwVvOePPoVPrFG6Zq3duI=;
 b=SpSTO3P2PL7PO5aQ0fYDldoJiXhBO5uvVSIQ/n1ZAkW5iIWsSEV5k9e04cMiheUdwiWC0Z
 mH/vgO3hb3g6MVDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A85F713DD1;
 Thu, 13 Jan 2022 15:19:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +KhyKA9D4GEwFAAAMHmgww
 (envelope-from <ppavlu@suse.cz>); Thu, 13 Jan 2022 15:19:43 +0000
From: Petr Pavlu <ppavlu@suse.cz>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/intc/arm_gic: Implement read of GICC_IIDR
Date: Thu, 13 Jan 2022 16:19:15 +0100
Message-Id: <20220113151916.17978-2-ppavlu@suse.cz>
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
X-TUID: 9JTuCF43dFgJ

From: Petr Pavlu <petr.pavlu@suse.com>

Implement support for reading GICC_IIDR. This register is used by the
Linux kernel to recognize that GICv2 with GICC_APRn is present.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 hw/intc/arm_gic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index a994b1f024..0cd9ceca8d 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1662,6 +1662,15 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
         }
         break;
     }
+    case 0xfc:
+        if (s->revision == REV_11MPCORE) {
+            /* Reserved on 11MPCore */
+            *data = 0;
+        } else {
+            /* GICv1 or v2; Arm implementation */
+            *data = (s->revision << 16) | 0x43b;
+        }
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gic_cpu_read: Bad offset %x\n", (int)offset);
-- 
2.34.1

