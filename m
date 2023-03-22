Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5720137ejb;
        Wed, 22 Mar 2023 13:33:27 -0700 (PDT)
X-Google-Smtp-Source: AK7set+/07m0KauzB6avyYmfN/lygsATQ0e4bjPWhMnCF/Dr3aS28j8wQLn7tn2H0Rpa+L6kpmKb
X-Received: by 2002:a17:906:3a94:b0:931:d8db:8a2f with SMTP id y20-20020a1709063a9400b00931d8db8a2fmr8561785ejd.58.1679517207667;
        Wed, 22 Mar 2023 13:33:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1679517207; cv=pass;
        d=google.com; s=arc-20160816;
        b=JhMY3PWUaPburIvmxDJfwyMl6V0cVK3Tpe+DUZeNE3XYf/3nw4tSktACvgTFCByDaU
         t+8DAUfERF0s/6XnlD4MpMnDH7FK5wiRBVRGVn5oXmz/XfcJbRbxGCwtVSUBXjre5Zcm
         Uo2P+9Xd+iKDJJmEFPyFkKBQoLmssfIxQvRN5KDpVJkTqNIEXMG1rNAAmfcYSUNDY+R2
         7PC9Q50+ihmgvAE2pDVLg19kPucIdksCc40s7Bo2CHhvrOh1R/ECrZqQ25+qeSlmH2wU
         /EGdR3EDbCsu1ZO+RldU/ls/akF4pOswbOEbhuQkrm4F1yeCrVQLCpC3bgyd/GQpUZ4n
         RJug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:in-reply-to:content-disposition:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=GWVX/X2Pnv3Mby6dKBNDDSP7kWiPb9m+tpxmGj4z7lo=;
        b=GQViyb8n7Wd6B+QVimKvTkQCo/1L2spPJziEaCTwf+hKQeWpUsvdg1Rtbt2jniQNKE
         p/L2yjW+TF6G4clWWxgWVhuoYJZMjuaMille8Krm2OJRXdlHJeKRShlEaFYyktYNgqHC
         Sj79E4pl50qMUoZ5RTPymX65vOw+MZ6TvE7thtJ7m4Xmuu7FSa+YRixnxuGLmylwsMwk
         5sOci+wMGWzny/52Nc2mfMLARZvd9bd0RcnyAQo14paUq9i4KXYco8ikalvs42efkeDO
         8BWOfyJm9FLqozNfdSAJBt0h5dRBaOkaCgX8EgEJ9EYePtjNQk0+LWJDLAwnWklyFBti
         A+rQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=thV80z0N;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e83::71d as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2071d.outbound.protection.outlook.com. [2a01:111:f400:7e83::71d])
        by mx.google.com with ESMTPS id j12-20020a170906278c00b0093017a4c5eesi15050069ejc.903.2023.03.22.13.33.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Mar 2023 13:33:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e83::71d as permitted sender) client-ip=2a01:111:f400:7e83::71d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=thV80z0N;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e83::71d as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODatvEXEHmhzJS4++tH/E8gz9FfPWWpRCy6u0CTEPVEz8HO/Klt1oCA9pKLGD3ujWhadMTJnKAgBFiHcAh378OX9IT6649dhGGr1EY7ScBw85l9mrT1/DEnvczZvS3mtlrPn2fWj+wrPyGmoyrSSWnFla0SJD+BbDX1bxzT1Jxm3o9R1rPSXR9AHhno9n5vrEQFz8ROAGZWGXP3gTAmml9Zwcsd8eaF5qOhIzZwg4zHCU3xWNU2sJhCNwJI7hwqvV9jtpGr8cv+VhcFSt9O6YFW3Zh/klZnz2PMKojIn84ZH/xlX/tgABoxTwNlfv3l2cLBYkboibARZYfM0B3tfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWVX/X2Pnv3Mby6dKBNDDSP7kWiPb9m+tpxmGj4z7lo=;
 b=ciuuthTjCva4R33VGBe5/iTL3/d7OXE6u+4LB4HVs7tAl0yi5mh0VgBSBUIgCKjK6UdhVwbQz5mp0QcM0LSdaQZgO5/1/NkSKUFJqVJAo4owrzCV9PFOoAIivRCu0Jizv4utZwa87mVpv5yOEql2EzOWByup195gjyQJcZNtV1Zh+lGCZ72mObyRUzIYmXGc6CpmzSdMzMWAaLIYE9oUZHOjipZOUa4ISqLTr8pgE8cwgxUAw9C4AUOOl9FfslNG1rh/xrijKTZho4EUg1w7z4wHz9OjkJ7cScMyEj1Zn01Qo8O/OsbfsV55HHAHycwv0PYIgoWnaKOydF5+wOtDdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWVX/X2Pnv3Mby6dKBNDDSP7kWiPb9m+tpxmGj4z7lo=;
 b=thV80z0NQtlTtpHpQwAM6O7AKqSklsXj8j+j87Io1/F38/b5+XqTPULSb6aB8WIz7Bxk43B7H58s5yAe0VyfMhtYc9qKQiqkypOnt+ERGBJ7gvDC65teKAjOxBfTSgi4kfvIBQA3O8aCPqF3xlPcwjGlMWzNtsbSNCxzDwc8Mhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 MN2PR01MB5469.prod.exchangelabs.com (2603:10b6:208:114::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Wed, 22 Mar 2023 20:33:24 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c%8]) with mapi id 15.20.6222.010; Wed, 22 Mar 2023
 20:33:24 +0000
Date: Wed, 22 Mar 2023 16:33:04 -0400
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Vincent Dehors <vincent.dehors@smile.fr>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 6/7] target/arm: Implement v8.3 FPAC and FPACCOMBINE
Message-ID: <ZBtmAEYfI8T8Y/zT@strawberry.localdomain>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-7-aaron@os.amperecomputing.com>
 <989f380e-9d70-a377-9f56-6d42935459c2@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <989f380e-9d70-a377-9f56-6d42935459c2@linaro.org>
X-ClientProxiedBy: CH2PR16CA0026.namprd16.prod.outlook.com
 (2603:10b6:610:50::36) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
Return-Path: aaron@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|MN2PR01MB5469:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ecfb6c4-2a3f-47e7-4d5d-08db2b14af3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7YCC0HA4JpVxuQl5DfybF/P/X53x4um1WO8CJmXPcnhT+xdcewm1kNui77zpzWkMEh2nDEZ/SLy1BhYS59LbGBTGFUNiBLRcgvorwL5WvDZsdDJi/7W7/FLWUS7yko63dJqnwPy6OWV0qdX+79cq5336I+UNEuJaSQYT4xCwNiqAn3/q0fbfeKsLWrNp8lqkTi+1F21Q56rIHoibrtwxWYs/86vXx5Dp5ED/yVRJuO3w7RjX27y67Y9y9lVWxPIERT2iZyFEoLidKs9yZ4q4FQEtDNc3d4emgjf80YKA+KVvq64I0vaxu6RAcgIda2/vtaw1B0j4DIDsQyJBAyI0Rah0kMJ42QaaQQInHGAZRbyBcIwTyUJohw+VEexK792MKR7KPUviVB2wpN/oTtktcZq9Y7qJoWhMI3xkbd5dekGPTAxn0NGzYUE0B7MJa3kWflRwPE/tKyOe0RgOn9MXCEQI6/sL8TAqwq6/ZR7snD+TdmawyNlYNMXo1+izuhaA9EWV7IXWCiiaCh7yYL8LdNegam+S5+vlqojelqlwUGba3QCOPpCMc+PRH+kHjCH2n/wRY3lJiEg24OfPPjO13hDDDnBNpvT1s1uxa0lQgP+hPiwNTyIHGbNbcRd2XDo3OSCbYmzyYUnkmkrV+o/+uQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(346002)(396003)(376002)(39850400004)(451199018)(8936002)(41300700001)(5660300002)(4744005)(86362001)(38100700002)(2906002)(9686003)(186003)(478600001)(6512007)(6666004)(26005)(6506007)(53546011)(66946007)(316002)(66476007)(6916009)(66556008)(6486002)(8676002)(54906003)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AXWua17sSqltFwSMdKNxta3MARSZ3o+u4pLOUg7XNTYGDBi2TI1VFnvsEhn0?=
 =?us-ascii?Q?pKlSl4F5VLDQz3gZrq9sAVCS2k4AKP+zlblzt92TxWOosa3dVFGi9L20Z7zB?=
 =?us-ascii?Q?ak/OE6/NUdLCkCz6O8jok9GWvWMsGYaVnNNHRbBxADjWYupzloi8a8wpDMj7?=
 =?us-ascii?Q?0EMnDuby3Ijd2eJz+fo6axm2eJDUsJexb+NjCN6xYaQSCtxhqHVYToX31nql?=
 =?us-ascii?Q?8lLKKeOZHF96HI7T60CzTVXlyVlFwsQOcRo1sf4xbeh1rXzJgT0DeAiK8Dpy?=
 =?us-ascii?Q?rvN549ULV7XEudpTnDSS47rVSEalPFuXHp3yzIxefIvqv8kiBcuP4zSAfTNz?=
 =?us-ascii?Q?/QXTzAFYrhxiSzsiDp3n99VlXRdmqEUmO7pAesgafXn2khVcQK8gjlu93YYF?=
 =?us-ascii?Q?ueLPnwxFvYH4NlnXaLpOVS+5FJ6wq2WCDEqS+QCa2yY0Cn2mHwsedYgF/aOL?=
 =?us-ascii?Q?DcixGRwYaTw4GrgtRgHBOIb7NqZbcz28RJqku4w+96Bk/uJ6L0o68CqhV/0p?=
 =?us-ascii?Q?GMyDzSje1KNJa0cP7F2h10xwuKfli+7yF85EaLq08GLJvnj1uIwXY2nBEX5r?=
 =?us-ascii?Q?wT+RA+yxKG04qCQZaovDiLyd8JG+XUBBep/NpmadT3jbRy1OXqQUKLoJlp66?=
 =?us-ascii?Q?i3XFLYhcrX/MFr8hhbPPMmCKrAyo2+8vNzJA9GvSZpnm/EqAgZp5Oa1iZX9k?=
 =?us-ascii?Q?qk0YxjVuHXbnO+89SOxJHhNRu2Qr9+ZqtWFYpAyQg1KCWoMhIsAV1m5IWSNz?=
 =?us-ascii?Q?vGlDuhDz6HqjWZhEO9QRlUv0wJIthPCxuHSJEk11xBuuW5+8nPqZXHguIJCQ?=
 =?us-ascii?Q?6g8iJrvWy80fgLuRIs9CZI8TMSllUmOLrxYRf6PqD1duMPCbWluTrNSCTIG3?=
 =?us-ascii?Q?tQZsz3uUublD6ifMcENuLxzmVJzwPtDVJTjZDnRO1c8UldnbxnQBIthDusqD?=
 =?us-ascii?Q?SowLRFsjLkBuBCZDf47Sx2dmE1MXed/yFwM9sinp+jkaiUeSOt8Ql2cxPmey?=
 =?us-ascii?Q?W3XhGejBoRK02DgTOcPcaPYrSy/IT8K42bXtUKJwHRwI3zFhtrlQgDEf6v3Z?=
 =?us-ascii?Q?W8NXlgmnbpsrofk1h1K35dJU5s/Q4aKxAUenbtD2K6zp3dUYBYG3IuM8spiw?=
 =?us-ascii?Q?wkyiqzZdHhajAAefLjfrXP19lRJhDZGfb1TFyQbPUJvMPyfJsfp7AEu/AENI?=
 =?us-ascii?Q?LTZmo5raKK6f1TiZrr+2i0u+Tv9r05LbafGhbk7ZSVMXYjYK/0Y0zYl3Q9ED?=
 =?us-ascii?Q?MG3AQqcRwze6RENye92Omnl9lyJQUNO5pvpfDlZ/XhJKRyQSrvhf/YK+CToR?=
 =?us-ascii?Q?64gj7Wj72jpHxBsxO0zLKt2nkmjULSRqKiyruJzXEY7qxHdvnJ4nMcaCvMo3?=
 =?us-ascii?Q?8KlZX180nh8+ygr6Z1fRvTbmxDE0dCl11SRdzPwy4iYN42JcOjjVX4fAOVS5?=
 =?us-ascii?Q?9xfR58vl/Bp9LzDIxJ6kB5pAYpBqWY19Ab2KINJ0e4Y7Q0+Oc6YYyjOv7ApE?=
 =?us-ascii?Q?n5cVfJIVy7hyvskmQRQuJsq0zmYnQGObJRhR5lRC2wv2f4LOXZ8jWK9HvOxZ?=
 =?us-ascii?Q?SMPzLjrAe9gzmPCVTRhQAhExXc0SuUibl10AAXiAmIP0JotrntUbUG36Y17D?=
 =?us-ascii?Q?u615/wJU7SLr4iUO2P8TjeQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecfb6c4-2a3f-47e7-4d5d-08db2b14af3a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 20:33:24.4187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6tcueOnrgvMIamlvFXEXh0qsamukC1S/IuVFW9FkdW3He5hXT3MGWQkd3TJ9jNCuLo0RBR+D3IZwj/KbvdAKj1oX73IW7sk7PyVXQXnCi54t2OkjRMF2cYozWVpFzid
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5469
X-TUID: 9NhkyCLurpfa

On Feb 22 11:37, Richard Henderson wrote:
> On 2/22/23 09:35, Aaron Lindsay wrote:
> > @@ -406,6 +421,16 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
> >           uint64_t xor_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit + 1) &
> >               ~MAKE_64BIT_MASK(55, 1);
> >           result = ((ptr ^ pac) & xor_mask) | (ptr & ~xor_mask);
> > +        if (cpu_isar_feature(aa64_fpac_combine, env_archcpu(env)) ||
> > +                (cpu_isar_feature(aa64_fpac, env_archcpu(env)) &&
> > +                 !is_combined)) {
> 
> Indentation is off.

I pulled `env_archcpu(env)` out of this if-statement in my latest
patchset in addition to the indentation, but am not confident I have
done what you intended. The QEMU Coding Style guide doesn't seem to
address longer statements like this in its section on indentation, so I
attempted to follow other examples in the code, but I'll take further
direction here.

-Aaron
