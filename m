Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2677607eja;
        Mon, 6 Nov 2023 03:06:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVhqiF4v135vVysrozttVilIYXg3rRMewCHB2h3nu0/c5sWUhbUh/cEbWvQPy8rdCj5kCQ
X-Received: by 2002:a05:6870:aa07:b0:1ef:b809:3f26 with SMTP id gv7-20020a056870aa0700b001efb8093f26mr32366311oab.17.1699268799580;
        Mon, 06 Nov 2023 03:06:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268799; cv=none;
        d=google.com; s=arc-20160816;
        b=Pqn/DcMnxqCg3dZKV6+yd7JV4bxnYMOnBvQ7D0QUrQ65aa+j2ysYKvdHhhvwRE08g7
         wZjHKsBIKvQ3FyESNG3w+7j0/jfU5Tpye470GW7l7EPd4nqmpPiF/55CHggB98CjyGcc
         kxecLQPvYRm2ryJ0v7D26fVVvvM1HgikOLZZrKzIKWe1sDcDUBU0kLENUa8U5vio8sLb
         9VwmnTAUI0DHD3LoP/j4MkIY5/Jqjkbn/fsU5CCr6e7qkJfAXesQJakLJoBbSkqTSfY8
         PZSlXCsF/LKQb21hX5Oq5yaG3eqoV57Rjh60Vuw7jh5kyPsj8whBwt+bbM7JQV+kTiAb
         87LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=QkEvU4QtX35g0CiL+rllnKg5EMCBRsMDB6Gavwvy6mM=;
        fh=M7LpSu7Ta78I+2rWAN95QEp5TLITKFQ2uBdD4PuAGlE=;
        b=BXQjAlPCNkfnyEQJUMFpJXS13XhQvGrl3IHoUWj/ujQ9rgr5MeUw+p8ecZki2JTkjt
         B4E32fHcrjo+Y/012FOwE0CpqlDDWDdayZu3UQw5mubGmAB392QxLUiGDolltVLjH3rd
         pD7YTLIxHIQ2cYdvLDQZoCLRZYc3X4aD+XdRkrESlxYPbmpmvWjXF/oT6cz1hS66rJWF
         d5yyGzVAmWFT211g1GXRDMEi867XdogteqmQs0+iUkfUfGrrREG+JTPsv0ePF+giIZXL
         0WE3xEowd33NM0XmWSW5RUAXVv90znin3vBEnz9JdlE3+XwbUIKzcNzhw3Ev13jzd+Mq
         DpLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LYqeAQJm;
       spf=pass (google.com: domain of kvm+bounces-694-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-694-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-694-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id l71-20020a63914a000000b005b982b93780si7750357pge.251.2023.11.06.03.06.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:06:39 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-694-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LYqeAQJm;
       spf=pass (google.com: domain of kvm+bounces-694-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-694-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 039F0280EB6
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F221EB30;
	Mon,  6 Nov 2023 11:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LYqeAQJm"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC591EB29
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:06:36 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF2E134
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:06:34 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9d242846194so625427766b.1
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268793; x=1699873593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkEvU4QtX35g0CiL+rllnKg5EMCBRsMDB6Gavwvy6mM=;
        b=LYqeAQJm1XfhxGwOB9+/SQQ+km8H2IRwZ+n0Ff2kNDpGGoRvc4+tfxFcKe4PEnJSpZ
         L7/YsRNLF3z6uaVHzeOC0GslLuWrVc28RE5P9vMGaJraDcZXxaNgAEB8DzgRRvwudX3d
         uDgLiWEOa9IE8oqS3dvs7AlmH3tXcQGLpliIcIHvBcGv9QyX0bsiuDvZgmzdO5NBoucz
         imG++sABAhRuFM3AErjcOykMWGeI+akYtlKVYd+BGQu0w4ItJLerIbIAFkLsfFzbgYyr
         P9QziHkDLgJFMyZxbhwCKyjasn7QXD7SLrZAyQy/FUv+zFGscB0wA6IvqBnBEA1AHFha
         wqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268793; x=1699873593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkEvU4QtX35g0CiL+rllnKg5EMCBRsMDB6Gavwvy6mM=;
        b=EsBOcngBlHd9CycL15oFem+7Tk6GQeZVz8aZ+gKyqYSsvcBifRYKz2QFXOdAq1fAlN
         celE4PGKUWFp2qI9OD9koyD08up76VzK/ruDCyjlQa5sMtOFzzjMKxvbrfeoQDXeXrSC
         +KItpgFII3i6HtYrxgwxGoMZRY3jQrxhFj000cUv+iC4Vk6ahD0HGexoMyVA4CnplbVF
         Fdi0ke35S9RYjc5psZwcGl63Yf6hBu/V2eQ5hxW0Fl074HasusOuQpVh2CsAxH0BQ7+M
         ApbPb3WFOvwwvrITPFbwV3ihwXMo4K1j7VCR5OO0tu4BZV7NXrqsjOBLJTTTUchSE9ko
         +qEw==
X-Gm-Message-State: AOJu0YyK0IYE7fpc+Xhv//IEBpT7ZNEaHc+K7k+iQFNFZSqgGpKXNnYe
	OxV1jEH2ohb2JZLnpyv0Nlpnfrt8pkFNUNvY4qE=
X-Received: by 2002:a17:907:2ce2:b0:9be:36c2:162 with SMTP id hz2-20020a1709072ce200b009be36c20162mr13367612ejc.31.1699268793032;
        Mon, 06 Nov 2023 03:06:33 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id iv12-20020a05600c548c00b0040641a9d49bsm11948176wmb.17.2023.11.06.03.06.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:06:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PULL 25/60] target/i386/hvf: Use CPUState typedef
Date: Mon,  6 Nov 2023 12:02:57 +0100
Message-ID: <20231106110336.358-26-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EDe16/Oetbe0

Follow C style guidelines and use CPUState forward
declaration from "qemu/typedefs.h".

No functional changes.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-Id: <20231020111136.44401-2-philmd@linaro.org>
---
 target/i386/hvf/x86_emu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index b1f8a685d1..cd7ef30126 100644
--- a/target/i386/hvf/x86_emu.c
+++ b/target/i386/hvf/x86_emu.c
@@ -45,7 +45,7 @@
 #include "vmcs.h"
 #include "vmx.h"
 
-void hvf_handle_io(struct CPUState *cpu, uint16_t port, void *data,
+void hvf_handle_io(CPUState *cpu, uint16_t port, void *data,
                    int direction, int size, uint32_t count);
 
 #define EXEC_2OP_FLAGS_CMD(env, decode, cmd, FLAGS_FUNC, save_res) \
@@ -1417,7 +1417,7 @@ static void init_cmd_handler()
     }
 }
 
-void load_regs(struct CPUState *cpu)
+void load_regs(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
     CPUX86State *env = &x86_cpu->env;
@@ -1440,7 +1440,7 @@ void load_regs(struct CPUState *cpu)
     env->eip = rreg(cpu->accel->fd, HV_X86_RIP);
 }
 
-void store_regs(struct CPUState *cpu)
+void store_regs(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
     CPUX86State *env = &x86_cpu->env;
-- 
2.41.0

