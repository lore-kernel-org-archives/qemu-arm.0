Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4230327ejb;
        Mon, 6 Feb 2023 06:11:59 -0800 (PST)
X-Google-Smtp-Source: AK7set/pQn86LauLhebhTAl7XjA1Aop548CmxwesmizkmDUUbnDU4u/VNTmffM6vLRVCILLmBbEg
X-Received: by 2002:a05:622a:1999:b0:3b9:b731:bf4d with SMTP id u25-20020a05622a199900b003b9b731bf4dmr35588131qtc.24.1675692718895;
        Mon, 06 Feb 2023 06:11:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675692718; cv=none;
        d=google.com; s=arc-20160816;
        b=T5T+j1l6YnS8paQQ68fR0un9+iS66fWAJ8S/afSAdU8dtH/i/W40Bs2C3BlvIFSkXn
         WYMne/lwXY2YZYHh/hFqtNSgysAdkArJ9CuTbJXC8poSGW/htKVImYyqEBo6R3s2RPfy
         GrkbKdRCECw4c2NGlpv0y9ffzifWbFQLuEAgGI5SzSvLiDiJVlITLzMlyl1hHHBfTHf2
         MUHcivsEiAS+nY+JvASAty1zN1raio2x1ZzFq3q/hFWPHa222c2WLP8srK7EdHAbJHIs
         6wp+hQVsViMfa1f+xN5p3qKUa3QDsmsuTkZQqC897vZnJQGJVb18INA5cuKpwaPnLCWL
         GvgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=FEGE8pycELFg8/TWdTKjH83z3RR5mzFkoQaZma3+j+8=;
        b=Spxj4hET9u54NUp1TDwtfmfRFwdNaJoj6qgKoDtuKPA1n6CqZjXqLQ7Rxjq7jneY2X
         vm84qsdo1J9HPpi1Ri06/Ta9Wul0jkMEtOH+84vN+KkaX1jmEbLdnH72dhBPxXmmoNO6
         irhMGoNVROb1u64CXcAYXYX0b4xo3U+Jn83XUnrrXqQZzTM/QRqBIC7yGCSImasD8yZK
         LBtl7WwH2DKyeUDJTx93PRRNJpg/Z2cewWEJ8gT0hTASzu+yjcrGIa25oPapGg2/BSpu
         2EtwF0WFCQRtow3mEyuhJQffiuPdHFmqjjL8e93dSTyD7HW7n964UCReVQzh+c6Jjlvh
         BTLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=phpX8Ui0;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp15-20020a05620a458f00b00706d7d76e6dsi8757622qkb.198.2023.02.06.06.11.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 06:11:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=phpX8Ui0;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP2Ch-00065k-JB; Mon, 06 Feb 2023 09:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Cg-00065A-0v; Mon, 06 Feb 2023 09:10:42 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Ce-0002fa-HS; Mon, 06 Feb 2023 09:10:41 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2CFE433CF9;
 Mon,  6 Feb 2023 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675692639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FEGE8pycELFg8/TWdTKjH83z3RR5mzFkoQaZma3+j+8=;
 b=phpX8Ui0tb9oUlgo2rJlliCGS+K1vTcDzOmkjw06bqCWhhMZxKMKizsd8Ay9mA3q0a+fT7
 VCdM56C/rv5x+Bd/6zM1mYXv8VKbi+9HM2vfRCBCZPvNha7Lfd3SXbd7tqD/mQnPUozUsM
 s1hxZgYLh9Bd/oZ2cH3NgAXlmmjkE68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675692639;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FEGE8pycELFg8/TWdTKjH83z3RR5mzFkoQaZma3+j+8=;
 b=MMXrNsp3nWjQLcMhNMA5eR6o7a0v56jxJ2tP2CPn+GuVero7ntpLVWl36gixQHWyIMGWfA
 WS7twA7/Fd4HncAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5AB6138E7;
 Mon,  6 Feb 2023 14:10:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UHeOIl0K4WOgQAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 14:10:37 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH 05/10] hw/arm: Select VIRTIO_NET for virt machine
Date: Mon,  6 Feb 2023 11:08:04 -0300
Message-Id: <20230206140809.26028-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230206140809.26028-1-farosas@suse.de>
References: <20230206140809.26028-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
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
X-TUID: UmEV4J0r/fKL

The 'virt' machine uses virtio-net-pci as a fallback when no other
network driver has been selected via command line. Select VIRTIO_NET
and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors when PCI_DEVICES=n
(due to e.g. --without-default-devices):

$ ./qemu-system-aarch64 -M virt -accel tcg -cpu max
qemu-system-aarch64: Unsupported NIC model: virtio-net-pci

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 hw/arm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d157de9b8..8dcc08b7ec 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -31,6 +31,8 @@ config ARM_VIRT
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
     select ACPI_HMAT
+    select VIRTIO_PCI
+    select VIRTIO_NET
 
 config CHEETAH
     bool
-- 
2.35.3

