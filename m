Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3114494lfq;
        Tue, 15 Sep 2020 05:15:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzNZM4ozA/i1fNenvyjrud+AtWAqEuip7p30BfTfXmIMqlwJLtXi6jfmaCZBFIv7VOYQSC
X-Received: by 2002:a25:4ac5:: with SMTP id x188mr16819935yba.72.1600172132334;
        Tue, 15 Sep 2020 05:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600172132; cv=none;
        d=google.com; s=arc-20160816;
        b=TaZ/3GW8dl0yWTcxKhvmS8ujQSmwOMoDvqoSL/Zq/It6J9ZdkChsf0dLWugesCgcJg
         1q4IrVQ2Lap7+NtbAkH5qHXEtWhmpFpxUkB2/PxqRf4/nNHTN9ox7Nzyle9y9H1dOU8y
         LVpp3CJZ3K7JhVzysGW62iTCLS3wUbwJosRzy3+ISL7nHWqlkKfX7Abej2i6w/OfyCw+
         comx7XI1AIDTaaD5v8xnkgaua7L4rBpVcRbTFYKMvWqTNrSLg092AY3kdEkVuLXPmbcz
         ZqvqyZTHQhvszCWyrgxyBpqJlDv0aHg1GRIgQFAAHZC1UNrPN7fLsFhXymtu+ZFhpx/+
         Y+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1v/PAt3CshJX/VrDKv2rrFSFurASfaywl/Okvrdx+NQ=;
        b=NtR6Cpu+WgF9AvDpKJChyOfiK2Xgcf+yllyQLSIz3iQmcF1D1k35woFXyNf1DpRwk/
         eL3PO/mRYV+2aoEpqqZ17847qpqRv4CDNta5bSqWhsn9PGPDku/mkhpa4mBWC/lfGTyt
         AM7nZG9HKNZXYQ9P/+sZfBAVMjaWySGCuV2N8XA4rZyMr5QVwFJyup1c1QpU5Jy612Ig
         WMjbFg53jcXhgyh3IS65XNzH8Tjl6W/AnHE/R2CZHEhqcEhrdeY/GU+GZLYnS5WJD295
         BPwCx5ghGkCuweFfAZ6KUmKuFtLkjfLPIhoTObC/p5P+pjNYa9zfA1ez7I8/1jl3Ymam
         ul2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vmy76l+X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si11442693ybn.368.2020.09.15.05.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 05:15:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vmy76l+X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI9rv-0001TL-F1
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 08:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9nD-0004no-Tb
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 08:10:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9nB-0007gG-3S
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 08:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600171831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1v/PAt3CshJX/VrDKv2rrFSFurASfaywl/Okvrdx+NQ=;
 b=Vmy76l+XquC0ETlELTvd/NlTIDCmxrQiALkhtJ0qSqwhTAV+4FM6FdqRrPbzAo2nF59BTm
 650Fr9Ozqkgn84+hOSCU9DAPqT8fyAKVWVkMw2Cxord+86WBtuU+KdLAbv8ITfVHrbl0In
 P4V/Oy7Wm1w7AMQ2Gt0CFECYXLxVmkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-V9BPZ5hfNo6jDbGDMAyNYw-1; Tue, 15 Sep 2020 08:09:25 -0400
X-MC-Unique: V9BPZ5hfNo6jDbGDMAyNYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76AA064087;
 Tue, 15 Sep 2020 12:09:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AA1C75138;
 Tue, 15 Sep 2020 12:09:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4A18640BFC; Tue, 15 Sep 2020 14:09:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 17/21] tests/acpi: allow microvm test data updates.
Date: Tue, 15 Sep 2020 14:09:05 +0200
Message-Id: <20200915120909.20838-18-kraxel@redhat.com>
In-Reply-To: <20200915120909.20838-1-kraxel@redhat.com>
References: <20200915120909.20838-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:10:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xzi29NjOU3u+

Also add empty test data files.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 tests/data/acpi/microvm/APIC                | 0
 tests/data/acpi/microvm/DSDT                | 0
 tests/data/acpi/microvm/FACP                | 0
 4 files changed, 3 insertions(+)
 create mode 100644 tests/data/acpi/microvm/APIC
 create mode 100644 tests/data/acpi/microvm/DSDT
 create mode 100644 tests/data/acpi/microvm/FACP

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..97c3fa621b7f 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/microvm/APIC",
+"tests/data/acpi/microvm/DSDT",
+"tests/data/acpi/microvm/FACP",
diff --git a/tests/data/acpi/microvm/APIC b/tests/data/acpi/microvm/APIC
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/data/acpi/microvm/DSDT b/tests/data/acpi/microvm/DSDT
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/data/acpi/microvm/FACP b/tests/data/acpi/microvm/FACP
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.27.0

