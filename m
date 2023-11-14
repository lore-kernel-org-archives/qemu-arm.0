Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2412832ejc;
        Tue, 14 Nov 2023 16:05:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQ1jq3iutF49bWsY3anrij65DfTlV/mdiejeY6uYFeEGB1lNUwBLPl6H4puV8sYxOjGYl7
X-Received: by 2002:a05:622a:58d:b0:418:1ae2:86e0 with SMTP id c13-20020a05622a058d00b004181ae286e0mr4025899qtb.54.1700006707044;
        Tue, 14 Nov 2023 16:05:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006707; cv=none;
        d=google.com; s=arc-20160816;
        b=ZBA2/eqkSSRI0tT0psRCzn447A4tdbYxY8Ks5J3jAnZf7iEOi2H/AnVkDN+/Vhdwy/
         xeC0WdyAM31ZuQ9pcNO1X7Mjhw8IL3dljr3phjFeeRLZGgErTN0QIWLBptcuJf1lzjy4
         PQAMmJyDEXbDKxCc++a/WqGqItFPkcbqv6Vr2QiHmsellMq1mXlr0Cpv5uCtpd0ftcZg
         WuoHC50eU5WNl4GS5D13z8kvfxROpgVVV5lUl+dZt7om+4Yej7IRfOyeM/PRu08Arfiv
         doYVwxqgwX9NzCOe5CqYT6rdv3qco7XWmmrZsEF3pd+J0kh1xuhQdFMIRZmSk9ezS2Hw
         AM0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=hWdc/RqFlRAYO6kCAV6W09p42TOtj3dRfTvncUijyRA=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=oeyHTRGlyy9otECwXsyBTpielL2j+yE/wEpjf6e7//ATcL4JwV1v1IZItbB4yT9QzB
         VfEb477TlVWwCIVp5AsRLXoTJDAHwGOdvdrl5rgCsOh+8rW1anyULM8ae3RyTrJm3Fil
         zh7SlB9Ko3Q5udY+vwVn45z85CVyumAwiIKyY7VPgKTzg38mvCfzIkphB3zBDRLDG217
         fTQDRdEXpKM/uhsJkYbh0X0rCn0A5dGnUVAsp5abD9pkirHm80PzQ4NB7WnVQdoS1EOC
         gecRVqGv8Q3EAMPRxH/Zgola3/9x4n0SAK+DTHzSKQmnDvxzjw/z/gIMwBKKYVn+bpA0
         MUkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dIJWAtKA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2-20020a05622a1a0200b004196b9a23absi8107328qtb.145.2023.11.14.16.05.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 16:05:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dIJWAtKA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r33MK-00084F-Pc; Tue, 14 Nov 2023 19:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33MI-0007xI-Sh
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:02:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33MH-0008J1-5n
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hWdc/RqFlRAYO6kCAV6W09p42TOtj3dRfTvncUijyRA=;
 b=dIJWAtKAyIjIWqL0ljN0qDPnYY+p6FBdz21JsxBK8zFy6mu/b3+z3TysBH1CC827UnNLoP
 umhU2p4j7+L+e4dzZ2+Lux9kAP51G/5aIOPQrh3DxvSZdMCG60lVRc/79k9KBw9SVVLEU6
 M3GEnBAYErVhgm1cURUcRh3U2/RCzaY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-8WftOYFvN7SWt-XfaYU_fg-1; Tue,
 14 Nov 2023 19:02:11 -0500
X-MC-Unique: 8WftOYFvN7SWt-XfaYU_fg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03D471C03141;
 Wed, 15 Nov 2023 00:02:10 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C969AC15885;
 Wed, 15 Nov 2023 00:01:56 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 philmd@linaro.org, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
Subject: [PATCH v5 23/31] machine: Constify MachineClass::valid_cpu_types[i]
Date: Wed, 15 Nov 2023 09:56:20 +1000
Message-ID: <20231114235628.534334-24-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: q36mpWgjYFG0

Constify MachineClass::valid_cpu_types[i], as suggested by Richard
Henderson.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/m68k/q800.c      | 2 +-
 include/hw/boards.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 1d7cd5ff1c..38d4bc2013 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -726,7 +726,7 @@ static GlobalProperty hw_compat_q800[] = {
 };
 static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
 
-static const char *q800_machine_valid_cpu_types[] = {
+static const char * const q800_machine_valid_cpu_types[] = {
     M68K_CPU_TYPE_NAME("m68040"),
     NULL
 };
diff --git a/include/hw/boards.h b/include/hw/boards.h
index a735999298..da85f86efb 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -273,7 +273,7 @@ struct MachineClass {
     bool has_hotpluggable_cpus;
     bool ignore_memory_transaction_failures;
     int numa_mem_align_shift;
-    const char **valid_cpu_types;
+    const char * const *valid_cpu_types;
     strList *allowed_dynamic_sysbus_devices;
     bool auto_enable_numa_with_memhp;
     bool auto_enable_numa_with_memdev;
-- 
2.41.0

