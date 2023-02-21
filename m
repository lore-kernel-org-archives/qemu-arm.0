Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3637054ejb;
        Tue, 21 Feb 2023 13:35:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+AH5bvAqZnXjQ4hdPuwjQNPLeiBViQwm0REekQ5Cjmaoc48MDcgNmivXEM03tsIV5/hMvk
X-Received: by 2002:aa7:df8f:0:b0:4ad:7301:fe73 with SMTP id b15-20020aa7df8f000000b004ad7301fe73mr6337299edy.7.1677015354972;
        Tue, 21 Feb 2023 13:35:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1677015354; cv=pass;
        d=google.com; s=arc-20160816;
        b=cPXCnBciuJ7vzSgIxL2rmzIXfbjn47MLe9GpHZWEkRwKCJfZPfhyhs5ZLbzBtWNIfj
         C6V2SVfVCd4whF6xCg734OcdDQzPg9jmR9IDX7/iIQvRPA4MumYl8rVYa9ZYSKD8Afmq
         4+eJRRbP1N0XXXm2Vv5fopgnBG6EjTEmdBDcay6OeJKbOiOYD82jsFNqGq3tB74KTROW
         F5FwP31QN0iG6M4iVV6ELEYZEFYeOYCowfcpau1kmCQWzKz+gecJZW0cEclrKOt78Cks
         sFt4Vo3C5aKt274fLVXFFpi1b9Q64tsgneL7onjUZ8JEfOEg0i97PuE7hp4ITC/f+Abh
         Z9ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:in-reply-to:content-disposition:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ao/Ga/t1EI8g0F9s2yvtoaXJfU6Uz7wvhLzF+K4bJ8Q=;
        b=iUUFD8Esw5gmz8uWfwrg9zh2WN12jNNdO2mvC60QFVhTBxhzdq49GL1HVxqV1pmbu2
         KYi8i/Avy12rUz6M7Ero56MnK4c5GOfOhh8QNzfGclmbTcBtD1XrQIuMKV0TxeXNGJVi
         GkrvvQCJ6XAem1bEBKtANj4nEUGyWKJfVRT5Zhe8XwkW8FIgqSmB1vdMsUJMuK/vP6bO
         uIxQyfJoVBSUGq8HxmOblE6qrJUkW7GgDRzeiwmUfKQ1PGL9hxHfihocO6aV6Z9uwAvT
         hidyD2gD6T9UFwBCeMG0A6NJB4tneuIyjF6KMGXpDFvZvXqgJzEaZ45+kPUWM0yl7/nn
         9pOA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=aaGBvfwK;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:fe59::706 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20706.outbound.protection.outlook.com. [2a01:111:f400:fe59::706])
        by mx.google.com with ESMTPS id v15-20020aa7d9cf000000b004ace584b203si21157459eds.640.2023.02.21.13.35.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Feb 2023 13:35:54 -0800 (PST)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:fe59::706 as permitted sender) client-ip=2a01:111:f400:fe59::706;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=aaGBvfwK;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:fe59::706 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfiGpX3jJ8sIwB7Q0q5LX8oAxLlv9bapCzYVym+KW7nQvIOl4Sb49zZ7fD2kJFeyjOcbkQX3Vr+Wy2W3XTavR9Sc172xpM+NMUVc3Tb8sBl+vgM09wTrClni2/ngmU1uhJPKbxYEqX9YaJjlcPcPip6YB6GA5K2z2OH8wENIqYlDQEHvTncEVH+ab5MTjxcQbDn9QwQEE7zWlxZ8pSVO/SSjcKXjGGZjS5tjRrqxAGb8CVw5owb/H26PVzk9r8qSziY5NBobwVQ5j0y421VASiAEyDshBQTJbTFH5j9XgP+2k8DwiP3pfAyKHuaaR8tAZeAAn31eHbGLOlbJ7Eq1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ao/Ga/t1EI8g0F9s2yvtoaXJfU6Uz7wvhLzF+K4bJ8Q=;
 b=kDvJsfz+Ly9rVEHBqTodwonK1K2mEpSe/7i+KvGq9G0Zwn+BBmrEMmKFzFDvKkzIVQ3ql8L93x7Ptiuw2mfYPD/BvTESjEBKgryS62VCVgl8tyND+AvCwIfetYVu6NThfGs3noZhsmZMdAR50laMA0YNCsb+hVb7keOh9o5zvRiS5H+OpXgWVLXfO6/rN5N0/2MJWMJlwu2YN0cfF/6azbFmoW4iOzfRPl7prtYRQVIAF7wgmClNpHJCTpwahSeFp+9oYv6HXXxnM7zOfijKHw3jzZ9oRvA2x5kMhH+6gLYy8YbaibBzBOR8rKuzRJ4Jfh0fiwot9wdELPim1Aihrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ao/Ga/t1EI8g0F9s2yvtoaXJfU6Uz7wvhLzF+K4bJ8Q=;
 b=aaGBvfwKxKOprmTZSO26/A55JbbSgKPWCrmvNdnpMf09sJ1zwpaYos4+aTCwGWVXj0Xrn8StRZK27rg+1ObUxXfWBd4SzNaijCHs4Te/RSVI5uMzd1wj/aLqCBG/5fVbKOxSwiXiniQ/Dcb9iiyBWXv6plKaF6eW53sKVP6Rbec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 BY3PR01MB6705.prod.exchangelabs.com (2603:10b6:a03:354::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.21; Tue, 21 Feb 2023 21:35:48 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%9]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 21:35:48 +0000
Date: Tue, 21 Feb 2023 16:35:35 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vincent Dehors <vincent.dehors@smile.fr>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 7/7] target/arm: Add CPU properties for most v8.3 PAC
 features
Message-ID: <Y/U5J4XzKYdsOO4K@strawberry.localdomain>
References: <20230202211129.984060-1-aaron@os.amperecomputing.com>
 <20230202211129.984060-8-aaron@os.amperecomputing.com>
 <CAFEAcA_XAC3rT041oB_3aC25kuoL8zoABR+bnNJ47iVzasZMAg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_XAC3rT041oB_3aC25kuoL8zoABR+bnNJ47iVzasZMAg@mail.gmail.com>
X-ClientProxiedBy: CH0P221CA0025.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::9) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
Return-Path: aaron@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|BY3PR01MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: a98780e5-cbf2-4e85-50f8-08db14539905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n6Ql4EZxTfqRAjH0nswP8i8dDJAJwZ4qTlgEdvVQYJ+Q9tAaLuqidLtvTMlRJ9PyN7HsDa6FxcLDwbcRgIB2SC3zPjawTKsf5AxQhgPTLGJaTEYOoeYp/XPfwvsEC1Vj5U7i+Z2SVe1vhGQOeqcbouiYJZYmhTaZMXzkfUmW1ouDNX9j5X82B9CwdTku1sBn7DT0HZ1FUvnR9tJAR9uvsLYlXbfPKKNt61TP0jtv5w7QVNrhTXPYNEWr9LqSYYWawpcqWubXDAH/2uyGdkkYbqDu2eJAsgP50tocKj7k/e8kU3MJG+5A7o0tjKtl8wjcMn59SeiyvEHG6pNDku09f+Jp4gSYn9YxKDA5sXtMGaLwZ6awCCc88tctFK/IvvOgaIdd0e+XNPWia9NvPOgiagkqkfZzEiqvYEfHzbnEfq4yrFhldKmsN3aBKvBK1fy50KyoKXkXo2sIJd9T+46cBHaWAZLe+PJtNbtKqz2ZdP+Hy5/01+U8SYb2LLZ4ijlZJ4a7Qlv0pIOziy6JkZJAIERAodNtR3RhKUbcIi7Il6LDyUj1zkEdC26957UTmW62PpurcLn/YTIDCk+S3kywEKFbTWqBg+RY7geQmnRj8TU0BxNAhU0T8Ul3h17C3nponp0u3+IpOBrfFN4JWVLCLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(136003)(376002)(39850400004)(366004)(451199018)(54906003)(83380400001)(316002)(6486002)(6666004)(6506007)(41300700001)(6512007)(26005)(186003)(9686003)(8936002)(2906002)(86362001)(5660300002)(4326008)(478600001)(66556008)(66476007)(38100700002)(6916009)(66946007)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H6p8gyTFd9rGnEc/QyZY+XRD7Kb+PV+2KZADhK81771ICROY2Zp4Fof1H/cs?=
 =?us-ascii?Q?YcsqY+TOARSDFtwNmyRXewrnuU6LiFFMKGHjYeNDA3ENW8fD5pljBuZ7lBoK?=
 =?us-ascii?Q?voMxLp/hughN7Su4O/qH6GmADD67IL+Ij7AaCbLHtj8i7cc+oz3HkW3DuTCo?=
 =?us-ascii?Q?LqN+J7bHP+Hg5juwmzQ+w1sUNmW6+uZOtX+3E1oqizGgvgTCpPTNrDvemvCT?=
 =?us-ascii?Q?k+bphQ/kj0Uue0oyt5qoURYGK6lQuZeYvXVaYHLHyo3oYYAuz3SI3T9ub+bK?=
 =?us-ascii?Q?9S9BP6zkKr51y2Wk5TVGBdnNSDgxnkZQbotjkyHMjrZbgXa8zTAgeXe+lWXK?=
 =?us-ascii?Q?F/+FLxSPm+TFjCRevbXfnEsWQZ6yCuKzzG7e+Xa6QUstqanbco7qcTWEQj8/?=
 =?us-ascii?Q?3LPFKl2I6ebLq1GKAN/dFsomOBEAyKLWBjwnnT4fVV/x8wZK0muqDEunRXeB?=
 =?us-ascii?Q?5bZ2/y3ypVixRcZTZKpGaJBn7sSKh+OV3sJW354/JiK05HeoCDh8VGW9YmID?=
 =?us-ascii?Q?pilvwZ8pzYHHt++EoYpSkeD4BQIJIsRf9pfAShhaXqPHxOCCGZq8+gVA3dvb?=
 =?us-ascii?Q?uW3jLqQ4oyPlnLpG8L+/lxLSr335hU/UC+HtO5vC4JeBJ+f/uO9/zpBBKMcs?=
 =?us-ascii?Q?XsPgXK6dJONiotwwZu2YhtYsg9KVhKDpTk9LZ4gaxMdVKwGE0S+tPNnHMvFi?=
 =?us-ascii?Q?etnlMMNsIQKiAPwix+psatEGhPH2henHbkOu0dMgZHcn9N975gMO2aojEhOD?=
 =?us-ascii?Q?UfnxQupTdpt4V/S7S7SGIcjzAB0vHmMpWYT6MUsyheBu0RpYO4GIjSAF42Q4?=
 =?us-ascii?Q?tIC9kfopl9X/fenFGmpgDmJdw5yJbDZlIf8cWDNlI0+Z3myIHG3eUWoJ4naV?=
 =?us-ascii?Q?clGEzuCebXSmVl96cEsMGqdmcsUx4qH5j+jKjWCBFqTuNTdgNgFFJmm111Ra?=
 =?us-ascii?Q?hw8vFNMZ0uQR1KUDfQc4BIvBYCsBTygypSmtFMu9OQ73gBDkdIRWH5cT6UPz?=
 =?us-ascii?Q?8zSmgBrxLDo2ePtujAKW5VXrcV5gmi1T0rPrwD0op098G/SxdJx+6uuaw9qm?=
 =?us-ascii?Q?6iu+dNzMv7gTUb1bBTSblUsjgtmkUvlp1L8HQcS6Us6jOEKFrfcgwSfp69ha?=
 =?us-ascii?Q?8wU/VewTCJbqBaZBEtPbJtRd0RxtQZ/k7MNy/T6yFA+R+jEC01fg448C7FsO?=
 =?us-ascii?Q?nC8SNO/f6MDahOMKhxSstz0aQSr3uvetnJqvGd4/CC+Z5vY9vrriA4Y/fU6/?=
 =?us-ascii?Q?RWKcXleBuANvhlrjQJlbLiMpXybsHQ84hxLEQQntCcScPZnP8YtO4Kwy10PI?=
 =?us-ascii?Q?W1vbFWTWpwPyz9KHzbkphHMvy99Ky+LMblMS1Kk3mdqgfm9JsjELK0CUlmEp?=
 =?us-ascii?Q?08Ir8zyU2CWbN8lp9JLe70qcwC8KVIAjNnjoxMUJozvZWyfxw1/Sx0i/f+I/?=
 =?us-ascii?Q?eiw4gxZEETYf3zdjtv2xKso6qFMYJPLX1QUq2tW/M1VycYHqjCxj0i99x47e?=
 =?us-ascii?Q?hqJae7QfgSWmYiLq2BWi3ExZOyNVsn2AQ5W9UYCBoO6cpli5CKNzpK/L00n7?=
 =?us-ascii?Q?s/ZSQH69zXGmouMyvHQByLw6ncJb3cHztJy39GMgGE5SOy3l5X7W0P7oW6Ue?=
 =?us-ascii?Q?CPNuSBzSeFychJT0vbweQs4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98780e5-cbf2-4e85-50f8-08db14539905
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 21:35:48.7204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CfRnoYgCqb+mY8pqrPmAgGbO2DY1MpMiUGE4Dut4qy+p23BAFONXgNlae4GZZkv8xFtW8VNmwpNfF5qNQ/I43pmujYbmdme5SsdNFYrcOJv9taUEaGRUYyfoPwCLr/qV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6705
X-TUID: wfgoFxRi6wmE

On Feb 13 17:11, Peter Maydell wrote:
> On Thu, 2 Feb 2023 at 21:12, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
> >
> > Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> > ---
> >  target/arm/cpu.h   |  5 +++
> >  target/arm/cpu64.c | 81 ++++++++++++++++++++++++++++++++++++++--------
> >  2 files changed, 72 insertions(+), 14 deletions(-)
> 
> Do we really need all these properties ? Generally we don't
> add CPU properties unless there's a good reason for the
> user (or the board/SoC code) to want to flip them. The
> more usual case is that we simply enable them on the 'max'
> CPU by setting the ID register fields appropriately.

Honestly, I wasn't sure where to draw the line... so I didn't. Though I
won't claim to have perfect knowledge of the evolution of this feature,
it felt like there were 4 distinct levels that I could imagine might be
wanted - I've starred those 4 below:

* 1) no PAC           (APA/API=0b0000)
* 2) PAC without EPAC/Pauth2, QEMU's highest PAC implementation previous
     to this patchset (APA/API=0b0001)
* 3) EPAC             (APA/API=0b0010)
  4) Pauth2           (APA/API=0b0011) 
  5) FPAC             (APA/API=0b0100) 
* 6) FPACCombined     (APA/API=0b0101)

And I am not sure how likely 4) and 5) are to be implemented, but after
I was already up to 4, adding the last two more didn't feel like much
more!

I half-considered trying to make `pauth` a single option which took a
string instead of a handful of separate boolean arguments. The possible
options might be `pauth=off`, `pauth=no-epac` (no EPAC), `pauth=epac`,
`pauth=pauth2`, `pauth=fpac-combine`.

All this to say: I'm more than happy to take guidance here!

> Somewhere in this series you need to add documentation of
> the features being implemented to docs/system/arm/emulation.rst
> (just a one-liner per FEAT_whatever).

Will do in my next patchset based on what we decide upon above.

Thanks!

-Aaron
