Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5870454njd;
        Mon, 28 Apr 2025 03:28:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+sdVTCHRK+5+L4BpX9Sft3lUkUwpHq6UQbNo3ogcn8Hzn2WWLsLvNzWXkXLJsbv0WF3o51xw7SZkazw==@linaro.org
X-Google-Smtp-Source: AGHT+IF+VhjZfIHw6NhEO4kUM5f3l1FNhf5hB2I2DURpjM5v0wyPxZk63BBxSkwS201ZgHCYYR7Q
X-Received: by 2002:a05:620a:2591:b0:7c2:f39d:d0e0 with SMTP id af79cd13be357-7c95859b732mr2479975585a.3.1745836122567;
        Mon, 28 Apr 2025 03:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745836122; cv=none;
        d=google.com; s=arc-20240605;
        b=etXmwvQRXK0LfUhTY0L3MMqwBVfMySisrhUJwdRlVAxDylWU8ZknFr+HNmQPeWVMNY
         9LUvVYnradvK2e5yuZfLwog+oaL2pAzBVvrNG64sYTQFobMu47SrNY3VbKdJhvqnjVb+
         yYMWlQkLBKBG+ry8+pr+Hy+cTpRbDaa0YVn7GJ4OaoJEGI2dGTdVL6jLxkDTDgBw5RlD
         Y1E9o419zEx6O5qLIAMbmGx04hFBTnAjnwGS7DO9Ra6XYp8OrVweD2YKphjkta3KTr+c
         kumhl4rYuLXZv3idIYYygHnSNHa8nba12gqFHeYhIILD/cQv3EBNTshKdb2vhseLmCnU
         vjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BFhhKtuB/GLN0X0tr2Wjb3qJ1u13+DKgZlyOT3giFE4=;
        fh=+sxB8NkS+xL+1QwPgIVnaMhN8Q9GX11v/uLdEosqQQA=;
        b=ExmsDc7rgzU3DD9wJdiE0rR9jbLA3Xp0Pwvi7wTD0GtjDuIulze46StkR+CQpoY75T
         gzRrtnclRD6GdcCGM+4T9ct0/ABkEhFu3Wb6h9Fd1oVFLtselYq7yBB2eBjCYtFzaJRQ
         TKeuAVZk6GXuIJn267sLPlSYNEULW2hUHrUDzOmTtSxTrlYYtnp9OllvyLArMUkgkETZ
         6HBLFpAVwmcGvpPHTtp7iUJ/gUjGUZNNQKRV9/SGPj27FWaf0Mfj2k6JSsGwP5uUSs/q
         zbO5/aO66KNcrht8iUKjzOysJ3MinjY01UvMVKS7HxCya03M4m36KY7oY5USmmYi6T0V
         QmSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R+0WiTRM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958ea2a62si939720385a.386.2025.04.28.03.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 03:28:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R+0WiTRM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u9Lhb-0006vo-9d; Mon, 28 Apr 2025 06:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9LhV-0006YK-OL
 for qemu-devel@nongnu.org; Mon, 28 Apr 2025 06:27:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9LhT-0003Hf-Um
 for qemu-devel@nongnu.org; Mon, 28 Apr 2025 06:27:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745836019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BFhhKtuB/GLN0X0tr2Wjb3qJ1u13+DKgZlyOT3giFE4=;
 b=R+0WiTRMskL7PnUeoCAixKOU86VH040zLsispwP3Z73OCe3JEuGD3fHv9jnrrmxFK9xShH
 t8MO5tqrcYkHiR/7zY0M6NRPKO4Zl7JpEm3I4nHqfl34sDdVgl8eNKqsGoD21pren3qSPa
 9J/PV4d3roeXB2lXiccgaW8oQ3Y18l4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-9okCYOIxOOiLXrqWHhbq1Q-1; Mon,
 28 Apr 2025 06:26:57 -0400
X-MC-Unique: 9okCYOIxOOiLXrqWHhbq1Q-1
X-Mimecast-MFC-AGG-ID: 9okCYOIxOOiLXrqWHhbq1Q_1745836016
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 55B72195608C; Mon, 28 Apr 2025 10:26:56 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 700B7180045C; Mon, 28 Apr 2025 10:26:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com
Subject: [RFC 04/24] hw/i386/acpi-build: Make aml_pci_device_dsm() static
Date: Mon, 28 Apr 2025 12:25:30 +0200
Message-ID: <20250428102628.378046-5-eric.auger@redhat.com>
In-Reply-To: <20250428102628.378046-1-eric.auger@redhat.com>
References: <20250428102628.378046-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.492,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: ZaExqgIwzsDG

No need to export aml_pci_device_dsm() as it is only used
in hw/i386/acpi-build.c.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/acpi/pci.h | 1 -
 hw/i386/acpi-build.c  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index 6359d574fd..ab0187a894 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -36,7 +36,6 @@ typedef struct AcpiMcfgInfo {
 
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
                 const char *oem_id, const char *oem_table_id);
-Aml *aml_pci_device_dsm(void);
 
 void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
 void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 85c8a8566b..864f6b5bf8 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -338,7 +338,7 @@ build_facs(GArray *table_data)
     g_array_append_vals(table_data, reserved, 40); /* Reserved */
 }
 
-Aml *aml_pci_device_dsm(void)
+static Aml *aml_pci_device_dsm(void)
 {
     Aml *method;
 
-- 
2.49.0

