Received: by 2002:a17:505:4e90:b0:1be9:327d:8ee3 with SMTP id y16csp277139njx;
        Tue, 20 Aug 2024 04:31:04 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUE6SG3tRwevM4v3APgw+E7pgrSKGiw+jVyPIj2rP+TUK5Iw+l4pA1roxrira731dKae96sO/+uPmPPog==@linaro.org
X-Google-Smtp-Source: AGHT+IHxXQnsJ8FTS62/2XSDbFbrMhwuABwcYyhCWSxOs1N/cqTUAjlbB+gvPqZDNJJHnjAhBSls
X-Received: by 2002:a05:6830:6d0c:b0:708:b46d:5c76 with SMTP id 46e09a7af769-70cac8619a0mr18142429a34.17.1724153463735;
        Tue, 20 Aug 2024 04:31:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1724153463; cv=pass;
        d=google.com; s=arc-20160816;
        b=XgemvamBP5LVhVF2+ny6CZ62rrEQU1BOUX5Xn71ocAy6byi4VevxpBpfO9W3yYUW8t
         jGqj9R1BmH3HRwQl95BrUiyy3yhcXqcc5XnYZJXHhpnu8byTtj+t461Oa6BtXt/8O9fy
         EKgmvVJlF/oe5uvzuz0Ez8mjK4HXQaecCfnrW/TxzPF1JF5m06TWH/xhI6vFW6zkK1rT
         kTafvoQL78KY3yJ+uXCpssD3VK9I0xsfOLvuqnkS4z30V8lLoeSLm8qWw+5C5QViPGi/
         MlqiGiE8my+yvDZ/JzDBbYYmOtZpCtIqv3B+PjhSsZUPPegnglPDJKZw4oc08pMsnprm
         KWtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:in-reply-to
         :content-disposition:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=4wx99bmApIioS3ef+SOqJzjdfZ3CmrM+miK6/pMPY60=;
        fh=gp2NDWKIUWE+NtKNYLk9Cxd8ztdgAvTwvkhUrnS6iHY=;
        b=YnGHMkH/TyCuKT3hIg+awjy/XGFqO7Eu7duhKIAlkpTqjse4NfuxjMwnCwhYK6tSoc
         y96/TzgDc51X5k4Bw1Nhngrkot3FFUcrzm1MkAMot1wfwlBEWyR29Ls0Dj09APeMZmVk
         b2aTWFdHwZcofw5PeETGzNGwWTiXP0IkVZa+McsL0AfcSxlq0whU4K8x922f55d60hP/
         8llEDm30BA4qTy5Dt/P5r4rxzQ8dOKBvskCa3ZxIjM1UqgSgyNDKXO2c4c+w0jidqbWQ
         wlCkjwLD/rsm57cxdofRgOQoYXgvV8gLfNHWt6h7r2yt1j/tjGH4Tl9aHpQt0k+p519Z
         hoQw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@provenrun.com header.s=selector1 header.b=Wmf9lglx;
       arc=pass (i=1 spf=pass spfdomain=provenrun.com dkim=pass dkdomain=provenrun.com dmarc=pass fromdomain=provenrun.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=provenrun.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bf6fec443esi125366076d6.220.2024.08.20.04.31.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2024 04:31:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@provenrun.com header.s=selector1 header.b=Wmf9lglx;
       arc=pass (i=1 spf=pass spfdomain=provenrun.com dkim=pass dkdomain=provenrun.com dmarc=pass fromdomain=provenrun.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=provenrun.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sgN4c-0005m6-N6; Tue, 20 Aug 2024 07:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <florian.lugou@provenrun.com>)
 id 1sgN4b-0005eu-1c; Tue, 20 Aug 2024 07:30:49 -0400
Received: from mail-francesouthazlp170100000.outbound.protection.outlook.com
 ([2a01:111:f403:c207::] helo=MRZP264CU002.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <florian.lugou@provenrun.com>)
 id 1sgN4X-0005qa-Qz; Tue, 20 Aug 2024 07:30:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjPyZK5tYwXdG/vd4QCJ2id19cEVzbZl+JIzY5FIf+e4DQXYP9mBR9IU08sCLvLNFIe0/pZmOuFQRzeq8wkkVf09DjDGJIzF/udBcuYHA0u6rq2gVo5ozDf9/xzf16scDXbfXNJFGJw1t/es254JMWly5EmaF3HqLESFCcx18VZbSzKE4E23VgOUSbL7gdAoZ0JrRJ/53aEUJyBYRcF2FWfRuHg83d4q3dgFltdyt9lZmRR1/8D4R85mkf5FAz9iIxoRE2gbq2ZyqoNhjRAEk9Mp9W5ip73iHj2JF1+I5G6vQcDrMyefLxglf4uL8njZWjtTAsCEZNRrGXRGjAJsEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wx99bmApIioS3ef+SOqJzjdfZ3CmrM+miK6/pMPY60=;
 b=HTraw2YP88rKqwuh1nswn22NpGVo8gp5dtVo2hAvSayXoRBV7kRdhdy2ji6s+MwOpRdB/zbP5aRSZ4J0mPSlA8dwL9n7AVZDJd3kshHLfN5SFvGQJpBkzh5xWeYHB5w/FTzg7BlqEW9VJlsHIR8FnQJP0h9PyNV76IHl0VB23S8BU3jiUOg9Ky4tVptzTpuys23PXG+bh/MNnf9PzUI5gE79AZeadQTzRDxaWNUlW79v+mC0a2BzL2Iyw2Pf8NEB4PJAYX6K2q63PLpst6rWgBm9+WUmwZFXnUGxw6Jz1OiWqNuLUQcYbGxv2UgxQ+NazS3P4sZ8qv1QAV44wWJXZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=provenrun.com; dmarc=pass action=none
 header.from=provenrun.com; dkim=pass header.d=provenrun.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=provenrun.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wx99bmApIioS3ef+SOqJzjdfZ3CmrM+miK6/pMPY60=;
 b=Wmf9lglxgKmOJDf0VG8vjZdF0LLQAi3Hgzaw3AFliFefLvfpdumalrOLKwAe0MctZNMECTfTkrwA+G+1mLfwWGBe2RRVJiCwsu/Hy1p3LJrQpeAyT98NedJyA5dpa+9tRzH1zaH4iu4Do/tfYN94gMssdFcr5Vc4NCwd9HJUazQIVPJdTPmh8ONg2vPuUahALirt8t9ucbHdcE6gDrfFBe3zVELyRobTR7pmEQ7BEZeNw7NhPgrkaiE3CsFkS9dAc7r5FFfHFRhGHTjcttIw3Qrfc4d2JuXU9jbnJ0duj4BtKaPckFi9c1AAtQOYyrII9b6sqNUa5uc61K93Yspf/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=provenrun.com;
Received: from PAZP264MB2990.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f2::18)
 by PASP264MB4919.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Tue, 20 Aug
 2024 11:30:39 +0000
Received: from PAZP264MB2990.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ef1:e8a1:244f:3ca7]) by PAZP264MB2990.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ef1:e8a1:244f:3ca7%5]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 11:30:38 +0000
Date: Tue, 20 Aug 2024 13:30:24 +0200
From: Florian Lugou <florian.lugou@provenrun.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH] target/arm/helper: Fix timer interrupt masking when
 HCR_EL2.E2H == 0
Message-ID: <20240820113024.53tmzejw2omm6bbx@flugou-latitude5401>
References: <20240615185423.49474-1-florian.lugou@provenrun.com>
 <CAFEAcA_+WrzM4fXQMUxMi3L5yiUWMrUGTSZH=NDdYDKUCP+8NQ@mail.gmail.com>
 <20240620135627.qxcrkdx5v7wdurx4@flugou-latitude5401>
 <CAFEAcA-ngrrEUDD7eA_sOLGF+_wRCuQVxTwuCA4pXjRcuJucmA@mail.gmail.com>
 <20240621140725.f4hsasmhrhh4joxm@flugou-latitude5401>
 <CAFEAcA9c9hbpsdyc7+=QEOZGrNY2m-urk6VrWdwCdfk9ipkwpw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oufd45th5meiczuh"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9c9hbpsdyc7+=QEOZGrNY2m-urk6VrWdwCdfk9ipkwpw@mail.gmail.com>
X-ClientProxiedBy: PAZP264CA0234.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:238::18) To PAZP264MB2990.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f2::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAZP264MB2990:EE_|PASP264MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f026687-eac9-4cd2-ead1-08dcc10b8420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V/hwybigjVRPy3qX+QFrkDE1afh3AhLIscVUg9pNxcLnNhqqW/q9sBKQtSJv?=
 =?us-ascii?Q?u4MumFdFw5Y1TI25fN6m9F4l+EirVOfhOY3WjafYfiZSi67fDV7li/RO4YzL?=
 =?us-ascii?Q?yGjbdj9t/QY6utT85wL8ZgGAQbKtOemyqIQRmuJAC6qmngLkJ6wb51zg6xdi?=
 =?us-ascii?Q?NacMOsjIZEqXKRqQAnhbGoa3b0bIU6Xh6kAFWrt4qyjqvnT8tdoBTlRBXtnx?=
 =?us-ascii?Q?5Q3GEVMyUwaD8bslCjBQR1Bv8bHnAAHi1BxY+Y0lp20AD6DLInAFFulY2zMs?=
 =?us-ascii?Q?O/DTUjxr6hYXylNB9RxEb4GHVtnvsxMoyeSxG2Tr/vIVcTWHV1gcw6XelmCb?=
 =?us-ascii?Q?vqUDg7FuknkzwtTbZdGOuNKjIzIuzGFVu34EkKqbqAAB0Z3/4j6ZSpVQzcHh?=
 =?us-ascii?Q?galonKagFvybXw/4daozirt7DB1eUPaaCMb+85pCtG9Z6IihDO1CoqCHJYx8?=
 =?us-ascii?Q?NRlcIUzRSYUBV0fGmRoMCCLzd0dVQQenslH1jADRpG8RWu0gvSC7awnvaR7y?=
 =?us-ascii?Q?DneqmxACfsW/wgWeJ+p4Z5EKncFnGfQVylgtx6N91gaIZTZEEhnF9QAv1Y8V?=
 =?us-ascii?Q?5Oi/BDcJAjn0t86JTS7xVGfyIdZLiHbWL0+RhLNALsCEtNfhIR3Xv8fLkWvd?=
 =?us-ascii?Q?VG1HbOdzpRzfasLT82ZhG66TLe1EB31wJZkZrYjvbjhsqge1R9ilYa+axab7?=
 =?us-ascii?Q?/UfQtLjbQav2OVo72eDpVQUwTbPjPPC4vBFlNdjQY6dUBqUzuyOfJsKkFIAM?=
 =?us-ascii?Q?QtbE3Fgx8bMNRwHWV1UCb1v98uhZlCACA3vLQnAyU6dmR4YWwMxEwUUPUoa1?=
 =?us-ascii?Q?O0NEHjYL+dWhW10EVOhbX6um7DJygijxljzhcB5zMAKvn5FlwWSa8j5ZQAf4?=
 =?us-ascii?Q?1MFOvK4+rUuM6CSThQl9kaqFAnGuj7Mb80gR8XUbmcPPsEoIxUwjQF+DDwZK?=
 =?us-ascii?Q?EcAcwa6kxt8YFVFKoYS83Paw3szkOMRNS8vJkJJH9IYfOXtHM7ZIIJI8+Drd?=
 =?us-ascii?Q?dbp2RyD/xksFfQ3eiro83HaKBqe0nhb3rLcCE59bZ6J/u+NE26c88UP10M7x?=
 =?us-ascii?Q?3RKas9GfdNSxUNWGMl/lQ/CqSgv3XAIR6IsF7zykzV0yuNpxRRiIJR8wacLD?=
 =?us-ascii?Q?J3jYdZgFO4YlQqMlRY3id4QRLT2NhZrUo53XYAIpC0TvodUve0wrWLRgoEf9?=
 =?us-ascii?Q?jaBXJVb4JhPz25Ylj/6Ud5xFHk/NnJuYQ3xzCfNoN21Zb0H+5PQcSpe/GkZb?=
 =?us-ascii?Q?VhJfOdKKpQ/q5VtRw2TZ1jw6MmtFnAJEGaWfBz2EovyVWj/1qpZK3HJT7/px?=
 =?us-ascii?Q?88M1l1P92O784gewGYYgX9KLP0N3UEPL392X82ZhnakERg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB2990.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BztGkUxWIfWsSeJ+8gz2ds2lSVRwZUx5sC2TN6qAfvouRqVBwW+lBdiZUXPL?=
 =?us-ascii?Q?ZWyGHWQ5aMYIFCFdCmnfYeMa6qUC4Ivwi6en6iGT7BxkQ4SNFodhX3j2sS9g?=
 =?us-ascii?Q?nQQ05pZIQDW4srMOVhokmxjxMQ69AzWlskjhqNMfMHFvmHYsLCdYJWZGbjOB?=
 =?us-ascii?Q?uMtuF73BvMUKLTtuf80DugCR761FUUfhtnBX+i/iWQzkkAukqa7zTEzYG1Of?=
 =?us-ascii?Q?bb6b+oA2eKDidsPsfQgA0pK2pehAd1Q8v6oNCAzN1SrZnvrBI60BdQwwuRxf?=
 =?us-ascii?Q?BVQG8ZdLBSA/QL0vkF+1Y/GLEbRQXe8E2i7jPSLqbFY6CrROuJHThbpEKLV8?=
 =?us-ascii?Q?ZOjekyG8iL1w/HjK8y8mx2gc1anxHZz20TGi7DQvL9cCC02hQwDTB7612/Q4?=
 =?us-ascii?Q?0FelHNnVay7DRXipWVs2GRblsBCgtNRLcSTaD9OIIrBCwM4sprX7ibh4SONX?=
 =?us-ascii?Q?6EukFW2QPGdQve8TZ6udFFhE3KaDWR5fIjJOLveHMKlIjoSYzoXfaW93kVz7?=
 =?us-ascii?Q?aLru97jPjCnvo9B4HwgdceFl99FsDQdPSodx4Bhqq23IoWowho+CQnkp1BeV?=
 =?us-ascii?Q?nC0C6JFYGcI2/yyexHLm4aYJzVfiDcuqaaOBCpAM/gtLpv9GziRw/QO0dL1W?=
 =?us-ascii?Q?YKNrIcYKN3j3Y01URqDecttbfvGgXTaXaAGSZvL3VcAMxicEKev2FcveT9Sy?=
 =?us-ascii?Q?zGW8n0StGA/B/jPwk3xTmFiQiLe6St+c+ngEixvVdbSg9Jw4IeqrvJx3TYek?=
 =?us-ascii?Q?2tSiSSOUFNpf4UG+ZM6hDaa6A1vVyFLjPNf5IMW/+gsBYmxf2g0lV+qEjfLm?=
 =?us-ascii?Q?/gyu1AOGbeJcNgjk1dXDHWhuPanftwfO8liBOtR2ANqlTfy/s6FCpkZrVUHJ?=
 =?us-ascii?Q?vvnDGJh+cTWxSTfMuJAY0av40ZFxtt22Wzzhv91L0tSVEqPn7sMFr/qlg7c9?=
 =?us-ascii?Q?9qhjgyLDw/pzDAIT3M+1edFycOYoHVD82h9tIcxL4q8bIOCAEsrLXTRMiu8i?=
 =?us-ascii?Q?Xm0NuHGKKA1tYBk6t4GZ/cTA4SYoIbUjL1s2dJT+cLrUuEASwmgbuTl2/wNz?=
 =?us-ascii?Q?RT2eeYWG72W7NwMdd+0hjXa8dx1LufPtui76goETsiEeVQgdUqD2ldAs/m1j?=
 =?us-ascii?Q?D7/JmTlIxA23b59JF9MC+xpdLyp1tDvbEuU7nrCGfR+LzxHOuVC1NqfYJSlY?=
 =?us-ascii?Q?vTBo5V0dKVqIimQxuAfiKJOf7ePWyfu47t+BVquyvragP3QShsiGtXT9+g9w?=
 =?us-ascii?Q?mgLW9Gjqq2TyWwdhPdQbFgVxyrHy4/34dNFfhg39J3h0JOU8ouN5ioy7b+g4?=
 =?us-ascii?Q?Iey3n2+x3YsqmWE+4/EtPlOw36+VjdCO13Fp4JTlsHk0p2EHWNke/O3Kyw/1?=
 =?us-ascii?Q?hqskMiZXbpDAxsjb1SQ78iJlI5iUof0GtLZ9vQ/dDIOjE+c7SJMkYM3qs7tO?=
 =?us-ascii?Q?aX8pn8G6rkB4M8KYc96wHXL7UsUypP5x+Ngs9qPUVSOwL7rhD/OP9t5BjfWY?=
 =?us-ascii?Q?ZediwuuL44tMRSAoJXLJSyjqhrj0f9eQSmjQ2XwDc9GweDtRUOTFD5tAwmx3?=
 =?us-ascii?Q?5Esq+m7ZhlEZQeHxarf8oOJrVA8fPjx57V2Zqct9uG9+m3A78uKo01+nL1vd?=
 =?us-ascii?Q?lDS9afSgp6c4URq6MRcswDbwgCg0eN3/zwBKtPlNgNPMu59cPyLnFA7m7SmR?=
 =?us-ascii?Q?4zqi1w=3D=3D?=
X-OriginatorOrg: provenrun.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f026687-eac9-4cd2-ead1-08dcc10b8420
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB2990.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 11:30:38.7209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff654c30-3eb4-4445-b89f-a54a92b1f03d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhWhikbGrkPo3+wLr57xDKtSqvwpJr4AsFWfTgd2G2dRmST3QLFIC6wIm70zcxnfc9sfhHBeIqQUJjOcYhs5mkzrsn1I/EIGfndytN+LRXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB4919
Received-SPF: pass client-ip=2a01:111:f403:c207::;
 envelope-from=florian.lugou@provenrun.com;
 helo=MRZP264CU002.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: yosgn99MQlTY

--oufd45th5meiczuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > $ aarch64-none-elf-gcc -ffreestanding -nostdlib -T qemu/tests/tcg/aarch=
64/system/kernel.ld -o test test.S
> >
> > $ qemu-system-aarch64 \
> >         -machine virt,secure=3Don,gic-version=3D3 \
> >         -cpu cortex-a57 \
> >         -kernel test \
> >         -display none \
> >         -semihosting
> >
> > $ # Exits after ~1s
> >
> > $ qemu-system-aarch64 \
> >         -machine virt,secure=3Don,gic-version=3D3 \
> >         -cpu cortex-a57 \
> >         -kernel test \
> >         -display none \
> >         -semihosting \
> >         -icount shift=3D0,sleep=3Doff
> >
> > ... (hangs until QEMU is killed)
>=20
> For me, with QEMU commit 9eb51530c12ae645b, this test case
> exits (doesn't hang) with both these command lines. Do you
> still see this bug? I guess it's possible we fixed it in
> the last month or so, though I can't see anything obviously
> relevant in the git logs.

Thank you for taking the time to test it.

On my machine (Ubuntu 22.04), with QEMU configuration options
"--target-list=3Daarch64-softmmu --enable-debug", running the provided test=
 case
with "-icount shift=3D0,sleep=3Doff" still makes QEMU hang forever on commit
9eb51530c12ae645b.

The issue was initially reported by a colleague of mine so I was hoping it =
would
be somehow reliably reproducible. But apparently it is not.

I will try to find some time to investigate a bit more.

Thank you,

--=20
Florian

--oufd45th5meiczuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEi2flTDU77YujoiPS7SlcI6rHG90FAmbEflAACgkQ7SlcI6rH
G92hawf/SFQq58n20DszwH/wl+jJRHNGICzaoToHNAjl8eB8ylU2p7S9+Y7Bfq+O
ilI6inVk/Qjez0cXNrJKkPhYmoG9l8BFEmvSZusQKVB1Gbv22ijfRGFZcmv+M8Nx
IB66nBFDOpA3VhehbYXKuCwGoCWzz9YNJuJnO0d56RiMCYjbH09zvGGC9rAL6/ZY
OJVW5ytDOb67zGfFLx7/fhJbHc2CTwf31WItOvdTR7A04xU4tyYegBtvMLYdrIeo
jK3wo70WmL7tFHYd/78Z7U9jDRSq3ObFITnr/yZIhPwQ7rnzQJXWL6NGw4qp5W3L
a5lXnSb9m1fQePfpR20xDh9cDo9cmg==
=Sxew
-----END PGP SIGNATURE-----

--oufd45th5meiczuh--
