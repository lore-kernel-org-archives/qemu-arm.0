Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1458399lfc;
        Thu, 11 Jun 2020 06:59:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjMhDSEp/PSWl9OLkbHZHOR//lyLH7B91BP3udDbKi98pKYuwFtwwLoCXiSfhoatnt/ptC
X-Received: by 2002:a25:5f43:: with SMTP id h3mr14893436ybm.248.1591883992344;
        Thu, 11 Jun 2020 06:59:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591883992; cv=none;
        d=google.com; s=arc-20160816;
        b=Jo9DtxEPsCjQYYYwPLly2hKb6p7SWzhJdNrykCBjxIntHlnb1/oLw0PrqiWQL+IEHa
         Rn6g0uTByc3B8lBxtdYgxGDWo2GHqCEraGQAnu3JN6+puhwWUO1s5hOb7ERpFnNpB5L/
         wUR/t1lP9v1Nm9CzaTMSND9ElNux9w2KKSiupaYN4BXXZdsbcpOshPV2lWNz07cAHB19
         9Y8HJHkmnSHDEVTVZkg558g41zpWGt58BW9hIkjG3HOtdRpkuegeiNeIfzVbzvo5T5aE
         D+PL3C4mNSvW5ZnVSTLZToJUiKamQ2P98MkbZFpgpRoz0fnXboxzJcLcJNWkYtzsvmUa
         ju3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=PdlnoNVDrASWbt68U3vZNn5gg5Q8N3H+DkunE9Q69co=;
        b=aFhUg2ccaJsB1TXCf+XH82mOspH/O0DSy7tmw42M0nTucGPgaa6dvl9IE0dlNAOsOZ
         9FVcKSQcBCIZahZpoLEiTyEIjSUArwEWpHDR9p6twNejz0R+zXxhyhpGpN3BBQNoBAUC
         7uwvte3AYDgT0WuxzMW0IFItDkPn8rR1OIqGZU9NbM4bNcHtKKZgtUbxg607WMVVE7o6
         HdnWsyD/qfIOipI6ECmYlZxNplHaCF5xV7zPWy1OmrkpFUONJjIR2e90eIirqx8OfLkJ
         pol+1875wTwGTizu5RZqNrLdXHmAEiWr3Z4qe8/MI7PEcJm25Jfo3yrxjn2PWkV/GHbX
         fGIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b5PZPBtv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si2960699ybg.300.2020.06.11.06.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 06:59:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b5PZPBtv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjNkF-00022W-Ni
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 09:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jjNk2-00022E-Ps
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 09:59:38 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34045
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jjNk1-00028P-JG
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 09:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591883976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PdlnoNVDrASWbt68U3vZNn5gg5Q8N3H+DkunE9Q69co=;
 b=b5PZPBtv8W872BlbrQWs5dtNfqZU0Pl88Sx7wcbIK5FzL0t2xV+Xs5onDH25V76/IQPPPU
 iILV2q6ho4BzRksX5uGaY7vUFr3L/CHHfE3N/HwZqZVZRZD2xn3bILWrDoyTu9sRskJ/m0
 trMnxZdmaY8WhKKOb1sZ7bUL46u3FeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-FiHmqIyePB--zXv0rGSYOA-1; Thu, 11 Jun 2020 09:59:34 -0400
X-MC-Unique: FiHmqIyePB--zXv0rGSYOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BFC5835B51;
 Thu, 11 Jun 2020 13:59:33 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C2405D9DC;
 Thu, 11 Jun 2020 13:59:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
Subject: [PATCH v4 0/5] vTPM/aarch64 ACPI support
Date: Thu, 11 Jun 2020 15:59:12 +0200
Message-Id: <20200611135917.18300-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KbRVR6Fi+Yu/

Those patches bring MMIO TPM TIS ACPI support in machvirt.
The TPM2 build function is converted to build_append style.
Then the code is moved to the generic part.

On ARM, the TPM2 table is added when the TPM TIS sysbus
device is dynamically instantiated in machvirt.

Also the TPM2 device object is described in the DSDT.

Many thanks to Ard for his support.

Tested with LUKS partition automatic decryption. Also
tested with new bios-tables-test dedicated tests,
sent separately.

Depends on "acpi: tpm: Do not build TCPA table for TPM 2"

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v5.0-tpm-acpi-v4
(includes the related DSDT and TPM2 ACPI table tests)

History:
v3 -> v4:
- some rework in build_tpm2() as suggested by Igor
- Restored tpm presence check in acpi_dsdt_add_tpm()
- add the doc related patch

v2 -> v3:
- Rebase on top of Stefan's
  "acpi: tpm: Do not build TCPA table for TPM 2"
- brings conversion to build_append

v1 -> v2:
- move build_tpm2() in the generic code (Michael)
- collect Stefan's R-b on 3/3

Eric Auger (5):
  acpi: Convert build_tpm2() to build_append* API
  acpi: Move build_tpm2() in the generic part
  arm/acpi: TPM2 ACPI table support
  arm/acpi: Add the TPM2.0 device under the DSDT
  docs/specs/tpm: ACPI boot now supported for TPM/ARM

 docs/specs/tpm.rst          |  2 --
 include/hw/acpi/aml-build.h |  2 ++
 include/sysemu/tpm.h        |  2 ++
 hw/acpi/aml-build.c         | 52 +++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 41 +++++++++++++++++++++++++++++
 hw/i386/acpi-build.c        | 34 ------------------------
 6 files changed, 97 insertions(+), 36 deletions(-)

-- 
2.20.1

