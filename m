Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp736074ejb;
        Thu, 15 Feb 2024 10:00:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX3rhRBneNPzwfFIbodEJiYO6X96ZUoY/60m47wXqwpKNUq0kaTgJxuD89I4oqpmueX5GYt+ikF5L7ra625L2mxsMGjUa4G
X-Google-Smtp-Source: AGHT+IFHeEWJhlOdkXm2HKRAn/XPIRr0UKqbcRxsgIhA77YPp0mZWWShuVV6UCs6CPzdj66BqLl2
X-Received: by 2002:a1f:4a04:0:b0:4bd:54d0:e6df with SMTP id x4-20020a1f4a04000000b004bd54d0e6dfmr2343198vka.1.1708020044352;
        Thu, 15 Feb 2024 10:00:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020044; cv=none;
        d=google.com; s=arc-20160816;
        b=Wcg61zHbz68XGkX/hbDHsWNKMEW74MBdWoyH5m5JTvSG1bLXGf/o0XWzVtRdnelAPL
         eMmRtullHj70yd01JU/QD2l79EBlaAXaLWtUjtNPCT2lRQCVQt2O+PetkCnROg4rZa/W
         zT9Ncspi+fdVUE+LD66z/xSvR2ne3dE5R8hfXfp8gSXUDQ2/85rFLO5iRgrFrvVSFozv
         GidHAiCFBhpyvqTsR21zToh2rHS6azhC31V4iVBuqSXpsk2s4936obHACRMieL9mGXO7
         +dIaJH4/2ZU0gv9r9mm+WJyRtj2mZBN5bfhezdN/8hR9XOwvUCBasn3sh3PDFoCjGXrE
         3Pgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AtVnVdwlMQuIF8ap5e3PdkZeedjV1hEn+tIJt0DtjLY=;
        fh=12eoipryTHYa8nZZxTNXH+xdgV6EIv6nOyDojhV+YBY=;
        b=na32JELvL7JfTbW02FH5oI28N7HpvJ9LwgU+0yheAw7Zg7ZwAd9LTorKKfNysHhSRN
         aU9be9exYphXZa5aCj/0Mt4c9WnjXITDoRlt0vfixnRuBBZvVF/jaJSk3p/3OA6ks4V7
         u6e4cUaIRoZkYjbEoliX5RDk2QGKr3GhOd1syvrjeSykSFEEwOB17+Ko6HES6VSs9A8c
         GouK8dS/o6oyckXroY8ICAxqUS212OsW611tSkna+VHQ0826vuZejrkdazrJYuOvqJJQ
         g2o5I8n9F9SVFLVvwBrSoIl/vP+g4NrIEPp9PaXZb3PlPe/mDgkpyX6VJrLujVimqdme
         pllQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qbw+E3S4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13-20020ac5c74d000000b004c0333ca539si382180vkn.39.2024.02.15.10.00.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:00:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qbw+E3S4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag1T-0005Gw-IT; Thu, 15 Feb 2024 12:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag1O-0004sJ-NL
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:59:44 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag1K-0001nX-Lo
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:59:42 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-339289fead2so669212f8f.3
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 09:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708019972; x=1708624772; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AtVnVdwlMQuIF8ap5e3PdkZeedjV1hEn+tIJt0DtjLY=;
 b=Qbw+E3S4DGbJzqicC2kkU8x1lkRctA5ZlDovY5kVNU1jui4ZuigI/0x1VBo+CvS0XH
 ufqRqxEcSF1KVyhLEzp++nA4ma53wptvZIxe0p+QJ3J584c+A+3SxkFKBn35HBhAuL9O
 gZGh2xE8YSQfOhbVylb08LPdeSOKgWziG5EFAS2otu2jVPOW2KXOhV6+fY+c5Kuf5VOA
 8BzC2GRn50VKNxaHynrdylVFlYr41tqoOaY8tFkJAMxjGZ9o4q0RF2+mRdw2QhXH56oL
 8TmR5MpauoEt62EiD7II5MZFnoLBidzAraUypVa3Chb0GxfEkarQt7CfSwk//4Mjr8xw
 03fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708019972; x=1708624772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AtVnVdwlMQuIF8ap5e3PdkZeedjV1hEn+tIJt0DtjLY=;
 b=cCI71sciHh/TkPA1lkM6FlGAxhHzGn6/emw6USDMzcoc0G3rOq/yNgQQE0nqnp85AU
 Z/iXR/sjq/LsjtC9LdSMRZQkZCYNRpyWuWx8s9q0H63ys88Vp8wfmOcpbgi/Wcluu8iU
 xKjronz+9Nt/iU9POhtJ+kPbavOyrq5d+bEAWXY21D4Uxq9JCmYCYToJ1HMdZjIcV2xO
 uA50ZTyJu1ixktHO4SCdCf6gmDKZzGES6IoQvBtwqsCsGgzDbl17RZkjlbgit4WOcD7t
 PaOnTgU6nc9njryI4SRDQetrygUj7hveP0iWI6X3GoCoNpCSWP+FS2qX0fr7mV4M6lCN
 hyNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEIIyq8fQ6n8RTLdK3kk8gHFFyrXI54pMeZSWKQgzNV7L9spZB5S5CCp8JKRVOIaovgrwHGz/jdl1cYZVMyBgGQMD6
X-Gm-Message-State: AOJu0YwaCGANkfSF/Zxmf2TgZLeUz2W7XEv8oJ8lZqrDlWihb4NSBlKp
 kkbKEO+iJWxg7hLGqowuyn5VMPqiTrYEHETlJQFJ62RM/ek6JsAEZMJTEFMnPa4=
X-Received: by 2002:a5d:5591:0:b0:33b:2835:a1fe with SMTP id
 i17-20020a5d5591000000b0033b2835a1femr1891387wrv.47.1708019972776; 
 Thu, 15 Feb 2024 09:59:32 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a5d4081000000b0033b6e26f0f9sm2427415wrp.42.2024.02.15.09.59.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 09:59:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 15/56] hw/isa: clean up Kconfig selections for ISA_SUPERIO
Date: Thu, 15 Feb 2024 18:57:09 +0100
Message-ID: <20240215175752.82828-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: RCzh3rBtsaqS

From: Paolo Bonzini <pbonzini@redhat.com>

All users of ISA_SUPERIO include a floppy disk controller, serial port
and parallel port via the automatic creation mechanism of isa-superio.c.

Select the symbol and remove it from the dependents.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20240213155005.109954-3-pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/Kconfig | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 040a18c070..7884179d08 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -17,7 +17,11 @@ config ISA_SUPERIO
     bool
     select ISA_BUS
     select PCKBD
+    select PARALLEL
+    select SERIAL_ISA
     select FDC_ISA
+    # Some users of ISA_SUPERIO do not use it
+    #select IDE_ISA
 
 config PC87312
     bool
@@ -26,9 +30,6 @@ config PC87312
     select I8254
     select I8257
     select MC146818RTC
-    select SERIAL_ISA
-    select PARALLEL
-    select FDC_ISA
     select IDE_ISA
 
 config PIIX
@@ -49,8 +50,6 @@ config VT82C686
     select ISA_SUPERIO
     select ACPI
     select ACPI_SMBUS
-    select SERIAL_ISA
-    select FDC_ISA
     select USB_UHCI
     select APM
     select I8254
@@ -58,14 +57,10 @@ config VT82C686
     select I8259
     select IDE_VIA
     select MC146818RTC
-    select PARALLEL
 
 config SMC37C669
     bool
     select ISA_SUPERIO
-    select SERIAL_ISA
-    select PARALLEL
-    select FDC_ISA
 
 config LPC_ICH9
     bool
-- 
2.41.0

