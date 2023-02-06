Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4232591ejb;
        Mon, 6 Feb 2023 06:14:49 -0800 (PST)
X-Google-Smtp-Source: AK7set8O3bwdGRifzrZijur7gxtV1TU9j9YnrTGf9Cr5dltM9r8IaAglsd6wcWZ5TAIfPBOlH4KV
X-Received: by 2002:a05:6122:c81:b0:3b7:afc6:20c7 with SMTP id ba1-20020a0561220c8100b003b7afc620c7mr11344175vkb.10.1675692889287;
        Mon, 06 Feb 2023 06:14:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675692889; cv=none;
        d=google.com; s=arc-20160816;
        b=oADooqlWZoORWTYZYMPDSdzt2HT5o74tyB/OOE8N0gjoeYEqUTsMoBu1sYPHZqw5Kk
         xEzGBX1F8rjNcmg8bOD9lV/ns35Iv1D0maDGpLEyjsyIDpoG7PKvPSUwS4QcjFArXYTV
         KiXMByNtvleTNnLnEA8sE/T5TPIGtPjCB1/8zPoE/KbVteEjfAYAuMP3cVLO0Dqg1GM9
         iWcWNfnRUj7mHzFFG5xf9+A+RilJioZy3p80a2Wi8ripZWigfID/jsDExIGT9Bye9TRz
         Ksa3KGBW3dCTZESQoMiZ/sO2sT9n4XdVpzLagnfFd/EfrxAsx5QRMzAZhOUVXEtYoiK+
         fcqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=HZXJRI3amPAYNCwVYdZzgSDNv7iQO8gV9ZNjrmjggUI=;
        b=0rbAumH53a86YTZH3ZRBGorcQ7fsAymEBhGgT4EylpE+z4xXTAGWrK9ubd8KynwEgl
         sOkBtc7Z+lfnb8KXpbaQH0G96FWdIY7TTrc72SLpMiqIFDHIA7+rHAf3shdrEpiRpvF+
         lqRZekFC2Cbwk6+fXx8Jq93/OpwGjMy77uY6r28ywJVQoj+7IeNXSR8O0rRxPu8iiBFS
         0rOThW5YbzBrBh7tkqeFB2dFF2D4v9RIROqZ7JYDCnwQ78/VYSnLiwHdk77CWmA2gCuq
         e9qPgMoNGPTWymcvrKaHpYB/rWkQFb+Xz9pjaSn0NeFIMzwDE94g1QWrKC6B0i2e+D3I
         m8PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="B+Ckmfx/";
       dkim=neutral (no key) header.i=@suse.de header.b=iaWTxJTT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l129-20020a1ffe87000000b003ea8d5b2091si2926660vki.108.2023.02.06.06.14.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 06:14:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="B+Ckmfx/";
       dkim=neutral (no key) header.i=@suse.de header.b=iaWTxJTT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP2Cy-0006AW-GR; Mon, 06 Feb 2023 09:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Cl-000672-EW; Mon, 06 Feb 2023 09:10:48 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Ck-0002gd-2W; Mon, 06 Feb 2023 09:10:47 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A929133D27;
 Mon,  6 Feb 2023 14:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675692644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZXJRI3amPAYNCwVYdZzgSDNv7iQO8gV9ZNjrmjggUI=;
 b=B+Ckmfx/59LljsiW3ZPHHzPqGZxVnxsCTztOmITUhTCwHwSPhJci+bhKv/Hug9A5vtGXth
 XAjFvlP6SZIn9RqBQ6Jr7YOaoX/MZiTu+61PzeecSzp8dC34Vea7zggKX/Quc7k4Dk3LlG
 tmJD0uXRK+/7KYJc6mGdfUUebNXqcDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675692644;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZXJRI3amPAYNCwVYdZzgSDNv7iQO8gV9ZNjrmjggUI=;
 b=iaWTxJTTnGdF8LDLnhuYLxvmBU//hRQtzNtCOjh5r3IEXxXBKQ/SSKi2LoZaQggtThimcN
 9ptycREOXHItLiBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 47302138E7;
 Mon,  6 Feb 2023 14:10:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oA0SBGMK4WOgQAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 14:10:43 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH 08/10] hw/arm: Select GICV3_TCG for sbsa-ref machine
Date: Mon,  6 Feb 2023 11:08:07 -0300
Message-Id: <20230206140809.26028-9-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230206140809.26028-1-farosas@suse.de>
References: <20230206140809.26028-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-TUID: GCtMmcUq828b

This machine hardcodes the creation of the interrupt controller, so
make sure the dependency is explicitly described in the Kconfig.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 552e3d04ee..823f8b11f1 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -232,6 +232,7 @@ config SBSA_REF
     select PL061 # GPIO
     select USB_EHCI_SYSBUS
     select WDT_SBSA
+    select ARM_GICV3_TCG
 
 config SABRELITE
     bool
-- 
2.35.3

