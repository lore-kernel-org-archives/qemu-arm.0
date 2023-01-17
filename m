Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2742771ejc;
        Tue, 17 Jan 2023 12:56:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvSuGyGaOkZO1+X015gbkOl8dF9MUBWAuYS5hozeAtmUm+AiLs45msSPCOqG1Xxe8nnWxxC
X-Received: by 2002:a0c:f791:0:b0:532:bd9:f596 with SMTP id s17-20020a0cf791000000b005320bd9f596mr6284431qvn.50.1673988978407;
        Tue, 17 Jan 2023 12:56:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673988978; cv=pass;
        d=google.com; s=arc-20160816;
        b=ek9mOln4z4FR5zNAIgOUfSZKoHyZ8cw0Yv9FV1NZ5eWK2VLf7tRuZRebKiQCjDusLd
         4VWHS6N/fR0YbS85drzN79IV7/5VEFF9aReGaaXLSkEbVAbsNs7PIDVQk+Ds5K1cydOW
         etpaYaxg30MJINXmbi0Wx3KDUitK2NOLR8A3OhCoJEFU8nE9+VVakAOA/e9ZFMzy5BIm
         iJxZy0pyMSeE5zr/vWAPuCaz/Zn06TAzvuTrVuBkjRWnrJk7JJM+Fj28lsn8VcXq6Dp9
         nYLCZudwJ1mMIxjpAsAJf0xf72Z8P55MLB7hp4spvXL5GO0boYOZLeMJZON5fsHW5ch/
         TcNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id:dkim-signature;
        bh=9fn36VzoRdi85K7NxAS6PcoUgslMUtsEpPwQ9y+0uzs=;
        b=WOaNpM6yS7pc9qqRHPKHk3j6esg3CVCfh32P4GF4ehmjLzvpMY15827WbhhFEYJ8xe
         4Sub1MuW+zyLsJJMfxUKdOO1RNY6N/AbMVbta+SP3M2ymMJo77Cf4jrxY1N17w1sgnEK
         6Spz+QvddqLAtvNKUJlxbq6ILV9OOEnXaUoSdeaeKDQrJX1Se6Lfso7x5jdgvxTfhbOL
         gG/rC3WCUay+dcnQ+JZ4nTYQP6lrT4y5deYrjKJmTob0PSx4JS9KH1qOMmSHBjMG4qo1
         FvFm0S21qA5+l8HkuOvXXDbiNFYONYExev07RJ/eKRcQRgJQoTQ1Q7WmpnlxDGXRs2qH
         3yHQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@meta.com header.s=s2048-2021-q4 header.b=iCHHTp26;
       arc=pass (i=1 spf=pass spfdomain=meta.com dkim=pass dkdomain=meta.com dmarc=pass fromdomain=meta.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=meta.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020ad45aa5000000b005349990f635si7524476qvg.124.2023.01.17.12.56.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 12:56:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@meta.com header.s=s2048-2021-q4 header.b=iCHHTp26;
       arc=pass (i=1 spf=pass spfdomain=meta.com dkim=pass dkdomain=meta.com dmarc=pass fromdomain=meta.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=meta.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHszx-0002uY-Q1; Tue, 17 Jan 2023 15:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=438116b86b=dreiss@meta.com>)
 id 1pHqe0-0003r8-Nu; Tue, 17 Jan 2023 13:25:14 -0500
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=438116b86b=dreiss@meta.com>)
 id 1pHqdw-0006Ls-9z; Tue, 17 Jan 2023 13:25:12 -0500
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.19/8.17.1.19) with ESMTP id 30HG5ZUl006594;
 Tue, 17 Jan 2023 10:25:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=s2048-2021-q4;
 bh=9fn36VzoRdi85K7NxAS6PcoUgslMUtsEpPwQ9y+0uzs=;
 b=iCHHTp26jYqt7O6zpDd3oUST+bLcNo+4Kn0iT33I32MDECVfm9BSSp4Rdh4hSYwDzVDS
 yi9Kei5xOH97o0CZt8uborDranubLFkaUy8LUxcWmiUhrVkDfeGHgKGmF52WEkLSbEjN
 BZ8+ZTOOUm4wEI6Xl9sVsckOlRocC0wuFkQuRBVe2WwE70A+aqfgJdkd4IIFlj2njAzE
 C1eOEm37QLnUJNERDc5fSwfMLskZI9Lna5Pina9wisEkgRaeoS7rRPFbSA50VdWaXWtA
 LXhz631719bJHs0mFDbaKzK2a3S/sxeiV8ue0oV//AIrXGk5fbizT2CFAG0Js8wP9lkz LA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by m0089730.ppops.net (PPS) with ESMTPS id 3n3rsdx7wr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 10:25:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jG0TZKoXoprzMvkt+Z+SNjjhb4cHVal56SYXoMjrHhGpae4jEQncAmSSI0p9pXwLZ6eIErHx4MxeRriID5ztRZcbCw1roSYVlRlAx+EoxATO1WOwLddIDL1fw2uEa0KwCWZAnfyz+ax2sUztS7rXWAtEiCN/NiUZ0IhCafcRdYMZGjhRxiUT5ni5IUE/pDIOI1OqKyuSogpy32XtPBWavzz96UsLhuUIOmiG9pbYVpMMmj6JrGlqkYueMJ8cy2KWOAfGdKZy+FJFrzO9jkCYwmFJ+362TGPX8ayJVSpke9xWGl8nQm1vFUpsT/wmLOC8BO++P3DrEQOtmqDBZZTfNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fn36VzoRdi85K7NxAS6PcoUgslMUtsEpPwQ9y+0uzs=;
 b=VHonHdewjg3ggvSv4/EMY4wlARN5JFnNrfH8ZFO04Azl1WmcLcSEMs1j+J83dGnXmNXIRu7dCU32toqu1Rw5ONboU5V/Q7e1xjhOMqATeYYgWs/TGvzTDFhDwLwFYPsvHYhaVzM1lmNCVbGreSo3+OTBAFg8squjl9cNLEdn3rUSWnap29MsRegFJxdjOk+ecyIdkQbN3rSRJC3qqcfnqpIZevZfMTMCvOKBwpa6B6iDPcJV/LMbeVv7Fs22ZA/pAzF23On3c/dTVxU11Hx8hn9dACDnL60w/Fur1ybtSt8nBJFpEbBgqHB7NtJpL6BNBHnAxAR0UwSLhRTcxPMI2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SJ0PR15MB4680.namprd15.prod.outlook.com (2603:10b6:a03:37d::9)
 by CH3PR15MB6262.namprd15.prod.outlook.com (2603:10b6:610:15f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 18:25:02 +0000
Received: from SJ0PR15MB4680.namprd15.prod.outlook.com
 ([fe80::818f:54b8:f837:9f9c]) by SJ0PR15MB4680.namprd15.prod.outlook.com
 ([fe80::818f:54b8:f837:9f9c%5]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 18:25:02 +0000
Message-ID: <d01dc3b9-e112-d701-8129-f7d0fe5141db@meta.com>
Date: Tue, 17 Jan 2023 10:25:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH qemu 3/3] target/arm/gdbstub: Support reading M security
 extension registers from GDB
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <167330628518.10497.13100425787268927786-0@git.sr.ht>
 <167330628518.10497.13100425787268927786-2@git.sr.ht>
 <CAFEAcA8sHX0g6nYJ0F34=JvRJkRNhSMmjMKpHqFbCfP5LankEQ@mail.gmail.com>
From: David Reiss <dreiss@meta.com>
In-Reply-To: <CAFEAcA8sHX0g6nYJ0F34=JvRJkRNhSMmjMKpHqFbCfP5LankEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0052.namprd11.prod.outlook.com
 (2603:10b6:a03:80::29) To SJ0PR15MB4680.namprd15.prod.outlook.com
 (2603:10b6:a03:37d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR15MB4680:EE_|CH3PR15MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b134ebb-1e24-4a3c-d760-08daf8b82605
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rBFPr4WLThi41msB6INIGz1dw3sR7JQEQum3aO5jzzH2S6pIDxbOZDbffhI1cubFRY8W2fR9lMr86tby9+7DewCneSY5BULyLu2URV/BvMNPpA0zur+KxsShxzP6xTcuIi1BXfNA1qACNeYFsT/hs0TcABKgawmBl9ncMGSTDOnzVbdAbriLqE4x1mjJMwLYUPOkrNrDzKzTJWDP2b5A2N3h7NdfE/u4Mtfe8ZYZNgSwUAFvhuGX4OKhLLMqsR7n+NbVJF1lWeuh28XCUXYgfxEx0LmhJEHLm5r/dQyy48P4BNZpzW6Qgk4ckAxiRUZHiRwFFEw1bFtguTwhifITs0WWbkRHT0AI2QCRB+RMuAT9Sn+2p+VBd5FQhWx838Xbzs73oGCcFviMceC5q/f/V8YqxHiEx0JFBCDjYcIMTkcLm9AHS64k3YNYy8cUEI5XzvC5kwxSXp+c3kHUvRZWaHhUMWBNgBNWUfcu1fnVve/QbWSDsZwG4Lr219GIiCIJetEquSR5r2Ez2VlOkSUuBLXal2VJPffLKTm/aka9/vqmAU2qqBQUEIe5a6XFkSBzmMkNvLnJQzIgIRjmsSHKhDeO6kTaIZK/+BfAKxatCMaRlRDgJRBvs10yhldOhpveY1QVDurOD7aIaP5+STVNt4AIfb1gGQrS/1CkP1Jyztjqp2HvaHHHTjmDG9D5n35e1gGuHmPXGzSORTRK4o6qaOSYn/L0j5H2Ul9CVSbNpqk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR15MB4680.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199015)(83380400001)(2616005)(36756003)(8936002)(41300700001)(6916009)(316002)(66946007)(8676002)(4326008)(66556008)(66476007)(38100700002)(31696002)(86362001)(15650500001)(2906002)(5660300002)(4744005)(31686004)(6486002)(478600001)(6512007)(186003)(53546011)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW1xQVhYMWZvTmQ5ZURFOFcwaXRPWituQjl1ZGk5TURSK092YkxxVHlQdllO?=
 =?utf-8?B?UUZkZjk2cmdGeFplK1cycjR3dUQ3b1BVaFI2dkd4cW5LeVB2aHR4SUFLajNF?=
 =?utf-8?B?RWpOTkxyUG1VZExqa0UrZ2RZQk4rWWNucFhScjFkdjRnSzllU1JwSzdjbGph?=
 =?utf-8?B?WjNtV09hKzZtcFlacFZlNzRieFZBeFhCN1pNS2FiMVVTUWc2cFBtL1U4dVZr?=
 =?utf-8?B?R3ZhYXg4SDJoYUVsQXp5bHpEQXR6QlQwV2JaRFNZQUJneTJhNzNubmVxNTM5?=
 =?utf-8?B?aFNyVHJYTzcxUFJvOERrdUdNRzV5SXZDZ3JJeHEvc0gweHlqQUhXd0VRK2Fv?=
 =?utf-8?B?bFMxVHk2UEZhaHdac09CRFZEaVg0TElGclhjNFVob3RramV3WHNHMTYzNWcz?=
 =?utf-8?B?S28xQVFiWWNQUklSQnNVUXRJVUdGZHArUHkvSm9sZVgyYk1xY2FTWFFUQlF2?=
 =?utf-8?B?SHJET3hCZzkzTlp3ZHNSMjhtWHRQZC85MEYrZG5jN2ZkMG16aEFxWGhJK1hB?=
 =?utf-8?B?YWk0Z1JyTWZtMlhoNFBUZzF4cUdSaUNSc0dqMVRhV2dkUlFCU0YvSDZIY0NH?=
 =?utf-8?B?d0xlSSt0VmZNemNOTnl3elcrR0x5VS9aR2JjN1JTd3NPYzAwL3lScnJleHpJ?=
 =?utf-8?B?bVBsbCtWZ3NESGZVcXhTWFhUaHlEeEpqb1VZU3lpQ2dTUi83MFE4VHorMnlI?=
 =?utf-8?B?MGw5N1lXZnBtcEJxSWloMGZITkRVdHFrN09zdU1xQW83M2lpbTRDb3pXQU1t?=
 =?utf-8?B?WmlKbXFjWGhSci9iWjFEeGFFbU8xQWRoRldqT2ZNVHRtKzY3MnlwTHpuc0ZU?=
 =?utf-8?B?R3pHKzVwVlY3RDQ5OUh5VUt0ek5GWW43NEQzeXpHSkxnMFdSdW1uWjlTSWdv?=
 =?utf-8?B?QUFycDRWZTUyNEFuaFp3bkF1OXYrR3lJL1hUMkZmdEJ6amt3NlpDSWZkYXha?=
 =?utf-8?B?UHZBaUdTSlVpdytSTGJhT3VBVm9yWFh6NHhNbnllS2c4U0FrMjJGdHNzWkNC?=
 =?utf-8?B?ZTRTMHFyRDVZOFFHQzQyeWRVZSs2R0tBWmwrTXJJYXZHYmdoY202Z3pmaVIz?=
 =?utf-8?B?VjNhY3VXYlVNWlVoUHhsamdaaE45amtUdnJjR241NGlqS2RFWi9McnpnZy9q?=
 =?utf-8?B?dk5mMDBHRDVTNWx3MUlEajJnaVdJMXlxVmJtSmlIZ1M2OGhSSHNCTlVTTnZM?=
 =?utf-8?B?RURSL25DNWhhNW45UVdSS1UvcEJaRDNvazIwZS9VejhWZWxEUnJtaldxWHFU?=
 =?utf-8?B?M3gzZW5HRmpRVTMxZnQvb2lnV09jKzV5R2NwYktYTFhSSS9KYzVaM2xTUWFX?=
 =?utf-8?B?T2dqS2hLd0oxNkRvRzVJVy8rTUtDdlVMUnlhZ3JKdFY0UUxha2t1M0RHVDFa?=
 =?utf-8?B?Y1cxd29jaGZZVno3blpFWHRYdm40UkxtL3FPUWQyQU43US9Od1NiWnMrTDJ0?=
 =?utf-8?B?ZDVSZ0haUEw0ZUJtbHFTUnBwWmZUU1kwYWpVOGVuaHlWZlVUYWpwQ0ZMMWVS?=
 =?utf-8?B?NXlOQURUYVVQeitrT0Vyem9xbWpsaXBNT2crd2FKcFRtZVdUTWZNK3U2dStQ?=
 =?utf-8?B?VWJIWVBoM1lOcUk5ZEk3b21Da0dTRU1NNU5Jbks4UTBZU1FhV2xUTW9DSStl?=
 =?utf-8?B?eVdZRFNiOEgrV0c3Qzd1NTE0enVXTzloVENpNWd1QlhQSGtHR25LbElHRmVu?=
 =?utf-8?B?SlBGc2dHMXh5SVkydkdSUExqanBOKzVvbUdRZkVrbUtkT3Y4cTFjMjZ3UzdH?=
 =?utf-8?B?Z1h1TWppT1EwOXVHcHR6aUxlWWh3VXFWNVFTRjV3UkplcGtpV3lNdEEzaHZF?=
 =?utf-8?B?YWEyQnltci8xalNSK0M5TmJvZGh5Y1E4WWg0Y1BUSkFHNWMyZi8xSU0rSDlB?=
 =?utf-8?B?ZXVpWUFaWHhmUDBZU1k0YVhtNVNtZ2tlVy9lZmEvQVNvV2U2dDMwQWZkY2xm?=
 =?utf-8?B?d0dRbi95Qm1Rb0dMOFV1ZHR1Sko4Um14K24zcklIbGpqUVF0T2ppVUNpeWhj?=
 =?utf-8?B?eXlQK1Q3eXZYdG1FQzNUbnUxeStHN1ZORUk3T1FUVTNrc3BNMXc0R2xkUGNi?=
 =?utf-8?B?ZkgrQ1g1RCs2U3pCSVgxc0xEd0hacUtjYmdRcEdjRzlFSWM2MnJnRWR0VHY3?=
 =?utf-8?B?Mk1UOTg4UUI3VFNKN3VpMWJUL0drSXJqS1lubFg3V2FGU052bDdXd2hYZzVC?=
 =?utf-8?B?YWc9PQ==?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b134ebb-1e24-4a3c-d760-08daf8b82605
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4680.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 18:25:02.5215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v69aODKodxryH+N7a/I4MDnUTFR12xgG0uXMdxGH02uPMmNl2mmwH7ido2+0hRV1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR15MB6262
X-Proofpoint-GUID: eNOj5mx8T3WwtHoXL654qnjF6n7FB76M
X-Proofpoint-ORIG-GUID: eNOj5mx8T3WwtHoXL654qnjF6n7FB76M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_09,2023-01-17_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=438116b86b=dreiss@meta.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 17 Jan 2023 15:56:00 -0500
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
X-TUID: fnxZLpzUAvm1

On 1/17/23 5:37 AM, Peter Maydell wrote:

> In patch 1 you skip the registers that don't exist without
> the main extension, but here you throw them all in regardless.
> Why the difference ?
Ah, yes.  This was an oversight.  I'm not sure if there are any
chips that support the security extension but not the main extension,
but it is technically possible.
