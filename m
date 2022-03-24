Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp3525829lfb;
        Thu, 24 Mar 2022 13:17:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypIfwL0RO/8BlKkae2x05pDBx7PphucQ9Ltmy7506ahhI8bvXSvgMM7PqxDPDvkX1BU9FF
X-Received: by 2002:a17:907:2d06:b0:6e0:2ec:c7bd with SMTP id gs6-20020a1709072d0600b006e002ecc7bdmr8101868ejc.656.1648153069635;
        Thu, 24 Mar 2022 13:17:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1648153069; cv=pass;
        d=google.com; s=arc-20160816;
        b=J+UQ3fQqPvQ26zCyL5snUa9DTXwpJCm105iZDomXh/RSgZNHuXTYAfqGrYmVfLAtGb
         d4ROGBiWouV0CbXObM6OXyyekrHPnpy7h1fdIioILSuRiUGfd1H9GH1qeTGDwWAAXQsB
         XHRBRRAxT5MRXp47jRPPc4L2rOoM8EEdIrmaRCNV9g5Y3xJDfwgu0SkvNBYRiAjoy+8I
         wSHoMEjHHDlAMEZeD4uniUpvTQXHb9CLKIbQ9vrVClhZ3Pvm5qQbr3Q2SS7KogbFEsXu
         u8t8P370cVvW2DHOdBXvj8K3uNR3XN1DRQabZvix2zUTVW6MSvxKxpgMmmOWXSnGRqeQ
         QR5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-disposition:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=lWe6esMvTDxcpELgUOaYb8647pSWKmvWH7iWh5IKyJc=;
        b=s9stjaKr+Zred6qxRvf+1QZcTIxCYaSp3Vu5IUYVwpvrPso1XB88j/PFvrozVDn/sz
         M6gCCDUuD/q3sEYeltTaX2+PVYTstaux7G7nQRGflstkkzbYakT+euCRBvFA2RBXp135
         cGrUPSmxcipRiigbAfx0V3cpe5JaReuLCftRMk8mTyumQx26DZvmhcsnZVquqXjwMeqe
         HndOjIlITVxHsQX4K6+BSTLo6DFg7KB90xTBxZIbGr09zKs9BJuGStgcuZCh658ltb8f
         YwCUW9iF07FQ4pq4fpu26sTW7ZZ5C+TyJOvIsSU14BBcUP4QNDUj2eAyNn7uWUEF3Rye
         UFNA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=qSq10Vuu;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8a::700 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20700.outbound.protection.outlook.com. [2a01:111:f400:7e8a::700])
        by mx.google.com with ESMTPS id y11-20020a056402440b00b00418c2b5beb6si923915eda.408.2022.03.24.13.17.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Mar 2022 13:17:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8a::700 as permitted sender) client-ip=2a01:111:f400:7e8a::700;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=qSq10Vuu;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8a::700 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HW+pvxoJBHy6h0Jv9PWe49POCrxjuJtB+ShDpdbnWUEeDY9JwtkviCh88rmapE2DLuEpnT/8DPqQZ549gpQR32udgz2E6OvoKHMce2nAKT2FpPUhvrkBGwYvJtgQ2LiRT+AUEN0feVdNtQqjZtQbvhBHBXTwUah5auJh8Giw6K3Y7YTKgcHkOilFNc4p+5s6nhEnXSXHVrN0c6eujfSXFGGnlGH59etgSQOkgC9dsH1XXrLE6tpwoc579CDpb1Qc+jnITcwhFuJFuXgkcH8JFRPO+6EJePNZNfC9wWLJKkk/y6zqqHAIbGzyjiFi4w17SUnpL3kINOu+/kW4pdL7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWe6esMvTDxcpELgUOaYb8647pSWKmvWH7iWh5IKyJc=;
 b=M7P1IgOVA05aikVQ49lSpDNHjful7y7ExHHyMBHD7//9xOapNl4dxv/spu7ATWuRP1pBr9/4AgKvItEv0Pce4VcDHmADWqXvKPg7mO8aKMx/ekFVGOvpxCUzEZs1nf2uYJivOVHCcg8nyECpACFjWp7KV+uLtfzxAUveVp31J1BmUIqkeSiKGaNe/P4KIYfdSAn2TiKNKMl8NbwQPMwFArsPWvZyuxV24OA0meM5RDtsu4hhdAlcD6Nn8+4wPo9BzzHc4ugq2WGX0+x2IsSekUIQFgsRQW59bVKWyis+xE1RX3wkbbLaN77F9pfB7ND2ZKOWBsmdS6hn+I6CmtBLiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWe6esMvTDxcpELgUOaYb8647pSWKmvWH7iWh5IKyJc=;
 b=qSq10VuukfmMaphbLqr9YAywSIfCoW/rt/hNVoqcvzJkZvtprN7lPEtKouM/74WqaLPfJVP5qnUHQ7uR1tV5u5/6XJeY5Az3L6A7uGvmCBOM/nT9VibIXGaBOelFWCWILgErV64tdnalrOyNFDaiNEELT1XueySLMT0YkQIjIdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 DM6PR01MB5545.prod.exchangelabs.com (2603:10b6:5:17c::23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.16; Thu, 24 Mar 2022 20:17:46 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::fc95:d5f4:a26a:423d]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::fc95:d5f4:a26a:423d%8]) with mapi id 15.20.5102.017; Thu, 24 Mar 2022
 20:17:46 +0000
Date: Thu, 24 Mar 2022 16:17:33 -0400
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	richard.henderson@linaro.org, robhenry@microsoft.com
Subject: Plugins Not Reporting AArch64 SVE Memory Operations
Message-ID: <YjzR3erB5ZhkAI2A@strawberry.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: CH0PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:610:e7::19) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
Return-Path: aaron@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05dbf9cb-5718-4da1-d253-08da0dd35c6f
X-MS-TrafficTypeDiagnostic: DM6PR01MB5545:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR01MB5545D0C7594BD067FBA0FACC8A199@DM6PR01MB5545.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rHTUNI14ePcdQ2bVOq6/8W5+RO9YkWSjJPHk5suw9oc6RCwy+2/4eKzIJJm5TemCKnjObo+xfFhsGsJO1FfJhqE6zltHHSR7j8xJUiTZ5nRRjhsnxTVh+k4QYNc4+LMCnqNgsGKsXF1yXNp845eV4wpKv9uZnrZpZvJnuKVEDvkJ/EJjyFvzuicA/cnnswR4YOTWWckjmkeeym7hVYuaGQ/ABwACHnfl37p6AWCYvtRlZJ4mrwJVLDplJpkkR61LiueBy0lt5hS048u71ZKBvCNdzOjjkUali8iYEFmFWome8X+hp50040ZSF66QilpZs89I6ZtoNbbufY90lFeHUl4/pxdbe6y4JKY/yD1fLYoF2yJzDk0vHpm8MThMswJ+keN0zNOQy11ItIUIEcDxmidaffYUeYlbVq0moxFC228KBYnDtJoJDH4n850K7mOMEGzlKHKamH/DIkwAOtTxvdc9n60cuXUUI7fclDeWSESNIapA2DkYkATBBOTYRUK4TlYda3Veq2ZnfC6C2KlGIGGC3O+WJL7ZUOndF18FlXQdfMVgEArHg9CsWfgDOUz10vHRcBywbpxmce2kCuu5TDhqLKHpGcbEwcRDUcN11HaoYs38hJ8MziaAyek9pS3xWIOL+xv5RnUrJ6ZEvNx1MlS1HLwXGJOUsdnW9rT+M+xoA2cw8+uld28hGm5K9y1cN980rRQEJxzE44CIpS9vGmEIN3kgAmvzVPCa5xzdeew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(2906002)(9686003)(5660300002)(186003)(6512007)(8936002)(66556008)(6666004)(38100700002)(966005)(316002)(86362001)(6486002)(508600001)(8676002)(6506007)(4326008)(66476007)(83380400001)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zpQ5dawV5JP1T+VhHGu7Qva685sBvmTizRIH03LA4J1ZabGpgovtO3XF66uM?=
 =?us-ascii?Q?lsYzr/K2wZLSJuTpT7tPbjHbjb1nbelwFMl46o9fW8rPWH7xkrDrLgi8GAbC?=
 =?us-ascii?Q?8c6i1Oxx7c5piDwA5pYDiJblmSuL+1fwgyTBvUWieG4pbhhbaFlGJZznyWkY?=
 =?us-ascii?Q?TQ1DoOI+p5L562nYNPYV7Xxc3fIyNWnb5iZwDU1f9Bvk7Xa2mEJqN2IaPnPI?=
 =?us-ascii?Q?54joqDO7fyJrizk+rpBMTdKsXbI2i9PFxTWJbd+EGjoaF/6K6pu7O7nvHCgF?=
 =?us-ascii?Q?6q3Xf2zaYjGkRGi9lyiwg3dMAR95dBBm86qNtNnbdl9Zg0hIk91axG8xMWPn?=
 =?us-ascii?Q?zLMZbUtHbkkCjxogTtxRiX1LyJSy1NfjrzioiJb/XNtOU+g4DY3X4lih0+WH?=
 =?us-ascii?Q?mm8G8EfYw61KO+FcGwDQSeeEersA8cnG/nKldwUT17RRQxY3dBB61j8cQgqq?=
 =?us-ascii?Q?MNiXUgaw556vopSoclRXEcOBUDicC2Z/C16Hd3/r57zH83sDh9kvwC9kbYqU?=
 =?us-ascii?Q?oAK/fK4qqMefayd6u68OrHpVHRvZBBJGdRV1J3/Kw+l+8vPRZCPsOhnFxDHM?=
 =?us-ascii?Q?f++50W2M/1fF8xqW7yeIixUVxZtTmZbNYAXPzLxEp6tpWprUCOeeeEmTxT1J?=
 =?us-ascii?Q?17SDrmKeXTqdanv2schXEOvFMo1zadtyXXOiAwvOYn3pDvxdxi8rfc5WWIZh?=
 =?us-ascii?Q?LkouBAycndyQ9TAcPl7YLQyzXg1Lt0kn+PLCZe4ECF4RFSXFi7lC7oFPgxuF?=
 =?us-ascii?Q?gncVANE0TehKZ5+5L9N3xiG5lwd829A7ymWVqrGoMbxpTS1jqiFDFoZ87oJ7?=
 =?us-ascii?Q?rxtMaObK9LectAD3jgiDskRZMlPrqdeUT0lkB5FtMVKrNd/Qg9e/1TNU6TKF?=
 =?us-ascii?Q?mok8D+B49RjaqMK331zFOI7PGymzevWdDJl9y9nEh3BWTlSmnpnNL4lXrDyi?=
 =?us-ascii?Q?GakMzyR0PQV4Z+ifZaRwjQ1fJ2LDWbRYLMe++PZCJCZ4IXnab2Zhzt67pl42?=
 =?us-ascii?Q?iBwDIvpISxY4bJIrcW9lJVzREjIbTW67fKSc/HP8DaN0WjluLcI/fSmwi1lN?=
 =?us-ascii?Q?WtSxYZaxVmBFxYqS+sRezR7+rXknHaUr72HFxBj9+b0Ky3HUNMOgndHN3n5c?=
 =?us-ascii?Q?wU73gW27Km57gmC3//dTkMailP3N2WOx487w9Zngho6IAu56tNZydju3GP+T?=
 =?us-ascii?Q?1vtRYE0+f6bTv4I07vj/8Scw3WDvm9GjUtk2DM3E4IGI/YTWh7vpMGNxmJA+?=
 =?us-ascii?Q?oOJgRy4BQg5rHGo6/zBjtvBN7SHnC2VKMgpmIx3ymUQxpBS3fPYT9wDNc/gY?=
 =?us-ascii?Q?IYPYQ/r0oEyOWLybQfnjvaGSiyDt46MV8L0mjqLuIoT2i4uV6GaEzYtMC1t8?=
 =?us-ascii?Q?KwXd3N25gzqKHdmXWVMhGYhfvVaWEllztRl8HhiLJILsGEs3b7j8j25gNCUK?=
 =?us-ascii?Q?d0U7EHXbpKGSYYlLYaEPK8y3wiufw9sJ9hmzGB7FGmOltCrTLLBXKu7NhUbG?=
 =?us-ascii?Q?DfL/DjuqMyQBWV4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05dbf9cb-5718-4da1-d253-08da0dd35c6f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 20:17:46.8313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SfaF6AIkvOu0dsvWFLbmWhJFJn0gv6PJN/mnwfsbvFsLhzYRA0ywaI3nHOt69xm0TKjNwfcejpAdQRq8EeOa/lf7eLaCUlG8OuX6TEMY79NHZ1A7FykfT6Nz8eJb7o59
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5545
X-TUID: WX+URnDoFHif

Hi folks,

I see there has been some previous discussion [1] about 1.5 years ago
around the fact that AArch64 SVE instructions do not emit any memory
operations via the plugin interface, as one might expect them to.

I am interested in being able to more accurately trace the memory
operations of SVE instructions using the plugin interface - has there
been any further discussion or work on this topic off-list (or that
escaped my searching)?

In the previous discussion [1], Richard raised some interesting
questions:

> The plugin interface needs extension for this.  How should I signal that 256
> consecutive byte loads have occurred?  How should I signal that the controlling
> predicate was not all true, so only 250 of those 256 were actually active?  How
> should I signal 59 non-consecutive (gather) loads have occurred?
> 
> If the answer is simply that you want 256 or 250 or 59 plugin callbacks
> respectively, then we might be able to force the memory operations into the
> slow path, and hook the operation there.  As if it were an i/o operation.

My initial reaction is that simply sending individual callbacks for each
access (only the ones which were active, in the case of predication)
seems to fit reasonably well with the existing plugin interface. For
instance, I think we already receive two callbacks for each AArch64
`LDP` instruction, right?

If this is an agreeable solution that wouldn't take too much effort to
implement (and no one else is doing it), would someone mind pointing me
in the right direction to get started?

Thanks!

-Aaron

[1] https://lists.nongnu.org/archive/html/qemu-discuss/2020-12/msg00015.html
