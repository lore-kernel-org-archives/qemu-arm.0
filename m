Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6130150lfg;
        Thu, 4 Mar 2021 02:56:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrJlXO3nPU2qwNNZnnDalfxV8QqPQECkThQGpxO0dOPgpBlU7ymVRQ4UvElvAFnc4E2z2h
X-Received: by 2002:a25:a286:: with SMTP id c6mr5577840ybi.146.1614855408929;
        Thu, 04 Mar 2021 02:56:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614855408; cv=none;
        d=google.com; s=arc-20160816;
        b=tYM4N1WpL6Vi0dT3IuW5WygNw5r+C0gnz9rKjIQhmOkFX2pUBa6IqRGsinhcEiHIPT
         xVf/devcYm2jK5P3+f5CKFu1iDUjY7gYFxOTgm3vlQieo12Z5yNR4Lsl//p4XlbRPYwh
         woQUM+F12KUrcJwbV2IfDReMiEaq19YAXwzN3+ckzVI7LRFlLxJt7YTzPCXVczDySDXj
         X4gTPZsNzYx9X+rLpH9WtqbO6ltm7Tc1rCaoKgl23qqZPDS0gYmyFWr9Adht1/ENk3EL
         Sz1ELivF+C/7sC+GS87KQ+Lf095GMqqqa6HTnkzPwMDzPfDHhskT3cNeB3zC8j7pxwEt
         Cevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=MRwIZsZIbUldByXDUHnCVbk3rtGrnRAD1x0eYpGKb98=;
        b=vP3xTu3g7BMzat6A3vVhW87HV0NRPjDeEejdwXQFEFw0T6dBv+L44tnonytljxGpHl
         qSFYQ0kGmQe04unhJzrqaF+aAt1ZpDtp1zsDHdeQuNoi4UD+V9XSIkebOE3MKbQuljDQ
         3Z4pGmar8dGWWG2gNPRwskoPpUCobhkLkmkbj+Od/EQDUQRDRCIZCCrRK+nWTEX41deA
         wOrS2cFrmttVV3s90NES3r4tNjcTWkddnuDU1G6zKR4dLhPN3EHbzjQvKe6Gem5KX77C
         eynC/qhs36eghP6G5/+yORymsAZ5i2sVIB5NhvXCJ4DOBmTgyywSpEZ4yRzrQ/U1KUqy
         E15Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RSUpq04n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si28037845ybm.452.2021.03.04.02.56.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 02:56:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RSUpq04n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHley-0001LB-Ax
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 05:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHleN-0000nJ-GY
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 05:56:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHleK-0002yc-Uq
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 05:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614855368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MRwIZsZIbUldByXDUHnCVbk3rtGrnRAD1x0eYpGKb98=;
 b=RSUpq04nRzQw2AgTZB2lQoaxN+0cSbFuGTfRrC7eGglquFKVsWrreXrnAL4MO+ETZESbRD
 p0fUc6we0YJk010tEIrftlN1vDsqlUIvGAC/X9d5Fnk0xHzVpDD2DizzC9u8Go53jYbp93
 B0I2tGwsdyomXIgz7IWwvnuK+atjNeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-bdonfOHJPEqtc5FERKsYgA-1; Thu, 04 Mar 2021 05:56:04 -0500
X-MC-Unique: bdonfOHJPEqtc5FERKsYgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A67610059BF;
 Thu,  4 Mar 2021 10:56:03 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05D175D720;
 Thu,  4 Mar 2021 10:55:54 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] acpi: Set proper maximum size for "etc/table-loader"
 blob
Date: Thu,  4 Mar 2021 11:55:50 +0100
Message-Id: <20210304105554.121674-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8xw0OpPe8Itr

Fix and cleanup initializing the maximum size of mutable ACPI blobs.

v1/v2 -> v3:
- 'acpi: Set proper maximum size for "etc/table-loader" blob'
-- Move "etc/table-loader" change to separate patch
-- Extend description
-- Fixup maximum size (now really use 64k)
- Add some patches to cleanup/refactor the code. I avoided using a new
  enum for the different tables for now, using the table names should be
  good enough and is simple.

David Hildenbrand (4):
  acpi: Set proper maximum size for "etc/table-loader" blob
  microvm: Don't open-code "etc/table-loader"
  acpi: Move maximum size logic into acpi_add_rom_blob()
  acpi: Set proper maximum size for "etc/acpi/rsdp" blob

 hw/acpi/utils.c             | 17 +++++++++++++++--
 hw/arm/virt-acpi-build.c    | 12 ++++++------
 hw/i386/acpi-build.c        |  7 +++----
 hw/i386/acpi-microvm.c      | 16 ++++++----------
 include/hw/acpi/aml-build.h |  3 ---
 include/hw/acpi/utils.h     |  3 +--
 6 files changed, 31 insertions(+), 27 deletions(-)

-- 
2.29.2

