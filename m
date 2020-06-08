Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5219775lfc;
        Mon, 8 Jun 2020 09:21:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8E5rcNpQboJECJB+Yv/inpVaPUDpCvI1CESdKEaEDlhKIL5jb+wMkmPZagpOaj3pq+vOp
X-Received: by 2002:a25:ac45:: with SMTP id r5mr40008184ybd.138.1591633281684;
        Mon, 08 Jun 2020 09:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591633281; cv=none;
        d=google.com; s=arc-20160816;
        b=IaPEO0y23/EupVcHFi+n8D//SHxhnZQgvBdgmw/OIGckj72Nv/SdryVn5PyONpmIfA
         BDd8264JXWboDkuF6hufGGqNVEms/rDq84AIpYkfS+YFidwAI2+HJctAFFmf52EsNy0h
         DAPYtt3ogVNLrigJHl+QLI9r4S7Dg5m8TruffdPZAKB5b2ezwwRwgypl3adOJTaPI3eQ
         xOCx7TOVk43d8DBmLaw0wqopDjGj05q+HIxjGHN7decHYPGzA9ieKuvsDdU+vxx00VIE
         bGJ0ijjn5ClefkNMXbUUp1wjhhb9YCHLXkdNGNHp1hYcbih0WdrI3U7L1j+r0GY3n332
         9kqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ERIE6m4jxrzYfG68k2WyVt3M0Z5JMhyFzvtHzf4SuG8=;
        b=A9FCO2Yj7gf6YRi7KfYbvJbb6aymEkiR/s90XP5kehorRUHh/avgkGCna74sBBFGfh
         JiZlYWkpao7AqMvaQCE/kpkGCZ4s/ah9u2+LsrlYB2SlrdJ4dvJ8Jca4XlmRyjx8677i
         cOsUpDFdYsd+137aSe6H2iC+CJoBGNQnFhSFSVyVrOaS+N4x9kaNfQbNAyFtn2YeJ3Q0
         x8GNt4URMeMdswA32YJKTjkxWapJULft8hCCwUACguTV9ChBRqHBEMGHKhIJiF/ZvJ1o
         xjDAuq0A1t+yCU18NqCvAbd+whztEMZSYyNTcT9Re/KH5kb1lUpsaJRSDjaEjsbfdpUA
         wSBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WJAxC2QJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 203si73670ybo.157.2020.06.08.09.21.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:21:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WJAxC2QJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKWX-0007ad-0r
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEj-00078I-Ib
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:02:57 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22178
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEi-0007vJ-AE
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ERIE6m4jxrzYfG68k2WyVt3M0Z5JMhyFzvtHzf4SuG8=;
 b=WJAxC2QJF/zyAyxD0CrYTv2vsEDSxyx1mw2ujtLCJ5L+7WRaJz7x8u0XTXVj5YgSJZOAnC
 0NhB5aLHKltVFfDeTo9+onLXg8n1Z5zjUe5ULDqc/xhlrdi7UFBzOfTil/NNeJZB/1D78r
 d/qDdQTqBMrQiCQfL7FgHx9vlvc6KfU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-ge8wWruzMZ-FHn50MhsvVg-1; Mon, 08 Jun 2020 12:02:49 -0400
X-MC-Unique: ge8wWruzMZ-FHn50MhsvVg-1
Received: by mail-wr1-f69.google.com with SMTP id s7so7360963wrm.16
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ERIE6m4jxrzYfG68k2WyVt3M0Z5JMhyFzvtHzf4SuG8=;
 b=orVNJkSSpr1L37RoQe5wKeWXA82j+x9bokwZa4CXkx+Uln+m01X9qHPLyS5sR1HGwg
 bNDOfhYU+bgPTkASMZqLm1TGfgSYsf15VA0bb+kCgClgew2JbYtEABrmmtMruoYoVYUS
 7W3KsS3g51EQzSnImJlF1Zd7uncwerdzLpN3wjLkO4wRd+H8hArfL/jBboGhzRGit82W
 naAMYXTJtF72V/dY2GMe1xCqT00VYWyXEJw3azqTaoqe6eJlmsbsIHrb6u2fQbWWImmW
 SCTegYqtfiE9jj4ZqIqx5QLo9uA7bKd9F3R+opBPoMJEVpmGkY9xFSTf9rayuvJx02AA
 mgCA==
X-Gm-Message-State: AOAM530Fvz9VhERMsqu2slBrTDPj7oNRiMOaUtCi1BTfN9m/cl3w48KI
 7fet+nBU6yDyfF7k8HDoJQb4WXnrXTaLjCHDRDrj/kg7IAvEcSs+ngRJBEyk58P7GHNGFTV1MUq
 qBbyKd0PCIJ0R
X-Received: by 2002:adf:cf06:: with SMTP id o6mr23925397wrj.163.1591632168114; 
 Mon, 08 Jun 2020 09:02:48 -0700 (PDT)
X-Received: by 2002:adf:cf06:: with SMTP id o6mr23925378wrj.163.1591632167963; 
 Mon, 08 Jun 2020 09:02:47 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id z16sm155794wrm.70.2020.06.08.09.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 21/35] hw/lm32/lm32_hwsetup: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:30 +0200
Message-Id: <20200608160044.15531-22-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ic7HKlQ+NdJs

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/lm32/lm32_hwsetup.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/lm32/lm32_hwsetup.h b/hw/lm32/lm32_hwsetup.h
index de94de177a..f4a4d8fe4b 100644
--- a/hw/lm32/lm32_hwsetup.h
+++ b/hw/lm32/lm32_hwsetup.h
@@ -27,6 +27,7 @@
 
 #include "qemu/cutils.h"
 #include "hw/loader.h"
+#include "hw/qdev-deprecated.h"
 
 typedef struct {
     void *data;
@@ -57,6 +58,8 @@ static inline HWSetup *hwsetup_init(void)
 {
     HWSetup *hw;
 
+    qdev_warn_deprecated_function_used();
+
     hw = g_malloc(sizeof(HWSetup));
     hw->data = g_malloc0(TARGET_PAGE_SIZE);
     hw->ptr = hw->data;
-- 
2.21.3

