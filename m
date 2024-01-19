Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp880925ejg;
        Fri, 19 Jan 2024 03:41:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAg7RaRvyc34ZzTDkMbQzQ2r5GODpO/ZpK8mxGR7ntD4oD8Ez5LpqLe9M+9TXNfiHunqJQ
X-Received: by 2002:a25:aa52:0:b0:dbf:1edf:37ef with SMTP id s76-20020a25aa52000000b00dbf1edf37efmr1738259ybi.54.1705664516447;
        Fri, 19 Jan 2024 03:41:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664516; cv=none;
        d=google.com; s=arc-20160816;
        b=Y338iQwBTouu6N+1D+63w71H4XDVnEHHsN96miieJx6PGRcjfblCYUYvgIaV72CGGv
         3AC5V1fXscBPoqhM784IUZIED598MYpIallY+IGP6Bn84gJ0ICKsYIijl39S58PFzlsv
         NqjS8sq5bK1KT68eyNPJkUui1dKTswPIREU2yDorooofD0t556W40OCh/7kVqLQWHRIT
         LiNI/hYpPDy5+GGrY/eIGOEbHIm1A+eIvUpDkSb4t8q/mFSdTzaC0Ieug6QCeIlL8b1N
         ZPxl2pwq84e7Xeelp3gBIDuo219WqizrE7XiEE1k6WsvQwyyzm7L7SHMtA6Wu98QQ0ML
         ydHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CZOOriEuiBAbNMMhhXm8QlidphHeh3aLspyqOz5Ajks=;
        fh=tLx+m0BWvCiM+lTZagO/5rmwTauxl8DHhQS+XJFibX4=;
        b=uY61jMiDh3wM4JyZRxJpYVkgwLHsXKVfTDGpXHNeISTgl7LOEebVrEuHIhjhPrEqMR
         84kRS83u3vezMDzkewSE5bLQOJXBn02JkYr7UeDw6urqZk9NNTMMf3JAEA4p/VNp5zME
         W/XezWauzMcTQ++r82bkHnMAt7qLofeEKTRd10YpjjJ4rRIpz6FLjyrsQ49HCyJh5w34
         STBN8FwApdg4GMpHyW4fXCzxkTuym+2+OpE0OIR30kdQU9xF00gjFQ1r8WYZ1DFby0V6
         yG2kxaMUQJ7PU0yYdteQLgQYcQeTaeS77NfMIkK2kzPYsfTkP3hxvGvsJu0XjD81JO3u
         DI5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wR+AkuG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t25-20020a0cb719000000b0068191db76fdsi3312050qvd.262.2024.01.19.03.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:41:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wR+AkuG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnBT-0005Ed-Ii; Fri, 19 Jan 2024 06:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBI-0004yl-9k
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:37:05 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBG-0002vW-Me
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:37:03 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40ea084ec14so1276565e9.2
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664221; x=1706269021; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZOOriEuiBAbNMMhhXm8QlidphHeh3aLspyqOz5Ajks=;
 b=wR+AkuG9qq/deD5sVWV25v+ofxzaTlM1ZAJ+OMqxn5eMF6GuvJpP7q38RDz0C8Gsdx
 MHVLFc/OQIs3aOwEXvwXgcZ3g3ewi4R0zF07OJfNsKjpMTel5XlcIpFu0Ew9/m0D/SpA
 YQisW3LdZWDByoQhPmgCsTS+3bsyG94O4pqyFcMrCKioMVoSXmVLpD0SPdPuhR5BT/wb
 oihLyzwOmBUkMae7AlglRuu9Jx9mhfRxy8COgvXhKGsDQbFwz2FK0gDpUkjyAPWfKCA0
 z3AKT9Kw0MU9fh4t2pnZuTRT9RdXJZEp2SWhUhtTomPD7znEklSiHlNeFjNSuop+lCJn
 +CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664221; x=1706269021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZOOriEuiBAbNMMhhXm8QlidphHeh3aLspyqOz5Ajks=;
 b=GBO916E6srrDheLhIZ8xwyYtSqhrjgUJlnMik+vldlhUmSyZlsTjFOzpYuDuPjv1U/
 tnuDja+SbBY5R5KRJzR+2UbX7Pb+LYgOc6SOMEvP62ezJTO+eX2E1wYqtaGCPvsYU2W5
 acE1aI8/k8TZKowC+ti4xC1bGxtSmrRP6IthX1sJPlkcIQR772xtFitHcV5CQ1Q+9gL9
 MWEdbEHHQB2SCkBt2P+qFqxMGdDg38sDVmm2xsufm3c/8NT+5XWLwEmmSGeagH0eOhIs
 sfXSyiiCiNTPschHJ3HLGKPzGEyLUmBlIOHxajznu6+PY2Qi1BQhYdAL9WrJQlGC0hEm
 5Oag==
X-Gm-Message-State: AOJu0Yw7qp1blQ0SKnFswJTifAZYZL9LktHSBNTgtiCh2YKBxBTxD0yk
 BHisaDNibdg02ym2y3hKYkCTj8uYDEoxfSazrS5YEYIuMd+4jMlyB0zSkbQFqVc=
X-Received: by 2002:a05:600c:654a:b0:40e:427d:4b02 with SMTP id
 dn10-20020a05600c654a00b0040e427d4b02mr1636546wmb.67.1705664221241; 
 Fri, 19 Jan 2024 03:37:01 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 jg1-20020a05600ca00100b0040d4e1393dcsm32251084wmb.20.2024.01.19.03.37.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:37:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 25/36] hw/core/cpu: Rename cpu_class_init() to include 'common'
Date: Fri, 19 Jan 2024 12:34:54 +0100
Message-ID: <20240119113507.31951-26-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: 1zW2fhub7yvy

cpu_class_init() is common, so rename it as cpu_common_class_init()
to ease navigating the code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20240111120221.35072-3-philmd@linaro.org>
---
 hw/core/cpu-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 3ccfe882e2..67db07741d 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -273,7 +273,7 @@ static int64_t cpu_common_get_arch_id(CPUState *cpu)
     return cpu->cpu_index;
 }
 
-static void cpu_class_init(ObjectClass *klass, void *data)
+static void cpu_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
@@ -304,7 +304,7 @@ static const TypeInfo cpu_type_info = {
     .instance_finalize = cpu_common_finalize,
     .abstract = true,
     .class_size = sizeof(CPUClass),
-    .class_init = cpu_class_init,
+    .class_init = cpu_common_class_init,
 };
 
 static void cpu_register_types(void)
-- 
2.41.0

