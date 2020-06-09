Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp459406lfc;
        Tue, 9 Jun 2020 05:55:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB28WMZZsydVScIzc3gHMFn2v715tr5yL6W2KV9z4tE3lsAGfMzp5QpFnItUV6lNEjOGaE
X-Received: by 2002:a67:f356:: with SMTP id p22mr2955384vsm.146.1591707305444;
        Tue, 09 Jun 2020 05:55:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591707305; cv=none;
        d=google.com; s=arc-20160816;
        b=RvWWn1xCBAZxIY4zTlmMkSJX7U+jxdhqNR7OYg8LBPMI8m0htsIw4AuVr5HUzyirqz
         q/gbl1qri8VfMUryZRADiA320C5ZO+H3bzIIOfj04EEunmPnuB1a/LhDl8nskPPdBa5P
         e23nyP/jdLF0qOlUarXEK3LjjQLC39JDSzn3eIFdrkH8lcPy3+XBGf8gKcX7pF0ojD/b
         blQeW8Q/C+s833LtKopr6fXvk8rcjeQ6b8A5Ndxond+DMAAlP6WI4CF8upn1hFgcVJT6
         4w7O/8LlJzji+A0ICqmJBLOH137LBxMAwVHsug3ZjAVND4ydlblf/ytu1dL+BFOYoCjF
         0CQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=IOkl911pjVN5dg64WKQtVfmbiOoPAa4NToCtbjD9FAY=;
        b=TYPtG7AzJqYpdQSQVTz0Gu697Hhn5eWJL7hEiH7PuCpKwCTK9t7/zWl+PVnvPS1wde
         6DEzYWEko6iBSKy2bT6BUBKAKEaeCFolszFKFUwCLWlN4243Ybv7756gpgK9gbDHdQTh
         kftvgSglEuCuwyO1hRqrLLCNytPYRNMI+svK+OkGSFfH5Y2mRBkiLiXXNKO1n6bFgFYP
         u7W2cH+k6G0z1ONuUXazfM/e/utphcuXqYhnrniLp1ANBf+wbInK8fwXZOFmrFdsHU1u
         1IIelmW1tEpjOgjvxTEKqhWhYWxRGJHL/FecN8bALtFFB65qQWO2nHxHfwviU8LwRuWc
         nAIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HWqhMh4k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si317183ual.108.2020.06.09.05.55.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 05:55:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HWqhMh4k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jidmS-0003py-N3
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 08:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jidmH-0003o3-HJ
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 08:54:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51681
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jidmF-00028X-Fa
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 08:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591707290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IOkl911pjVN5dg64WKQtVfmbiOoPAa4NToCtbjD9FAY=;
 b=HWqhMh4kfbsYzA9h+engXbGYcY6u85arIjwK3XxxByaqhh14C0yUiBm5swXNj7tmVnX4JD
 Thqwj82tWqSJ60n/Sb+jcPnoHDVhbVoBEviDFgIOBft4TDwnuJEifTDRYwYqSK8w6pEzH6
 CMYHZGMkIlpnko1N0O6gToM05Vs3arQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-aAKWBZmkMRWlqfN7dq_R4Q-1; Tue, 09 Jun 2020 08:54:28 -0400
X-MC-Unique: aAKWBZmkMRWlqfN7dq_R4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A55251B18BC3;
 Tue,  9 Jun 2020 12:54:26 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BCF75C557;
 Tue,  9 Jun 2020 12:54:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
Subject: [PATCH v2 0/5] TPM-TIS bios-tables-test
Date: Tue,  9 Jun 2020 14:54:04 +0200
Message-Id: <20200609125409.24179-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 01:38:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TBgWPfRK6pab

This series adds the test of the TPM2 and DSDT tables when the
TPM-TIS device gets instantiated.

The series also allows to validate changes in the TPM2 table
generation done in "[PATCH v3 0/4] vTPM/aarch64 ACPI support",
sent separately.

This depends on:
- Stefan's "acpi: tpm: Do not build TCPA table for TPM 2"
- Michael's "checkpatch: reversed logic with acpi test checks"

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v5.0-tpm-acpi-tests-v2


Eric Auger (5):
  test/tpm-emu: include sockets and channel headers in tpm-emu header
  tests/acpi: Add void tables for Q35/TPM-TIS bios-tables-test
  tests: tpm-emu: Remove assert on TPM2_ST_NO_SESSIONS
  bios-tables-test: Add Q35/TPM-TIS test
  bios-tables-test: Generate reference tables for Q35/TPM-TIS

 tests/qtest/tpm-emu.h          |   3 ++
 tests/qtest/bios-tables-test.c |  58 +++++++++++++++++++++++++++++++++
 tests/qtest/tpm-emu.c          |   1 -
 tests/data/acpi/q35/DSDT.tis   | Bin 0 -> 8468 bytes
 tests/data/acpi/q35/TPM2.tis   | Bin 0 -> 76 bytes
 tests/qtest/Makefile.include   |   1 +
 6 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 tests/data/acpi/q35/DSDT.tis
 create mode 100644 tests/data/acpi/q35/TPM2.tis

-- 
2.20.1

