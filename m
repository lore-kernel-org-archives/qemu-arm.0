Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3124593ejc;
        Wed, 15 Nov 2023 15:23:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0GDeuOo7FK011V/6moj1xqAMvA5vjyi/rUoheYXgTAx8kV2Dby5wwfTxtI/pXA8XTbwtp
X-Received: by 2002:a05:620a:198a:b0:778:a62a:2c4b with SMTP id bm10-20020a05620a198a00b00778a62a2c4bmr7614976qkb.47.1700090587560;
        Wed, 15 Nov 2023 15:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700090587; cv=none;
        d=google.com; s=arc-20160816;
        b=is7es8VZpi3+UQqf51y11cjywV2nm5sMrhZfpGcBWKR+wKZ6CN1e/C5OsOmHlFk7oh
         uYl0PscGgD6Ef92H9WqG8Tut6cLJ4MDJfFqVIMUlT45pZl0R2ksWSudEU72bFgDt2d8O
         zXhdkZXYJAiVlvLIvOorN1gybizZMph1jEZSI+1+CITiAEIsdJYUf5Rtx/C8KXqtrfAV
         BBRqKjrJ4CZBBX+2THV5/A/1tlYaxfINaD+G8CR8KjVS+Bv8LGANj3JVrnpjlimQdcnU
         OI/8jYtvwl2WH3Tw0k+6/o2n/eZgSFyhjkFg+zRxft7UvT3CTx2ZHJHifWX6dtGD+01T
         CUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2b/fiTOaFIPayjBXev06ScNhrp2HmeigNrv9VMh5ovk=;
        fh=uMNkG2qG0zUfNX9Dd8yIHy0nhEp+iUPJbdGoU1GKRvc=;
        b=zruBQZa3dCT5chg2x1pADkkbrYlbRHZcIeozUh2MpxvT/WYZlehmXELAySGffhxLZ5
         ggmVDnRkQCWSsvAjbKvQ1PHMFvXYsYGYcDhxBBtl3R421xi9u+qC9ovl9shRm1DOeJ22
         l9ILJEY+eY31hbwyAvz0/4SqkbKG/y4jd1+qWowt1O1qj+F87q0u35/qWb+On3AxSVA8
         PV8dRq3RJA86q6MRX40XU9Cfz01uTDfGN0lSvkhjaN+fatAZGzsfSeulD6x+k817Qh7c
         wZNHIBE/dC9PQekLClK3MZwQuIxVoaj1rhWYRCaUrjXfcZeMsqtSQwRQ0158EhSib0J7
         JS6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kSp+JYLM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qf5-20020a05620a660500b0076dabaa2929si10705070qkn.188.2023.11.15.15.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 15:23:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kSp+JYLM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3PDP-0007cH-Em; Wed, 15 Nov 2023 18:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3PDM-0007bU-Mq
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 18:22:33 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3PDK-0003Sy-Vk
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 18:22:32 -0500
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c5071165d5so2623601fa.0
 for <qemu-arm@nongnu.org>; Wed, 15 Nov 2023 15:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700090549; x=1700695349; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2b/fiTOaFIPayjBXev06ScNhrp2HmeigNrv9VMh5ovk=;
 b=kSp+JYLMDgnYLsCdGO7WBL65O7ChFMPwz8VB9cx+lWlsLPMB9Ts3cmKbTSnS+mQSZt
 irk5nrlWHbU52C4lbdrci5G8EPqzxuOkTPbvUTHszKyPWyojkiHIPdwsRO8EKPKO1td7
 G85j8GFXrwcYhKmQ8Kn5HbZaXCGGdkGwwqopTX5nIFFRsy6ZQ2RrlbG4ozVLYbves/7i
 iYJ9yi0OjqakQC3wstKLkRAskBaBXw+UKD2XAgdw3m0oQVdo0m0ebiRibKdx0kvZ/CZ9
 l4n/Py+UL42c/hrdSAbuCR/I4jHmTe4yOpdk1G9wmueufanK2aOpQYWGuXWi2lKaDv7y
 9RlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700090549; x=1700695349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2b/fiTOaFIPayjBXev06ScNhrp2HmeigNrv9VMh5ovk=;
 b=vBht975Ajh4vDFkL553Z42+7E2vQE0mPDrc82qyV2kN562T2NrqBmv3uDFzsSbyt3W
 vr1MY5KJq973X0TymA+71vluuGK6mP62B46TsfPs60i7R2BMGhzi1NuwHbDtR8/uSptg
 6la4yYEHg/gT3223YjMFYV7lccYXn69J1vjE7wqkQ8Kk0zphdWB6K3cKKYXK31/A4LbF
 4nBCygaiYCrJrd97rfK7MvoqVVeW+T6hmBXuD2K/8Sdrsa762rVun65D/+giR1VzphBL
 M48jzyPKwtQ97DGIGnO29ZtMEjoYLeef+g7c7aKmVJkpq6/IJF0df1tB34XyFz+GfPJp
 G57w==
X-Gm-Message-State: AOJu0YwvblEY6A2ZKBy/Xl2gSG2VZP/6a06WAY8phWSCcgHnxYs7UdCF
 RL3HFTyT8FISeqIY/yZT3Q7JXQ==
X-Received: by 2002:a2e:be28:0:b0:2c0:20e3:990f with SMTP id
 z40-20020a2ebe28000000b002c020e3990fmr5655014ljq.10.1700090549239; 
 Wed, 15 Nov 2023 15:22:29 -0800 (PST)
Received: from m1x-phil.lan ([176.176.130.62])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a17090611d700b009829d2e892csm7773426eja.15.2023.11.15.15.22.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Nov 2023 15:22:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Tyrone Ting <kfting@nuvoton.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Hao Wu <wuhaotsh@google.com>, Felipe Balbi <balbi@kernel.org>,
 Gavin Shan <gshan@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair@alistair23.me>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 5/6] hw/arm/npcm7xx_boards: Simplify setting
 MachineClass::valid_cpu_types[]
Date: Thu, 16 Nov 2023 00:21:52 +0100
Message-ID: <20231115232154.4515-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115232154.4515-1-philmd@linaro.org>
References: <20231115232154.4515-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22e.google.com
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
X-TUID: /9gFu4tgR0GH

The npcm7xx Soc is created with a Cortex-A9 core, see in
hw/arm/npcm7xx.c:

  static void npcm7xx_init(Object *obj)
  {
      NPCM7xxState *s = NPCM7XX(obj);

      for (int i = 0; i < NPCM7XX_MAX_NUM_CPUS; i++) {
          object_initialize_child(obj, "cpu[*]", &s->cpu[i],
                                  ARM_CPU_TYPE_NAME("cortex-a9"));
      }

The MachineClass::default_cpu_type field is ignored: delete it.

Use the common code introduced in commit c9cf636d48 ("machine: Add
a valid_cpu_types property") to check for valid CPU type at the
board level.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 2aef579aac..98f9af27e7 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -121,15 +121,8 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
                                         uint32_t hw_straps)
 {
     NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_GET_CLASS(machine);
-    MachineClass *mc = MACHINE_CLASS(nmc);
     Object *obj;
 
-    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
-        error_report("This board can only be used with %s",
-                     mc->default_cpu_type);
-        exit(1);
-    }
-
     obj = object_new_with_props(nmc->soc_type, OBJECT(machine), "soc",
                                 &error_abort, NULL);
     object_property_set_uint(obj, "power-on-straps", hw_straps, &error_abort);
@@ -462,13 +455,17 @@ static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *type)
 
 static void npcm7xx_machine_class_init(ObjectClass *oc, void *data)
 {
+    static const char *machine_valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a9"),
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->no_parallel = 1;
     mc->default_ram_id = "ram";
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
+    mc->valid_cpu_types = machine_valid_cpu_types;
 }
 
 /*
-- 
2.41.0

