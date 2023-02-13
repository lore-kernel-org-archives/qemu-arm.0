Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3999862ejb;
        Sun, 12 Feb 2023 16:41:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/REKL+aAYmHR3Ma3Vx8ZzRFL8JKMks1wvqnjcGQTwjZADZxk5kzEgS4TTSoZgbOfIV3MOl
X-Received: by 2002:a05:622a:38b:b0:3b8:6215:789b with SMTP id j11-20020a05622a038b00b003b86215789bmr40520779qtx.35.1676248873780;
        Sun, 12 Feb 2023 16:41:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676248873; cv=none;
        d=google.com; s=arc-20160816;
        b=wMR/TbzHW//mZ04GenU7UPrASnOHjCojzHQQVMVzJ4Fsni+3rNIpUC5NYJNcNUqvOY
         fHwjqiVniMfveDIWfQk9YC/4SqPYo5NWYOOWep+0AyIuyEhBItH7VBze28xQ9Tecr9Ti
         djT+TdtwCF/Sszn1/8oSfgU+kjnWsLeZcJWNiyziWDJhYNnfXv/T4nRuyLk2YASOyl7M
         grLbbUV+Eeby/XFF11q/rH+zq89c5zXMkbrnpSuB1H6e4uq3GC3s62ye40Kk4q1cSmo1
         zIT13MG4DXt7kRD80/w6r08RguPAXROpYxHI5FJgmJokOZyGZzrx+pqmtVK5UTW6ndB8
         TfRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a7SKC2TVqKQzjslWVnkLc/vK9me7ZpW6UmUARx4xlI4=;
        b=SbuPkWilCX9+IUpgisUwP+XtEUN0kUJRPfoJJPg+bBeolTH9zoJBrXk4eOdaTZwtfa
         y8k5PS/y8C1LZuATIrblRshnepZPJgF6GNVv5RWjP7lxgSe+OTi0wrtG9RwjiGc01rDg
         suddTGEFBbQiN5Wp1zdaPHnyCPogzNGHnvq7c0CKPTZuNwLDFI+CVB7jpltQiSJ1pT+s
         ccjc6Wb+D1DBQeJ14zpeAOty6yYZr0sqgyasOB1vxvCyHGK62xFlBTimc/VvkJ4DnZAV
         1xDOHhdyzf9Yk68QnpKWMALlkp6erj9dWSk6sEM8prAhkZ84KX2eJeoCbwXtnuetbZ7v
         90zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cNi0FFh2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11-20020a05620a248b00b00706538a0dfasi9039064qkn.179.2023.02.12.16.41.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Feb 2023 16:41:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cNi0FFh2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRMtA-00006U-FR; Sun, 12 Feb 2023 19:40:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMt0-00005M-5r
 for qemu-arm@nongnu.org; Sun, 12 Feb 2023 19:40:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMsy-000334-3S
 for qemu-arm@nongnu.org; Sun, 12 Feb 2023 19:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676248799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7SKC2TVqKQzjslWVnkLc/vK9me7ZpW6UmUARx4xlI4=;
 b=cNi0FFh2QyauOokBSsOjt0w9LZBkZAjV7swumFjC1kugiu908rlCcQFggB1zWSXe4phYpc
 W7x/CwZ6aY+W95iGkeKWxqe4awh5t1w7fcEa8y3iV2h9BMDQY8GWh77z/fg4opPQCLX/tf
 /rgv+mOqDo73Yztyv1oMutCNRJZ2EN4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-wlEudgQ9NKG4q-XBNpI3tA-1; Sun, 12 Feb 2023 19:39:53 -0500
X-MC-Unique: wlEudgQ9NKG4q-XBNpI3tA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19AD6185A78B;
 Mon, 13 Feb 2023 00:39:53 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-114.bne.redhat.com [10.64.54.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE694401014C;
 Mon, 13 Feb 2023 00:39:46 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v1 1/6] linux-headers: Update for dirty ring
Date: Mon, 13 Feb 2023 08:39:20 +0800
Message-Id: <20230213003925.40158-2-gshan@redhat.com>
In-Reply-To: <20230213003925.40158-1-gshan@redhat.com>
References: <20230213003925.40158-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: uTzj0JTuJEhb

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 linux-headers/asm-arm64/kvm.h | 1 +
 linux-headers/linux/kvm.h     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 4bf2d7246e..a7cfefb3a8 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -43,6 +43,7 @@
 #define __KVM_HAVE_VCPU_EVENTS
 
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
+#define KVM_DIRTY_LOG_PAGE_OFFSET 64
 
 #define KVM_REG_SIZE(id)						\
 	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index ebdafa576d..5b4e0e4e68 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1175,6 +1175,8 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_VM_DISABLE_NX_HUGE_PAGES 220
 #define KVM_CAP_S390_ZPCI_OP 221
 #define KVM_CAP_S390_CPU_TOPOLOGY 222
+#define KVM_CAP_DIRTY_LOG_RING_ACQ_REL 223
+#define KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP 225
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.23.0

