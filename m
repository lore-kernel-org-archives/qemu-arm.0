Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp864235ejb;
        Fri, 9 Feb 2024 08:02:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVQQptomPvojYvRLeLHkYdG7SWDIeJcckhrqJpKRFKYNWdG611aMj/v0i9/CETaQPJqS3ul5DoMYuNHCZturSDB0URSj4Gz
X-Google-Smtp-Source: AGHT+IGKNEmlgCdvCCs/l2EGWBZBTLs5HTA6I2WnxeqnZDJalWCsWc1EBVkgFAf5VkRQw/EQLvJB
X-Received: by 2002:a05:620a:2ea:b0:785:b064:19be with SMTP id a10-20020a05620a02ea00b00785b06419bemr2009102qko.35.1707494555392;
        Fri, 09 Feb 2024 08:02:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707494555; cv=none;
        d=google.com; s=arc-20160816;
        b=dpyTMF21G31kqkppzWDmqJ/n27AqSG56H7C9Oq/EBjUGpDUq76jXCxvvkEF3YEIYB4
         YDDQc+S6Mc2Q0Nt5Yn6iqKqtJPFH1NMcdeWZabFV1gdMulTXqmptpD5tWwyVdKALR4M+
         FCNBPJrjp6wxOPSdgdBFH6xwZ6HTwaFQgmFPyL8bdviXvhFmXPZFfgTHP4qFOHaAtE2j
         emCYWNdtsqGVUVsln+YgmwLfoOP2S4EU75aNGGNITujOX7Dxxv/o5A0whsakUuBVzvGq
         UIJqehjpiwROR3BBTEwj/vvZVwagpKu6bzhZx+WO6DYoBmlYWax+ijwT0E26HVsYkWDP
         xqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QxQRqeD5R4FqRYgOoa9wzRCV8FjwfJNCmsAutTGLf2I=;
        fh=d6T/zNceJsPhrx1E/fVK61SPEZ6WZD2e7ykrXAiU+7E=;
        b=WT8AOHtuGbYmmYWzeDAz2h8fCITRM6vK1nvxUSV6qHwIrBoA5uiK8yUObaW6xRAolV
         MFE4irMxyM0jjl6OBuSiq8T3uLoCDz3eUSPgr3PIF/lMN9nMD4tsJ/Hw8GC5+I+oiaPt
         7yA2Ufgt0QEh85cxOuqpoW9JkxkYYPiVKYmOy7spGJ5lwKJv124P7STzto0QPWR2qxbR
         e7vH7Xwfpo6zlqGzZAFZ5iS8sx3Rw0HpRKVItETkdnFOcHngnlcCaPrehDA59Im5784x
         WzezGtDAZLWY2ICgA3mWgTNLce4JiDynMtNl6WQWl/6Mt9u6ZkJqq9gFSjRPgVECw8me
         4xow==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e2MT8aSI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCVTTQ2m1bAXQEUizrSSI86XKoUfp/a+9DKjvQcbhMPhtbpqkFhV+lY2L/nsuNo18nvv7VnPJXakZar++glAGG99H4XEiOKB
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a05620a210400b0078405cec4fcsi2213743qkl.605.2024.02.09.08.02.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Feb 2024 08:02:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e2MT8aSI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rYTJE-00011C-Js; Fri, 09 Feb 2024 11:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rYTJD-00010a-BP
 for qemu-devel@nongnu.org; Fri, 09 Feb 2024 11:00:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rYTJ5-000643-D5
 for qemu-devel@nongnu.org; Fri, 09 Feb 2024 11:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707494449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QxQRqeD5R4FqRYgOoa9wzRCV8FjwfJNCmsAutTGLf2I=;
 b=e2MT8aSI+XoXOLj1UCpuoNxVd3bv/fai0dtKmBXzFrsrgddUwg+3eEucm42CgcWEl5JZt7
 LSkLJBqR2omlr1LFbD2QU9fUm2w3e72HQapA4M1LeD8hfDB/8v8AVRWgBd8jThTzemOzTU
 o5EBZ+L6T9QRPcpCpfwVsvsAJIQIrko=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225--uZBVLcIMreMDi74bIrkTw-1; Fri, 09 Feb 2024 11:00:47 -0500
X-MC-Unique: -uZBVLcIMreMDi74bIrkTw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C86411BB5E7;
 Fri,  9 Feb 2024 16:00:46 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82D64492BC6;
 Fri,  9 Feb 2024 16:00:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, haibo.xu@linaro.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com
Subject: [RFC v2 1/5] [Placeholder] headers: Partial headers update for NV2
 enablement
Date: Fri,  9 Feb 2024 16:59:13 +0100
Message-ID: <20240209160039.677865-2-eric.auger@redhat.com>
In-Reply-To: <20240209160039.677865-1-eric.auger@redhat.com>
References: <20240209160039.677865-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.269,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: yNjFyByQ1x11

From: Haibo Xu <haibo.xu@linaro.org>

For now let's only import the pieces needed to run NV on KVM.
Later on this will be replaced by a standard and comprehensive
linux header update using scripts/update-linux-headers.sh.

For now the changes are taken from
https://github.com/eauger/linux/tree/nv-6.8-nv2-v11

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
index 549fea3a97..5af601d7b8 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1197,6 +1197,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
 #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
 #define KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES 230
+#define KVM_CAP_ARM_EL2 231
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.41.0

