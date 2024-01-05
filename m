Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp794615ejo;
        Fri, 5 Jan 2024 07:49:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLspRsjPzc+RdHBYVXRx32tHtwJOUsIopzTW5DjTqlHcdYLG5yiWYblQ1C/gwGzpL9LgHQ
X-Received: by 2002:a05:622a:1b06:b0:429:7363:e50a with SMTP id bb6-20020a05622a1b0600b004297363e50amr2003607qtb.4.1704469750621;
        Fri, 05 Jan 2024 07:49:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469750; cv=none;
        d=google.com; s=arc-20160816;
        b=z2gGglQqkhnVBzpxhhYkCBNQLBKJKFHk0Pk6zcJOWCeVEZ0Qiu6Wk/oCEh9hUANdZR
         o1V6sxtguIlJyltB0RLutKtiMkaXyUUfNrs9C0PH5cjMNu06yZvuD0Rl4uhcIBjs1O4u
         4SX6iKBfCrx6M/f0EaVUlkwxUltha7Q21c1M9mDXgh7IlVYn/UUwcKvFP/ekG0nnqIch
         9kJzOni+9reWOJTBrkhZNM56YU8VhVZ0gYMHIBwFGQTdO9sEMD7gRIKVP4Pkh3OFLTZc
         9WTFG74xoMWp7ntAy2mDSQVwtVYn6PqN0fmR8r4efJrICtZJnzvOMS60OaPnnOuzE332
         nnhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3QQ/o8R5/vZPDmg4xKxtglyBmLRK3vBkRVa+vx66Ggc=;
        fh=rkt+9HaXwNBmvup87LLu9yZu5jcNyziDIhsNC7dj/wk=;
        b=VgGMJeeqD4mco1nm+zjhfU3FdH9CIVpAWADqktu9GGWMq65Xlfikqs7O8hAn4bLrzA
         Q+Ub8lzSr+V+gLPzaR5HY8JOskCk3/n5QTl+68IuundoKDKLzUR2lQg9Zq8AaTzw0mbi
         QQgQBwG56LNgDFf+QhiKqGwjgCchXiCcjsGgPKAuxuMj5LPHtd+XDhC9ua0ycM2IzKOw
         Uco0F99+W8tpL1VKk6IQld2c14X9Akvg6LUCazYf4gJx6enFVOTaXdq0vB2SEI7M3nKW
         LypR3jFAquUWFLkcBYnPHGiJoixx8od63nVdGFeeFbjYKxEY7Y3ntH1+GZSXqGqMG0iW
         fCiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gzNgdQPX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fb17-20020a05622a481100b004297ce79992si589314qtb.337.2024.01.05.07.49.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:49:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gzNgdQPX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmR0-0001xy-3j; Fri, 05 Jan 2024 10:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQ3-0006df-Qb
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:47:36 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQ1-0004F1-55
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:47:35 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-337520892f7so391587f8f.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469650; x=1705074450; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3QQ/o8R5/vZPDmg4xKxtglyBmLRK3vBkRVa+vx66Ggc=;
 b=gzNgdQPXPyjo0e59+p2+dOCfBNfxyuQQCVoz1hYTsUQgktONxBoVkdqtkzt2RqWLX0
 UphElLe0/bONr7wFZY77YWN/JtT49wtgD3wopOUbKNxq818eaLpq04F28C5XYAyVEEDv
 4KymZ7QFi3RxRWrHaKFSscJ4lGAuUQVfqTz7cajRwr+b3zxWpIaNt5A+H0FpClFs/tlK
 vLlzlloKi87hyq0XFqCBZW65CQNFnJq7Y2blXFKtOcZ1Q8ujbyjZJgazTpGvA7NihO+8
 drOCpcCrZDE8Vs8YiKYiq+dvTYLaDkjkvjtncRRMbmtPF7N/lXgZBcsX8Tuhts15qdCn
 Tgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469650; x=1705074450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3QQ/o8R5/vZPDmg4xKxtglyBmLRK3vBkRVa+vx66Ggc=;
 b=kPyLmjLQUM5MAr7niD9WwRUzRVSj+bBqGt8zypQRNo7lVKRIjmlWZqPLrUcMy7XlAf
 BcEC4b3ZeSuUlLSup5tV/7s/YIe9pO+78XC3YAQW9gmkspv0VP421osp9lYjRJDAAqt2
 HmdfIOAHq2bKAWQtiNJjiRcFKVQ6gCKU5D94zN4Snr2HrtDFpURD7229s4C29W5WE90r
 QeYaLWsl3QvjYcKgrVt4vtux1EHCyy6shyB6T0lVrWOksJAVa+Xdev0UBD8jIcMSMt+V
 ctu7d9PqHbXwwAwfZcZ/jMRs4D4yiMYg+cwaU+IH3vuivs6xwZQI63SiuQEphwKNiW1V
 VZFw==
X-Gm-Message-State: AOJu0YxAmi7SsEHeZMR9MohfsghgLtVG/VyEVlHe3NzrGTEwv7MuZWCR
 33c+zPjrH82Hm+NTUj+oFtwEOggBw90mFw==
X-Received: by 2002:a05:600c:3112:b0:40d:62f7:3097 with SMTP id
 g18-20020a05600c311200b0040d62f73097mr1318661wmo.130.1704469650602; 
 Fri, 05 Jan 2024 07:47:30 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 cx12-20020a056000092c00b00336b702af06sm1613139wrb.16.2024.01.05.07.47.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:47:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PULL 40/71] hw/ppc/spapr_cpu_core: Access QDev properties with
 proper API
Date: Fri,  5 Jan 2024 16:42:33 +0100
Message-ID: <20240105154307.21385-41-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: izdXYiEk59WT

CPUState::start_powered_off field is part of the internal
implementation of a QDev CPU. It is exposed as the QDev
"start-powered-off" property. External components should
use the qdev properties API to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Message-Id: <20231123143813.42632-2-philmd@linaro.org>
---
 hw/ppc/spapr_cpu_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 710078e9f7..5aa1ed474a 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -306,7 +306,7 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
      * All CPUs start halted. CPU0 is unhalted from the machine level reset code
      * and the rest are explicitly started up by the guest using an RTAS call.
      */
-    cs->start_powered_off = true;
+    qdev_prop_set_bit(DEVICE(obj), "start-powered-off", true);
     cs->cpu_index = cc->core_id + i;
     if (!spapr_set_vcpu_id(cpu, cs->cpu_index, errp)) {
         return NULL;
-- 
2.41.0

