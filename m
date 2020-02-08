Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1924239lfp;
        Sat, 8 Feb 2020 09:03:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxw6h+5+1vXrtY48yNJ4QmsPjxCLIAzRHTqh2LloC1UpcZFcj7K5H3b6ZOAG9RrEBmqGUQE
X-Received: by 2002:a37:9ac6:: with SMTP id c189mr4224301qke.40.1581181419985;
        Sat, 08 Feb 2020 09:03:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581181419; cv=none;
        d=google.com; s=arc-20160816;
        b=avshtY/p6u2T6/c2zkEZsFP4LVz3F831WAiPM837ssOmxcTxxNzfte/6zt5VWa3TFZ
         0oxPf6wZ7eFgJzKDUz26YL1/hDSBVzp9Rfwd1EOZydmPUBh0oJWFRwkfR38PH8TKQ0VI
         uHrlT1deyQAmDyLRKl7QOZ+PgaeRB/QLbxGY3VnB5VhoJyQUW+NKh2xkXBjJGumJU0t8
         ZdpYuAzbv8VXSVoOPN9lZwY3Za1OSa4Q6Lp4kPTvowMBysnJEs70MUe+SgfXBa+d61f4
         a2Rk94y0y+NpGDrDsqYvfGZMWgeFQUhlH23uhOEd/Ofml8i9s0YZcPNcIDpdLW6tsAmj
         Az6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3rBdGV77acnZuRXknbrZFUu5k1x9HktZihwAmZUV2Pk=;
        b=OCf6bsb8AgJdq66QwaQ5l36jSDB18WELgZjIl9SwBCJGiHqCJgFZA0nZ9mjIJygK8U
         M6e0UV63fxYydlkQJm6EZD5ZDTyJQKmbs+ny9EqEu6NGMbYJ37E9MskjVijjnzI2X6O8
         L2chQXcScGt4E3z/I8zDCflbYQbgKzduFsjrMAh0J7GFZvG6PfBdFOgRubPSvNm54NVV
         HHdVp0omWFiRuSNVhqPujh+PS6FZDzwT+/v2s1D/SVIiIWsqq4L1uNKUMyhgNmSgD0Fx
         b+UY+5rZUZY36AJwPHiCe7woCxgUUYzk4kvknP4pSRD0of/x3i96FzGhUZBc8TJhOm8A
         0TbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QkZQuUGJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v78si1784731qkb.58.2020.02.08.09.03.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2020 09:03:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QkZQuUGJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0TW7-0007GE-Bc
	for alex.bennee@linaro.org; Sat, 08 Feb 2020 12:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54044)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ7-0006Mi-IO
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 11:57:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ6-0001t5-KM
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 11:57:27 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38046)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ6-0001sg-Du; Sat, 08 Feb 2020 11:57:26 -0500
Received: by mail-wr1-x443.google.com with SMTP id y17so2489181wrh.5;
 Sat, 08 Feb 2020 08:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3rBdGV77acnZuRXknbrZFUu5k1x9HktZihwAmZUV2Pk=;
 b=QkZQuUGJDmzyGNiVBJsQGmUxc2Tnfwxw9/o3qpL3v+pg2iMhJcYKvR6V7Eyntl80hA
 PfwqlJqFk8o1dhoXOpb3K1Hwxux8sJQjTCniu7vr6gGRzeXJ0ft3ZJuycnGihT0isfjU
 v1AvhQCRcihtDAl8lCWPMTq+4CpUiQcAYgV++ev6X7cBysKB/rC4leGtsO0jpqEWYTNm
 bVFBQxSGzLGERpQikgWJkRYdrMNOfSaaJuf+TYN5B3hJlCt/9hd5y4e0VUht6b5HGwNQ
 ofdpnyswmNRlHHh0tGakWjvxeeQo+2OuYjo+rLiVsWmlff5r90MdatBQHfNiyJJl3mR+
 /O2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3rBdGV77acnZuRXknbrZFUu5k1x9HktZihwAmZUV2Pk=;
 b=p8SRTS5/nJyF9KRUS0dOZKDIP/MQL2+yChqsgIFANJ+KN4HFtpklGmSErX9Zmt9foR
 XqGwsew6DEHwQ2J6VvHQOUZIc8up8uFMZNnzDNmkoEUrHOm0/fNmuv/6ULQSQZ3TJBsW
 WoPyU6uDYqOHUdRNWeHv4kwbWbIrrRT488CZPxkUvHZtnLf/BScNOfDZ6j5eIFMuftHh
 tsWSlA+pVaWlxoFEHtCvF1QG0wl+FMANp5xgpFi36SGuWIE0+X3zZ8xDkj/c3W8QnxpR
 fK3BVHQaV9/PRYFGTKiwvbJ1s86JnsXQ5HBoXIB9RaplYfhloaYidkLvcP6rILVROwt3
 HwUw==
X-Gm-Message-State: APjAAAUuh2ssTzJvIWNWXKAgcmewNfjD1d7sDb0/O8zhzR3RrHSpndCB
 x4UJwX/8Thk106WFT4By1spL7Rwb
X-Received: by 2002:adf:db48:: with SMTP id f8mr5819460wrj.146.1581181045353; 
 Sat, 08 Feb 2020 08:57:25 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id a5sm7872763wmb.37.2020.02.08.08.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 08:57:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/13] hw/arm/raspi: Extract the cores count from the board
 revision
Date: Sat,  8 Feb 2020 17:56:45 +0100
Message-Id: <20200208165645.15657-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200208165645.15657-1-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cLGuXw1T7F3j

The board revision encode the count of ARM cores. Add a helper
to extract the number of cores, and use it. This will be helpful
when we add the Raspi0/1 that have a single core.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index bee6ca0a08..90ad9b8115 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -101,6 +101,21 @@ static const char *board_soc_type(uint32_t board_rev)
     return soc_types[proc_id];
 }
 
+static int cores_count(uint32_t board_rev)
+{
+    static const int soc_cores_count[] = {
+        0, BCM283X_NCPUS, BCM283X_NCPUS,
+    };
+    int proc_id = board_processor_id(board_rev);
+
+    if (proc_id >= ARRAY_SIZE(soc_cores_count) || !soc_cores_count[proc_id]) {
+        error_report("Unsupported processor id '%d' (board revision: 0x%x)",
+                     proc_id, board_rev);
+        exit(1);
+    }
+    return soc_cores_count[proc_id];
+}
+
 static const char *board_type(uint32_t board_rev)
 {
     static const char *types[] = {
@@ -307,9 +322,7 @@ static void raspi_machine_class_init(ObjectClass *oc, void *data)
     mc->no_parallel = 1;
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
-    mc->max_cpus = BCM283X_NCPUS;
-    mc->min_cpus = BCM283X_NCPUS;
-    mc->default_cpus = BCM283X_NCPUS;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus = cores_count(board_rev);
     mc->default_ram_size = board_ram_size(board_rev);
     if (board_version(board_rev) == 2) {
         mc->ignore_memory_transaction_failures = true;
-- 
2.21.1

