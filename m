Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp6729338lfk;
        Mon, 22 Nov 2021 02:35:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwexVghMWKR/KOQqGVxJ7oRo5B/wLHlQGiXcXZZNFuDqrFaM5M16PXflhPDeECEP8yisChW
X-Received: by 2002:ac5:c183:: with SMTP id z3mr72964226vkb.20.1637577309528;
        Mon, 22 Nov 2021 02:35:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1637577309; cv=pass;
        d=google.com; s=arc-20160816;
        b=FbziauLAXvncv1BfUQGA7eu+5wmzC7waYNMXGPggLD96iUPLErZXKfK+kmrjDuEFzN
         bLiad//+OoEqs10rW9XwW8Qu7gxhSjyrX5+HoWQeUI02P++o2bCX4xJ/MJRLsI8iFFkb
         RuWmnUVAxiMIgNetxW+9CDnU6ZG9iOsvmofQozCKcGU5F1HcR6ArVQ5BZg1SroiGGR1X
         il4EFCw55Bd2R0YZnJ5g3e4RzybO7iuLKOuOojzv8vfqkRkmeFt+yobaYqVR+Jf4/L2g
         MbQvRqq74luLVeQEBjrkCTAg/Svm1uZykImfQ22ejWNTSc/1gBeM8PArZpNESL+WytJS
         CDaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=kXKrUdbJhPzqUnVB302aigxgRQqFhkdY+C2hNzQwb64=;
        b=Ld7Fb4sZ+RlkYTJ0DqCoJLThU8FCGLrpsWspw2SPoPIHUdRfBdWcLxxIbMxaUM5cOS
         b09Dmb3GgFOjyxgaR4Gcw9ixGYFQSEryTSFnKZpl2j0SGzQvPAyySUvp4ZAd3so+gzeN
         7Bvvfjmi9i6sOoh6nDX6/ygiwYERdPQ+puGBkQhgGxr4BSX9cnqEeiUXgrJpfUl1tlLA
         VwM3aEGGIccOi8v/xsX4a/EoJTtJPTWdBpVsA6BuY6t4AXM1HvSyx/zmGcWVPpVi2InY
         iG22WHzHO25z0sesEXWfoi0I3TuX1fku9YPEnYXCObRjZdA33uEzctndi0WZxhf7UFZO
         47qw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=Z9+7FB1R;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dkim=pass dkdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16si25610238vsg.345.2021.11.22.02.35.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Nov 2021 02:35:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=Z9+7FB1R;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dkim=pass dkdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=nvidia.com
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mp6fD-0003tL-2R
	for alex.bennee@linaro.org; Mon, 22 Nov 2021 05:35:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ealkobi@nvidia.com>)
 id 1mp6eg-0003tC-DO
 for qemu-arm@nongnu.org; Mon, 22 Nov 2021 05:34:35 -0500
Received: from mail-bn8nam12on2047.outbound.protection.outlook.com
 ([40.107.237.47]:19136 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ealkobi@nvidia.com>)
 id 1mp6ed-0006M7-K8
 for qemu-arm@nongnu.org; Mon, 22 Nov 2021 05:34:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bj5R6y2ALAVLeOr2Kjwo0J/SPzi6ezZhvwERafjSXxg5K+gu9zFdrQKPqYCSVOUaSMT/wApDxVS/bFVCbZidvsheQpFC6V3RyQ9If0ShrY2yQ2cHr4mDD1BcYjOAPhIQ+xNZnRqHRo6fU3TRNwrB+5iZwgfcKUeEHmTUJqyicANRSe3HwGIZli/vXOliUTu0nKPO+XiXjWjd3A+kUYoS51RXxP3Is3XymzfSLxEvcWXG0yHR45G+8cYhNqVrSHi88M9BwN4gz2MnGVObdqA30OeJ5RTKpQP6eOy23Dr0izoymfsPQARH2PlJ/jLWvgacw2qpPerb6bjCjXgX4iVp0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXKrUdbJhPzqUnVB302aigxgRQqFhkdY+C2hNzQwb64=;
 b=mWrnRiu2Kg+tlf2nczyNPSixUSb4gmX7hp//6g78rofZgEsiCz7XtstA7Civ8DTN6O90/3CI1sbed1g5uIUYlQQL5Ncr06jYuWE1I/YozbNw3mhe7wsOF59jSheksITkGHVOUH0UOgpSWChKdY5+DVzgpk77DTps1NwZ4lF3S9nMxgm4racdMLxkKMJFbdQ9mf23tU1JFUP8xbnUXNcM7SeIdXBS8t2veCeeTbzk0rWZDng9eMeqNY7M+zsZ8JJyrPZi1QD/VSdf3xz8xzsyD5x+x7Jn6ZmCBtuXPZs/YruiZGbgIFN/bNoh+58RLDrqSZJ5yJ7TOIuX8J1dnrU1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXKrUdbJhPzqUnVB302aigxgRQqFhkdY+C2hNzQwb64=;
 b=Z9+7FB1REWoYjsD46utlFfS1pWvHL6j2B7IZFZsJ6pVfSX9c849XhDZgq550UmRGFBpNm+UqHAl/wCyJfII1h9ZlvDrWrxBM9+LRSxbsVFftgrHub0cj4/YUqjpqju/AVRDZ/oL6lWPKeU7ky8yp4ToXtBTT3yD09Au2i1DFUqnLZD3jCStVKrpEywJmFgzHvht/Mz8r6xaHrlMWVLgnhhYjRJE28nhPRwV5rlM81boB5kN1Dd07g+E505eop/uSoWgYCyVs8Cm/tzmID6nhaijxaAxFifpZaXGSfdLDFysx0MDeQyodpkx8VV9tRy6RF29qvThIyefUjsAh/1EHPQ==
Received: from DM6PR12MB2698.namprd12.prod.outlook.com (2603:10b6:5:42::12) by
 DM5PR12MB1818.namprd12.prod.outlook.com (2603:10b6:3:114::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22; Mon, 22 Nov 2021 10:13:48 +0000
Received: from DM6PR12MB2698.namprd12.prod.outlook.com
 ([fe80::add4:3388:6f59:8e65]) by DM6PR12MB2698.namprd12.prod.outlook.com
 ([fe80::add4:3388:6f59:8e65%6]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 10:13:48 +0000
From: Emanuel Alkobi <ealkobi@nvidia.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
CC: Lior Nahmanson <liorna@nvidia.com>, Tal Attaly <talat@nvidia.com>, Elijah
 Shakkour <elijahsh@nvidia.com>
Subject: qemu-aarch64 vm over x86 host question
Thread-Topic: qemu-aarch64 vm over x86 host question
Thread-Index: AdffiWyLBllul/QSQL2DLce6r/Z45w==
Date: Mon, 22 Nov 2021 10:13:48 +0000
Message-ID: <DM6PR12MB2698E2747B26D841B480829BCF9F9@DM6PR12MB2698.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5beeb9b2-014a-4aab-af86-08d9ada0c66b
x-ms-traffictypediagnostic: DM5PR12MB1818:
x-microsoft-antispam-prvs: <DM5PR12MB1818C9CBCFBE2E7B3CED671FCF9F9@DM5PR12MB1818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s7OXWh3EixHny2U5WtO3Xnb2nDFTu4W89oE+VzfF7BH2LBnSe3pNMMrE/vCd3VZB1BT6gbQYLKmDXPSerKYsqx4RdslS92OxSpsCjAUvsDlmJKaI16EXEgr58N/haZ3A8DPzD/EDrD85j1COo2m/a8I3E6LslRNesm5PNwoL9ub1XxnV58nwp+XobrRC5lcui8zoy5kgsMIYMlwkg4a3TmEpmp+2b+xA196VAxjefH6BRUGkEZA1QL9soPnGh0N7VI2qNkYcw51XXUADi1bwZq0voB/kVlain+kZLlka51irlymCq0tGf02TiftOP0OV9JmXA2f22nBnIQhs2YRqFn2hleHWMACLlT7m1ofLcpTY5zrgZFOvKHjNvG4zF8auq4P8VFuVELlijOukgKh5PcoPD09aKgxsIRlGn/DyAVfHwTrfP8kydEyOKLnahUMkIT+J6HVlil1Jr/g34IImbSLrWV+3iB+eIICQhCyguJLditYJu23sAPTq3XJtz9LPUWKl/zZvC4QpHY9sIZVZLeWga7zq+zKLVmX4zYxVoIGd31RFPMNmIddn6leUSgINvT1vlQ31iGiHggVghCqBlb0cDlNAbQWZRzc5o/GRtcZM03gPOCSbMfz1lwpNco8LpR9m6+Xf07Ogcna922d2m28exv+GKgqyZcR+SGSqv0PxL/hTJttnqPp6TJ6+GqpVh06S8VaDDj0+STsxyE4Tag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2698.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(508600001)(38100700002)(9326002)(7696005)(122000001)(5660300002)(4326008)(9686003)(107886003)(316002)(52536014)(66476007)(4744005)(8676002)(76116006)(64756008)(8936002)(186003)(71200400001)(6506007)(6916009)(33656002)(55016002)(86362001)(66556008)(26005)(2906002)(38070700005)(66946007)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wjnl9Y1DUpZbqXw/nxkZAEz7y3k+WarodsAQ9A6DlSw+MwBe02SfZCOq6op1?=
 =?us-ascii?Q?WzJiBXSpOvq6Ww14zX8cwpy/IrRdNXChAseKTCgy9sQ1VU6OieXwxGSALWTu?=
 =?us-ascii?Q?oHEbIuDwoqOuU7lCPVhNZlKyh5PHelEoINPuzgwO3/OuPjfWF39W2dLGue8L?=
 =?us-ascii?Q?eQ1s0wN3eNcHuK5MIxIDuc4n4iLedCN1Dy9+92LNpskTIcTTkvQ6e8W9CyGL?=
 =?us-ascii?Q?5ZGvtuvVWghhR4mUqIDM4a5TftSk2NgxjhaSxhkTdznPANSrpwEJET/8WpQZ?=
 =?us-ascii?Q?hZRSxffU3exekwgMbWMTeXqN90lWXF17dldK0b4h/HGTy9dkGC+RxJ7eRxSD?=
 =?us-ascii?Q?7vFoTTQdOj1i5u2MslCJCvSogG7djn9O8F9xdPT/iH3mL4mLTJCCXZUOCxvF?=
 =?us-ascii?Q?R2QOV/BBFA1OmcrQLr724IexxvDN9bSComnFiNanqvaqoYjBhebixlm7WiYi?=
 =?us-ascii?Q?jcavl32S7115HSYR291hCN89l7riEUjPWy25Axn2Yp69djxgCbhKpF8JkAcl?=
 =?us-ascii?Q?hMKF0R/SkTwa4B5xbV3E6vtKLx+FWWjjvc4txQuHLLsB7YO0nu9FuaEgSQaE?=
 =?us-ascii?Q?YEAaRED4+XI9jZ5P3EQ3DHEKB5JKs+5FOvh73TDn/LGYHXo1Fvot5cZhF5cT?=
 =?us-ascii?Q?4uZ57t+e4Whxuc8zwZ7ndls5BjlEfOVviPiGkkrY3H0xsVHBRUeucijFsYBu?=
 =?us-ascii?Q?sqRzdq5eZPx1im3b1sBGgWhHn2nPfGpy3sjfyHhPaw82NxgDMJti00wP0l+1?=
 =?us-ascii?Q?adZDyf5VaCYOhLbj+OuMKt+ceBlZ9F+NeUJb87T/KPN7YbR/CYMiGf5i+K9i?=
 =?us-ascii?Q?UuPp3PhV5QMmyc5+9Kznee8s+Har6DPu4qRrOhmhXPqxbF371rMS3CBx+pvi?=
 =?us-ascii?Q?dfEysM3DiyN9gy21p016Ga/gjL0HQx4rotVPNAYNa72BqpScjZCKVh04tf62?=
 =?us-ascii?Q?9fPPTaNdg7JL0a6hLtMo6uTvf4q0xchj5IIdMjl9yVq1L0Li8gP3Oo7J+bAv?=
 =?us-ascii?Q?yXsIJJY9qDE217muB4iRYrO2NcAoAal8mKiK8hYXreCVP+UFB8Oip/4Skad9?=
 =?us-ascii?Q?NDYwU9sTkdwBjc8M3LQdMBxNwGwdsat7Jv8JYRTa5FNlKGoiyJny5Skyj/O9?=
 =?us-ascii?Q?DdAjbT7BcvhHiC+VbGDJxUbPMp+tW2pZRyY8CSfQoqfs5AE7kvxgnVhUgxT7?=
 =?us-ascii?Q?p7qYSuf/LuixvBZ1uo2RWWCb2Q/n8BVcNLhmlT8YuvfAQCIFDVHaZue2cNgs?=
 =?us-ascii?Q?i72q19FWysV+s8lx/sz2bwMWHneNJWjXHFG4P4IRiYaj2gkkWfxb5XzIEnyp?=
 =?us-ascii?Q?HP/lV+uvPUKiQDPElTEoq4HTFnqfPgjUen0BPlxSreqvBOp1AlFrloahv6kR?=
 =?us-ascii?Q?Crp+2dyjhmmK0F2Wbf6wdpJqdnN0PY9nTfDg0P1UQ6J26+d/wPMewYNj58va?=
 =?us-ascii?Q?jDNzwxYvK0W4EL26DhSZRehCmkBEFDtq2NmJ0OT0h2UqZdnsurU6Zo1mQT+5?=
 =?us-ascii?Q?ptHuUvYvszG+j2cMlnwA6N8lCg0o9zGyqKyUPTEeF+6tw8d7+Yu/uPCEqGYk?=
 =?us-ascii?Q?lAE4HYImUNBrxvlbWTvYDmwiVOuNdIy4qdDft4W2AvV9o5OLz/90uOWnxL6J?=
 =?us-ascii?Q?Iw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM6PR12MB2698E2747B26D841B480829BCF9F9DM6PR12MB2698namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2698.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5beeb9b2-014a-4aab-af86-08d9ada0c66b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 10:13:48.3755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XJtg2hqH49lkarRhVkDYFk3NSZjv32KXG8cGEkGJ/VYOnxIgqokZIz/3JYM+IhHRx7pk0Qtk4wQGnG9TjsdWsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1818
Received-SPF: softfail client-ip=40.107.237.47;
 envelope-from=ealkobi@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mCQBfy4UOjIK

--_000_DM6PR12MB2698E2747B26D841B480829BCF9F9DM6PR12MB2698namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I am running the next configuration:

Host:
OS:Fedora 34
Qemu vesion: 5.2.0-8.fc34
libvirt version: 7.0.0
architecture:x86_64
kernel version: 5.11.12-300.fc34.x86_64

VM:
OS: Ubuntu 20.04 LTS
architecture:aarch64
kernel version : 5.4.0-26-generic
cpu cores:4
cpu model :cortex-a57
Ram: 4Gb



The performance of this configuration is very slow (In compared to a VM wit=
h x86 architecture).
I would be happy to know if there are any settings that can be made to impr=
ove the performance of this configuration.


Thanks, Emanuel

--_000_DM6PR12MB2698E2747B26D841B480829BCF9F9DM6PR12MB2698namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am running the next configuration:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><u>Host:<o:p></o:p></u></b></p>
<p class=3D"MsoNormal">OS:Fedora 34<o:p></o:p></p>
<p class=3D"MsoNormal">Qemu vesion: 5.2.0-8.fc34<o:p></o:p></p>
<p class=3D"MsoNormal">libvirt version: 7.0.0<o:p></o:p></p>
<p class=3D"MsoNormal">architecture:x86_64<o:p></o:p></p>
<p class=3D"MsoNormal">kernel version: 5.11.12-300.fc34.x86_64<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><u>VM:<o:p></o:p></u></b></p>
<p class=3D"MsoNormal">OS: Ubuntu 20.04 LTS<o:p></o:p></p>
<p class=3D"MsoNormal">architecture:aarch64<o:p></o:p></p>
<p class=3D"MsoNormal">kernel version : 5.4.0-26-generic<o:p></o:p></p>
<p class=3D"MsoNormal">cpu cores:4<o:p></o:p></p>
<p class=3D"MsoNormal">cpu model :cortex-a57<o:p></o:p></p>
<p class=3D"MsoNormal">Ram: 4Gb<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><u><o:p><span style=3D"text-decoration:none">&nbsp;<=
/span></o:p></u></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The performance of this configuration is very slow (=
In compared to a VM with x86 architecture).<o:p></o:p></p>
<p class=3D"MsoNormal">I would be happy to know if there are any settings t=
hat can be made to improve the performance of this configuration.<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks, Emanuel<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM6PR12MB2698E2747B26D841B480829BCF9F9DM6PR12MB2698namp_--
