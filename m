Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2680012njc;
        Thu, 12 Jun 2025 17:04:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSHvcXIxqpClhpWsyxcNHfkrOeOj1kigDt+qFj8BpSq+hAOaELQzlpcAh4etJTPtVGIti1IA6obG5fNA==@linaro.org
X-Google-Smtp-Source: AGHT+IHhFqpG82ugtWeaVxPgkEP1XMHTTfmR+EpMUu1IN4XB1ah7AmS0dsXS3cd2X+BAW3xmxIjV
X-Received: by 2002:a05:6102:1512:b0:4e7:5e6a:12d8 with SMTP id ada2fe7eead31-4e7e39b929dmr955375137.14.1749773096840;
        Thu, 12 Jun 2025 17:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749773096; cv=none;
        d=google.com; s=arc-20240605;
        b=IGbLybulsU9ULhdVzkq0Efscbm2U2omhcASBd0kH2t6bQPxiwleGtjTmc06t8e4WGw
         1bQhAm4bCnz7dXteJpSXmwVfBExA32xLT749w1vAqZTB49AtYPgeEfeta45BC0RQEVN2
         44CdFxQnAsUbU0Tkq3YOFeTqao61RCRGj094yoWn8iUBZcKHhdzGPQtfupL87kU2CKjj
         LNX8tznLmWhaqA683oZ+wd9BhyDOTn1LxYABJi5R4wB3+J31sDjqrvzzEfYdjc2XAdUu
         NtMBSVuDG9ERL2H79XBj1ltr1FSj5BKsmQFh3Kme29HhGAGC2kjAXVMYugUiyqiLUz/w
         NBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=p8GFuynGr1nk+VpIO+5MvKgGfqQz5tqawVbKnQiXbx4=;
        fh=jmB336zVDilutUuU09TXLNZ6TFwRas8MQn/v9+Y+T0w=;
        b=JMWHVQ4khY2JCondugwhJaOr3fGHhEvxHSv0pT3txZw0e9a+HSCbt/JihTJuUXNzPQ
         QVgRysGd8GiRhicVC1YrjqsBZJMEznBpXziPVO6/Gwkc/uLWozjWy6M0QLeoxDHBSqz6
         tLHdw+WOyTSqRNtAZiTIp+R9OyV00Oe8Xn3cmnjCPADDILGs3k6BrBHpbp4lrW+6xNoa
         raUULz2TOKbw/zRf3UUAkdXaS0+vnQVPFx4vEPhVw09fBK+XVlfpUVGAtYKumjg2Zwkp
         HmRkPcSjq5H66IgY8/T65NBv3CHysz05wwztMs0pD605a58wqaVdFNWdhruVBPO/jLAS
         zrRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=z8id1q9T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-87f0fa735b5si64426241.45.2025.06.12.17.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 17:04:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=z8id1q9T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPruK-0005qy-9x; Thu, 12 Jun 2025 20:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3B2tLaAcKClQ6A87Az42AA270.yA8C08G-z0H079A929G.AD2@flex--komlodi.bounces.google.com>)
 id 1uPruF-0005q2-PO
 for qemu-devel@nongnu.org; Thu, 12 Jun 2025 20:04:27 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3B2tLaAcKClQ6A87Az42AA270.yA8C08G-z0H079A929G.AD2@flex--komlodi.bounces.google.com>)
 id 1uPruD-0000ZA-PG
 for qemu-devel@nongnu.org; Thu, 12 Jun 2025 20:04:27 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-b00e4358a34so921001a12.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jun 2025 17:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749773064; x=1750377864; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=p8GFuynGr1nk+VpIO+5MvKgGfqQz5tqawVbKnQiXbx4=;
 b=z8id1q9TSumCNdFNNRtbKIKvvlWNKDeYR/6zI/KE/q7qOM5KAcgQjhy05pYffiigR4
 F7B5PGh5S9Ryan9FSfidb5DdSXwP11nEH0KFlfFBCUq721Iig7AGrhBu1E7d0ASpjUI7
 uyZSoXs9kergOaeOgkDZDukaLy1ssnKDF17pn5hnLD0ZHT7X4SNDDH2G+3vtIA79qjB7
 WAVOFMJ2BMEo/qDk48s1oiEMXs6BdZFu/IGwN9akKo2ac6LQ9F5jgkHwjR8hmkgeKEeE
 yHM62cZCk4xAFdVvcSTa8DGllvPD8cr4GgZ45O0wRvJ7oZ+B21PWUfRLOcnl2jkPBxdd
 FNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749773064; x=1750377864;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p8GFuynGr1nk+VpIO+5MvKgGfqQz5tqawVbKnQiXbx4=;
 b=AZK1iNe5H7bM2d3bqLUzHYNra9DBsBgYeB22hqP2ZfgqtMkR9F+lS3pzVViPsR7oWu
 2uW9Pe3beT1kor8lcTvttYGQdGQzC4dC9PGshmrtEEXeXe0lLNR0yg5U4L/brDnLiDMW
 BNPWXmPUJkbRf721FkGDT0xqS3q3StBKOq/+AUmMcTyXahd99UiyVQjFPq1D7w7uoErb
 Cw4UfNEH3aas7nWOo6055FYP/9nH4YuTqRdOkxFMqIaMfWBbqymdDxmrl/Y9fusOHLXg
 n5zUf7RkRcAeE8bLBvobnMDFJcoACdj+bcJWxGB5jlUOE9VZKXtCjEflZKPgpbcC71OP
 tuJg==
X-Gm-Message-State: AOJu0YxIs1Gz661brh+KqyjHQuRAOT/L/O6luAk9pJiQjVbLe9JASNwB
 cU/4f8RXLG1eJ/sjzGl/a0DB5WgAJN6OKgd2w6mtfr1o8yqBsHxh5SXlpZCZ7ExEx5e4i6tFhUI
 l1AEM0EFrGTr+aBd8wZdM8wEY7TexyznPrDQeOXsx4OG1L6RlR2ZWrceR7LdvGMOS3ZMqW/k9wa
 Ly7jVkfSSg4yY783wr509VkPTRhtMbo2f8cjxXo00M
X-Received: from pgbcw6.prod.google.com ([2002:a05:6a02:4286:b0:af9:8f44:d7ec])
 (user=komlodi job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:431d:b0:21f:5aa1:3124
 with SMTP id adf61e73a8af0-21fac92fc14mr1289955637.13.1749773063550; Thu, 12
 Jun 2025 17:04:23 -0700 (PDT)
Date: Fri, 13 Jun 2025 00:04:00 +0000
In-Reply-To: <20250613000411.1516521-1-komlodi@google.com>
Mime-Version: 1.0
References: <20250613000411.1516521-1-komlodi@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250613000411.1516521-9-komlodi@google.com>
Subject: [PATCH 08/19] hw/i3c/dw-i3c: Add register RO field masks
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, clg@kaod.org, 
 peter.maydell@linaro.org, steven_lee@aspeedtech.com, leetroy@gmail.com, 
 jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, joel@jms.id.au, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3B2tLaAcKClQ6A87Az42AA270.yA8C08G-z0H079A929G.AD2@flex--komlodi.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: HT4HQuIvXvjZ

Adds read-only register masks for the DwC I3C controller.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/i3c/dw-i3c.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/hw/i3c/dw-i3c.c b/hw/i3c/dw-i3c.c
index 845fbd5efd..4f40f999f4 100644
--- a/hw/i3c/dw-i3c.c
+++ b/hw/i3c/dw-i3c.c
@@ -313,6 +313,45 @@ static const uint32_t dw_i3c_resets[DW_I3C_NR_REGS] = {
     [R_SLAVE_CONFIG]                = 0x00000023,
 };
 
+static const uint32_t dw_i3c_ro[DW_I3C_NR_REGS] = {
+    [R_DEVICE_CTRL]                 = 0x04fffe00,
+    [R_DEVICE_ADDR]                 = 0x7f807f80,
+    [R_HW_CAPABILITY]               = 0xffffffff,
+    [R_IBI_QUEUE_STATUS]            = 0xffffffff,
+    [R_DATA_BUFFER_THLD_CTRL]       = 0xf8f8f8f8,
+    [R_IBI_QUEUE_CTRL]              = 0xfffffff0,
+    [R_RESET_CTRL]                  = 0xffffffc0,
+    [R_SLV_EVENT_CTRL]              = 0xffffff3f,
+    [R_INTR_STATUS]                 = 0xffff809f,
+    [R_INTR_STATUS_EN]              = 0xffff8080,
+    [R_INTR_SIGNAL_EN]              = 0xffff8080,
+    [R_INTR_FORCE]                  = 0xffff8000,
+    [R_QUEUE_STATUS_LEVEL]          = 0xffffffff,
+    [R_DATA_BUFFER_STATUS_LEVEL]    = 0xffffffff,
+    [R_PRESENT_STATE]               = 0xffffffff,
+    [R_CCC_DEVICE_STATUS]           = 0xffffffff,
+    [R_I3C_VER_ID]                  = 0xffffffff,
+    [R_I3C_VER_TYPE]                = 0xffffffff,
+    [R_DEVICE_ADDR_TABLE_POINTER]   = 0xffffffff,
+    [R_DEV_CHAR_TABLE_POINTER]      = 0xffcbffff,
+    [R_SLV_PID_VALUE]               = 0xffff0fff,
+    [R_SLV_CHAR_CTRL]               = 0xffffffff,
+    [A_VENDOR_SPECIFIC_REG_POINTER] = 0xffffffff,
+    [R_SLV_MAX_LEN]                 = 0xffffffff,
+    [R_MAX_READ_TURNAROUND]         = 0xffffffff,
+    [R_MAX_DATA_SPEED]              = 0xffffffff,
+    [R_SLV_INTR_REQ]                = 0xfffffff0,
+    [R_SLV_TSX_SYMBL_TIMING]        = 0xffffffc0,
+    [R_DEVICE_CTRL_EXTENDED]        = 0xfffffff8,
+    [R_SCL_I3C_OD_TIMING]           = 0xff00ff00,
+    [R_SCL_I3C_PP_TIMING]           = 0xff00ff00,
+    [R_SCL_I2C_FMP_TIMING]          = 0xff000000,
+    [R_SCL_EXT_TERMN_LCNT_TIMING]   = 0x0000fff0,
+    [R_BUS_IDLE_TIMING]             = 0xfff00000,
+    [R_EXTENDED_CAPABILITY]         = 0xffffffff,
+    [R_SLAVE_CONFIG]                = 0xffffffff,
+};
+
 static uint64_t dw_i3c_read(void *opaque, hwaddr offset, unsigned size)
 {
     DWI3C *s = DW_I3C(opaque);
@@ -341,6 +380,7 @@ static void dw_i3c_write(void *opaque, hwaddr offset, uint64_t value,
 
     trace_dw_i3c_write(s->id, offset, value);
 
+    value &= ~dw_i3c_ro[addr];
     switch (addr) {
     case R_HW_CAPABILITY:
     case R_RESPONSE_QUEUE_PORT:
-- 
2.50.0.rc1.591.g9c95f17f64-goog

