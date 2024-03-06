Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp752631ejb;
        Wed, 6 Mar 2024 12:57:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoUHLaJ89nQc7cPwstyObNft9YBeyY0rmDTZpPmdkH0bt9jL/rpSTBqt7qTYXTuxZ73jT+
X-Received: by 2002:a05:6a00:2d02:b0:6e5:9031:9885 with SMTP id fa2-20020a056a002d0200b006e590319885mr21333299pfb.23.1709758623098;
        Wed, 06 Mar 2024 12:57:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1709758623; cv=pass;
        d=google.com; s=arc-20160816;
        b=ewQt3F9hlua0LnLU3eDARYETiACPZnlxfiN0nDdTA4WFzkTuO8GWGNAaNUCJJKdOnB
         4XF84pSb7NgglZQeu/Jn1gcPlWPWpF3Y5aFl/I6WELI4cshtZ7q6qayQzw4j4K/tcLur
         Qy9Gk6rLFWQrNja5Rnvg00nlnYoH9b0vqkmU5aiRjfcNZAhGce4ejkHEVvaU68fvHRVT
         A2sSwn6R/TybCsLoIOUdHWZIhhRvFjqE7yNRkRBFSYUS3mXLfuR96AU5KYWLh4XbjY+H
         T3cU+clDfZw8doMWbp1F17/wrH8I9PKqswd2ItVOiiB5pd5XhmFdmcTqiwnovvgC/uyW
         iZ2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:in-reply-to:content-transfer-encoding
         :content-disposition:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=SIt50I0apjfJJ6MtFFLjwOqDUy2ix43nb1efYxunB/o=;
        fh=PDHwwk3uAFfvkwzJSfrNFAZs6n2deQopGDphvHoz4HI=;
        b=sZWHcAglxJRwJG+S2hElvilsKvapU9g0PjuV2eyKPO33wzITPw2ur0bXpuFGyA57R6
         an3GWSKJ4GUlsxVaNGXJKNvUQeirfilGOADnF/GOPRs7asIa9oJ5z7nGeRKQxYifBYJm
         DtnU++IGQnnalg0GX8xv3hpu3KagpCRupt2anQlsd5j4o3fggo+3rx3tNuO4SwwI1kNr
         6sL7a3niptG6k+8BTPJ3UvD0W313ZBs28osks5usnkoo0Vl+sd2M/da3mM1Z5xztkwaO
         FMQ6jbN/kIR0C7f2yHQTxfWNNgcANBhDKKI7pCvdn2UWN5BxihRBfo6pdAlk1gZzI9uX
         pqvg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=BiwGZh16;
       arc=pass (i=1 spf=pass spfdomain=amd.com dkim=pass dkdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of vikram.garhwal@amd.com designates 2a01:111:f403:2416::600 as permitted sender) smtp.mailfrom=vikram.garhwal@amd.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Return-Path: <vikram.garhwal@amd.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20600.outbound.protection.outlook.com. [2a01:111:f403:2416::600])
        by mx.google.com with ESMTPS id v5-20020a655685000000b005e49d2a67e2si12490166pgs.555.2024.03.06.12.57.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Mar 2024 12:57:03 -0800 (PST)
Received-SPF: pass (google.com: domain of vikram.garhwal@amd.com designates 2a01:111:f403:2416::600 as permitted sender) client-ip=2a01:111:f403:2416::600;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=BiwGZh16;
       arc=pass (i=1 spf=pass spfdomain=amd.com dkim=pass dkdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of vikram.garhwal@amd.com designates 2a01:111:f403:2416::600 as permitted sender) smtp.mailfrom=vikram.garhwal@amd.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIcxnMs2EzX6R9V/dPJ/Et09Kd37a6TuwvFYAmJGQv/tbKuj019JRKuREPFNNLRnxRxgdKUZpGSrjzvpQPFHMVZOxdaoyraG2GvjBholPPvFFjc+aTL150fPveEFxkTuNFt7zYR4GDMuKJfKHqw7UdVdGzeSoUJmO9ZaprH2axWTxlmtANCBFVUXd/aHaNFXZE66CLVe5iLVya2Bynvxm2LON+8VgCXb1JAE+qbk1xxsCpvsZT/4UXibUr9XvJWaBNL2a5vJ7Bl764cquVhwpBwkvgptjyvTD9MKgRRMpoDtP9x+rLoPwJaMUqORLBgokIq8ppYIlEi+pKqWaE6EiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIt50I0apjfJJ6MtFFLjwOqDUy2ix43nb1efYxunB/o=;
 b=T8vzpBK6yaufOXb3HmYzD6ziWKW9nQfavgqQr5+dvRTJKB7uh7pVNqeF6+bGQ5jopxdfYXr5XPmUKxAwNg2sMdVb0XXjWMkheenzS24MvPY1h7xDT7qSdrG4kCvxrtyr379Co1x7Ra9XZem4L5DeUf7kPMQ8dGhcqZMvsMBoM4YVOd6KtnseZw9kkmmpcB3t9cmn5xiGqoznNM2k/rYMwtRTlDV7/3pknTYvG93KxJc0nE1+7TuvrofW17QeL2JG2ywPAMEiZX9yvgsnmxRfHaGkSQ09A1fYNuxkEasZbGz3ZvEZIalAUNT1X9VCxEA8Rh8b8Mt7ei2ldLXe5I49sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIt50I0apjfJJ6MtFFLjwOqDUy2ix43nb1efYxunB/o=;
 b=BiwGZh16jtLzkF0V+2t1DY2MiESS0eQbWBDl/+0VFMcJOnXM9BKqJI3RNJi1YHf/q150LS1HG5+ahyVU4QUM6XIswmZkgq6EDrHFbo3qzBzqhlds4bYH5tEB6EwAbVhsvtccnWGklKcskRVscHIInEqQyTiCLDvG0Ot1qO5PF4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by BY5PR12MB4068.namprd12.prod.outlook.com (2603:10b6:a03:203::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 20:57:01 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::312:3543:c506:3207]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::312:3543:c506:3207%7]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 20:57:01 +0000
Date: Wed, 6 Mar 2024 12:56:57 -0800
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com,
	Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [QEMU][PATCH v3 7/7] hw: arm: Add grant mapping.
Message-ID: <ZejYmXhm87RGhQED@amd.com>
References: <20240227223501.28475-1-vikram.garhwal@amd.com>
 <20240227223501.28475-8-vikram.garhwal@amd.com>
 <87il25514r.fsf@draig.linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87il25514r.fsf@draig.linaro.org>
X-ClientProxiedBy: SJ0PR03CA0337.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::12) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
Return-Path: vikram.garhwal@amd.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|BY5PR12MB4068:EE_
X-MS-Office365-Filtering-Correlation-Id: 64eda568-122c-4c82-ec96-08dc3e1ff859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Ru5vNljNmtK7Cmc5Vnrg5r9u2M0bXASeIgKLWeuDEIaT9cK5V8fBA8B7SFGxtMDtAUK1IR0/mJPS1voTEhd/YRQJ9/IVgGvzoVIJGNkgqe7sIqTEmCn87JQmL5cM/dSRuX40N7l4QtPZU/k7SX3mpsBIGF/6a6rPFm3+9XqRsOuZibWvJPa9hFQPIjzplXa9ziAav6V865o/QPBY4n64v2AMeaBS0jnwwEsuETlbhlIffc649He/w/7Dk2eoUS2M3BPO/zXXnukS2o0bqKlUzyd/TevmOVD29lQNp3CYidaQQYSaZybeZSieMhJdWJG5y0zExN1Kq3G/aURLwIBkghvsH0CV9NwZvQFopdgtoLMAn1wvgCC7HhcavO2R5pm5kHABZzPpGMXzat7jCaO28aErfb/b4Q6vY4HSOgSe1VQTugDKbBWtU/3gYwyBgeckKP+KJdgAW0SlZpd+RobsXnoyR+IiGgqAzmIe6GaUxWL59+KWY3Z8qwOBR6Pg3i1UlIKtecPrcCLu0IDyjefUf5AEqUS07zbo/YnKNjfks9LInN0/+l1A0GwzTZDpJT/YwDkbOOXIDyD1uBtAJ+2+p9DRkyqGZRPjePezIzEkAtKEfbtd9IFc4+dGZHrQcLOaaAjmevl0UzbLR+kqNoYrSm7CwmNQW5GaJ6d+faKOm8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDhWYnY2ajZyL1JZUGFxREdhK3M0eFROZjRFNkQzSXZTL2lCSUZhaWlPRitI?=
 =?utf-8?B?N1BEU1NpSHVOb0hXSkR3eXpsNVpQSDN0cmcrSGkyQ0lIbEpGOVNlOEN4Nkoy?=
 =?utf-8?B?WkZQbG9xWG9wdUp6dkMxalRaRHNIeno0V200dlk0TlQ1SDZ5SjdWUkRCZlJs?=
 =?utf-8?B?VGZucGRtbEt5TkFhYXJiSG45bjUzTCtlS0pCS1Y1YzV4UVZHUG1wRzU4bkNT?=
 =?utf-8?B?dFkvTzdEL29YL3B0R3NvT0pXdVF4cEUyZkpLb3FvbmxGNlY4S2N4WXFDY2x1?=
 =?utf-8?B?a0lkeENuRTVTSXF1YTBQQVdHSzZRbzZlSzJMU0pwNEg5NTlReHBMaTVUOGsv?=
 =?utf-8?B?Y0dIT0JXMXR0SnhkazRLeVZGM2pxOUhRWHYwTWxDZHFQTWlUczliN1p3VCtw?=
 =?utf-8?B?b1FWQXY3SFJhYnJYeGlWMGdRcFNrSVNQUFcrSzdNenZvWmh5QUxYZkd1Z0Q2?=
 =?utf-8?B?WVJKanJ2Qnp5c2g1OC9KQ2ZHWGRVZEhMYnVRSUplaEpMTzk2S1pEbDhBZUFI?=
 =?utf-8?B?N1VjcDJEKzlyU09OZ0ZvZUxKVldhTTlWQ1lLbW9ySTNrVmtJQ2xVQUx6N2Jx?=
 =?utf-8?B?RVNLcERLMEY0b3JvU3R6OEUrVWxlcWZna2tJZHdVbTBEMFducWcxUWpSbnRC?=
 =?utf-8?B?NEVqWDE1NmswUk9jZDE3UTFCemN0R3p2RStSaTkvUXcyaTdnMzUvcG9LSzlt?=
 =?utf-8?B?WjFkQ2VrcmhTOEpJWnFTaUF4RWw5U000RCtjckVrT3JWcmlFemJDdWVIci8y?=
 =?utf-8?B?TWZrV0VjZEtOSU9nWXA1c2xiVmJvbXVZMWJSczVIUnk4K1hYR1FSSkJwNStZ?=
 =?utf-8?B?NDBuOWcyVVJpYlpoZ2djejhwclRTUTVCS1RTOXRLVlQrUDFJZ2szL3ZlOWNv?=
 =?utf-8?B?Vzd4WmNPUnYwZEI1TXk2TnZrMXo2cDcyeVVrQytrR2pONG5HeEhZVVJKdHp0?=
 =?utf-8?B?ZmQzRXlHeG9SN01xSmlvRVdld0Rwc0s2OEpmTUV1YUZwTkNaNUc1Wk9na1M0?=
 =?utf-8?B?OFRRTFFmSXczWG1IN2VFVjZDa2tsc2RxOFNHSFdDd04wSmVDYmdtNmlHcUlj?=
 =?utf-8?B?L3ErbTRzakFRa1VaWGsxY2ZQbnRVcFJNYnk3SFpaUExYZHFmU3JEVmNPZXRk?=
 =?utf-8?B?RU10MXNodHhKZm1VQTlsN0thYkZ2VFZabk9ISjNMVXR5OVAvOFlEbHhTVU10?=
 =?utf-8?B?ZWhGQ0FGejVHQlY0ZjNtNUhnNGV2bGtXUWNIMTZJeS9oNGtmTFpHUTY5L1J3?=
 =?utf-8?B?d2Jma2ZBaHY4WWx6d0FUQ2h1ZUNDSmtMeTNsYTF1ZVFIbTBxOEpKaFNJM0dh?=
 =?utf-8?B?UGZjQ0dlZGY1VVJMNjVUMGowbE02ZW5hUWJuNzA5NVlJRmpKcFhNYWR6WUxX?=
 =?utf-8?B?bUU3bEpCVzRXTGZrVEZETnc2ZW5DMTBqUEJHWnhHdjdxcS9vNWplK09KaXRu?=
 =?utf-8?B?a1lIYm1jRm5RRDloUm5QdFB5Unc4N1hTODBpZzJjOVgxOG1xOEJxK2VCNCts?=
 =?utf-8?B?UUhFRy9NMEJBNFhiSW5uZUpocGR2dlRJUGIvR3lhN1RJa2JsZ2JxdWFJMTVa?=
 =?utf-8?B?d29GcTQ3Z1ZMUlpkOHlhelBGVUNPN1IrNytacTB4UlUvcUl6amVaRmEzRExm?=
 =?utf-8?B?Tlp5ZlNYa1pNV25hNVFERjcwdlRkZ0JtbUs5QXpVMGFKVDgxVlRjaXlsOE5N?=
 =?utf-8?B?bElnMHJVa3J3K2RsenFKTkFheFA2a2xHYTVhZUIyOEtJQ29VSWxzem1MMk95?=
 =?utf-8?B?MFVpa2k4WDFoYkMwS1RPaUI4US9ZTDlrOGV2c09MdndMVXBUTlc2VzNPQVJU?=
 =?utf-8?B?MEZYWE1WNGhucVdiQjRaQ2pTbmVmQkF0TGdWT2p4ejN6OWdyYkNFRDNDT3pz?=
 =?utf-8?B?dUQvbjVWcUNtdnd4cVBZMk91R2hUMWdna1ltNTJXSmVDZlZpMlZnQWVnUEx3?=
 =?utf-8?B?YUVGWE03SFM1aDE0TVQyYkFFNldYNE43ZEtSaXIxV0Y5U1I2ZDNYQkp0UmhD?=
 =?utf-8?B?WVpzK0FMYVN6V01aeEdMeFR2RHRmVGlqUGFMeDlwcGhWR0tITXJXT1dYejhT?=
 =?utf-8?B?U3VFMVlXS3U4WXhWZ3BzN2RNMy82aXFOQ1loZlRTNnJKMk9yQXhQOCt2aU9h?=
 =?utf-8?Q?RGWm02H0y7fg/Xj8jyWnh9AsB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64eda568-122c-4c82-ec96-08dc3e1ff859
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 20:57:01.3669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMsoT86iLQ/xq5Ddp9NiQW/QLRbtcg2bsQNHSu4vvSo0lE2w/fqCq3EjOahAYin56hvS+tGkpf0+h1wk3wV6MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4068
X-TUID: H+yiNsXnW3iO

Hi Alex,
On Fri, Mar 01, 2024 at 05:10:28PM +0000, Alex Bennée wrote:
> Vikram Garhwal <vikram.garhwal@amd.com> writes:
> 
> > Enable grant ram mapping support for Xenpvh machine on ARM.
> >
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> >  hw/arm/xen_arm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> > index 32776d94df..b5993ef2a6 100644
> > --- a/hw/arm/xen_arm.c
> > +++ b/hw/arm/xen_arm.c
> > @@ -125,6 +125,9 @@ static void xen_init_ram(MachineState *machine)
> >                                   GUEST_RAM1_BASE, ram_size[1]);
> >          memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
> >      }
> > +
> > +    DPRINTF("init grant ram mapping for XEN\n");
> 
> I don't think we need the DPRINTF here (there others where recently
> converted to trace-points although I suspect a memory_region tracepoint
> would be a better place to capture this).
May be drop the print? As it's not providing much information anyways.
> 
> > +    ram_grants = *xen_init_grant_ram();
> >  }
> >  
> >  void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro
