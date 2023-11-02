Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp62711eja;
        Wed, 1 Nov 2023 17:33:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzjq61tpY0Pv+IBKG36L+nH9XSgrdlbwbc5k7mqEEg4UBtgB52MY11/xYNCyt8eZsCcAsx
X-Received: by 2002:a05:620a:1aa8:b0:775:6d22:d1f5 with SMTP id bl40-20020a05620a1aa800b007756d22d1f5mr19343989qkb.51.1698885229153;
        Wed, 01 Nov 2023 17:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698885229; cv=none;
        d=google.com; s=arc-20160816;
        b=XvPj3DojRJdkXXbS9MopMnLgTJe1Cfrg/8o9zGcZ5Rn+9Y2fJ5WH0x7VvPAdux0icH
         bOnHcdyU/y4SIxeJOt8yNHqTD40k4oS71BOjACyHEmpEXs7Zrajj1JUUtIsNVkejfINs
         vkaFx/K0qFKhUlpy8l/pe0TYoHlAz79eDUq6BJv+hS+8z+e5uw5aq//O+5XLui0t04tq
         dzOQkv6i8Vkh98n6za4kkXy7AF7OpvsfBUytAGXgxTdedC8etA6HV92Nts2miEiGO0dj
         L0CzMscc82lsfzvttRLyubjt9ORfVX7+HBGl7QfJx863+pHEirwQf9PBeFDBlYDVSz32
         JqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=o1+4HbpKqVTJMwlTCGvMXVY4nUqCG7PAat4P2+e2WX8=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=EBsain4MNw/mja+OZ/t/Zw2O2kxzrG5GaS0dQMMNsfpHMALAWc5hkPx7vGQC4XMJwm
         VhnXEVfhvZkmxR5ztzURrZ65zW/7vpasQpqyeBqC+I60p92moX9DGEqyBBtPBRcIa1O7
         CRNiK9vtTJP5Bdjjeqn6QOSwzbrU0OX9EQaZ8dw7BvqgAtgC20Wd8/3QhDvmbcxJdVzn
         UAT6gKBKd9/SET9hoBkEK+jf7ZyplEkgw0FTfP13vXC/fGYGD4uJLehDYoe79hpxn74l
         sVSE4tZSb3t+VjFnjoZDq3jYe6iRwa4FPtHs+9QJwVOCh2ND4uzpWaybG6F5igBmIYq7
         8XTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b+0PANUj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a24-20020a05620a439800b0077a40cddc00si3770866qkp.174.2023.11.01.17.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:33:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b+0PANUj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyLbf-0007Z7-3l; Wed, 01 Nov 2023 20:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLba-0007RR-LV
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:30:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLbF-00020n-IC
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698885009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o1+4HbpKqVTJMwlTCGvMXVY4nUqCG7PAat4P2+e2WX8=;
 b=b+0PANUjOe9qtkWkev4z7MSAPAiePOKdLZ9CItc3viqT1LZDQhmlZjOfWQ1UPi2VRoZ0L2
 ZRmtQorRJz3GkLAdwh9s6mpYegD4G4OvknOIo36hea0FDEVwU/pltru4sjcHmI2J72W7tk
 OZCB62kJkqHwaYR1vVGPvn318KFnLZI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20--41JO_AzPli-nSpvaJj0Hg-1; Wed, 01 Nov 2023 20:30:06 -0400
X-MC-Unique: -41JO_AzPli-nSpvaJj0Hg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20F43185A781;
 Thu,  2 Nov 2023 00:30:04 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD2B5C1290F;
 Thu,  2 Nov 2023 00:29:49 +0000 (UTC)
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
Subject: [PATCH v4 17/33] target/rx: Use generic helper to show CPU model names
Date: Thu,  2 Nov 2023 10:24:44 +1000
Message-ID: <20231102002500.1750692-18-gshan@redhat.com>
In-Reply-To: <20231102002500.1750692-1-gshan@redhat.com>
References: <20231102002500.1750692-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-TUID: j3oU6VRtti42

For target/rx, the registered CPU type name is always the
combination of the CPU model name and suffix. Use cpu_model_from_type()
to show the CPU model names.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/rx/cpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 0063837e93..fea7f596ca 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -91,9 +91,11 @@ static void rx_cpu_reset_hold(Object *obj)
 
 static void rx_cpu_list_entry(gpointer data, gpointer user_data)
 {
-    ObjectClass *oc = data;
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
 
-    qemu_printf("  %s\n", object_class_get_name(oc));
+    qemu_printf("  %s\n", model);
+    g_free(model);
 }
 
 void rx_cpu_list(void)
-- 
2.41.0

