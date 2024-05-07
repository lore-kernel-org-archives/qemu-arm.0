Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp2067003ejc;
        Mon, 6 May 2024 22:42:57 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXRbD+tF+KJA4j1AZgz8/Zj5avxiJw2zrRpyLgZGbI9A46LbsFRAkZtYfiY6VP6+QJBZUq4Rq4sagXoANckN3kkXW4NKKky
X-Google-Smtp-Source: AGHT+IFor9M3fa4nUZvc+6e1beFnCqfv/vPaSDj12ek0G/7iZNFijXiQYrpE7bWPhQHX31AQgFyB
X-Received: by 2002:a05:620a:4402:b0:78f:1596:e71e with SMTP id v2-20020a05620a440200b0078f1596e71emr17015508qkp.50.1715060577301;
        Mon, 06 May 2024 22:42:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1715060577; cv=pass;
        d=google.com; s=arc-20160816;
        b=0n628PJkDHuY5UKBHeplvdllUKa4zzBCSCBlsd9REBTOek4Asmf7Tr6LWPUFtVkqKZ
         sOkUNGrdG0lK9NETY7UKbOWLO7kENE0EEur8vNQtCXCCw8oTNqNfFMyu6QAMrAp7JOAW
         dojSJxcnT/AUfrMvQfzs91RlVcoV4ED4HzbJh0O59wEGoD9EV8+bIirjVx4NUOKQoRmU
         uE9fK9xF/m/S+nSn+tCUPHJooLAUj0swheOAPo/XhDE0/7250sJM7CqYdxTor5a9+rwZ
         uGiVdbj0HUCoXq19dLYVnDeSL4pN9vjp5TO9b7v18Xjyvi+01TFZbjjSs2W5I0DzLJQR
         Sz5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:cc:to:from;
        bh=WqFcqPKO/+mldgGzvm9zW25vFaxFJoopkuCQHD+vhis=;
        fh=BPqx+tT0l4/T42nLjlbaMbNPkbDvuI5V4MIQ4GAZFPU=;
        b=iVYS0F3wLYM/E20y96NkdcG/IHo/lVBvqSzPh4+An+FERg3jo2dpkXQo62+4tMTUrB
         AV/C8baEfavdCsm2TusHzqOr4pLIyYSjOE2g46ZJzpBVnJ9zrENA9AqWXkRasyYsDvbG
         9GsEr/P2bezIiI88tgFbeFeR6NDNeMbxxI4uCJ27mnkdvwu8yDXdah+a2myqZcCuBjJW
         55L+JOhEV6Fm4qT88VISQ0VKy9FCruXnJ+wm3vG9c2M9X4mP/VXPRFGeQeni6bBNd7w6
         1C6x0wjMUaJE/q4lW0Hrhrmx6sVGwBT/jDyg1M3xvSb+dXpyv2S0UlIHrqAqDZzlYR8d
         B2IA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=starfivetech.com dkim=pass dkdomain=starfivetech.com dmarc=pass fromdomain=starfivetech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5-20020a05620a04e500b00792a1ae5db7si2232743qkh.735.2024.05.06.22.42.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2024 22:42:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=starfivetech.com dkim=pass dkdomain=starfivetech.com dmarc=pass fromdomain=starfivetech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s4Db3-0002eJ-Ay; Tue, 07 May 2024 01:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1s4Daz-0002dF-AA; Tue, 07 May 2024 01:42:33 -0400
Received: from mail-sh0chn02on2070e.outbound.protection.partner.outlook.cn
 ([2406:e500:4420:2::70e]
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1s4Dav-0007IG-2H; Tue, 07 May 2024 01:42:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQKkW7Ll8uWtNC5VQ1p/qM2EW1u0UTH7+bVrb1X3/BsTs3gob8jUdOZftP5ZsvLJBMwLdJuxes5naIBgb7208v+/IEQ9ke7pnjTgoVnwS5HH7D35f1OUe3/nGzyJac8y3s+5F8PZBaOvyUyR6GI0bFSV/BO1nbnNZVA8o9IhAgBPowF3Z2uUR6tBWpygEh4kcoSwgQVvb1/YVwfkAbE3SKGKbY0/3f0uzhzVMLmN4hOM0d4EVTLHVXqCwMqk4SrQ4BQnX6HyXmJvqlsWWnOIKsFhh/KZByGlPTNtg0nDqqMnXGxl3vQClZo8ddFdjGeqaFx6bzeJW+8oXumJhkEeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqFcqPKO/+mldgGzvm9zW25vFaxFJoopkuCQHD+vhis=;
 b=Hxa8b5lEMgEo3SvdTXngSNXu3HFRNqj7myREOwm1nMo6bZARq27RM7f1qXWIl3itHxYfuXwhL/LAKolr1wKpHiYiJVNmjiSLujJDJ0ZPYJPG/1XsVnDAEk+Ewq14EcScFKGTHbWRfxp6h62HTYw+hVeU1MmzKw+9If02xfbv8IDYrfCNoTgZipGC+YNBYyd+hliNg5nOUoMNsk2AA6PydlxWfqI+XlosnajfnjgalJzp0ss3kH9ma3NhP1/E0b9nL0m3j7LpH3CLwoo1VqsCJEfuVwdlmgIvZjrIVDXRAzp1iuq2xSgJOdqPweL4ymRabmY5ldRM3sT6ASHXeoWWEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:12::10) by NT0PR01MB1072.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33; Tue, 7 May
 2024 05:22:27 +0000
Received: from NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
 ([fe80::e604:661e:e939:4c87]) by
 NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn ([fe80::e604:661e:e939:4c87%4])
 with mapi id 15.20.7472.044; Tue, 7 May 2024 05:22:27 +0000
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, jeeheng.sia@starfivetech.com,
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: [PATCH v2 0/3] Upgrade ACPI SPCR table to support SPCR table version
 4 format
Date: Mon,  6 May 2024 22:22:09 -0700
Message-Id: <20240507052212.291137-1-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0024.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::8) To NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:12::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1278:EE_|NT0PR01MB1072:EE_
X-MS-Office365-Filtering-Correlation-Id: 828fc01b-0f8b-40d9-e9be-08dc6e55af14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M7GaCVuk8agZz9o5ObJc57pZPFkzCFk1UDfaz7lT7UcIgPYM7t2KUILwNu7mTsRQnWDS/hLe21/U4v2+0SkTGCeMr8D0GFDbR0oGGmqO62DL+mfl5cBJwJ2u2bWQwSyXz3qMzKeH5tTOpDjFBIOfpCRW0sMHKPMdf1aeNDa7YIH+Gjj1wqPMXElZHNrNPBM8DtbHiFFa1ygSf6sRvIyfRqcXPsRK/SIGDKpMmUirM735vFVKmV9D6r8ZoY05pI0gGHKBj428u2JDPZ5uL+ok4xCnR0NLxDXAy2X4lcwiUZTQ71PR6gAD6/C0CJGoc42jw5YD35/DjfG8s1zWUIUHZOtW13r6rKrkeeQ+5oqUY7NNp4lng/na3B5ZZ/a+44N0UrECwyHfzKK3cvGp2mZWiaWOxDerrTHhO/3KpF7Htlypfr9T117ItXLGa7XSKNOmdGrM4jXRmOA04cVBzagci7a2k8zvHnJyPH7U8wgoa/r4DgGnUhGslGnaNtRZF3G4qbYR1hOw+ZcTqed/ivpuU8bMQvmUTNSfBgiz3EVTzug2q45dtvv2eXbNb7RYUshsNkjoE40xfPPC2xvGfkYfGLzhFthHNGy+Hp+Q7RBKB+Tl/igHYJc79N6oEElcsHPi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(366007)(52116005)(41320700004)(7416005)(1800799015)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lbr8FjBt3pjPOC05SNXYqDomyvDFm26N4IRcb0HH9GQFLGsd+5RETv/RmPoR?=
 =?us-ascii?Q?qqumrqDlEiABJsR+98X4KNO/xIATw51zpFHj9r6n7eChJyOXXdRyTf+qjyp0?=
 =?us-ascii?Q?PECo4thPZcCjZMCw9dDn+CWQ3y01mO2Us/4e4bcl+uX5NiiP0Gy6VsnyfaWf?=
 =?us-ascii?Q?Ya25WKeHo35wrhcc3bPbWICzKoY2i2qvbd9A7sCkjPSPI5/WLOCWcCM8o0AW?=
 =?us-ascii?Q?dJ7N73thkrNX3snNFoD9myjd5oWHWg8kMeum1bYS3SanLOM9ghaI511qP2HH?=
 =?us-ascii?Q?XY7WdfcotvtLutQaMeqWseYha0lrNTWTR2RB4NoZyBtmR2/OgF9JP0gxUN2l?=
 =?us-ascii?Q?HXon6K1ewEVQsmy9xIXHlFG4TZPKzPnBhfUrKEGZIBjAEKagy/YbFvmpoWgg?=
 =?us-ascii?Q?GwJ5ExhTJP3F32uPN2K3chh1eVtTozI2CJMZsTzB3UufskiSYA2BoGdF0Qai?=
 =?us-ascii?Q?tpbEvQ8cFW+zKProXhNl1Z02rZ12iKsh54qQeoDy8Bmr5r5fXsS0a/JWWPG7?=
 =?us-ascii?Q?Tw88zrPn62l+fZu6W88Vb+vbyLYuV1z85YynlEYOPY2AUXjLNp1Meq3wmoek?=
 =?us-ascii?Q?peY50bHyVqziKFtSkPiomCkPyaf/sdGkMg2tzavz75/xl6XqJkLhCsSikLsN?=
 =?us-ascii?Q?xjNXHNzhtd+dEVpdCqXA5b5l96J/MoyfMNZARN1WABfYtXqsBPJZvIwfJeVG?=
 =?us-ascii?Q?VnfBqvNkYhvBTf2M9sI5/+SRG5bkw7kzRxNdg6qz6KqAXSZtmqkFMpdBg6db?=
 =?us-ascii?Q?og2RLjCldGIwv7CEPGsOQTUoZuhPEFVavlobtZWRYnY/jgGtsVfHxB4rE58g?=
 =?us-ascii?Q?NgeaGSJT3/QS9ciNfIekIykE6xFlhrfDYj/kWGK8YiNvogusyfcc+DHuWlM4?=
 =?us-ascii?Q?Dk3/0p+LxjBREKn6OWYduNYvtRtfNJ4sqVnib0dxqGrPvtxchbSpDj+SyTWU?=
 =?us-ascii?Q?3MdEtSwG2Ev5umMFa8QbEZUN3N5/MCDkmDx+k2Vw/OeZid5FQY4upTWr6Uls?=
 =?us-ascii?Q?eYmVi85jA6RR8S/zaLCBmvudP+zzjxrehQvG3XHTogLIrbTNAJTppniVku/a?=
 =?us-ascii?Q?ucduQ2N2FpPbrKlYx4b2sGDwMMto11sZt7b/3nT16rROTydhxk+cg6AchNPs?=
 =?us-ascii?Q?eimuoVURy/SzPi0W0GDe4Ylcw+1HUDVfMKk8S9LYuO4FiUASNxVJcSHK0fxN?=
 =?us-ascii?Q?zzq8W0xgd0PAetlNMLfT4dji9kgvl0FZjYsKBQJTaRTcAU/ECxUOtRBPXhsh?=
 =?us-ascii?Q?DL3aD/M7fh8mR51TMD2Zjk+gbGFy21a8wAqLrQVJrA4rwiqLc2rgvuvSvbpi?=
 =?us-ascii?Q?Lk0njCdZB+LgN2O0PSPMgMnO6D4ScO44J4OPonANusr0JSROytUL4kyreEmD?=
 =?us-ascii?Q?W/PWgI7j1A47Owm+1TXJExQYcwzzwsCdBfOGyNbb6WXzziv+u6mYUz5ZvArR?=
 =?us-ascii?Q?gfWy6d3zdov/3JZfcsBYqHwjswksgbf9/Qsyyzs8GHdG6fTgl8EkB0RJJkpO?=
 =?us-ascii?Q?I/sYOuZA/JaIq37M/fJHnrDzfzPN1woARm7ZqPHPmvog+puo+yYG6rgdwA2b?=
 =?us-ascii?Q?zG6GNhqGDaF6xi7ded2ovG72M7q0AZjQb6pGG9U1fPjKbM6lITSEWMb+a/hw?=
 =?us-ascii?Q?TA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828fc01b-0f8b-40d9-e9be-08dc6e55af14
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 05:22:26.9957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHRc5UzpObRnQWQAygvgTV5MU/GziITwzkfu4YWAsz1SZk1jctJ7K8bIp7ad8rgQfqoiBtgHpGFJbQBZybQ+ub9jxSysP5g1rM5dOAca3VM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1072
Received-SPF: pass client-ip=2406:e500:4420:2::70e;
 envelope-from=jeeheng.sia@starfivetech.com;
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URI_TRY_3LD=1.997 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WZJOx4/lcVz/

Update the SPCR table to accommodate the SPCR Table version 4 [1].
The SPCR table has been modified to adhere to the version 4 format [2].

Meanwhile, the virt SPCR golden reference files have been updated to
accommodate the SPCR Table version 4.

This patch series depends on Sunil's patch series [3], where Bios-Table-Test
is now supported by both ARM and RISC-V.

[1]: https://learn.microsoft.com/en-us/windows-hardware/drivers/serports/serial-port-console-redirection-table
[2]: https://github.com/acpica/acpica/pull/931
[3]: https://lore.kernel.org/all/20240315130519.2378765-1-sunilvl@ventanamicro.com/

Changes in v2:
- Utilizes a three-patch approach to modify the ACPI pre-built binary
  files required by the Bios-Table-Test.
- Rebases and incorporates changes to support both ARM and RISC-V ACPI
  pre-built binary files.

Sia Jee Heng (3):
  qtest: allow SPCR acpi table changes
  hw/acpi: Upgrade ACPI SPCR table to support SPCR table version 4
    format
  tests/qtest/bios-tables-test: Update virt SPCR golden references

 hw/acpi/aml-build.c               |  14 +++++++++++---
 hw/arm/virt-acpi-build.c          |  10 ++++++++--
 hw/riscv/virt-acpi-build.c        |  12 +++++++++---
 include/hw/acpi/acpi-defs.h       |   7 +++++--
 include/hw/acpi/aml-build.h       |   2 +-
 tests/data/acpi/virt/aarch64/SPCR | Bin 80 -> 90 bytes
 tests/data/acpi/virt/riscv64/SPCR | Bin 80 -> 90 bytes
 7 files changed, 34 insertions(+), 11 deletions(-)

-- 
2.34.1

