Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp1365078dlb;
        Thu, 8 Aug 2024 20:53:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWH905ifOeBXiMoFZjCIs1IhA9PHNgeCB1eXrqqfUBSbrbR3mdF4WY+gu0ViE5IZD6jqNpQMgHefUwPjq/X6fq4yaL7CZRe
X-Google-Smtp-Source: AGHT+IE7PzTjjv673yLD+Npf350ti3VtZNeWuaTbewXWy9Y6Zc2LusxxJhiF+OT1LNqIIF991V35
X-Received: by 2002:a05:6102:2ac5:b0:493:c3b2:b5ba with SMTP id ada2fe7eead31-495d83d2666mr332007137.6.1723175606233;
        Thu, 08 Aug 2024 20:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723175606; cv=none;
        d=google.com; s=arc-20160816;
        b=KmnexR9PczUj663CIrEDnOiAGBAwa6NT+RjFmB+u1/U2C993qVsrUt3On7BZJ1ZuPD
         KRXsn+yh2y2pDwRLHEFOP2KZ0uGIcrA58ztGbnEdZZPjTUOJ6l2qTcv8l49rVNX7lpL9
         zephVrSbwLOdCOzN3x9kGdevJvwvWgv1QrzXqqkxBngNqG/35jJAzOHpaJBwUnl9nJVQ
         pup09pKt2Kd+GzwIc5M9StwUBfWus+M0vmUkAUFhlmIW66dpY3zkCrSWds56ghQ2QEyD
         YCyWCMHZeAcRsxVb8Y0fXRBdeducagkr/61VVS3mDlvp8Gepxthzx4e5yF4qOXWsK6yf
         CvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4k0H5Hflq+fZeTxxuN1fp4nLwX3JGjh6VdgBQuWFXfA=;
        fh=XX+dgkgF1NhCVN+iBAG+rOLypjsAs0LmRKXD2YPrEGE=;
        b=MVIi8ysEbl6hPwMr4B7/Ox4AGjglioxps7y4FxgBElImw9CCjH0ZAxqvRKFimbb7Pc
         7k1RAXZXSQuFLKTC9LepCv7HDONaBb8NAE8qkV1Ut1WJqKSCJxTfZNvgGyKrglg0nKUk
         7jaWw+TXusgttW6n/1A/z7iXTlNf+smnCiEk5GgxuSs91wF1owQ3JMOBDh2Fd88utbNh
         D/5jSJMNnDAnTkos9l/1z1oPX8ilEuUDnOGm7bQvVWW6G9y3fJW8uVGL+ahAcG3uvn1A
         nBSGyTkqQKxlEj785l7lfKQUAihMeHIvTGh4kCOeHDPw5C5oJy9bhItL9fUGTqxnzSS5
         hI6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F8VVb7ts;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb5f8654si60821066d6.77.2024.08.08.20.53.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 20:53:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F8VVb7ts;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1scGfl-0008I2-3r; Thu, 08 Aug 2024 23:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1scGfj-0008Cp-Nz
 for qemu-devel@nongnu.org; Thu, 08 Aug 2024 23:52:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1scGfi-0008Mj-6K
 for qemu-devel@nongnu.org; Thu, 08 Aug 2024 23:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723175529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4k0H5Hflq+fZeTxxuN1fp4nLwX3JGjh6VdgBQuWFXfA=;
 b=F8VVb7tslVSZdf8yL1UmxcAuEZHSvEWkMAq+ZufFHN2+A1whtmdGhrGIdKguZ+LKRXVxB/
 EAot/E96IJJd/kimhFx1gHQHdKONxqO/Fr2g7WFkT8LIIFz1qtwmlOBlUK17nxELOnZzjq
 hx0Wo1BJwcJTqtYqJRXnv1lJdvDAANA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-rpWT1NAfPECsJr7eUah1Ew-1; Thu,
 08 Aug 2024 23:52:05 -0400
X-MC-Unique: rpWT1NAfPECsJr7eUah1Ew-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E2F0319776AE; Fri,  9 Aug 2024 03:52:03 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.remote.csb (unknown [10.64.136.133])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0ABA41945109; Fri,  9 Aug 2024 03:51:59 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 philmd@linaro.org, richard.henderson@linaro.org, shan.gavin@gmail.com
Subject: [PATCH 1/4] hw/arm/virt: hide virt_kvm_type() on !CONFIG_KVM
Date: Fri,  9 Aug 2024 13:51:30 +1000
Message-ID: <20240809035134.699830-2-gshan@redhat.com>
In-Reply-To: <20240809035134.699830-1-gshan@redhat.com>
References: <20240809035134.699830-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
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
X-TUID: LC/D/MYpK2zP

virt_kvm_type() and mc->kvm_type() are only needed when CONFIG_KVM
is enabled. It's reasonable to hide them when CONFIG_KVM is disabled.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 719e83e6a1..83be57db37 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2991,6 +2991,7 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
  * for arm64 kvm_type [7-0] encodes the requested number of bits
  * in the IPA address space
  */
+#ifdef CONFIG_KVM
 static int virt_kvm_type(MachineState *ms, const char *type_str)
 {
     VirtMachineState *vms = VIRT_MACHINE(ms);
@@ -3025,6 +3026,7 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
      */
     return fixed_ipa ? 0 : requested_pa_size;
 }
+#endif /* CONFIG_KVM */
 
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
@@ -3084,7 +3086,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 #endif
     mc->valid_cpu_types = valid_cpu_types;
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
+#ifdef CONFIG_KVM
     mc->kvm_type = virt_kvm_type;
+#endif
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
     hc->pre_plug = virt_machine_device_pre_plug_cb;
-- 
2.45.2

