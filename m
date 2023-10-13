Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1532889ejc;
        Fri, 13 Oct 2023 07:05:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGj5HLdvJfv3VlELwb8VLTCCjpqwcYSyWRrHZ0v6lDejJnw49Lll8NX3UAKIepai06CcRNp
X-Received: by 2002:a05:620a:28d2:b0:775:92ac:a3d6 with SMTP id l18-20020a05620a28d200b0077592aca3d6mr78130qkp.14.1697205939260;
        Fri, 13 Oct 2023 07:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697205939; cv=none;
        d=google.com; s=arc-20160816;
        b=aZEIZC/eZbebpG6MLC7EqqqcPs3JpCNbH+/KqMkWazIboVY3Ie5HiJ8Pvg8Ie/fJgi
         r0DUI6zZwozxk/q7KFJMf/sZ1Z74N2THGDtQIih0auZEK4FmcPM9SUwhPL0jhbJzhgfk
         k6oguZNAm5pojAA8ppNtMmmjX9TBk5NYTg2eQzUp6CJGHZMbb/ndaTrvYgoQIU9aSVTB
         ulauMEVdum4hF5mXVo/4PsHF1AwOl5IlpFzjE5yDNC2h42315mGLYa4BwGaHEp+TZwnA
         jm4mCQaSiGfe3QuyEZLIKRGzTR5Cuoyq0SstvXtdVQcYDaFy2C3rmA8huPkFjtpIXnBT
         NOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UC29UT+n44RqVD1Gw8xlAiVXKwDekYV24KCYK3TH/3k=;
        fh=yvC9ZPM7MgJn7Xb0eJwxiCf2t+VfzDAYAfYYKFMFkpQ=;
        b=tfX4iPoIJOkrr2dcjkGCpNgHM7kDfUR1ipiXYECT6Z+QkSJvOYtcxcwm8mfVzB+Bpt
         hjV3XcO1V9TAifqX/dOzxBufFV3sYoCC2XFK/w2RyWyZfSbeG9r+lf6utaxpeLJ3vSQZ
         7pt7bAo1mW6VunnGXhmv1ISUCHPdpXhTSakVzfY/FJt1dM99L+paiFUKp5FdzPylbAbk
         Cc970hZuFEi9SfC2lDeC0CjZ4D9CrkN+p0meX765mBzbA/g4Q+fY3eV490t6lNr3oFT2
         pJ9l13DZt+FOxBb1HkqQCcqIGH2i7lZxLbsouFDcyEWLGdbxB1sG25US25VZRrcdowGv
         fZPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Kx/ZlTFv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id tn12-20020a05620a3c0c00b007770bfc26d8si1244314qkn.39.2023.10.13.07.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 07:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Kx/ZlTFv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrImU-0004iR-Oe; Fri, 13 Oct 2023 10:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIla-0000oX-LJ
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 10:03:55 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIlV-0002fA-E2
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 10:03:48 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so3812244a12.1
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 07:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205822; x=1697810622; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UC29UT+n44RqVD1Gw8xlAiVXKwDekYV24KCYK3TH/3k=;
 b=Kx/ZlTFvYIr+675nRcd0PDHtj+mK7Qd63EvSAjUUjSC0fE6bZlQS9J8jO/i4yz0yVQ
 2NZeJiwUR9O/7FkCPW35+v8Enxo85tepejlbr7Bc4Gwjit2mkr6MZrv0r3CDf1WmXBYi
 87MCTq4qi/whz5PQg+t1rFwdNx9XNoYVK0AOBQFZ0J1Rli34g8g5hOwZ5Sdz6vnFes6N
 uobTbLO4pXCMItfSli+p96D3KdAHL5Fs6CcHpeHhZgSdQ0KDKaDOMly6IbPyLRoJEYN6
 nfMVD8qHXX1s/MKp2cXrslhRaf4lr4T00kJ/Dr3lPqdnpyX+Xgwt0gAuMEndExMtrPtd
 5Teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205823; x=1697810623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UC29UT+n44RqVD1Gw8xlAiVXKwDekYV24KCYK3TH/3k=;
 b=K3qU2zw+BjeNfSETyB9lYsy6oa0bywtqdwvhJrEVWFG0Vhy/C3l9zuYAZiWBoYPlsD
 94qtbb9Qki0sGEyZhom2SWaCWzfDsfWQmUiFVj+SUZDoCs6Miayb1s5Dm8xpfQuJW77T
 PH+a6JGxp2DiygRAvkW5Yp0Sc22S6MQmMIlrmb6ZxGvgXWykzPD1A7BGCkyoteDTNmF5
 WuDU4gQFRElgQOH2ttu2CDlZ54CkGQOvnOzygj3KWxGG18atzKH11EL7Gu8Czyu2Sco3
 cH63lPCKpRg51jtAlLG/afMPz2V/RekRyH3PAiKMdWt7EenMQkdkk1uhZhVEeOz6j/nQ
 Et8Q==
X-Gm-Message-State: AOJu0YwiPi6BkdYSID+7pefbwrCEj3YpFfjuziEXX3DoR8pq23Y2zkt9
 KhMxEvvrDWfXq7zXC07CyBGrFg==
X-Received: by 2002:a17:906:144:b0:9ae:54c3:c627 with SMTP id
 4-20020a170906014400b009ae54c3c627mr22453688ejh.71.1697205822564; 
 Fri, 13 Oct 2023 07:03:42 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a170906360f00b0099d804da2e9sm12558220ejb.225.2023.10.13.07.03.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:03:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 15/16] target/ppc: Declare CPU QOM types using
 DEFINE_TYPES() macro
Date: Fri, 13 Oct 2023 16:01:14 +0200
Message-ID: <20231013140116.255-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Y+Lt0z2u9fYx

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu_init.c | 52 +++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 40fe14a6c2..055436c141 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7408,39 +7408,34 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #endif /* CONFIG_TCG */
 }
 
-static const TypeInfo ppc_cpu_type_info = {
-    .name = TYPE_POWERPC_CPU,
-    .parent = TYPE_CPU,
-    .instance_size = sizeof(PowerPCCPU),
-    .instance_align = __alignof__(PowerPCCPU),
-    .instance_init = ppc_cpu_instance_init,
-    .instance_finalize = ppc_cpu_instance_finalize,
-    .abstract = true,
-    .class_size = sizeof(PowerPCCPUClass),
-    .class_init = ppc_cpu_class_init,
+static const TypeInfo ppc_cpu_types[] = {
+    {
+        .name           = TYPE_POWERPC_CPU,
+        .parent         = TYPE_CPU,
+        .abstract       = true,
+        .instance_size  = sizeof(PowerPCCPU),
+        .instance_align = __alignof__(PowerPCCPU),
+        .instance_init  = ppc_cpu_instance_init,
+        .instance_finalize = ppc_cpu_instance_finalize,
+        .class_size     = sizeof(PowerPCCPUClass),
+        .class_init     = ppc_cpu_class_init,
 #ifndef CONFIG_USER_ONLY
-    .interfaces = (InterfaceInfo[]) {
-          { TYPE_INTERRUPT_STATS_PROVIDER },
-          { }
+        .interfaces     = (InterfaceInfo[]) {
+              { TYPE_INTERRUPT_STATS_PROVIDER },
+              { }
+        },
+#endif
+    },
+#ifndef CONFIG_USER_ONLY
+    {
+        .name           = TYPE_PPC_VIRTUAL_HYPERVISOR,
+        .parent         = TYPE_INTERFACE,
+        .class_size     = sizeof(PPCVirtualHypervisorClass),
     },
 #endif
 };
 
-#ifndef CONFIG_USER_ONLY
-static const TypeInfo ppc_vhyp_type_info = {
-    .name = TYPE_PPC_VIRTUAL_HYPERVISOR,
-    .parent = TYPE_INTERFACE,
-    .class_size = sizeof(PPCVirtualHypervisorClass),
-};
-#endif
-
-static void ppc_cpu_register_types(void)
-{
-    type_register_static(&ppc_cpu_type_info);
-#ifndef CONFIG_USER_ONLY
-    type_register_static(&ppc_vhyp_type_info);
-#endif
-}
+DEFINE_TYPES(ppc_cpu_types)
 
 void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
@@ -7635,4 +7630,3 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #undef RGPL
 #undef RFPL
 }
-type_init(ppc_cpu_register_types)
-- 
2.41.0

