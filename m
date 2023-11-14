Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2410596ejc;
        Tue, 14 Nov 2023 16:01:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFm9ozhtleJYyFVDV5p/mit7QFTDIO9+uFTBDfya+NOiYbIGu7GosLTYDPoiOamW2a6b8w4
X-Received: by 2002:a05:6358:99a8:b0:168:e3e1:11d5 with SMTP id j40-20020a05635899a800b00168e3e111d5mr4266681rwb.28.1700006513074;
        Tue, 14 Nov 2023 16:01:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006513; cv=none;
        d=google.com; s=arc-20160816;
        b=SpeTaKvYlCqxpYrwyLAR8GgZDCuMFyYlXc595zS19AIilSix/PG2fu9uz7mRU8I8BN
         bDa6P3k5cfZ/cCHUeq93FrUV7Lr0wPQArwfaxX4O0BUYbYMYOuPQx4wKck2wCsvMWBHf
         XCIqGxD5FLrOwo/A0xKV0z7NXNTYRKgHt8HZRTSZ+G+M1jaNwXI+P6HypHE160IFqafX
         NTbDQb9LrUK/eRPAT2L20I4v++zWdTTMsj7nmJOQH0GkZkJg3bg0Z+1E51Q7lGv0wftB
         WjJ44E5RSIvbqDD9kDSZd7Qlx/2Jvj3kapipIc+0IdpUk4u6Dkd1BMktRs+SteUPejg2
         ZIkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DHJG04+lgyfqTN74zgkyn2sc/y+9a361YMftbYRBCT4=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=sHsdkHNVwwP5UJJ5fhHo0KibqK2e6OOM8VbmwtMHDr7evwoin6PvHT+z+Mq53x1aTs
         S++IHYzS2hrgoJQloF0/neVQFB4cQ227muE35peMLFg8AUp7ip+LTxtErp8GQNaQxrIU
         DlRG9nTXkpiDH4eP7d99z/u/koVIb/mVyf+WZHyZYLle7jtuBhFpYeVpxRetWnViHT5c
         dIMwC2ie83Z4cWUkdoJB56bbbzB+UOXEfzr9tyEFgiBda7aodTbxEgniOHu6hYp6wUxC
         aPIdoNtSJBQJ7VJ+wKGwM0YLhKDe5DIbEAqtaZxSRKw0DP9xXxT1SaoLC9wjimRdnvRQ
         PaTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Vm/QkDQ2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5-20020a05610223c500b0045da3267293si1211166vsr.610.2023.11.14.16.01.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 16:01:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Vm/QkDQ2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r33JP-0002Gp-8F; Tue, 14 Nov 2023 18:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33JJ-0001um-JL
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 18:59:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33JI-0007E1-4a
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 18:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHJG04+lgyfqTN74zgkyn2sc/y+9a361YMftbYRBCT4=;
 b=Vm/QkDQ2C3P1us6E/3OpQ9VncNAc+nlH6xAwBR1MMpRviUn8+1Urwf/VmOZtTEPBjq0cf2
 4+ZhpFUjQxIar57dMimm8NG/jq3lbYYAhHWCsMKuxSg1rJ2Re9mXVOYQO6boFnR/XlCq/h
 WLhKWKm2XXWKq1aYIGMHhTM+/nZwvbg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-688-30zIy3b1OdyUs-lUcbxZPQ-1; Tue,
 14 Nov 2023 18:59:04 -0500
X-MC-Unique: 30zIy3b1OdyUs-lUcbxZPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDFA63C000A8;
 Tue, 14 Nov 2023 23:59:02 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58C0BC15885;
 Tue, 14 Nov 2023 23:58:50 +0000 (UTC)
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
Subject: [PATCH v5 09/31] target/avr: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:06 +1000
Message-ID: <20231114235628.534334-10-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: h7Caw8m929DV

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-avr -cpu ?
avr5-avr-cpu
avr51-avr-cpu
avr6-avr-cpu

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-avr -cpu ?
Available CPUs:
  avr5
  avr51
  avr6

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/avr/cpu.c | 15 ---------------
 target/avr/cpu.h |  2 --
 2 files changed, 17 deletions(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index a36cc48aae..76fc4cdaf2 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -354,21 +354,6 @@ typedef struct AVRCPUInfo {
 } AVRCPUInfo;
 
 
-static void avr_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    const char *typename = object_class_get_name(OBJECT_CLASS(data));
-
-    qemu_printf("%s\n", typename);
-}
-
-void avr_cpu_list(void)
-{
-    GSList *list;
-    list = object_class_get_list_sorted(TYPE_AVR_CPU, false);
-    g_slist_foreach(list, avr_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 #define DEFINE_AVR_CPU_TYPE(model, initfn) \
     { \
         .parent = TYPE_AVR_CPU, \
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 8a17862737..02750a7ccd 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -181,7 +181,6 @@ static inline void set_avr_feature(CPUAVRState *env, int feature)
     env->features |= (1U << feature);
 }
 
-#define cpu_list avr_cpu_list
 #define cpu_mmu_index avr_cpu_mmu_index
 
 static inline int avr_cpu_mmu_index(CPUAVRState *env, bool ifetch)
@@ -191,7 +190,6 @@ static inline int avr_cpu_mmu_index(CPUAVRState *env, bool ifetch)
 
 void avr_cpu_tcg_init(void);
 
-void avr_cpu_list(void);
 int cpu_avr_exec(CPUState *cpu);
 
 enum {
-- 
2.41.0

