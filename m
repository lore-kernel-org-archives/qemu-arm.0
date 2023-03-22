Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5714475ejb;
        Wed, 22 Mar 2023 13:26:10 -0700 (PDT)
X-Google-Smtp-Source: AK7set8H6GCw4CByjC1D/K/ZFWuUTwAw0tPYbGh1R63SBnyKIhM0MD97iJDRcwywWXMP52Zz93Hx
X-Received: by 2002:a17:906:7f99:b0:931:59f:d42 with SMTP id f25-20020a1709067f9900b00931059f0d42mr7556498ejr.29.1679516769851;
        Wed, 22 Mar 2023 13:26:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1679516769; cv=pass;
        d=google.com; s=arc-20160816;
        b=QObe1RsP2RQx91N1E0jv6Ai4oyh0FQ94KiqoJ7DP27mttw4V8pyzY4MneepZPxwV+S
         2pAk54XUcLTsud2J+GJmh3CEBOTWNgpSykqOwKEfnxMxV0i2zEEpt0lTA4bV0FwNwMo3
         HV+LZrxB26nT11XRpCZOT2SYKHb3cWLboP74Qq8aL7tPTtQ89c45WbRTvrQvrXkxz0Q4
         90u6cpZ12+U5fsowShY62JgAabvummykgDFiZXRhCWukKIBe4irZRJBejtzQE/JNw+FC
         zlWndZvv9QkpwoIruiHNy5JHSIxZWXd4MqRSEbkVgi0uYETk6Hu7Bw7/CpV+9JLxeXFK
         HJbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=qPOwCVqe3dZFbpOwYxdKtOpzpvTHW25wUv/V0X77WF4=;
        b=LayMmMMVuaGCV8BNnVm3/LEZffX0P+UrTGB1jH9DtyKXA+iZnEdZ+v93bEla47JRw7
         h2Ju0iWqcxYff5mO4+HO50pbDLhy6mdYGPCd7tCAadin2kY3Kh/iT2otAQ/qomlOczx/
         LPB6AJYdbt7KpoBRG2Do31kpaPp7fcdVnxNZZbMO8d25dJghMUmSZ72jjJ+mGhxpo4jK
         ioBtAvQR8sQZTR3MfZgh+bzrcJEbzu1BVGTW8gUr18RWfJKB+nS17npBsnE7/5/RV0Je
         n5bu7npw4ihZL+F0eOWzEzE/10wozSaed6Z+ibKjayzcvsLns/yDHQMyeuEzFkFYWEAu
         9lZA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=Gwe0boHB;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::723 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20723.outbound.protection.outlook.com. [2a01:111:f400:7e8c::723])
        by mx.google.com with ESMTPS id hz2-20020a1709072ce200b00931d3414a47si12563812ejc.200.2023.03.22.13.26.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Mar 2023 13:26:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::723 as permitted sender) client-ip=2a01:111:f400:7e8c::723;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=Gwe0boHB;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::723 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVN5auXcAWrVrqP+Ln7pvHvBYhRq5DVmQoy0XZ8p0zwUBxv+7zgzMbizWD38YBEziUxOp4ZxjsRf8VDwGdj7WTkbJ26K19pDGS3ZfOKLaoVWA+d2dMiickESHjBz1762WXph/Fcr2EixmpNBp8nbODF9cE05/+iftyaESbcDWrDN5+ZqmMccuNOWu7cJiznsM0+tB3jChZtbncbJqF35tPVSoy6PLZ0bisjLLstaAPwWx+ebZjiQ/SnMGdV5GCoCrzr0dkl8AwAdQ9b+6P0CKG9gKazqndr83N/eNh47+nc0o2l/MXH1IkfoE/OFGMhjDVEqmITsq+LxJRCyeajH6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPOwCVqe3dZFbpOwYxdKtOpzpvTHW25wUv/V0X77WF4=;
 b=K6Wt9hWWzyxIMHsNeqMMfYoz43LT8QQ4v3/MvM670YtfmiXLqVaZ7uqsgAQCuFgetM5ITuQAksPR3Vr8aQlX6JhbZODDjHNejlOOHaXO6Ntaksw6a3WWyyRJrkL5iQJCP393zVYxS8F7E4AVrSqavb0164ujdqMlEr1ybj/+IHRFUIv3P3JugBNkkh8zakNTW7961nhVYnenTkzX2rjQHoJhh5KtVPyHj8Cu4QTkRoPYWjVdWK1eUDYZ5tGgmYrGh8lq1DT2AVldY6LBGxEwA6efwcgd+KgPXyT7aEe7Uc/pEk6QJr6PHqQW9DhYxb1uh/wHGOUFu5VBA0yqIIQjrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPOwCVqe3dZFbpOwYxdKtOpzpvTHW25wUv/V0X77WF4=;
 b=Gwe0boHB2lNYkCoT7LsQBq2Q9CytAJNIP1wHa7HjMzRMptz5tkx/GEey1ZqtpOUeYwmahfSKN71WHPgdy88Hy7YJRPKe0axMO/zx9UOdLfC2zRaeUfwIMn5xj/jFmfS1lW9CtPM2aZc0HRozvNypdW8LWM40081tiEAXAPBXGKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SA1PR01MB7342.prod.exchangelabs.com (2603:10b6:806:1f5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.8; Wed, 22 Mar 2023 20:26:05 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c%8]) with mapi id 15.20.6222.010; Wed, 22 Mar 2023
 20:26:04 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vincent Dehors <vincent.dehors@smile.fr>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v3 0/8] Implement Most ARMv8.3 Pointer Authentication Features
Date: Wed, 22 Mar 2023 16:25:33 -0400
Message-Id: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:610:59::18) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
Return-Path: aaron@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SA1PR01MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: ee99ce9d-e90a-4dbd-7387-08db2b13a91a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RaJx9qvYoYsjYSa6AYJZktEWAWoYLFcU3n46ALEMRw73MSjFGwZKwVNRdFCfrC8vorVi6Ji1KnKTPbH6MRW4wv975pzIxOWOqyz14ZOerDHWaLr6GyP1knk7fLgCOVtB7UIZEZSn508G6K74D8sbGSfDE1hOrxfpNThKdHPPd+qXByGX/NvLOydCIpibHIiJ/Gmx9zQYmsGpybIaeBF21Y1nSCWZ6UNYneUzjg/87ha+JcJy5Ovu0mpUjzXXyXGGfT2OngfYizg+alcMsQoYeALYjL/8SHsZqC5QdeCEOJOEt8iOMkjNqsfLY5QKMNa1nC4wCCz4Eul//pGS8lc/OQuleDmNjOkJsa1uiOqpbufSkG2qXU5d9vk/O2N52qflDNBpMCYglov69TSvrP6cW/biO9hrIfcroBQIip+8szSC1wDt5y3GcVIUdGMP8T9n+c0Vkynw0OL6Qwf8OYOYpjCqlzINqnKoXMglJ23XLGde7HGVKwNl3zTjCjgDJhPNRynr0xRk5NN1PKxdDJqMJh7h8MXjpvmJ++a8ey6456FFksZopduWhOzSBLm7JqMKX9P4iQvEza5DyobrVhG2wf1WDx7++RcUyHp07xq9jdr3R2h7aNilD7jTGNR+sXcxIDyfr646qAj2lHvJzgL+HnaKGH9Qj3JTTOmbtAdv8VLZAKvVoM0Fd2SocctIZAP+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(366004)(396003)(376002)(39850400004)(451199018)(966005)(83380400001)(38350700002)(6486002)(186003)(6506007)(86362001)(26005)(6512007)(2616005)(1076003)(38100700002)(6666004)(107886003)(5660300002)(4326008)(52116002)(66476007)(41300700001)(110136005)(66946007)(478600001)(8936002)(2906002)(8676002)(316002)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FMA4PAwYHQgDveo+yeZKatadO+bsaMwhtdAlLy0mnakjN3HCJDbD58+yA34I?=
 =?us-ascii?Q?8TkXu/aHoHVOOd2IErk8UIvNSh2/Lp0yuwAtmqC4Ki2S41Ve7G1CCaGfbB4X?=
 =?us-ascii?Q?Rm8PEOoGKk5ZyOKWvrufA0pF5yXYazj8BXYiwgEUrsBj13rrN49rRvuLm2nw?=
 =?us-ascii?Q?2ABjYaqsXHwGagcY+1k3VZqF9Lzb4OlJKxBRqT7NqyLzao78b25SSeHZwBSg?=
 =?us-ascii?Q?dZ5vHIvv4qNZ6d+a8r6LBGse3Kanj9MZ3C3kv/j9cofy7xIvIZTvUsO2MTnq?=
 =?us-ascii?Q?5oPhTQlIbr6tyQOWQklb42bTk23K5h8HAR9mGGsLp+THQIHxxsYvP408qyoC?=
 =?us-ascii?Q?Vf6wjk0JI2KFCfmlKN+YxWPYN9JD0jhbxXsfCKJU4EvwMFv3FbONx6LFuo5G?=
 =?us-ascii?Q?Lwf319JkDjOJ6F3le+IqXJ+CYxLpeDwZksCydaw//KJkZqaLKdbcpCWizd3z?=
 =?us-ascii?Q?f5TpNuLiDfWmBGLOq9gPtqNkpMkDkemMNRILuRIdGpo/Sx2k5PLNRVGSAEGp?=
 =?us-ascii?Q?Rp6TAZ66cRIgTPSN5LyTyTDu9I0cYIkE57SlAO8Tl9H2eSYOw/X4CjZN6nvz?=
 =?us-ascii?Q?MHTK98Vuga43Q2Gyr2wJ8TA9khRi80tZaavTpO/S7i+Z7663zFzSwRMuL5dI?=
 =?us-ascii?Q?ghKpGDhve++AB2+wyhJI3KDytKIGRLE9iK47N9Vdp5XFR+UG/b+dfCZcNnro?=
 =?us-ascii?Q?luXzWQWygzb/wu/oH5Q1I9Q68njh84xV6jbKhCf/dIFseyhC9UhBylGBsM57?=
 =?us-ascii?Q?8IzpnMx0IZrZ0LtMbowc4l5Cpprmup/MrsMvxpz38rYwra9kvso6Bel0PjUU?=
 =?us-ascii?Q?BCA9h4bLbI1r+/kMGLKPeBhlUsyeVa6Xu6AfphAdBdQJv4s53u1EyMR6erPa?=
 =?us-ascii?Q?mELJsoUIY5BjvSsfhSS72K7SkVSwmsI4WHDEn/nVbUeJlMnDAn/fsUruq+7l?=
 =?us-ascii?Q?TMbOBcTOAkyTP5MdB6wLhg4TT1/w+mWUOEpd58mjBtPcR3y4o45guTmCGaUU?=
 =?us-ascii?Q?/lSW+Uw2GBM/y6Y3t4gj1TOI82ikEIlUKeaOq9mguBOHppAsC99HM1ohOxgR?=
 =?us-ascii?Q?m81qRWt0yMJCxqU8O8VGAHbWY0OXIIbhfco2d7r5A+Sh0jMkpoq7nBqr+yzi?=
 =?us-ascii?Q?fZbszjtwcTqgajoWPqzmsiZoOGO1aEYeK9nuuMbcagsv3JqKgwRbQZsvNvud?=
 =?us-ascii?Q?kJAcWWUmBapqzGxCjYp4TUGcNwvYUzCFmPukgTSFLGJ792O+Xj25j2t4LhU/?=
 =?us-ascii?Q?Y3lOKCxNJXkWNKtbUOCZt1R2b1eHfa6OsGZ1CIfZj4tgw9Ktki6v/NOxRgcw?=
 =?us-ascii?Q?3ui3Nz6g/Ow53pdhQJrjMKs0ep/SK4/7sz5fJNSeEnRRx1ErZUK+h1gc7afK?=
 =?us-ascii?Q?/LzKUlaJjqyPgfNoKiDjiAzbZ7koVZ0H5RwuFRE57470yok2bUHrtXDUzshr?=
 =?us-ascii?Q?yGwpZk+loyNT7wtyJo5yUpb55wR4F+JUll+AONpdjNUC9Kb2fOFzGSPYENOI?=
 =?us-ascii?Q?3A3T+srjBb4eDZ5LboqVjor2LVCjPPMmyhLWun5Ktsl1Z7OZ/NMw4i5JWF6A?=
 =?us-ascii?Q?ndzaFnsv+/3OH0S5aPqDgM3GyWiXx6ZSQ+VxVx1N8qYe4QrjCTR9JFetPAzb?=
 =?us-ascii?Q?Mlh1LIrbNxWeH/tAycSVRGM=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee99ce9d-e90a-4dbd-7387-08db2b13a91a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 20:26:04.6758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGIekWrOk35hPQuz2J8+8e1VlB1SnqLZFkaf1+SbC2dubKEvXSkul/9LIPZu5PLHWjckWgzjIoWvF/Vm60MeFRijxWN/i1z58+5GLLQLnhRMuJe8cZRZ9KWS9fYV43xK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7342
X-TUID: DPKK6keVDCFq

Changes from v2 of this patchset [0]:
- Remove properties for EPAC, Pauth2, FPAC, FPACCombined
- Put aa64isar2 addition/initialization into separate patch
- Clarified several comments (particularly one regarding our divergence
  from ARM's pseudocode around EPAC feature-detection)
- Several code formatting fixes and logic simplifications

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
 target/arm/helper-a64.h        |   4 +
 target/arm/helper.c            |   4 +-
 target/arm/hvf/hvf.c           |   1 +
 target/arm/kvm64.c             |   2 +
 target/arm/syndrome.h          |   7 ++
 target/arm/tcg/pauth_helper.c  | 189 ++++++++++++++++++++++++++-------
 target/arm/tcg/translate-a64.c |  20 ++--
 9 files changed, 274 insertions(+), 68 deletions(-)

-- 
2.25.1
