Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3349443lft;
        Thu, 23 Jun 2022 17:48:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uv4jdA2A/YE0gRp1kecgznwpEzFnM0T8LD8VwZaEdEzfzpsrvEvwuGHSf6jH5FChczpWYy
X-Received: by 2002:a0c:9ccd:0:b0:470:7f96:8e93 with SMTP id j13-20020a0c9ccd000000b004707f968e93mr4454621qvf.64.1656031681993;
        Thu, 23 Jun 2022 17:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656031681; cv=none;
        d=google.com; s=arc-20160816;
        b=s+NJWp/PNxx9ZZ60BuqGn21D+Fekp0nuDB2fp21fcuLxCXKBq0uGVoDCVnC7pOMGit
         LVK19AgMm9vLxFjdwI9DTDST6l+Fg2ZIO97A9NAmOhUCeoM3MITgv8q/E8EpsEgWKutv
         KjXaLJdm3YnYIztRLMo9e62X4x7JLqoV2Gdj01I95QQ9mupUqit5Qy/KoGkjZo4f7Zm5
         eIHHCq9yUHbLYqSLHZK/H+Iwr4o034Ry4jGF+nJFPi31LvSJVPGdxDzUNRlH2RZhQFdG
         t/BzM7ZPPZFXuU/ef3zk2xDujvGZyLW7ojxCd0xkeEwQMXHUe16KPjc9YFj+zFeS4CNq
         AWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=Iwy9O7OZNjvnG5SSnfEu3gBticOtIl2w9w61qp3FJa4=;
        b=Pw3LzNTEm8TfIvi2MSB7uIqo7ScbiQk+Un3YG/L62AjBI0Mk6vCAf9EBgrxwJQvABR
         q1zLbnoi1y0aYqbgjFv6ePWTv+sV03bK7a3y6DJSnUlXEMYCCSWnATrAsvBNa1CXkYQJ
         ui8L7cwuRsaNM7zfHzX6EcpKvb+nUeD8eUAodbOIlQiAA4sgNl0V929MTdMeNQ2gsGkx
         0Yg39wZNkPBg2/BZT5qERRY50nJwHlyEealQb5VnL8FQre2rBkZpB719acrvNs1Ep3J2
         FgS+ozSwvqbQBsY+VvC38YxRElyfSE5GITvL9HYOYjpfrolS1GYVDvBgxq4Mre8SG8Xx
         ZgJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=RpiVXg8w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a0562140d6200b0046e33bdfc15si509885qvs.374.2022.06.23.17.48.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 17:48:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=RpiVXg8w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:46082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4XUP-0004go-GO
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 20:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XKG-0008E4-PK
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:37:33 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:13784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XKE-0008Ct-9R
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:37:32 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NK2tAn002361
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 17:37:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Iwy9O7OZNjvnG5SSnfEu3gBticOtIl2w9w61qp3FJa4=;
 b=RpiVXg8wCyEf9b/97lje9pTnNO0i9KhXGFM0YXMyBB3HIrjwK1zu/oGdgiEgc58uk0Ut
 F4cKbpbNmwTGKpd7BrIkHuw6g4qdy34tEaFOT2gzQq26fC+fiPalwn4noPy3sJd0wWAk
 N12tG5n/c1zdrd91xz0uhRs2hoEIRHVzh7g= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gv2nav1ad-16
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 17:37:27 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 23 Jun 2022 17:37:23 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 39B8E88BA29B; Thu, 23 Jun 2022 17:37:02 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <clg@kaod.org>, <peter.maydell@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2 8/8] aspeed: Add AST2600 (BMC) to fby35
Date: Thu, 23 Jun 2022 17:37:01 -0700
Message-ID: <20220624003701.1363500-9-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624003701.1363500-1-pdel@fb.com>
References: <20220624003701.1363500-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: C-AwycZvIUIa2gTwr_GX2fxTTY2Fzapg
X-Proofpoint-GUID: C-AwycZvIUIa2gTwr_GX2fxTTY2Fzapg
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_11,2022-06-23_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=717463a23e=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MpOrPy7ox42S

You can test booting the BMC with both '-device loader' and '-drive
file'. This is necessary because of how the fb-openbmc boot sequence
works (jump to 0x20000000 after U-Boot SPL).

    wget https://github.com/facebook/openbmc/releases/download/openbmc-e229=
4ff5d31d/fby35.mtd
    qemu-system-arm -machine fby35 -nographic \
        -device loader,file=3Dfby35.mtd,addr=3D0,cpu-num=3D0 -drive file=3D=
fby35.mtd,format=3Draw,if=3Dmtd

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/fby35.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index dc1ae8e62a..1e24cbf3f8 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -21,17 +21,53 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qapi/error.h"
 #include "hw/boards.h"
+#include "hw/arm/aspeed_soc.h"
=20
 #define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
 OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
=20
 struct Fby35State {
     MachineState parent_obj;
+
+    MemoryRegion bmc_memory;
+    MemoryRegion bmc_dram;
+    MemoryRegion bmc_boot_rom;
+
+    AspeedSoCState bmc;
 };
=20
+static void fby35_bmc_init(Fby35State *s)
+{
+    uint32_t boot_rom_size;
+
+    memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_MAX=
);
+    memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram", 2 * GiB, &=
error_abort);
+
+    object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
+    object_property_set_int(OBJECT(&s->bmc), "ram-size", s->bmc_dram.size,=
 &error_abort);
+    object_property_set_link(OBJECT(&s->bmc), "memory", OBJECT(&s->bmc_mem=
ory), &error_abort);
+    object_property_set_link(OBJECT(&s->bmc), "dram", OBJECT(&s->bmc_dram)=
, &error_abort);
+    object_property_set_int(OBJECT(&s->bmc), "hw-strap1", 0x000000C0, &err=
or_abort);
+    object_property_set_int(OBJECT(&s->bmc), "hw-strap2", 0x00000003, &err=
or_abort);
+    object_property_set_int(OBJECT(&s->bmc), "uart-default", ASPEED_DEV_UA=
RT5, &error_abort);
+    qdev_realize(DEVICE(&s->bmc), NULL, &error_abort);
+
+    boot_rom_size =3D ASPEED_SMC_GET_CLASS(&s->bmc.fmc)->segments[0].size;
+
+    memory_region_init_rom(&s->bmc_boot_rom, OBJECT(s), "bmc-boot-rom", bo=
ot_rom_size, &error_abort);
+    memory_region_add_subregion(&s->bmc_memory, 0, &s->bmc_boot_rom);
+
+    aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
+}
+
 static void fby35_init(MachineState *machine)
 {
+    Fby35State *s =3D FBY35(machine);
+
+    fby35_bmc_init(s);
 }
=20
 static void fby35_class_init(ObjectClass *oc, void *data)
@@ -40,6 +76,9 @@ static void fby35_class_init(ObjectClass *oc, void *data)
=20
     mc->desc =3D "Meta Platforms fby35";
     mc->init =3D fby35_init;
+    mc->no_floppy =3D 1;
+    mc->no_cdrom =3D 1;
+    mc->min_cpus =3D mc->max_cpus =3D mc->default_cpus =3D 2;
 }
=20
 static const TypeInfo fby35_types[] =3D {
--=20
2.30.2

