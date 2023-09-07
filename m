Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3154755ejb;
        Wed, 6 Sep 2023 17:43:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBlh+TSd4hF0DfCYFQ2T9QFq8oLb0BsqlOnEhG8ccpy2LcO6YUUF6uUKFTpY59ZL3floj6
X-Received: by 2002:a05:622a:2c4:b0:412:2d0a:b35d with SMTP id a4-20020a05622a02c400b004122d0ab35dmr25665204qtx.46.1694047407873;
        Wed, 06 Sep 2023 17:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047407; cv=none;
        d=google.com; s=arc-20160816;
        b=mHW9g1FxFm9QsahpmIpSDjsSfUFBlIt6GxTQw4pXB28hGM/yHTnjZKM6lZompr5R1m
         C6chHtA4LO5lBzCo7dhLTD93X+7LRxA6x1L2sL5ttJN5t4lE0Uo3ohQR2UY2oxONCbrO
         Ke4aBCcHIvfk8jxqFZUTHulLQSoVf/LbmwAiW7XtUOP799UHBdX4tj6Pvq3S+zUlNM2O
         E3MKZsVFxFZPuutR3jOLl/WddZiEjMDiLJDumActr5eavuNzlG2h4c07KwEkyxOz259n
         71fxviSzh8hwR0JD4/JrUku4+6Ad7jhxooI2CutQHMAWhpBSRUjBgBNYmfuJWGXoSZ19
         g4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5JAekN46If/FbTc18oKbSDZ88922/4DQmQrjjGPZjm4=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=Nr+3auixXGx0DiQlar/imP5Qxs1RZarLOphbPJfejgt5FjXy4mL3xfx4VbmmBEjI0w
         U6I6S/z4tYRyPA8S5QdPwLbItLPOwjKnUOXiQObBet+OVL1K9+cLUVi3rw7K6N7j/P+D
         gxhbWrNRFEWgw3IUzYYRRlxtDNaOXOT3XleB4AcDAdxfRRnTTOTI0TffO2fEXmNrFes4
         UyLxdBB8MSj+xMeZpyb/Ue/R2k2N/2EhtweHsWiSr4vK4O19Csv7yR/dns6MRvWQWI4e
         vIAjupbmAb5r9T9KDmUA5uT6+lRWcu2FmqQ9rAqn2wjOJNVM6u49E0mRojeDSlgzrYPN
         NiHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g6SETA6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v24-20020a05622a189800b004031ae3ae02si10466304qtc.21.2023.09.06.17.43.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:43:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g6SETA6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qe374-0005WY-Ei; Wed, 06 Sep 2023 20:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe36y-0005L0-NW
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:43:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe36w-0002eu-G1
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JAekN46If/FbTc18oKbSDZ88922/4DQmQrjjGPZjm4=;
 b=g6SETA6bRLNS28dWnn7vOADHiSUVXm+1ip10+HKtcjxxQ7ffUw3I97sMOx4cKfr5Co+U/X
 yp2FkBffd94UUJw3K+OE57Zb50o2iN6fwjvqkR8HQhiAOsthDxkn5rsIcZw8ylU/Pfcneo
 zrBpmeqkPRSOhUkgybNgMooYSwlMHLI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-reYFMtu8NHKkg5O_DkMOTg-1; Wed, 06 Sep 2023 20:43:00 -0400
X-MC-Unique: reYFMtu8NHKkg5O_DkMOTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7811729AA2CE;
 Thu,  7 Sep 2023 00:42:58 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5632DC03295;
 Thu,  7 Sep 2023 00:42:43 +0000 (UTC)
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
Subject: [PATCH v3 24/32] machine: Constify MachineClass::valid_cpu_types[i]
Date: Thu,  7 Sep 2023 10:35:45 +1000
Message-ID: <20230907003553.1636896-25-gshan@redhat.com>
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
X-TUID: LY5S8xS7Z7ob

Constify MachineClass::valid_cpu_types[i], as suggested by Richard
Henderson.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/m68k/q800.c      | 2 +-
 include/hw/boards.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index b770b71d54..45f2b58b26 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -596,7 +596,7 @@ static GlobalProperty hw_compat_q800[] = {
 };
 static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
 
-static const char *q800_machine_valid_cpu_types[] = {
+static const char * const q800_machine_valid_cpu_types[] = {
     M68K_CPU_TYPE_NAME("m68040"),
     NULL
 };
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 3b541ffd24..49c328d928 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -268,7 +268,7 @@ struct MachineClass {
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

