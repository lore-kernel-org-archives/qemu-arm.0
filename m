Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3116741lfg;
        Tue, 9 Mar 2021 11:54:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzbtvghdlcQjq6YxtrplNBOKaVtcFGgtSfTt37gK33DAWhk5sx8RuX7HTfSUyrAGq2ycuQ
X-Received: by 2002:a25:4e89:: with SMTP id c131mr39447017ybb.382.1615319663651;
        Tue, 09 Mar 2021 11:54:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615319663; cv=none;
        d=google.com; s=arc-20160816;
        b=vNCB2RkcsL3EJH+PXKI8pfdTqi0d68raTUlOtgoB4QjreVGb8iRhLg+Ozua2GZSxoO
         v93BMR1MvMlvCq2rZn1TLrvLpZQx1cjC6bmObYioH8jI8la2FUVQ4+WbR09P2HAMTUXN
         UjfdrwO8kLiWoI5XJDLizZSFa0C2EaNhxckhRIcsCsK8oXpgBU+QhYwPDQEruVriZfqp
         0Bw7sTmk49d9KkwgutLUMy2iHJeksKmg2RosHqNLcfI3/u+d3m4iRcV9hzcllVj9zUv2
         unsg5XoKfex5sOOZo15VcKzYT3gIpUKpSony3iS9tsuUcqMIlc/O4xdozcPwv+MM1JfX
         mm4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=+2P+jDYI8uJmCYQSvxJgwJwI8xgvpgieHgKFQEVdTW0=;
        b=iDpfJvZGnw7LBjJb/XGxJSqvUasStBLXTuIhejU/0Vgll/W1T3jSmQAI1gbbu0+nL9
         wpaDS0MHv7iMVKetFIHHTEfEk1iOJhBSHIYKKfPOkahP2L5gAdLmVXdoei7srdKA8BvC
         s9npB5cvJoaqL1H14pnCNFVW6JMZbQz9FMoAvyngUBsefuujplBQqGBjqolTTOXdHnv/
         aYG3z+PvSNkq4hs20+gRaoYYn9rgRuLTEzoGVE8VDVYsBBP+HTREkd0CKCstdSp8cJnE
         iiqw55M1pccaegn5+YSz5758dnGazzDKXGVww0bvyDAcbIypxqzEMFB+4wu4zZ6SdVJX
         gZRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=adb1LkmY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21si16163315ybg.196.2021.03.09.11.54.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 11:54:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=adb1LkmY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJiQw-0005IQ-V1
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 14:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lJhaN-0007bi-R4
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:00:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lJhaI-0005zS-CE
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:00:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615316397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+2P+jDYI8uJmCYQSvxJgwJwI8xgvpgieHgKFQEVdTW0=;
 b=adb1LkmYP+ltU2V4RjvdfMwi/vaeqWxeIB7v7STDVsWIXePD/o7+bEV+w4Pu0S3IsQfOjn
 4d1VYmhNJpI2CeY6vE0ElmlhK0FT6Lw4tNi3L8lMj+MuOXTmnJ85HLnIM3/cckc56TJvyj
 7Df7pAchTowpXHIBGcWOpcfstMLrFgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-ForYyC5_ME2apDWBRgwD2w-1; Tue, 09 Mar 2021 13:59:52 -0500
X-MC-Unique: ForYyC5_ME2apDWBRgwD2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CAD680432E;
 Tue,  9 Mar 2021 18:59:51 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A90B5C233;
 Tue,  9 Mar 2021 18:59:41 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/virt: KVM: The IPA lower bound is 32
Date: Tue,  9 Mar 2021 19:59:39 +0100
Message-Id: <20210309185939.188431-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, maz@kernel.org, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8cFSh0WP+d8m

The virt machine already checks KVM_CAP_ARM_VM_IPA_SIZE to get the
upper bound of the IPA size. If that bound is lower than the highest
possible GPA for the machine, then QEMU will error out. However, the
IPA is set to 40 when the highest GPA is less than or equal to 40,
even when KVM may only support an IPA limit as low as 32. This means
KVM may fail the VM creation unnecessarily. Additionally, 40 is
selected with the value 0, which means use the default, and that gets
around a check in some versions of KVM, causing a difficult to debug
fail. Always use the IPA size that corresponds to the highest possible
GPA, unless it's lower than 32, in which case use 32.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 371147f3ae9c..7bf563715b4e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2547,14 +2547,13 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
                      "require an IPA range (%d bits) larger than "
                      "the one supported by the host (%d bits)",
                      requested_pa_size, max_vm_pa_size);
-       exit(1);
+        exit(1);
     }
+
     /*
-     * By default we return 0 which corresponds to an implicit legacy
-     * 40b IPA setting. Otherwise we return the actual requested PA
-     * logsize
+     * KVM requires the IPA size to be at least 32 bits.
      */
-    return requested_pa_size > 40 ? requested_pa_size : 0;
+    return requested_pa_size < 32 ? 32 : requested_pa_size;
 }
 
 static void virt_machine_class_init(ObjectClass *oc, void *data)
-- 
2.27.0

