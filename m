Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp534544ejb;
        Fri, 9 Jun 2023 10:23:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7NEuh85qiTKYBHRloQVLapvTK14oUnhPZbBE0EjpqwTfl/QdLTTFmlS15HLEaiS2Sd9l9p
X-Received: by 2002:a17:90a:7043:b0:258:d910:619d with SMTP id f61-20020a17090a704300b00258d910619dmr1478739pjk.14.1686331429038;
        Fri, 09 Jun 2023 10:23:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1686331429; cv=pass;
        d=google.com; s=arc-20160816;
        b=pdTmSQen4ysaSG1llvBVUsrqiLlDqSCCwrTq7cgUos/ifGuSL+RXaL1WOabylwE/aQ
         eSuPxoHQ+aFucU8xUuoO50XhhCZx7Ue/q6Z7KVDbhZIwJKdupgj6EZq+M88X1e8jJCDX
         HbjGSXyzBZEVvhyWgk1BEGqtktpCWl4NlvY2JnVlKj65GM64hYJI5GveKbGJHE290EIa
         Jc71eBsxoggnVGmO24aGTvfTzPLAbtJIcIbr052g7ZvEYUeyWpoYL/9htbqM4c2JA+hE
         AIKao2RlqnR2tqpkM8AXeCkPbZ+NWGvymRL7ft64QovofoVblyabyoYKVqnXhoDPLxnu
         9Quw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=G+OW2zKA2AJiAZpU+7yvSHWjyZiFrHYLH5WXm6/k6qI=;
        b=GNB1ORBNgXcsZsQtSGWYesKF2DUO2syJPe1KTnB4v2kB8rJihC6atkA1H1hKJ1fw8j
         jBpYl395ELohiO4HNnkHisHlSOjmGwJWtx00VvZkEKWPLSnnTuBj2tlrWZsjPBVydtkm
         R9Op07W+fYHEnfJr3yv/YSfD7MEqbI/pWlwMAgk023mQFuvtps1VCskBmQqpI+rTVaoh
         hIkyyYohgojI3vMBOG1o8Ea6/ECp2j8HD1mLWnExjtgE47lGFAjuEBxwPWMHwXjwKHVQ
         en124r43rbCbjjmEVo8kX+fOF1oeL7963cJGqHPG5E3ZVgeMEkxse69g7vZ+F30WE1yc
         oDBw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=OeTKMQOf;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:fe5b::71a as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2071a.outbound.protection.outlook.com. [2a01:111:f400:fe5b::71a])
        by mx.google.com with ESMTPS id p9-20020a639509000000b0053f24deef0dsi2868623pgd.312.2023.06.09.10.23.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jun 2023 10:23:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:fe5b::71a as permitted sender) client-ip=2a01:111:f400:fe5b::71a;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=OeTKMQOf;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:fe5b::71a as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Us/bGEj4aOU3XOxwnbLO+zEUV4Sjvmj7d0ywXVX/TrkWy9qu0bb/jvVwDXgipwWNO402J+NMrGro5A1ETDnw/AYFGqLmDpWo5Wbh/oDLSXNT8tl1vuxqaJQyaHUSE4BtbzUwXJeTGmSL00Kymy0FXY4+LuoCiuEWQkZFmfe7jfmgIwrGYvGi1apQodZd22xFI6G09zE1g1uwtPA43S97OEq9i6XETZ13Un615tHkdGUUWJl134LVEAeeNnmtABEo5p8P22mEweZBpWNFC0RUGQB0mBinRe8Sl7v8PiJaJUl6bFHuY35s4DPgGLfvHus7qwBd2+00wzPGMJiqiclYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+OW2zKA2AJiAZpU+7yvSHWjyZiFrHYLH5WXm6/k6qI=;
 b=XSbqxvHmS8DAa3s9UfB9fU3dLCxWh4Pccj4o8p7xxUnnoVfeti2LNpetNO3RDA5U/ZIC/bl3mJu7KIo++qGxIIC1L2nlZ4WayD759T5CSv1tU/9si/AsmMIrGYE6IqJNwI1WdJtiHTnoo6eGffqL946Tv6pDi9CPVlB4FrQj5icXDNL7tqHHgfcS/UBMc8TlwLOUe6tlYETOBtTDbPP/mnXtq/0hFJ1oOHmRmNMBjLhKwbK0tPyVH2Ll3XxNUodCBvnqu84dPchqXKa1iWhGQbRdxKKHTZqm7S99tyK1JPnU5h8th0Rsg/ufbjHZZj1YCupkxMSMlAvOhjoqJW9irA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+OW2zKA2AJiAZpU+7yvSHWjyZiFrHYLH5WXm6/k6qI=;
 b=OeTKMQOf3LDXAJaM1/IVj4W7b9B+ePATKDxjuSaOlxTGUhhWnb7/xJmPEC8Y4o+WUpuMkWRv5Oz+fdcOyUczKSEDt5zotudT9CPhvLkd4lGxhGl+4cyNy3tMXh6GuNi9rPgYncgJspYch0t2CFIzHci/4nMjqi+VjDpw3JZuoIY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SJ2PR01MB8481.prod.exchangelabs.com (2603:10b6:a03:562::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.44; Fri, 9 Jun 2023 17:23:43 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::9a78:4703:c6a9:16ed]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::9a78:4703:c6a9:16ed%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 17:23:43 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vincent Dehors <vincent.dehors@smile.fr>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v3 0/8] Implement Most ARMv8.3 Pointer Authentication Features
Date: Fri,  9 Jun 2023 13:23:16 -0400
Message-Id: <20230609172324.982888-1-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:610:b0::14) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
Return-Path: aaron@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SJ2PR01MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: 097a5454-2607-4c0a-856b-08db690e4667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uObGPq901TBmULYSS+cmVqUXMXSqy/MSe6j3qa8r7V2JXaPWDzMoWHS2brzBR2G3tFtAOXPJ4SFeHugq76+UYGYqrKqxke3aAlAo43w4Ug+PoZO9YOIvs1AgILrq2+/K4cZY9hTCAhy5zozynBVJgIu7AgqGQ3o6pzyvTggJbCeOHDMW9woo5GTKwsXwTCIbIQ/e1mleJncSalwoSqikEho7swB/FYH82tWYybdE1t6PpyupnUM/+FCgCfdN7PugsjvnmDTQVJinANwFdKrfvGJk7Yaxa8Njzo1I+QiSMz4rU5UeuDyRXrukZQCeX/jtWQZ3An6lmz4L7lFQc5N/QRLmKDcmOZaGMk9s95/MCKsKz2dkB0yJEENUqjUYKXRUy25wS6J049rNPGMNNenL32JhSNAmCpaCPWqsfhLzYBh182V82WjBaYJQEyfHQhXrmXHgqec58ntfcQ5Lg/ERPwTwOBp6XK7WUDaXNfO+8w+D35zT9czXlGYtS3M9mGqRaYzfFWyB5219iwkJSoN7eq+5Egq3yrnrGIkTLFJCQ1ElfJUfKvGiH/588RSjxw/JbM96inU2HMvEkY9gTpbTZxcL3qIWbaksMdN4/wD0E18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(39850400004)(396003)(376002)(451199021)(2906002)(83380400001)(26005)(1076003)(6506007)(6512007)(478600001)(110136005)(966005)(107886003)(52116002)(6486002)(6666004)(8936002)(8676002)(41300700001)(5660300002)(2616005)(66946007)(66476007)(4326008)(66556008)(186003)(316002)(38100700002)(38350700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TaNhcwAgRGugEHxdyIXKS11DBdAK2iQP75+BNpYEFyOuLxUCw1Lh+iCRB5e1?=
 =?us-ascii?Q?yo07iaGjeJKu4Ed7ymfVKawSgvJg4j60wAH1FZsexF79v2OM0TrzG5Fb6PMl?=
 =?us-ascii?Q?O/NHY3N1mf2clZr9ODIpmR4u2rncrTgG9TFB5ReeOlzbarX9OVBsAw6Qtywb?=
 =?us-ascii?Q?Yyfp/fEd/I8ie9o37fmQc3rsfuyjwVuUbJI/GHf6ZtGPk9qrH4XlgmLjl6mW?=
 =?us-ascii?Q?cGo4UrPvNpHOiEMCokWShZeU2iPoKR1Xr5bpSfZfoh9ynj3g8n+Dyh5XVdXf?=
 =?us-ascii?Q?rc7z3ZVRJrZV7zQBWgkCsbi+hIwMk3Cfn6N9lSpniTdrp9yQDjP58Rh5PvoB?=
 =?us-ascii?Q?yuvJxKc3v6IV8I56tPmBEWciIJK7M1/OwSe6M4UFgyKC2Hmz411fvDmzS3xi?=
 =?us-ascii?Q?8JbqQ9Em0c8WJJztKfMq7qbGiT1SQa3pD+GiBaPgr5WZcUZlvsmzlwynLbNe?=
 =?us-ascii?Q?9R7F5tSHZvwRhDEEuPDKoG1cX7Z9DH7PQzBypNoYT70k2iDuv+Aiy1OaF+Yp?=
 =?us-ascii?Q?qf33bE6lg7jZG0jqrwlKhERyObtH4c7Ce96sp6pu3CoBfq9nNDeVwT/rSfri?=
 =?us-ascii?Q?7xD7Np9rAM0rEb1WDAfH8/bT3AutI5eSB6tYwQWypX7sBtfVqZb7jijtbVHW?=
 =?us-ascii?Q?PoQnkbtwazN2sOugh0/h3sb4vD7g/O6HM7X8Rx8QGdvvTtBFsJBmNjpiyiit?=
 =?us-ascii?Q?qekNSt/kWoyNzjN0ZVKMkEyyInud+TsLmjEJiSF0gdS9GuEHDakdu2iRc1vm?=
 =?us-ascii?Q?tl8Jgl8ny5iWcg3Q626AUiaza+2zy6Z5LGJ5j4kRWeVcOuUDdzqVuvBgJCik?=
 =?us-ascii?Q?7onTbaugwzCiUqyvE4W0Etbh4yTQZ3DI4c31g4xDmHjiF8E5muU+hvZfu1e0?=
 =?us-ascii?Q?hoKhVlw2XIhPCwU5tng5xIl8CBy11rcz4OKXI15rX+XmzYdmNxeNZ09jAJ2V?=
 =?us-ascii?Q?x4Ry1r+XNEJ4wPinU6yzDDCqtIRM8klLv0qF6MA6Ez4TJlQ4ZScE5wdiiUuw?=
 =?us-ascii?Q?jufzND4tZNXhqXg/eSEIbVePO38Aepar65aiYAX+jOwODDLnZv55lsE0oro8?=
 =?us-ascii?Q?PQ/CWy/Ia/MFRXqlYaN15PsE42xe5H2jEsODwMh5m5XLLf3V6JBqig+2SgJn?=
 =?us-ascii?Q?wQclOEISciNMAHDUJIg+pzicbzA0zpCqSK+1QDLCRHKghGLUA7/bL5Or95cI?=
 =?us-ascii?Q?cOayikm5X8oFec+nFGS9Cd5ce8EfDIY6JKzMAknRbXFkC7IQakQnQQzTX8ks?=
 =?us-ascii?Q?st/YgEngfjN+rFvD0Szc050ThsQGpcDZAhUl+BA8+WfYPZFzKSb+1yl0jyAW?=
 =?us-ascii?Q?M403moRjcggHJkqKlzvVEZQ+A5DjD+1wL541ToY/xkom/UgCMBYNDx8b2Xpt?=
 =?us-ascii?Q?KD9PoJje0oUJrenP3TXoGPwrGl3JntKZMI/D9aqgbrUHy8qeuV1w8xzbo2t8?=
 =?us-ascii?Q?rPeZ21jM9e5ZqFHMdqJ2029GiIsr0q6fgE3UUcTDKczPOpIlXW97YGScgBg3?=
 =?us-ascii?Q?CoB4+XD/lKqkO+WntHf9VSYcNAbABjAIHKczHzqJrZGSjJ55YcvjBgL1DVHK?=
 =?us-ascii?Q?w+HH6qDeKoDv4+IUF40h6vfp+Jv/T8Q0S9qfI1qBgDu3MkdXj7fCYJffU5y0?=
 =?us-ascii?Q?TQtlLC8FoeLcDWB1bK1gs2E=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097a5454-2607-4c0a-856b-08db690e4667
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 17:23:43.6287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7spHPRbaxJVPEN2t3wL8sIIq8dbeepKGAx5QNXve+XxAzDQW6nyIqmwIFemkcPrQIbWIoSdne/hyBRIZBGDKgdYB0TU7bZxZePVHM7Uf5cwsKVLpewjOkPj4E4ymVbP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8481
X-TUID: TYM8nuPvjr7U

Changes from v2 of this patchset [0]:
- Remove properties for EPAC, Pauth2, FPAC, FPACCombined
- Separate out aa64isar2 addition into its own patch
- Comment clarifications
- Several code formatting/simplifications
- Rebase on top of latest upstream changes (for example, those which
  reorganized decoding PAC branch instructions)

[0] - https://lists.nongnu.org/archive/html/qemu-devel/2023-02/msg06494.html

Aaron Lindsay (8):
  target/arm: Add ID_AA64ISAR2_EL1
  target/arm: v8.3 PAC ID_AA64ISAR[12] feature-detection
  target/arm: Implement v8.3 QARMA3 PAC cipher
  target/arm: Implement v8.3 EnhancedPAC
  target/arm: Implement v8.3 Pauth2
  targer/arm: Inform helpers whether a PAC instruction is 'combined'
  target/arm: Implement v8.3 FPAC and FPACCOMBINE
  target/arm: Add CPU property for QARMA3, enable FPACCombined by
    default

 target/arm/cpu.h               |  67 +++++++++++-
 target/arm/cpu64.c             |  48 ++++++---
 target/arm/helper.c            |   4 +-
 target/arm/hvf/hvf.c           |   1 +
 target/arm/kvm64.c             |   2 +
 target/arm/syndrome.h          |   7 ++
 target/arm/tcg/helper-a64.h    |   4 +
 target/arm/tcg/pauth_helper.c  | 189 ++++++++++++++++++++++++++-------
 target/arm/tcg/translate-a64.c |  12 +--
 9 files changed, 270 insertions(+), 64 deletions(-)

-- 
2.25.1
