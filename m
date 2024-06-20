Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1759991dlb;
        Thu, 20 Jun 2024 10:01:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUB7c6Prxab9L/b8Jsm4dwglyJKuT/mvKUcIJ/M8prt0CkFEOGSexhzo1SjJk0hSenvIACUvZ7z5Q/gRQrUAwdl0VB8Zt2a
X-Google-Smtp-Source: AGHT+IHVgopswdvRWj/osHoUVtwpjsAJMrVUGl+0Y09ZOxtpMrvuHGwNdvWm3F4R55TBxcwBEVyW
X-Received: by 2002:a0c:f848:0:b0:6b5:b29:82d0 with SMTP id 6a1803df08f44-6b50b298567mr45672206d6.49.1718902879339;
        Thu, 20 Jun 2024 10:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718902879; cv=none;
        d=google.com; s=arc-20160816;
        b=cFraDzsZGQk5NiKI09sst+HuSa8K9Lp23ZYE9nPfNu+V1hIU6R2jAK9G7MJZc3MVq5
         7o6hmi0Jj9yvk4831ptKsoTJzaWOKllApKqsxhQPFADjwRZRQ+saRM91B9oHxYDf4bWC
         WOXiupUwkwHPeNU+lIwEsjt5IPe9s0QJkWQP9oacayJncd1hkzGVcfTbVIqXlBMpU2x+
         c21ITTtoWSLcB5+ILWKM2Y4fivYYmjn0T9X1K99ymydZ/8SwFupqey4GoYD1XcNDpNg8
         w/0pWp8JeRWq5rJDgcgnxVgerv+1uwE0MYVHzr5ZnAAu+6n33/hetojuazD9WSCVsOvi
         H+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PCqeEU9R0Lgk24EKtyhDUIszFvtS8XZ0+TYWM5rTnZ8=;
        fh=3Wd8C5ILZWfK4GrPw00UkAAsfCUTnUYMb3cFGB6sOew=;
        b=xBA1FZGIjYJ+eqzSLE2oEbyu+0nn9DMrdfyDXdGQ/lPdi9Y5+sPDvkIgPZ3hU8wVZe
         yokw3miCRI8K6p7RK94q4bSX2orZzCeePaN1wFDwInHcpq3cX8ReDmea9wwp+96+ni5s
         We+BbkJicVSOTggIaL2+faWpax8LgnNf6qqD75arV+5JNm6Qilg4qVmBxfXWsO6sP0V8
         +dgGdGy8iZ7xB+16eEmfr4igLwTlPDXhV+G8wZdP3BNTsPN75CFBJ0cJ7VtV8NI5AWwS
         sXkMmNDCuSeey7oCZtWMfLHm94GMmf7dHZuJlAe90VFnKcBTXrNrHoNPERJ6a+NXfxx5
         v9xA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BJdOoQv9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5b9940esi174902436d6.614.2024.06.20.10.01.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 10:01:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BJdOoQv9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKL8Z-0000WG-2v; Thu, 20 Jun 2024 12:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sKL8Y-0000Vx-Fu
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 12:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sKL8X-0001CX-2V
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 12:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718902788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PCqeEU9R0Lgk24EKtyhDUIszFvtS8XZ0+TYWM5rTnZ8=;
 b=BJdOoQv9y/4TMm1Blm3+t94kM3KjMQtCnxW2A3MxtpRcrVT0xii/KxTZpTO84NWdQcX9cC
 T7SlHp/eXbRd9pWyrDMSE36ZgWfK8MDagQr5AOGb5rDNUDibli0DfR0DU0jNtN/Sttz5s9
 9hZ4hDJiNXyIXXknbNbTHUyk14JfHlQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-149-5SNyE9TDMKm-lROsNJGFWw-1; Thu,
 20 Jun 2024 12:59:44 -0400
X-MC-Unique: 5SNyE9TDMKm-lROsNJGFWw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5AC3419560B5; Thu, 20 Jun 2024 16:59:41 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.42.28.69])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C4E9E19560B0; Thu, 20 Jun 2024 16:59:32 +0000 (UTC)
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
Subject: [PATCH v2 12/14] hw/ppc: remove obsolete manual deprecation reason
 string of spapr machines
Date: Thu, 20 Jun 2024 17:57:40 +0100
Message-ID: <20240620165742.1711389-13-berrange@redhat.com>
In-Reply-To: <20240620165742.1711389-1-berrange@redhat.com>
References: <20240620165742.1711389-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
X-TUID: 3v5ist7iFUyp

The automatic deprecation mechanism introduced in the preceeding patches
will mark every spapr machine upto and including 2.12 as deprecated. As
such we can revert the manually added deprecation which was a subset:

  commit 1392617d35765d5d912625fbb5cab1ffbed8e140
  Author: Cédric Le Goater <clg@kaod.org>
  Date:   Tue Jan 23 16:37:02 2024 +1000

    spapr: Tag pseries-2.1 - 2.11 machines as deprecated

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/ppc/spapr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 044e6a8d9d..98fa3aa6a8 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -5156,7 +5156,6 @@ static void spapr_machine_2_11_class_options(MachineClass *mc)
     spapr_machine_2_12_class_options(mc);
     smc->default_caps.caps[SPAPR_CAP_HTM] = SPAPR_CAP_ON;
     compat_props_add(mc->compat_props, hw_compat_2_11, hw_compat_2_11_len);
-    mc->deprecation_reason = "old and not maintained - use a 2.12+ version";
 }
 
 DEFINE_SPAPR_MACHINE(2, 11);
-- 
2.43.0

