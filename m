Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1716206lfq;
        Fri, 2 Oct 2020 09:44:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2kZRiUFfDcEs1OrmJkAx3jF3cbxtADNMQsodpJXeCbNtGHEuhLHdXJQur2/CF96pl0Rdl
X-Received: by 2002:a25:d287:: with SMTP id j129mr3826593ybg.308.1601657070515;
        Fri, 02 Oct 2020 09:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601657070; cv=none;
        d=google.com; s=arc-20160816;
        b=cOUeV40cjuG1xMs1dgbJXWgp5rZgrWHkY22B8Sunb+eE5rTJ/+/kB9bASAtNEEA10S
         odGvYAf5Evu6KM8dQx5KYzbfSThg12k3tFMTepB+z1auNS/FUS4kxhzQ7FG1xKnnzIH8
         g+ObtCC9EkJIvr7Gmd4NsJQU0+AQGBsBsfRSy6AeNh8NOUE+UrPWOtnsLqZzczxQpY0m
         cVn0LJXxGh3qWCOKCvZoDGpbWLqW+PW/b35Qo/ncy1rLa91QxyFCUrcHxqus6OISPd+M
         aVT04lOCxFn481FLum5yCTxmmv//UpI6NUFyZFgmJPzvTQO7NpbkRvBZsBcUD8T7h+nB
         99yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dWp63D9c2Lr1JkfNpk3fP0mvyDGBITZOhbYefHb3Q5E=;
        b=0LIHVZwKFS+dD8m1qv+PKlDrK6rHDjlU+9QUctZcN3oN634F3kT/de85cf465rC8Av
         7N1xiCig1hAYYJKCfgHLuqXAXw1VRSwTZZpcic98YzKc90/b1CPW7+A46sWbArzdEDqK
         kCMlRh4++x3K3CY5sm+Vll4jlxX+xG6hKQ4SZGWASm0EvtO7EGW/6fkhE6kDs2UPKKzq
         Ftfm93LvkYVCL3JbN+MHq1XwI5XN3oRKp2yNLrgxg5ZpzTtU7nhi6kXj1lOqYV8J5vSt
         tFKTeUS+ROzSScf3vrdRFXR5yNRjpL/xQPP1IwckncS8fTu9ncJIyDsZP698SG4dZFLl
         1xlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CmC0xxSb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o133si2349702yba.435.2020.10.02.09.44.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 09:44:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CmC0xxSb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kOOAX-0006si-Rg
	for alex.bennee@linaro.org; Fri, 02 Oct 2020 12:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kOO8W-0004Ad-L0; Fri, 02 Oct 2020 12:42:24 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kOO8V-0005cp-1p; Fri, 02 Oct 2020 12:42:24 -0400
Received: by mail-wr1-x441.google.com with SMTP id c18so2498270wrm.9;
 Fri, 02 Oct 2020 09:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dWp63D9c2Lr1JkfNpk3fP0mvyDGBITZOhbYefHb3Q5E=;
 b=CmC0xxSbZUsDEpDzXkvQVngmvyZ7mmQ0DdrtxBSeYl2NOvcudtRH/uQwv/rcJhXQ+R
 xsXnYAi87rYb1AlabT9IiQxlSSL1PiwZOvlQXNb6Sou3L2vf7InLzjPmGume0bhpFgTU
 VxMTzbZT45eSmbf9Vj1hvc3zJPHAPRqzs8KmC45KzrXXYdRDlrKRdFZqprwVOsFp8z8m
 EqtoIh7+n1h+huyCYCCvgVQP2g/pFjl1K4gmkDCiWQ0gnJ6cH6+hxFxKCaLjxTtx+wve
 0yIq4PAJrYkYpjI/W90L/zOC46wgMjRnp3Z7g32201FwxRXuEX/YnvPvSaT5RTztv9+v
 VUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dWp63D9c2Lr1JkfNpk3fP0mvyDGBITZOhbYefHb3Q5E=;
 b=cFUgtIryhca+R56RwIrmbveTlcx7+7snpG9Rlxmb1OYUmOOqWrQKZrGPKzUU6Gz+88
 +gYmcgZI/7sk1vsswK7sWnnkkaoFjFoPqJtf5nEMx85mv66MFOaODnVczZ38OgIIghJx
 ntP7Ny3fSaNtGc2CUUp+Y76SzmRTKoHoO/U1Co2MX7I6sSa7pR0AWkOReEWWoRtmjlKV
 k94xi4eQvz5sXFZ+byq2L77BoDwzn/8uFpr00gE0Nfjg1NC9vZuuGft/l60hKJgAcD1k
 82+N3BbGuCKH6nCminzx3q4bvPZJP7tpj+oslwDfs9lR5UJLYQ+lwUO+Nupwp8V+8VOl
 JcmQ==
X-Gm-Message-State: AOAM531uMpjcJcsjRs1uWdN5xPKCW2wTmC/0Gov8Z9y6ghO8+n4yJySB
 nUi5P5kflaB4/iNTX7CXydIbmz4+5Sc=
X-Received: by 2002:adf:fd8c:: with SMTP id d12mr4000702wrr.283.1601656941141; 
 Fri, 02 Oct 2020 09:42:21 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id t17sm2378673wrx.82.2020.10.02.09.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 09:42:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] hw/timer/bcm2835: Rename variable holding CTRL_STATUS
 register
Date: Fri,  2 Oct 2020 18:42:14 +0200
Message-Id: <20201002164216.1741110-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201002164216.1741110-1-f4bug@amsat.org>
References: <20201002164216.1741110-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uIzDN3VCszvV

The variable holding the CTRL_STATUS register is misnamed
'status'. Rename it 'ctrl_status' to make it more obvious
this register is also used to control the peripheral.

Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/timer/bcm2835_systmr.h | 2 +-
 hw/timer/bcm2835_systmr.c         | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/timer/bcm2835_systmr.h b/include/hw/timer/bcm2835_systmr.h
index 43df7ee488..f15788a78d 100644
--- a/include/hw/timer/bcm2835_systmr.h
+++ b/include/hw/timer/bcm2835_systmr.h
@@ -27,7 +27,7 @@ struct BCM2835SystemTimerState {
     qemu_irq irq;
 
     struct {
-        uint32_t status;
+        uint32_t ctrl_status;
         uint32_t compare[BCM2835_SYSTIMER_COUNT];
     } reg;
 };
diff --git a/hw/timer/bcm2835_systmr.c b/hw/timer/bcm2835_systmr.c
index ff8c553661..b234e83824 100644
--- a/hw/timer/bcm2835_systmr.c
+++ b/hw/timer/bcm2835_systmr.c
@@ -30,7 +30,7 @@ REG32(COMPARE3,     0x18)
 
 static void bcm2835_systmr_update_irq(BCM2835SystemTimerState *s)
 {
-    bool enable = !!s->reg.status;
+    bool enable = !!s->reg.ctrl_status;
 
     trace_bcm2835_systmr_irq(enable);
     qemu_set_irq(s->irq, enable);
@@ -52,7 +52,7 @@ static uint64_t bcm2835_systmr_read(void *opaque, hwaddr offset,
 
     switch (offset) {
     case A_CTRL_STATUS:
-        r = s->reg.status;
+        r = s->reg.ctrl_status;
         break;
     case A_COMPARE0 ... A_COMPARE3:
         r = s->reg.compare[(offset - A_COMPARE0) >> 2];
@@ -82,7 +82,7 @@ static void bcm2835_systmr_write(void *opaque, hwaddr offset,
     trace_bcm2835_systmr_write(offset, value);
     switch (offset) {
     case A_CTRL_STATUS:
-        s->reg.status &= ~value; /* Ack */
+        s->reg.ctrl_status &= ~value; /* Ack */
         bcm2835_systmr_update_irq(s);
         break;
     case A_COMPARE0 ... A_COMPARE3:
@@ -133,7 +133,7 @@ static const VMStateDescription bcm2835_systmr_vmstate = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT32(reg.status, BCM2835SystemTimerState),
+        VMSTATE_UINT32(reg.ctrl_status, BCM2835SystemTimerState),
         VMSTATE_UINT32_ARRAY(reg.compare, BCM2835SystemTimerState,
                              BCM2835_SYSTIMER_COUNT),
         VMSTATE_END_OF_LIST()
-- 
2.26.2

