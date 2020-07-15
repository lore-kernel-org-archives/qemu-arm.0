Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp560214lfm;
        Wed, 15 Jul 2020 07:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdHM9bhfFL7Xb/km6KZkcqp9ev9YDd9+VXEPBFqDxO+yRPGm5D8u/IjmcF0U43zzqaSIoB
X-Received: by 2002:a25:e08c:: with SMTP id x134mr16232316ybg.291.1594821900783;
        Wed, 15 Jul 2020 07:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594821900; cv=none;
        d=google.com; s=arc-20160816;
        b=cbA1/nNQgSTAFDldN/GHDmgXG3kNVT2KYVTyk9OyMbaU1R33o6uiuyv/Le31fthDxw
         Siy6W6lVh2vYBKAKJ4hxEZ/JSK3izCs/HhXSSwhnKDf4vJRQeCO6LJPRPF3PFGxSLnVU
         aGCWQzMQRz7KEki8vj2zdqKA+HIxylLZ75Qrznyp8e0e+BWvYUbFXOlnyLu5ThTxi0mF
         HTvpvng9khYZ7DAMMhf8yyQV5liXSc1jApa/K+0riLivKytHEg5CEKEMOYj4r2Eohmm5
         BZA6WWXIbdiUlM5U1ECAWWNrqdm1W5VaZuFKYDmdhJHotHZCkxqSiQhNZYFENuOThO3w
         tSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1Hg+tUVj5NWbsWGvRXcV+9lO/YZJmwxp44+OhFTOeUw=;
        b=iDZkqD9E6n8Z4dqi0xmbI9m7GuYmsPGWRqI2/2dRny74+ZZxl6JsEDOXrwro/qX9Wk
         bFCNI0j0b1MPn+toJoJu+yOXQKKI4/8mIRuqiKyt800/5MFRiEGT6naKeGLZgBoDVm8V
         f6Mg4GCZQ+AcKDeDEXugiWadzXtZZ6a9f7Z7g4XGJ4MNHttkcsob6WUm6agVMaSKPQKc
         Reg7aCPs6SogEzJ4oZhjFLv+PAv84oeyZ6tqg5eqN3TRv5I31NR3U70v4a9sXTNtdWxe
         04JJwhniPsign/+AV2kmwQhvjBekUlA9+C3vDWgAzYjIHjWX56I6OQGBGqDAgwG1mEh9
         N95w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HVEOKilI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si2817126ybe.108.2020.07.15.07.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 07:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HVEOKilI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvi1s-0007Pw-4A
	for alex.bennee@linaro.org; Wed, 15 Jul 2020 10:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvi1i-0007Mk-PS
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 10:04:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60704
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvi1g-0007Ip-K5
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 10:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594821888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Hg+tUVj5NWbsWGvRXcV+9lO/YZJmwxp44+OhFTOeUw=;
 b=HVEOKilIp+GrQWH/mbC/n7aQ14Ayr3q7JuP97rCueZ5N6Dce6hg2Ftql3VF8H9JmIA9my8
 YB4cas+Fq9Bgyw3YieQ93EKJlh5CchYJMS9qqSZEGZMGG8Vt5sy7LU6shvTXx//wcOq3+h
 jw61dLf/hgFR7YLnxVBtvwg/FUeyxFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-Sn6r-kSvPbiaIPJQ2QnwIQ-1; Wed, 15 Jul 2020 10:04:46 -0400
X-MC-Unique: Sn6r-kSvPbiaIPJQ2QnwIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD944102C7EE;
 Wed, 15 Jul 2020 14:04:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E7C079CE4;
 Wed, 15 Jul 2020 14:04:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A66D511385E0; Wed, 15 Jul 2020 16:04:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.1 1/2] msf2: Unbreak device-list-properties for "msf-soc"
Date: Wed, 15 Jul 2020 16:04:39 +0200
Message-Id: <20200715140440.3540942-2-armbru@redhat.com>
In-Reply-To: <20200715140440.3540942-1-armbru@redhat.com>
References: <20200715140440.3540942-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 05:07:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, qemu-riscv@nongnu.org,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 alistair@alistair23.me, mark.cave-ayland@ilande.co.uk, sundeep.lkml@gmail.com,
 b.galvani@gmail.com, nieklinnenbank@gmail.com, qemu-arm@nongnu.org,
 palmer@dabbelt.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V+qOpZm6oSt4

Watch this:

    $ qemu-system-aarch64 -M ast2600-evb -S -display none -qmp stdio
    {"QMP": {"version": {"qemu": {"micro": 50, "minor": 0, "major": 5}, "package": "v5.0.0-2464-g3a9163af4e"}, "capabilities": ["oob"]}}
    {"execute": "qmp_capabilities"}
    {"return": {}}
    {"execute": "device-list-properties", "arguments": {"typename": "msf2-soc"}}
    Unsupported NIC model: ftgmac100
    armbru@dusky:~/work/images$ echo $?
    1

This is what breaks "make check SPEED=slow".

Root cause is m2sxxx_soc_initfn()'s messing with nd_table[] via
qemu_check_nic_model().  That's wrong.

We fixed the exact same bug for device "allwinner-a10" in commit
8aabc5437b "hw/arm/allwinner-a10: Do not use nd_table in instance_init
function".  Fix this instance the same way: move the offending code to
m2sxxx_soc_realize(), where it's less wrong, and add a FIXME comment.

Fixes: 05b7374a58cd18aa3516e33513808896d0ac9b7b
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/msf2-soc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 16bb7c9916..33ea7df342 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -82,10 +82,6 @@ static void m2sxxx_soc_initfn(Object *obj)
     }
 
     object_initialize_child(obj, "emac", &s->emac, TYPE_MSS_EMAC);
-    if (nd_table[0].used) {
-        qemu_check_nic_model(&nd_table[0], TYPE_MSS_EMAC);
-        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
-    }
 }
 
 static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -187,6 +183,11 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
         g_free(bus_name);
     }
 
+    /* FIXME use qdev NIC properties instead of nd_table[] */
+    if (nd_table[0].used) {
+        qemu_check_nic_model(&nd_table[0], TYPE_MSS_EMAC);
+        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
+    }
     dev = DEVICE(&s->emac);
     object_property_set_link(OBJECT(&s->emac), "ahb-bus",
                              OBJECT(get_system_memory()), &error_abort);
-- 
2.26.2

