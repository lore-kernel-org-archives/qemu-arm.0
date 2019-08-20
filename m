Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4150095wrs;
        Tue, 20 Aug 2019 09:00:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxvg2y8oWVwJyLAIOMxVfpi1ZYetDocaCHqGFKc1uWDsaG1roBnM+jmvbuBaYex42uZ+r+Q
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr747601wmc.151.1566316802263;
        Tue, 20 Aug 2019 09:00:02 -0700 (PDT)
Return-Path: <Dave.Martin@arm.com>
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60047.outbound.protection.outlook.com. [40.107.6.47])
        by mx.google.com with ESMTPS id b1si14020747wrt.183.2019.08.20.09.00.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 09:00:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 40.107.6.47 as permitted sender) client-ip=40.107.6.47;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qKWzRUKG;
       dkim=neutral (body hash did not verify) header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=i05S9Ys7;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of dave.martin@arm.com designates 40.107.6.47 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsCeDAVbIoKbmJDBpdZti2ph5SwkFPEKentqQFAdU+o=;
 b=qKWzRUKGRHJ5ybzBmNv/pqL6a74y+YlKj2FUQ1koCM1ZRM+gYLJ6iVXW3mu9J2md+BFrPMjbLnPCz9JtERAgHu54tGTU22HfmoQ+yl1+cT3v8zltSqhjooMtxGDIOOvGPuOZaeBHPEYWB0cXoD6Jb+BH83j0t6avUiJ3zqd7OHo=
Received: from DB6PR0802CA0035.eurprd08.prod.outlook.com (2603:10a6:4:a3::21)
 by AM5PR0802MB2596.eurprd08.prod.outlook.com (2603:10a6:203:98::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Tue, 20 Aug
 2019 15:59:59 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by DB6PR0802CA0035.outlook.office365.com
 (2603:10a6:4:a3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Tue, 20 Aug 2019 15:59:59 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; linaro.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;linaro.org; dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 20 Aug 2019 15:59:57 +0000
Received: ("Tessian outbound 220137ab7b0b:v26"); Tue, 20 Aug 2019 15:59:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 503f4617b5acf5aa
X-CR-MTA-TID: 64aa7808
Received: from 102d090bd368.1 (cr-mta-lb-1.cr-mta-net [104.47.9.51])
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4069AB46-BCFA-466B-B714-E8920F25550C.1;
	Tue, 20 Aug 2019 15:59:52 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 102d090bd368.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
    Tue, 20 Aug 2019 15:59:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivFsd62YCWcibuufTWQGuQKOiUlzRDOn7gcmqPrD7JoMjRfP37/tZSig4HX0IAtrXfRNu98KwGG9eWY8oqaaUF1qFYx4etnFHmrPfjVjh7aooRzbjC1l8hhVUQA41N28JrbGyRGVqieK8le1zdMdikfMi90Ee7p9BGCivJij+g61Rdtbvcmtfx8Hvwj0SwlFbzSR+AG5XDXTU3bRQt+UqzTC++ZoUuTbmsL40mFRGONpjNEE1Z/U9S0+T5jRRK6iAwTIQ4hnDdgP3psQgBLtJdY34JlpqimPD5D0TlQMCgKIahqA4QRofXp4dJG4QKjGE/GjW+GPDR0KD8xn8MHoEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEp9Y2eHjpiXugIbkgtahQsu0lSImHYnTTH2iJTPArE=;
 b=Cef57ARCcyjvC1s/qqPfe0BzojompdrhBQo1lu7QjUbsFGdqKk68ZdRMjYUByp8PAdn/uOEQ4AbMNtMKfoHkKmNp/Ft3BincXQ2FoU3/+00wx4tvmuVcH3T4WNXiprJDlIBLjwqOzE+SVCuUrRIqqsaUoLa9vHW7G8NgXnUpwilVvK9dcz1bUmGYCu5Rru/4PF3t86QqpSn7EQ4mofWf+OfLW/tM2SzdO4VdlGeWDRGpGHC+uCjphP6/N7pO7SJAU+wxhLh5ZHOVr9LZh5UKmO0gTTqkSXSMb27+6HmRW9OqbytvDs3scDewmTlxoRvj5rgziCrgvXdBf6lZimmzWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEp9Y2eHjpiXugIbkgtahQsu0lSImHYnTTH2iJTPArE=;
 b=i05S9Ys7egecEJGr0twbhwsNXej3o7IP2JCmlyFmGnZPmBvq9fCbQzSH9OOHrxJh2a8d1dGnUXPosSh11Mw/XcaaF/Od6JzCuffTMoOkfVZz4rduXBUXhhoCY3sgyKklzqJ8VxldN7h9LmC6qI9CvH+ENWMXZg25PYpJ4GEyNR8=
Received: from AM0PR08MB5379.eurprd08.prod.outlook.com (52.132.213.13) by
 AM0PR08MB3556.eurprd08.prod.outlook.com (20.177.110.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 15:59:51 +0000
Received: from AM0PR08MB5379.eurprd08.prod.outlook.com
 ([fe80::54da:b409:a1af:2392]) by AM0PR08MB5379.eurprd08.prod.outlook.com
 ([fe80::54da:b409:a1af:2392%2]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 15:59:51 +0000
From: Dave P Martin <Dave.Martin@arm.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: Richard Henderson <richard.henderson@linaro.org>, QEMU Developers
	<qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v7 4/6] include/elf: Add defines related to GNU property
 notes for AArch64
Thread-Topic: [PATCH v7 4/6] include/elf: Add defines related to GNU property
 notes for AArch64
Thread-Index: AQHVSj+T+V3QkS1UA0Kt8m7gRHN496cERkeAgAAF0IA=
Date: Tue, 20 Aug 2019 15:59:51 +0000
Message-ID: <20190820155949.GB20949@e103592.cambridge.arm.com>
References: <20190803210803.5701-1-richard.henderson@linaro.org>
 <20190803210803.5701-5-richard.henderson@linaro.org>
 <CAFEAcA-_gMkE-0kA=xyUyNKxeqX0n6B-9i_7132xfFXQNRqb6w@mail.gmail.com>
In-Reply-To:
 <CAFEAcA-_gMkE-0kA=xyUyNKxeqX0n6B-9i_7132xfFXQNRqb6w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mutt/1.5.23 (2014-03-12)
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::30) To AM0PR08MB5379.eurprd08.prod.outlook.com
 (2603:10a6:208:181::13)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Dave.Martin@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 08ca3f91-a99f-4031-7a3d-08d725877345
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted:
 BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM0PR08MB3556;
X-MS-TrafficTypeDiagnostic: AM0PR08MB3556:|AM5PR0802MB2596:
X-MS-Exchange-PUrlCount: 3
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB2596D23614CE435EC4E1B3D7FEAB0@AM5PR0802MB2596.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 013568035E
X-Forefront-Antispam-Report-Untrusted:
 SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(189003)(199004)(66066001)(71190400001)(71200400001)(478600001)(99286004)(6916009)(256004)(14454004)(52116002)(33656002)(966005)(1076003)(25786009)(54906003)(4326008)(5660300002)(229853002)(58126008)(4744005)(316002)(6436002)(86362001)(6486002)(81166006)(66556008)(66476007)(64756008)(66446008)(305945005)(53936002)(486006)(6306002)(2906002)(6506007)(76176011)(7736002)(102836004)(6512007)(66946007)(6246003)(386003)(8936002)(446003)(81156014)(186003)(8676002)(26005)(11346002)(476003)(6116002)(3846002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB3556;H:AM0PR08MB5379.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original:
 8huHkHMwAv238V2RIOzYM69/N8K1MJ9/L/sF019JqPndBM94ccK3I6lLMr1KxtBbtYZKK6VBhBvvx4ZLbs+IqhT7WrZMRhOgnGohX6pDJnx/DzmmgNQgdswSYiR1FeudVhwNUqCoWeLbfBGyItsb1Os70k4lD0z/jckubw68L5bBdsk6BQoFXhM350nzlNqAoXjfYoDjPAB9eecC8AxfwM/UkZd3+28msOMPsMXWudkdAM9m2eriz0qOgLYZo3nDMQGc42CJlwPrJAlFClCr17O1HL3u8pPvaUNxBPbxTnW2DyBXvluvmjzGXU7L5otzH6voAPitYxI2Rp4Ll4MZnjDlBVtusbvt1DRKFFLNQl279lMcrBKS655v9u1RgaVGEmUDPjb8aV6t8T2hrL/dOL0neqoCHiYSVHPPiu1Cono=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <649227F448A7B24FAD63EB85A8165C9D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3556
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Dave.Martin@arm.com; 
Return-Path: Dave.Martin@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(2980300002)(199004)(40434004)(189003)(76176011)(2906002)(76130400001)(66066001)(50466002)(186003)(1076003)(54906003)(58126008)(8676002)(5660300002)(6512007)(8936002)(8746002)(966005)(478600001)(47776003)(6486002)(5024004)(81156014)(81166006)(229853002)(6306002)(36906005)(316002)(26005)(23756003)(14444005)(6506007)(386003)(33656002)(356004)(102836004)(6916009)(476003)(126002)(6116002)(3846002)(7736002)(486006)(305945005)(63370400001)(63350400001)(26826003)(446003)(86362001)(99286004)(450100002)(70206006)(22756006)(70586007)(6246003)(25786009)(336012)(14454004)(11346002)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR0802MB2596;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:TempError;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b7c4e86-333f-49b2-9dd8-08d725876f00
X-Microsoft-Antispam:
	BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM5PR0802MB2596;
X-Forefront-PRVS: 013568035E
X-Microsoft-Antispam-Message-Info:
	UgtQcKNdIAVULkeI0HCOziQW+p4eUyP3XfXLX0uy3c7KrvrOilx9jbxZqNkzrgXZ7ezVPhm+wrKZiMCR8yXqm/P6c/Zepg+d5Mwq17CBLING3OqY1zOJ6zYXyX10GXKhA4CAONeF8BRZCTVQcYwu/Uv2BZPMzNWrqGmL5/zZxcmB982cSA5YLC6f+vEJkBp/+nF/9U08hINMbrKWAcoZkY+vz0+pFaULAscR9dgeuAjpjWoKzZ4XRl7ghqpdZrX5S4wDXTIEZ0wfpLkZ02qQrvF9rpNeoLgoDpp+cW/1JjyKuqhB2Ck2blSgCIeoxBk6OORXmDvdtlZfmdt5PiGSssQzuvJLL/VrDnGLgXsaIluOmTjYqr4GjHYnhTFVS89hI5KrxNJ+ea1GeCp8MFLw5jlK2hiIYCeczc3m/+flKxg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2019 15:59:57.9469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ca3f91-a99f-4031-7a3d-08d725877345
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2596
X-TUID: h8LznarZvwRm

On Tue, Aug 20, 2019 at 04:39:01PM +0100, Peter Maydell wrote:
> On Sat, 3 Aug 2019 at 22:08, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > These are all of the defines required to parse
> > GNU_PROPERTY_AARCH64_FEATURE_1_AND, copied from binutils.
> > Other missing defines related to other GNU program headers
> > and notes are elided for now.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> What's the authoritative source for these definitions? I
> tried looking in glibc, binutils and the kernel without
> any luck.

For the kernel, additions to the user elf.h are still under
discussion. [3]

For the relevant draft ELF/ABI specs, see [1], [2].

Cheers
---Dave


[1] https://github.com/hjl-tools/linux-abi/wiki/linux-abi-draft.pdf
[2] https://github.com/hjl-tools/x86-psABI/wiki/x86-64-psABI-draft.pdf

[3] [PATCH v8 22/27] binfmt_elf: Extract .note.gnu.property from an ELF fil=
e
https://lore.kernel.org/lkml/20190813205225.12032-23-yu-cheng.yu@intel.com/
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
