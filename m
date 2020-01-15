Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6526570lff;
        Tue, 14 Jan 2020 22:31:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZPKEgXkzj9r8XLk/C/+lZomZ7AazbGSekdR7kMMGGJ4Y+67er+hfyHT9z4tszf74EIsFQ
X-Received: by 2002:a17:906:2651:: with SMTP id i17mr26980132ejc.246.1579069895968;
        Tue, 14 Jan 2020 22:31:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579069895; cv=none;
        d=google.com; s=arc-20160816;
        b=OGSCyRdyE6WZyc+rAAH7s0eZuiEc0C6BLdilYerHKZLlm2rO/+OO3c9wNG4VRw1TxS
         aP+SYPUEvR47Rq6XEj7fbwsE9e1H1yaR0cUREXijcc7Uc4QvKb++8gfsf615ThDoLQiD
         uhVGh/eVE/VtVm33/IzgNIftDisim2kaqZARG68M4ud5T3ovmnMdOivtppaJamm84rlW
         b8yzyUiBAvfoJ4e7VHShpKf40EzaHLtrpbFj46ADV2P3IwFvWAu9c/TfW2Ak5PNoBMDM
         hW7SCYyfaYgQeT5idob2donlRy/Y4YuLIqxi9S9ni9Hh1xUDW0He2nGk5iBruxszmz0I
         RdEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=Ah7YO5ihS+llvpQStMerRSYuJLi8vPRLqxeROsrfTwU=;
        b=HVgW0EVzsdK1AVDg2M/sYp9rYU7AYKceasSdoI2KWB+KP7pbCtSFKJiaEtAFG8iTKa
         G5oOepuTxFrNiRuMZQIKv7VsbL/kgiFWFXSOOv10ei+MPPo5ZMtZ6qib8qDGJ+JzBuvf
         vpZOYhNf9SXUrNipVNzRaX3w3rpK5H8ikyJnHWE4PRxqkWlLb1TQFn3UDGqIkYYK/P6B
         ogumRX0sA5ZVNukfgGnbSIfDJE0iHbQTLHzjZcL4HSy4wVmhANDBa/LNujPGsIPyAIeO
         4T4dyOQ7azVyArZkictNq3EaCdAzciGhwLXqzQcGTJziGF43Z+QO9MNtTjmHGo/+QS3M
         SJ1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WWg0kNpM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16si11109861edq.340.2020.01.14.22.31.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 22:31:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WWg0kNpM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ircDG-00082a-JZ
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 01:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60797)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1ircCz-0007wI-IT
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 01:31:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1ircCr-0002Qg-PF
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 01:31:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33044
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1ircCo-0002OO-FY
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 01:31:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579069865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ah7YO5ihS+llvpQStMerRSYuJLi8vPRLqxeROsrfTwU=;
 b=WWg0kNpMCYlmsX1oBg1xJwvx8YKEWLrLQpEsHhym0d90aeENhJp8x+GL1o6vnW7CJkmGqz
 Em/a0x9CCxCFjBc9jj4mUGyFsgv5xwDc/NM5rZQwZQegeupt0mM4RHadnwKGoWV2as7hlD
 /FSgNLY5q6MIW/FKURbQQIt1xmmMWr8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-xe6y6YFlPnOsSAKkuSuMCg-1; Wed, 15 Jan 2020 01:31:04 -0500
Received: by mail-qt1-f200.google.com with SMTP id 38so10560231qty.15
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2020 22:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wyTusgh69XEfBhc65/d3WUkzIkz6FnK9MLw53Bk1Xf4=;
 b=XKlVJoxgQt1YLwARolYeTgldKBZjfvN4SAlkJMd6iTs+KT4NlvAV73k6iX16Jpqpjc
 VUG0MODdzfIzn/nfCkrAVr0o/ehwxrAdcRFGtHHeFVpkOisVnDJolBNlghkqZdwZ1KLN
 4Ww1+n8+qyYPV92E64PVXYO7Nkt7UnVe98yuD09V3DCJYACiOcc32N4S9//KwFPUjsQ2
 B+RCf3ryqKArN2olNoseJNxohd+oSjzV9J4E2HapYwRV/73sS3ySmInCnumCUooD9fKB
 wkuiU6/3j0wZHDgW1NtxvUJydrRZyyySKbJ2wqZAg3rHrkI5glNaD4azH3mp2LA3PPD7
 ki/A==
X-Gm-Message-State: APjAAAUG0iEyUyYoQ7Az4xDtt/a+J9xwS+9AFhkhgt5IlkvmBhieFzv6
 GS5rx/tVD1AbnIzIGzcMJM4N5VKFXhum3v2qQpqcVICa7l4VpXKxtp+v6Qmth3gxgc+Mt+RYd8Z
 DdbrZEw68L2RQ
X-Received: by 2002:a05:620a:899:: with SMTP id
 b25mr25974580qka.197.1579069863537; 
 Tue, 14 Jan 2020 22:31:03 -0800 (PST)
X-Received: by 2002:a05:620a:899:: with SMTP id
 b25mr25974568qka.197.1579069863308; 
 Tue, 14 Jan 2020 22:31:03 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id u16sm7948257qku.19.2020.01.14.22.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 22:31:02 -0800 (PST)
Date: Wed, 15 Jan 2020 01:30:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guoheyi <guoheyi@huawei.com>
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified
 by _HID
Message-ID: <20200115011412-mutt-send-email-mst@kernel.org>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
 <20200105072504-mutt-send-email-mst@kernel.org>
 <CAFEAcA-sduqVO3rrG2V1VsysE2chgd0SnSySvEXFfue-aZN8dg@mail.gmail.com>
 <bbf347fe-c4a4-c5bb-19c2-3a18571b658f@huawei.com>
MIME-Version: 1.0
In-Reply-To: <bbf347fe-c4a4-c5bb-19c2-3a18571b658f@huawei.com>
X-MC-Unique: xe6y6YFlPnOsSAKkuSuMCg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 Corey Minyard <cminyard@mvista.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D9+VZScqr/ja


Problem is IASL disassembler still doesn't work on all hosts
we want to support. And its output isn't really stable enough
to act as a golden master.

Until we have a better tool, I propose the contributor just follows all
steps 1-6.  The reason they have been listed as maintainer action items
is really just so that multiple patches affecting same ACPI table
can be applied, with maintainer resolving conflicts himself.
But this job can be pushed to contributors if as in the case of ARM
maintainer isn't really interested in reading ACPI code anyway.

So I propose the following patch - comments?

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.=
c
index f1ac2d7e96..3a6a3e7257 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -16,7 +16,10 @@
  * 1. add empty files for new tables, if any, under tests/data/acpi
  * 2. list any changed files in tests/bios-tables-test-allowed-diff.h
  * 3. commit the above *before* making changes that affect the tables
- * Maintainer:
+ *
+ * Contributor or ACPI Maintainer (steps 4-7 need to be redone to resolve =
conflicts
+ * in binary commit created in step 6):
+ *
  * After 1-3 above tests will pass but ignore differences with the expecte=
d files.
  * You will also notice that tests/bios-tables-test-allowed-diff.h lists
  * a bunch of files. This is your hint that you need to do the below:
@@ -28,13 +31,17 @@
  * output. If not - disassemble them yourself in any way you like.
  * Look at the differences - make sure they make sense and match what the
  * changes you are merging are supposed to do.
+ * Save the changes, preferably in form of ASL diff for the the commit log=
 in
+ * step 6.
  *
  * 5. From build directory, run:
  *      $(SRC_PATH)/tests/data/acpi/rebuild-expected-aml.sh
- * 6. Now commit any changes.
- * 7. Before doing a pull request, make sure tests/bios-tables-test-allowe=
d-diff.h
- *    is empty - this will ensure following changes to ACPI tables will
- *    be noticed.
+ * 6. Now commit any changes to the expected binary, include diff from ste=
p 4
+ *    in commit log.
+ * 7. Before sending patches to the list (Contributor)
+ *    or before doing a pull request (Maintainer), make sure
+ *    tests/bios-tables-test-allowed-diff.h is empty - this will ensure
+ *    following changes to ACPI tables will be noticed.
  */
=20
 #include "qemu/osdep.h"

