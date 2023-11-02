Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp62925eja;
        Wed, 1 Nov 2023 17:34:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7b9zHf/4SCVHMgBakgRHajBivssUEZSaojYHL5BjVCs3/jiC/uXRR+QPBYT27jowKPI8N
X-Received: by 2002:ac8:5f0a:0:b0:41e:3fe0:deb0 with SMTP id x10-20020ac85f0a000000b0041e3fe0deb0mr21075509qta.35.1698885262263;
        Wed, 01 Nov 2023 17:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698885262; cv=none;
        d=google.com; s=arc-20160816;
        b=tZmnqvZ0dQqrXuR4H2Eutd6nU072WnIyJxfoICsVwjq+zDBFETzcHGA17moetlmgXr
         dOZFhmduHnlR59g8T69fg1iHm3ub2Kv/0SbVSAoBYQw6zGxKH+AUSt+MltSBh0Dy4lK0
         7KKcK6HaLci3k5PFuXSiLPRLJc6kSBhxmvxJhlqXFUr4pkA8u42IloAnxxXr64yLvsQY
         GKqCh332B4hy38M8BpkZ9+SpsxTzYwpSRaJnOtDBJ/ZFgQmH34SEOL93ngC7zr8Vc3BE
         RMhDd0jh8niSi8ym4usPkeUHz53Z5TsMZCumq4zdbpF7VDlKXIiWvTvlj0nLE0Ts2E8I
         uP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LEiT9tG5BXAALWGTfR3CXjF/OG9iJ1/hvQfktpNoDuk=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=yS0b/lPi68UtQuIuw4tEtaGiapStObjw/oFsgGnX9oQJkUcDRTi9QEbahYrt4L/ndz
         qrWvlwxy3UfxmbpI8FW+VWADbUFxC9qC38/7lTmm+5MrGzYsjpn71lZGe85y6aGHXrzz
         s+dcn8Aas288zJO7r9mM/L7rtt3EqyV2dC8Itujfxyxs7hG4xrdtNKpaTwdS7eNBChss
         2ax6sW7i7qS/9YrPGkk1up3nGDDqXuRt0r4xR1h4KkZ+gr5mPqxCM38rkznVYC3SnHSs
         Hl1edZhGxdACN2aMRE0c/X54RysgPGnsuzpD6bMkxBSQb+4EBTSZHdQsdohO1OkHBIz8
         Clvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KBl43ycl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020ac85f4e000000b004122ed3e21dsi3375151qta.555.2023.11.01.17.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:34:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KBl43ycl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qyLef-0007OI-2O; Wed, 01 Nov 2023 20:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLeZ-0006k4-P3
 for qemu-devel@nongnu.org; Wed, 01 Nov 2023 20:33:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLeX-0003nC-7f
 for qemu-devel@nongnu.org; Wed, 01 Nov 2023 20:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698885220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEiT9tG5BXAALWGTfR3CXjF/OG9iJ1/hvQfktpNoDuk=;
 b=KBl43yclGy+uQKLNCXHdNPNT2hnH2So8h770ttcCD7hREC0tUS8Rm08N798lvINe3a3xUi
 MR3KQ7WCx+XV/qiQOf28/qhPK6Kz63RR4vq8l+aAuB9O2BFKK0wWhe+dsHPEdrtUk8VYB6
 6mZQjC1LDiiG7RKPUWSQrpsrnirE+XY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-RtQxyfvHOz-Mx6bcoz_0uw-1; Wed, 01 Nov 2023 20:33:36 -0400
X-MC-Unique: RtQxyfvHOz-Mx6bcoz_0uw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C910D185A781;
 Thu,  2 Nov 2023 00:33:34 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39042C0FE05;
 Thu,  2 Nov 2023 00:33:18 +0000 (UTC)
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
Subject: [PATCH v4 30/33] hw/arm/virt: Hide host CPU model for tcg
Date: Thu,  2 Nov 2023 10:24:57 +1000
Message-ID: <20231102002500.1750692-31-gshan@redhat.com>
In-Reply-To: <20231102002500.1750692-1-gshan@redhat.com>
References: <20231102002500.1750692-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: pB+bUgRumE33

The 'host' CPU model isn't available until KVM or HVF is enabled.
For example, the following error messages are seen when the guest
is started with option '-cpu cortex-a8' on tcg.

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
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5bacd3a7f0..1ac2e29244 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -219,7 +219,9 @@ static const char * const valid_cpu_types[] = {
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

