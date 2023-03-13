Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169910ejb;
        Mon, 13 Mar 2023 04:44:59 -0700 (PDT)
X-Google-Smtp-Source: AK7set/6mBasWnY4btn8jOz2OoKIsWHrc9/KXXkVMdrDBRy0X29nvRriV3uXk4fnGNg3OUCLAs8P
X-Received: by 2002:a17:907:9721:b0:8b1:9e47:9101 with SMTP id jg33-20020a170907972100b008b19e479101mr41292792ejc.12.1678707899329;
        Mon, 13 Mar 2023 04:44:59 -0700 (PDT)
Return-Path: <Luis.Machado@arm.com>
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0616.outbound.protection.outlook.com. [2a01:111:f400:fe0d::616])
        by mx.google.com with ESMTPS id z5-20020a170906074500b008cc615ffc40si3369634ejb.797.2023.03.13.04.44.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Mar 2023 04:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of luis.machado@arm.com designates 2a01:111:f400:fe0d::616 as permitted sender) client-ip=2a01:111:f400:fe0d::616;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EkCMLQsm;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EkCMLQsm;
       arc=fail (signature failed);
       spf=pass (google.com: domain of luis.machado@arm.com designates 2a01:111:f400:fe0d::616 as permitted sender) smtp.mailfrom=Luis.Machado@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ku6HypoQwXLTKAhEAAf9UzH2uM1f3VRT0NT6bX76VmU=;
 b=EkCMLQsm541IooImTuEP1EUNmiLHT6kM813DZ7cHx50P0XtbFHZGxoXWub1tI9TMl44ZR9bBno7pYkDB6MBV95DjJjOs1z4EniAKpyHNKljnBtfTav65YSurUnEC2BlITmXApvEGxtTRiY6ItoaYIPYAb7Zf9KeNctvZjmWEH9A=
Received: from DUZPR01CA0086.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::13) by DB9PR08MB6569.eurprd08.prod.outlook.com
 (2603:10a6:10:261::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 11:44:54 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46a:cafe::99) by DUZPR01CA0086.outlook.office365.com
 (2603:10a6:10:46a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 11:44:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Mon, 13 Mar 2023 11:44:54 +0000
Received: ("Tessian outbound c2bcb4c18c29:v135"); Mon, 13 Mar 2023 11:44:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 976965ed58d1f430
X-CR-MTA-TID: 64aa7808
Received: from b6d81f0ba347.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5A71A672-9FAC-48D7-84AA-03000C9A72AB.1;
	Mon, 13 Mar 2023 11:44:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b6d81f0ba347.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 13 Mar 2023 11:44:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huQKVoO0+AINpf7FPsiyORj4uMln9Yj06Ki4WmdTvLi/wi5AOiuSsCQ9wd3UN/ryHcWlF0njiJ7l5puxsfIjgk1wD1uNUBOL/nTmsK4jO0agogZJyYrA0rCCvvy8z/rmu22ZI3bxJ0ZnWZtjBT9BrQwjtVMdgveYvyJetLq/hDP8A/nxciZLegBc/oBjLUNLbsPoD1bT08u85zBcgGI3SCXuJZu1VrubFzbKWONQDon0Ez89fPgGbqA4i/8U4xqrQ2D/BfpuJwgEfJUKSQFF75r/PrbiBq2QcX8g6qxVlYqw+e8sWL0CepZqEIIetQbU0a1rs8V8w6nGqNJooUvZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ku6HypoQwXLTKAhEAAf9UzH2uM1f3VRT0NT6bX76VmU=;
 b=eI9+evIcuLGYSPl8L2i+GkGsv0R0bTpsOUVx514WdhOqjn+1CxOtilipbdCurEEOuxgMzuo+ofGo54gGaa27r6osCfNU/To919P8k2LSrsQkBudzDGi8pd9SWChrjdo9yrOAI6jOY9QU6aeTgAbgT6PY5X80KuxsBqC0hR7MJp7Lb8+x0d6zQZMS6vQQbg3fyyk38kLbxmHwHIpbNbelv+A1iaHlft8b8/ppP8YWD+rwFPtVap5kyQQ1JQB2TqlCSn39p3gszZxOxgxfDrWNY8NVRZLXe/Nb/QatNYZv2kUP18Z1cfvnMRByHo7WeOUzrK9OHL+lHT0+IUydrkhI6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ku6HypoQwXLTKAhEAAf9UzH2uM1f3VRT0NT6bX76VmU=;
 b=EkCMLQsm541IooImTuEP1EUNmiLHT6kM813DZ7cHx50P0XtbFHZGxoXWub1tI9TMl44ZR9bBno7pYkDB6MBV95DjJjOs1z4EniAKpyHNKljnBtfTav65YSurUnEC2BlITmXApvEGxtTRiY6ItoaYIPYAb7Zf9KeNctvZjmWEH9A=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com (2603:10a6:803:c4::31)
 by AS4PR08MB7502.eurprd08.prod.outlook.com (2603:10a6:20b:4e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 11:44:41 +0000
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6]) by VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6%3]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 11:44:41 +0000
Message-ID: <9bb8ab52-c6ae-95a7-e6c8-64bcce166c19@arm.com>
Date: Mon, 13 Mar 2023 11:44:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
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
From: Luis Machado <luis.machado@arm.com>
In-Reply-To: <CAFEAcA8SFtzMAFPaE=_CJtwXDYiJQ8rDWgEE+Nx2Qz=-FjCmMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SA9PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:806:21::35) To VI1PR08MB3919.eurprd08.prod.outlook.com
 (2603:10a6:803:c4::31)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3919:EE_|AS4PR08MB7502:EE_|DBAEUR03FT030:EE_|DB9PR08MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 017ad4eb-846c-4837-3844-08db23b85d31
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fKkoeMs1X6itUYkAdMCp+O1wKj2XRtgCDnhrYf4kCIpduyVPT/aX1ZHQYyheywr4W7rPAeg5kVgeuAjXPAdvIBShPsRYOssYVm9vaTpXoXAd4U2UN2ob+Wws4iZHC64ut+ETD4zBweSkWuBUegaF4/99PxQITsvIBbL6i8dzf60w8/Tum5hFlw7DXDIg+LlF8NkqQKJyMt8o2g3UBZ6wifAKOPooD6Exf7RDSTZln3jxDQhObhkWoebrCoZYI4UvmuiQH69TpiJx4Gmt7myoWsVxDCk7fjgRxjam/XPC0f1mhXLBb9saZ6r3LtS1cUT8eHNbai/9ShQ6cgHMwcVzeGi1xGDtwGy0xIFKjpYWTYFK5HMUmXTiy6UhKfdvjX7P15auzSrE4/bx1jQTZ40GxypxIZoIIMs3FHmwLB14uiejGplLY5yr0ypSPA3raYWaOu5ZF+KFXCFW4OS5FbbJGYjbPbV4V5chli0cZ8/60m52qebRc3TUQ8/w5Kb2lw0qj0DCauT9cei2KdRYvsgjET+HHLfPC1vbS0fYA+Hm+NQHRXwvlWknWR2kPAtd8J3pH6k8dosIangIC1NerZiT2XIKjZxFCueOmkRwhdeO9TyT7wq9wXUu5i4k/56dNng48tK6FYzfGU9HoK2z+cT+ycsiM/w0vFxdzUq9RbJdeV1HNJEBwEkG7eojNDot8zU0dnVubM4LKPmKlQFH3Lhb4+7Mm2djgsOi6uwixqoSQr0rroQGqDG9PbwGxVRY9Jc2
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199018)(31696002)(86362001)(36756003)(38100700002)(8676002)(4326008)(66556008)(66476007)(66946007)(8936002)(54906003)(110136005)(41300700001)(478600001)(316002)(6506007)(7416002)(5660300002)(44832011)(2906002)(66574015)(2616005)(83380400001)(6486002)(186003)(6666004)(6512007)(26005)(53546011)(966005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7502
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Luis.Machado@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	350a1288-b8c8-46a4-dc27-08db23b854d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K8mt5ZcjGDswzILBCrVqPYuTb5NUL+ClpwxI80kTu6O0zQRBKDIDZoTIh1pFShKSwh6tDTy15IlV1me46Gg44EH7Tfz24/uvmgL06FCJbHhYbA0TayIQj1q79aDeP1Dzp5OicwSz2dFMYgIa1oVVgip0yGOtpkAdeQD1DGnXzM/rqvQrR75HA9+bMaKnBmoSc78L9VltMQAkhItlYmrXU4NyXUfwk+Exiat11OOS6F/IzpJMLbVqmlWpx6bT6yR1rUK93hW+2pWPNnXcyNfFMTs7MIae8EY7NoLh+4VCEuSj/wQJuqJbCqGC3mLKIY+YpkpTVaHXToPbnxyVjILvGN1lPVua347tvw9qbGbtgbDd4Z4Igz9Q39tOoK5SlDMKUG9xGjY6ZCDioASKWXKYS4cwNqaDwfaeOXrGvcD2CwkHXn5eQvf3fWYFnNrsxlsf3IUg5tE08HS0IMTKYaDbgsuX2028m2qvowPui4XeaOzVNg76S9Ijf4741F3EAB/xYOT+H6Y9uY/eYbXdxW4DkqbTMRCQ6f20eFrVkDmV8LgEnsU/KHOE5RThNghRxM7Nt0oaOc1nt13yL94xSeYUJebj+EeG3aRCwSeZYiPd6BKpj8lZkx20+JGGUixQ6aD2J7OUQYtGjjidMFYtCUIlF8aN5gqHD4uEvZG0+GOjIvQtg/rbW03sm73nH+m1nAeji7YtX81HL8F8tf6dogpcfVBdnuSrKcI0C+sKP41D08DgP+I75/KLapQXDmNUVKrnmPp7aWtVm725QrWpgcBBPQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199018)(46966006)(40470700004)(36840700001)(5660300002)(36756003)(40460700003)(44832011)(83380400001)(47076005)(66574015)(186003)(478600001)(82310400005)(6512007)(26005)(6666004)(6506007)(966005)(6486002)(2616005)(53546011)(336012)(356005)(40480700001)(450100002)(8676002)(70586007)(70206006)(4326008)(41300700001)(8936002)(86362001)(31696002)(54906003)(110136005)(316002)(36860700001)(81166007)(31686004)(82740400003)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 11:44:54.7362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 017ad4eb-846c-4837-3844-08db23b85d31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6569
X-TUID: sDFSD4NHW8VN

On 3/13/23 11:22, Peter Maydell via Gdb wrote:
> On Fri, 10 Mar 2023 at 18:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> (adding some more gdb types to CC)
>>
>> Fabiano Rosas <farosas@suse.de> writes:
>>
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>>> On Fri, 10 Mar 2023 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>>>>>
>>>>> You need a very new gdb to be able to run with pauth support otherwis=
e
>>>>> your likely to hit asserts and aborts. Disable pauth for now until we
>>>>> can properly probe support in gdb.
>>>>>
>>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>
>>>> If it makes gdb fall over, then shouldn't we be disabling
>>>> the pauth gdbstub stuff entirely ? Otherwise even if our
>>>> tests are fine our users will not be...
>>>>
>>>
>>> Have you seem my message on IRC about changing the feature name in the
>>> XML? I think the issue is that we're putting the .xml in a "namespace"
>>> where GDB expects to only find stuff which it has code to
>>> support. Changing from "org.gnu.gdb.aarch64.pauth" to
>>> "org.qemu.aarch64.pauth" made it stop crashing and I can read the
>>> registers just fine.
>>
>> That would work, although I would prefer to probe support so we can use
>> the official namespace.
>
> I don't think there's a way to probe for this problem. I spoke
> to Luis about this, and apparently it's a bug in how gdb handles
> the pauth XML description (fixed in gdb commit 1ba3a3222039eb25).
> A gdb without any pauth support at all will be fine; a gdb with
> the bug will report that it has pauth support but will crash
> if you feed it the whole set of XML that QEMU has; a gdb
> with the bug fixed will also report pauth support but won't crash.
> (The bug only manifests if the full XML includes registers that GDB
> doesn't care about, like the system registers; if the stub sends
> only registers GDB knows about then it won't crash.)
>
> Luis and I came up with two options:
>
> (1) leave QEMU outputting the pauth xml as-is, and tell people
> whose gdb 12 crashes that they should upgrade to a newer gdb
>
> (2) make QEMU output the pauth info under a different XML namespace,
> and tell people who need backtraces when pauth is enabled
> that they should upgrade to a newer gdb
>
> Neither of these feel great, but on balance I guess 2 is better?
>
> Luis: I think that rather than doing (2) with a QEMU namespace,
> we should define a gdb namespace for this. That makes it clear
> that this is still a gdb-upstream-sanctioned way of exposing
> the pauth registers.

That should be fine as well, and would work to side-step the gdb 12 bug so =
it doesn't crash.

We could name the feature "org.gnu.gdb.aarch64.pauth_v2" or somesuch, and s=
lowly stop using the original
"org.gnu.gdb.aarch64.pauth" feature. I can document the requirements for a =
compliant pauth_v2.

FYI, I've pushed a better documentation for the arm/aarch64 xml description=
s here:

https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dd7001b29e9f2=
56dfc60acb481d9df8f91f2ee623
https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommit;h=3De0994165d1b8=
469dfc27b09b62ac74862d535812

>
> thanks
> -- PMM

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
