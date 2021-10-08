Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2219201lfp;
        Fri, 8 Oct 2021 00:19:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD5f8X3q3K+ufmpFmoCDAFPUzYmYtyfNh3FhCoB4O1zEBT2SRMhqsONmPw/2yoC7MwDHEB
X-Received: by 2002:a37:4014:: with SMTP id n20mr1534397qka.304.1633677592627;
        Fri, 08 Oct 2021 00:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633677592; cv=none;
        d=google.com; s=arc-20160816;
        b=Lqn7taGZe5amJ9YrOGEcB/s5rgphfhhTKimgd6Oy5GI6qyBnneU5pWErOgOWhiJx+Y
         yYb3tZMjuG/Rl7YASZn207tttapjElmNOAfTqa3w6Dq8d2+sKgjbLxkBAKprzjn/D5a4
         TJGnsSumdgrov42yoMvULuZF3Xzk4iX2qNwB5VIhKsSHOwkWRiZVbAjk8rGIgtgwMygF
         sU6jfk3n4mt6oociJcs7QI1rdcKPO+DG9JN2dlHW+hPYS/rGzsnQUhau6LN8QdCsV5nu
         ZdCMKdkmdXj7oYmQ4UYMzRs6sr8FfWR3vSDBdXX8ZUvC0fV1e/IM81zjEZIepNZY8X6b
         Ujog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:ironport-sdr;
        bh=2TwA6Mv2YZYuNLE16nfiGnnOiDMc7WeRgLZx4VUApEo=;
        b=PTetNJ/Go0nKF7Ycbr9YpLuPDF7qlwB098DVP7iU2lVO7yD+IIMWHeKgsBn6fiT6Mb
         q3v4ApB3mOv9OV+PP0XMdxd4XummUe9lZ8FSF3LTqyO/82lUr+biUixbJXlZHLgDbmFM
         /R2GJ0IJOkL/DIrQMEzNUHmDcK9bl28QQs3dU5ptgTFnLgDxxat61/0F/0819Gp698nV
         nkEu7qWH1AJPQAQtvGw77BmlXbFU7/DJXGNp3X8Kjtc8VkfRpHrdO52ZQBf4L/GYxH2Q
         2IJinUJOs/xEUp0Ajui0C2cy2vMdIWvEPlewtopfOiWQh+467Ogmt/QxqiJEZYJqWJ4t
         mrLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si1399694qtm.187.2021.10.08.00.19.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Oct 2021 00:19:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Received: from localhost ([::1]:39180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYkAa-00068i-06
	for alex.bennee@linaro.org; Fri, 08 Oct 2021 03:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mYk9o-00068G-Vj; Fri, 08 Oct 2021 03:19:05 -0400
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48]:13407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mYk9m-0006wO-Hx; Fri, 08 Oct 2021 03:19:04 -0400
IronPort-SDR: 0kEfAWRuW+vmy4p89OyM+5vJ5N1N71L388vl2pzSNVR1M9gjzY6ee4mN3Ez6/kUht9gW0WrYb0
 nY/yPhxlrs3mKeHcGuvjxsjUwtUEQOnRJ2EK5uhONtV1FSoQq2mFMEcoPaVetvXeVWiNQjKNMv
 K6qm+LXPg9Xve4QyXyxmGrwBbpavB/EFr5IHTjZtDxLvnrwdJ2fN2xWyEmJOIsbTxfoBLmM89Q
 PZRBdpQflmOu40AREc01NlhziL3Vc9ukkWw9J56qLT26HqQxsO47NMFVpbln8lMGvj2vIuCzme
 /gXGMSHo95am0X15B8YFLMqo
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="48082856"
X-IronPort-AV: E=Sophos;i="5.85,356,1624287600"; d="scan'208";a="48082856"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
 by esa2.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Oct 2021 16:18:55 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com
 [192.168.87.60])
 by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 974FFE7572;
 Fri,  8 Oct 2021 16:18:53 +0900 (JST)
Received: from oym-om4.fujitsu.com (oym-om4.o.css.fujitsu.com [10.85.58.164])
 by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E0DEBDAA15;
 Fri,  8 Oct 2021 16:18:52 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by oym-om4.fujitsu.com (Postfix) with ESMTP id F0DDE4022E247;
 Fri,  8 Oct 2021 16:18:51 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: rad@semihalf.com,
	peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/sbsa-ref: Fixed cpu type error message typo.
Date: Fri,  8 Oct 2021 15:36:04 +0900
Message-Id: <20211008063604.670699-1-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: pass client-ip=207.54.90.48;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa2.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6GtjGOVrz6Ic

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
---
 hw/arm/sbsa-ref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 509c5f09b4..358714bd3e 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -670,7 +670,7 @@ static void sbsa_ref_init(MachineState *machine)
     int n, sbsa_max_cpus;
 
     if (!cpu_type_valid(machine->cpu_type)) {
-        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
+        error_report("sbsa-ref: CPU type %s not supported", machine->cpu_type);
         exit(1);
     }
 
-- 
2.27.0

