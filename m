Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp667611lfb;
        Mon, 4 May 2020 10:31:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypK/zgQq/oMiOqU17x+N971NW9NU4cR3s7V7rUiDIURZFEWY4hGSqRbGbobzMWhhseV5WnnN
X-Received: by 2002:ae9:e30d:: with SMTP id v13mr268938qkf.309.1588613463799;
        Mon, 04 May 2020 10:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588613463; cv=none;
        d=google.com; s=arc-20160816;
        b=BvuGZeUiyCyGzRYI/QcEJC9JbJNW1UsgWyzfbw7JCaAcaNEOfb6mddkkIpu7GtuEfN
         ebWv9BhRBzGI3AcXOznWNbayOB2ZQbCrMUGTCiZRDI11zbXPbPrjSzoIhC+A0V41CMRE
         DmgkS3Xq0HFq3c92t2IouPwnP6TCkQhnYzp4gbii/75c8TtmQ+1IMQRhu0xXCv8+/JIH
         q5vq2MV34grMC8HipMwjG35BR81NFD26G/wpMQy4Ppn3lT5jiF+kgc8KukItRzScuJtN
         qMgtsLXCKLyWaYAck8iWiE4nj7Tmow0INJZKS6SbcPr/jmZd4iVGoDaitT8pkpGegK19
         sZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gKFemNLKvLsfWugRqwCsKjdZxDFrpd75fXOIrjBACXk=;
        b=q7oK33ERctDHO9wK21QmzjssTmSQe+YhCPvV9KbGDpGI1ByoPqip033Q3FMIlt82WU
         kVU+fbk2PxS3lVk8QehS2DBeJUZhXZQTBFHn8V9YyC+TeYqJ7IOvKpeVlTR0Fviqd4sZ
         1O1jljTdA4GOmh84V58nXviGc+W6Tuyfj7pM/kwNJ4Q1dbHCkQBqXWkZFUuGakzpCLSB
         woq0cTu3ismjHDKgYITfVWfM8hH00xHEdfYVyNKSRrwLZ1dH7KGfXs7iVGTOCDqOz11r
         MGJpH18SVZBXG0rxjpxrc8VVbGoPnMPJTEbl8Wzs3zuI5c288qFlLYEhvQJqfICNA1HG
         GiRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HDngqIPO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id 63si6973442qkf.347.2020.05.04.10.31.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 10:31:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HDngqIPO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVevn-0001uS-8c
	for alex.bennee@linaro.org; Mon, 04 May 2020 13:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVeq9-0002On-1t
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:25:13 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59859
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVeq8-0005OA-6J
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588613111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gKFemNLKvLsfWugRqwCsKjdZxDFrpd75fXOIrjBACXk=;
 b=HDngqIPOcMQH23uaOzfjn7ru9Q2ujp6HJ2K1fMt3K7oQbWgwLnMVfpPRGrNi6HSKhrsR/y
 4SpGOiZK8Fp7svSlAEcMAeRNwbWkxPMb1ma30RaEb6k0cRT4VEOUfQeirsY7lF2bNRVIeE
 RcFoXe3m67heOV05iFetActK1lu1VQM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-Tk7dasY7NnqJon2UFpTYsQ-1; Mon, 04 May 2020 13:25:10 -0400
X-MC-Unique: Tk7dasY7NnqJon2UFpTYsQ-1
Received: by mail-wr1-f71.google.com with SMTP id s11so218068wru.6
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 10:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6FZZJFR4wX+R6WdyE1qjITEUJ4N+wtsCncRkTmCNCbM=;
 b=UDlzVPk8QSVdIHKSx+fRY6vBminLtvRV7H2TveOfNWtV1uUhaOBZ6PLIcVhBDUeSmG
 gEdbaLlMvx1gh3c9XbxK09Nhn/6PRX0C0DoTUVkGfoVglO1ucCBZiTOr4j1aYvR66yoS
 OFtAGKk52VAWFWUKCLRJcArimRUDJYgORehYfdHBaufhmePgh/tklFfVsGHjz1ELLfcM
 flhjgHcp/jo7F70pUGNI/mI+8D4IkpR3p57gxvYiguhLV7mkS6U/MPQbLxJefSxU3qT5
 9A3eUT9+pQe9KwHFLfn+x8/Y9qJCv6qdyPcqb2DPe95K1i929z4nd+2nQTPLR0U4hhJ3
 5eyA==
X-Gm-Message-State: AGi0Pua6SCwgpmeGCGyNTHlWdbRGWS7nVfCw57ZNyL2cf/M9FkV8BBd9
 NpqQcjqjl0bSIzTMVkh9/123MlT5CilIARPtWfAxbz0XrSE43hm6C5Q4L2TM7asH191DucQ9RKj
 hG02LdTP3+ENA
X-Received: by 2002:a1c:dfc6:: with SMTP id
 w189mr16476865wmg.180.1588613108450; 
 Mon, 04 May 2020 10:25:08 -0700 (PDT)
X-Received: by 2002:a1c:dfc6:: with SMTP id
 w189mr16476851wmg.180.1588613108237; 
 Mon, 04 May 2020 10:25:08 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id n9sm19844703wrx.61.2020.05.04.10.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 10:25:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] target/arm/cpu: Restrict v8M IDAU interface to Aarch32
 CPUs
Date: Mon,  4 May 2020 19:24:47 +0200
Message-Id: <20200504172448.9402-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504172448.9402-1-philmd@redhat.com>
References: <20200504172448.9402-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:21:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bBR6U1yXiTxW

As IDAU is a v8M feature, restrict it to the Aarch32 CPUs.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b4d73dd47c..a10f8c4044 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2889,7 +2889,6 @@ static void arm_cpu_register_types(void)
     const size_t cpu_count =3D ARRAY_SIZE(arm_cpus);
=20
     type_register_static(&arm_cpu_type_info);
-    type_register_static(&idau_interface_type_info);
=20
 #ifdef CONFIG_KVM
     type_register_static(&host_arm_cpu_type_info);
@@ -2898,6 +2897,7 @@ static void arm_cpu_register_types(void)
     if (cpu_count) {
         size_t i;
=20
+        type_register_static(&idau_interface_type_info);
         for (i =3D 0; i < cpu_count; ++i) {
             arm_cpu_register(&arm_cpus[i]);
         }
--=20
2.21.3

