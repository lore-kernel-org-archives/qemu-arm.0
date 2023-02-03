Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1297811ejb;
        Fri, 3 Feb 2023 03:37:43 -0800 (PST)
X-Google-Smtp-Source: AK7set8UczQo3CEOKbfejCtEsOdUgkv80nn7nCl9rG88hGDJCfnkXLP1YOZt5DT8CSFYHLTofE0R
X-Received: by 2002:ac8:7f03:0:b0:3ab:a047:58ee with SMTP id f3-20020ac87f03000000b003aba04758eemr16793733qtk.25.1675424263512;
        Fri, 03 Feb 2023 03:37:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675424263; cv=none;
        d=google.com; s=arc-20160816;
        b=jzU7CgJgcPNU1opdk0Jb/QG8nk9hAEBTirQRIFLZVv5tFT32/eczlnsWYdbfll2QUU
         kNIQNMAJvAGwImbc0xcH99lC3Q7oO3+K72PeOWoy/MX7pEB/jR8qT6dMlwU/xk4xQ9Ww
         +ZLrEF2VO19HBXIHNprznQkkKP/kayG262FNGKXw8y70a3LSc2LrPxfEOaaURVcSWDLS
         Rw4JlxKLKA8WkaNA3zHMraw2R9IkRraUNPaJ0XGbR6XlXq8TjCU3doYBABanafCbGihm
         eyoUO8BcQNlH+JcdFHYgLdBebOFtTTPSl3UqFB/1cR8nBw+eBimwv02nHAtLRXEleQc5
         g1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LPgOBQNVShoBt1EXepGeYQrXhiL1fUSuZyDvfJk1E40=;
        b=dozWq07fbA5xDKJiDr64iA/A0xtGMMf7K4PKnoF4Eh3L+UxoUJqPwwNy266FRBbFHU
         AXyJaoPe9l9nAkyFePPzB6Q/5c65bRyw9ZrSgiGivxRlEfV8ARTWiA8S53kGu4hkbDXo
         jCd0kG1w1Rs39BuHe8JR7fHe/Do1yt+hjjdJH6IyuCF9G2FiqFPeyf7nmgnP2EgIATCX
         wlpibqDXuCijLdVPHd9ltTISMZ3B8jWOSjoiUZDS3nYRiRPcd6cQrIQfOOlswiCZFlWL
         YXV17dZXxgvkGiJCADWELxZZvr/sISHI4WiXO6JaeaYeC8FA0xHvS3R6loGvYq4fZ+B1
         AwhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VmDCIyNw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az13-20020a05620a170d00b0072c439b204esi2034094qkb.635.2023.02.03.03.37.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 03:37:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VmDCIyNw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNuNK-0007wN-8I; Fri, 03 Feb 2023 06:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNI-0007vT-BE
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 06:37:00 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNG-0001BS-TJ
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 06:37:00 -0500
Received: by mail-wr1-x430.google.com with SMTP id r27so562863wrr.1
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 03:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LPgOBQNVShoBt1EXepGeYQrXhiL1fUSuZyDvfJk1E40=;
 b=VmDCIyNwV7GEJxSl0nfE7kn8ujAuESRt4FNhb33yC/ytBz0sQ853H4qmkB32E31akS
 a9Iuum1DyG2LCwVRyRSazsAlCmMVzpQtxLAoA8qI6j+z7try0S7JNVw2pE+NzgzirKNx
 k29KWNYM3zLwCnrUXhGGXSsVzj73GE9WrJq+/kFf/gr4/yFnOSC6g5NGwpfEpxx547b0
 A4y4TwtDp2eHluTTiaHlQ2gn7r9ZDX6WwwWL30EGVdrsJ1GXcfGwiDwj1sfcttcq9BMp
 jzaWbAr4uWF57tb3kfB+LjiX9akW2EKRWfLmp2ZVMtq2UkLrM8XGVxcb4UHT+yZUPlCZ
 Z4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LPgOBQNVShoBt1EXepGeYQrXhiL1fUSuZyDvfJk1E40=;
 b=YnA7OsgCW07MTem7YsLaNWHVYh1+Mna8x6rlrb6wGFd9wJTOvdHdeMHWhz3P3vSRs9
 d0dDBPyeAVxQVKmZCzQVLp30BU7yzUeTzCAxgvGTivkDvB/DMDW6KTmlGrN8oSeqa/Qg
 SNoTQ/bnM2xb/OsI9Z1as6znI6Q/A+zFN9kudUCxyyIWSmplAt4HQIsCb7gWCH1Q9Rnu
 B4fAFtL/p02C/vwTYbTvrAvbhimuHK8/ehctsL+/tHkiX2YRJnLxwsACUI0SCXACly2H
 PdqzdQ5/8rdWrrOOg5oGltzgckOuzuZY30IGmFPny6sStRpJJtBbK2OSZWBaRiSahgSJ
 VEKg==
X-Gm-Message-State: AO0yUKUvc0zfoEM/96oN0L3OOoveX/syviwNo1ObuY8yXVFPSGjcwHEx
 Xhk9Lfi32s7Tm37B6Wu1S8dsiA==
X-Received: by 2002:adf:e192:0:b0:2b2:1db6:a6bb with SMTP id
 az18-20020adfe192000000b002b21db6a6bbmr9046597wrb.20.1675424217510; 
 Fri, 03 Feb 2023 03:36:57 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a5d6a87000000b00287da7ee033sm1763541wru.46.2023.02.03.03.36.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 03:36:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 1/9] hw/i386/sgx: Do not open-code qdev_realize_and_unref()
Date: Fri,  3 Feb 2023 12:36:42 +0100
Message-Id: <20230203113650.78146-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203113650.78146-1-philmd@linaro.org>
References: <20230203113650.78146-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: td2yi0MHu6gE

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/sgx.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index db004d17a6..5ddc5d7ea2 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -299,7 +299,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
                                 &sgx_epc->mr);
 
     for (list = x86ms->sgx_epc_list; list; list = list->next) {
-        obj = object_new("sgx-epc");
+        obj = object_new(TYPE_SGX_EPC);
 
         /* set the memdev link with memory backend */
         object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
@@ -307,8 +307,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
         /* set the numa node property for sgx epc object */
         object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->value->node,
                              &error_fatal);
-        object_property_set_bool(obj, "realized", true, &error_fatal);
-        object_unref(obj);
+        qdev_realize_and_unref(DEVICE(obj), NULL, &error_fatal);
     }
 
     if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
-- 
2.38.1

