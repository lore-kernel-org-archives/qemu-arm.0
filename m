Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3023649lfm;
        Mon, 29 Jun 2020 07:11:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyBefPixAYh7CwVoQMsnPqFOIhKm3TY37FoDKCY4pfyi6i7c4ggcjnYois6QSPlk6tGo2M
X-Received: by 2002:a25:b085:: with SMTP id f5mr26875234ybj.418.1593439904602;
        Mon, 29 Jun 2020 07:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593439904; cv=none;
        d=google.com; s=arc-20160816;
        b=hiHi8Emwk7Dwbv7a4ypT6hBf6QZkAhx/ygknevgrKvvdLzepDBxQVhktnEAZE0Bhci
         dHVgfZ35qEQlReAWwpdqDPMN6mwUBeXyAcwzSRKspYl1lzzBCM+qtkcqXmxvPVKOkxSd
         8IZ1Lds9leNLw2QHWxMcpMq7bCEkn2/mx4qs66RikqX9kubADCyxqzRA1iOMRsQsPup/
         XQ55JX3+ieWBh2IaKJ2VOwgPHdNTWRiBaOMcdnF5anuLvE6iemW54mxVnAW1Zmesi5NL
         h4WP2oEDfjdPtHzj9xwI67WHPyzp7orXSDPWVXlaK/DlJRPy4NhSDrg44IKWjZyTJ54r
         Ya+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lROIehN5YQsdEHr0xlOBkIBdnbj3LY30xOH3fpB7+ps=;
        b=cwqvExyxnTsGp8Hu4TLo2y4RT8KhiKm04VljI/X0XwGwqt1/fU+j3YX94+swWxE8cX
         sb/CE75cCkmwou3E0Uvbj369ap2M7OoB6VCzOrxoG0kBnyE3hSrwjkAFNmMULY0xH1kL
         W/Ne/tPgBhjEA6GSAFRq1aun3aNUIY/kP+hpG2/6xQ1q6aMi4wgf94Ox3a1n/3hHYMgt
         /IfGTFIv7kRzXlnG0fZUzsYLMppu2ZgS6JVycY95A+zByuWeUpUdHwLKIvenD0NHQSiT
         x+yDwE2iWaIF6BbeYJ/gc/1/voAEOl9YbRFimaYZkODLqof0W3q2iXJXt2QbsdALALlg
         1CWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="NceDp3y/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d34si36997440ybe.472.2020.06.29.07.11.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 07:11:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="NceDp3y/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpuVb-0000DE-Ve
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 10:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jpuTu-0005yr-70
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 10:09:58 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55516
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jpuTs-0004ZP-Nf
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 10:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593439795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lROIehN5YQsdEHr0xlOBkIBdnbj3LY30xOH3fpB7+ps=;
 b=NceDp3y/BweG+cBVb1ssigjGajygMWH4Ad3S8txACOceLrtF5uFUH3xEvab/8B/2vIwq3T
 B/u7r5lVIZMbPok0XO38dNyoGPHoCFw2hnPHQ3OV/6EeQO/lZX5BYRzb5IPliQ5i+k4GN1
 tFFBIc7wEQX7ttB3XfigiVuoauNX80E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-4-NTEj6YPGS0ZMcXNpZO_A-1; Mon, 29 Jun 2020 10:09:53 -0400
X-MC-Unique: 4-NTEj6YPGS0ZMcXNpZO_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7687E80183C;
 Mon, 29 Jun 2020 14:09:52 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A80AE2B47E;
 Mon, 29 Jun 2020 14:09:49 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 1/4] tests/acpi: remove stale allowed tables
Date: Mon, 29 Jun 2020 16:09:35 +0200
Message-Id: <20200629140938.17566-2-drjones@redhat.com>
In-Reply-To: <20200629140938.17566-1-drjones@redhat.com>
References: <20200629140938.17566-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:03:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=_AUTOLEARN
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
X-TUID: 0bYIrAY6ORPW

Fixes: 93dd625f8bf7 ("tests/acpi: update expected data files")
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 8992f1f12b77..dfb8523c8bf4 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,19 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.tis",
-- 
2.25.4

