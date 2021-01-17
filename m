Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1967058lfq;
        Sun, 17 Jan 2021 11:27:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCJVM0atr+0vS8wQjuBK9tdUA46fw1aOd4HcubI7eHfaNwT5CMCsdg4fc7YNiK4vT8vaeX
X-Received: by 2002:a25:2fd7:: with SMTP id v206mr32298977ybv.420.1610911635100;
        Sun, 17 Jan 2021 11:27:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610911635; cv=none;
        d=google.com; s=arc-20160816;
        b=VsTHsv7kqyOs5QlvQdlOmUdUirPSlhNkMLA4bO6ces9WyWWxNIWjVqIi7uHdPu5ErV
         kGmhu5bmF/6prf6ZfVZGq6sg8rGQloIeHlGYUHdVXOIZ09pVG0rJwjW6OSIdgl1PEmD5
         G2+SdYjEEpz/QE4Yz4hty0+tLI4NtFVYfrQffMU0XA0NPImqx4b4gDcEOCo3nV9qvNkL
         66MXZU5GgkWNGGeNoFp4kSaziwFqO3PdRwnku1lBqDk18FKwY7vC/NeE/iT1SpdGpJyU
         Z7bn+5aTHMkkbwZPM4fsyGRw9WO4WQadGDsWjfbNJ+/IDDc+6uHX58B6K7lb8/sKuGDr
         22vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jZzarPuuax9WApxhmE01fr+TB+KCuz6yb6zkBqC3alw=;
        b=MC/HEucyHaThimUEOcpsia3uN2+qlQafkpMOjn/0xjnwVVsCjo8kwxgaUuIu44oXVu
         7AC7AMtVdEKZv+/kgaxb5cwDwlx/RrTBAsFv9/3L4QtK5kZM/h3zepO3Ly6YF7HjRPNC
         NJU7W0bohcMBokV1qT6ZtbXhEImbGy0wn9BgyrJnNa/sRazdVG4grfM1ZpPhAAnDkqoc
         wK7UGf69JJ98bdMeQ1XpClwsplBErsth1ZwUpwZD3m+f+57DDaEMLw507jgUBCXcPZBy
         eWvDf1w/jMh1jtLQDgxWFpu4r/sQ3AgS5A93z0xU5YqxxQ5Pej5X3ltItenbokFKdebg
         /Rzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BjEEoijB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o196si5770398ybg.257.2021.01.17.11.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Jan 2021 11:27:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BjEEoijB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1Dhh-0000QL-3g
	for alex.bennee@linaro.org; Sun, 17 Jan 2021 14:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1DgL-0007ue-Ub; Sun, 17 Jan 2021 14:25:50 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1DgJ-0005Hp-5C; Sun, 17 Jan 2021 14:25:49 -0500
Received: by mail-wr1-x436.google.com with SMTP id 6so7158530wri.3;
 Sun, 17 Jan 2021 11:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jZzarPuuax9WApxhmE01fr+TB+KCuz6yb6zkBqC3alw=;
 b=BjEEoijBKCngZNJ4PJZ9MgD12GyN9KvoyfaGeEFEvlCRaOIoYLXGxTatCJpEj4A7y3
 QeYv14aOuInHEnyD2NXsa1mdVFUhA4VsRr4jEeV0C6EH32G6pFo0XnD9buanUxPH/Udv
 Pj9vdTuj8vCc5hEOHzcdAAW81FX1G1O/iPSCtd9ArbzAtBvlkn5kfY3oGmREszpgJyjq
 PLGcmzXandd80hwLqc8pxwMEt709t7gPmIaEl+Jhk8jwEClgjH6k0D6RnY81wPR4fZeg
 pooL7huiagIHMJwBXtLpoAOMO2p8C1JidxSVlDjan/PgzTuikmo3UojoSN7dzQPT86Hl
 t3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jZzarPuuax9WApxhmE01fr+TB+KCuz6yb6zkBqC3alw=;
 b=f6eis7R7bqSTLQxNpN3f47s+q9ZbvOpREUasBwZxRQOnUF+A8ZsXdAEJSBP3hAj2Cx
 5pvbXA+bjBT58ZS+qBXBR6dXghpkqGZHOkdMO9L7sEONfCDKIIoXBS1+t+eEmldGMh5s
 eiQXyisapaLgDS+2PcdDLHuV/5NIGq+ud01e+9YJTyQmjkFwJejK+/HDry+Cv/+Nml46
 CNgRwt7SUE/H5vQf4WuDeEBLYEGPJKf0aQtvO9oWL6cBlecnZKlo08WiZR78v9bF/zRw
 HkfarQC/SOih0Mv/NKIOTVwvr6tzF7UQ5cc7f1pWIooqQJaEif76Q34vHOafM/tcjRmZ
 z3XQ==
X-Gm-Message-State: AOAM530qzSufZja1wj4LOcG4zWcEIFcH9QsoLaaX/gIrs1fTDdczp/cj
 7CYMIbwqBIQ3+eirqESu3IM=
X-Received: by 2002:a05:6000:1547:: with SMTP id
 7mr16295455wry.301.1610911545081; 
 Sun, 17 Jan 2021 11:25:45 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a62sm23805600wmh.40.2021.01.17.11.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:25:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 10/20] hw/usb/hcd-ohci: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:36 +0100
Message-Id: <20210117192446.23753-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p+RHiA9728R0

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Add a more descriptive comment to keep a clear separation
between static property vs runtime changeable.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-ohci.h | 2 ++
 hw/usb/hcd-ohci.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
index 11ac57058d1..fd4842a352f 100644
--- a/hw/usb/hcd-ohci.h
+++ b/hw/usb/hcd-ohci.h
@@ -101,6 +101,8 @@ struct OHCISysBusState {
     /*< public >*/
 
     OHCIState ohci;
+
+    /* Properties */
     char *masterbus;
     uint32_t num_ports;
     uint32_t firstport;
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index f8c64c8b95b..302aab30992 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -2007,6 +2007,7 @@ static void ohci_sysbus_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = ohci_realize_pxa;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
     set_bit(DEVICE_CATEGORY_USB, dc->categories);
     dc->desc = "OHCI USB Controller";
     device_class_set_props(dc, ohci_sysbus_properties);
-- 
2.26.2

