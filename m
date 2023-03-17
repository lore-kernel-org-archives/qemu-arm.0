Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1087282ejb;
        Fri, 17 Mar 2023 10:13:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set8NnAocqdMccF9qasXPKLu4qDqhdI5FRMV+pwuIsft7a2i1+igiWYNWpvh+B3iPtmZLWKzf
X-Received: by 2002:a05:6402:1a33:b0:4ac:bd72:e7c5 with SMTP id be19-20020a0564021a3300b004acbd72e7c5mr4095013edb.20.1679073199279;
        Fri, 17 Mar 2023 10:13:19 -0700 (PDT)
Return-Path: <Luis.Machado@arm.com>
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20623.outbound.protection.outlook.com. [2a01:111:f400:fe1a::623])
        by mx.google.com with ESMTPS id t2-20020aa7d702000000b004acb5ff05e8si3205739edq.633.2023.03.17.10.13.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Mar 2023 10:13:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of luis.machado@arm.com designates 2a01:111:f400:fe1a::623 as permitted sender) client-ip=2a01:111:f400:fe1a::623;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=l7CDlT+q;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=l7CDlT+q;
       arc=fail (signature failed);
       spf=pass (google.com: domain of luis.machado@arm.com designates 2a01:111:f400:fe1a::623 as permitted sender) smtp.mailfrom=Luis.Machado@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9lY5FSmCPUpQkoE7dMB69Ky8NF2cTG7lJl4O5CU/H4=;
 b=l7CDlT+qzPZ/BezVbf04N94GWPrY9i/1HMLrHw5u1Gsdq1lNDjlVVhqyEEhcMMRY35GMS1vhuxZyfnHOv+hW3L6WKmAOsSpwTgVhba5s8Y75HIshwPiZwQGaSBacYRkD00edIjunHiGS6Wx5FKPsfE5Z1IlsCtiAgv1ikKMYvFo=
Received: from DBBPR09CA0043.eurprd09.prod.outlook.com (2603:10a6:10:d4::31)
 by PAWPR08MB8839.eurprd08.prod.outlook.com (2603:10a6:102:338::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 17:13:13 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::2) by DBBPR09CA0043.outlook.office365.com
 (2603:10a6:10:d4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35 via Frontend
 Transport; Fri, 17 Mar 2023 17:13:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.10 via Frontend Transport; Fri, 17 Mar 2023 17:13:13 +0000
Received: ("Tessian outbound fcd8b5fba459:v135"); Fri, 17 Mar 2023 17:13:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 56565e3684275e64
X-CR-MTA-TID: 64aa7808
Received: from d866bce00af4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 516C8E95-E52B-444D-8A76-37E0DF7B020D.1;
	Fri, 17 Mar 2023 17:13:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d866bce00af4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 17 Mar 2023 17:13:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0WpLVC/Y3fp2i4mpDwhdgzWfHrCu25CYe8FEXMUHMV0z6jdPc1eQZKhqL9VwkFuXXq0Aumfy+D4JLiKcm5KV0niSu4hB+WRLkxVcatx3RlWg4DycG8lGQCQyeluh2LDRHzfqhToa1YiBZ5OtLHGHAgOKTM+AI6LKVmcW2DVdZdtqG2vW1YzxY9u3a5nhDvRQgq719YEilE/8t8zgmy/n1EQhtJN3Y442XVklk55Yh0p3UPgmWf151t57MvlFoorem2r3F8aXeDbjtnWbXZtgWLq1Ge+UXbF6slUOnp1RqwldK6+Y2SxFlKAkqeD2eGqXwJQ4MrH0qIpPxf2HeDTtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9lY5FSmCPUpQkoE7dMB69Ky8NF2cTG7lJl4O5CU/H4=;
 b=LEjDrfQuauj6oQ08kczZCZV2jKbNr9X+16HObTdACwuAq06uO9M2zUS5a9V/zPvwM92JY+yX4BIF3/jmxCt+k16aazn9s91WLvndwRAS4hzGiJwEXhQKL+17lmomXrOwZFFUBFd+z00VdWILGxC7x4Qf6bnVMPNh+pxpDM5b2JEKqOCksIEjCJ2WARw7SASsj/pBJ05qga2si5zhEVdMuLnEDHAJABWNv0xAI1Y9mzg1NhtvihfcUGXFDpveF2wuCL4e4CK4+Iksy9eZi9wDauqL0Zs8c6UbILrxfrIsbIRhNmFz3QJsfSHMmla0wXG1qbqw6+OLnZ0gIFWiNt4dMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9lY5FSmCPUpQkoE7dMB69Ky8NF2cTG7lJl4O5CU/H4=;
 b=l7CDlT+qzPZ/BezVbf04N94GWPrY9i/1HMLrHw5u1Gsdq1lNDjlVVhqyEEhcMMRY35GMS1vhuxZyfnHOv+hW3L6WKmAOsSpwTgVhba5s8Y75HIshwPiZwQGaSBacYRkD00edIjunHiGS6Wx5FKPsfE5Z1IlsCtiAgv1ikKMYvFo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com (2603:10a6:803:c4::31)
 by GV1PR08MB8668.eurprd08.prod.outlook.com (2603:10a6:150:86::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Fri, 17 Mar
 2023 17:13:03 +0000
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6]) by VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::bced:32a3:b77e:90a6%5]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 17:13:03 +0000
Message-ID: <284bbdeb-f68c-a0fb-4bec-e000eeef771f@arm.com>
Date: Fri, 17 Mar 2023 17:12:48 +0000
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
 <7b032516-913f-87fa-eeb7-c38a8676465a@arm.com>
 <CAFEAcA8gDqrg3Hjv=0P-6m-bHytoHrYRSrrY1anu3gGZuQaL1Q@mail.gmail.com>
From: Luis Machado <luis.machado@arm.com>
In-Reply-To: <CAFEAcA8gDqrg3Hjv=0P-6m-bHytoHrYRSrrY1anu3gGZuQaL1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SA9PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:806:24::14) To VI1PR08MB3919.eurprd08.prod.outlook.com
 (2603:10a6:803:c4::31)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3919:EE_|GV1PR08MB8668:EE_|DBAEUR03FT040:EE_|PAWPR08MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: 121863ee-c6a0-42d5-9e27-08db270ae421
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /4nMitsfFX6UMeZTQdv66rcJ7ATkkeEgroH0xYexTYt7YuyIU/uZi1wPH4/YZWbGXEpqR2e9L78tiID75eI+EoTULOL+K4XDhIAFDhXb8HGheWVv+rPLeS1mpMCVyxdZ845IA24wy54fPwJFi2Ew/qqBHeW3vPHB4WYSsK0vndWItJuDr3/bctNzGGQlSV/8FEQlTMrH7fko6/10MN27AaBTXZ2+KV6P9VvqcFhUuYhj07BxuwT6DhJhii6tUJATsLbENSG3NBaMPDdZm/TKqicjvlmdVUIdlYwFHIWu2ax+4w0P3OeyJML06Rr1WWmB4oIC5XJ/XU3NGwR872qpy6RbjcMAt0432QoPRoDqBDUnxKlhBxOs9RJGRoxuqiTArX+CYIR8M7oXOYP/jy5X4EX4YFx+OZMGAYiiEnVy0RjM4PGlkH9pvgiqDkSED+UaGkPS5U2tA1JKBlueWaOP7pjfLzASojmTNHdcwmulhMiHTbCnYTZsqa0+WVGyuxvV24JOzDrk+AOTS/1HgP3UJ3Z5Zxgn0chD19TK576Z1bbXhkM388Lgha7MenzjirvLvHKD3DfRq6xUHW2FC8TM+OsPOsOU5Yf7mlbMquk7rttBj2lcCJhYA6X6aZDCI9LX5XQw5rVtvMFcywIc5XlBo56cxeS3lelYFQeDLO50LaF576vIECMakh4COi4KrExnT1k1FpHyhHlFaJQVvgo3FaithtZf02GC87D/jvMdEdE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199018)(41300700001)(54906003)(2616005)(86362001)(83380400001)(6486002)(4326008)(38100700002)(44832011)(8676002)(2906002)(6916009)(316002)(31696002)(5660300002)(66946007)(66556008)(7416002)(8936002)(36756003)(66476007)(186003)(6666004)(6506007)(6512007)(26005)(478600001)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8668
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Luis.Machado@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	61c87354-1cc5-4717-e2d0-08db270addb4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SJTFHM33go8Bbu8AXMpBIkRMpL6DtwwMmv8kzQwcDpYEzCA9d/9pg6MNM5DZSZw1fyXnnXAukFmoOBrFGJQVTNL66/DpdmQ9kLFFeoQUsOZYI5YWumzv+yVU84C4PBruATY9smHf+gsb+OCdU0hilcSaGuyjt3Xt2ICcnhoDPlZeKBy6j1ajg0gcPbqs5MtVntFLdqhbuhdu7G69NOqaga0gRD/4QzKMu3Urwd8qULun3n8jVXpCaWOiIw8cxq94j+NqjF2pSUwt4HaOILPBijfci/c31hyhsdFibJIMAG24HlITZHJgQWzQ9sVfFcri+De3x1md75d7IYIe2/z5nCfh3gficpdzmABDSJJdaFhRzEvI3MzGRcHzwL6qBxnSFOMQvfqdelHa7wsIu6agVTjkmsH8I8GkpHwL5S5VsxMjMmTs4K59FZ9nAP9t4n4a9zUp9f2JCEIvTwPhS65feBSwuEuVqGda66CrFQWdqqBULeSlq7x+XaDpeWBMKyJKyvjsgLWgbCxNj+KRWhqA2dkxbjt6zZj0ttbMl11ckvOw/yjd3J5rklENmRL3M+FNdXo2NZMZbmYXztS0H99P3eTIWRQFMXkXApHpJpOKj5GxlmoZWYKPihYTVzJCOB4XjyZAubC2IQwJu0x3cGYflIlSOLCK+/siHOQff3QPj/0sJRCkLNmoV85JNHsAuxkXgKORWOJm12DPo6QJBKDyJiVJZWt3s9C4uOZTWtxyI1A=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199018)(40470700004)(36840700001)(46966006)(6512007)(186003)(26005)(53546011)(6506007)(36860700001)(47076005)(83380400001)(40460700003)(356005)(31696002)(86362001)(40480700001)(81166007)(36756003)(82740400003)(6916009)(82310400005)(336012)(2616005)(70206006)(450100002)(4326008)(70586007)(316002)(31686004)(54906003)(44832011)(8936002)(5660300002)(2906002)(41300700001)(6486002)(8676002)(6666004)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 17:13:13.3465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 121863ee-c6a0-42d5-9e27-08db270ae421
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8839
X-TUID: W4MeIeZtIS78

On 3/17/23 17:07, Peter Maydell wrote:
> On Fri, 17 Mar 2023 at 16:55, Luis Machado <luis.machado@arm.com> wrote:
>> On 3/17/23 16:37, Peter Maydell wrote:
>>> Having run into this problem in another couple of situations, one of
>>> which involved gdb 10, I think I'm increasingly favouring option
>>> 2 here. The affected gdbs seem to be quite widely deployed, and
>>> the bug results in crashes even for users who didn't really
>>> care about pauth. So I'd rather we didn't release a QEMU 8.0
>>> which crashes these affected deployed gdbs.
>>>
>>
>> Are the affected gdb's packaged by distros? If so, a backport the distro=
s can pick up
>> will solve this in a quick package update.
>
> Yes, it's exactly because these gdbs are distro-packaged
> that I don't want QEMU to make them crash. I think it's
> going to take a long time for the fix to go into gdb branches
> and gdb to make a point release and distros to pick up that
> point release, and in the meantime that's a lot of crashing
> gdb bug reports that we're going to have to field.

Just to clarify, there won't be any point releases for gdb's 9/10/11/12.  W=
e might have a bug fix
release for gdb 13 though (which isn't affected).

>
>> If we decide qemu should now emit a different xml for pauth, it will fix=
 the crashes, but it also
>> means older gdb's (9/10/11/12) will not be able to backtrace properly th=
rough pauth-signed frames.
>>
>> Maybe that's a reasonable drawback for qemu users?
>
> "No backtrace through pauth frames" is the situation we've
> been in ever since we implemented pauth in 2019, so I think
> that's fine. It's not regressing something that used to work.
>

Fair enough.

>> If someone decides to implement a debugging stub that reports pauth (fas=
t models, for example), it will
>> also crash gdb, so I still plan to do the backport anyway.
>
> If you're backporting the fix, you could also backport the
> (hopefully tiny) change that says "treat pauth_v2 the same
> way we do pauth", and then users with an updated older
> gdb will also get working backtraces.

I can negotiate that as well, though it borders being a new feature.

>
> thanks
> -- PMM

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
