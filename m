Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp689760ejq;
        Tue, 16 May 2023 14:42:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yJAKgXSY14S81vmxbZHm25dqlFe9gs/TQ1qm2cHpIv/aQ4DoWa5eE6ASP7SeGhwHT0BpY
X-Received: by 2002:a05:6214:e48:b0:621:363c:ea9f with SMTP id o8-20020a0562140e4800b00621363cea9fmr44838030qvc.19.1684273324765;
        Tue, 16 May 2023 14:42:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684273324; cv=pass;
        d=google.com; s=arc-20160816;
        b=TzfM1t1acAGnNcWDcMPkk+VCfyYbuh3G7QEX5QCWIIPsT4E4E1HO80GIFpDMFVXKsk
         miN6PnMDBMnrEVya+LqrpoDvAMIdm19Uih+ghyEgrfss0VXTES0wqORXOg0iiG4g9mk2
         usFDBJ3mIOwwSENYDZ43bl0M4hnKu5zhU8q4TJ7oDmJyUnaP3SDNpeftW2EX3vz9VCsA
         B9Ro7wTqRxdGRXNclGyZZSz6+yZ+jbJVSiU2f5qPYQ6C8S5pNIidQYveI67uFsjFlB4B
         ZZrIt8dF1z6r6/OK18IsgH1DwNl5a12tSImRlA2DqhCnQ67A3+fz3yjuugGAV28Xiqcu
         iDDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :in-reply-to:content-disposition:references:message-id:subject:cc:to
         :from:date:dkim-signature;
        bh=e6ezMK2qYFgGj/hA1H7a8MndtnBJAwa8hsCKPD4YjXk=;
        b=MUKDvtDtoFNvowdSaO4WxmDIsE+1BnCTQO/JgMlh6kV1CPAINbRxxYBEmFuSLHrh8Y
         C4lhj8u0LtO1BkHbRL27EA1MeELhW2hz6QAcLshxyGRb3bErxzr0jTMRYFN1cjVrPssW
         HKkKyhye8D/5IqZ/MMbIs6eB0TxTZWt7qmwkZMKV/U/fDfV6ND5wZH2cCryHS5V4AtxX
         /RVBBjCoGiIiPq9yt5q6k77VHXwCZt1vgMy18nS37LPgSPsh5RFh08VK5ZYCREeQWe8k
         BDZjNZrFD8BEWLwTUhCdwNIQqpH+R+uFR+jGoVfLUEy86Fa+rkXxv4kPyNpVkb8tj6hA
         wpmA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@hotmail.com header.s=selector1 header.b=lG76BNpP;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a05622a138900b003f392138afesi11742693qtk.287.2023.05.16.14.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 14:42:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@hotmail.com header.s=selector1 header.b=lG76BNpP;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pz2Q9-0004nd-EA; Tue, 16 May 2023 17:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaosdefinition@hotmail.com>)
 id 1pz2Q7-0004m5-Mh; Tue, 16 May 2023 17:41:24 -0400
Received: from mail-dm6nam10acsn2080a.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::80a]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaosdefinition@hotmail.com>)
 id 1pz2Q5-0005xY-Ni; Tue, 16 May 2023 17:41:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c53X3hnW0/wI9/mI7hzYRhsMhz9BIoLrN/Eu/fdxtIXIj+3UrBlFE05hcFJg0YstjR22hlWGWcl2/sqqyZZ2hstnwnpPqVdy43amKa52L79mXmhXbjX145epcMk3pvnV6ZfugPKjlPHjdjVzmBDrxdUY81fD7Y/Wmb9xXIDwfwipE458FbWVGmI+ey1ORRmgkHpTbyeqzzO4ELVVa0PcV2CgWxNvfRVSCDfZGH3eIZavMEFKeZ/SDDqFQGCmiyuXQHW/VvWBae7RAgy4JBcNy1vgSP3B1pWTUwfQrLU6Jfb5DSaPY0XXjgKjmxoFKvpA2TiosvD7xTWi7b4Gjj5+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6ezMK2qYFgGj/hA1H7a8MndtnBJAwa8hsCKPD4YjXk=;
 b=haE+jVLPerIo/du5qYvuYDn6ejR00dfRZKLMWHPZpxONz12bt3GZsKZg7jOeLC2zKk7AgO/q0HGpgVUzHRrjCMu0TT/tij6pkFx/mPobsC1V2nrpQHG72fNXnpCRda9sYFLWBLoUm/BYpk4ZGdHIu/R+WkU+CTp+FZnz6Trtprl4msGsEx3l99ZUx+8Yk7QN6z9w41UUgmKVkmBe5YU+Wtu/loVK9bEnYaTvqi6myWG5ppuuLrFuoSn/oFNzD41zeqPJs3GKAU19Iul4IaFQ+YQvI7n2HeEZQOseXf33+9lQFWNYfhiIbxRNcBvY0Wk9fHBsCV1hPQTG0DOS70iiKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6ezMK2qYFgGj/hA1H7a8MndtnBJAwa8hsCKPD4YjXk=;
 b=lG76BNpPHl1sUzsX13iqEO7htd+W/sLmsY9DOSYe/ZZnELd3E7Do4vg9m95AhGkrWI8/roCM/ewbbUt/SaCSEp+LSi6dy0qiL30u3nuTNQa778X+mIyWSZGSfVcOpk9/YhlXLZgCkE4oI5HAvP807nvQk/XfQxFPSkmdwmzgd6zJRHOPbwZ4YEhiGhryQM4ioFSJqQorpeX8MlFCqfDBgGv7QCdms3sQ0ud1qYyabqn8AHZXzWxsLepa2nwTTU2lN07NZMlho51lFsZro2XcSyi7nDYxEss2APE/aCyLAA5QTh+fitTMgZzgKgINHJuzdmAk2WrZB2wchg2zzz1Fqw==
Received: from DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) by
 DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.33; Tue, 16 May 2023 21:41:18 +0000
Received: from DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::bf6e:1dc2:10ea:cc04]) by DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::bf6e:1dc2:10ea:cc04%3]) with mapi id 15.20.6387.033; Tue, 16 May 2023
 21:41:18 +0000
Date: Tue, 16 May 2023 14:41:15 -0700
From: Zhuojia Shen <chaosdefinition@hotmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH] target/arm: allow DC CVA[D]P in user mode emulation
Message-ID: <DS7PR12MB630997A3BD3A08BC5F53E88EAC799@DS7PR12MB6309.namprd12.prod.outlook.com>
References: <DS7PR12MB63094479AA92D99D8D777A95AC799@DS7PR12MB6309.namprd12.prod.outlook.com>
 <b442ffa8-1a3a-660b-2924-4e63b0d6a77f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b442ffa8-1a3a-660b-2924-4e63b0d6a77f@linaro.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-TMN: [x1HsLsroXgmW57Sh0K8LwR8Z5Jhkmjv+]
X-ClientProxiedBy: SJ0PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::30) To DS7PR12MB6309.namprd12.prod.outlook.com
 (2603:10b6:8:96::19)
X-Microsoft-Original-Message-ID: <ZGP4ezvCp2gwSbmD@manjaro-vmryzen>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6309:EE_|DM6PR12MB4388:EE_
X-MS-Office365-Filtering-Correlation-Id: 91fcf717-4a92-4099-b0e0-08db56564847
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LkMpFucioYNqgXJ2f9i3xF57fjS7gsM7FILROiDlDTWhHQ1e5vti9ILR4MONfOR+1+N+edIOiaP9Xbpo2MOqGtjnzloUMtdm5UzLMM/M/KsWmn7lxZZ5S/59d3hFPxchpm4XlkhewQuQnHoPi8mI9tqogw8TiisDTv3k/Mk4SACKoZF/gCUOA+zjt38demptmFADxo9/r0Bm40FuyuRLjUVpuQflLr1BBav29SjwUcG3HRAwYShArzqFGs2qES+tyU9Gh9bpAG/IompsN2LY8w1DrG+NwOZM9uhbHEhmU1V/9+Rm7hLJYHa36gdvDqRSeRBDtLWZnca6eb31HK3IL4dj/NWoTuvbYyci7VxqcWHAyXfFM9wNCsLP9U4PXzlWajIAeP8p1+I0YtAa2M538dLx91+hYY0BTb+aKLbh1mUAnlruqzFYWsgEvuKf2lPDYalggoGvJFxOGBpbOB3adVTKJhKFRrbhg4pywgC6PF+QbgImJKZ4c+HMNoOToMdeylnFZL5mGLDjPMjnwT9B2iAz/KSYSRZLq2UrKhCBeSodxQKG0D9P2Gv3H/IZEwm420n71cBjTT68O/KhD1PETr71i1cGaoE0pb8XDC2tMAPDvtpwjs7Kk8sEI7lNUaSD
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1BXTUpOMnNMQmIzZUFXS2Z6SXpSbzB6cDNJSHBpbnEvVGE1eHNhVTZtZjlX?=
 =?utf-8?B?QmxZcDlrWXp0UkFFU2NxMWVtbHkya2VKREJzWUZnTTkzdjhrU3FmSkt1d2Yz?=
 =?utf-8?B?UjFqTzJkQVNyVnFaOEFQd2xaRW5pSUdBaSsvNlFVYTErZS9lN1dsOFBVdFRn?=
 =?utf-8?B?WlhrQXRJV2htMTZkOUROODNWWDlzTEUyZGpmL0RhOTl4Rm5nNWpuTXRMK09V?=
 =?utf-8?B?TFM3T2MxMzc4MUNqRk9oMTNibyt4NFBJVFNKaXZ0amhhaWY0MGhSV2tocXJS?=
 =?utf-8?B?RENvSVc3a2FMb3dzUGhWNUwvdnBHbWtXMUtoNWYyQ09XNVFrSlN4TUpvLzZI?=
 =?utf-8?B?NU90Y2hoQ25yRHU5OFhnMGtNQ2o2cExxVE5KOWNjTlNwbHhHNlkvMmJveGs5?=
 =?utf-8?B?VWd0OHNya1hIV1NwTEtVMFNzUkVzVGtUaWZjMnYyWHBVQVRVa0draTNLL2NN?=
 =?utf-8?B?NTFsMjNlZEpnTFBVR2I3UHJ2L1ppVXpVUS84YzdmdnZmUXhLMmQ5MTRuYzg2?=
 =?utf-8?B?MkRYUVJ1OVF2L1BaNlpKL1ZETkN4elhhRlk5Q0FaMmYzODJ5MStJT0dFbjJE?=
 =?utf-8?B?eU5pY3YwUVJ2SnV2dVptU011VmI0SmtLQTE4MGZta1h2RytuY3FzdlNUTUt2?=
 =?utf-8?B?QjFoVzlzVm9CQnlYOHVtNVVpMFduS1lOYldiOCs3VE9KSHRaOXVieUdtQ2F6?=
 =?utf-8?B?bGlXam9NMXJPWFZTanI2bDlCMFlXVTcyWStpM2ZSdkp3dE9vYjdDaHRMSGxi?=
 =?utf-8?B?L29rRy9XZy9MVlZhWUgwVkJjV3pMYWdmR01wWW1zOVpxd2NRRXVwbVF3cGUz?=
 =?utf-8?B?NnltS21MZ3FsQmcxZHRRZmJob1RhRWVNRFJpb0VkZDlNVGtNb3RXd0JYaXM2?=
 =?utf-8?B?Rks4Lytxb3VhMjcwZytBUUVrek50WUgzdkROUjNNd2I4Y1FJTXVJK3JvRDQr?=
 =?utf-8?B?S0lHU0IyTFp0OGlManVzNEU0d0VoSVJMUTZqR251eDFHT3p1Z0RnK1F2bnNi?=
 =?utf-8?B?T29tTm5QaVNWWjgzVnZSN2g3L3N1dE5mVGFxZ3E0eW9vbDVoRkZXS3ZYanBp?=
 =?utf-8?B?NEEvNitRamNvNWFOajRLSEwwaUFBK0RubUNSTlc1bk5LSEw4b1dZQkFteVE4?=
 =?utf-8?B?R0VjcTVEd3VXY0dlUy8xb3BLN0RPZmRveC8xdDh5NnRJdXByVU80NFFvTkZq?=
 =?utf-8?B?QkVRRlovRCtUY3lUMTZSODM1QlZRT1JJTTRFSk9CdCtnWElIS0cxYnYvb0Fp?=
 =?utf-8?B?djAwcFF1aUdCSUxUU0JCc21uSjVOOHVmY3E1RkxCSFdwemZVY05kMWp2cjAw?=
 =?utf-8?B?blVMV2RxejgwaGhVZDlPUmlUM2dUSHdMTmMvRWljUHNKVlp6QTBIQWhSczAr?=
 =?utf-8?B?SlhiSTlEdzVjdFg5MCtHdDFUYkFMb2ozRGdqd3JYS3UxQ0JWdE5PT1dBSzM3?=
 =?utf-8?B?NzlLSW5wUkNpdGtFZEdrWEcySzBtYWlPemRvUlh6ZkNWbzYwb2tCaER3WlZL?=
 =?utf-8?B?UXduSzJ3NUpZN3AzNU1vNXB5TXljRXoxSjRXZ3phZnV4Um8rRHd3UzdmTnl1?=
 =?utf-8?B?T2hVZEVzZ1QxSFdBNW1OQzZ4RE50by9lZHc5TUdiSktMVVNNOGoyTUp2dFo4?=
 =?utf-8?Q?KShcyuDF6VtLgJwgOSwb0+2k49XeofF6B6t31syE7PD8=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-71ea3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fcf717-4a92-4099-b0e0-08db56564847
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6309.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 21:41:18.6782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4388
Received-SPF: pass client-ip=2a01:111:f400:7e88::80a;
 envelope-from=chaosdefinition@hotmail.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8sIc+GAwnXzV

On 05/16/2023 01:08 PM -0700, Richard Henderson wrote:
> On 5/15/23 20:59, Zhuojia Shen wrote:
> > DC CVAP and DC CVADP instructions can be executed in EL0 on Linux,
> > either directly when SCTLR_EL1.UCI == 1 or emulated by the kernel (see
> > user_cache_maint_handler() in arch/arm64/kernel/traps.c).  The Arm ARM
> > documents the semantics of the two instructions that they behave as
> > DC CVAC if the address pointed to by their register operand is not
> > persistent memory.
> > 
> > This patch enables execution of the two instructions in user mode
> > emulation as NOP while preserving their original emulation in full
> > system virtualization.
> > 
> > Signed-off-by: Zhuojia Shen <chaosdefinition@hotmail.com>
> > ---
> >   target/arm/helper.c               | 26 +++++++++++++-----
> >   tests/tcg/aarch64/Makefile.target | 11 ++++++++
> >   tests/tcg/aarch64/dcpodp.c        | 45 +++++++++++++++++++++++++++++++
> >   tests/tcg/aarch64/dcpop.c         | 45 +++++++++++++++++++++++++++++++
> >   4 files changed, 120 insertions(+), 7 deletions(-)
> >   create mode 100644 tests/tcg/aarch64/dcpodp.c
> >   create mode 100644 tests/tcg/aarch64/dcpop.c
> > 
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 0b7fd2e7e6..eeba5e7978 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -7432,23 +7432,37 @@ static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaque,
> >           }
> >       }
> >   }
> > +#endif /*CONFIG_USER_ONLY*/
> >   static const ARMCPRegInfo dcpop_reg[] = {
> >       { .name = "DC_CVAP", .state = ARM_CP_STATE_AA64,
> >         .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 1,
> > -      .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
> > +      .access = PL0_W,
> >         .fgt = FGT_DCCVAP,
> > -      .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
> > +      .accessfn = aa64_cacheop_poc_access,
> > +#ifdef CONFIG_USER_ONLY
> > +      .type = ARM_CP_NOP,
> > +#else
> > +      .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
> > +      .writefn = dccvap_writefn,
> > +#endif
> > +    },
> >   };
> 
> Not quite correct, as CVAP to an unmapped address should SIGSEGV.  That'll
> be done by the probe_read within dccvap_writefn.
> 
> Need to make dccvap_writefn always present, ifdef out only the
> memory_region_from_host + memory_region_writeback from there.  Need to set
> SCTLR_EL1.UCI in arm_cpu_reset_hold in the CONFIG_USER_ONLY block.

Thanks for the reviews; I'll update in v2.

> 
> 
> r~
> 
> >   static const ARMCPRegInfo dcpodp_reg[] = {
> >       { .name = "DC_CVADP", .state = ARM_CP_STATE_AA64,
> >         .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 1,
> > -      .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
> > +      .access = PL0_W,
> >         .fgt = FGT_DCCVADP,
> > -      .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
> > +      .accessfn = aa64_cacheop_poc_access,
> > +#ifdef CONFIG_USER_ONLY
> > +      .type = ARM_CP_NOP,
> > +#else
> > +      .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
> > +      .writefn = dccvap_writefn,
> > +#endif
> > +    },
> >   };
> > -#endif /*CONFIG_USER_ONLY*/
> >   static CPAccessResult access_aa64_tid5(CPUARMState *env, const ARMCPRegInfo *ri,
> >                                          bool isread)
> > @@ -9092,7 +9106,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
> >       if (cpu_isar_feature(aa64_tlbios, cpu)) {
> >           define_arm_cp_regs(cpu, tlbios_reginfo);
> >       }
> > -#ifndef CONFIG_USER_ONLY
> >       /* Data Cache clean instructions up to PoP */
> >       if (cpu_isar_feature(aa64_dcpop, cpu)) {
> >           define_one_arm_cp_reg(cpu, dcpop_reg);
> > @@ -9101,7 +9114,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
> >               define_one_arm_cp_reg(cpu, dcpodp_reg);
> >           }
> >       }
> > -#endif /*CONFIG_USER_ONLY*/
> >       /*
> >        * If full MTE is enabled, add all of the system registers.
> > diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> > index 0315795487..3430fd3cd8 100644
> > --- a/tests/tcg/aarch64/Makefile.target
> > +++ b/tests/tcg/aarch64/Makefile.target
> > @@ -21,12 +21,23 @@ config-cc.mak: Makefile
> >   	$(quiet-@)( \
> >   	    $(call cc-option,-march=armv8.1-a+sve,          CROSS_CC_HAS_SVE); \
> >   	    $(call cc-option,-march=armv8.1-a+sve2,         CROSS_CC_HAS_SVE2); \
> > +	    $(call cc-option,-march=armv8.2-a,              CROSS_CC_HAS_ARMV8_2); \
> >   	    $(call cc-option,-march=armv8.3-a,              CROSS_CC_HAS_ARMV8_3); \
> > +	    $(call cc-option,-march=armv8.5-a,              CROSS_CC_HAS_ARMV8_5); \
> >   	    $(call cc-option,-mbranch-protection=standard,  CROSS_CC_HAS_ARMV8_BTI); \
> >   	    $(call cc-option,-march=armv8.5-a+memtag,       CROSS_CC_HAS_ARMV8_MTE); \
> >   	    $(call cc-option,-march=armv9-a+sme,            CROSS_CC_HAS_ARMV9_SME)) 3> config-cc.mak
> >   -include config-cc.mak
> > +ifneq ($(CROSS_CC_HAS_ARMV8_2),)
> > +AARCH64_TESTS += dcpop
> > +dcpop: CFLAGS += -march=armv8.2-a
> > +endif
> > +ifneq ($(CROSS_CC_HAS_ARMV8_5),)
> > +AARCH64_TESTS += dcpodp
> > +dcpodp: CFLAGS += -march=armv8.5-a
> > +endif
> > +
> >   # Pauth Tests
> >   ifneq ($(CROSS_CC_HAS_ARMV8_3),)
> >   AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5
> > diff --git a/tests/tcg/aarch64/dcpodp.c b/tests/tcg/aarch64/dcpodp.c
> > new file mode 100644
> > index 0000000000..dad61ce78c
> > --- /dev/null
> > +++ b/tests/tcg/aarch64/dcpodp.c
> > @@ -0,0 +1,45 @@
> > +/* Test execution of DC CVADP instruction */
> > +
> > +#include <asm/hwcap.h>
> > +#include <sys/auxv.h>
> > +
> > +#include <signal.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +
> > +#ifndef HWCAP2_DCPODP
> > +#define HWCAP2_DCPODP (1 << 0)
> > +#endif
> > +
> > +static void sigill_handler(int sig)
> > +{
> > +    exit(EXIT_FAILURE);
> > +}
> > +
> > +static int do_dc_cvadp(void)
> > +{
> > +    struct sigaction sa = {
> > +        .sa_handler = sigill_handler,
> > +    };
> > +
> > +    if (sigaction(SIGILL, &sa, NULL) < 0) {
> > +        perror("sigaction");
> > +        return EXIT_FAILURE;
> > +    }
> > +
> > +    asm volatile("dc cvadp, %0\n\t" :: "r"(&sa));
> > +
> > +    return 0;
> > +}
> > +
> > +int main(void)
> > +{
> > +    if (getauxval(AT_HWCAP) & HWCAP2_DCPODP) {
> > +        return do_dc_cvadp();
> > +    } else {
> > +        printf("SKIP: no HWCAP2_DCPODP on this system\n");
> > +        return 0;
> > +    }
> > +
> > +    return 0;
> > +}
> > diff --git a/tests/tcg/aarch64/dcpop.c b/tests/tcg/aarch64/dcpop.c
> > new file mode 100644
> > index 0000000000..8b4ea7c91c
> > --- /dev/null
> > +++ b/tests/tcg/aarch64/dcpop.c
> > @@ -0,0 +1,45 @@
> > +/* Test execution of DC CVAP instruction */
> > +
> > +#include <asm/hwcap.h>
> > +#include <sys/auxv.h>
> > +
> > +#include <signal.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +
> > +#ifndef HWCAP_DCPOP
> > +#define HWCAP_DCPOP (1 << 16)
> > +#endif
> > +
> > +static void sigill_handler(int sig)
> > +{
> > +    exit(EXIT_FAILURE);
> > +}
> > +
> > +static int do_dc_cvap(void)
> > +{
> > +    struct sigaction sa = {
> > +        .sa_handler = sigill_handler,
> > +    };
> > +
> > +    if (sigaction(SIGILL, &sa, NULL) < 0) {
> > +        perror("sigaction");
> > +        return EXIT_FAILURE;
> > +    }
> > +
> > +    asm volatile("dc cvap, %0\n\t" :: "r"(&sa));
> > +
> > +    return 0;
> > +}
> > +
> > +int main(void)
> > +{
> > +    if (getauxval(AT_HWCAP) & HWCAP_DCPOP) {
> > +        return do_dc_cvap();
> > +    } else {
> > +        printf("SKIP: no HWCAP_DCPOP on this system\n");
> > +        return 0;
> > +    }
> > +
> > +    return 0;
> > +}
> 
