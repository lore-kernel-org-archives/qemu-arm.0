Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp383997lfk;
        Tue, 12 Apr 2022 10:00:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfPbD8LLrvCar0tb1wHfjjW26BQMfnpcjy/9Yq9QMQy0sic3fVIyK/XLDn2oJEU4giVQ4k
X-Received: by 2002:a25:9f89:0:b0:641:17d9:da02 with SMTP id u9-20020a259f89000000b0064117d9da02mr13877317ybq.518.1649782846792;
        Tue, 12 Apr 2022 10:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649782846; cv=none;
        d=google.com; s=arc-20160816;
        b=pmSUCHiVxuQyiHaivyUar5imL5I0nXIywpTwiOByoj0kxGYcYEMTNdQ8yWAhALnRCp
         +YJToM/+kZCShfjEzHTiQc+NK9zHzLS4e250d8EqoYY98Da1gZ5ZKBi8UJSHAdEzGEkY
         OponZhVgsKGHEtLtFKYqVZX8sioGJ8HYPHk4pRHOIFO7nzAjWnB8UpZDsGmypQaGEESA
         /LvOaUI5CCq3cRqVFj0jTJZ36pxD9WLISaTsPnFg/Yaeh6AK4imOfI1riHXHhGXkcZcs
         gme92JNDCKmSncZOOEArYrmMycN1jhWhjDg5ObQ9C9ecTlplY0Ajh8bxRBojXsFL8oBI
         3PcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=3UGkaZc9xE5OrUTSH8xImxxMzxvl71kQLCL8RAAtdXQ=;
        b=rFfMSybw+sdICKy21EmPPPax3BDOl4vncNv3/IclqYXPa/UJi8iY5Fmr7/ZF9wAv9y
         NZtL86R4PjH0UlaLo5E4ucXTIqa+S06xzfiODfJQNiRLviUxECtoVdqDQ+o79EKtBqkL
         Gq8k2G8XfX+Qp9dp4vjxHXEpZ0ojQ4GoNqpYbsM2bAdG8uCvldtav4RhvPgaApZkBVI7
         jbqecgiQPQrlxhW5SJZimD3BN54czKRZ/e70As3AAGGxd4DJ6LAWs5jf5QNdvXliMRn7
         OP02WWHYnnzPtv/s7rDOusAour8o7Pru1v62a+Xb4FrYgjw8DmTU20KM+kKz4pnuz/p9
         i6mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TDg9+1AE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 80-20020a810a53000000b002eb6e3309fbsi5898879ywk.375.2022.04.12.10.00.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Apr 2022 10:00:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TDg9+1AE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1neJsk-0000gV-4m
	for alex.bennee@linaro.org; Tue, 12 Apr 2022 13:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1neJqt-0006jP-Q1
 for qemu-arm@nongnu.org; Tue, 12 Apr 2022 12:58:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1neJqq-0002zy-NM
 for qemu-arm@nongnu.org; Tue, 12 Apr 2022 12:58:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649782728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3UGkaZc9xE5OrUTSH8xImxxMzxvl71kQLCL8RAAtdXQ=;
 b=TDg9+1AECnfFsRqLFP7UAR7jiT9z0UY3RXHAjt8sPbI3pcQ9ZDPw0UAMWVDb9eDsum8nHF
 27s/fa9LKOY3tSUJv8rMJyZ4TC4tGQNJ3fuwyE0czNnCMOdS5h6SELUNoyqGOZIp6/6Gc1
 rC89Cflhvd1Abti5AOVcqqb0+OoMa9w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-jICVCJA1NamFuBLq-ez65g-1; Tue, 12 Apr 2022 12:58:42 -0400
X-MC-Unique: jICVCJA1NamFuBLq-ez65g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BCD51014A66;
 Tue, 12 Apr 2022 16:58:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78552403D17F;
 Tue, 12 Apr 2022 16:58:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH 0/3] Remove some of the old libopcode based disassemblers
Date: Tue, 12 Apr 2022 18:58:33 +0200
Message-Id: <20220412165836.355850-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rA8jS2s/1Efq

Many of the disassemblers in the disas folder are based on old
versions from the GNU tools (libopcode, GDB, ...) that were still
licensed under the GPL v2. The GNU tools switched to GPL v3 at one
point in time, so QEMU is stuck with the old versions, i.e. these
files did not see much updates for new processors anymore. But
for most architectures, we're preferring the Capstone disassembler
now anyway, so the old libopcode disassemblers are also hardly
used anymore.

I'm not 100% sure (thus this is marked as RFC), but I think we could
simply drop the old disassemblers nowadays, and hardly anybody would
miss them, since we now always embed capstone as a submodule anyway.
Or is there still an advantage in keeping these old files around?

This RFC series tackles with s390, arm (32-bit) and i386 ... I wanted
to get some feedback first, but if we agree that these can be removed,
the sparc, mips and ppc disassemblers likely can be removed, too.
(I think we should keep m68k.c since Capstone does not have support
for Coldfire CPUs yet).

Thomas Huth (3):
  disas: Remove old libopcode s390 disassembler
  disas: Remove old libopcode arm disassembler
  disas: Remove old libopcode i386 disassembler

 include/disas/dis-asm.h |    3 -
 disas.c                 |    3 -
 disas/arm.c             | 4012 -----------------------
 disas/i386.c            | 6771 ---------------------------------------
 disas/s390.c            | 1892 -----------
 target/arm/cpu.c        |    8 -
 target/i386/cpu.c       |    1 -
 target/s390x/cpu.c      |    1 -
 MAINTAINERS             |    6 -
 disas/meson.build       |    3 -
 10 files changed, 12700 deletions(-)
 delete mode 100644 disas/arm.c
 delete mode 100644 disas/i386.c
 delete mode 100644 disas/s390.c

-- 
2.27.0

