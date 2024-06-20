Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1759708dlb;
        Thu, 20 Jun 2024 10:01:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2Q2SGoWCe9Qg95DwLoYTy4ti+wNTA/L5WhUv9aWgjh5kI0fMMEqBF6oGlYlrL+pZMYO+ijK8hIUPFdfqZUWQSixuqnvDh
X-Google-Smtp-Source: AGHT+IHjKC4tKIcRPCVzKMWDQoxr0PpWsAEGAGOJWQWhwN0/FySOn5bJRDwTjzRcEyKcGSXc7Byj
X-Received: by 2002:a05:6870:d889:b0:254:948e:bf08 with SMTP id 586e51a60fabf-25c94a1d597mr6819062fac.31.1718902863393;
        Thu, 20 Jun 2024 10:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718902863; cv=none;
        d=google.com; s=arc-20160816;
        b=Ix9XmTU3MAdM9Rd4mQiW5TuFHHYlBa73BBgSsU+7t7445B5pxL02LrgPPMVipN0kgJ
         T6J6WuMHQhMTQhxICVqpdZR5yB5N4O3gFz8uVqkYVd1a1VWoKD1YNBmVDXnBbj49ujwV
         KigIs3TUjWWAu2Ty6OwKKvkZuE/TGqXuLLCK+PVCMxzNElZMbuZgRh5arKX8Hyk562j5
         mIc9+6rPC0nOCBXQQGuEuvTdWe5qzvYapq2VfSEqFvsgmJuippRc6kVaQxyBvfeerPjH
         QbfhVDuIhh28xYrVJGvMzk0BlVBKvVRMtMOcE/qlX0f7luaSpvf5aW3it4Sd5VtVFHIS
         5dhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6z+0EL1JZTnHpwLYAG/nApKKGSfdaAKYBCaJ5wx9O1A=;
        fh=3Wd8C5ILZWfK4GrPw00UkAAsfCUTnUYMb3cFGB6sOew=;
        b=ASlXGC5ltTn03r8baCOh59l0a8nUtH+MiIjqTnTXx76XXxQvG7h3lXTNmHxua6Ha/3
         i5BIb30QfAuyzGAVUOJ1Ir2P/YwoO3d3RpX3CS/ypiVupPPkl8hXDrt5y8TcIC+T7sXx
         tqwV0s9E3SeAsAwFNqcVv9ZZ6G0cUPuVoDibaB130gq+547MDp8vhXhwspr2iABEL0iE
         66rWo1K8yK/3eCzq7m1WPCHoYrr1Udc1eFBD3jlT1I8q2ZeJRdqrU/Mu+BNzgILcJXxm
         UTLKZC+DOCPY5C0hX+tfoKddDJ5ZSCJ2Wn3P7p76nSeBONmvz5+KGVMAvJB76khKKslb
         HRAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FF2LaOZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48da43c4600si2705692137.231.2024.06.20.10.01.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 10:01:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FF2LaOZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKL94-0001O1-IX; Thu, 20 Jun 2024 13:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sKL8m-00018u-2e
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 13:00:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sKL8j-0001E0-Jk
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 13:00:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718902801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6z+0EL1JZTnHpwLYAG/nApKKGSfdaAKYBCaJ5wx9O1A=;
 b=FF2LaOZW5AfbpmYL4+QG/rcrAn6acWdRd/emRqQMATrikigOF/Z5hsAnZMBD7qUF8aDlsc
 Nn8HVNigR07Qf4eXzh985LxP4n7mTNW3nJ6YaVwoFjTf4bU1wuJRBAnkEW+sKOiDk2Pdy6
 IoWqsmHXPpVg3uxK3favhuCbYdZjd88=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-240-RZf7vTpZPfGheaoTQ67l-Q-1; Thu,
 20 Jun 2024 12:59:54 -0400
X-MC-Unique: RZf7vTpZPfGheaoTQ67l-Q-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F0A8C1956083; Thu, 20 Jun 2024 16:59:49 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.42.28.69])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E0E9919560AF; Thu, 20 Jun 2024 16:59:41 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, devel@lists.libvirt.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clegoate@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 13/14] hw/i386: remove obsolete manual deprecation reason
 string of i440fx machines
Date: Thu, 20 Jun 2024 17:57:41 +0100
Message-ID: <20240620165742.1711389-14-berrange@redhat.com>
In-Reply-To: <20240620165742.1711389-1-berrange@redhat.com>
References: <20240620165742.1711389-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.152,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 6YP67ieQ7nT/

The automatic deprecation mechanism introduced in the preceeding patches
will mark every i440fx machine upto and including 2.12 as deprecated. As
such we can revert the manually added deprecation introduced in:

  commit 792b4fdd4eb8197bd6eb9e80a1dfaf0cb3b54aeb
  Author: Philippe Mathieu-Daudé <philmd@linaro.org>
  Date:   Wed Feb 28 10:34:35 2024 +0100

    hw/i386/pc: Deprecate 2.4 to 2.12 pc-i440fx machines

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/pc_piix.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 5705d6e155..9445b07b4f 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -688,7 +688,6 @@ DEFINE_I440FX_MACHINE(3, 0);
 static void pc_i440fx_machine_2_12_options(MachineClass *m)
 {
     pc_i440fx_machine_3_0_options(m);
-    m->deprecation_reason = "old and unattended - use a newer version instead";
     compat_props_add(m->compat_props, hw_compat_2_12, hw_compat_2_12_len);
     compat_props_add(m->compat_props, pc_compat_2_12, pc_compat_2_12_len);
 }
-- 
2.43.0

