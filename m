Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp246827lfq;
        Wed, 30 Sep 2020 23:17:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGLsYnizsWzLYvTzDEHMO2nrxHsJBQmccn2GXwY3ZxGf2WH7btCJ61ZJzxIHpKGJBqUi15
X-Received: by 2002:a05:6902:50e:: with SMTP id x14mr8315357ybs.273.1601533067350;
        Wed, 30 Sep 2020 23:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601533067; cv=none;
        d=google.com; s=arc-20160816;
        b=0MO4FvrdlusaqhKMpw/5Aowr/s6lldAdpSgzGbT+iwGGjwT3BPgMTVeh/Cj1x1fdQ8
         MjUTpHHz5n18G+aiHXkyqZtB3MX4vmI+OM9b28tMpswo4ARDBvJF1F+jkN5tzDtQhhh5
         9rp28gz98nFi4j4dnibuVmv+d2S7Sic11kITJhk8fPJtTJHQ7Lr8V60MDcLj/8VAArhz
         IUjiQcjie6fF0D7H/nI5P544EE259DCdegEvjw5r6TrO1xQK07l2Efp9j4oInoLmOHuw
         N3kqGns2gPDTNHR/7/8lzTDsVfcHgleDOLwZ9OfYlQ4NYEqlsOkYayBMzEmKz4mVzFqI
         Lggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ieUA5yF+LXhcrhfytruIU7n15HTff8gqNaSJB/pnLxM=;
        b=mi28FgOwSG/Fs8Z7GHxjOakT4CfIjN0Ayr++1olUAfMWbNI+EyST/IuN5yewDNmbJU
         W8W4GrIqZR0d70nqKWa3N6vzzbw5aqwp4sSIpw8QQh6TMk5l+0m2E+aVNV3LmoVf2qDs
         /aDrXU6OFS2dO6vp7NQx1C+6b1VgrqmaT5p8L8qj5rowBZeHDeeADY5m39kmP/Vk2wIn
         u1dHKWzrC/+bG4qysfpAeVbsZPNnjH4MD5V9Wy+Pxj41fZuEI4QVGY7FUUNGuFSULOlw
         XL7Ppg7jJAPK5dGYjt4BpmpFrnyVwgEKAoG10baBx+QfR5tg4MG4UG3e5PyM9yEZgTQ/
         7lng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Sy3znG4y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19si4065690ybg.133.2020.09.30.23.17.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 23:17:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Sy3znG4y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNruT-00049X-96
	for alex.bennee@linaro.org; Thu, 01 Oct 2020 02:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kNruH-00047m-5G
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 02:17:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kNruE-0003rC-3I
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 02:17:32 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601533049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ieUA5yF+LXhcrhfytruIU7n15HTff8gqNaSJB/pnLxM=;
 b=Sy3znG4yPlvqcJw7Fw9oELRf1O64vtzYYCZh0vAgRUYDP/XpKSC7/UQUMgaQuPyR/mFZ5a
 QoZSGu/7zxOZZffJgjKGekBsBteTwIq6pdfcFS81RB+1HeLu70cfPNYKkKjX+INxhZ958j
 PxJn8aBYfEO8HpUD84F7trMiGJBtaE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-H-sVKAD4MY24D7GRkCZAHg-1; Thu, 01 Oct 2020 02:17:27 -0400
X-MC-Unique: H-sVKAD4MY24D7GRkCZAHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEF148030B2;
 Thu,  1 Oct 2020 06:17:26 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C4E35577A;
 Thu,  1 Oct 2020 06:17:25 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 1/6] linux headers: sync to 5.9-rc7
Date: Thu,  1 Oct 2020 08:17:13 +0200
Message-Id: <20201001061718.101915-2-drjones@redhat.com>
In-Reply-To: <20201001061718.101915-1-drjones@redhat.com>
References: <20201001061718.101915-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 02:15:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zHj86XVT2IVC

Update against Linux 5.9-rc7.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 linux-headers/linux/kvm.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 6683e2e1b0a0..43580c767c33 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -790,9 +790,10 @@ struct kvm_ppc_resize_hpt {
 #define KVM_VM_PPC_HV 1
 #define KVM_VM_PPC_PR 2
 
-/* on MIPS, 0 forces trap & emulate, 1 forces VZ ASE */
-#define KVM_VM_MIPS_TE		0
+/* on MIPS, 0 indicates auto, 1 forces VZ ASE, 2 forces trap & emulate */
+#define KVM_VM_MIPS_AUTO	0
 #define KVM_VM_MIPS_VZ		1
+#define KVM_VM_MIPS_TE		2
 
 #define KVM_S390_SIE_PAGE_OFFSET 1
 
@@ -1035,6 +1036,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_LAST_CPU 184
 #define KVM_CAP_SMALLER_MAXPHYADDR 185
 #define KVM_CAP_S390_DIAG318 186
+#define KVM_CAP_STEAL_TIME 187
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.26.2

