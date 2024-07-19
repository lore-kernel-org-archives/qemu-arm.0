Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp573597njc;
        Fri, 19 Jul 2024 09:50:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWb/MEmbO2c4cR3nq7VZJiFDVvHGDFr8HngM7/IV/P+C3EuHtIBfKt3d9clkqDYdrutfy+LCWvnIAAFiRsDRAwAmMuHZgDK
X-Google-Smtp-Source: AGHT+IHMEpZc5LRVwkyZiuxiihQULPzF+LmoFS7vUpeoEznnCOSF+Yv8+iGzfRHjfA/0dMx0/n3g
X-Received: by 2002:a05:622a:1214:b0:447:f1f9:7154 with SMTP id d75a77b69052e-44f96a3b082mr73629611cf.11.1721407857721;
        Fri, 19 Jul 2024 09:50:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721407857; cv=none;
        d=google.com; s=arc-20160816;
        b=GweN78wIM0tarWrlMzELhhVA1L/nzPGWkcJCJxSioOLK06+wl/ITXEELjtMmABFnhx
         QjsRsASG40lyKCSgLfWpLlXjXA79ifYC+y5uVxkcpHYGzIdl8hPAvb9c9DV9rVVeIRbO
         iyrWHbG88MBWqU2Ab9yxQOW5nAtYLVNJWCoF5vJfPvhQxCVJSEKPG9Qsdg0whgPfXT92
         4Chm+75+vCfNHdpuJgLcBlv+Flbm0Oh9bVLLqUzITqXXgveR94MympFu5JA9DQxsovg+
         bofbxwhJ3FCNvZu6Ynml8SlzpQTGVmuAWtMBQO41RT/Kz4adrjLxNtTY1+nnY7ty0TN9
         P4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=fDGEhgETPFGWm1mU0kUKJSfa5SsMMKk3fUWrUk/6QkM=;
        fh=kUMkaIlncV9DxbQ+jgSmOKbZq9wtOJXnEwnwTxxnd/k=;
        b=0+CToRBCOnd7KA677nugB2c6t9UptP1LqtNnRXOKM+gidqOCHQw6zaTpAvT1l5AW1c
         smV8sTNt/LNIpww7CjvhV/eY9X4n5p2G8BqytYZZv8DNfk1+UxPXXpkRruWkPo1psdSv
         q5WIue8k6Q6yPS4zVn26yL3c4Z1Wa8SzwvfsltxXr4DIYlY7cnfSo3zzw5KKP8HGxS0g
         eE+c076s6FEoqv4J6YrKvnvfz1qZEEISMQ0ScSraGTpuOPr9hikaX2XtNfCJNHJjSnxQ
         Z034HyYcbcg5BkoVCx8y3fu/8R8+XZFMj0xLoqN/puYy/p/UpTzbpu2IoZXmBvJ45B8h
         JuRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UKRQ4YKY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac9e8da9si20138026d6.400.2024.07.19.09.50.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jul 2024 09:50:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UKRQ4YKY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUqoT-0002LD-39; Fri, 19 Jul 2024 12:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sUqoR-0002KA-Jh
 for qemu-arm@nongnu.org; Fri, 19 Jul 2024 12:50:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sUqoN-0007rI-J9
 for qemu-arm@nongnu.org; Fri, 19 Jul 2024 12:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721407824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=fDGEhgETPFGWm1mU0kUKJSfa5SsMMKk3fUWrUk/6QkM=;
 b=UKRQ4YKYo7n8TcLZO4guqtlWSRv9c3WLaYLfzXMQv2t5mEvXseLYOUJWgJg5RCPJcHTsSR
 DqSD2UnBlFc/DOKexgGZB0u5duYymfLl0zZKSPGhxkCtz24FGs1VuIfakA8emgyAtR6+Ax
 EljoQDroEajwZIXqmF7LCeoEQuEPC0Y=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-85-fDXLnDiLNESg4BvFu0uklA-1; Fri,
 19 Jul 2024 12:50:20 -0400
X-MC-Unique: fDXLnDiLNESg4BvFu0uklA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 85B9D1955D42; Fri, 19 Jul 2024 16:50:19 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.185])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 333891955F40; Fri, 19 Jul 2024 16:50:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, clg@redhat.com, zhenzhong.duan@intel.com,
 alex.williamson@redhat.com
Cc: yanghliu@redhat.com
Subject: [PATCH] hw/vfio/container: Fix SIGSEV on
 vfio_container_instance_finalize()
Date: Fri, 19 Jul 2024 18:50:11 +0200
Message-ID: <20240719165011.1751831-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: sKDdym+8+4Vw

In vfio_connect_container's error path, the base container is
removed twice form the VFIOAddressSpace QLIST: first on the
listener_release_exit label and second, on free_container_exit
label, through object_unref(container), which calls
vfio_container_instance_finalize().

Let's remove the first instance.

Fixes: 938026053f4 ("vfio/container: Switch to QOM")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/container.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/vfio/container.c b/hw/vfio/container.c
index 425db1a14c..d8b7c533af 100644
--- a/hw/vfio/container.c
+++ b/hw/vfio/container.c
@@ -657,7 +657,6 @@ static bool vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     return true;
 listener_release_exit:
     QLIST_REMOVE(group, container_next);
-    QLIST_REMOVE(bcontainer, next);
     vfio_kvm_device_del_group(group);
     memory_listener_unregister(&bcontainer->listener);
     if (vioc->release) {
-- 
2.41.0

