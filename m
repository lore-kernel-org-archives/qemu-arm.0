Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1971666lfq;
        Sun, 17 Jan 2021 11:37:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9RTX+9Fc5IR6NtnMfG6E4kJt4Ql2ZXbaJqhB5PNlSeJlgXJ++mRP6tupHikSkWY9pu2Lk
X-Received: by 2002:a25:dac6:: with SMTP id n189mr33140381ybf.85.1610912275141;
        Sun, 17 Jan 2021 11:37:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610912275; cv=none;
        d=google.com; s=arc-20160816;
        b=Bh4vPfbiG+C8pzUUsmjsWMeV/i1EQ0xuL2u46nLW3bRipayNY78IKI2KzyF9PateKl
         6rWIWvsQnRdUM0sjb0b52++DphmpxlodHCUVATQkLzHRcPh8jbPS3Qxx6oV5Lv2c3Z3C
         liHXeJ0aK6VmbQhX36qSIu3dunK9aSS0DUCCNJsbLQKNH7coD0fZJyr/5vImvfVRCP6r
         nBPeqjzKWNQk8JS0sbLkW1hjbcqggC35J/deMIFU151MD1b8LtPFMAj/cqt9DTWTCBun
         kff1/yOPcAAhHq0iloW9FVGsh081ecqjbukTNuufeF6gurYsDBDO7BweByDV9bOFB2dz
         GzJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XogiRe5yl1pNdqgPP5V4b7SXP6ekjym12cW6DYLGVp0=;
        b=emY5SGaP0WMH9FFpW1oKtLpBK+vGhD4Fr2Sjducwr/rKIwnlrj84+8V/RVbOQcyo/S
         dmXHymnjscUVXkqifcH4oG1LEHJiM8Yk8G5ThtlxIT79//y433aR/Aul4gv9m4m7i0Xc
         wpjVDQ66Llu1UaApgPncFmLzwHGtDDVBm0kLEy+nNP8gdbylVnnpt60Em0RKGXQWGaz/
         jqPEAFDdpcDK6dmn50ZasrzKm5yZUShbMPtNBEHP0zdPTw4PLmEv1Wd0ZCBDX0j5ItHH
         VIH2tuVQaO1KjWy9RLCVwUlu/oGDTTSDbYuQyCk8dFHwVddTIPch3+ft0VVmGCFwDnaJ
         ghog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dHzl2LAC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15si15454121ybb.112.2021.01.17.11.37.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Jan 2021 11:37:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dHzl2LAC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1Ds2-0003FQ-In
	for alex.bennee@linaro.org; Sun, 17 Jan 2021 14:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dgw-0008TM-LG; Sun, 17 Jan 2021 14:26:27 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dgu-0005Wy-Uy; Sun, 17 Jan 2021 14:26:26 -0500
Received: by mail-wr1-x42d.google.com with SMTP id c5so14444877wrp.6;
 Sun, 17 Jan 2021 11:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XogiRe5yl1pNdqgPP5V4b7SXP6ekjym12cW6DYLGVp0=;
 b=dHzl2LACEwVQNJhxnDfIp+k/e2+8X0LFiprYl04+U7/AQgBLE93j09+DEwxBHCx72r
 CpPITxjy0TJLx+gj5fT+DRnsn6nE411uOqW8Q0Qz+7e3Hzv2ATu6bA3hbpfk0+wVyWx0
 urrTcZ+Q3haAu562yWx3+KF3Z1YQpnASASkSMdgJJ1h72rLOJOfRwKX3BllpWATYdY7H
 SV3Cv0fvvH2RbAGCDNA7wxT2nNU8eHb1aDIpyyFwoOM4+7aue5h+I1mRqG+ItGfAI2Tu
 LSeFn1EDviFdR6c5vpEaSX5nwDmIKmMKo8XujmtGig2c/WpZHoWmX90dUJgA4O/RwgFP
 Jy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XogiRe5yl1pNdqgPP5V4b7SXP6ekjym12cW6DYLGVp0=;
 b=NZT33XADN0226G9ffxKXHsqLQsj4VkGjmwvJsljHiJFhUbPi1Zn0UJJ6YL8mBRSs5P
 BVOFIjBb65qon+vWaNGZIsQubF4Av6jZ/tcBMo3IsBgfs2r0sFeJzfT4nyhUJYSaMMdS
 nn0kUGFI1W9SSxr2IQReKkESaJf7Nx1Yq7dOLBuspdHL3XBDo/3TP2v/d3j43KiPNmq2
 MYChHxFPJ03larWVfVBjahy/y/RBUczT8EDjogz0PxR4lG+S63QI8lsNYP3TqtyKdRQk
 QS78016dkKVaU9xup8Cv+ltRIV/igRZBcr/ZKqwDq2VEp6QwAF/b1fqgqEXM7jyYd346
 nixA==
X-Gm-Message-State: AOAM532UtLF02mEycn5UT/qa4P/GRMCitWUGKWufGlVbvEZFTWqPQAiA
 yXhosQ5HppcTKWP4CIorbII=
X-Received: by 2002:adf:eecc:: with SMTP id a12mr22631110wrp.312.1610911582822; 
 Sun, 17 Jan 2021 11:26:22 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v4sm25387282wrw.42.2021.01.17.11.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:26:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 17/20] hw/pci-host/gpex: Mark device with no migratable
 fields
Date: Sun, 17 Jan 2021 20:24:43 +0100
Message-Id: <20210117192446.23753-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ICxGE+q/D+l7

TYPE_GPEX_HOST does not have internal state to migrate.
Its only interesting state is in the GPEXRootState, which
is a TYPE_GPEX_ROOT_DEVICE which migrates itself.
Explicit there is nothing to migrate by using the special
vmstate_qdev_no_state_to_migrate.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/gpex.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 2bdbe7b4561..2565dc27ae4 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -115,6 +115,7 @@ static void gpex_host_class_init(ObjectClass *klass, void *data)
 
     hc->root_bus_path = gpex_host_root_bus_path;
     dc->realize = gpex_host_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->fw_name = "pci";
 }
-- 
2.26.2

