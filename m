Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2965053lfc;
        Mon, 1 Jun 2020 03:21:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxC9yJtpAQIt20Q2k4hok49s0VNx7Z7X7Vq+X5CngDmkyG/ru6zbOc+YGb0GxJXDsPINQih
X-Received: by 2002:a5b:843:: with SMTP id v3mr5716548ybq.106.1591006901295;
        Mon, 01 Jun 2020 03:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591006901; cv=none;
        d=google.com; s=arc-20160816;
        b=GH9gN3CxkfmZnqlhBjoD40jCbulkM9VMxeeSVZNAMpzxlePaJT3c7Oj1X6UxMko5vl
         6f8pKtrT5+PL3QkqTY7ThF0r2QETGof8WDzn7TmHhQ+pKjaKhsek+XRXaP3ib+3hM2xG
         rn+RJCoMKWten7Mdnq5RytjyyzcIxdJK89NOQIWzVJ8H3QaNqjnLXhEPVM05CRvHOceA
         Gb0INja5/iDKNbwt7kZhQnXZQc93EA+BDxufODohU7CuTgQO8fZMN88Lmfd/Iia586pY
         3BL7XgD1NngNdQ2gu4qbNmc7A0DuopL2GKCg/IViHutwGe8MBaH2XOJv0LxvR3vWKoun
         BV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=gU1OYSS8mgIP4+hlOMyKVmni/okNWAIYtzpnEPgWyIE=;
        b=pM91kPp5zuCBwZfKcHyPQGsJ2banRlwhw0zMyJN1Y/lAZUVnERFS7pebqmrM63xXJ3
         ZLdGu1ld6bamdtrlDXW/QLPt3aSWjxXEparAa0ecjMK+szsvd8UKOfg2KI/3o4omLc3j
         H6aBmSuFepdYgDlPH9skH7o9f9KD6rYXUxSWsQvG6mIdq1IBVZxyf1Wp6mjxvkOrH1FX
         /HBEQYNDuRGr4BoYZ4NcBRGFYifiArSJlNe/Je29qKW6N/m30xn+Whs+rjOq2WwbsWXE
         iPaT+ylpPy+YEv8AwWeTuIxEjh8qf22kM7wC1pYeODfij8eG1NQOrtJ/aM9rcESkuXIS
         Npeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="d8k/p8Xj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b204si9159625ybg.181.2020.06.01.03.21.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 03:21:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="d8k/p8Xj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfhZc-0008MW-Kx
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 06:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhZU-0008M1-VD
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 06:21:32 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:43940
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhZT-00006n-Id
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 06:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591006889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gU1OYSS8mgIP4+hlOMyKVmni/okNWAIYtzpnEPgWyIE=;
 b=d8k/p8Xjnxjt2T3/DbhyJ/vgNymxar90gkZaHDCfNfygzQpvQMogNkYrEVzwQPIi8xUwgL
 hcIWbijqKIhVYz4uusHTbBdD6WOqkx6uq6f+jQUqBOx1T3fqoEsCVARUPg2BNcx0OIS9sw
 Fv7ls3ECDD4HuZlKC/y0/d2DOrg7Oqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-uUOWtAjdOoqVJf6ZgzFwSw-1; Mon, 01 Jun 2020 06:21:28 -0400
X-MC-Unique: uUOWtAjdOoqVJf6ZgzFwSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C88D7107ACCD;
 Mon,  1 Jun 2020 10:21:26 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFCEFD01E1;
 Mon,  1 Jun 2020 10:21:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
Subject: [RFC 0/6] TPM-TIS bios-tables-test
Date: Mon,  1 Jun 2020 12:21:07 +0200
Message-Id: <20200601102113.1207-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 02:05:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: Aak8e9mp7Ei7

This series adds the test of the TPM2 and DSDT tables when the
TPM-TIS device gets instantiated.

The series also allows to validate changes in the TPM2 table
generation done in "[PATCH v3 0/4] vTPM/aarch64 ACPI support",
sent separately.

This depends on Stefan's "acpi: tpm: Do not build TCPA table
for TPM 2".

This is in RFC state because I am not very familiar with the
table generation process docommented in bios-tables-test.c.

I don't know how to get rid of the checkpatch errors:
"ERROR: Does not appear to be a unified-diff format patch"

Surprisingly, checkpatch argues when void tables are added in
the same time as bios-tables-test-allowed-diff.h changes.

Most importantly, to be able to reuse tpm-emu code, I was forced
to remove the TPM2_ST_NO_SESSIONS assert. I would be grateful
if I could get some advises on the best way to address the issue.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v5.0-tpm-acpi-tests-v1


Eric Auger (6):
  test/tpm-emu: include sockets and channel headers in tpm-emu header
  tests/acpi: Add void tables for Q35/TPM-TIS bios-tables-test
  tests/acpi: Ignore TPM2.tis and DSDT.tis
  tests: tpm-emu: Remove assert on TPM2_ST_NO_SESSIONS
  bios-tables-test: Add Q35/TPM-TIS test
  bios-tables-test: Generate reference tables for Q35/TPM-TIS

 tests/qtest/tpm-emu.h          |   3 ++
 tests/qtest/bios-tables-test.c |  60 +++++++++++++++++++++++++++++++++
 tests/qtest/tpm-emu.c          |   1 -
 tests/data/acpi/q35/DSDT.tis   | Bin 0 -> 8468 bytes
 tests/data/acpi/q35/TPM2.tis   | Bin 0 -> 76 bytes
 tests/qtest/Makefile.include   |   1 +
 6 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 tests/data/acpi/q35/DSDT.tis
 create mode 100644 tests/data/acpi/q35/TPM2.tis

-- 
2.20.1

