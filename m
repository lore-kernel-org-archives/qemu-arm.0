Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp290819lfh;
        Wed, 18 May 2022 02:40:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUFYXM0E5h+45OyKJd0UPv0DYf1qKUKVchIABhdmEEv8kZL/Dm9YRsLPLYnEXJcoWTrX8p
X-Received: by 2002:ac8:5dc9:0:b0:2f3:c1de:c0da with SMTP id e9-20020ac85dc9000000b002f3c1dec0damr22971610qtx.313.1652866835406;
        Wed, 18 May 2022 02:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652866835; cv=none;
        d=google.com; s=arc-20160816;
        b=hnVgrnG+C4RF4GHbbsx3noZJNpwt3qAQzRDqyXbxMqpcKGH7vfzxbBzxH5igzYMIU9
         M30HRCj6qSvTjq0dMTz0Xm0/2MaafRnTwL/x83SlVYPiUYGkdQpnlDwmzX5Eai3bL3dY
         viJGPdgf0crAGXZr60h7EKLmIg+Ub0jgMK4Uae6ATi3cSRcxJG3m1JU7KI2rGITFlRia
         PxFTO0KGzPuvsLAyK+f/E7f606pzCI5vtGSmaeY8U8hKXttCA8+aMdmqI6M/sF6iiOnb
         n8ZtnVvoxb1WU4XfsE38yJpfA4V7TsGNyCZqEhPkcGE/u1OA82MVSorzDNxj2c3HSNLe
         Mtsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6KA4XDNcMANnu+KcptlpXyyn0DXRCtSr59qSg5uqo7w=;
        b=d7UpjuP2X3lcus2/82XmSPc5L5IfPyTizwoMnDVRkZvBV95g5SxPJc5UC8FrSQR8gO
         hIknwdKQl4lgGtqiTFDcQBMuOqkuuG9lZtpTeXih02QY7EF3qBBp4cSTSZFAElJRGvPt
         NgoyS+IO9UBicxAciymXr4AWhGSKV5TQYJl/EnYz7kdJ1m64iYR62FgHzqZ+Np2kL9/W
         WI3ouhMDDiXGPk2gtaUYPi2q85FLd+SJwC3GKXDZuc82nbfav3SzOVuPl9U/DtJ4kkvb
         uLJHhRpNItv+bfy/Ac7pMDwvAT1QZqV+idutDX0VXg7FCyAnSqtpQ478a8JJlAupiROC
         56OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g4U5TzQi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p63-20020a374242000000b0069f92e72e59si863557qka.383.2022.05.18.02.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 May 2022 02:40:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g4U5TzQi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nrGAU-0004r9-T8
	for alex.bennee@linaro.org; Wed, 18 May 2022 05:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nrFtU-0006Q8-Vh
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:23:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nrFtT-0007J2-Gt
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652865778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6KA4XDNcMANnu+KcptlpXyyn0DXRCtSr59qSg5uqo7w=;
 b=g4U5TzQitG6RWDXQ2J9qlHBRYRUUI4wLO1eSjLGTadvBS6nu9KsDBIk5hj0Dsgu8urqCAI
 ZYmJhjytx3I9C/QvxGpsvpuSJcfF4BdBh2YQyfqcaEy5Vo8y3pUKQWoneA0AggYURptuHh
 ZlYFaf0tY71y7At5k/D9tSK+VQeaeUw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-lBL9uqt6N7-9lV9WZp9n0w-1; Wed, 18 May 2022 05:22:55 -0400
X-MC-Unique: lBL9uqt6N7-9lV9WZp9n0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67812811E78;
 Wed, 18 May 2022 09:22:55 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D1771121314;
 Wed, 18 May 2022 09:22:47 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, drjones@redhat.com,
 wangyanan55@huawei.com, Jonathan.Cameron@Huawei.com,
 peter.maydell@linaro.org, berrange@redhat.com, thuth@redhat.com,
 eduardo@habkost.net, lvivier@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: [PATCH 3/3] tests/acpi/virt: Update PPTT ACPI table
Date: Wed, 18 May 2022 17:21:41 +0800
Message-Id: <20220518092141.1050852-4-gshan@redhat.com>
In-Reply-To: <20220518092141.1050852-1-gshan@redhat.com>
References: <20220518092141.1050852-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PloacvS6I1SL

Differences between disassembled ASL files for PPTT:

@@ -13,7 +13,7 @@
 [000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
 [004h 0004   4]                 Table Length : 00000060
 [008h 0008   1]                     Revision : 02
-[009h 0009   1]                     Checksum : 48
+[009h 0009   1]                     Checksum : 44
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
@@ -24,9 +24,9 @@
 [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
 [025h 0037   1]                       Length : 14
 [026h 0038   2]                     Reserved : 0000
-[028h 0040   4]        Flags (decoded below) : 00000001
+[028h 0040   4]        Flags (decoded below) : 00000003
                             Physical package : 1
-                     ACPI Processor ID valid : 0
+                     ACPI Processor ID valid : 1
                        Processor is a thread : 0
                               Node is a leaf : 0
                     Identical Implementation : 0
@@ -37,9 +37,9 @@
 [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
 [039h 0057   1]                       Length : 14
 [03Ah 0058   2]                     Reserved : 0000
-[03Ch 0060   4]        Flags (decoded below) : 00000000
+[03Ch 0060   4]        Flags (decoded below) : 00000002
                             Physical package : 0
-                     ACPI Processor ID valid : 0
+                     ACPI Processor ID valid : 1
                        Processor is a thread : 0
                               Node is a leaf : 0
                     Identical Implementation : 0

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 tests/data/acpi/virt/PPTT                   | Bin 96 -> 96 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
index f56ea63b369a604877374ad696c396e796ab1c83..10b98965dbf831e717cc36509de87dafb244a31e 100644
GIT binary patch
delta 41
icmYdD;0g!`2}xjJU|@2Y$R#Jr3}m4I5unUOTV()zssxb$

delta 41
icmYdD;0g!`2}xjJU|{l?$R#Jr2xOrE5g>1(tug?7<^+)d

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index cb143a55a6..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/PPTT",
-- 
2.23.0

