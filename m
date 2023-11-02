Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp62901eja;
        Wed, 1 Nov 2023 17:34:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkTwvJZLnjNB6lTEwOb+MBnBTwKEhG3VXNKhBVPEAvUj8WoY4JZyLU9Rcts24FUK5Rlrod
X-Received: by 2002:a05:6214:5085:b0:671:d72e:e158 with SMTP id kk5-20020a056214508500b00671d72ee158mr12482874qvb.37.1698885258358;
        Wed, 01 Nov 2023 17:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698885258; cv=none;
        d=google.com; s=arc-20160816;
        b=L0XUcE7z1MHQhZ/bD6Hs3RpvR9XfLd0t34PbBOmToZz5X+SXQErQp/BtFS1FBadZVI
         HBX8p9mXoSr5q8bA3rDpfHQolfxj66Vbp3xl27Snnx/cXs9XqSmtaUe05+zlO7HHozdy
         iayPrS44NMJvuJZNLv+/+P/fejEY4d8armRtg+0IRp5F9MS7y3btHe6faH3sx41m1LKQ
         lKKrhGoEBQ3h/GiwVIs17fzudPUpXce12a1aI4NEb9UTd1ik7AuKhVGOhYkb7Hxuy4OV
         2FNjrH2Xmnb9JPvYq4UVbh+VpJ7ijGZBtRkk9P6Bocox0yCT7ZDKyBpB/OlKOBlngbBO
         Qk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=hWdc/RqFlRAYO6kCAV6W09p42TOtj3dRfTvncUijyRA=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=dgQiMpkL4hFXzipezDjQJLJonWfL3ghd15GHifQ7zbz+oXrb4EV9ZVEmxP9uC90QGK
         vdzZCjRtV+LZc1/uUj9FG8GYL9b5nAgfmQz9FueOes5ebMiKPGbQRKW284pGgS/o0hYi
         jUN14iBJdLK3R+TyQ8hl7zW+qoygl8keg4/r2yMrQPiAm97INzhyrKGAgs7gBk/JeMa5
         DpeG6Hy7YV7E91fc2VEU8ilI/Hx+obBNa1bYCFGjLyx4VY4tOFeIiuyaBOwQy/zjLE35
         lWhgP2ubSsZ5Z8K8h4I18IG+gC6pOZ87kSvz5X1EWl8+TFyfZU5yuD7GkVcfGWMKCrJg
         qfbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=edITEiOO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id px3-20020a056214050300b006558891f406si3515297qvb.559.2023.11.01.17.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:34:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=edITEiOO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qyLdc-0003J3-Ip; Wed, 01 Nov 2023 20:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLdL-0002qq-Aw
 for qemu-devel@nongnu.org; Wed, 01 Nov 2023 20:32:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLdI-0002kM-Md
 for qemu-devel@nongnu.org; Wed, 01 Nov 2023 20:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698885143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hWdc/RqFlRAYO6kCAV6W09p42TOtj3dRfTvncUijyRA=;
 b=edITEiOOp2WwXUouB8MYAnWuAyEC/VT9hH95v3M622hPH0CMJAjIQ2QHZGY/Y7KVXzYbGl
 6hx0x8/u6lyy0vd8FADkIj1PW/4Yt2s7YaP+WiZ66yNvXEhtd+IUrcpf+oaby6GS0bAos5
 f3FV5GzoQtEQmmaA/YX9YNSe0QxAJEo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-7su6NoNCOB2DusZKapytgQ-1; Wed, 01 Nov 2023 20:32:16 -0400
X-MC-Unique: 7su6NoNCOB2DusZKapytgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA31485A58A;
 Thu,  2 Nov 2023 00:32:13 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0BC2C0FE05;
 Thu,  2 Nov 2023 00:31:58 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, philmd@linaro.org, clg@kaod.org,
 imammedo@redhat.com, imp@bsdimp.com, kevans@freebsd.org,
 richard.henderson@linaro.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, chenhuacai@kernel.org, crwulff@gmail.com,
 marex@denx.de, shorne@gmail.com, npiggin@gmail.com,
 ysato@users.sourceforge.jp, david@redhat.com, thuth@redhat.com,
 iii@linux.ibm.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 shan.gavin@gmail.com
Subject: [PATCH v4 25/33] machine: Constify MachineClass::valid_cpu_types[i]
Date: Thu,  2 Nov 2023 10:24:52 +1000
Message-ID: <20231102002500.1750692-26-gshan@redhat.com>
In-Reply-To: <20231102002500.1750692-1-gshan@redhat.com>
References: <20231102002500.1750692-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
X-TUID: 8WDlHr3DY+so

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

