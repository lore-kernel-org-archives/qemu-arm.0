Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp669845lfb;
        Thu, 22 Apr 2021 12:42:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaMgvxEMX7YqIJUHKgpMM0ifdjyGP3zVd2Ow1yx5NBd8Fac8X3Db7B4RQZpMyFBfRIpl3n
X-Received: by 2002:a05:6e02:1c49:: with SMTP id d9mr65524ilg.95.1619120548017;
        Thu, 22 Apr 2021 12:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619120548; cv=none;
        d=google.com; s=arc-20160816;
        b=JivZCP6sZlWqysezxw61xRgECBezihKErlcnxDWdlI4YNtf3nRwd1VIxUJot6B5cE8
         V/dqMd/MYbztTyImx9jInPyaWkIx/JJ0dpeiHn0+dT4t4Dw/d5Nv3Z02V36tTl0H6jsC
         Q/abKw7/QUT0XUGIeaf/aj9Xwhcovi184R4TuL6mC7Mv4VmiCa3oWfQATVYWiCGNL3aw
         Jqn82ao02WsVPHduKD4VQwwAaG2MBBrb9jasdyjw/iD7JTP89loUxeb5cUKQHbtQtVe6
         8BZYzBxAhzYajz9bU0/bM9NM5JW71oFI7QRAQiNU3xHip+yFGWDrkMLpg8nq1b+Cqxc3
         Hz+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AsKH3RYUFA9evmZE7qWhREuizy9iouUOsbLguH/0Dwo=;
        b=0uvs+JBJAspIFzCsZbvMgf9OR4cQHyWEVsyb7YRtuWzBPZc5qNsdHxw4JPNuqGvuO9
         oGic16IsEoaHCdUc17tWeDO+ZvL2sHs4Os5UUkXawkKmfYigMuVHtF6mwvHmKDciAP14
         lricvc4Vl4gcTVhC0SFuEhNKZ0/YPOAnHdkaUnHGyvDt8HpNBhO6f5SROQdkRJ454Jen
         hf5SGn4W8+tN8GvwBl6ZUNZ9oFd/G87+aKuNvk2cTU02XxtMNCbEquk5pz3x53/DagRI
         Q+LaH9wW89krfY18korRoqCoKpB3GVcDG1Qj7r0BdtBCdChHAgeFr+d2gAI9N0etrYMf
         6umQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c1otoi1W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si2176224iow.82.2021.04.22.12.42.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Apr 2021 12:42:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c1otoi1W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZfDX-0005Cb-A9
	for alex.bennee@linaro.org; Thu, 22 Apr 2021 15:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAl-0002Hw-9a; Thu, 22 Apr 2021 15:39:35 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAj-0005Is-Sm; Thu, 22 Apr 2021 15:39:35 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so3878276wmy.5; 
 Thu, 22 Apr 2021 12:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AsKH3RYUFA9evmZE7qWhREuizy9iouUOsbLguH/0Dwo=;
 b=c1otoi1WCXL6aNmuI6x5KXVJZOrEybgYc1TzaE25gCbJQKRm27GMyzgzjb2AYFrGFb
 mxZVVQiyEgzyrPF9vZ1wBXH1NlNBIy3uRymvro3LAaG1HTt36brCmIiE1ec+9GIUZgHV
 C2rt50wrYHSuh3C7TorkXFRyG+oi6ma1IOhpDmm755w1wK6Y5qvw33uDanUAOuC9fZvg
 y7JPK4w8uPq9yVn7TOu36zfhcwgE3sACA8NzCc2larv0WAjmPcma9BqJrDEgV5hi+9/D
 6zvE/mt+6HGwz/Rg/z8IqZ5175pINYMvNNIpwlv2ToUesEfy9PyWwAZyYZVvKS26v60t
 VNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AsKH3RYUFA9evmZE7qWhREuizy9iouUOsbLguH/0Dwo=;
 b=r0LO2wrgHVxS8l0svDQ0xYZA/tBu94aQ2+FrhgdaHqXaROez76xZPg+r4m/+ZXH4wD
 PMpoLEsotEhhRAz7l+VivrVDpkvydNa7zYDDTzImEXvanuHHpprvrHR3ipot/wlTv9Ly
 g7Fq11YDCClCTucH9B7jBCHlAOmU2/Cfp9D456+hCTRiTnUIw+V/K5Nri06ItqXf3R1Z
 CWosA92f9RBnSHWH6vG0f8u7MD6L3O2wG+olN0K19HzdkC98AzaycUJ8JydiWpyHUpUd
 KHcuQfkOnptbQ6sDUKy7kEoQkarDbV01S4lRvzB2H0gex+8JEgiwaHXnsRBn0UO8x+pb
 HINw==
X-Gm-Message-State: AOAM532nv3j5hB80j1CPOqMoD764ORzFwF2Ag6ekJPqVlAzTVRC44Jyg
 deBTagrEmOIxNQdfFwFpf4IWsw8vdVirNg==
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr382732wmc.150.1619120370730;
 Thu, 22 Apr 2021 12:39:30 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d10sm5168077wri.41.2021.04.22.12.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 12:39:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/18] cpu: Directly use get_memory_mapping() fallback
 handlers in place
Date: Thu, 22 Apr 2021 21:38:49 +0200
Message-Id: <20210422193902.2644064-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422193902.2644064-1-f4bug@amsat.org>
References: <20210422193902.2644064-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Anjrqajy+Eg

No code uses CPUClass::get_memory_mapping() outside of hw/core/cpu.c:

  $ git grep -F -- '->get_memory_mapping'
  hw/core/cpu.c:87:    cc->get_memory_mapping(cpu, list, errp);
  hw/core/cpu.c:439:    k->get_memory_mapping = cpu_common_get_memory_mapping;
  target/i386/cpu.c:7422:    cc->get_memory_mapping = x86_cpu_get_memory_mapping;

Check the handler presence in place and remove the common fallback code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 1de00bbb474..5abf8bed2e4 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -83,13 +83,11 @@ void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    cc->get_memory_mapping(cpu, list, errp);
-}
+    if (cc->get_memory_mapping) {
+        cc->get_memory_mapping(cpu, list, errp);
+        return;
+    }
 
-static void cpu_common_get_memory_mapping(CPUState *cpu,
-                                          MemoryMappingList *list,
-                                          Error **errp)
-{
     error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
 }
 
@@ -419,7 +417,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
     k->has_work = cpu_common_has_work;
-    k->get_memory_mapping = cpu_common_get_memory_mapping;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
-- 
2.26.3

