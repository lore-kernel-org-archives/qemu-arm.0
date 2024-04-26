Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp638715ejb;
        Fri, 26 Apr 2024 12:47:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTaS8ie+Skf/UeD3JJuLg16/XX+ZvHY4qqdqxTEs/I9t1EgXbw7sz+fO6IX2W3DIMsz1VWMdlBXJprQL+F3hxhp6qWF04+
X-Google-Smtp-Source: AGHT+IENWIduVcaIp4KNjx7fWKoobQ5ndCYg/sfrDHTEiT3lIJT39nooIa/b2YPqGlXzH5b7Ik+8
X-Received: by 2002:a25:cecb:0:b0:de5:6abe:9ab4 with SMTP id x194-20020a25cecb000000b00de56abe9ab4mr3936229ybe.50.1714160834618;
        Fri, 26 Apr 2024 12:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160834; cv=none;
        d=google.com; s=arc-20160816;
        b=0XQ9/mK/Wiw6m3FymbnV+32j4vPX/0FWq1hElg7gvAG6v0P1qNnqxAs54J4b3OaYiD
         95zv8Jkuvzy0AgSXUzAE689o89/JEV2nhMH79qvgHS005z2whqSYOH6jGpvJD6CCg4+E
         861XwRVWjUSZVAuPtr5ndG0o0yg3zVUL51tEg/mUfjrPtgZT6sHuPMt6Bu1hwJvkes/k
         YSmnd790ccdaBCkeCxQo0KO4cUQcEU00WEwul7cWreOFm307yVTgnfU2RUyTb3tmnHOZ
         ry7ws/wX60mNb8F2Qoy/E9Xydv9BVUeYnmtWe2Sxo9+PPAnZvTpGp8+Uz478AIrXLm3y
         hHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hRodVMKRPlEehBD+pKF9cYT1VEV2JM/RMXBv7TIb/2Y=;
        fh=5/3pYq1KAvHonxEvUpwdHvaCf4rwzSKbdhOfqjldFeE=;
        b=OMGR+EO0gSP1slxiDibbi4jiecK0I9rGKEKyZntZPbGFsENuSW7+OYTp2MC4v8AA2D
         pe76oPMhdHK1A4f+6WekrL3n4G9zi9n5lxTv2dg09jaiRoExZog9xoQ0P/wBwWC5NsDv
         wNnQCEJxvC6csUb8yhqL1YlRdLzzWqvg/6ZuSFaXeKzB+40ZKssWYAO14Wr0w43WwtlS
         JeXCcimJENeeBHBoQ2qnz2uJ3gbiTk82sQMAPa4CNeu7xCsmZkLnCQxj53d3I+0lLLUq
         3joE3RyHnbAM1HGXxK+JZN6UwgmIaZb0dhLO3icpebt+6irqXwifSni+wPEvlaKrHig5
         MDVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=azNxgAXh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10-20020ac87f8a000000b00439a382fd7bsi13731101qtj.462.2024.04.26.12.47.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:47:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=azNxgAXh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s0RUu-0006cL-4X; Fri, 26 Apr 2024 15:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RUk-0005Pv-U6
 for qemu-devel@nongnu.org; Fri, 26 Apr 2024 15:44:30 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RUf-0003if-Fy
 for qemu-devel@nongnu.org; Fri, 26 Apr 2024 15:44:30 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a524ecaf215so321902566b.2
 for <qemu-devel@nongnu.org>; Fri, 26 Apr 2024 12:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160663; x=1714765463; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hRodVMKRPlEehBD+pKF9cYT1VEV2JM/RMXBv7TIb/2Y=;
 b=azNxgAXhaZPJT/ppygXNuC6tLVzot9RcyF0tAE3XyXD6llgTeuCivvV3YHaJt6dW2I
 /wbYDUatX5q36Oav6PbY3hx1euH9POTiRufvAUf/edxF0YzCZQkp06mBtOm44FEo4Ag1
 9RwEZjlPXy3bDu3z1jVmx1jD+WiunbFgdg+PuYlRpU9LSK7r1C9YtfPKxMX9J3+Dhyj3
 JrheVzYLGB1wFeESFVyftXfhnxjsV7/nNH6uVrWJp+42KKfk3PnzgWcslrEDqVKtr4Cg
 peu1iFXovff9Pq28gXKlnNp4rH9zneaZLS+/P/3wktu79Q7jLb9Ay9HaXnPITL+ukjgU
 7eVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160663; x=1714765463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hRodVMKRPlEehBD+pKF9cYT1VEV2JM/RMXBv7TIb/2Y=;
 b=IXoFA4I2qnRgR7F4y5tqn5shccgz8qDljXAqf1VQPItv+rfYplSeqsD3IouWsvcqdj
 vr7b8r242jwFifqDfeuPs6Vu4XwyXhLMtJcYjRepjOSRaBcKGWNm6YedFF1OmRBby3+9
 HdSzIpjSLCcyXo3gqafs8RSYm38MFZ/Be9l3JnJxP3lk0nk0gSLSG6mbdysamSnnIIUH
 1WSr8yCu0gAWiFBhADMn/tpNtHjb1lDkWWG1QZpVPc4pWbE76LF85dXy8dwyn2EiRc3k
 0L30bgKNzcK+b1c5Pdy3Jlfo8XIEpq6RNF3DnyCV3DrNeB7hwDV52y1RRmkPzATBwfsz
 fWog==
X-Gm-Message-State: AOJu0Yy9e/LHRrGJ9pfnaMb6+UnjN75WifzVzpNIBRTVaJl7gzll3mqR
 H11LBOghD18HqU7aREsAHXFK/e44uUQ3ERxUDEkPXxo3nQ79dZDg0LNUVSr5ERhP4SsOETViLwr
 ENPU=
X-Received: by 2002:a17:906:e2c5:b0:a55:2e77:c718 with SMTP id
 gr5-20020a170906e2c500b00a552e77c718mr2464204ejb.54.1714160663366; 
 Fri, 26 Apr 2024 12:44:23 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 f20-20020a17090624d400b00a5575cde7cdsm10578996ejb.220.2024.04.26.12.44.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:44:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 24/38] exec/cpu-all: Remove unused 'qemu/thread.h' header
Date: Fri, 26 Apr 2024 21:41:44 +0200
Message-ID: <20240426194200.43723-25-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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
X-TUID: IhdWay80eOeH

Nothing is required from "qemu/thread.h" in "exec/cpu-all.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20231212123401.37493-13-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 586dc56d9e..4de0d5a0d7 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -22,7 +22,6 @@
 #include "exec/cpu-common.h"
 #include "exec/memory.h"
 #include "exec/tswap.h"
-#include "qemu/thread.h"
 #include "hw/core/cpu.h"
 
 /* some important defines:
-- 
2.41.0

