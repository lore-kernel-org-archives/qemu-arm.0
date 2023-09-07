Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3154229ejb;
        Wed, 6 Sep 2023 17:42:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqMgO8eKRGM4prPa/CcFRTIkCll2XVoyxT6uY4qqv7CjG/yLafoqqkJlfLVBbFEEbcoYyM
X-Received: by 2002:a05:6358:339c:b0:13c:efca:ba98 with SMTP id i28-20020a056358339c00b0013cefcaba98mr3244962rwd.29.1694047340741;
        Wed, 06 Sep 2023 17:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047340; cv=none;
        d=google.com; s=arc-20160816;
        b=l0LbPEn3tQMLqhZxwOEEmXSt7rZuwGHQeM5spxgle+7EtXArIB0hHNXuBBbSH7/l0B
         shT3kTF9Ci6D7I8rR84rgtkreWEdKn4H2fFQqe6H+BpsNlV3mMdzXENCrTAgcpoj0dvK
         c6fjmCPEuQtdASVG23AzuPQUW2bXx/+Mtw6SFJytEHGQrPyO3FjgABRAQabMvFZBMz0m
         3BhU51MBYZVXAya3dgx6KPfOL3/irSctfvsFspIPq0oxXIH9+Jy9Li2N34hgHcfe71/T
         cUjznJUYQtIXNWqMbxa1SJPY/0cEm6HDBoST8ik9ZOu88WyCNByIJM9rxHKJjOMXu/Uy
         cw0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ob7BNmTrNjZIXBVdDPkalGLAk9nNqap53NQ4s6bDNoI=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=mJXdevKcT/lQrw3gQrGeJD0vkrSiBv9Q+xHtoLqxuOreqq1WNcScAAGEkTXPGiNPVu
         2oCgk0VwVUNCdiSvkVPpnx/jJ03yNcNRUotIQ6jCgj9t43ecAwqe2z8e+wGe1Tj++6nM
         ortyWWXu8a+cinq4LIb4J7ue07pwu8Wn2DW+ei66W0TLzDBlqdsDUfrPlKXL/AoBh70v
         eVin6XKdlzwSoSp6hyo9u0IkZKPoFMOSChsUXa1PU5+qCklbeigONfWTp75mgxtOL5RM
         ATrZ1oRT281fVEBDIdTLT1MwuOShLflnhRCDwx80KETpsep8I5fRcKicGvMaEHmUvh9b
         Uqfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hPODrFfh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13-20020a0cdc8d000000b0064739f8702dsi10539542qvk.443.2023.09.06.17.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:42:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hPODrFfh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qe362-0001rl-Il; Wed, 06 Sep 2023 20:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe360-0001Yn-JP
 for qemu-devel@nongnu.org; Wed, 06 Sep 2023 20:42:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe35y-0002N4-0S
 for qemu-devel@nongnu.org; Wed, 06 Sep 2023 20:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ob7BNmTrNjZIXBVdDPkalGLAk9nNqap53NQ4s6bDNoI=;
 b=hPODrFfhyVxA4Owctb0mn5ztkrIJJl1hREVRFDxNhgAFA9O2SXZ107DXdaDMBLwahow6Y8
 Zr44nUyrfLyvkKtG5o/CWa6oa1slLqMQ8/uqWGEqqR2t0zL8XJRTwZLwWzo1bzi/3Rkg0Y
 XySUnapst14d8B8Kw8yAJ2oW+56iuaE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-HE0fHX6jM4um5lPJK3i6vQ-1; Wed, 06 Sep 2023 20:41:58 -0400
X-MC-Unique: HE0fHX6jM4um5lPJK3i6vQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28AB88001EA;
 Thu,  7 Sep 2023 00:41:56 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62622C03295;
 Thu,  7 Sep 2023 00:41:41 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, chenhuacai@kernel.org, crwulff@gmail.com,
 marex@denx.de, shorne@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org, npiggin@gmail.com, ysato@users.sourceforge.jp,
 david@redhat.com, thuth@redhat.com, iii@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v3 20/32] target/hppa: Implement hppa_cpu_list()
Date: Thu,  7 Sep 2023 10:35:41 +1000
Message-ID: <20230907003553.1636896-21-gshan@redhat.com>
In-Reply-To: <20230907003553.1636896-1-gshan@redhat.com>
References: <20230907003553.1636896-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Yo/yWUanjzlw

Implement hppa_cpu_list() to support cpu_list(). With this applied,
the available CPU model names, same to the CPU type names, are shown
as below.

  $ ./build/qemu-system-hppa -cpu ?
  Available CPUs:
    hppa-cpu

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/hppa/cpu.c | 19 +++++++++++++++++++
 target/hppa/cpu.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 11022f9c99..873402bf9c 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -143,6 +143,25 @@ static void hppa_cpu_realizefn(DeviceState *dev, Error **errp)
 #endif
 }
 
+static void hppa_cpu_list_entry(gpointer data, gpointer user_data)
+{
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
+
+    qemu_printf("  %s\n", model);
+    g_free(model);
+}
+
+void hppa_cpu_list(void)
+{
+    GSList *list;
+
+    list = object_class_get_list_sorted(TYPE_HPPA_CPU, false);
+    qemu_printf("Available CPUs:\n");
+    g_slist_foreach(list, hppa_cpu_list_entry, NULL);
+    g_slist_free(list);
+}
+
 static void hppa_cpu_initfn(Object *obj)
 {
     CPUState *cs = CPU(obj);
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index fa13694dab..19759f5f62 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -351,5 +351,8 @@ void hppa_cpu_alarm_timer(void *);
 int hppa_artype_for_page(CPUHPPAState *env, target_ulong vaddr);
 #endif
 G_NORETURN void hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t ra);
+void hppa_cpu_list(void);
+
+#define cpu_list hppa_cpu_list
 
 #endif /* HPPA_CPU_H */
-- 
2.41.0

