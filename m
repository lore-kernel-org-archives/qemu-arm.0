Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1141160wrv;
        Tue, 16 Jul 2019 08:43:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9yAFw85MtFS45qaRLxeuJ2jlQhO1eo/UOjhuBEy8frzgQsWaUEMNjN7cHItWrDkfMmB2N
X-Received: by 2002:a50:9729:: with SMTP id c38mr30733424edb.283.1563291780606;
        Tue, 16 Jul 2019 08:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563291780; cv=none;
        d=google.com; s=arc-20160816;
        b=GYHLj7Wq/kGcM5mENFp+bHe+csZdBXnMq0ev5xpEeSmEtd1rP/uRePugNaR0wYUo4b
         CfGcqXhYsZgwhP/9oxm0YCCwiiBFysKkdAx4dO96n5EO3AAH9oTboZM0/W9K0NnYgwem
         Z6Tg2siYevZJy/bdSziE5u5cQTXw6sk13w2ZKJFjwAkq/V6z8p+q5OtkbUpUdVkd+yCQ
         wbGZNWOHUzv37RFsCRASt8BybP+tnxYAxS2C3oWvOPm0acwMBQdSdQ9ul14tlYKq/H/v
         uMJMyo5g7yoLW3NMdACtpULxZ27bTMv1kaY+lxEBTfuJTwkL1sYspNkJqZ4dtBPsbNJN
         gCMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=UycrYuiPNLPJ2ftzId12zOSEEGA6ejSQlI+gU1g8rTk=;
        b=hE1hBRi4BJGEYs7pQW8AyCY4jNvTnDJMEHcer5UoK/HaxhopAnnAOpG/+I2nYOT3uJ
         b/zXcNfU/hI+Dr4dPUBAU44R23mEhYsAj1lvmWLADM3VTeR4i0B2Xmbzy6TWtKLho2g4
         c+LAyOkYlmD8pauhJIs33AuRJK2IuX0fO8rCf/ZoukcNpFS/PuamAhXj/DMNCad7tWkP
         0yeFIfA7mZc5GxufApjmZtivHwKB6SZs3jsrkEfu5HB3YmobkjsG3dGf8ky4knTVxKFu
         t4M3jvek+ug1AcfLhrEJLIXt9peS5FCT41TC7lYesgAxwOqesB+JoLaN2uqJuxD9NNRc
         gSNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si12418529edb.442.2019.07.16.08.43.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 08:43:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnPbX-0006Bi-BA
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 11:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36849)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPaG-0000pw-ER
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 11:41:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPaE-0004cg-E6
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 11:41:40 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2239 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPaE-0004T9-0G; Tue, 16 Jul 2019 11:41:38 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3A5AAD4172FE349B57F7;
 Tue, 16 Jul 2019 23:41:19 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Tue, 16 Jul 2019 23:41:12 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 16 Jul 2019 16:38:16 +0100
Message-ID: <20190716153816.17676-11-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
References: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH-for-4.2 v7 10/10] tests: Update DSDT ACPI table
 for arm/virt board with PCDIMM related changes
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CUNSWKcpZexS

From: Eric Auger <eric.auger@redhat.com>

PCDIMM hotplug addition updated the DSDT. Update the reference table.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/virt/DSDT | Bin 18476 -> 18493 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
index 20e85c7f89f645c69935c615c07084e221419960..1a5c3e5243c78eb25345fdf7ffa442afec3c5c28 100644
GIT binary patch
delta 172
zcmZ28fpPByMlP3Nmk?VI1_q{Y6S<_BIvO{s=eSSi^^mWRZt~=a(Tfjuig$N)iRXy-
z@O0sIbPn(|FfcS`;D`?ea)A;+mUB?BARiZZCmRDZqb36bLnT9WgKLnhI|B~`0|zG;
zOLQYQi0kYc?CPT+ViNBf7Q$Ho;v_5(n_Qj1$iNt*&kVB1*CW8$H`v*4fdEjLhl`1U
Ni>WOjJjjWw0RY`tDw+TQ

delta 134
zcmdlxfpN_QMlP3Nmk=Ef1_q{ziCof5?F}2%bKIpo*xdvC4LIUGJY9GlgM2*<49pA}
zIN}{$f+og`c`$P_2rw{ovN13+sxvS!RDxt&Jq4Ay6ndl?7@-g-A<n=c$sh-0Ff)LR
Z11c2ZjdwLLW@rlt4|3vam^{&45den68LI#Q

-- 
2.17.1


