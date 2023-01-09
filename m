Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2450213ejc;
        Mon, 9 Jan 2023 09:29:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt41SMicqIcdPQdVCz8LEpibUkNisiUYW86tSbRIEkPMSGjcCwc3Ku76tVNlOHYnv7dTTZ+
X-Received: by 2002:ac8:5213:0:b0:3a9:87fa:533a with SMTP id r19-20020ac85213000000b003a987fa533amr88724770qtn.1.1673285387227;
        Mon, 09 Jan 2023 09:29:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673285387; cv=none;
        d=google.com; s=arc-20160816;
        b=S+/kYtD1WM6m6ibMcbA7cWm9w8rpUIutnrnu3lJ+FCBiBBnHlt1UIQoxA+DCaTamzN
         YSXrZG2KQDQtiuOiESCclennZBnciA/bhurEaq102cvT+twoiD3NPPBClRQg0aI0C/fu
         f0quPktEhldi0JBmNDQJ17M5YGMdn5iMq21IbsYhwLXLH4tdHaYoFikILcrOHXlLs1aL
         I9MDhuaop5f6zcPKQk/T22h1lsAbVHIiRdRVCbFTbqUiJBZlB3Yd8n3VSzLXT/EI+jlu
         /MvF0msQeW9dclIN8nDhqZ8oG9vpDDp53oymOiWqnsgP5vQd4j9OX34x8YdLuULTQPue
         Kxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ROZS9DAh1LyOJO5f9sd5J7Flg4V9+Kkad/7x0aYqgvc=;
        b=eNn5qyueGDUju6R6YqtX4vnffzk0WWPbTgbta0FbRCVNcX3ui7in7ZBcVz0fH0WTLn
         UQUy5NrHipW6tuuY3aQqgy+5xl7N14PMPLZXv+QeF3V3bF5yQpv9VWY//9n9LLxuyvIR
         aEtd+AQUFLnH1IC0pWF89ILzREhU2OCK/JSjS4QFrFrLk6j5OZyMBj7//eZb3//xvOcl
         MTcg6+kiv5nIsmHXntBPNRmy9kOzoMMLiR2LOtqKlZ5Wg7t/+Z7dQmLCx5pxs6KZw1yN
         O/6nvBPRID9c2RmQ1mJM0Rc299Wd8aEpn3kwMvfBgCRrAo2vn2t6EzWJrm5ccYvpjss0
         fsSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QOxTCkWY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020a05620a136a00b006fef744f1a2si4677204qkl.702.2023.01.09.09.29.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:29:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QOxTCkWY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEvuF-0003DP-HT; Mon, 09 Jan 2023 12:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtg-0002jz-CP; Mon, 09 Jan 2023 12:25:21 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvte-0000yV-BV; Mon, 09 Jan 2023 12:25:19 -0500
Received: by mail-ej1-x630.google.com with SMTP id ud5so21943252ejc.4;
 Mon, 09 Jan 2023 09:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ROZS9DAh1LyOJO5f9sd5J7Flg4V9+Kkad/7x0aYqgvc=;
 b=QOxTCkWYtQ2NrjW970gscMh7LdpPdU82Isr4STYC/SiK5QpHpH3soV11RnisKqsCH4
 NJGqFzkk0WAHu2/PXN7ZpEFiKZ4YHChDVd3ph5NUwfVPBsJJKft3qJRnxw2Pp0TgOS4F
 TpFJ7WGyue6EF7uSDiX4I4EUYH+Cg0iFsOtyzJVD7zvJmOpCAhN8q45Bvq4JjCKGQ3IU
 q6b6VIkjqw/KOF9S4QnofuBBGsBXtn0PXBmNH5qCXyK8VSf0kDiLEZOCtuZfZ9BEsqP3
 NApuhsGwquujIVYQVx43mVJopVT28ZXM5hdGQuAfkycZh3hksL8oMzuN5EmSJD7JdZYB
 2Zig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ROZS9DAh1LyOJO5f9sd5J7Flg4V9+Kkad/7x0aYqgvc=;
 b=VgkXXUM+vqhqtasA5nAv9tISQaTFYIW67pgo3FII0D0sPRiWR/SJfao1ccGljh0LgO
 ybvDNy8kGnNQTzeKKJo+gUcP4EmLjIkso1F1jdUu7R2kqbTSetjN3HzvIL/YxgJTxCtr
 rTdecyOfa6DR2vNmcfOf4xH5O8yAPgFNL5j/L59ZbZsqM67THJRkSlSSj2pevcuPr1BW
 aTrqBXwf0nU7kjOVjv8MHhyuQ/oJJILcWJtvWgvCAG8u/aHui/lS5zEgSMjKZi7MEeXC
 7E3JImxN5PB246eQosJ5TbzK842uJlrp1Veg8ilZxKAZG/hQpeKYZnRXB9XZCLfd5sH8
 0C6A==
X-Gm-Message-State: AFqh2kp1wPlYkbZ+XgamkgDxW9xDbjOmBGgnpeV/Pvgd60msxP+vZgmZ
 11FWPGGoNewEsfJoMHji1CTY36PZtBYmjQ==
X-Received: by 2002:a17:906:2349:b0:7c1:844d:7447 with SMTP id
 m9-20020a170906234900b007c1844d7447mr55751775eja.35.1673285115497; 
 Mon, 09 Jan 2023 09:25:15 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:15 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 20/33] hw/isa/piix3: Rename pci_piix3_props for sharing
 with PIIX4
Date: Mon,  9 Jan 2023 18:23:33 +0100
Message-Id: <20230109172347.1830-21-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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
X-TUID: wwmaBnj9woDv

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-22-shentey@gmail.com>
---
 hw/isa/piix3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index e813e20639..c6659bbfda 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -381,7 +381,7 @@ static void pci_piix3_init(Object *obj)
     object_initialize_child(obj, "ide", &d->ide, TYPE_PIIX3_IDE);
 }
 
-static Property pci_piix3_props[] = {
+static Property pci_piix_props[] = {
     DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
     DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
     DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
@@ -408,7 +408,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
      * pc_piix.c's pc_init1()
      */
     dc->user_creatable = false;
-    device_class_set_props(dc, pci_piix3_props);
+    device_class_set_props(dc, pci_piix_props);
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
-- 
2.39.0

