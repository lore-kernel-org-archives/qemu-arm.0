Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp1217279ejg;
        Fri, 19 Jan 2024 13:51:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwNy9it/jPqrUBTCGieCZEYs+4rkCdBayGDaXTpRRyGmHCSaEJ7F2pBFjDDZCnkx2f5IkS
X-Received: by 2002:a25:2644:0:b0:dc2:2d75:5fe4 with SMTP id m65-20020a252644000000b00dc22d755fe4mr577720ybm.100.1705701104303;
        Fri, 19 Jan 2024 13:51:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705701104; cv=none;
        d=google.com; s=arc-20160816;
        b=dhiWhiDR0F43g1/0LX+Of79ITkhaRp41vjvNh34zKxk7qzepNk5hldNfPq3+GV5bPz
         OiqvRRjDe05+pvUlb+/5nppSDKQ7hqfOrua7fXetGToSsjqLSUtoKOt1uLcQR7RA/b8D
         T+fKVdpVjnm/CYPpR/cMBvVdYNiEZeth/gZBjenBObuCqf2UiNPQ7usBMMrPQC4i9E5N
         vOCQigOunU3BLM5R7nwQ3s3QnaSpJ8xAQNDi5Aouw6lq92OVoYRHwZAOdg6rUT/QNvKr
         Fdy1/JbhXqVL5H+TV+yUN0MzRFTUAqAe6B+baMGshTH1zv72FGRxcH4XNRcF/Iu8T8am
         3q7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xysxads+f6wQHkPyNi+ecSReQgoBfvy3gKHTba22J0I=;
        fh=YgJ9cQ4aL7HaYd+8R0MIBXgkJmL8Yh6LbzLNatL7VKg=;
        b=T8gczESlrUJF7XJsavXR5ceS0gqpE4QWd/2BTqnpE4b4QZ5Jq4cklQLL/qgUlRKr1I
         eOHgZDrbXZuiVvdPcdh7WC9S6HhltlMFRtgDHDa1kdIHYHvUHO5SK/niGZAe4CuNdRVm
         yPdqMBw3hdtkrAYtmU7VAHu2bx7HFiktngdFZwAYtgW3iWNWlCZTEAPZUbhoZrcTsClZ
         kxwSejAIPAjbX/1S123GSwtuZNn7ZqJTIRbjsPFr1i3ftnAil8LNwpXx2zF9UrucI+qT
         +tQHLfMqTIo8ccOZeJMy1P6H4OaUZ6quw/CR4y3KHaXcvoGZKpziHs0vW0M+Jz1K6NQJ
         mDww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w6svMHpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16-20020ae9ee10000000b007839190f0c4si105898qkg.209.2024.01.19.13.51.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 13:51:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w6svMHpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQwm0-0003wZ-JH; Fri, 19 Jan 2024 16:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQwls-0003uh-Tv
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 16:51:29 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQwln-0005Q4-1s
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 16:51:27 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e8801221cso11115165e9.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 13:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705701077; x=1706305877; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xysxads+f6wQHkPyNi+ecSReQgoBfvy3gKHTba22J0I=;
 b=w6svMHpEazws9re7lRha6j+xyDlUiowGOjgL4mc/VhC+RPtrWVoOsk5nGDNolUSmd9
 QSAFdFWc7ReoXoxfS8i2+f2E9fG2h6j5zPkjJAs8/Oc1uVnwa34g8E8XsZgPd0uiq4ih
 xi0ujxixb+3R5F/EojWFz7rtoGqCV5Ej90Mr+fBMRB7aFjSuwXZqd4BKfRIFFzAnNrbE
 IgVqSAWRJC1I1JD92d1KPNc22Nqn3ysF0/l65Yf6fPv0fdz1VutcVTeaFmffyPsrzNI4
 IiFl221crHDrrOXfHhzEuv1epdxNEqGH3v6YdtOsoZT7PGSsvC4FH9MIAICptjGtS3T9
 1Npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705701077; x=1706305877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xysxads+f6wQHkPyNi+ecSReQgoBfvy3gKHTba22J0I=;
 b=gQvylSNjMvmgOXU7PCo/api27u/fnUE3rBhW+YQ9+ckA+dvZGAmuLO2go9OzfOfCzE
 CpTIwm+cp4sirT5lfrbPtl8NhmU5QiBGI4/iwGGKdacSyOtY+4PkWMnmpLC1zJywzvyB
 jm5FW3w96ldbrnBV3oLnGeZBpdfXoKmBeBKOoUE6OUVzZJo3SECyprhAAJVyojF5l3mc
 DZrwaQNzeaqqTWZpzTZXxAkLk0sX0RmOH6wl8kNnzDqQ+7P4a2Dd27x3RQNEN9YUjrxp
 k0TC8YIkqmnFEXlajLUF9rbCsmvkiih/d+CWIFnCWI1290jTZgytPAe4kME/LBO7WoA7
 xByQ==
X-Gm-Message-State: AOJu0YzfHZtyuRaYMGjjHntTHgcIeLZzdB3wyRPMdsdayyYLUA5lZ5Mt
 BmxT1wTz+/OpMxAMkNhxjhyCW/rG9xB9KpJXlwraYrbfPddC0EHAsjufUXU2Ocw=
X-Received: by 2002:a05:600c:1ca2:b0:40e:6397:f42c with SMTP id
 k34-20020a05600c1ca200b0040e6397f42cmr257260wms.7.1705701077612; 
 Fri, 19 Jan 2024 13:51:17 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0040d53588d94sm34241069wmq.46.2024.01.19.13.51.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 13:51:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/2] hw/arm/nseries: Unconditionally map the TUSB6010 USB
 Host controller
Date: Fri, 19 Jan 2024 22:51:06 +0100
Message-ID: <20240119215106.45776-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119215106.45776-1-philmd@linaro.org>
References: <20240119215106.45776-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 14QvAPG30s4C

The TUSB6010 USB controller is solderer on the N800 and N810
tablets, thus is always present.

This is a migration compatibility break for the n800/n810
machines started with the '-usb none' option.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/nseries.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 35aff46b4b..35deb74f65 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1353,9 +1353,7 @@ static void n8x0_init(MachineState *machine,
     n8x0_spi_setup(s);
     n8x0_dss_setup(s);
     n8x0_cbus_setup(s);
-    if (machine_usb(machine)) {
-        n8x0_usb_setup(s);
-    }
+    n8x0_usb_setup(s);
 
     if (machine->kernel_filename) {
         /* Or at the linux loader.  */
-- 
2.41.0

