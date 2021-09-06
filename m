Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3747498lfb;
        Mon, 6 Sep 2021 05:34:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzUnVqFJ9mqoaSkciTHPRc77J0HTkVOYeXoVUjWasP24tG5Rz4FfIGgFXLG6Y+/+FWjSWt
X-Received: by 2002:a05:6e02:d0b:: with SMTP id g11mr7684365ilj.321.1630931693416;
        Mon, 06 Sep 2021 05:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630931693; cv=none;
        d=google.com; s=arc-20160816;
        b=IVIpq1B4QpTWONaFHj9syesEkbtetE7uOpIWbgGJx4WdVVjy0XZMQTFcG4eX2PwLpt
         O6tT3Z9accmOdgTqaTiBEIslzM4wTqCrOMz/tNTV3VruYbcr4aTZ7WueqITpUm92E32f
         XVH1uVyPoUCHisVOmVJ+rBSYVs+MKuhDVzfIGOlL1k5KzPBehG8kVWhziUNYWhHQVL9r
         nrYanCclpUw5cPVMYFQsOFsEJUSDb51lGdlVeN/wcQdI+IR3OTMrnFOJa9mVaCtVpVdh
         uD4zXQtxtXpxF3ODvn7mBziXrOj5mh4FC0x5eV8uN1gDj4Yp3Ui40m2PkX7Z7AAXgO2c
         1Msg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Rebwq+TaL6L3PI4fjkctNuYRh6Lr7aG5IFVlXwn6YEw=;
        b=VcvsxgtUTpbehHGZ26ulv+Dkox3CQDX5taa6fgIpXNs46YVFgI2XhDJsH2qKswEt1u
         LrzCjEURqPAbkpWJDRFCynm+mWQqDuL2ZEpzC2/dfWXwMn+kQn7r+YXYBizultjzJCu/
         iKGjeSO5AXxV/4B6KIoTDImXBn+XE/KEwyC/oTwdDuUidNlL49SAPVGAD/lC0KeH3Zma
         pocAwN4XlKORrwTneMIjnwiwmB5LNk9lmh4u0vf/b7IWi+H7+xC7If9hgstn3Vzj/ZJW
         bYdqyEjV/F1mbbzEDkRs/NXwWZd7W6AYTKDo3uyTnU99qH3N1XhRsg7X2/qF8XZdCj9Y
         rOUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZgJdAlSB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18si7397460ilj.94.2021.09.06.05.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Sep 2021 05:34:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZgJdAlSB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNDps-0006K5-Or
	for alex.bennee@linaro.org; Mon, 06 Sep 2021 08:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDp5-0006JF-4x
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 08:34:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDn6-0001xm-3W
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 08:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630931518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Rebwq+TaL6L3PI4fjkctNuYRh6Lr7aG5IFVlXwn6YEw=;
 b=ZgJdAlSBUczSYVk1fsu/qY2gigOhwciM37sqYQ3fvVQ7UT7NLOZ/5qk0wD6HUqGXpPlovN
 k0mbyk1a6gRNyDnJdA2N/eLO52S0oH8PiVGoOM2/Z8hJ+/Xxsc1snXIPnT2PLOjhf1DRQD
 DxH0Taq7oNvKnnx3eMt432+3gyMSTVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-_F_19pjCNpOt-cSv1cCnjw-1; Mon, 06 Sep 2021 08:31:56 -0400
X-MC-Unique: _F_19pjCNpOt-cSv1cCnjw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1E74835E00;
 Mon,  6 Sep 2021 12:31:55 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CDF86608B;
 Mon,  6 Sep 2021 12:31:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 ardb@kernel.org, drjones@redhat.com
Subject: [PATCH v2 0/3] hw/arm/virt_acpi_build: Generate DBG2 table
Date: Mon,  6 Sep 2021 14:31:36 +0200
Message-Id: <20210906123139.93593-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Cc: gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jFwvE6xbc831

This series generates the ACPI DBG2 table along with machvirt.
It applies on top of Igor's
[PATCH v2 00/35] acpi: refactor error prone build_header() and
packed structures usage in ACPI tables

The DBG2 specification can be found at
https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table.

DBG2 is mandated by ARM SBBR since its v1.0 release (the rationale
behind is Windows requires it on all systems).

The DBG2 is used to describe a debug port, used by the kernel debugger.

This series and its dependency can be found at
https://github.com/eauger/qemu.git
branch: dbg2-v2-igor-v2-fix

History:
v1 -> v2:
- rebase on top of Igor's series and use acpi_init_table/acpi_table_composed
  and build_append_int_noprefix()

Eric Auger (3):
  tests/acpi: Add void table for virt/DBG2 bios-tables-test
  bios-tables-test: Generate reference table for virt/DBG2
  hw/arm/virt_acpi_build: Generate DBG2 table

 hw/arm/virt-acpi-build.c  |  64 +++++++++++++++++++++++++++++++++++++-
 tests/data/acpi/virt/DBG2 | Bin 0 -> 87 bytes
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 tests/data/acpi/virt/DBG2

-- 
2.26.3

