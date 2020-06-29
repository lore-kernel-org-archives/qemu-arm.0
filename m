Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3022250lfm;
        Mon, 29 Jun 2020 07:10:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb+Ze7MjD8S8u3qabWitV+m3sZvyugf7wG/Pg9WjaMZve4Ige2nlTpDwCSW03AXY3Qpzpf
X-Received: by 2002:a25:6b4a:: with SMTP id o10mr26845140ybm.405.1593439814248;
        Mon, 29 Jun 2020 07:10:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593439814; cv=none;
        d=google.com; s=arc-20160816;
        b=DLCe6NwHN3fMHv8rqI7Ip8KBJHV281SYBg4eQBMwzQzf68krYCag8FDc0s7OFngHmA
         KgX5W4r0ehX+b43FtZbfqf2mFdTFBCxR8sIGybNg+Q7w9EDk5ydHxIYmIyaBKixWYacg
         /lZhfLNVgmZE8ej2L9DjFFd+lMitdcHupB9cgq07As8FCSGjtwTBKWkwsXSjTzbpnr5p
         eKnoerHrKXL5Tc7zkqCYWya4mrMDWC0EeFthbKY3oosc89YlwK77IWqvduBVkMFtH8vI
         BrovYBG98cwpylMQT/YJ9dDooBAkYJtbjPZHDM3SEglBqCtG1bMKgB3lakV37nsQrjYL
         VJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sOK3uS7kquM9s9wEV6pZlYOHCfNFUHdRhCA/wE76+oo=;
        b=l8aRLR04gyaBZ5WxdOChHYT6grtpgm1MgLdmCdiUmlfvwUzq6GyTwR5chQoImlb0ud
         XmuND6wDAzVeQ8/NNGmtToMhiw6eGFPfokoNO36iCtqlzMiuTuDXVp7F83Zg/QmhsZB2
         k/hPyHND8o/RY/WDdlAA8qNV7BBG14HL9i9zuWuFtr6/i7haB7K3K9Comdv+LParttuh
         XnYuS08E4G07t9ApdZbxIWqeuYmsyZK9BPp2liz1GEkcpNnxP0ADhc1FHLiMdfIaOnrU
         X4yYPtIIPzN4QjET5YkXuSB0uRnXLnHZxBu3gHs5//73GBitcVHFUPe4VSuPEsGEh6Ly
         f+/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="QVxrc/Zk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si9575914ybl.18.2020.06.29.07.10.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 07:10:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="QVxrc/Zk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpuU9-00066h-Ll
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 10:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jpuU1-00065Z-2W
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 10:10:05 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24356
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jpuTz-0004bK-Ae
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 10:10:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593439802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sOK3uS7kquM9s9wEV6pZlYOHCfNFUHdRhCA/wE76+oo=;
 b=QVxrc/ZkZy900VYqj+YhdyXHNDljClLrvT3lFJXYXuMc2Hn8qH+PqMpj4va862ooQL50KM
 WfVLNLfQNyrPdq8AQsEbNchEUSpUooFKvhntHRlVsFVMqB45g412aFfE14CyppKSL7OU6G
 nhR4pHjxQ5uRa7K0fG3Tgt64QyhCXHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-LuLbuAb1NfqVE6AxTjMsjg-1; Mon, 29 Jun 2020 10:09:56 -0400
X-MC-Unique: LuLbuAb1NfqVE6AxTjMsjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9234800D5C;
 Mon, 29 Jun 2020 14:09:55 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D25C21A888;
 Mon, 29 Jun 2020 14:09:52 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 2/4] tests/acpi: virt: allow DSDT acpi table changes
Date: Mon, 29 Jun 2020 16:09:36 +0200
Message-Id: <20200629140938.17566-3-drjones@redhat.com>
In-Reply-To: <20200629140938.17566-1-drjones@redhat.com>
References: <20200629140938.17566-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:06:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, mst@redhat.com, philmd@redhat.com,
 shannon.zhaosl@gmail.com, ard.biesheuvel@arm.com, imammedo@redhat.com,
 lersek@redhat.com, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C/D8WeBLUbku

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..32a401ae35fa 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DSDT",
+"tests/data/acpi/virt/DSDT.memhp",
+"tests/data/acpi/virt/DSDT.numamem",
-- 
2.25.4

