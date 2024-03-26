Received: by 2002:a17:906:3503:b0:a46:a4a7:8772 with SMTP id r3csp5597eja;
        Tue, 26 Mar 2024 11:25:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWg8IUz8kfx0Ij2RozuLlKFyDWagEr1Lp06XOu9QMU8apJrCTKEW0SoikJUoEiqVGZExPyB7xKqWatJTYluLAEnM1Wd9FRs
X-Google-Smtp-Source: AGHT+IHeLXrttiImQ/hrMVx15AzktBm+CUX3RusrualslvSPSrv2aQpkmwUus0yskU83mi95N56w
X-Received: by 2002:ad4:5c66:0:b0:696:73ef:39c8 with SMTP id i6-20020ad45c66000000b0069673ef39c8mr530982qvh.57.1711477516200;
        Tue, 26 Mar 2024 11:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711477516; cv=none;
        d=google.com; s=arc-20160816;
        b=qVF3lwCGewqNTYIkPRRzyJXXi2jbH/6ctxdkMWGA+Dy9CZ43OrFIzJ3IHu/i53ea2+
         I4/SV8xhGvmj1xKpzgIokIEskuChlKdWnsUSMJ3RwDM8RZ283YzhQZPbYxCC3w5vFoZg
         a1qLcWXbmgaDXqudvFh4sGVmrWWNeXahb1nyjffjLS8kReiNvCpvH0qkf09Se4HzF77K
         lRpQj1KJE5ehBZ4p1RPy+LU5xs+sxyWQrnk7XlfjoifgNhPaF2Io/enuAdugiSRnjnbL
         KBGCnyMTJvhJ2HwryBV2VN7Zs54OOQyi7/gqtiiX3wIxecSE76XcO9JNH+ZUWio0g6kf
         U0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hUbv+rvlS0G9N87gYhgxzb3iduozwSSUmPtRG60IHpw=;
        fh=+QYT5ic2V0JVqAzRbmJQwTxDwhWoCj38euddbeXj624=;
        b=x+HmwCCGtSrkaUI/ZZ6qD17fB5KeNkkAngFqeClYo1xrO/TloJH8YHVtTBOyvdamSS
         qtMbs6NzaDJbgHIYEGINO5qbneqNRcQSGrXpPC6+b2L8K3xwmzMWNOpjxrW3mmC6Wk7U
         8E5PLfqrp4/sEFFuBxcXhlikvWg7fa7AiMWElMfHxnhyWIOdPQDkn+QsqpMOtkm6wzSa
         1h1d2NMdxDmRccC9AnBhHS0PymjXcQJN+SG3mlA6LVAV6v0A0cO6LUZEPrDHl4VPaf3N
         ImR1yC4pbE3Np49SuaTGG9emFgCRBxfgqVii+b8wc5sMLDDZCh8bRx43VI4cQF9elzXF
         TfTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MQ7066fG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020a05621420c700b00690bac7d116si11532669qve.369.2024.03.26.11.25.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 11:25:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MQ7066fG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rpBSz-0007Zf-W8; Tue, 26 Mar 2024 14:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rpBSt-0007Tl-Hg
 for qemu-devel@nongnu.org; Tue, 26 Mar 2024 14:24:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rpBSr-0000E7-9f
 for qemu-devel@nongnu.org; Tue, 26 Mar 2024 14:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711477440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUbv+rvlS0G9N87gYhgxzb3iduozwSSUmPtRG60IHpw=;
 b=MQ7066fG1/Qcy9BzZmR2tw92aKRpg5uHsE09shNMq8hvzf8oAfl7aerF6gPJ7y+gDmfVg4
 wDXULsddYmITqtnRab1XTIUTPunfwWjy6E42iOK2o5fCJ3C/TJBi0lkImUUd5FJ2Mrihsx
 wQyMOm2luCQVJH7PgfDWlS6cwhZ0iG8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-TSkH_aCIO9mj2HkM_RA8RA-1; Tue, 26 Mar 2024 14:23:57 -0400
X-MC-Unique: TSkH_aCIO9mj2HkM_RA8RA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD1A9800266;
 Tue, 26 Mar 2024 18:23:56 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C57FE10189;
 Tue, 26 Mar 2024 18:23:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Subject: [RFC v3 1/5] [Placeholder] headers: Partial headers update for NV2
 enablement
Date: Tue, 26 Mar 2024 19:22:35 +0100
Message-ID: <20240326182345.326758-2-eric.auger@redhat.com>
In-Reply-To: <20240326182345.326758-1-eric.auger@redhat.com>
References: <20240326182345.326758-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
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
X-TUID: 825pR6auiQum

From: Haibo Xu <haibo.xu@linaro.org>

For now let's only import the pieces needed to run NV on KVM.
Later on this will be replaced by a standard and comprehensive
linux header update using scripts/update-linux-headers.sh.

For now the changes are taken from
https://github.com/eauger/linux/tree/nv-6.8-rc1-sr-enforcement

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
---
 linux-headers/asm-arm64/kvm.h | 1 +
 linux-headers/linux/kvm.h     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index c59ea55cd8..d46839f1d9 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -394,6 +394,7 @@ enum {
 #define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
 #define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO  7
 #define KVM_DEV_ARM_VGIC_GRP_ITS_REGS 8
+#define KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ  9
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT	10
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
 			(0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 17839229b2..e488bafd3f 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1151,6 +1151,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_MEMORY_ATTRIBUTES 233
 #define KVM_CAP_GUEST_MEMFD 234
 #define KVM_CAP_VM_TYPES 235
+#define KVM_CAP_ARM_EL2 236
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.41.0

