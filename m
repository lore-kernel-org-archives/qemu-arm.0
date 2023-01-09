Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2450202ejc;
        Mon, 9 Jan 2023 09:29:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvoUjr3cnstshxQspy3ywr3OD3i11Jy0POD/ODD6QXg9vluYFGsj+sSYEm6unzXHFhv0QJZ
X-Received: by 2002:a05:622a:1646:b0:3a7:f6cf:a597 with SMTP id y6-20020a05622a164600b003a7f6cfa597mr118268667qtj.33.1673285386469;
        Mon, 09 Jan 2023 09:29:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673285386; cv=none;
        d=google.com; s=arc-20160816;
        b=LM0dpn+AvSAAcN0bH8FQtHYZ6zxyVxx1yOWj2/M/wJDdKMdM1QTSpvt7lF9lPIdIaP
         aghZkgpIseTsHJ9KsCn5h4xl31uq6I2J6Fm2TokezS46wM6Iz3VkuSwYVkKxKK89OWDl
         soqmsS19Vmoa6jXoL1ZgR/U3w5bG9F2rwsDIfGxxA2Kd7n2OAzrrasCaTz3IgyMoNf44
         quhUlYXykzdIUv9XvL6szo+f65V4nv4IqT7BwzlUXp5XxwkzX2s4/ygo3DczPh2SkL4q
         ybPa/BNfVEFplE7w4ulLsyojf7ddxh6ChbEq5S0euOfiUHq2z0cgeg8cG+P36W14X/fl
         pBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b0zxx8tPOrJ/ctNq1xpYzBZctNT1tt/hlM+VII09Kv0=;
        b=PmTwVl9TzIBag/5oJLZ/jd2uWtukZ5TAqxKAIq1A4ELWOo01vAPF7vhp5SVXc3G7CO
         GalSyPfB1NWyctHDurzZPIqzUniaHbkJrEG1UCxKJnjZqVqTS/P6PvtzsVzufb2Dolf/
         eEVpFwuBl+BG8wRPgYakAp/rvGNh0VTM9e1kIPZBCrziOslaI/WUeMNsJO8KcKLi8c16
         dHITf7W9nKxgW1LH2CGH7J2cTQiwqjzhcYP1R5I24d+JzmxurYcYh1QPqeMMdljQrrrT
         ht/XG630QIzeCt+dcmJNfUjJREfHWj9JwPLKgwEI5TpL4YRUA403oATq5DElPdIoVHEN
         x/Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=kkzw6B3n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1-20020ac871c1000000b003a7e38055c7si4836151qtp.313.2023.01.09.09.29.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:29:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=kkzw6B3n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEvtN-0002Rq-Gw; Mon, 09 Jan 2023 12:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtL-0002QB-IM; Mon, 09 Jan 2023 12:24:59 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtJ-0000zU-Qg; Mon, 09 Jan 2023 12:24:59 -0500
Received: by mail-ej1-x62e.google.com with SMTP id vm8so21929901ejc.2;
 Mon, 09 Jan 2023 09:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b0zxx8tPOrJ/ctNq1xpYzBZctNT1tt/hlM+VII09Kv0=;
 b=kkzw6B3nRxuYOqc/yTzkpiBdmJyV10/4N+ZerMGcBuZRyRqPPktKdeLn7ZCZVdcWPj
 RiUnKOyil+l01ReNuYR65u2m3J+xEOOkEhgYSTDXa57ADHYo81n/qu7xZyJy706vtYYo
 vlXhYFERbrztGYUSjjKxphwfXfGMhT5eNFqfMe9FffBUBdSGyck+n6vBtKA/x/2l+LE0
 zzKA3zhvWkWS2BCjLUc+6FYIB/fy/d/er4tFWconfMz5ThUCNU0IQiYCwVxrYvEfcT+n
 cXRG2qPjcqCJkihYVnhpf8dIwvseytFMUvAIESBcixb/BennOwigiovyFN6obU9WmU8R
 N6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b0zxx8tPOrJ/ctNq1xpYzBZctNT1tt/hlM+VII09Kv0=;
 b=QJcvCk97QZheRCjeEU4+hHO9GSJQdxjVCbEASaRuwqwahD7aJeyLTrH8wKaq91HkWk
 om4gZfbFcIWCb3OuR86ntWpKqfwv0ZgmEnGArqZX0Nz+iyrDJSbu/fpDU4FTEb8a6lvl
 9LwsUzNFIMFbTq7A3mph54jlFvTcMQHB0ivRNONt1W2zr8iOtJZ+fZdV6zEWHrm3N5rW
 pG8E3zJ8sMkYsqbwmJodPFQq+KRjWQvBRjl9hBvu+/tpXE1h62LzJBUvhGLN480DtErl
 5ePzfkEPNLk05YnZmlZLCi5cLmAX8VoEavHcj3J68TvpFenUQLKbTFHN1ksi69F2JvA5
 BXqA==
X-Gm-Message-State: AFqh2ko72ztoluiu3bHy2MZ33/RX2+TXlaveVI3cP0UHfuCxQze7omwM
 naapKCuwja8fJo0AViqBOjT2F+Wk36kRIQ==
X-Received: by 2002:a17:906:3c0d:b0:84d:34f0:f766 with SMTP id
 h13-20020a1709063c0d00b0084d34f0f766mr9004178ejg.75.1673285095184; 
 Mon, 09 Jan 2023 09:24:55 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:24:54 -0800 (PST)
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
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH v6 03/33] hw/isa/piix4: Correct IRQRC[A:D] reset values
Date: Mon,  9 Jan 2023 18:23:16 +0100
Message-Id: <20230109172347.1830-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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
X-TUID: oEKAbsb5PrMo

From: Philippe Mathieu-Daudé <philmd@linaro.org>

IRQRC[A:D] registers reset value is 0x80. We were forcing
the MIPS Malta machine routing to be able to boot a Linux
kernel without any bootloader.
We now have these registers initialized in the Malta machine
write_bootloader(), so we can use the correct reset values.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221027204720.33611-4-philmd@linaro.org>
---
 hw/isa/piix4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 8fc1db6dc9..0d23e11a39 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -116,10 +116,10 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0x4c] = 0x4d;
     pci_conf[0x4e] = 0x03;
     pci_conf[0x4f] = 0x00;
-    pci_conf[0x60] = 0x0a; // PCI A -> IRQ 10
-    pci_conf[0x61] = 0x0a; // PCI B -> IRQ 10
-    pci_conf[0x62] = 0x0b; // PCI C -> IRQ 11
-    pci_conf[0x63] = 0x0b; // PCI D -> IRQ 11
+    pci_conf[0x60] = 0x80;
+    pci_conf[0x61] = 0x80;
+    pci_conf[0x62] = 0x80;
+    pci_conf[0x63] = 0x80;
     pci_conf[0x69] = 0x02;
     pci_conf[0x70] = 0x80;
     pci_conf[0x76] = 0x0c;
-- 
2.39.0

