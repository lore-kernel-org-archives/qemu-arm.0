Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp290228lfa;
        Fri, 23 Oct 2020 00:13:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzORXLIcMmZBSxVN0hdt6vNzdyIyrpeW4RYC8EPpbTbyXgwiUrb/Nzear4R7Z30pOnVE19f
X-Received: by 2002:a25:208a:: with SMTP id g132mr1441648ybg.264.1603437224593;
        Fri, 23 Oct 2020 00:13:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603437224; cv=none;
        d=google.com; s=arc-20160816;
        b=ghRKBrNDrMbJ6qWlLUDPPDHEi5fOccyKgD85ELXWJvXDFv1i5INEAIn3U0ri/KrKUS
         baXEB6ploLkfG8mbOJ7Y58msJ3eTcIEe7fwKIDIx3aoeXlAauYhF/7kyLA0LLYzax6nM
         hffwmtve2kk9EMODfAqXm6MTJXnkTxVUJFyp5ujriSvF1YKqHDCqhgesBfEK7R6P2Wzc
         r48ZDGda2d1IpO4+CqLicoAnGFvoZ2iNzUPwyEiLYRtb+aAE59l5AXlTgJe6DSgsLS70
         BO44CPUR1etDHvfcez3GdzMymn4ewr2l0idpDxzw5Xlnts0OnDJFa8i/P4SNQwtkZLkA
         EFdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5SZ9EZ04KSxvcAj2egyF4ZXsrUlIi61zoWGJNS7PnBc=;
        b=SDLI+BJmv8i1ADfda4sw9/5oYPlCjxxn22fVxnyZ5UIgSkAD9XdmoW3VjjNA5RGzY8
         vA+6AyY0bgcDQgvVFQSIVC9GT9TfU4RGAiZDJbKKeY2EoTfouHcO8+BDA0GmhhtnAf72
         wKcMkXdmTJVape1nr72n1qvbRZJrdT8emeTm2Zfnn5hb+TFq3iH4BPlk8Rky+MglsmxY
         We/MWRut0XHc7dulKQ48RTGOdYtv+RR4XP/uqu1RNedAz4VsSGthulYc1kbTPuOvpGzB
         ilh0jH5kfRifbAnBXKBmWzKAU5GJfpx4vP5IvpqZNZvgdfIb8g8IUu5pP15BpKH/BDhj
         G9jQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gIsXL4W1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c64si862622yba.290.2020.10.23.00.13.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 00:13:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gIsXL4W1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVrGh-0004zk-Sw
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 03:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDm-00014y-PO
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 03:10:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDi-0003eJ-Kf
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 03:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603437037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5SZ9EZ04KSxvcAj2egyF4ZXsrUlIi61zoWGJNS7PnBc=;
 b=gIsXL4W1Il1YukTZUCuV1WEZAQ0o+xqoW/OjdUOlMRd3fXwid5skwQNkSj9EBxVclSXPnm
 1LvU8ZKngyQ/JjAJ0bknn7CnEYy4cRxLvrIqCE3GC8p4o9GpD6H63kSiVm8e0BJjxujw10
 tTABdUO3xa9DR2UB30HdFz7Wf47hdMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-iuzA7nNbPJabd3Qnbz3Rlw-1; Fri, 23 Oct 2020 03:10:33 -0400
X-MC-Unique: iuzA7nNbPJabd3Qnbz3Rlw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 566C0804B71;
 Fri, 23 Oct 2020 07:10:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03495196F3;
 Fri, 23 Oct 2020 07:10:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 25533A1EE; Fri, 23 Oct 2020 09:10:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] tests/acpi: allow updates for expected data files
Date: Fri, 23 Oct 2020 09:10:15 +0200
Message-Id: <20201023071022.24916-2-kraxel@redhat.com>
In-Reply-To: <20201023071022.24916-1-kraxel@redhat.com>
References: <20201023071022.24916-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Or827RV8Ofm

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..5d523ded1282 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/microvm/DSDT.usb",
+"tests/data/acpi/virt/DSDT.usb",
-- 
2.27.0

