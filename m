Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2959950ejy;
        Tue, 4 Jul 2023 07:52:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5uI+xsoeJ9tAeWMR1gcx33vJoCIc1dvQPghbM+EKK15rSeHRDDrzPjNmuGrwRSJsNhd7/S
X-Received: by 2002:a05:622a:104b:b0:403:2e79:cffd with SMTP id f11-20020a05622a104b00b004032e79cffdmr14657660qte.51.1688482371965;
        Tue, 04 Jul 2023 07:52:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688482371; cv=none;
        d=google.com; s=arc-20160816;
        b=bFFwNiUkJYZELyyVow112pxDoOsGC3SXx4TPFoesbhlG3Ne1ksk3wSAWEOv6zj3wdt
         1G55FIdhP9YLVsRnuBUh5Wgg1BMdgpQmOMuaeNsBLRfYS+YaMyT80k0F2IdkjCZALxal
         E5ntnYbYIUCRqwqlo8KL/gPPqD18nL2uKRf7AIIeA2p3EuxpDYBjdBTgSXp6Ooa0Lnxt
         XW2PEAm2vkCpuq1jbjoVlY2SDdldXDZFg/c6vog7WsAvGHkj+92qNZl6RamOyvHpgsMy
         mU9c0grLLJ6krQC+nxD2vG1/QetTGCnjgXNOOyVRTgde3JB4qRzlCpd3csEo4hGNqINH
         1zMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wgqnt2VX3X1H7hrQYVz6F1zcu6hxE23p/SOYvZ7/smg=;
        fh=Lngrjms14biHE1uwg3hJItOsHUc/fKOP3kWz84zgU0I=;
        b=oQ6zRkUhma87twDoZRZ/WKaRmxzJF6+YPuQdjs8t3QwmigQp9vjb0NC24AiN2RpRmy
         +tv9nfhIJsCGMdRb8YC7cFOt//qyxt9SDkdWmk70kSNb0kRQdvhKSmbhSBpx+zl8e6hM
         6Im7AmV+8k6zjhBbCgRgSni/CUCpX/gGVrGxKJab3Ws78yXXSbiiIlaZswdwarb+WL7/
         9DrenecmkZih7+OZOIzmV/PntMuoa/TC63OlkS9vte/8xrTym0qguoZnJQCR3coKb3UW
         SxmVaFxkdLLLwE81PnFYLr6javv+R8r7ZwC+G+OxkmfaB5zNLP9Yiw+JTx3bQiC1aeFq
         nEog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IbEpMfAQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4-20020a05622a010400b00401e76746b8si11405598qtw.651.2023.07.04.07.52.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 07:52:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IbEpMfAQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qGhNZ-0006U9-1M; Tue, 04 Jul 2023 10:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhNW-00063g-Cx
 for qemu-devel@nongnu.org; Tue, 04 Jul 2023 10:51:42 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhNT-0003HS-JE
 for qemu-devel@nongnu.org; Tue, 04 Jul 2023 10:51:42 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fbd33a573cso29731965e9.2
 for <qemu-devel@nongnu.org>; Tue, 04 Jul 2023 07:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688482298; x=1691074298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wgqnt2VX3X1H7hrQYVz6F1zcu6hxE23p/SOYvZ7/smg=;
 b=IbEpMfAQNaks5OtQCxWJ65MC1we/3JI3XmlZcyjC97imIfLZcYPtR3XCH02u3u6XpC
 BkfjiOmqKTSMe3SFdMXp1M/0cZWXoGCd91YS6jvmhiQP3E5qsoMF3TZt6Xba3PM6qXyu
 iIPRM6rRqovJk4TUo1ruuE4qb9KdSB+Hk/cF/azlAVnxDKSGsmcVTnOvEephnCGcMNOj
 PYNTiTaK6StHtKMIOc7eV9YjtTjeZVuEH/fiwpJyEd5GvceDbrlUu1TslyTxOP/FQ0kC
 HEVd+pDa8quxpbEDgwGDsiZ7Ql+Jl3TDeEB3Y96BAH/57wFhT/4VuSu2sZkBUURdWTMz
 a1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688482298; x=1691074298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wgqnt2VX3X1H7hrQYVz6F1zcu6hxE23p/SOYvZ7/smg=;
 b=jr2qljB/6xhRxYP7qqt+818NVwCoqHcy8Ox88N02SKTwQLRxuo1pqmT4lVeHDJwfVx
 Ret7uJTmdj0PFAKrHaJFdbwz3xunh/MvTPOHM3RMM1j1m3qlr2Mvv+bO4gdxr/1os8Pu
 YLt7LTF+gBH5s6to2FsmL/Zrq2bnjHOi4gBebPTPNm2SVH0ebM62FrAzosWKS3GYQ+a+
 pnv3j2Z2etXDExxKjgPLml9vbmXCNr16tYOZhssWTDN0Cf8ctHG0lvPEXI89VwbD1bnE
 HHlE2Iy+rYAPp8nHOqiPoubt+UFJFa8B4TkG1CWJhNur7+VoztQVieUQ3hzeg+WkaIOZ
 /peA==
X-Gm-Message-State: AC+VfDyr+jkqxT9O041Hxosr3L743qoKTiLE+05LdlebRhSEwNwMLUS4
 56DLt2+Q88b4cyaRcE76ICbulP3kCOcIwehZGmA=
X-Received: by 2002:a05:600c:2049:b0:3f9:b31d:5689 with SMTP id
 p9-20020a05600c204900b003f9b31d5689mr10696015wmg.36.1688482297790; 
 Tue, 04 Jul 2023 07:51:37 -0700 (PDT)
Received: from localhost.localdomain ([176.176.157.122])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c220700b003fa999cefc0sm24555314wml.36.2023.07.04.07.51.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Jul 2023 07:51:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 16/19] hw/timer/arm_timer: Extract icp_pit_realize() from
 icp_pit_init()
Date: Tue,  4 Jul 2023 16:50:09 +0200
Message-Id: <20230704145012.49870-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230704145012.49870-1-philmd@linaro.org>
References: <20230704145012.49870-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UcVeL3JlbFhL

To make the next commit easier to digest, extract icp_pit_realize()
from icp_pit_init() as a preliminary step.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index aae7f3cf9d..30e29cc166 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -408,8 +408,6 @@ static void icp_pit_init(Object *obj)
     for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
         s->timer[i] = arm_timer_new(tmr_freq[i], s->irq_in[i]);
         sysbus_init_irq(dev, &s->irq[i]);
-        sysbus_connect_irq(dev, i,
-                           qdev_get_gpio_in_named(DEVICE(obj), "timer-in", i));
     }
 
     memory_region_init_io(&s->iomem, obj, &icp_pit_ops, s,
@@ -419,12 +417,31 @@ static void icp_pit_init(Object *obj)
        save themselves.  */
 }
 
+static void icp_pit_realize(DeviceState *dev, Error **errp)
+{
+    IntegratorPIT *s = INTEGRATOR_PIT(dev);
+
+    for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
+        SysBusDevice *tmr = SYS_BUS_DEVICE(&s->timer[i]);
+
+        sysbus_connect_irq(tmr, i, qdev_get_gpio_in_named(dev, "timer-in", i));
+    }
+}
+
+static void icp_pit_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *k = DEVICE_CLASS(klass);
+
+    k->realize = icp_pit_realize;
+}
+
 static const TypeInfo arm_timer_types[] = {
     {
         .name           = TYPE_INTEGRATOR_PIT,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(IntegratorPIT),
         .instance_init  = icp_pit_init,
+        .class_init     = icp_pit_class_init,
 
     }, {
         .name           = TYPE_SP804_TIMER,
-- 
2.38.1

