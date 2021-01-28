Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp289230lfo;
        Thu, 28 Jan 2021 06:55:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSzh4miB6Zh/Gjs7yHNngYLCpAH4iyb4pKnk5gmCzgODYno9MoVEBAaYcVZyAgelF4H3bG
X-Received: by 2002:a25:bf83:: with SMTP id l3mr22099123ybk.401.1611845751113;
        Thu, 28 Jan 2021 06:55:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611845751; cv=none;
        d=google.com; s=arc-20160816;
        b=s8hXXJCSO9JNzJgeqrkO/BQQ9AeyFM2QQJ6PDU+ta8ZlsBcmQwFMVik5bA34tCppoY
         Vw5hKSupokS5jISobyIZ0KBfctfm4sxXKq7a2/xZycpuH4o/Ni5mlTUMXFbXcrxoOCgN
         uwibbPiigJqqdJVRcF9kPBduqr2KyOktMjgLC+RREiYzFLSqGQwAVT13mOXWZAILuLOK
         E+3213Q33LiHi0p/o7nkCHLCKevB/NUVI6N9c3BeaBT/bKVk6omZqqV0i/msbg8wV5nd
         TkbzpEh2X3WThQMRGTlijfrn6a+bhW63RT5ZrYNiku1jwxgbgQZBs2X7OmFr+i+PoW5a
         1ZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence
         :mime-version:message-id:date:subject:to:dkim-signature
         :content-transfer-encoding;
        bh=CwIzZY+icXAromiv5CRK9UyIyDpPAQZIjNKEhQpqmVI=;
        b=HK1wWyj7PkuWdX4cf1ccRB445E2wnNMS7NUucYxrGFvXU5XiAkKcNDaQwhd3ZDwp6N
         xSvnzs853sLXcvQpCLnQK3tt5GSev6hIh6zz7oKNxydPdbCt130CIZQEu7ax6s6kyj1f
         5+u2Y/0XYo95wt/GZfW8MHSOv0dN8BoIGbvNjY9j9J1bzXAJI4OVjMDb81BOoYAcuDcW
         Sxw9yUp/cMaIod/XMwOYyS87T/hYauABSWdiXcLD9U0DUuq6UsoHbNr1yLw5nFnMwVk6
         LpKv30ABPVyHXSe9M2M+6VNBd1Ny1aJH7P0/UU2qyuR3QSxbgam1/lM8CNKbcoh42izn
         DPqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gtri.gatech.edu header.s=unifiededge header.b=rExLeuKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si5982769ybk.80.2021.01.28.06.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 06:55:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gtri.gatech.edu header.s=unifiededge header.b=rExLeuKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l58i6-0001zV-G8
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 09:55:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l58ZQ-0007bU-KC; Thu, 28 Jan 2021 09:46:52 -0500
Received: from unifiededge.gtri.gatech.edu ([130.207.205.170]:20950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l58ZM-0000c3-5H; Thu, 28 Jan 2021 09:46:52 -0500
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=gtri.gatech.edu; s=unifiededge;
 c=simple/simple; t=1611844300; h=from:subject:to:date:message-id;
 bh=rgvmgdcyzggiCgfSXThLfGZq+ttZqivy+Z4oyt+0EFk=;
 b=rExLeuKUMJ1LJnvCombSZ1oNHXChZaV4MDSTkuxdCwRGHD9HXDqflhtg3Lo/I1Pog0P/te3FqA4
 KkUn7/2v4WzRKliLsNn68Ds1eKT+GRPBNh0zZjxqNMjgav7fXUaPwm4IutoaqrdASsu3opnr8mE3n
 Y21UeOyI90BTydWdivqleaHUWPjR45p/lm7P2LNJzE2qvXbIx4SPaj1AKmWwuQvFJpXdfPmIRUm/Y
 aHOdxyZtWVkwkp3loFZFAjfN+2qDpqOPqkknu2ZExEqz5O7GJdCWLvbcRmd73cZS9a79IHckAz48j
 rOBK6WNG27InYa7b5ZUQDXgLSzAU9iehNq8A==
Received: from tybee.core.gtri.org (10.41.1.49) by exedge07.gtri.dmz
 (10.41.104.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.721.2; Thu, 28 Jan 2021
 09:31:40 -0500
Received: from localhost.localdomain (10.41.0.30) by tybee.core.gtri.org
 (10.41.1.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Thu, 28
 Jan 2021 09:31:40 -0500
To: <qemu-arm@nongnu.org>
Subject: [PATCH 0/1] target/arm: Fix SCR_EL3 migration issue
Date: Thu, 28 Jan 2021 09:31:01 -0500
Message-ID: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-ClientProxiedBy: hatteras.core.gtri.org (10.41.22.72) To tybee.core.gtri.org
 (10.41.1.49)
Received-SPF: pass client-ip=130.207.205.170;
 envelope-from=Michael.Nawrocki@gtri.gatech.edu;
 helo=unifiededge.gtri.gatech.edu
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
From: michael.nawrocki--- via <qemu-arm@nongnu.org>
X-TUID: EZnzhDJ7NciW

The SCR_EL3 register reset value (0)  and the value produced when
writing 0 via the scr_write function (set as writefn in the register
struct) differ. This causes migration to fail.

I believe the solution is to specify a raw_writefn for that register.

Failing invocation:
$ qemu-system-arm -machine vexpress-a9 -cpu cortex-a9 -nographic
QEMU 5.2.0 monitor - type 'help' for more information
(qemu) migrate "exec:cat > img"
(qemu) q
$ qemu-system-arm -machine vexpress-a9 -cpu cortex-a9 -nographic -incoming "exec:cat img"
qemu-system-arm: error while loading state for instance 0x0 of device 'cpu'
qemu-system-arm: load of migration failed: Operation not permitted


Mike Nawrocki (1):
  target/arm: Add raw_writefn to SCR_EL3 register

 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.20.1

