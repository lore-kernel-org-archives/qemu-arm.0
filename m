Received: by 2002:a0c:90cc:0:0:0:0:0 with SMTP id p70csp1637305qvp;
        Mon, 27 Sep 2021 06:43:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaUqush+TLTCIVLTECH25SgipIUfxhLA3jKoPzZDb3MQi3/pUWHKMogsi1035umVct8q8Q
X-Received: by 2002:a1f:fc42:: with SMTP id a63mr15521184vki.20.1632750184048;
        Mon, 27 Sep 2021 06:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632750183; cv=none;
        d=google.com; s=arc-20160816;
        b=iZh+P122vzJpDH9L7XGuMwNOxtGwZ+q6cuP7dpWcH9enA93bqaqOT+utjCOC+Z9Afe
         ADx6+mTKI9PPESW+yJ4+EE4PQRBUDjsX4PNQFTtm3rRRUUgjB2XQCCYIJ9Soijn82eox
         5AmLwUsZAi0xVrKRcMrS3ScO1I4uCZBkzt3+qT69kwGJ1nMXJZ8WAxTh3zhyuqMr6jgw
         sFe65ywyrHCkoWkoKCs/RNeC+2ZQUOjfGXoRRMr5mVrY6aY18efoDxNteRDfoxmaj4BC
         dY0cNlbYGyeAWGE0u0o5jsq3JtG3ftQ0xPgfJWcMUbEJTpj40n/A02Ek+Qb06R9xs8//
         VvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=axXvx+PY+jUPmLe46Y1VgvYtGOQQC0GnKHIdyi2hma4=;
        b=yD2yvIMEJTi0JwWC87Fk/vruqcNAJVQ5BTFOx087zITy0pjEDsXiAQu5Y3CwIXR7fS
         dXJwW8USLOkVYZ1JhakgLIZ9tK9z9cgEyjDtoKLkhsjYSwcEtdnODNz8qAMb9TQmVxQU
         YbY+jR9Olybkz1sNgsUqjeOhZuidlrZrjxR+Q3PjuyVeRij3kkm4ODskX+PLk7Nt8KPA
         JCEkfWEbo5VMupDWc3NrXyRy6+Ho8eJ0/ZdrXZq2axSIYxzcR47RCWr6c8IetdZOcjXR
         OIOPO1wYrUtv0dKqVPiSqhU8Te87VmlWtmJiZ5/eog5F2KhQ5NkM2Fl/digX+CfcOurC
         pNFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B1DtNq72;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si10104310vsf.372.2021.09.27.06.43.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Sep 2021 06:43:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B1DtNq72;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUquM-0005mm-L1
	for alex.bennee@linaro.org; Mon, 27 Sep 2021 09:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mUqWE-0004xB-4J
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:18:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mUqW9-0002Xf-Fl
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632748680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=axXvx+PY+jUPmLe46Y1VgvYtGOQQC0GnKHIdyi2hma4=;
 b=B1DtNq72hmmJjEdbciMxHiwXYfvY/sORsdgqGL0WwfjIhwpwU2xnjTGMvCxxH+eEC6JzOL
 GtXoNyG4yD+d6Okjw+tyvXRKhVfRPSySoITUdydv/eVPzGsibZvU022AMChdK33MAbACie
 523qsN8z9VWcXojZican5rqvV3XNwOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-XxEv_YTfOwmGyMBNiW9c6A-1; Mon, 27 Sep 2021 09:17:59 -0400
X-MC-Unique: XxEv_YTfOwmGyMBNiW9c6A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E11D31006AB0;
 Mon, 27 Sep 2021 13:17:57 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B54B19D9D;
 Mon, 27 Sep 2021 13:17:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 ardb@kernel.org, drjones@redhat.com
Subject: [PATCH v3 0/3] hw/arm/virt_acpi_build: Generate DBG2 table
Date: Mon, 27 Sep 2021 15:17:29 +0200
Message-Id: <20210927131732.63801-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uMnlxA0JzGWj

This series generates the ACPI DBG2 table along with machvirt.
It applies on top of Igor's
[PATCH v4 00/35] acpi: refactor error prone build_header() and
packed structures usage in ACPI tables

The DBG2 specification can be found at
https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table.

DBG2 is mandated by ARM SBBR since its v1.0 release (the rationale
behind is Windows requires it on all systems).

The DBG2 is used to describe a debug port, used by the kernel debugger.

This series and its dependency can be found at
https://github.com/eauger/qemu.git
branch: igor_acpi_refactoring_v4_dbg2_v3

History:
v2 -> v3:
- addressed all comments from Igor on v2:
  patches 2/3 swapped
  style adjustments in "hw/arm/virt_acpi_build: Generate DBG2 table"
  + more precision on spec references

v1 -> v2:
- rebase on top of Igor's series and use acpi_init_table/acpi_table_composed
  and build_append_int_noprefix()


Eric Auger (3):
  tests/acpi: Add void table for virt/DBG2 bios-tables-test
  hw/arm/virt_acpi_build: Generate DBG2 table
  bios-tables-test: Generate reference table for virt/DBG2

 hw/arm/virt-acpi-build.c  |  62 +++++++++++++++++++++++++++++++++++++-
 tests/data/acpi/virt/DBG2 | Bin 0 -> 87 bytes
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 tests/data/acpi/virt/DBG2

-- 
2.26.3

