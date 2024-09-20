Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp645529njb;
        Fri, 20 Sep 2024 00:37:50 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUOLv0j5V80XR5xYKwrteVJJewqwrK03Qtrln8X6VOVfr8wQKIbXARM9ievKpjm0VCZDG+Sh0Idfb71IQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHxDWvSAOUY7hfDLZKhQ96hlOyIufRl4QZPYhXbCTxRR1atVmKQJI6gAFYZ+1D95pxhkHTb
X-Received: by 2002:a17:90b:1c88:b0:2d8:f12f:6bed with SMTP id 98e67ed59e1d1-2dd7f3b959fmr2597666a91.3.1726817870040;
        Fri, 20 Sep 2024 00:37:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1726817870; cv=pass;
        d=google.com; s=arc-20240605;
        b=F/BAb6JctytzQwc9aY2uRucJ/GCy4yCw3MwKXiptYIU5W4IXHZhs+8300YOwUAW2Sb
         tpl6lxfVDNo3c53/0ahHHkr8jG8GeoPetjd9O7Yd503+Yl+jYM+RDEQYv1vvmHNVQrGX
         h44LpCCmh0cnAJr6oTQ6KT0+D2FJWD4ksWtIoGtKcpRvP6YT67vEHcDIwsFk9CE6nwEx
         UzeUzgaaP8e6KEKU7qhv5HcVt10meKGL4mXFWfeXn7jp+0qzglubCA63ppMKKc/iLOTg
         3s5QpR1biODKYU+Wqfe96HSBvpdu+WvUJlDr4KPBddgO75SEEyw4hHztkWzVWsvaDxeU
         R4ew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=/GMCYfePul0rgcn4ge+7eA8nhWccZqwUufIXEb2Tyro=;
        fh=GYNAkYPv6Z+A90mGtsIXwK36Hxg8K1ZojUL7loQ9OqI=;
        b=FkOE5dvUqLMUGWoFXbouZih5S/2NhLUcl/HCC6sjJ2VyMkdLClI6YVjdAuS75B8C7u
         AV2mxVaj9p1GRGYUctxqiU9VcF2mlZJkv2bDod7jUtRvKOAMR3snFTK+E8XLyy92tYfL
         YdaiN9zS0viCHmItycMnJkNXk95zVt3aw96EzQhlZrSRbGhSk3K3y8p7RfHiz9DVc0Bg
         DZsTsqcmxCALJZCTD7RLWF3MgEJ7MO83NrEQ+huwn5nX4g1ADV/hWmn+erkYJsEhTcOI
         +NDcv92lOMWJ9struS20JD8NhQbQZzOtG1fWoEaScNvgU10zwKM+cZl4zZcPfradfht9
         cFmg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=fiDYIDIg;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of gankulkarni@os.amperecomputing.com designates 2a01:111:f403:c10d:: as permitted sender) smtp.mailfrom=gankulkarni@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <gankulkarni@os.amperecomputing.com>
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120000.outbound.protection.outlook.com. [2a01:111:f403:c10d::])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2dd7f8bcfbbsi1571801a91.5.2024.09.20.00.37.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2024 00:37:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of gankulkarni@os.amperecomputing.com designates 2a01:111:f403:c10d:: as permitted sender) client-ip=2a01:111:f403:c10d::;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=fiDYIDIg;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of gankulkarni@os.amperecomputing.com designates 2a01:111:f403:c10d:: as permitted sender) smtp.mailfrom=gankulkarni@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ecgg33K0kB2R0AZMLENZn+SNo/XTlUcUzjpoB9E1dLK1k4vYkdt4VaIN77pvDpp4rmP2h2CfpseIe9/GhYec1hRttJTMPG65l/jmirnzlmHi5GCCvB021wl1s1kJOMybTr0bdA7M3/C8dSboR0Zgpdi241DaxrdEh8V/xaSSEPK5x8qmq8dHB7zZPHq1VnuB8aQcAbP02RUwsVLuGpxS28LNpAW26BTRMN010sM+EusXmWBN8LRMCqcvD9k3lIEPAl++DwVMjdbmECCTkHy0bjwTwAa2aEHK3XTSR3lR6DqCwcoHtceyUmgc/orRULvXDLa8sHG9HK7lZ0RZxd3ndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GMCYfePul0rgcn4ge+7eA8nhWccZqwUufIXEb2Tyro=;
 b=uds/5BATnxdBNmOvhFGYlXatkfsL9ztyCeDqKeNH9oTtYu5U2fDbf2kU9Xci9mnxe1/9ITHNxjRb3oMfUF/NS2XCKtUS7gAl10N+RfE9ffyTt2cIZnn3JiC2TX3ja11ol6/0cuKkfZJWPNwPTKCvseCsRNhhuY37xpCX9WG6MRAVYz1wJue594eE+JQXR8PBGMNou/qemJ0ppNAbYQ+uDIAhnhv/44kSfurb5ziGIl8be9rtQuMdWwQEgFP0UjxLx1/MKVHUhxgjgCqchqi7LkB4X3jP3wHoJfdMzDmu+X7Od5RVRoV8uvbM0RVQ/FBnHsMfTJxzUwA0ccRlf7KpoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GMCYfePul0rgcn4ge+7eA8nhWccZqwUufIXEb2Tyro=;
 b=fiDYIDIg2Cv7MQwCUzhP+XeN91DmldixekT7hYjmVc+kK7iJwAdMWrk4MUB3Dh/5AHf2maqXNqh26F6wvlY32LXJneWthp0g7MhM91niAp7xmmE07A+qvnSosfC6MqjXCNHMM6oC4Edbr9KRxsVnQQAoGgQxcCSOh3YSTK4b1EM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ2PR01MB8101.prod.exchangelabs.com (2603:10b6:a03:4f6::10) by
 DM8PR01MB7173.prod.exchangelabs.com (2603:10b6:8:f::5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.23; Fri, 20 Sep 2024 07:37:44 +0000
Received: from SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9]) by SJ2PR01MB8101.prod.exchangelabs.com
 ([fe80::292:6d9c:eb9a:95c9%4]) with mapi id 15.20.7962.029; Fri, 20 Sep 2024
 07:37:44 +0000
From: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	gustavo.romero@linaro.org,
	alex.bennee@linaro.org,
	cohuck@redhat.com,
	darren@os.amperecomputing.com,
	gankulkarni@os.amperecomputing.com
Subject: [PATCH V3] arm/kvm: add support for MTE
Date: Fri, 20 Sep 2024 00:37:25 -0700
Message-Id: <20240920073725.410373-1-gankulkarni@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:930:a1::23) To SJ2PR01MB8101.prod.exchangelabs.com
 (2603:10b6:a03:4f6::10)
Return-Path: gankulkarni@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR01MB8101:EE_|DM8PR01MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: 57eb59bb-ed2c-4018-8ec6-08dcd9471d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ax2uPGcm0zcvLuky81OM5bLxoVW+9Ry4197fUWNmIjH8LSVHBzrmwCJ6lykt?=
 =?us-ascii?Q?NfOBYPScy90bVwf18DBVMzwptTNFeO3FhnQujNueS4VhYt1/ch76l07QtcOd?=
 =?us-ascii?Q?hVWkUysMkqyUrflXjq4Rjkmrc4Ka4nB0vmAEpBixG4o9H+rUSV9lNAobSOhF?=
 =?us-ascii?Q?MniJN2ZhQjdK+R4tg1Sqgg4T1j0rZjI/b/bjD3Cv8dMLUcV6HPd0KEUoDE4n?=
 =?us-ascii?Q?BqFJNSn6ewayrL3jLpIBs/MQ9MiSFjQ8J0/y7p9ee/KKcr4AduP03NY8w8pd?=
 =?us-ascii?Q?o6bfx8fZMGewXXCkkeEeLOlcteKdPL7lFWdPCdDrFvDFbQ7KmD9icc7/GqBn?=
 =?us-ascii?Q?EOhRFbxPI0n8GWXWsQlf8N1wyjTeuSiD4cSHJfwG2jpqzDObOcx5dywJbAUI?=
 =?us-ascii?Q?Qm4hw3Szw28CRWQU4aAtkXgjhycvchq3kqTZ2tOQsR+KdjWiB5B63eMQ9wxm?=
 =?us-ascii?Q?ITMhSXgifHb38gLE2FLIzMsSd0xPAuQJPGjzEJVTMvWWyht6nsiJfPaapkDy?=
 =?us-ascii?Q?4KDVmKOqZ0O+bNkhdszOboOPy56MlIwb+50hHuo0H2zcInpQbRQ6ldR2iWJ5?=
 =?us-ascii?Q?tehN6fvXqDJ0a2U8AiLMxB9kh+gNS2JG9sJtnpjDASR+L1+rVKvWPMhVTyak?=
 =?us-ascii?Q?rsGe7SkR/CDCerMGPz3NGEceO56XNV9hxqNffJGOZpTU498Y2eQ04g+mqgPs?=
 =?us-ascii?Q?b0Gp9MrFE34kLDY72EPSrapJ5AePUbJknYP1NRRzvkPv2Xxio4i40Okbs2WY?=
 =?us-ascii?Q?lQaqEsBQhofh7h4o35t8yQH6AGQ0naBdLqK8mEbtSVVgZTgZAUYrlt2drDVX?=
 =?us-ascii?Q?75DuU/6WtrSUk/euaeTtTHovNt9P1KnDBjUPyYMetm+WmdV6PAbHSiXsaMjH?=
 =?us-ascii?Q?3nwXFrHTr6+XaVWNQbhpzf1c8f47NhBrLK6/cHEElXPyjunWi1t3hWAXxZ9g?=
 =?us-ascii?Q?77QT3W8dzk433wJlpBmrZ0ekFUVeH/mYj8B2IYKQpyWaZ3hEkmzy/wQJUai4?=
 =?us-ascii?Q?7IhpySPdwm8O7uxn+drqBDU0WA2L+i1/9P+ozi0iAIlf2mblA9IUuw9ZP7R9?=
 =?us-ascii?Q?PpcV2NibUKKlGNj+dcWsQuoXCjoPtDThOE0n36CDUt/vU0N5DWxTZLNZBmvE?=
 =?us-ascii?Q?20STxrfOLVcSL7a8wtBLMEded84HW2TEtbbUTjouvugqR4gHoPkfEKnzkO0p?=
 =?us-ascii?Q?rvxeEf4ZT+U5mgWCxjblzYtWi1xJ7Q5C+UrAT9Pa8aXYACwnWJnKokI/qWlt?=
 =?us-ascii?Q?CGiRELhbib7Bn+Dn+KOhhfll/rfp3Digr91eCl9AUVa0LqY6m8FYv7+/nIhx?=
 =?us-ascii?Q?xXmoPzoEEW2T2pMNFooBKD8MAxehJ77iGpyU7LObT4ADyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR01MB8101.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SkU66CKYseoSPnAHPP+WciLSkqJK1/yKUSppzxYh1WLq8G+XB5hcO8QKgPL1?=
 =?us-ascii?Q?g5N6EWYdVX2MC6VvyPK7urf7ehC0vezR/itByDK5ZRgld2WC96RT9eWucOPf?=
 =?us-ascii?Q?XvEtmdNts8V2dxdoz/7wSugIwAVPAMfzEoJ9huWzo5U72OAx3J756pf1fAS1?=
 =?us-ascii?Q?nA3yFgyPcyPAsQwCvMzKpEVgF6ax74+JpiNDwyWUcfO0x37Dkogxdh9oj6uy?=
 =?us-ascii?Q?kq8l2M2LEYVzx89qDFII5iRotDYi7pT/2qb0Gkl4FFsikZSop1ZOkZEZkfg8?=
 =?us-ascii?Q?vZPhh84mhCwv81oErWnYHsPg4W0TuOOAzdoeNlC2kCfX59hTzK4hhTZsomie?=
 =?us-ascii?Q?BjlRFe3M68DKfhhG7K86uFeVNYN9ouqG93JXwDMMphOjcHU4EikTAZemC++X?=
 =?us-ascii?Q?Fz4HLyv4kd/URtIL7z+3OpIcptvwS5xLcXxnKcf4/gdo2shnldtWMuWV+1Rl?=
 =?us-ascii?Q?DYPohuLavcgp2Vq9vgEWNlCLGI5ZhSlw5iSgZdK+DJcmO1h2jsRbcDM/1lbO?=
 =?us-ascii?Q?Br/6hN/Ml7jLTiNdsw/5W2900KfZVtJO2JH/mh7y7bw8kuHCgfF7B27dGcPT?=
 =?us-ascii?Q?s3MY2RpSf1VYIW7WUVlYPAr8cC3WEInwdTsret0kyftJne2ZjehZ58+jKZcN?=
 =?us-ascii?Q?ps3Mqwf4DXwaFFa8j+vzcVyMf6EQ8MQQPQvxbYmn8b+U0l54RxwW9d1uOVIB?=
 =?us-ascii?Q?A6gohRCfAEZizuwcA6pQRafEqbqNuHL4N9jlvEI81LOryWMrxBuQouUdsj91?=
 =?us-ascii?Q?lmcWEG8EI7KSeY0OYyT/MeRYl/5XPk8TQc3nhMuU13KKVq3rglqnFmF77Ajv?=
 =?us-ascii?Q?I7jbepZAN2pdM28zg/gZNBakP0GuHC+IweGVXVZdDoWgWelqn8rF+FJeDXP4?=
 =?us-ascii?Q?1i1jarDqSeKbdE7nTyCNB1X4E/tx/1Jp5B7ZUyH2SLkKKWVQ9MOguavNIfwB?=
 =?us-ascii?Q?R7wqMfHNYX1meba/X6AXuyHKWfQ6S0MeVzPOEXSbbiUJZxoh5CB3qusxrYnt?=
 =?us-ascii?Q?8uGC2cT83oHJ7P+eyCISm8wsM61ARzM5dcJQbUCrpVJGyc8ewUGxdKvZOfI/?=
 =?us-ascii?Q?iPCHXxgBNCKkESQ+5IxD8Ad6SvtF46IfZF8eyhIraQ8BTc09u3+K0Jqelmza?=
 =?us-ascii?Q?81hb8RoOz+vJVXscuZ6mQdQ9Ucm6z4uuVScKasLwRUsp4BtewUo77R0N6Sl4?=
 =?us-ascii?Q?pQOCj5X06JU/xmGwC75yEdWn4C1voT0AAZw0YE3m3e1jccPr9s+MBV5ItwbK?=
 =?us-ascii?Q?aIwRIw1coC3MOax4huYXJFOBdD96bHUf+LWLvQXXr0LRRApZHyZ5FEL1jHgA?=
 =?us-ascii?Q?xiWiwRkhm46ktx0nkiO/ykF5KRCl9zWgprpuP4/Hgki4U4chkFHW9GsC2Hgw?=
 =?us-ascii?Q?qtIH65qA4ximVunyTP5m5vMcNRSsP6ZI4jlSvdM8IouTs8epoVrX8AzBq05L?=
 =?us-ascii?Q?Ukpf3Ez9v7m63vdaP3F8hY3QhS5jASPoE7dGZqiliU8ZPwdLB7YtdrPeaVTc?=
 =?us-ascii?Q?nL96tR18BLESQVidjBfyjtZOXO8Kl29pKD9pT4xMbuT5ezBlWxg3F5BTJZQb?=
 =?us-ascii?Q?3tlO5/a70t4TElVSPF3HtVKRooBjMlJVe3ioCvEFLcOjdUEv5iD8EpzuXwCq?=
 =?us-ascii?Q?PRwDJEyMMFmyYyES2iGnt/4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57eb59bb-ed2c-4018-8ec6-08dcd9471d9b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR01MB8101.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 07:37:44.3558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +LYYPQI2iVREd95WOcNfGQsOGxKgHMjjyz1TM5suREY4ketFrCrxjBr9f+xnV1vPvhbE0wLlNSJcwUZ505SoxQG+Jr8/bA6jWmUMSLkzOG8Z2OJVj9QMTW5StqRgfS/H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB7173
X-TUID: WjGZhLRISLnh

Extend the 'mte' property for the virt machine to cover KVM as
well. For KVM, we don't allocate tag memory, but instead enable
the capability.

If MTE has been enabled, we need to disable migration, as we do not
yet have a way to migrate the tags as well. Therefore, MTE will stay
off with KVM unless requested explicitly.

This patch is rework of commit b320e21c48ce64853904bea6631c0158cc2ef227
which broke TCG since it made the TCG -cpu max
report the presence of MTE to the guest even if the board hadn't
enabled MTE by wiring up the tag RAM. This meant that if the guest
then tried to use MTE QEMU would segfault accessing the
non-existent tag RAM.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
---

Changes since V2:
	Updated with review comments.

Changes since V1:
	Added code to enable MTE before reading register
id_aa64pfr1 (unmasked MTE bits).

This patch is boot tested on ARM64 with KVM and on X86 with TCG for mte=on
and default case(i.e, no mte).

 hw/arm/virt.c        | 72 ++++++++++++++++++++++++++------------------
 target/arm/cpu.c     | 11 +++++--
 target/arm/cpu.h     |  2 ++
 target/arm/kvm.c     | 57 +++++++++++++++++++++++++++++++++++
 target/arm/kvm_arm.h | 19 ++++++++++++
 5 files changed, 129 insertions(+), 32 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7934b23651..a33af7d996 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2211,7 +2211,7 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->mte && (kvm_enabled() || hvf_enabled())) {
+    if (vms->mte && hvf_enabled()) {
         error_report("mach-virt: %s does not support providing "
                      "MTE to the guest CPU",
                      current_accel_name());
@@ -2281,39 +2281,51 @@ static void machvirt_init(MachineState *machine)
         }
 
         if (vms->mte) {
-            /* Create the memory region only once, but link to all cpus. */
-            if (!tag_sysmem) {
-                /*
-                 * The property exists only if MemTag is supported.
-                 * If it is, we must allocate the ram to back that up.
-                 */
-                if (!object_property_find(cpuobj, "tag-memory")) {
-                    error_report("MTE requested, but not supported "
-                                 "by the guest CPU");
-                    exit(1);
+            if (tcg_enabled()) {
+                /* Create the memory region only once, but link to all cpus. */
+                if (!tag_sysmem) {
+                    /*
+                     * The property exists only if MemTag is supported.
+                     * If it is, we must allocate the ram to back that up.
+                     */
+                    if (!object_property_find(cpuobj, "tag-memory")) {
+                        error_report("MTE requested, but not supported "
+                                     "by the guest CPU");
+                        exit(1);
+                    }
+
+                    tag_sysmem = g_new(MemoryRegion, 1);
+                    memory_region_init(tag_sysmem, OBJECT(machine),
+                                       "tag-memory", UINT64_MAX / 32);
+
+                    if (vms->secure) {
+                        secure_tag_sysmem = g_new(MemoryRegion, 1);
+                        memory_region_init(secure_tag_sysmem, OBJECT(machine),
+                                           "secure-tag-memory",
+                                           UINT64_MAX / 32);
+
+                        /* As with ram, secure-tag takes precedence over tag. */
+                        memory_region_add_subregion_overlap(secure_tag_sysmem,
+                                                            0, tag_sysmem, -1);
+                    }
                 }
 
-                tag_sysmem = g_new(MemoryRegion, 1);
-                memory_region_init(tag_sysmem, OBJECT(machine),
-                                   "tag-memory", UINT64_MAX / 32);
-
+                object_property_set_link(cpuobj, "tag-memory",
+                                         OBJECT(tag_sysmem), &error_abort);
                 if (vms->secure) {
-                    secure_tag_sysmem = g_new(MemoryRegion, 1);
-                    memory_region_init(secure_tag_sysmem, OBJECT(machine),
-                                       "secure-tag-memory", UINT64_MAX / 32);
-
-                    /* As with ram, secure-tag takes precedence over tag.  */
-                    memory_region_add_subregion_overlap(secure_tag_sysmem, 0,
-                                                        tag_sysmem, -1);
+                    object_property_set_link(cpuobj, "secure-tag-memory",
+                                             OBJECT(secure_tag_sysmem),
+                                             &error_abort);
                 }
-            }
-
-            object_property_set_link(cpuobj, "tag-memory", OBJECT(tag_sysmem),
-                                     &error_abort);
-            if (vms->secure) {
-                object_property_set_link(cpuobj, "secure-tag-memory",
-                                         OBJECT(secure_tag_sysmem),
-                                         &error_abort);
+            } else if (kvm_enabled()) {
+                if (!kvm_arm_mte_supported()) {
+                    error_report("MTE requested, but not supported by KVM");
+                    exit(1);
+                }
+                kvm_arm_enable_mte(cpuobj, &error_abort);
+            } else {
+                    error_report("MTE requested, but not supported ");
+                    exit(1);
             }
         }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 19191c2391..8a2fc471ce 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2390,14 +2390,21 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
         /*
-         * If we do not have tag-memory provided by the machine,
+         * If we do not have tag-memory provided by the TCG,
          * reduce MTE support to instructions enabled at EL0.
          * This matches Cortex-A710 BROADCASTMTE input being LOW.
          */
-        if (cpu->tag_memory == NULL) {
+        if (tcg_enabled() && cpu->tag_memory == NULL) {
             cpu->isar.id_aa64pfr1 =
                 FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 1);
         }
+
+        /*
+         * Clear MTE bits, if not enabled in KVM mode.
+         */
+        if (kvm_enabled() && !cpu->kvm_mte) {
+                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
+        }
 #endif
     }
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f065756c5c..8fc8b6398f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -922,6 +922,8 @@ struct ArchCPU {
 
     /* CPU has memory protection unit */
     bool has_mpu;
+    /* CPU has MTE enabled in KVM mode */
+    bool kvm_mte;
     /* PMSAv7 MPU number of supported regions */
     uint32_t pmsav7_dregion;
     /* PMSAv8 MPU number of supported hyp regions */
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 849e2e21b3..af7a98517d 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -39,6 +39,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ghes.h"
 #include "target/arm/gtimer.h"
+#include "migration/blocker.h"
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
@@ -119,6 +120,20 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
     if (vmfd < 0) {
         goto err;
     }
+
+    /*
+     * MTE capability must be enabled by the VMM before creating
+     * any VCPUs. The MTE bits of the ID_AA64PFR1 register are masked
+     * if MTE is not enabled, allowing them to be probed correctly.
+     */
+    if (kvm_arm_mte_supported()) {
+        KVMState kvm_state;
+
+        kvm_state.fd = kvmfd;
+        kvm_state.vmfd = vmfd;
+        kvm_vm_enable_cap(&kvm_state, KVM_CAP_ARM_MTE, 0);
+    }
+
     cpufd = ioctl(vmfd, KVM_CREATE_VCPU, 0);
     if (cpufd < 0) {
         goto err;
@@ -1793,6 +1808,11 @@ bool kvm_arm_sve_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
 }
 
+bool kvm_arm_mte_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_MTE);
+}
+
 QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
 
 uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu)
@@ -2417,3 +2437,40 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
     }
     return 0;
 }
+
+void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
+{
+    static bool tried_to_enable;
+    static bool succeeded_to_enable;
+    Error *mte_migration_blocker = NULL;
+    ARMCPU *cpu = ARM_CPU(cpuobj);
+    int ret;
+
+    if (!tried_to_enable) {
+        /*
+         * MTE on KVM is enabled on a per-VM basis (and retrying doesn't make
+         * sense), and we only want a single migration blocker as well.
+         */
+        tried_to_enable = true;
+
+        ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0);
+        if (ret) {
+            error_setg_errno(errp, -ret, "Failed to enable KVM_CAP_ARM_MTE");
+            return;
+        }
+
+        /* TODO: Add migration support with MTE enabled */
+        error_setg(&mte_migration_blocker,
+                   "Live migration disabled due to MTE enabled");
+        if (migrate_add_blocker(&mte_migration_blocker, errp)) {
+            error_free(mte_migration_blocker);
+            return;
+        }
+
+        succeeded_to_enable = true;
+    }
+
+    if (succeeded_to_enable) {
+        cpu->kvm_mte = true;
+    }
+}
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index cfaa0d9bc7..4d293618a7 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -188,6 +188,13 @@ bool kvm_arm_pmu_supported(void);
  */
 bool kvm_arm_sve_supported(void);
 
+/**
+ * kvm_arm_mte_supported:
+ *
+ * Returns: true if KVM can enable MTE, and false otherwise.
+ */
+bool kvm_arm_mte_supported(void);
+
 /**
  * kvm_arm_get_max_vm_ipa_size:
  * @ms: Machine state handle
@@ -214,6 +221,8 @@ void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa);
 
 int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
+void kvm_arm_enable_mte(Object *cpuobj, Error **errp);
+
 #else
 
 /*
@@ -235,6 +244,11 @@ static inline bool kvm_arm_sve_supported(void)
     return false;
 }
 
+static inline bool kvm_arm_mte_supported(void)
+{
+    return false;
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
@@ -283,6 +297,11 @@ static inline uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu)
     g_assert_not_reached();
 }
 
+static inline void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
+{
+    g_assert_not_reached();
+}
+
 #endif
 
 #endif
-- 
2.44.0
