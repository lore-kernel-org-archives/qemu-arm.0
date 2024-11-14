Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp549942njc;
        Thu, 14 Nov 2024 13:01:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUUynp7Z63XDLGGL4pgow1KCjKa9XoUfzkDufUxl6e/wcA2Ydl0d+PEeVpVs8HkctWIj9emW4qb3P9HMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFCBJTV6HlxDouL3MfMLODWBo8g7/WCr5gsVaOqMDFE1SlB2mPJppxMw/UjnFWJuBMR/Sah
X-Received: by 2002:a05:620a:3905:b0:7b1:7da1:e733 with SMTP id af79cd13be357-7b3622ceb19mr62446785a.30.1731618111745;
        Thu, 14 Nov 2024 13:01:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731618111; cv=none;
        d=google.com; s=arc-20240605;
        b=iTuK7NHZ+KwhzBA1QSy34k305sX5zgVPIsrNe6MEqOaKRNLtDOjoZEFtQgH7g7J33s
         yaH5KxVqgGdPvtBvd2cZLw4gryeaguzzmtR601by7pi7ABCqm1K/ajn/ayDqU1n/dMqY
         enuxDTeXT0Bhx6YEvf+jG2rKhzOBW/gZRh3zLHMzEyO2Zb12cqzr9nLeQ5lzEGU4Kgwv
         uafv7NcaVgV2Y7q6geAc2Xlj6k8c2O9nn0kGfksDsdd/QuQNqLsNZtzPclrCRvtEjTAk
         8mPsC8iRSAdCf/aUbvVVjt+OfaD+Gn+Q//OrtmL7JDRaBOc6pFschHAzcs61Reb52IBm
         zf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yTK4l6Ykvzc6k9RKpIP/b45MtLRJEjbQSCPD8FRx8u8=;
        fh=IRuGWMvTeecxgxjKSI7QmRflMkYktes0sVu/RVhAZQM=;
        b=JvEBhnIarrGAsTznPoSU8Q+waBKTd8k9IGAHVISWpislU2VBcKdBJK6I7dXlvO2xmE
         o9VnGArZhpyXvcHjAUpkUqrYFl9dJvaXH34THA87c0N7X254IhpWEGwN/IpT6ndJVLRx
         iVzK1Uvt051tUTGKr3XbqsjM7GuAJJ6XpppMI+jJgClhHvuNLOrHeaGGvQUXLY/ZFZQ/
         6grjlZoq3A20fG7+8L8xReln4s10Ffmmt3stXOW1oGEgt0YbJ7ydAKGljzSrd4SLVt1d
         mJkdJ7eM8l2Kw5aDE16+ju4X61DKg01IIzwnPWjRzCwWQmgKOY+f3EU4Nq+aKo2RHXbj
         U7rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TyK9DdyM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35ca2a4c7si195573385a.262.2024.11.14.13.01.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 13:01:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TyK9DdyM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBgxM-00007b-5u; Thu, 14 Nov 2024 16:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgxJ-0008Vt-9l
 for qemu-devel@nongnu.org; Thu, 14 Nov 2024 16:00:45 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgxH-0007xF-Q6
 for qemu-devel@nongnu.org; Thu, 14 Nov 2024 16:00:45 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4315839a7c9so9716365e9.3
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2024 13:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731618039; x=1732222839; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yTK4l6Ykvzc6k9RKpIP/b45MtLRJEjbQSCPD8FRx8u8=;
 b=TyK9DdyMLdDpCdVXRdDCIUA50tx6gjaIyGyC+TfQPC45tdMvcY3tAmK3323mEddyQq
 8Tr+5svujKLfIeZWYnSpgxDnPniU9ll0s+Xtq7G7rLpR8MvtHz3p2MUiLqNveF5nwmHk
 CgWV2Q9PrdvIx+IljndKDGcF0E+PezDOD8BkaKI2H1TJp7No/4QrMwVl0W60NoP1UoTr
 t7WzNXx0JGHYkSUg3uwqGR1J5rdUFHd7mZEpnGGwiK9ur8EZ1TyvfQxPXXiBiohPw8lp
 Y1hlA34jkic2DgivY0FcTjvGcPyj4mEl219hODnHklFJjkkkyWyaKCELK6Sp/Q97JVIM
 mU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731618039; x=1732222839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yTK4l6Ykvzc6k9RKpIP/b45MtLRJEjbQSCPD8FRx8u8=;
 b=U/lmuqtFkGqOZG1i4ogF2xWVIdeJTYPXV9XVGEPJpURa/dzuv2zOuekfVywl4kFDP9
 T4l4FY2kBvXzmxcCkFDwli4J92bY8QJZfsy62MBI1bwfruIolckPEhH8TNxo4TS/JyIw
 3c+Pj7OM1L3A/PaptbpXB5rm4ysvcudUPotlQRqBEhbJAH4NqoOZxI0FD2xGNwL0Irs5
 zY2r3GR7fA0A/TT2wKlMRm5fbNkbTydXyYoJy9TIIy5OtvKC/Y0Cm0KkHSYg1oq0Uqcl
 w/P4KiYnD/joK9AOzEzrb0w+0uutvM+QioDCtIM+G0Od1Z30J3hpROHQGuYHcj7bWEkF
 1lkg==
X-Gm-Message-State: AOJu0YzSJ2tuZmkH0/4ZQbOD8NhCa6pO3MYlCqwK5aBjFh/+dbVz3lyE
 XzcHz9cfeYenjuxQ32/Mr/Ooz22IPSUrT3QpjxM8mIsaf9lgbz52RPyC5R1JBYf19Shb46MdYD7
 t
X-Received: by 2002:a05:600c:1e18:b0:431:5df7:b337 with SMTP id
 5b1f17b1804b1-432df7286ffmr1612705e9.8.1731618039000; 
 Thu, 14 Nov 2024 13:00:39 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da27fe73sm35686565e9.20.2024.11.14.13.00.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 13:00:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Bernhard Beschow <shentey@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH RESEND v2 03/19] hw/net/xilinx_ethlite: Remove unuseful debug
 logs
Date: Thu, 14 Nov 2024 21:59:54 +0100
Message-ID: <20241114210010.34502-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114210010.34502-1-philmd@linaro.org>
References: <20241114210010.34502-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 53hTfQWhWpgA

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/net/xilinx_ethlite.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index bb330a233f..2b52597f03 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -32,7 +32,6 @@
 #include "net/net.h"
 #include "trace.h"
 
-#define D(x)
 #define R_TX_BUF0     0
 #define R_TX_LEN0     (0x07f4 / 4)
 #define R_TX_GIE0     (0x07f8 / 4)
@@ -100,7 +99,6 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
         case R_RX_CTRL1:
         case R_RX_CTRL0:
             r = s->regs[addr];
-            D(qemu_log("%s " HWADDR_FMT_plx "=%x\n", __func__, addr * 4, r));
             break;
 
         default:
@@ -126,13 +124,10 @@ eth_write(void *opaque, hwaddr addr,
             if (addr == R_TX_CTRL1)
                 base = 0x800 / 4;
 
-            D(qemu_log("%s addr=" HWADDR_FMT_plx " val=%x\n",
-                       __func__, addr * 4, value));
             if ((value & (CTRL_P | CTRL_S)) == CTRL_S) {
                 qemu_send_packet(qemu_get_queue(s->nic),
                                  (void *) &s->regs[base],
                                  s->regs[base + R_TX_LEN0]);
-                D(qemu_log("eth_tx %d\n", s->regs[base + R_TX_LEN0]));
                 if (s->regs[base + R_TX_CTRL0] & CTRL_I)
                     eth_pulse_irq(s);
             } else if ((value & (CTRL_P | CTRL_S)) == (CTRL_P | CTRL_S)) {
@@ -156,8 +151,6 @@ eth_write(void *opaque, hwaddr addr,
         case R_TX_LEN0:
         case R_TX_LEN1:
         case R_TX_GIE0:
-            D(qemu_log("%s addr=" HWADDR_FMT_plx " val=%x\n",
-                       __func__, addr * 4, value));
             s->regs[addr] = value;
             break;
 
@@ -203,7 +196,6 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
         return -1;
     }
 
-    D(qemu_log("%s %zd rxbase=%x\n", __func__, size, rxbase));
     if (size > (R_MAX - R_RX_BUF0 - rxbase) * 4) {
         trace_ethlite_pkt_size_too_big(size);
         return -1;
-- 
2.45.2

