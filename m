Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp2329149ejb;
        Wed, 15 Mar 2023 02:51:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set+/HcnouzvEZmszo56+KfzyTrajYEETUr20T54GpoQzDTSHWZDSPmHe64gnkkhUUGS34um8
X-Received: by 2002:a17:906:f57:b0:92b:c56a:7efe with SMTP id h23-20020a1709060f5700b0092bc56a7efemr4676388ejj.31.1678873876103;
        Wed, 15 Mar 2023 02:51:16 -0700 (PDT)
Return-Path: <Luis.Machado@arm.com>
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on060e.outbound.protection.outlook.com. [2a01:111:f400:fe0e::60e])
        by mx.google.com with ESMTPS id qk14-20020a170906d9ce00b008c797d4010esi4991829ejb.1005.2023.03.15.02.51.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Mar 2023 02:51:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of luis.machado@arm.com designates 2a01:111:f400:fe0e::60e as permitted sender) client-ip=2a01:111:f400:fe0e::60e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EL2BeUJ6;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EL2BeUJ6;
       arc=fail (signature failed);
       spf=pass (google.com: domain of luis.machado@arm.com designates 2a01:111:f400:fe0e::60e as permitted sender) smtp.mailfrom=Luis.Machado@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7c/7EbXwchH9wq6WNQh+np++izqeBIbXb8s8smBfEG8=;
 b=EL2BeUJ6+hHmDQ/Vz79tH6r8diYXPwiru5K7GjrF0A4magn8L4xW78yz8Hk5rVMvw+LqMn7Jz2SSUaeWfryM4/g0k98IaTchJhIprjP0tS1QwKALtQSI/YlDcsSZmB4kBVN2w2+YN+MkAW5+gOaKE0aNsEdE23gzn/b4ALBXWFc=
Received: from AM5PR0402CA0011.eurprd04.prod.outlook.com
 (2603:10a6:203:90::21) by AM8PR08MB6530.eurprd08.prod.outlook.com
 (2603:10a6:20b:315::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 09:51:04 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::8e) by AM5PR0402CA0011.outlook.office365.com
 (2603:10a6:203:90::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Wed, 15 Mar 2023 09:51:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Wed, 15 Mar 2023 09:51:03 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135"); Wed, 15 Mar 2023 09:51:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5d2b714c197a7248
X-CR-MTA-TID: 64aa7808
Received: from 62ecc6f7c5a9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 64145900-6570-431C-AF03-353FA2F778FA.1;
	Wed, 15 Mar 2023 09:50:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 62ecc6f7c5a9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 15 Mar 2023 09:50:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0z/P9CTyCY34Fd8ZXlFh7v1fwBsHTQMyaYQRD0kU8dmU2FfILDm1JOUujHAWcO6cXZx0cQ9z01+VM6oteKhLl2AJwHvGgJbVIOXp9A7MwCXTqE3JALemJkhJnMRAdRD+Bc2FZ+faUNDSNmrZ3LhgEckAHztecuQOintCU12kilt/eKw4XVuvjGc7gumudpfFhvf7QUjF9LLwz+dZPwoQ+FisY/HcvsT0XWr/XrDLJ/ch/kZsgWbf4CGhQHIPDbka4y50hX9ivLoH6VVHbT+TgyrIuGyjJPM1PuHnMBSKkW7OrG0EXktpA6chHGxhmS8ovCLprn7pt3aKEiuiE9auw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7c/7EbXwchH9wq6WNQh+np++izqeBIbXb8s8smBfEG8=;
 b=JS6izvEPwkx9JBofSiIvz4NAROjn2dteqgkxKQ1lsbRU9cSLFwHEhX4332aNa0IyJT4oRibjnC84r/QvRrtX1za81E8QjFLF6vFRivJrOyOLJRXQiP62t0aH8nyRFB/HGVFMgOVi93L1c3sZy5X5j+wH+5vzYgS70DEFjdJOcVuT5W2iPX8kBKq9OcDgMEdiylWvEoHkDyv18xAIjMP3/cORi0cybe0+yZ2iM048qPGGOKTMIwdbDey2Fj2dwsBgFUujZHMLVUXX7zlwP0p7eRNuoiPpXIOA9vKOomn5udIYDDr190unS/FjF92M/qI6krBtJ9t7zJz2hnG/Atc6LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7c/7EbXwchH9wq6WNQh+np++izqeBIbXb8s8smBfEG8=;
 b=EL2BeUJ6+hHmDQ/Vz79tH6r8diYXPwiru5K7GjrF0A4magn8L4xW78yz8Hk5rVMvw+LqMn7Jz2SSUaeWfryM4/g0k98IaTchJhIprjP0tS1QwKALtQSI/YlDcsSZmB4kBVN2w2+YN+MkAW5+gOaKE0aNsEdE23gzn/b4ALBXWFc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com (2603:10a6:803:c4::31)
 by AS8PR08MB8273.eurprd08.prod.outlook.com (2603:10a6:20b:537::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 09:50:55 +0000
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6]) by VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6%3]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 09:50:53 +0000
Message-ID: <caf97353-d116-976c-72c7-953b0cad956c@arm.com>
Date: Wed, 15 Mar 2023 09:50:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
Content-Language: en-US
From: Luis Machado <luis.machado@arm.com>
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
 <9bb8ab52-c6ae-95a7-e6c8-64bcce166c19@arm.com>
In-Reply-To: <9bb8ab52-c6ae-95a7-e6c8-64bcce166c19@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DM6PR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:5:14c::14) To VI1PR08MB3919.eurprd08.prod.outlook.com
 (2603:10a6:803:c4::31)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3919:EE_|AS8PR08MB8273:EE_|AM7EUR03FT027:EE_|AM8PR08MB6530:EE_
X-MS-Office365-Filtering-Correlation-Id: bab6b107-8bdd-4c1f-c9fb-08db253aca98
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KyLy+E/10ZRZvgL81p3Ix/R02SM8rMJ70x9UvWAnLb3Hg0r7PJAm39yfW+5WwZz1dLbAsHQG4xkbdmsWPQ9jFPX7Gwaklgu6B9BvNtZffjMTSCmNNO4StZzW2INB/ZVxjTJKn6n1nlfkWl4mmNGmi3tDx6EyNKzebyDjaZUcdq04Jj6fUHPGE4YOa7UxytoiGi9Muen4tJz08nfGC2/X5ce1+2JMPokaW+L+POGeHvc2W4mWcK7wMYAJ89Hprcb/tT7P5XdTdGYTjDjLtXyolT7HsLYPcecCl+RkW3J4iXDE6zftCTPfd8yVM7RB5noFwozp24rdEaQc9Htvd/Zmh+nr12oxGxfTG6JE3RgLJA2RP0ANnCEJkhC6DpX36FViAbDZBf+SHWJfG4ug6YyCBouWV/VZrLDz4VOUjo+LA6QsoFRjgx/fga2DbRbIwggatQeutqrl5sh+DYngH0lK3SGVQfd6aJ5aLtBFYSSP1CXyZW9nMDUZgyJEaRaEjuVQ7vWUqBKSwdz8on6MoF1p/VaFzA0Au28MXr89GZOtnDvX2lDHl5xfCi0Y0WMlMyyGQC1aca1fABi4Ay28uFIGSSI1LVilbrdZGFHxju9bF1MvYc7FgQwLBP5dzfOT4S6NMiRD67m6sjt+n7fCwd5tMAbRF1hLvHWHFo8Im7ImYFzsnvT9XeFjCQB04g5MY+aov3JgXrrfcSiGFc4LHsW9uvlT5GbrAp25OzT4el7zCPjRySWP1DmsaiCqqHj4YyOJsl92JrbdN0z+HyIO02fVPQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199018)(2906002)(53546011)(83380400001)(31686004)(6486002)(8936002)(966005)(26005)(6512007)(6506007)(44832011)(36756003)(6666004)(5660300002)(2616005)(54906003)(316002)(186003)(66574015)(86362001)(31696002)(41300700001)(8676002)(66556008)(66946007)(38100700002)(66476007)(7416002)(478600001)(110136005)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8273
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Luis.Machado@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c38c480-ddf5-40f1-e8e1-08db253ac3f4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8/qtEnbHOuFjRQQ0KFbDjEgDXYxozILAffbJmTLPGrv88QyaakJ/hnrbiDQ2wnrb9QdT9EfYxVOpTzK7kN+Y+dpvdQsP8pE44XZ4YOerJtGyXhT65xCIQhuagBdK0YZxjbGjSlIpwYIeQJbQlxWBvuzfy5mMj7ABghDChenJ2DcuxmtpbiOe6YZjI5VBZh72N0+/IhVmuGdCufDVYV0psg9s4pzaMISpSNpfGGq3G4LchEdeFTcKnybTnnGAXcJDZtnBBAJLI9ktlRBsmY7Vo+QuYYIf/8/REuPl5eWnVqsF4iNdHbE5T0l+XIKJyz2GGXFkIihsnTJdC0N3QgmTK7e9S/WpzwPVXZ6eTAh0mVue4BWNm/j6WUILw3Ek8L7LutOKBpkUriw80l6q6ZnWGpMCtWix0zTsrqONGmD9jR3kidf6/NgJ7EGkDgIvZIiFk7TPXFNgg314d/gXVfrAqPTWYhPIaxVuwqdc/ZmqpiwMLtY9PjlTiGQTqqYLn/zs8IdkgrjKP5ZmA1mkDXzOch0TPvhxLYympEAA2wqq2FRHTW/4qQZw3LrnseMSFpnVwb77BTRpLub14dWDq9FkySKCb1X4CBrvQZNrgfnx4CrOXgxQjz9glqwslNkimFbyWBXe+BPR2uo0r7iCZYfSiQ2qC1JYWod4BeAtDHPyCm8Cb27sFY/WV+n/ehWYxkGI5yQdB/zfuRb0BVnGvoob7GNjSEu6He938Rc9zIT+UY0x3aXYKpuYYqAY8Mp5U8zX0PBoNY31znwyu+EoB4198A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(356005)(31696002)(86362001)(36860700001)(36756003)(82740400003)(81166007)(41300700001)(2906002)(44832011)(8936002)(5660300002)(40480700001)(4326008)(82310400005)(40460700003)(186003)(2616005)(6512007)(26005)(53546011)(6506007)(66574015)(83380400001)(47076005)(316002)(336012)(54906003)(110136005)(8676002)(450100002)(70206006)(6666004)(966005)(6486002)(478600001)(70586007)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 09:51:03.8680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bab6b107-8bdd-4c1f-c9fb-08db253aca98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6530
X-TUID: 7A//mE/iUJV6

Hi,

On 3/13/23 11:44, Luis Machado wrote:
> On 3/13/23 11:22, Peter Maydell via Gdb wrote:
>> On Fri, 10 Mar 2023 at 18:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>>
>>>
>>> (adding some more gdb types to CC)
>>>
>>> Fabiano Rosas <farosas@suse.de> writes:
>>>
>>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>>
>>>>> On Fri, 10 Mar 2023 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
>>>>>>
>>>>>> You need a very new gdb to be able to run with pauth support otherwi=
se
>>>>>> your likely to hit asserts and aborts. Disable pauth for now until w=
e
>>>>>> can properly probe support in gdb.
>>>>>>
>>>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>>
>>>>> If it makes gdb fall over, then shouldn't we be disabling
>>>>> the pauth gdbstub stuff entirely ? Otherwise even if our
>>>>> tests are fine our users will not be...
>>>>>
>>>>
>>>> Have you seem my message on IRC about changing the feature name in the
>>>> XML? I think the issue is that we're putting the .xml in a "namespace"
>>>> where GDB expects to only find stuff which it has code to
>>>> support. Changing from "org.gnu.gdb.aarch64.pauth" to
>>>> "org.qemu.aarch64.pauth" made it stop crashing and I can read the
>>>> registers just fine.
>>>
>>> That would work, although I would prefer to probe support so we can use
>>> the official namespace.
>>
>> I don't think there's a way to probe for this problem. I spoke
>> to Luis about this, and apparently it's a bug in how gdb handles
>> the pauth XML description (fixed in gdb commit 1ba3a3222039eb25).
>> A gdb without any pauth support at all will be fine; a gdb with
>> the bug will report that it has pauth support but will crash
>> if you feed it the whole set of XML that QEMU has; a gdb
>> with the bug fixed will also report pauth support but won't crash.
>> (The bug only manifests if the full XML includes registers that GDB
>> doesn't care about, like the system registers; if the stub sends
>> only registers GDB knows about then it won't crash.)
>>
>> Luis and I came up with two options:
>>
>> (1) leave QEMU outputting the pauth xml as-is, and tell people
>> whose gdb 12 crashes that they should upgrade to a newer gdb
>>
>> (2) make QEMU output the pauth info under a different XML namespace,
>> and tell people who need backtraces when pauth is enabled
>> that they should upgrade to a newer gdb
>>
>> Neither of these feel great, but on balance I guess 2 is better?
>>
>> Luis: I think that rather than doing (2) with a QEMU namespace,
>> we should define a gdb namespace for this. That makes it clear
>> that this is still a gdb-upstream-sanctioned way of exposing
>> the pauth registers.
>
> That should be fine as well, and would work to side-step the gdb 12 bug s=
o it doesn't crash.
>
> We could name the feature "org.gnu.gdb.aarch64.pauth_v2" or somesuch, and=
 slowly stop using the original
> "org.gnu.gdb.aarch64.pauth" feature. I can document the requirements for =
a compliant pauth_v2.
>
> FYI, I've pushed a better documentation for the arm/aarch64 xml descripti=
ons here:
>
> https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dd7001b29e9=
f256dfc60acb481d9df8f91f2ee623
> https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommit;h=3De0994165d1=
b8469dfc27b09b62ac74862d535812
>
>>
>> thanks
>> -- PMM
>

Just an update on this. I had a chat with Richard Henderson yesterday, and =
it might actually be easier and more convenient to backport
fixes to older gdb versions (at least gdb-12 and gdb-11, but gdb-10 and gdb=
-9 are also affected). This will ensure those won't crash when
they connect to a qemu that advertises the pauth feature.

It also means we won't need qemu-side changes. My understanding is that we'=
re close to the 8.0.0 release, and the code is already in place.
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
