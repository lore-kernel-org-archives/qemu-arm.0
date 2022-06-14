Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2329777lfb;
        Tue, 14 Jun 2022 13:04:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweh4IR6Xhi2UhpDMoeNjwGlAX2PEbPwIOC35zSk3x7YPWq1a6CScurkbVSn5PtcqeTmA4S
X-Received: by 2002:a05:622a:d5:b0:305:abf:dcd6 with SMTP id p21-20020a05622a00d500b003050abfdcd6mr5754028qtw.666.1655237081155;
        Tue, 14 Jun 2022 13:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655237081; cv=none;
        d=google.com; s=arc-20160816;
        b=LU+i9PNveqmqxEhAM3ngUoF8iLiUGZ1X6n8xdQEn2re9XBcyrsfIrkZ5WsNGi8MqMn
         pA6Xr7QUvw6Je4N6yDB7gdWhnVLyTA9i4UGL8Rq3p0qiFg73t0UddegKgbI6Ec5DiUd4
         fWJZnD7DPsIU6mncVPyHdcSa8R+/kmZvlZPcSJZvPtflfnjEaPZ+oWnC970gRZQ2JOdW
         8mTT02m5knvIQYfwHUxA5ffGhpzyGkF4Xb0dZmkYs54yot0wdNY9bk5pY7a11LhV1tyE
         DJ2bFX6puncXJCklhQBKiASdnBfIrItSj424TK4YawN+m3cK9jhzwj8UJRgRF2//VzMP
         moZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=S62nPbtbbIN1tRJDkkzrKOcK+QaqYtFFKTsgN4rya54=;
        b=gvCYOXAttATfjBWHr4ONVuHw2EgRqvfci+vjoNhopX0iQTH5dpPYf4FHqoJIQKyUkA
         LDBbQTGuxKSfGM45gF2EbIHixpba+az+F4lhjGCiMBHrv4Vfp1Rqxo0bSwU+SYOzFc6s
         uFfqjVf8mP7HBo9s8svolQmff/5PIv4PK4pLut0N9u5DAXaAdo+OmIGTOtnZLJU6lEg3
         PJpTE4m8JO5+Y520kKNrU6eaBt3UfRhmg/ysCebSsY5OMxZ9qkxaESK3eZ5fmvos4wAN
         740f9JephA0LsCeIs3HZGlcDMYLT1l6gCVNgELPSdNjdAik6uG+fRpxkEH619Ny7Sdia
         IvvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="AhoeM/It";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm30-20020a05620a199e00b006a6dd6862e6si6631702qkb.640.2022.06.14.13.04.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jun 2022 13:04:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="AhoeM/It";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o1CmG-0001ni-Gx
	for alex.bennee@linaro.org; Tue, 14 Jun 2022 16:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1o1CkD-0000oi-Qk; Tue, 14 Jun 2022 16:02:33 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:34519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1o1CkC-0006LN-9P; Tue, 14 Jun 2022 16:02:33 -0400
Received: by mail-pl1-x636.google.com with SMTP id i15so8650567plr.1;
 Tue, 14 Jun 2022 13:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S62nPbtbbIN1tRJDkkzrKOcK+QaqYtFFKTsgN4rya54=;
 b=AhoeM/ItgHz8L5Nt8rDOH/RlHMHRzKGELXAgEs6T4BA+SUv63uHP4b0HfhEzleOsWk
 p6ifbb0NPZEhOcNJ3LluMKe55qFQnCdE7eDv9RWhnxcLeGvVl7Oj5sqkrL0NmiLNTQ4Q
 vHR6CeItODM39/2gicG55a6tV+7xsnUdS2orJ7u0S2c5Rb9Lg7NWjiJjXCjlRNKWE+y6
 lryuDAP7/sHNZSzEdXlFe5BFI4/3CD1jy6c5ltH2+cBvt4WIeg+sFssdUlTRh37Eiq+R
 BrC9s1yy33eSJI6qIJkGCWmFfOrsXZL1k3gJQpQZMTAOKgSJXPaCL3nca2Zjr4NSOKWL
 iMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S62nPbtbbIN1tRJDkkzrKOcK+QaqYtFFKTsgN4rya54=;
 b=F18FtWMMtNT42f2zO91jXiV07Txn18YbVahSF+2zhzYtE+KPdx63WdUKmzM42MDEDc
 PT4py65SRl9O7jtzF1GuEZ3GGHz2Qy0ImqEXpMCu+0zwctw9kW0m9pEySoiud4Tg1sxq
 RlOTUbb3svUisVqQt8RKEc1OO+eo+xxzGah0TAv2Pi8NdSV96DVBiWYkNLv/+s+Xdxkp
 pFLuvIMJg4idKPr9xoQfOF/sP3mjlszSZXqzXtKqhXeL/HvZKTlJqeC+AsjCmps2x8h1
 j//aG/LL0VRXWWFUKA4Bzb+P7ZODsVSdoIWvQ9T+AvYLuyIo7dJ9AybyFxPsLjgYq/nV
 zPLw==
X-Gm-Message-State: AJIora8+TmB3YxNotgsojnEG5or5qJdQdokC0vuswpx0LhRV72iPXO2c
 S8KteiTSKjXxYFLbLCOYBRxkpw8XUUm1SA==
X-Received: by 2002:a17:90b:2404:b0:1e3:4db0:f32a with SMTP id
 nr4-20020a17090b240400b001e34db0f32amr6277906pjb.201.1655236949933; 
 Tue, 14 Jun 2022 13:02:29 -0700 (PDT)
Received: from zhdaniel-fedora-MJ0FVN0B.corp.tfbnw.net
 ([2620:10d:c090:500::2:9ac3]) by smtp.gmail.com with ESMTPSA id
 s30-20020a056a001c5e00b005184c9c46dbsm7945777pfw.81.2022.06.14.13.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 13:02:29 -0700 (PDT)
From: Dan Zhang <dz4list@gmail.com>
To: qemu-devel@nongnu.org
Cc: clg@kaod.org, alistair@alistair23.me, andrew@aj.id.au, dz4list@gmail.com,
 frasse.iglesias@gmail.com, hreitz@redhat.com, irischenlj@fb.com,
 irischenlj@gmail.com, joel@jms.id.au, kwolf@redhat.com, lvivier@redhat.com,
 patrick@stwcx.xyz, pbonzini@redhat.com, pdel@fb.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 thuth@redhat.com
Subject: [PATCH] hw:m25p80: Add STATE_STANDBY command state
Date: Tue, 14 Jun 2022 13:02:05 -0700
Message-Id: <20220614200205.2945065-1-dz4list@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dz4list@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zEXaXNPChyXR

HW normally will switch it to stand by mode when receive incorrect
command.
i.e. Macronix MX66L1G45G data sheet section 8 DEVICE OPERATION described
```
2. When an incorrect command is written to this device, it enters
standby mode and stays in standby mode until the next CS# falling edge.
In standby mode, This device's SO pin should be High-Z.
```
Add STATE_STANDBY CMDState and let the device ignore all input and keep
SO as HIZ (output 1)

Signed-off-by: Dan Zhang <dz4list@gmail.com>
---
A usage of this new state can be aborting in HPM checking 
or unknown command code received.

 hw/block/m25p80.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index b6bd430a99..9f89773b11 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -423,6 +423,7 @@ typedef enum {
     STATE_COLLECTING_DATA,
     STATE_COLLECTING_VAR_LEN_DATA,
     STATE_READING_DATA,
+    STATE_STANDBY,
 } CMDState;
 
 typedef enum {
@@ -1472,6 +1473,9 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
                           s->cur_addr, (uint8_t)tx);
 
     switch (s->state) {
+    case STATE_STANDBY:
+        r = 0xFFFFFFFF; /* StandBy state SO shall be HiZ */
+        break;
 
     case STATE_PAGE_PROGRAM:
         trace_m25p80_page_program(s, s->cur_addr, (uint8_t)tx);
-- 
2.34.3

