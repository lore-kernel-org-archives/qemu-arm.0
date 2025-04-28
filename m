Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5871735njd;
        Mon, 28 Apr 2025 03:31:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURMsEq7xby3zpvvYQxbmNmttwf1nzepUXw97qVVjqIDKJNqCvS7Ozdj8Yyb9492elbiz0Qd5wAcIFxbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG6MKae1+mxfIEL2PtH605rGrbHlmIjMuJQvGwrLTj1k3yLEF1aEO1ReBmSvK5DijMOssHm
X-Received: by 2002:a05:620a:f02:b0:7c5:57b1:1fd1 with SMTP id af79cd13be357-7c9668d192amr1294303485a.47.1745836282401;
        Mon, 28 Apr 2025 03:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745836282; cv=none;
        d=google.com; s=arc-20240605;
        b=bpocEoSLW2aF7fPRKl+p7NtQohU547Kc6jdKmOyvVVlBaXAgB/C1i4pc5LdsvqmldO
         /BKcUsw0VDyqBL3WaK+g/543RK9PzujK+leMJBgWFactC6jK0NPYLJ3XgFuAFvO00Bxt
         O5S1Y8BA1Li2FxvJ4BWS1UiD+z5OcWaxgjBLNu+OKpnzOWnqMhHq2SfAeEfMBX4Tzwlx
         zKNEbJv4K2F37kJduH2SIG+0rP79aWILg5oWLZ7EfKD08no9IKjbfHSo4Gvb6YtlUjHB
         oXWDHg51xqE8zCNZp5ussXIs6F+FgypTXTSW00JesrMZaZlm1hTjIyFVcrxmHLoLFD4H
         sDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CFfNtyDoOAoDlEZ4I7GVcU8E7p9ldhkePZ9VBtg34o4=;
        fh=+sxB8NkS+xL+1QwPgIVnaMhN8Q9GX11v/uLdEosqQQA=;
        b=DCYIwY+5EPacxujJv0HxT43w0Ed6dgmW0K8AjyNXVzhuC+XT6dwC3u2jDAKpn2RtjF
         ikB06XLk10YJeKVoqLveCC5/uej/7NvCP63XdalRl3+Z8SAmZ/zsf/7J3J2l0MODkTdv
         +mtQA8/k/sNQqXJUBS7Dq0f8OpJi7O+5Bc7DIBFvK9pBAs9l0beIooZxIcBdhofZwuzv
         cUDlEYnv1FZf1VNYXOb8uLNpPt4zexGHBSCOW1WBqKaNS+WeQzQ1Gn+XHX7fp+txoljn
         NzyiGuYHZh8tk7bJPk8MCHlFc0NgqmY6FjYCuoXEtDf0IDLOSJmykbSTn/a78Lq0/iyH
         C1MQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dkYPolSP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958cd6a27si974667585a.141.2025.04.28.03.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 03:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dkYPolSP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u9Ljw-0004FC-BI; Mon, 28 Apr 2025 06:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Lj5-0000t3-A7
 for qemu-devel@nongnu.org; Mon, 28 Apr 2025 06:28:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Lj2-0003XV-31
 for qemu-devel@nongnu.org; Mon, 28 Apr 2025 06:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745836113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFfNtyDoOAoDlEZ4I7GVcU8E7p9ldhkePZ9VBtg34o4=;
 b=dkYPolSPuXxxoi8Gd1MKp9a06K3B3+8gUK6ijkfLcVIUB2HWeHz83U4GHdcI5wKRRA/rcl
 6j2J6Hjzk+upja893JxMVBJu/NLDG0h+kHZYb0sXQtamXNspxGg7aCz0Ap3YSawEVj764S
 sF2YM/nxjOpx38xLgrWcB5bxNOpQ4/A=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-216-mhiu-1f-MmCjKt0ezOOMkg-1; Mon,
 28 Apr 2025 06:28:30 -0400
X-MC-Unique: mhiu-1f-MmCjKt0ezOOMkg-1
X-Mimecast-MFC-AGG-ID: mhiu-1f-MmCjKt0ezOOMkg_1745836109
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 491B519560AE; Mon, 28 Apr 2025 10:28:29 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A8DC3180045C; Mon, 28 Apr 2025 10:28:25 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com
Subject: [RFC 24/24] hw/arm/virt: Use ACPI PCI hotplug by default
Date: Mon, 28 Apr 2025 12:25:50 +0200
Message-ID: <20250428102628.378046-25-eric.auger@redhat.com>
In-Reply-To: <20250428102628.378046-1-eric.auger@redhat.com>
References: <20250428102628.378046-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124;
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
X-TUID: nvuXloIeiZ+C

Now all the enablers are there for ACPI PCI hotplug support,
let's use it by default for 10.1 virt machine onwards.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5e6562e754..ecdc1fcfbb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3446,8 +3446,8 @@ static void virt_instance_init(Object *obj)
         }
     }
 
-    /* default disallows ACPI PCI hotplug */
-    vms->acpi_pcihp = false;
+    /* default allows ACPI PCI hotplug */
+    vms->acpi_pcihp = true;
 
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
-- 
2.49.0

