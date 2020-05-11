Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2445000lfb;
        Mon, 11 May 2020 01:17:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypLkRjZ0kFGaMsK7zdRNew+2Cd0vcXTkCUZxNgtJ/wui3N/xFjlcC32DheUxDLTf5G8IY2xZ
X-Received: by 2002:a0c:e60d:: with SMTP id z13mr6326257qvm.137.1589185057771;
        Mon, 11 May 2020 01:17:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589185057; cv=none;
        d=google.com; s=arc-20160816;
        b=QB7FIiQ0eqatsMScv66ZQdd+t2vQEFhqvVQYpsAlbplh89dJoGAI9mPi9AVh6kLxP3
         Cd2CkZn/+lsT8alP3oX8fei9ZT+7Wd3whm2qJqTGGoKnDuGdmHxFZPzwJzgATymPtati
         xHOF4Z5I2IBjDwC1E9e7mNyWpJn7oEcN0S+rKxaJFeXpXT4aJNwZKq/IEjGfaEEAEscc
         x4sCLiU7CecIqGV2zj0WbXAbwWDJ8xJ5odn4ZwG6NKnYL1tP+Vpkvt6xgQmAZ8My1B0x
         9JJ/Iuf7ulRorbCdU7Z4qmOaqxq/lf+5Mpf6YvxRxteqoz2+kNT9M0cq8n7jJl0P04bM
         P5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=rIPhqoKFhvCMyRl2KtOiDjv/4TZafEjLFWFcywObE8c=;
        b=dQdcRSsoE0JT1ZveGzB4VQcU0Y+DLcyXeHMAgMRjG508A+lQn4WM0ul40sNQld0Ev3
         wJVudgLmzSYshtA7FkO5k4CznXHnX1xLtzkN8orPBsuPabwQTLfSIppgFvHIgbSMsJXd
         CZmkJW80PlKTlythyNC8KK0UcluplKp+WIkBmqNp76NTSnu8AxW1Pa7U2Qhc9Akz/NzR
         FguF1Nr2wRG4J9tRUTMPCQOgENVaEKmFovykcONIAWPJ2Na7rkAi7x3rZJ9kCKFATk6g
         OUxdtbyVk1l7EbzL40IjcOhCPjW8LNIaJkdB5hO513uxbJcTVWZiRGOXSO49+nQKHibU
         74DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WygJmv5K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a73si5091704qkb.188.2020.05.11.01.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 01:17:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WygJmv5K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY3d3-0002hy-71
	for alex.bennee@linaro.org; Mon, 11 May 2020 04:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY3ct-0002ej-5e
 for qemu-arm@nongnu.org; Mon, 11 May 2020 04:17:27 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27099
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY3cr-0002lP-P5
 for qemu-arm@nongnu.org; Mon, 11 May 2020 04:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589185044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rIPhqoKFhvCMyRl2KtOiDjv/4TZafEjLFWFcywObE8c=;
 b=WygJmv5KF8wTvpHT+gWc7TERtMpbofb5au/QmbEOm5DXIhYjCjq8x7kqTN2av0Jmi2FL0i
 qGvsB0DytHqT3YpA0c9Z2DA7rXPQWKyO8iiIi6rHcZ56GXRs13sv0OXp7uc6RABtD1L+Tb
 9RyWKmEjkOUMUdds1iy7n3VG0Oz5blw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-qzx68X8lMJSV9RG0fWzDCA-1; Mon, 11 May 2020 04:17:22 -0400
X-MC-Unique: qzx68X8lMJSV9RG0fWzDCA-1
Received: by mail-wr1-f72.google.com with SMTP id 90so4813908wrg.23
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 01:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rIPhqoKFhvCMyRl2KtOiDjv/4TZafEjLFWFcywObE8c=;
 b=fhMdnsQbEKvXXK9ooSszCEXnHxMaWRjw/d4nV6vEHSssAqTTBQpVYRRb9S8nzsasGK
 WYEwfR5l8KBlLmwAZbAhgi75hTJOSFYXBBzwwNoeLyjZGnIYNJgFnrkUw72bV/8MzEIH
 iJvHwe3JC0OrE04/ZAge8LVBYuvMKmVkrsf9rffQutNMPzGi37AZgB0IPcRmZq0AHgtR
 JNeU0wEas1/wjWwPykQPeYBfytafBIdn9o+PnX0jYklQyNU7WZu5QiO63psfWNPurjiY
 pad0jC5pFs8E+sRauteH2gzIgKgAEEeZgCvbUCjsyBMpqvlgcc3dgfO4c9Y4ERBvBCw6
 94pQ==
X-Gm-Message-State: AGi0PuZPPGxGdXjkbLiRalGPuV5dGHv+W+yyBN4zm5T8CjuCeatsA8Y5
 zIHyAAot2nYa2kbP7oDcKRMOHjW2yChX8tdCfOcM0xokUeNZxbO4nDQf1mlzEexXgkh1HCW/N4w
 oJuPa7IVhJTDq
X-Received: by 2002:adf:f6c4:: with SMTP id y4mr18802900wrp.81.1589185041678; 
 Mon, 11 May 2020 01:17:21 -0700 (PDT)
X-Received: by 2002:adf:f6c4:: with SMTP id y4mr18802867wrp.81.1589185041495; 
 Mon, 11 May 2020 01:17:21 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id k4sm22603053wmf.41.2020.05.11.01.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 01:17:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] memory: Add memory_region_sync() & make NVMe emulated
 device generic
Date: Mon, 11 May 2020 10:17:15 +0200
Message-Id: <20200511081719.31641-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 01:43:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dfz62KrUZ/We

Remove the pointless dirty_log_mask check before msync'ing,
let the NVMe emulated device be target-agnostic.

Supersedes: <20200508062456.23344-1-philmd@redhat.com>

Philippe Mathieu-Daudé (4):
  memory: Simplify memory_region_do_writeback()
  memory: Rename memory_region_do_writeback() -> memory_region_sync()
  hw/block: Let the NVMe emulated device be target-agnostic
  exec: Rename qemu_ram_writeback() as qemu_ram_msync()

 include/exec/memory.h   | 13 +++++++------
 include/exec/ram_addr.h |  4 ++--
 exec.c                  |  2 +-
 hw/block/nvme.c         |  6 ++----
 memory.c                |  7 +++----
 target/arm/helper.c     |  2 +-
 hw/block/Makefile.objs  |  2 +-
 7 files changed, 17 insertions(+), 19 deletions(-)

-- 
2.21.3

