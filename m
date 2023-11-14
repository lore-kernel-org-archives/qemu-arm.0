Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2412456ejc;
        Tue, 14 Nov 2023 16:04:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+NCBZPwZrZeYrke3Zd5MiSledaR8VAWdyP9hnRmBvKVWPA94NkGBq/IJ2yrI6IJ4lDpcw
X-Received: by 2002:ad4:4e4f:0:b0:66d:5a3a:c5e6 with SMTP id eb15-20020ad44e4f000000b0066d5a3ac5e6mr5460294qvb.18.1700006671593;
        Tue, 14 Nov 2023 16:04:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006671; cv=none;
        d=google.com; s=arc-20160816;
        b=l3NoJPFOxPhUf6/FgPOE9ehNDv/QqF4jrIXnAeQVlgvdhkjCcqVKrj9fOVWldzFK6W
         m/8Rpq/Jb8nvLgnj1Vs2Yz7UkXekTUJwJVfqnKiN6t6AKOU/XR/o74E9JlFJfR05zOz3
         yIOck8cvS2U0whDH17cShIMyaDF8X4uloLH6p/4Xh/YVnxAp4dgPfyoXYnC4mmwZLWFf
         hpsoN3Drbhuvg2dI6eZaZ7ZMZ8kzm/TLr/cwvP+Bh5ZX35JGi5TtP2OBOkIdD/HuYyvB
         PYU6TvC2uNCvFo9Yd0+DKmHMukyhQIJf1BfzPZoC2XbKN6bCve8gMDrcVc0HfwusfBrn
         5N4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wkjJc9SmULphEh7KBEubO5fjf1sUZsLSsPFKusKCiHg=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=lh3jUxq2VM/Y7r4jwYt0Fcekq/xjtEQRRXNzDLhXCaj40NfyuN66iOsWFjAqjrzn4E
         fcSJ2BhgkedM2LfOfNYXqhcrYIlMuAtHRhT1nbxyO96gw8AwMDkbgaOIKM7bY1fz0wxK
         JShBEfZZFnTy9+ovNsfZD5xZO26v9USkTbMrZRY0oyg1Y9xFArTC0HITkNLoFo/HKH6L
         UGHW9RjG4MH6TeLwvpqukH1FXZ3cE29JXXyrVnuHejYKN36GKRSoDT6VM4N8fucc28/F
         zQaPbIE7cR3EMf4j3+j7dcnnqNvEBp67gD/UNoI+c+W8l3b3qR6iJWWLkp2EgOaYZr6w
         vWcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gaPsaa47;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6-20020a056214104600b00670f2a1a0a4si7490199qvr.310.2023.11.14.16.04.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 16:04:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gaPsaa47;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r33Kh-0005lp-AY; Tue, 14 Nov 2023 19:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Kg-0005gG-AT
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:00:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Kd-00083e-8w
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:00:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wkjJc9SmULphEh7KBEubO5fjf1sUZsLSsPFKusKCiHg=;
 b=gaPsaa47HAwTyi7itMPPNqdOQoZ3MWAliKA+MMlSKD7j92ZtudxHiz+ty+U0+hEtthn0lq
 QLDTB4UmktvpHRW0SeKTxu/fxhZqeRR9UBbrH7mYTYSQ3I339y0lA9c9Z6T/cSMzYacVIQ
 aRRAGFmY3kowV5c+8YaeE04Qj6MRJp4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-b8vccmANMAesCOE6EAogfw-1; Tue, 14 Nov 2023 19:00:23 -0500
X-MC-Unique: b8vccmANMAesCOE6EAogfw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDD7D101A597;
 Wed, 15 Nov 2023 00:00:21 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 663F1C15885;
 Wed, 15 Nov 2023 00:00:09 +0000 (UTC)
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
Subject: [PATCH v5 15/31] target/mips: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:12 +1000
Message-ID: <20231114235628.534334-16-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-TUID: eqkzUOBWM5Tr

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-mips64 -cpu ?
MIPS '4Kc'
MIPS '4Km'
MIPS '4KEcR1'
MIPS 'XBurstR1'
MIPS '4KEmR1'
MIPS '4KEc'
MIPS '4KEm'
MIPS '24Kc'
MIPS '24KEc'
MIPS '24Kf'
MIPS '34Kf'
MIPS '74Kf'
MIPS 'XBurstR2'
MIPS 'M14K'
MIPS 'M14Kc'
MIPS 'P5600'
MIPS 'mips32r6-generic'
MIPS 'I7200'
MIPS 'R4000'
MIPS 'VR5432'
MIPS '5Kc'
MIPS '5Kf'
MIPS '20Kc'
MIPS 'MIPS64R2-generic'
MIPS '5KEc'
MIPS '5KEf'
MIPS 'I6400'
MIPS 'I6500'
MIPS 'Loongson-2E'
MIPS 'Loongson-2F'
MIPS 'Loongson-3A1000'
MIPS 'Loongson-3A4000'
MIPS 'mips64dspr2'
MIPS 'Octeon68XX'

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-mips64 -cpu ?
Available CPUs:
  20Kc
  24Kc
  24KEc
  24Kf
  34Kf
  4Kc
  4KEc
  4KEcR1
  4KEm
  4KEmR1
  4Km
  5Kc
  5KEc
  5KEf
  5Kf
  74Kf
  I6400
  I6500
  I7200
  Loongson-2E
  Loongson-2F
  Loongson-3A1000
  Loongson-3A4000
  M14K
  M14Kc
  mips32r6-generic
  mips64dspr2
  MIPS64R2-generic
  Octeon68XX
  P5600
  R4000
  VR5432
  XBurstR1
  XBurstR2

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/mips/cpu-defs.c.inc | 9 ---------
 target/mips/cpu.h          | 4 ----
 2 files changed, 13 deletions(-)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index c0c389c59a..fbf787d8ce 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -1018,15 +1018,6 @@ const mips_def_t mips_defs[] =
 };
 const int mips_defs_number = ARRAY_SIZE(mips_defs);
 
-void mips_cpu_list(void)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(mips_defs); i++) {
-        qemu_printf("MIPS '%s'\n", mips_defs[i].name);
-    }
-}
-
 static void fpu_init (CPUMIPSState *env, const mips_def_t *def)
 {
     int i;
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 52f13f0363..1163a71f3c 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1235,10 +1235,6 @@ struct MIPSCPUClass {
     bool no_data_aborts;
 };
 
-void mips_cpu_list(void);
-
-#define cpu_list mips_cpu_list
-
 void cpu_wrdsp(uint32_t rs, uint32_t mask_num, CPUMIPSState *env);
 uint32_t cpu_rddsp(uint32_t mask_num, CPUMIPSState *env);
 
-- 
2.41.0

