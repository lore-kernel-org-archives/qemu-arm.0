Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp475994ejc;
        Thu, 23 Feb 2023 00:15:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+fR2SfHuQimWPbVIkBivLnxGEyWoEjZ4Ds9dV28JlybfuRPK3h07SW4xr2/nOCecZq/OIA
X-Received: by 2002:a05:622a:18a3:b0:3b9:b565:981e with SMTP id v35-20020a05622a18a300b003b9b565981emr16563005qtc.4.1677140153799;
        Thu, 23 Feb 2023 00:15:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677140153; cv=none;
        d=google.com; s=arc-20160816;
        b=kHASWUMQX80CDBRlLhsIGWK0hFxGG5UxaBcKJlFCyOJfJhJBQ0SDwGDolrmud2bqt4
         AXuP3nyD+zO38WJYiEAcZJ4eY+71Qd3TaoGy8wr+7jgrKRnphPVHSJecGo9iQdYdEiAb
         KRympgYaU4d41/+xUIoEG7rI2hD7+wezaigDU16Lxfsyx7GT8D8RCRdnRmU5m2r7rb2H
         /oEQbGdPI2TH7iqQWSDbPZdTUSVZNI3O/aaKFvVD0T3eJwt9xf/OMhvBF13hg2s3u5Ul
         soNgvlmiFbYcfzLi9JO8EBznTNn0QKPuTijEXWy+9WxsRPSY/NMycQZOV6SNhwi8OcBL
         rOeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/wLL9544MFJuZn5ro6CESRAgbVJwuWFdQYsfjmY4xL8=;
        b=wK6tlkC5gduuCytNCL/ciBBnjPBmyYxu6zfjOvSeqNwdiUmBw1JLp1HtR3nzdcQcZk
         ibiszMifaCtsWlDJBNbMxiPSmbz0H8A2E209e6sr4Kg13f+FU8VH4eu3QscCa0/4OkeB
         AmVZvDPha1myy/3GOuDGW41Jc6mwUhccAB+yiITlwe2z+vivfNQ3X2C6xczfAqGXSJ2f
         qahLo/LoRdhWltau4/yxtshMRt95lwGCrhLdh0aaVgCY0W/o04Q4rX/gHTob0v2saskX
         7HQ5ZH7Qryr24s3zRmZNmD+V4/6R7kSl3gFNvBi83TOova05tnH0Yv8vBfrpgGz96jba
         WkCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B9K7GnKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18-20020ac85f52000000b003b82ce74ec4si16988046qta.131.2023.02.23.00.15.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 00:15:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B9K7GnKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pV6kg-0003dh-VM; Thu, 23 Feb 2023 03:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6kf-0003ct-DX
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 03:14:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6kd-0001HG-Pq
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 03:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677140091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wLL9544MFJuZn5ro6CESRAgbVJwuWFdQYsfjmY4xL8=;
 b=B9K7GnKCA9pjwqR1WGjxe9rbxLJzbQiwfSoYNa1mLpmhJRDGL1y1x2NhrDlzmPtfLoTAGd
 1E4gdC8dnf5SKtsXcY2e3E0uju2cmeeP+2VzfX7dg2rd8dhzVxBEm3qbWfapIcmbpZQO13
 jjfVuEZcRqHnrqnZ2+TZ87eyfN03jXU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-1eFz_WD9PGO_6RMfiLhVEQ-1; Thu, 23 Feb 2023 03:14:44 -0500
X-MC-Unique: 1eFz_WD9PGO_6RMfiLhVEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D02A85A5A3;
 Thu, 23 Feb 2023 08:14:44 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-168.bne.redhat.com [10.64.54.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A15B218EC1;
 Thu, 23 Feb 2023 08:14:36 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 3/4] hw/arm: Validate socket and NUMA node boundary
Date: Thu, 23 Feb 2023 16:14:00 +0800
Message-Id: <20230223081401.248835-4-gshan@redhat.com>
In-Reply-To: <20230223081401.248835-1-gshan@redhat.com>
References: <20230223081401.248835-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-TUID: tW5apB2OfaT9

There are two ARM machines where NUMA is aware: 'virt' and 'sbsa-ref'.
Both of them are required to follow socket-NUMA-node boundary. To
enable the validation to reject incorrect configuration.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/sbsa-ref.c | 2 ++
 hw/arm/virt.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f778cb6d09..1a87437017 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -844,6 +844,8 @@ static void sbsa_ref_instance_init(Object *obj)
     SBSAMachineState *sms = SBSA_MACHINE(obj);
 
     sbsa_flash_create(sms);
+
+    set_numa_socket_boundary(MACHINE(obj));
 }
 
 static void sbsa_ref_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ac626b3bef..9d9f26626c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3210,6 +3210,8 @@ static void virt_instance_init(Object *obj)
 
     vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+
+    set_numa_socket_boundary(MACHINE(obj));
 }
 
 static const TypeInfo virt_machine_info = {
-- 
2.23.0

