Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3595082ejb;
        Sun, 12 Feb 2023 04:42:38 -0800 (PST)
X-Google-Smtp-Source: AK7set8FMhfRsK5C02lnYxR/WwUFSmtKvKkjN4TrvaGDu/uZGb4SbmgKKPaT/QIXvwFmai5hnaJj
X-Received: by 2002:ad4:5fcb:0:b0:56e:a556:f28f with SMTP id jq11-20020ad45fcb000000b0056ea556f28fmr6675970qvb.34.1676205757768;
        Sun, 12 Feb 2023 04:42:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676205757; cv=none;
        d=google.com; s=arc-20160816;
        b=POoSzQUc9fckkOWBJA2O0K/E3AQotpDW5q8NSr6SkY28idbGfhFvl5n+c1cY7AnTQB
         ZEKfEvoYbzYe6s46+UDVa9AjhiCggcIPD/OshPERu/IucsDmNi/sMArPKKIxalTiV3Ij
         NV7vuvYfuVdD6htaQuOz5uxsUCOI9YPjAKmNrqS+XtK0qjkJCIGioFOmDgWaegsQ9kTT
         R3364pLTzdFwKo7lZw3q7TP+h9kHuHSZ5IHvF2nBs6QWFwgnKTYs/dQLDMsscYmSWdDQ
         +VX1gC/uO7QdYrN9SuIJX7VKcRw7t1Xdd8MC2a8xnjyH0sb+AbWTdwx4+dlHrQ2URf45
         aqdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NKv6xCTQ7OK9+tsyvf4Te+lL2EFDW3wBDAC3LK8H8XM=;
        b=dF5TzkiPB4fX81JuGi4HZjS57SHlzopBWDEc4k9lymcCn4h8/qqo4xfcRJppegVaLV
         sPbs/F5AQJjgciRAedRRdytaKE1YyolgdoYl7Vzaks0E0jSMTQQegmNOf3vPaAWe5sAp
         thNYsmbm4wO+geA8ztA0z0cBDQ5j/tAE6u74NNbdxeVLRircS8E2V2ZZOd7HHkqgeUJk
         hvABJATF2PUdRwSSB9wbE8mC5pG2hop2Dt0kBSu+HJRGmN7u2lRebpxsTylMdMp6ykWm
         tpPyELkNbE/9YgSe+HzWB9hKGzMFrMaF2q6rLjhMzEOgzw8J9THfvcTSNnZfSbpHSiHF
         EOsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=KbUJPBND;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3-20020a0ce383000000b0053544d2658fsi7363292qvl.559.2023.02.12.04.42.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Feb 2023 04:42:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=KbUJPBND;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRBdQ-0007mx-JB; Sun, 12 Feb 2023 07:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBd0-0007ZP-Jv; Sun, 12 Feb 2023 07:38:49 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBcy-0001J7-0d; Sun, 12 Feb 2023 07:38:45 -0500
Received: by mail-ej1-x62c.google.com with SMTP id sb24so1913124ejb.8;
 Sun, 12 Feb 2023 04:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NKv6xCTQ7OK9+tsyvf4Te+lL2EFDW3wBDAC3LK8H8XM=;
 b=KbUJPBNDXxdGWe0Bx4iJm+noAbhwTlVLNFVqdnnYTuMJejaTJdEyVWFSrKKwp8RoyM
 2LqCkA1S5RiToahaouTwZabcoDEER8M8XKMXzMUOxOsiWmuXOWwdMacQs7F4ihtxOq5U
 Z+xOjcog/3h8Mp0bf/jK4r9KID53voldqnYCMwGAEuMzJZvxb2O4xp8WfO7zhpsFeKoc
 497MHRJdpCcy8SHfPywLmQcQFZ1/RAIUP4uKxychH5Dg5gNz0wHgrjLeIJAArDaWwrz1
 D6hc1VkC4xjf9RoQnaogzT0hvgQ5SgPfew+/Vy2wRDwQiadAsEtOeM7vL2WAjLgmeleX
 /s8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NKv6xCTQ7OK9+tsyvf4Te+lL2EFDW3wBDAC3LK8H8XM=;
 b=pO4PaeY3Miqss31VWK33gRRIz6IFJSqCoDxC0vdYNn9XD3Dso8HOmExaSu4TR2UdTd
 cvgpOphjw42OuC45QT61ZTBUnRXIxJ3VdUbsWVzuL+mLROG68qTvRso2Xwx8rH3/JXjS
 /nrCr52Wildc1FNuarD6eJabOTe8jfUXHucdGBuXS2ByMrX1LVyYA8uL8/1Z26vc+dho
 i8WdYyTnPthb+J/lzAmRIo/lmtNRRHL9b8TdOn+1B8JWOMsEtR/+AF6RALZ54CZC4BDl
 AJhN/FZF8EQLZKXn+Vc4dPUGwZJswH63fqXWTIgFMRxWlx+aTTZI9F035TjZDRCdjRWL
 ONZA==
X-Gm-Message-State: AO0yUKVkD8yS1g04Su4i3D1P0sUPOGuWEs//YANCaMVQeeZDsCw479CO
 2ueZ0xf0CjHk+YpkMhAIWGdY2Gz+64w=
X-Received: by 2002:a17:907:c789:b0:8b0:fbd1:1a5f with SMTP id
 tz9-20020a170907c78900b008b0fbd11a5fmr1640927ejc.15.1676205521245; 
 Sun, 12 Feb 2023 04:38:41 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:38:40 -0800 (PST)
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
Subject: [PATCH v7 03/23] hw/i386/pc_piix: Allow for setting properties before
 realizing PIIX3 south bridge
Date: Sun, 12 Feb 2023 13:37:45 +0100
Message-Id: <20230212123805.30799-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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
X-TUID: ObAEZmuiQ3Gg

The next patches will need to take advantage of it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-3-shentey@gmail.com>
---
 hw/i386/pc_piix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index a577ea2f4e..37afc01d30 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -235,7 +235,8 @@ static void pc_init1(MachineState *machine,
                                        : pc_pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        pci_dev = pci_new_multifunction(-1, true, type);
+        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
-- 
2.39.1

