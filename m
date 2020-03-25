Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp983223lfi;
        Wed, 25 Mar 2020 12:22:45 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtRFAQ/2OotT2S7DYhGC4jWjF2+0AV68GHmpgjp1/or5u+YFscamDvk21o5V78pIgj6qyzY
X-Received: by 2002:a37:8d4:: with SMTP id 203mr4478463qki.115.1585164165057;
        Wed, 25 Mar 2020 12:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585164165; cv=none;
        d=google.com; s=arc-20160816;
        b=mNekGg5a2CVkFOsrt90/7ChhlMpdeWw9qV/lIRjf0uxtEEW3qMT/96RwjVTInfyxRF
         eh/+G+avHRGarmWwzV5wie9iFX25zogssx9UQrSSwfB2hi+luAzNKpFylYTwlEd7PxZr
         fN/JPo6mrRtBz91e0LDyAZkjBXph5xnpkvK0vffzV9FTPLF+OSgVAAsiw1w18L/0guYn
         4P4nidF24S9ns+64ypsaHmyPRzDie9sv5K6VBG5yvARknROTRzNqZdhNR7SQGRb4ueny
         kAA8/2KaACIw86ysorCOULmWmSrrlIPtD1VWhWsCE8fCxjJor6QKA/phHYZLyqMHWLal
         mxSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PoRbPRQndAjunHQwtJ4X53lQZ94h16lYfKXNqfhYyaI=;
        b=BL60fPYl5bRjxEWlNJ8G07c07Z/rEiNAuZ1JWlAnYJOT7QWy86kgbHzQH+OUTIvRYO
         5c1g3Rm/aKTXBDMhPlfXBLY9D2KlNK0q9F+fnUsIbB1jkCZKCML7w8TXAw57dmZiTj3P
         KvjL4ehFEE61EuV+bYJnUkBGYWmAu7yQ4MP77MkxDeCUmam1BBlPMVx07U+y/FqgRBsb
         PRU3vmJQvkMzt91LXd7SvzBYFDnQBhuA341yw9VSSOrefFmgMdO2VKilUtV87Q4OD/Z7
         Mq4ZZZUP1l6NeUeK6WaOBR9WckyDKkiD4/FYpHHKXlDHCtcW2TVu+QiJ+2eUncDdHIcr
         y+YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="awrkhuG/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g26si8528839qvf.6.2020.03.25.12.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Mar 2020 12:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="awrkhuG/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41985 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHBbw-0005lx-6H
	for alex.bennee@linaro.org; Wed, 25 Mar 2020 15:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYB-0008SQ-DB
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 15:18:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYA-0008O0-EB
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 15:18:51 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37484)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBYA-0008Nf-88; Wed, 25 Mar 2020 15:18:50 -0400
Received: by mail-wm1-x341.google.com with SMTP id d1so4187603wmb.2;
 Wed, 25 Mar 2020 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PoRbPRQndAjunHQwtJ4X53lQZ94h16lYfKXNqfhYyaI=;
 b=awrkhuG/pWzJtErXTxcoiHf+78bzY7DFIHrCCsEqiJ5gjPeUD+8XvTRtHauXir3hA9
 seak2eHWP+wnXU4zswu6rQwVk5DeqUyjSbq7jUaDTZjpBIGwIcca6lSAM4UViRx8hn3c
 J1M8DfWVmfXtIqEpEtR1wpRdW54ds7PmJn/j6cUdvI0m/YCMn9ui6/jl36lD76oD/2NT
 C+8arVhqR9egZHX5cmMQwKTdQPkMj94XsL9MqRMiL6gSodxRA+hMBlKHTuKeuEKa+oXQ
 MW2mWkWxATf02YMa39pemmQ8iz+E7n3PghETNKKCP209DEmrfl6TVh1Wdhhsbql//mdJ
 8xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PoRbPRQndAjunHQwtJ4X53lQZ94h16lYfKXNqfhYyaI=;
 b=bEVumGahRoCR3jOIJvqlKtwSOSEN8uOvriP8KyM5cdq7uj+OXfqIZ9lFZ/0Wfgmu8p
 lLOTEwdruh+nsbZNoYTVvi64qatxEhBQX7hmwUYL9raqLhR1ayUJs4XNgouGPVOW/y3p
 BpTI4I3L9sby5UYCpg8kV5XOu1sE0VQXU6UMDYevjhUVRlrPttoxlFW597/UdbG4e42B
 jvWCiwMUIolttivj3ED2yVyDlttZfhaInCwO90Fwws1dP4OsTeIQevVNxQ6/3Mc3FhGR
 5k4dZZ76J92Z9fhUPUIDA492da7UbGv5IzEW8s75LEvZZJvPjA8ILd+6bofoXlSdRw0r
 yk/Q==
X-Gm-Message-State: ANhLgQ2x35YICMTGkrPMhBPNBBIKHIfqgMOcoI6P5b631I1ga0qREhMc
 x0xROIEFiWtW4vKvVMCHagFPJyI5+ak=
X-Received: by 2002:a1c:721a:: with SMTP id n26mr4992757wmc.25.1585163929104; 
 Wed, 25 Mar 2020 12:18:49 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id r17sm6345672wrx.46.2020.03.25.12.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 12:18:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 05/12] hw/i386/x86: Add missing error-propagation code
Date: Wed, 25 Mar 2020 20:18:23 +0100
Message-Id: <20200325191830.16553-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200325191830.16553-1-f4bug@amsat.org>
References: <20200325191830.16553-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vkEPG5lV0nQF

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/object_property_missing_error_propagate.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/x86.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 87b73fe33c..0a4865d4a9 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -103,13 +103,17 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
 void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
 {
     Object *cpu = NULL;
     Error *local_err = NULL;
 
     cpu = object_new(MACHINE(x86ms)->cpu_type);
 
     object_property_set_uint(cpu, apic_id, "apic-id", &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     object_property_set_bool(cpu, true, "realized", &local_err);
 
     object_unref(cpu);
     error_propagate(errp, local_err);
 }
-- 
2.21.1

