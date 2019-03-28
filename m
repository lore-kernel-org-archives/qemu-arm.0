Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp771842wrx;
        Thu, 28 Mar 2019 08:37:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrhfhNt314D4s7zW7nRJpUqj1+r3MqoGdJbxnpOi/2M82ZzpJzetDz8m383NEh4edeGOD/
X-Received: by 2002:a24:e50b:: with SMTP id g11mr614581iti.14.1553787422874;
        Thu, 28 Mar 2019 08:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553787422; cv=none;
        d=google.com; s=arc-20160816;
        b=TSz9ALOoJF6sjtR7TOJijpHysq+EYNgEW9N2BtqGrVMPVJ7ZNhJPZpbc456TWz/M1o
         pzFSWAHFf/qARCyrRpS8ypeVc8QafNkqfiYTdVaQyuPzHZmcCe9NLk7lBYLTblYmCg7X
         7Tt9Fy9HtSIh1xGGTILZc6HsyJG8usZN+DGHOTAXiCsRUsZgSSxKWbhNaFPD8DHZx8nC
         6F4RoPRkZ7svbzPl54Zivi6WPRxcs4xoF0QfkROXxCXX43LqccN5fSln4JWonJlH6bMp
         ElOc5VL6rrSXKkT4Egui0zWPyRqDESt/E4K4i52d0VFZRIndqk0z93eEmsluEwiWDYs6
         dITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=nLfsATJ9/2ff5gfAGx6urQ8EsaoFWl5q3jYMqRIO+yU=;
        b=T/IEyn0l6EoN+0QnmQTcisDnF/YZwhQ0SWhKN7AboZ+ENVkrS4FsYr6bh/ELOruwOs
         ph7pvqp12wpI76HtbF4PA4ja0sblHASYd/lISgt824hIDUNik4vbe+3DWNX0EgS7qE18
         NYc+jNQTztLaNrFUf5s0LG3nERYn0UmJ3sDu5AodidCxOQrzNkr4nWyi09CARhm6T3Ya
         08WK3QW0FBUB/hSaEtNxPtswUzDeCGPMRhR6aIZndldcsykGXcop5kTEeYOI3wgMkPum
         JRSBkrkvsMsT4tTz32QTm9jyb8hICiHIXAD7WSKeY+li1Jxd7PanefexyGQXaN7kSqKg
         HZdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=t6ir2ucL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b132si1924194itb.4.2019.03.28.08.37.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 08:37:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=t6ir2ucL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:38077 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9X5R-0007sx-VX
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 11:37:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9X5C-0007n6-7I
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 11:36:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9WyR-0005GP-UK
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 11:29:49 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39039)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h9WyR-0005Fx-OK
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 11:29:47 -0400
Received: by mail-wr1-x442.google.com with SMTP id j9so23429507wrn.6
	for <qemu-arm@nongnu.org>; Thu, 28 Mar 2019 08:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nLfsATJ9/2ff5gfAGx6urQ8EsaoFWl5q3jYMqRIO+yU=;
	b=t6ir2ucLu9ThlgiSq9PjQ5VZz17UfvkvkPF63MK0UhtIzEIF3nl3TnOuBkHPjt4iov
	unvl8gL4iprKkcxaOsCfZm4N0hDzNQnokZbS34SDSyN3UzgUowDA/QvFeka6Um4LeMA4
	mGv1ZtlwhPOAPP6sro2XvvfcrwVRUXoYXAhRsfrv+A7datt1IVFDE1228DTfhb5pE9IB
	vv0HuwZN5BisOwjb/RwdIh115rotJZ5JbxHd7E1k+jBRKjMYJblVCTq3dvg36ryxsQNM
	ebmyCwi1rAGfSxw1uJ25T41tnX4jzYfqynj9GlsPGD7bpgNe6RvdTkvi0zA4Rc6ZxX4K
	Z0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nLfsATJ9/2ff5gfAGx6urQ8EsaoFWl5q3jYMqRIO+yU=;
	b=eYOdd4aOVPEPnSqANkDSrYUgeWhHy0mTnZ4UJidU/kzlqpvvggR3XOuykl9tVh3EpR
	gPpbo2Hpg0EYu/mckjgBHeTdOlH7FMyMtm3I6nqRaXDDeYPA+BDIXpQ75LvoLsPEbitb
	b7ukwzbIHoYzb4G8DHZxiwxH/CJWpum+5Stgbds0ICI9XXMa52gkDzirjULGkIpu2Tbm
	nVQxTzCKnqTgEi5FHXF1qQwa9QBwOBNX/1h3J+cjboH+gVpDYNREpphNHIcZiSXpKZN3
	RywZsl7vbT/mr3sltgD62UPi5kQ+XDOpvFj/JTkYyHtc6wzmpuTxsueBX01yJsBriT04
	KVZw==
X-Gm-Message-State: APjAAAU/rQ7LitN7swwIME3G7PY+AsYVtPD/2S2HV17ppdXijps24j1H
	9jAqTevaSYBTZ1mXUR5xYN0BgydGRNk=
X-Received: by 2002:a5d:4f89:: with SMTP id d9mr27217022wru.195.1553786986511; 
	Thu, 28 Mar 2019 08:29:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v1sm24076718wrd.47.2019.03.28.08.29.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 08:29:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 28 Mar 2019 15:29:44 +0000
Message-Id: <20190328152944.3199-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH v2 for-4.1] hw/arm/raspi: Diagnose requests for
 too much RAM
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hAc81DsHJTmP

The Raspberry Pi boards have a physical memory map which does
not allow for more than 1GB of RAM. Currently if the user tries
to ask for more then we fail in a confusing way:

$ qemu-system-aarch64 --machine raspi3 -m 8G
Unexpected error in visit_type_uintN() at qapi/qapi-visit-core.c:164:
qemu-system-aarch64: Parameter 'vcram-base' expects uint32_t
Aborted (core dumped)

Catch this earlier and diagnose it with a more friendly message:
$ qemu-system-aarch64 --machine raspi3 -m 8G
qemu-system-aarch64: Requested ram size is too large for this machine: maximum is 1GB

Fixes: https://bugs.launchpad.net/qemu/+bug/1794187
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Changes v1->v2: use '>', not '>='...

 hw/arm/raspi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 66899c28dc1..fe2bb511b98 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -175,6 +176,12 @@ static void raspi_init(MachineState *machine, int version)
     BusState *bus;
     DeviceState *carddev;
 
+    if (machine->ram_size > 1 * GiB) {
+        error_report("Requested ram size is too large for this machine: "
+                     "maximum is 1GB");
+        exit(1);
+    }
+
     object_initialize(&s->soc, sizeof(s->soc),
                       version == 3 ? TYPE_BCM2837 : TYPE_BCM2836);
     object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
-- 
2.20.1

