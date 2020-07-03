Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2783702lfm;
        Fri, 3 Jul 2020 13:26:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOgG5L5I8Np2Hpy8ha8INTRK9OdMWabCNOSVBUJlXeSYbjCGqo4RdJWRzSdRgQ7/v/UBfo
X-Received: by 2002:a25:c284:: with SMTP id s126mr49298077ybf.346.1593807989021;
        Fri, 03 Jul 2020 13:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593807989; cv=none;
        d=google.com; s=arc-20160816;
        b=b///3CGmZzOS8fkp4v8D/r+LKiyO6MWERZhUve51aBR85A/lBr2v1iCzG6zkhRMcNj
         3T1x/8c4pDyagjqpuVKhPjyQCcI8pWloiHhu5b4cMsuFFLoFZ9GPuhfif4i1YrBHuauG
         OuJGN0C5YWaJSGR3ULLIqulE/MhxSMeCO0Y9GMd/o5IbinrkSbDDB5I/vql+S3Ty/hM+
         jLYdeoeBLYewzKbwA0YY51qxoTon6cuvxEt3IuBmwgEiVlLQ2deEeZsoR8SIbPU26ZD8
         83H3rmie3u89LqKcgG55WfBOH/UKrNgyWwwlD7tILNCKoz/Oksk1bggvJkPawVK/1lZ0
         pYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jeW/GRxnLMmqDw4B0N8/mDODSvUKWFLcdDlvxS2B7CU=;
        b=S8UyzafZro7yGX5CXffePfN/Mc0eSLoj1q8WiBMULeBdg+klOQ9B216RmnCiHfT4hy
         RU32MTN5sdAw91ZjMMFBCUnjrIkEJI95SIcCRzIoecmy0uwFjg4mCFeMYdAwL3TtHiy8
         gYJ/iNhsMfmMzMgPBP5YN+vP/lgPeWx7CuYdmTdyWrjI9nyQOGSF4Hvhjn34EjjYVXqe
         XK1k/K7FTJ9dofT4Ld5fJWqy1u8l5jE5lGcIykElUtX4MXg34cyi3fGPOulmI2aKXpNP
         kNlzQY4MVQnWbq9HFagRA5CeZ5iKoBLXQrcsiAPkOaUG89wq4+gHI4nYTJ2OEA43+EyO
         ntHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ITNDKWEF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si12929210ybk.252.2020.07.03.13.26.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 13:26:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ITNDKWEF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrSGS-00053N-6u
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 16:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9o-0008UE-Pj; Fri, 03 Jul 2020 16:19:36 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9n-0001Wr-Dl; Fri, 03 Jul 2020 16:19:36 -0400
Received: by mail-wm1-x32a.google.com with SMTP id a6so22968452wmm.0;
 Fri, 03 Jul 2020 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jeW/GRxnLMmqDw4B0N8/mDODSvUKWFLcdDlvxS2B7CU=;
 b=ITNDKWEFzb20yVGDnibyFXcdzaggcn+3JcT6AcoWLM/MjAydtvTa1IgpjrJaiGfUK5
 VmlIjPK8JrWIOqLysFKBY0ky6GOiXz0Adc95Pl2KoPzskzhEizFPsnMrpKYbzNNMZdfI
 PR8hlVXPP75osVcjgjGXuLhFqErYFpcTsw5QrVwbeSB+rsZBW6guKRLbajRC7FpJlktp
 D1Ga8IwqOy27G6L9J5nEnlsoHuuzYfSuhjDvnMHpbPZLvXEDCpA8sXYJXMV6mtPDiUEd
 F96U1u5915cvO+ob7orI0C93IM5+FvqNz9jS5uVP/DHyEGv07e8HaepkKZ83NwWbesJX
 oJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jeW/GRxnLMmqDw4B0N8/mDODSvUKWFLcdDlvxS2B7CU=;
 b=q5btc3omZPuzDnfnE1WcBkyBUd/kFDfxE22SVb1m2DPqZRrcGdYiFjYgI6P6n81JcQ
 lV5ejtAgrqpyNNNfB6ud/CZUDi1uGNj7LitX9dXRx+qZYsjdnKj9NP87ZlCUPTD0Zw0M
 R2bl/PhqNl8iQRjFAPl6OtShQjzRAUB2xYnTpzhGQwytmf+rKqATYbfAcqnrpbalnK4X
 mSn7cNuNzhYCppTeUz6gbxthJQpxF+ksQjhOnNOT2Dzp24wqSou1jvjqKne0xKLX0Jwo
 +J2AKo4YT6fdFHLedeb2qdphak49n2I0Zt+mhaj6zjOg3ZQO80ru3U666gAUGjVuvezo
 2RuA==
X-Gm-Message-State: AOAM533fi6IRuifMeHREU/tsEehkPuq6XplfoGGDkbzocwOAnIHYClOM
 F4A4QAfc+pmGjc2mL6xTrReZ3JnRIAg=
X-Received: by 2002:a7b:c259:: with SMTP id b25mr14334703wmj.107.1593807573687; 
 Fri, 03 Jul 2020 13:19:33 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id u65sm14229625wmg.5.2020.07.03.13.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 13:19:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 14/18] hw/misc/iotkit-sysinfo: Mark the device with no
 migratable fields
Date: Fri,  3 Jul 2020 22:19:07 +0200
Message-Id: <20200703201911.26573-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200703201911.26573-1-f4bug@amsat.org>
References: <20200703201911.26573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RMD6aZSCf8ts

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/iotkit-sysinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
index b2dcfc4376..8bb9a2ef8b 100644
--- a/hw/misc/iotkit-sysinfo.c
+++ b/hw/misc/iotkit-sysinfo.c
@@ -120,6 +120,7 @@ static void iotkit_sysinfo_class_init(ObjectClass *klass, void *data)
      * This device has no guest-modifiable state and so it
      * does not need a reset function or VMState.
      */
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
 
     device_class_set_props(dc, iotkit_sysinfo_props);
 }
-- 
2.21.3

