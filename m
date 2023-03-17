Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1069683ejb;
        Fri, 17 Mar 2023 09:55:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set9Ellq1lHwP7/2zzh/2AI4ay+C8lR/oPOwomPd9pETyz+ZLzd7N2kvtMZoRUFwkfX2jvb0I
X-Received: by 2002:a17:906:9b94:b0:931:8502:ad06 with SMTP id dd20-20020a1709069b9400b009318502ad06mr3852312ejc.75.1679072145727;
        Fri, 17 Mar 2023 09:55:45 -0700 (PDT)
Return-Path: <Luis.Machado@arm.com>
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on20630.outbound.protection.outlook.com. [2a01:111:f400:fe16::630])
        by mx.google.com with ESMTPS id l8-20020a1709066b8800b00931b7294f0asi2255212ejr.410.2023.03.17.09.55.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Mar 2023 09:55:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of luis.machado@arm.com designates 2a01:111:f400:fe16::630 as permitted sender) client-ip=2a01:111:f400:fe16::630;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GCGylxIF;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GCGylxIF;
       arc=fail (signature failed);
       spf=pass (google.com: domain of luis.machado@arm.com designates 2a01:111:f400:fe16::630 as permitted sender) smtp.mailfrom=Luis.Machado@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz0+ek/5OT+Ga2JIPnZAGdXmGctqWtquMuq6G06OxRo=;
 b=GCGylxIFv/uz4If7bp+NOaW4GHnn49Mp5mof5oo/JDuoFXT1duEqqS7zLgL+uvnSGCUAYPJazviQKIFzReDryzbF3IIu2FNYwiwVK1VpSlhmwhSe37aNv5k2VVZXqC+SwGxI0VZud7BcR1aN8myoonTq+1eUIubjWJdT6S4nUUU=
Received: from DB7PR03CA0085.eurprd03.prod.outlook.com (2603:10a6:10:72::26)
 by AS4PR08MB8093.eurprd08.prod.outlook.com (2603:10a6:20b:588::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 16:55:41 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::a3) by DB7PR03CA0085.outlook.office365.com
 (2603:10a6:10:72::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35 via Frontend
 Transport; Fri, 17 Mar 2023 16:55:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.20 via Frontend Transport; Fri, 17 Mar 2023 16:55:41 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135"); Fri, 17 Mar 2023 16:55:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 92b0962864f0e2c1
X-CR-MTA-TID: 64aa7808
Received: from 0556cce08244.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FA6F7E15-6334-4726-866C-52CF033C85CE.1;
	Fri, 17 Mar 2023 16:55:34 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0556cce08244.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 17 Mar 2023 16:55:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/pAdJqvv9mvzRBbBEbeu8E5XVsZ2FuTODxx1n9nlQ/AuhK2G0ba1NN2+n5fPl7dscPiwF/5CeuM9zYv+ZYP55XcK9MNpKTQSerRvTm+rEHL2RW5e6V5l6s12vaLqzrUK9ajak6eVjsdDsWNbtDbSgmv2+UcOaASK0ZlZEIez/FhofSgTzDyjyOaQJz799P8r4L3+Up9FraSN1gW6qenUpbPDOE8a9HytuZftB+Hd023Ki+J2MB21wHSDdYnzq7YOk3nfMNw3sq21EPSCsj/00s9nWcaQBP0BRbq11V/gwe0cXKD/Fsb8GEA+3HfxvcVsVlgxQ/bvGRPzY6cHHzBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oz0+ek/5OT+Ga2JIPnZAGdXmGctqWtquMuq6G06OxRo=;
 b=HEg+ukLwRgLbI23Q2iCd7onrlKzvJAPFyNvXpN8DybAgk5jk0IXmCx4cF1Epy5tBFk8RiGsffoCMk/5AzS0yKn8nZLE+V6Q/8Ki8+VaJtxXkutOjjpjEGqFVYCN3x+yQt1UqG0uowtb3hEn7aWywqactLRZX+T2qAtK4kmKGolhZAhOAcKawvd+rXeL10IWXfpVzsNz80uwww0mi5KcJmwDgfPNvbFdvxhNZnhlJcf6LgMTVWJGrKOD1UOnxqK70PGSkENhWBs1Lc/KDUyry2Dmu5YBgzDDjdX3lujlOhAWNlvrBvrNICs+Ec6tRZunZXhmuTJuCsYf878+1FTEKcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz0+ek/5OT+Ga2JIPnZAGdXmGctqWtquMuq6G06OxRo=;
 b=GCGylxIFv/uz4If7bp+NOaW4GHnn49Mp5mof5oo/JDuoFXT1duEqqS7zLgL+uvnSGCUAYPJazviQKIFzReDryzbF3IIu2FNYwiwVK1VpSlhmwhSe37aNv5k2VVZXqC+SwGxI0VZud7BcR1aN8myoonTq+1eUIubjWJdT6S4nUUU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com (2603:10a6:803:c4::31)
 by PA4PR08MB6064.eurprd08.prod.outlook.com (2603:10a6:102:e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 16:55:31 +0000
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6]) by VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6%5]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 16:55:31 +0000
Message-ID: <7b032516-913f-87fa-eeb7-c38a8676465a@arm.com>
Date: Fri, 17 Mar 2023 16:55:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, gdb <gdb@gnu.org>,
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
 Omair Javaid <omair.javaid@linaro.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de> <87sfeclb8o.fsf@linaro.org>
 <CAFEAcA8SFtzMAFPaE=_CJtwXDYiJQ8rDWgEE+Nx2Qz=-FjCmMA@mail.gmail.com>
 <9bb8ab52-c6ae-95a7-e6c8-64bcce166c19@arm.com>
 <caf97353-d116-976c-72c7-953b0cad956c@arm.com>
 <CAFEAcA9WbEaCUXWcGT1+nj5u+zjWrm_+58X1-ZyrvUoeWcOdZQ@mail.gmail.com>
From: Luis Machado <luis.machado@arm.com>
In-Reply-To: <CAFEAcA9WbEaCUXWcGT1+nj5u+zjWrm_+58X1-ZyrvUoeWcOdZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SA9PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:806:21::21) To VI1PR08MB3919.eurprd08.prod.outlook.com
 (2603:10a6:803:c4::31)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3919:EE_|PA4PR08MB6064:EE_|DBAEUR03FT022:EE_|AS4PR08MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cd9c6dc-02bb-423b-921e-08db270870eb
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ru+CiS+u4/i4vJoediYJySr5cjkxnHoidsGSWU7ldrRTK8gFGT0swKlFu4Zv+msBlsRHxWarD9VevheKh9nhrzNW3UG5RBQAXdvSOpClzKnj89nHmyadJHUL5sNHap0x+t1+T+Q0bEsZQiwVKDtqQsogBl8pvguEzjzff/7vada7XEEb2wFGtkIp62jtEPRvabSxlPSPfAnYxZaZiPqlAvQLWhk8dn/8KfX7ESJT0CCZ7Olcv7omo6L/DP68782qEYQsbziIhewTVvR8+K7BkhHrdSUdFZ27T3l3WG91a2sPHG1sQvuIip8209Jo7STdFi7xTKf13VXIPQtqLFIeYFfvO8hAWF168GkMVH+9gEGuTULj+Gyr1u96jMmDyMmdE5G0i2AyoYdHW6im9woqX9FrwuCbYYgdlkQfwp3W2lwNaEp6bLkPTNFbt3oRU8G76j0g99WilXwEtYgwowLA1vYqg1tU+KwLql4SUaRx45m0dbBDZNViXdXW5TSXSx9meu5S0spS95gvjG8B+komzEjWedW9UjKavcUmvVQXp3sp4C6I00rPYEPelttqP2HlDwa7sc9gzFPW4m/ZlqWw/7c9jjh49PstllGm3BP/APxiQzuwePESrcFHXvmphqtxtQ8kFdx3T3x2yCZ5qPICd9qiSVyME1Rp/gS6lak/Z4pUrzZIo566JaR6EzAwnswyigRrxdBGB0b38BM5r2a00U0+hjuzOMTVa25uUS8Ijxay7TAJMRpAJEToWx3dZlfd8d8ysOcZ+YGV7gxrjL105A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199018)(6512007)(8676002)(6506007)(26005)(186003)(53546011)(83380400001)(31696002)(86362001)(36756003)(38100700002)(2616005)(4326008)(66946007)(66556008)(6916009)(316002)(54906003)(8936002)(44832011)(7416002)(5660300002)(31686004)(2906002)(41300700001)(6486002)(966005)(66476007)(6666004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6064
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Luis.Machado@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6f2062f8-bf0e-431a-b135-08db27086a9b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KeZcbmtUce8c3EyJ3Ov0l5CEXzRwztzOh9B1DLbwprlAmUJXXtgzIKgKp6SmZ+/e3qSzGkKI74xu8dDoJ7Sxst3RIDgUcgY9Oo331zgRFsRiJCntcrmTCvySZ0l5AEjGqYCHe7A4mHJWOK+40xeqrogjkDHzSMC1OlT3fdzveSdjx0RsxtTHSog8QpnPwNnFFEgvnhBCmZNq4dMhqD+cc0ql+17przWYL7CCSrQZSEYqPn5IJKuYZZeU7MmObtGHAuHU2F6bhpX/jfRGcFdqqtF8DiHTYal42Ql0KoeIEqxG9b+jSJAwzvUrzX5b7uWhLN8SSpAJC9vZ3l/oLGxBbRCMdaAQOtWx6SQmT/HrNeyfRqHWqXvhQDYr5yCLE9UZn5vSWJ7W1vrAVGmq0/jjEws80taqvf7Z63pcjuYKQs7mXGOaa57n7ORQyQssquCUTeafPQhE/FUhZd2UPvZgwcoHTPgczVwNXm/+Q6Qy/X2HsMhHd9Ue9h8O8w54Si5NDDcsKbG066gxtJLTG9s9tXel5PVjgK3FaNfFjq3caacbOtTi9wFetu9ZT0XuTQafSF5QZ1Yj+VqLteGcsKJm0VRc2LvfpzFnj3MUhHU11VVAE9Q4ZFP01M34USVyaxfQa878rXd2CSqCxdGW2zXIpvkTrTHU+f8QkI/Rq3GErzVhlU8dP72iKR3l32sy1YH3KOEg1XumL5IpLkL+GK5DY/w1gqgoI9m6dNFpkhpsDwyCJwo+2WMBPTJhjVcPy8yFpY2ML14LsZ4o4VVUZ82a0g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199018)(36840700001)(40470700004)(46966006)(186003)(26005)(6506007)(82740400003)(6512007)(53546011)(86362001)(31696002)(316002)(81166007)(54906003)(36860700001)(31686004)(6666004)(2906002)(2616005)(40460700003)(44832011)(36756003)(336012)(5660300002)(966005)(6486002)(40480700001)(450100002)(83380400001)(8936002)(478600001)(356005)(47076005)(82310400005)(41300700001)(6916009)(4326008)(8676002)(70586007)(70206006)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 16:55:41.0609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd9c6dc-02bb-423b-921e-08db270870eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8093
X-TUID: gX+6jxwG7ibR

On 3/17/23 16:37, Peter Maydell wrote:
> On Wed, 15 Mar 2023 at 09:51, Luis Machado <luis.machado@arm.com> wrote:
>> On 3/13/23 11:44, Luis Machado wrote:
>>> On 3/13/23 11:22, Peter Maydell via Gdb wrote:
>>>> Luis and I came up with two options:
>>>>
>>>> (1) leave QEMU outputting the pauth xml as-is, and tell people
>>>> whose gdb 12 crashes that they should upgrade to a newer gdb
>>>>
>>>> (2) make QEMU output the pauth info under a different XML namespace,
>>>> and tell people who need backtraces when pauth is enabled
>>>> that they should upgrade to a newer gdb
>>>>
>>>> Neither of these feel great, but on balance I guess 2 is better?
>>>>
>>>> Luis: I think that rather than doing (2) with a QEMU namespace,
>>>> we should define a gdb namespace for this. That makes it clear
>>>> that this is still a gdb-upstream-sanctioned way of exposing
>>>> the pauth registers.
>>>
>>> That should be fine as well, and would work to side-step the gdb 12 bug=
 so it doesn't crash.
>>>
>>> We could name the feature "org.gnu.gdb.aarch64.pauth_v2" or somesuch, a=
nd slowly stop using the original
>>> "org.gnu.gdb.aarch64.pauth" feature. I can document the requirements fo=
r a compliant pauth_v2.
>>>
>>> FYI, I've pushed a better documentation for the arm/aarch64 xml descrip=
tions here:
>>>
>>> https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dd7001b29=
e9f256dfc60acb481d9df8f91f2ee623
>>> https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommit;h=3De0994165=
d1b8469dfc27b09b62ac74862d535812
>
>> Just an update on this. I had a chat with Richard Henderson yesterday, a=
nd it might actually be easier and more convenient to backport
>> fixes to older gdb versions (at least gdb-12 and gdb-11, but gdb-10 and =
gdb-9 are also affected). This will ensure those won't crash when
>> they connect to a qemu that advertises the pauth feature.
>>
>> It also means we won't need qemu-side changes. My understanding is that =
we're close to the 8.0.0 release, and the code is already in place.
>
> Having run into this problem in another couple of situations, one of
> which involved gdb 10, I think I'm increasingly favouring option
> 2 here. The affected gdbs seem to be quite widely deployed, and
> the bug results in crashes even for users who didn't really
> care about pauth. So I'd rather we didn't release a QEMU 8.0
> which crashes these affected deployed gdbs.
>

Are the affected gdb's packaged by distros? If so, a backport the distros c=
an pick up
will solve this in a quick package update.

If we decide qemu should now emit a different xml for pauth, it will fix th=
e crashes, but it also
means older gdb's (9/10/11/12) will not be able to backtrace properly throu=
gh pauth-signed frames.

Maybe that's a reasonable drawback for qemu users?

If someone decides to implement a debugging stub that reports pauth (fast m=
odels, for example), it will
also crash gdb, so I still plan to do the backport anyway.

> So:
>   (a) if on the gdb side you can define (within the next week) a
> suitable new XML name you want QEMU to expose, we can commit a
> change to switch to that before we do the 8.0 release

pauth_v2 sounds about as good as any other for me.

>   (b) if that's too tight a timescale, we can commit a patch which
> just stops QEMU from exposing the pauth.xml, and we can come up
> with a better solution after 8.0 releases
>
> In fact, I think I'm going to submit a patch to do (b) for
> now and we can follow up with a patch for (a) if we want.
>
> thanks
> -- PMM

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
