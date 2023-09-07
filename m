Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3154078ejb;
        Wed, 6 Sep 2023 17:42:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4XTqspXU/HIjqBjhPnDzeZgkJ60GOJ3XbgYMpweEnDrByyTqoVco7oO2beJ2d+3zV8vxg
X-Received: by 2002:a0c:cb8a:0:b0:64a:b025:6a0 with SMTP id p10-20020a0ccb8a000000b0064ab02506a0mr16610451qvk.41.1694047320384;
        Wed, 06 Sep 2023 17:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047320; cv=none;
        d=google.com; s=arc-20160816;
        b=RhZhMAgQjMtrAINxhtZu1eTIY2j/efYwbqucEvcE+hNQzh+/4l/FEwPGfVYx9C5dLK
         sS2pbuDShVwGFfCF9E7jMpzvZjiQCrdRX/+lq8g7Vqo7vIQM9kxknxOBhjYlZLO6EVL8
         zJ3VJqUqiNsqvXV7P2NeQJJ9E17qRKpKEXpK0SVq7445F+noszwMx9mfrwLjYQ9hozKy
         P5WOFKqp0xFv8EZKdiZmC4Z6HaAWnLAqw8Xbzzx3tDJ2Ri+vlisaW39162PIgs8+YMG8
         LYcpEhgSU7XV7ciCt0Zid6Ea25YQRDkZArM9iLPzwFgoUwOoW8dKrcX5VxN1bEcIBddD
         tMQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wHbk2VGs4Q15Oy7Noy5pNBCnym4i+ZeEk3LlWmCtMZ0=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=r9xj+l4kZ7doJA4RIx9qZXxO7+71S3Apljz1iGoQubU4XU5nioH2QSLUWlIExPQO49
         RVAyhtEYz2w6kLbsqMM5ESSQSd8Pj0ICOUW4h7S++ht7uYjpLsfCwLXzFyGthAmbM2ac
         2+qu2vPELEkinkrEtBwp4ZCxZDzYq+5FNmFNu1czTAULu/6m4PlnBxFUfPI9pOeBKXsU
         jqM1hsPS68k9vEgcEu3qXVhGJgm71D3/9KXGFOL/Ejm9W9KcVMzIvq0af6Sdnv3AhOFe
         NCabRjernz5xMb6CPgEf9Y6uLmR8MWYk+w4qHsLBhPM1I/uxqw4EWfOgx1Q3gGGTPMU2
         9AeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cjc9U8s2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7-20020a0cf587000000b006467d267395si10893029qvm.568.2023.09.06.17.42.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:42:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cjc9U8s2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qe35q-0000MM-Ec; Wed, 06 Sep 2023 20:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe35i-0008G0-0h
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:41:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe35f-0002Ht-O6
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHbk2VGs4Q15Oy7Noy5pNBCnym4i+ZeEk3LlWmCtMZ0=;
 b=Cjc9U8s29/waJwUhDSLdSh4voWMEcc7swoIZUU3OJA3OoNB7/yJ1Arj7lysqqSE630aYeq
 NUdeztF2NZruVOakp3az63RkoqS/ymkOf+ge7sCjJOGd8Dzp+J4/2AMkxOz//D9XRHh67r
 MPOKSC3bDvP4OukhKfP/qxXQk5UqfxM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-FKnB5NJDNgGEsjjBzh_jZA-1; Wed, 06 Sep 2023 20:41:42 -0400
X-MC-Unique: FKnB5NJDNgGEsjjBzh_jZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD4B73C1014D;
 Thu,  7 Sep 2023 00:41:40 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24B4CC03295;
 Thu,  7 Sep 2023 00:41:25 +0000 (UTC)
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
Subject: [PATCH v3 19/32] target/xtensa: Improve xtensa_cpu_class_by_name()
Date: Thu,  7 Sep 2023 10:35:40 +1000
Message-ID: <20230907003553.1636896-20-gshan@redhat.com>
In-Reply-To: <20230907003553.1636896-1-gshan@redhat.com>
References: <20230907003553.1636896-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
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
X-TUID: Wl79sqry7pW7

Improve xtensa_cpu_class_by_name() by merging the condition of
'@oc == NULL' to object_class_dynamic_cast().

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/xtensa/cpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index acaf8c905f..9d682611aa 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -141,11 +141,12 @@ static ObjectClass *xtensa_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(XTENSA_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc == NULL || !object_class_dynamic_cast(oc, TYPE_XTENSA_CPU) ||
-        object_class_is_abstract(oc)) {
-        return NULL;
+    if (object_class_dynamic_cast(oc, TYPE_XTENSA_CPU) &&
+        !object_class_is_abstract(oc)) {
+        return oc;
     }
-    return oc;
+
+    return NULL;
 }
 
 static void xtensa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
-- 
2.41.0

