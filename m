Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1591956lfm;
        Thu, 23 Apr 2020 00:36:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypLJYtkb31hmutqUK396YB7IhcRld1/fpEbeZYvUu+EtHSYsB0lL0nEd00wRj5cJJz9mB32m
X-Received: by 2002:a37:6317:: with SMTP id x23mr2234426qkb.218.1587627376881;
        Thu, 23 Apr 2020 00:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587627376; cv=none;
        d=google.com; s=arc-20160816;
        b=WzwfsXzRrKl7syJJ3uBSN73UtPO+7auTsa6kXfLT4i1LRVdU+7xb1spdAFwKJGKl+m
         Qc0AtbL6WSNfHV87k6i5dnuL4N8aZFRUalaF3hZvA7LEL6yeQFROg80CyFSYvLyabH+L
         SGCV7kXg4Fttgn5E6UIEu75zgB6x8sYkY4GOCWQtSDMsvv6lVffaQMv2NvgVnGwa5K9j
         YFLplUwWsbSOtwrVkF/5S65ZSkSty5bbK8KPU4KUhtBdwWh9IL6awcMNPcj6NZbkHie9
         XZIqRYo//0mumZhk22BfObmLP0im2KYB7vEqsKzDbA9/H9Lu9PA4fTMTO+gF8RW7S8X+
         TtEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Ct7jMKth8vWbm+2CUvy6qe7DTi6gbSwkWjtezFIRh9c=;
        b=rm5tdHVbeJTwqB2f55+Qn3r/DqWMNEVNoyd/wZeSItAweKRLbZCYQ46qGgu+CSySEd
         eQ/bbvuYIRAIeMnWqlr9xYK76XWZUnTgHhH+DK8qtKnsnd4JW7TeEe7EE1cR0SiXAqxF
         39X5rjJeS97xrw2ANIp/j8wfsOXUN3DJGTPBXD4p7JUcATr6CTPBLGv+JPd6wBHB03/U
         vI42RCdZEcMVUkdo9JXTjsCosBpGH7YIxAiF5dbIc7mqYbxWXprlAK6mIbxr8HlqPMOA
         1ZsYqcKwaD4/8oA5oD8kTKBtfFY0Xy+RrW5ohEsxjnqu/1eQVzTcIgCU7qpgG8GHP2eb
         2HLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YnjnrTWj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13si823844qtr.367.2020.04.23.00.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 00:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YnjnrTWj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRWPA-0006lz-4u
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 03:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46780)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRWNG-0004yf-Tj
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 03:34:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRWN9-0006cW-Cq
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 03:34:18 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRWN8-0006ZS-Qj
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 03:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587627249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ct7jMKth8vWbm+2CUvy6qe7DTi6gbSwkWjtezFIRh9c=;
 b=YnjnrTWj3iBDW993nN0fi585Yj8N4pAxeojbz3V/gBak7IasEjluNjtWUEGG5s65scLHL8
 HF2acvx6AT+l3ThyexkUoMwOjPEBc6Ed2n1MYoKw0mgfOunTMp1R7JdK425XjOgeAUJKyn
 Em4Cgk5wpadhl9AQRQjIyEmQvahkMuA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-yWgtRDPEOkmyOFvsMqtT1A-1; Thu, 23 Apr 2020 03:34:04 -0400
X-MC-Unique: yWgtRDPEOkmyOFvsMqtT1A-1
Received: by mail-wr1-f70.google.com with SMTP id d17so2405878wrr.17
 for <qemu-devel@nongnu.org>; Thu, 23 Apr 2020 00:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oLonGkIJTHbG03JF1+Ssy7OAaXsd0W1f3V8ZSYCW5BI=;
 b=ancDYvdGi2EvSxITqRp8UAB+2DmBNKgQW0YG/KS662R8BzgRS7723eoY999uM4BVk4
 jlFfSXb605qLkgh2tGK7/1+QlAXZfMt5jFgc54MT5lmYZ+aQi3Cx6+81Nq/o9d4p6CQ7
 4XroM/jRvNjh24O8bi8t8JV1Xh36Q3wf7uXFrkut5RC6Z4PwbV/NNAahIL3EYAW/ZKag
 W+YkJqQwJJJztyij7RMzcW8PREes6IyoE4rzhCnLpskcTIkf+7ovZcqIPHFG4oc6Hdjd
 MQTm/I9bMi2gzXj2jvF+D6Hblc3MFlVV95AJjGEnpTEvhTuSHAVR46Xb+IsmxEb3sYmj
 7UcQ==
X-Gm-Message-State: AGi0PubgbK8k01Oaqfg2hCHMw3CUBzXdXmAhYAww+O/SgHcb1S99abwu
 sIEuWSSD4uhTfiTh9OodcpKiHkJgHvJ3pa3ONScu7k3oUfAohMVCyb3ziTagGbDIZ/niZCbYw9U
 FmRDkSiiBEaz440M=
X-Received: by 2002:adf:bbca:: with SMTP id z10mr3483609wrg.288.1587627243517; 
 Thu, 23 Apr 2020 00:34:03 -0700 (PDT)
X-Received: by 2002:adf:bbca:: with SMTP id z10mr3483586wrg.288.1587627243281; 
 Thu, 23 Apr 2020 00:34:03 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id o18sm2366000wrp.23.2020.04.23.00.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 00:34:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] target/arm: Restrict TCG cpus to TCG accel
Date: Thu, 23 Apr 2020 09:33:53 +0200
Message-Id: <20200423073358.27155-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 03:23:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t9MTuVstxz1B

These are the uncontroversial patches from "Support disabling
TCG on ARM (part 2)"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html

The other patches are blocked by the "accel: Allow targets to
use Kconfig" series:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg689024.html

All patches reviewed.

Since v1:
- Dropped 'Make set_feature() available for other files' patch
  which fails to build with KVM only, see:
https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg03843.html

Many thanks to Richard Henderson for his patience!

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (4):
  target/arm: Restric the Address Translate write operation to TCG accel
  target/arm/cpu: Use ARRAY_SIZE() to iterate over ARMCPUInfo[]
  target/arm/cpu: Update coding style to make checkpatch.pl happy
  target/arm: Restrict TCG cpus to TCG accel

Thomas Huth (1):
  target/arm: Make cpu_register() available for other files

 target/arm/cpu-qom.h     |   9 +-
 target/arm/cpu.c         | 647 +-------------------------------------
 target/arm/cpu64.c       |  16 +-
 target/arm/cpu_tcg.c     | 664 +++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c      |  17 +
 target/arm/Makefile.objs |   1 +
 6 files changed, 698 insertions(+), 656 deletions(-)
 create mode 100644 target/arm/cpu_tcg.c

--=20
2.21.1

