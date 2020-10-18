Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3329172lfa;
        Sun, 18 Oct 2020 13:41:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytLMNCGz8pS63Re6CW8Hf+ty5vvxQkyErDi8cimZGFAKXUYLWBM71DxY8LTG2rwwqYQoDq
X-Received: by 2002:a25:4258:: with SMTP id p85mr8650674yba.202.1603053692461;
        Sun, 18 Oct 2020 13:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603053692; cv=none;
        d=google.com; s=arc-20160816;
        b=uJgH6MAtSF3abhUMFdz1nD6TiQ4ztLguAJkfClEgbOWJXk6zGoor+Tr/hvEAt5NtfK
         v8INhCiBY4mXYHikCDAy5YMT57rN9tDLW5+8d6N/e4tSTvzkPyRJEV7tULQmU2ZqH5F9
         Qjd0Vug/Qnboxq5gOq5YG3JH5qWvX5LjcLqsZCvdxlk5hyJHsOtYDhFzXpumxCEQwc5k
         Ti/IaWAtPBrdvckQ/SX4s/uSlIJpTSzagS/9cB0mb3lg3RZdDQDEZXw3xlv31VSRT+sH
         GEtXhFAMTbYdXA4kPhQcttlE71VTWrMjDLtQLuPWdsNog2fncdqVn8vsWjImWKZYyYlg
         I/Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uimP/iqQh3HvwHLU2i4l9uDQzRvHG8CsmPCcNRaOVH8=;
        b=0sDcjtQH+PTLaQxbVcznxQKF6lrBkFO+zl0mqpf1vR8OWWMtMuZfcPCu779DM5RKRY
         H/7ZqE3TiBWLlZIaPeKTSbqFAh6Uf2VwfRmJ+mgXIjkUdOxtWl+RfMZUw7C5daiAJuHj
         I3biZIduHIzLekKFq2r/uLc+knMugKc9o1XubrkVUsFEs+pcO336s8egxSoYNKysBRBK
         MfNsCfGhc4xheHWgdWGYXi8bYJqjl/vdRs91rhSDXVn9v0/ftYtU3n/im4VXUxorgGYk
         8s3A0j+X9M+ZEu53OgnzfKhXrgT6OMTzo7YeG+8ld55Z36YoJOOzmoU7aVusrOXE979u
         rWHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z7OowUCO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x33si10640086ybh.26.2020.10.18.13.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Oct 2020 13:41:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z7OowUCO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUFUh-0002oG-Pn
	for alex.bennee@linaro.org; Sun, 18 Oct 2020 16:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUFOD-0002TW-O9; Sun, 18 Oct 2020 16:34:49 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUFOC-000117-5B; Sun, 18 Oct 2020 16:34:49 -0400
Received: by mail-wr1-x441.google.com with SMTP id g12so9108188wrp.10;
 Sun, 18 Oct 2020 13:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uimP/iqQh3HvwHLU2i4l9uDQzRvHG8CsmPCcNRaOVH8=;
 b=Z7OowUCOFke1z16AdXigR9YxqUSnC7cOH8c7fbWkJ5kpB4HpMvxckNV+Y79VeKifso
 zql4kiFxQqam97vOkftwYXc0hpL3wKVAX/95fQxyl24O432Vgasyk6sQ4/Jf4Tv4hbVN
 t5CzzyBg3BnxQOEFNXcEaH78bCX0kc+yNJCKH10P3FiiBUBZImrS3WEFoysx3bzQ6ulc
 hdNuzmrPxJ1b8of6bqXShsgZinRYUsCR324Gd2iffLn4TQ5I93mGfL/E7dxUARYBy654
 cO3RIIVDmfm5NxQPpqjmFoOnB3cv6ABYNA1Rh/OUH3PrftkLbf6yiBeg02jQFuHBkc7V
 Wrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uimP/iqQh3HvwHLU2i4l9uDQzRvHG8CsmPCcNRaOVH8=;
 b=DZiIDrbbeGPA9W2ohQuBZbDGX3B1SKvrV4UTurq2Etz2QUo2vTO+vHtbOMUxldqPb6
 9zdfvkRzKvQ+MV8XzBJOk8CGDkGsaV37TuVfVCQY3EBwzVT1HGDAgxDOvg4WszoHHT6g
 /6hRza+5haVaQSbEt0S545MfuvmSEs0QwFqgkA00UOsr4+haLDcO/pati6C0jruKDpEN
 VrD9zL98Z5Kwx4KQLjtq4J6BqBpb16mseyp83M+sawyjo2TUBFyRTSf4U1fBIWOxSptM
 fCyUedYPwhZDkGGxAy2S1gkB5ONTGKMh/1DlT5Qix6+sWqufmyzoKo1BvQsS9luuqE5Q
 5t6Q==
X-Gm-Message-State: AOAM5339kDX5ZiUl6G63mQAKuyP7G8mSqSwoML79IUmTi4tqf2UAyB4a
 ZWw1pNLF/wsx6KvJSgkaW/jYHHNkDcY=
X-Received: by 2002:adf:e38f:: with SMTP id e15mr16211677wrm.294.1603053283026; 
 Sun, 18 Oct 2020 13:34:43 -0700 (PDT)
Received: from localhost.localdomain
 (117.red-83-52-172.dynamicip.rima-tde.net. [83.52.172.117])
 by smtp.gmail.com with ESMTPSA id 13sm13179986wmk.20.2020.10.18.13.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 13:34:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 9/9] hw/arm/raspi: Add the Raspberry Pi 3 model A+
Date: Sun, 18 Oct 2020 22:33:58 +0200
Message-Id: <20201018203358.1530378-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201018203358.1530378-1-f4bug@amsat.org>
References: <20201018203358.1530378-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KTSUD7Tzfu/q

The Pi 3A+ is a stripped down version of the 3B:
- 512 MiB of RAM instead of 1 GiB
- no on-board ethernet chipset

Add it as it is a closer match to what we model.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 1510ca01afe..4ea200572ea 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -348,6 +348,15 @@ static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
 };
 
 #ifdef TARGET_AARCH64
+static void raspi3ap_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0x9020e0;
+    raspi_machine_class_common_init(mc, rmc->board_rev);
+};
+
 static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -373,6 +382,10 @@ static const TypeInfo raspi_machine_types[] = {
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi2b_machine_class_init,
 #ifdef TARGET_AARCH64
+    }, {
+        .name           = MACHINE_TYPE_NAME("raspi3ap"),
+        .parent         = TYPE_RASPI_MACHINE,
+        .class_init     = raspi3ap_machine_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("raspi3b"),
         .parent         = TYPE_RASPI_MACHINE,
-- 
2.26.2

