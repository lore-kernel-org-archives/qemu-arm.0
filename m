Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp609135ejc;
        Tue, 23 Jan 2024 14:26:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7xv/C5hoxJYyMks3RsksYXh3BCY+k4AYqq9XhpAaSmGb2zeAgzJqNMRcIN0fuzf+2muK6
X-Received: by 2002:ae9:e302:0:b0:783:6282:b430 with SMTP id v2-20020ae9e302000000b007836282b430mr6400805qkf.112.1706048786578;
        Tue, 23 Jan 2024 14:26:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706048786; cv=none;
        d=google.com; s=arc-20160816;
        b=YLUtUWahlSX4CfOaO5ur68nQ619kM/w+wPLFUSBB5lTaCVigsBDPD/kjb8WWYq31Rx
         LDs4lqFgxRj6/omt+hnNKUCyIrC+6M/PHjyqRMNKX+4vFgW1CbSFGVLlYFeX/tRcuNSh
         0NVJbaUW+mihWlD9sSxkcGn3He7BlUBHVrDIu1VFDHO2Yz9YtJuMmGM7maSQpuknZSAN
         w0kFFM7C1VL2Q59P2N3uums8j7RFolEuj+H/hElErT7s4wdQOoRwWTMBExOfFjAJ8dNJ
         FpKkzfKIJJSotGkYg8sxBI9nGFTON2RBzrXVoPUYs8OWVxeM7Pj00LojeBFqm61mHXGh
         x3Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Cw3bjLOiGxm/gmaq73KAUTSMcDh1pUeA2J6w4VTjYkA=;
        fh=vCRQ4SxBRaw/scGiJ+6DsMj2AC960SBJLYr7612eZsc=;
        b=PA1DrMvfBUzK9owumNql/3wQIt/zyxU8y1br8Neh6rHpOMVFLmDifFpwbXs9kPXTsr
         PuTmoYsuIaS2qYuz8Yj7UVeohq7h8gTavMOslCBzvgx3jsvRhZ5XdThbJoL221jJ+iEg
         MLL3ZCr5U9RqTk8AvgDSQYHnKmHO5eyeqFBjFdn9/ajmGqIUDfG1p5gOq1I5P43vo3oo
         6oTnULCZdwsvnDHBjqTcWhF5RdY94xQPCcZYzOmN2wStJeyzMd6uAuobUg7csZjjEpfQ
         +X4fHF63HFSP42ZKkbdbrb1bVezE2N3/nDeYYHetcS41x+FqQGWaKq7a6IrgnAXzBAK7
         k3Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DmqCJt2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z42-20020a05620a262a00b00783729dd6casi9536161qko.254.2024.01.23.14.26.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 14:26:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DmqCJt2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSPD4-0005Pe-Pv; Tue, 23 Jan 2024 17:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPD2-0005Mn-Jp
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 17:25:32 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPD1-0000xu-2n
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 17:25:32 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-559cef15db5so10328587a12.0
 for <qemu-arm@nongnu.org>; Tue, 23 Jan 2024 14:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706048729; x=1706653529; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cw3bjLOiGxm/gmaq73KAUTSMcDh1pUeA2J6w4VTjYkA=;
 b=DmqCJt2Ujlz0/008flJ1wr4ShztXRQhmCqLSLaqngWB3dbcJY0Elg9BKvWePZ7Zrkp
 3Fub6gDD3Pq2EvKciTwwuGjdBQsNVf6JrWe5awIDlrL/q6ljTp9qIT4vAM2iMNyvBfxa
 cP7tmp1RuFalCDWwvfIfjRaT68GPlGFWIuZP+78+Bu8dxKO2cafxBGOttQP09f1nS+M4
 AK1InynfNo7SJh/6MGIBBRz7et/VtUeIrvOmux4QQQgsUhe8nHJmoOwst1oE34/DnnhC
 Ot5EN1f05IdOMrNW+4Mhw6NGX6WDtPEbb0E0bhq0aIClPew5KRAEP3deu+eN8gWp4wV+
 JRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706048729; x=1706653529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cw3bjLOiGxm/gmaq73KAUTSMcDh1pUeA2J6w4VTjYkA=;
 b=NwUBpc3hLT38VxHr152LmFztaeUSrvCk1+FYQFHJcRKPw935W1qwPZl8hlEppkce75
 U2sMt/30Cs5CS3I/QJ1EYftBoehKrC40+AroLPGQKGvJpfvr2ULS3PCgm70wLy/Rpp8v
 JBrETgUxq4AWlwSaWdzt8vCduKpZYx/uk/ObIZHDaQIMRtBG5BG3ltLQqN1AOFB6j8p/
 QA28TDevEXcu22I0A4FyS/ZreSgfGlPuhxAwiby0qD4pdhxQi543FYkOAqFWgnYYxFvG
 HF07G9Zu9GQoPcWXopmRXhxswO1eYLREK0pN0pF7p8gf4CA+pkZN6QJArWjJcJ9KojLV
 bPxg==
X-Gm-Message-State: AOJu0Yx+2BxZgGlD9S7Pq55sQVIVI++FoyBMAPT1ldMoP5cjkelQZZ5x
 BfKzRdkd13qk2tdYW0hcEf/0LFjAYFobVJEmC0cDQKJftXz+LF2Ajj+SH+aQEEo=
X-Received: by 2002:a17:906:3ca9:b0:a2f:ebb:f200 with SMTP id
 b9-20020a1709063ca900b00a2f0ebbf200mr196156ejh.9.1706048729352; 
 Tue, 23 Jan 2024 14:25:29 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 gu25-20020a170906f29900b00a30dc39aac3sm667245ejb.157.2024.01.23.14.25.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 23 Jan 2024 14:25:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Gavin Shan <gshan@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/6] hw/arm/highbank: Add missing QOM parent for CPU cores
Date: Tue, 23 Jan 2024 23:25:05 +0100
Message-ID: <20240123222508.13826-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240123222508.13826-1-philmd@linaro.org>
References: <20240123222508.13826-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: rN8ItaftDFly

QDev objects created with qdev_new() need to manually add
their parent relationship with object_property_add_child().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/highbank.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index e6e27d69af..b8d702c82c 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -209,6 +209,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         cpuobj = object_new(machine->cpu_type);
         cpu = ARM_CPU(cpuobj);
 
+        object_property_add_child(OBJECT(machine), "cpu[*]", cpuobj);
         object_property_set_int(cpuobj, "psci-conduit", QEMU_PSCI_CONDUIT_SMC,
                                 &error_abort);
 
-- 
2.41.0

