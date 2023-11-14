Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2413477ejc;
        Tue, 14 Nov 2023 16:06:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD+WAVXdKtNhj59WgugtfQw9zPsLGxnStWU8ZMhSyOYKt1VDOB7CQmwBPDHbMynfRDUZHh
X-Received: by 2002:a05:6214:5149:b0:66f:ae2b:7a with SMTP id kh9-20020a056214514900b0066fae2b007amr3923224qvb.10.1700006769368;
        Tue, 14 Nov 2023 16:06:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006769; cv=none;
        d=google.com; s=arc-20160816;
        b=gFWAwGMvYiWy29wLg0tS2FrXz5t7MwjH1eOQQ28PD0AJaDZSOj9TyBUt0BC9Jrk3gA
         TsAjIWIqiUsf0BuI9Vra6aTZSWZRJQmZaG//ZXXlclUZAlG4Kw0ERLmIY43HYvgOtgOQ
         22mtDa3j/eLNN7hq+2YKTlflRnn73LyUEr8F86BvBNpuBypnbGAC2FnmOGL3UoMg74pI
         oSJw/LAYxzq41lklVbsOdPsXb3/m4hUsRol59tZ80Z2CY3002xKm3yCIiMxuXdZzRyOL
         /iCP4kWfP6Z+hCvMqY6ifcogizr39mAelU5gXxg1rHl44w51PolBOw9HpIgN4e1LtK+N
         kWLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0Qk6/QajLgnGyyzUHhMPIDBeq8Pe5C9hI3Ifb+WIAuI=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=lBuoq1Ju+n36HFyrBzJNzV6J5m8lrPvlqC8Jo1bdtrkuWSmffhcK1mraV1FyXTLwka
         0+6htcPTJ3Y5BQqULFY5HpVhvdiSXx9/J9i3wA5PhEQiFByy38QUW2rJa+LgrNWgDjDm
         II6i8tFvK84j1BturmtEVnz0NY79Gk9RA3/2B7Nfh7aTsUaRJXJqr4Wdvvm+ZJ2c7Dt8
         Y/CVqzrupuX+RS8k8C6UXUA6qijmO/QrVJPBqh1r5mQs01c+8JHECJdcmDtYjLAbkJ9e
         EovwW9qUD/NDS+5MndKt7S0VlTVYz+iKGsoTUEhj67Bh906Nz1Qgtb2IymOhLYPeINjz
         3tng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vc3cSvBg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay39-20020a05620a17a700b0077433fe23b1si7740306qkb.277.2023.11.14.16.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 16:06:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vc3cSvBg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r33NF-0000iN-4g; Tue, 14 Nov 2023 19:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33NC-0000ck-9Y
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33NA-0008Qb-Sw
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:03:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Qk6/QajLgnGyyzUHhMPIDBeq8Pe5C9hI3Ifb+WIAuI=;
 b=Vc3cSvBgjVCJqR08QNL363uVMiO6UgpuNzevGmjeSPoez44sUMV0OBTMVgEHe/mOCg6kP7
 OHXPCWqPG3KHvfFnx1lBcnJAlOGAZPz1KDMw4wTk3/SG5/0zf5IvFvOpCFMVin7oem6tER
 BUdOZZoKCbdqMwJpf2j5xL+B24OP21M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-FgyyvxepODesgtqxvhF8lg-1; Tue, 14 Nov 2023 19:03:05 -0500
X-MC-Unique: FgyyvxepODesgtqxvhF8lg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A335E85A58B;
 Wed, 15 Nov 2023 00:03:03 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6562C15885;
 Wed, 15 Nov 2023 00:02:50 +0000 (UTC)
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
Subject: [PATCH v5 27/31] hw/arm/virt: Hide host CPU model for tcg
Date: Wed, 15 Nov 2023 09:56:24 +1000
Message-ID: <20231114235628.534334-28-gshan@redhat.com>
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
X-TUID: nhxVIAkx3bn7

The 'host' CPU model isn't available until KVM or HVF is enabled.
For example, the following error messages are seen when the guest
is started with option '-cpu cortex-a8' on tcg after the next commit
is applied to check the CPU type in machine_run_board_init().

  ERROR:../hw/core/machine.c:1423:is_cpu_type_supported: \
  assertion failed: (model != NULL)
  Bail out! ERROR:../hw/core/machine.c:1423:is_cpu_type_supported: \
  assertion failed: (model != NULL)
  Aborted (core dumped)

Hide 'host' CPU model until KVM or HVF is enabled. With this applied,
the valid CPU models can be shown.

  qemu-system-aarch64: Invalid CPU type: cortex-a8
  The valid types are: cortex-a7, cortex-a15, cortex-a35, \
  cortex-a55, cortex-a72, cortex-a76, cortex-a710, a64fx, \
  neoverse-n1, neoverse-v1, neoverse-n2, cortex-a53,      \
  cortex-a57, max

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index be2856c018..668c0d3194 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -220,7 +220,9 @@ static const char *valid_cpus[] = {
 #endif
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     ARM_CPU_TYPE_NAME("host"),
+#endif
     ARM_CPU_TYPE_NAME("max"),
 };
 
-- 
2.41.0

