Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp60183eja;
        Wed, 1 Nov 2023 17:27:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYzkJno9C6IvnDAl/tgVOynfCe4mo+080L0e0JvWrjwcRPZHKz9uCcMYfL4dG2raUEJThR
X-Received: by 2002:a67:e091:0:b0:457:6b58:b44d with SMTP id f17-20020a67e091000000b004576b58b44dmr16004732vsl.25.1698884825465;
        Wed, 01 Nov 2023 17:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698884825; cv=none;
        d=google.com; s=arc-20160816;
        b=RbOob4ZgXA+6E6AcZkklCNsqcHG7DTVBPIF1mZcc8WoCE2SwKTtH35ttAIp5VP2t9l
         u1NslpjnY+q/nFliMHafJk4fqMipxj8yNIElnOEI5oNQRlXexgUGf6OeVp4VTN2vtUe6
         Q0fG3GR2sn/GM9kDPCDBmLdffFCHJDtrBrFL+P769M7FJdAATDceZ4gbJZoXkwsR5mYN
         9ze+vkFDcwA2kIyEdCSxw+FyKp0y1PaPmK5aQu9EOzbs8QIE0FILsmjOFmAsbEWR4Jqf
         x59LTqK6i1J7YprMguOULq5KP7UE+KgSW3oVuhCfYg1nrULGTPXpTHXh9A5JzG2RtJFM
         Zoig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=NMeEfKVcgbyI1G4rAH+CJjbX1SxoTX2qtk/NXIun/eE=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=v8uhbHE4149mF9vMjGxEdTwAGJSWxUklDomeKaHBFI2UpOfsvf3CEMj62tjSmNmRgF
         0ZYojjx7RQ+kxxTmGe961n7GJbpRyfgq6lBfETBpAqdtFX8taws3ed5pariUtNEwIu8M
         bkVEBdqz0Kz6NNsUsJeOCngQQMb6AoVpnxNDCNkqHwNXIMf4UPp+K9oTbqsQeX0BqsxQ
         BFUufsnzMBZotR8TE8yXzJiP0lGLjnJmQD2bGJAtf8umOQzYC4KBQhHDfwnceo+k5tQ/
         TMZZswcrmtnKlfi81k3ZXj8ts7pRCgngrLW+3pIV/emFlFh13dd12YLvHzU/26nDfi8M
         KtHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T6J/lsb9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16-20020a05620a08d000b00773ea7b80b9si3312376qkz.676.2023.11.01.17.27.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:27:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T6J/lsb9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyLXU-0000g8-8M; Wed, 01 Nov 2023 20:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLXI-0000ao-KG
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:26:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLXH-0008Mh-9K
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698884770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMeEfKVcgbyI1G4rAH+CJjbX1SxoTX2qtk/NXIun/eE=;
 b=T6J/lsb9BxoT4gpjL8uvrss2dqCzUts4evtR+Dm/V98jW20tF/yRl4rXG+5lEfuF4tV1Zc
 Cw6NNJg+A0zcULKCZOaI7yqo26971Uoi4mr8itXrfxqPQe3OhQYkhbswOFt1fb4Y7YqFge
 AaBInKETX0M1s2sm+vgMqFw+p+fM5vg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-_8_6y1BdMh6TW4UQx5hhBg-1; Wed,
 01 Nov 2023 20:26:03 -0400
X-MC-Unique: _8_6y1BdMh6TW4UQx5hhBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87A9F28B72EF;
 Thu,  2 Nov 2023 00:26:01 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E68F7C1290F;
 Thu,  2 Nov 2023 00:25:44 +0000 (UTC)
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
Subject: [PATCH v4 01/33] target/alpha: Tidy up alpha_cpu_class_by_name()
Date: Thu,  2 Nov 2023 10:24:28 +1000
Message-ID: <20231102002500.1750692-2-gshan@redhat.com>
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
X-TUID: +GQxcr5gttYS

From: Philippe Mathieu-Daudé <philmd@linaro.org>

For target/alpha, the default CPU model name is "ev67". The default
CPU model is used when no matching CPU model is found. The conditions
to fall back to the default CPU model can be combined so that the code
looks a bit simplified.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 target/alpha/cpu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 51b7d8d1bf..c7ae4d6a41 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -142,13 +142,10 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && object_class_is_abstract(oc)) {
-        oc = NULL;
-    }
 
     /* TODO: remove match everything nonsense */
-    /* Default to ev67; no reason not to emulate insns by default. */
-    if (!oc) {
+    if (!oc || object_class_is_abstract(oc)) {
+        /* Default to ev67, no reason not to emulate insns by default */
         oc = object_class_by_name(ALPHA_CPU_TYPE_NAME("ev67"));
     }
 
-- 
2.41.0

