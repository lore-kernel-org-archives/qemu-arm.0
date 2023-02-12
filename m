Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3596331ejb;
        Sun, 12 Feb 2023 04:44:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/U2GipfNV20EDQ8R4vwmS+8sZCtONDECw/qi44afF04fNzyFXHXq3Dp0yl29dm0FXPXNKS
X-Received: by 2002:a05:622a:18a8:b0:3b8:6a41:c329 with SMTP id v40-20020a05622a18a800b003b86a41c329mr38791716qtc.21.1676205881104;
        Sun, 12 Feb 2023 04:44:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676205881; cv=none;
        d=google.com; s=arc-20160816;
        b=dmyECq1a6Wx8PLD9307ExKMQkAcR0vQ6tST3RiJ4q5cXhnQC/NHJTSrhB2p0lP/r7p
         0WnfQtHPROlJ4pvpmsq/apuAUiyzZBQkRB8YIReCe9/v3MXHi5KZyjUAn+LgMUMXSTUB
         wrDnKsq+Ry9PsYLSORn1IqGjxFiwC68TpZi0sGoxu06JiBiDPZOVNgFTB9P4oTwwgJdP
         Ttvhm5XFZbvceVCbq6Dzr0CrDN6iQkDzgKnYf12Ue60cVpY1Dcf+U+GwaId0HYMFNtvy
         TQE4C9y0bCaVU9VE3t0peqymGEedAC4zl16MDWZ+kbSt3Qi3nX1TaBkw85D6H9EcghfS
         Nbaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9mhZDnYM8cxjE+RfZ9PrvkpKgKDGSsRAMZZjS//lOxM=;
        b=t+pOB5KQwrMs0RCBjsC2vVey3u4RvggGiCwFSVtKw3fhUXWyn7UDyr4+UUQlXiCUPa
         LpoqVAwSkXDc2DMtKKCx04ksr6BRqNcp0Uilfbk9x+CMOI01sEbm9UFGo/5TBGaT9mdO
         F3uo9nonk9kWiV7/M4WwoMqEZNmgwBuFXK5G2c8YpFzSlGenpCdmKd13TCd5qqbAcxmw
         SUPJKOljC87faQ1kieo1IyNUiqGTzFE+yagGUsCg29YUOs/eDuZuGEmkP3fucNnn1vr4
         hfpg4hcY+vPWrccNC5cNqESNiF8x+N9oYPfWi0YUh6E/X799m7r3wV6z32w0Hg2UVx5b
         FaSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dMsqVVoy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi18-20020a05620a319200b00731114e2183si7948514qkb.77.2023.02.12.04.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Feb 2023 04:44:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dMsqVVoy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRBih-0006TF-8j; Sun, 12 Feb 2023 07:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdD-0007bv-9c; Sun, 12 Feb 2023 07:39:00 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdA-0001MC-2M; Sun, 12 Feb 2023 07:38:58 -0500
Received: by mail-ej1-x62a.google.com with SMTP id p26so25803028ejx.13;
 Sun, 12 Feb 2023 04:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9mhZDnYM8cxjE+RfZ9PrvkpKgKDGSsRAMZZjS//lOxM=;
 b=dMsqVVoyQKMMcPWSAXdJi/CcTowL5l0OpEpaiLddlJKH8AcqsiPYAdTmzDVBRftn79
 WVgfxp5YmNK5mY0+WhECiHaF4gNnYpOMH9mJ3aw7MWmoqcbZJK9l0cXvnZMVq0rX8g7B
 EaNQe6e8u/JSR7kvdZ2W3T2uYzo2fcmrZ+r+k7dTMfFj5IKv+1+cptTw8MCaIrTQheBk
 myy90xa1if6bvLFeZglq8iTBTz6OALak63ST5o0jEE5rUUBPqvt9AumNJG+xgcP3TTlP
 jYdI9gkWuBfGfyd949KNlnRNwzA4DNJTUHWLn+p/99p8aH75bWiRHHSCcFNyNSojuiAj
 gx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9mhZDnYM8cxjE+RfZ9PrvkpKgKDGSsRAMZZjS//lOxM=;
 b=6txkv6qs70FLexiLhnXh/WQs/8Y+qDLW0kjKVJMugI+wzmJRfOihmvqUtOxyIkMzmJ
 m7AjTDGETX4vgTAeIWwEeTaMaLH4HfRppZ8jURAvRxCrfZnFE8Ix9vnbkjbEfALRMD8S
 KBsVBZW8wmN/UpDzeG4rWJ0QRVgotyekAXN+LSJbmELm1bmzhVgq9oPGxJRe/CKCcsLO
 cOwLaWeul10tJmk+2iY5q91F9RbYJjwA+BOPReACx4sfNW+4HmyjA4cSKU/xq/KjXg1O
 ts1NB5VMqtVMTLtUq1s76JyQ1685+g6nA+7BussDwrqG8+8KL/zWSE04zeoEO30Y9a1v
 N7iA==
X-Gm-Message-State: AO0yUKUgp1A8WUHM3apKdH8MxunZ3xnrmfKL2V1kIVcLlYF39bxlp3Ac
 IbRyWy0pN6+DYIT55z5bpIpRPuBDX2w=
X-Received: by 2002:a17:906:380d:b0:879:2a5:dc3c with SMTP id
 v13-20020a170906380d00b0087902a5dc3cmr20968916ejc.40.1676205531856; 
 Sun, 12 Feb 2023 04:38:51 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:38:51 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v7 10/23] hw/isa/piix3: Rename pci_piix3_props for sharing
 with PIIX4
Date: Sun, 12 Feb 2023 13:37:52 +0100
Message-Id: <20230212123805.30799-11-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: 5nKA4xeKlV6M

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-22-shentey@gmail.com>
---
 hw/isa/piix3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 55835912b8..cf7daf29ab 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -371,7 +371,7 @@ static void pci_piix3_init(Object *obj)
     object_initialize_child(obj, "ide", &d->ide, TYPE_PIIX3_IDE);
 }
 
-static Property pci_piix3_props[] = {
+static Property pci_piix_props[] = {
     DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
     DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
     DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
@@ -398,7 +398,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
      * pc_piix.c's pc_init1()
      */
     dc->user_creatable = false;
-    device_class_set_props(dc, pci_piix3_props);
+    device_class_set_props(dc, pci_piix_props);
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
-- 
2.39.1

