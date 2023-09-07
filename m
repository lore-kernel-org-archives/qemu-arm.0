Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3155348ejb;
        Wed, 6 Sep 2023 17:44:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtHp8tFkjv33fbHOYuRxsVZvkLVq/gPws/dl9TF8QFsqHD/P2ZhEW02A4lVpKtKaAQrKxB
X-Received: by 2002:a05:620a:eca:b0:76c:df65:b5fb with SMTP id x10-20020a05620a0eca00b0076cdf65b5fbmr15321928qkm.72.1694047494289;
        Wed, 06 Sep 2023 17:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047494; cv=none;
        d=google.com; s=arc-20160816;
        b=0PJkp8O1LIoq+mobDce9sFMIS7oV1O1rxCKiFq8D/2nmB9Ul5HGZbRU+y3GC9Sg8ij
         EFMKSrfPBE8sg0FL9sg8Bt+/MttzRDAB6UOBq4Sb7klOoL5wTPl52NNA9alMCLcBcBTS
         zfGl/8x03jGmUqXUayDSig1ynpF1Wu5v4rtwYRD3h1iV5/NM0WN++58UlSHlRxep0StF
         pqh50kXQMri9EEpS7dxVL43z0UhwzhcN9x/qjzTYv5ok/ApJFmh3/dq1rkHnEI8+9pgB
         QNyU/9oPwJCBL5+6IFWVDHC+5q1TkvXLJIbmDoYQuMftEwz6G6bIlpiFovGJsShC5PRs
         LuBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xU/C0zeNmQwEY4LIhhvgPMVvS/oORzQNMiGuubx/xfo=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=FkWR1RLqDy/pwMma0fNlyGFvEgnMZWGLz5VNyB3JVMbQ2tBryNAotz5B3tpg07NAB/
         CYcw/yk5yjfhxBC3Z94kgjgm1f2VOXbKC8VT0QKnrYHLWT19F8Q5J7GNyj/BTQJNoCuv
         gZ/cCMgCYaDJEByAiLeB9PrDKtHAINAK3mRNgUn8MTMq2aTLXFxN/vdjahJRzzZ0qd/t
         wOjIaq50hFwrVllFb61G1Fowfx63PD2hCERGTaZeX3YbUUixtQDFnQ8LlPqY7sPsDTRj
         jj0evLy0EhdxRioH/3Wbec1o/jmMzIWXqr7sB78yKX0UtRBFwu1XLwkYP1Di1AWoSoAX
         jc9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TKwjAxBf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az34-20020a05620a172200b0076dbb17e788si10729473qkb.721.2023.09.06.17.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:44:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TKwjAxBf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qe38M-0008R0-UH; Wed, 06 Sep 2023 20:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe38C-00085Y-Tp
 for qemu-devel@nongnu.org; Wed, 06 Sep 2023 20:44:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe38A-0002uk-69
 for qemu-devel@nongnu.org; Wed, 06 Sep 2023 20:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xU/C0zeNmQwEY4LIhhvgPMVvS/oORzQNMiGuubx/xfo=;
 b=TKwjAxBfPS/aoytN/awQ8OjLOTrJn3kLWCCzBg8EDnuQ+46+5OHNf7Q08SQC/xPj9kahOU
 32RsJ7YiIhNDVud0lOEui5BrhQ5Mn8RD87v7RGLlj8PfJU9K0SEE7r4UdJSU1bGFk5NpPa
 sVxP0vzOgmmFLSnteCquVd8FhOT3zN8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-bIfD1ptGPg2QakLBUbWdig-1; Wed, 06 Sep 2023 20:44:18 -0400
X-MC-Unique: bIfD1ptGPg2QakLBUbWdig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DB5E802A6E;
 Thu,  7 Sep 2023 00:44:16 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68BB1C03295;
 Thu,  7 Sep 2023 00:44:01 +0000 (UTC)
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
Subject: [PATCH v3 29/32] hw/arm/virt: Hide host CPU model for tcg
Date: Thu,  7 Sep 2023 10:35:50 +1000
Message-ID: <20230907003553.1636896-30-gshan@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: pl+B9MT4JrZC

The 'host' CPU model isn't available until KVM or HVF is enabled.
For example, the following error messages are seen when the guest
is started with option '-cpu cortex-a8' on tcg.

  qemu-system-aarch64: Invalid CPU type: cortex-a8
  The valid types are: cortex-a7, cortex-a15, cortex-a35, cortex-a55,
                       cortex-a72, cortex-a76, a64fx, neoverse-n1,
                       neoverse-v1, cortex-a53, cortex-a57, (null),
                       max

Hide 'host' CPU model until KVM or HVF is enabled.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 762780e677..bd0ad15028 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -217,7 +217,9 @@ static const char * const valid_cpu_types[] = {
 #endif
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     ARM_CPU_TYPE_NAME("host"),
+#endif
     ARM_CPU_TYPE_NAME("max"),
     NULL
 };
-- 
2.41.0

