Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11782604wrv;
        Fri, 26 Jul 2019 04:16:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwe4LebJ8zk+fxSSCYEOPFNAewsEAwr1dlNeUMKQZ76+Ea7EIiojZvj5IK4IOud7MoJ24RM
X-Received: by 2002:a37:4986:: with SMTP id w128mr60994153qka.417.1564139818704;
        Fri, 26 Jul 2019 04:16:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g33si34411355qtb.145.2019.07.26.04.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 04:16:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@wavecomp.com header.s=selector1 header.b=AYo+YQv6;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqyDT-0005lw-Os
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 07:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46354)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <amarkovic@wavecomp.com>) id 1hqyDN-0005Uk-HN
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 07:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <amarkovic@wavecomp.com>) id 1hqyDL-0003ZV-En
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 07:16:44 -0400
Received: from mail-eopbgr710106.outbound.protection.outlook.com
 ([40.107.71.106]:10063 helo=NAM05-BY2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <amarkovic@wavecomp.com>)
 id 1hqyDD-0002td-QM; Fri, 26 Jul 2019 07:16:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7EWf7QQj2ULWrhlJI/VX6h0OWdyh/k3ulWCg5hMOiCAaUUQmo3BZe5jCuXBVrFbXQskN2xDAeUTvyuL0ZFO7AEeEz0tqYyk8fgXPM/HXZV4NkE1pwh0rJWVXdxmkMLKhf8lCprU6J/vsghiL1e+0IDrdLqcSAg2M2AB4aQdsSj/SlJ+KPJnhZF9hCCUi/UHrn/Sr4vF7Eh0s0yAqM+BQTgfpoxgb1efTl5z3DN3LFSFbsm2qKe6jSSKYzWAsq7Ee4xdkVNmacSQILo4row1jOQYYf0GxZWgkSQUOycCqQuh10erhEqfakf0sIt6hpytXDyESVuCxjYkGXAZYUh7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMhAaPb3Co477k7rDny6wCuyCH2GWQtjyE4k1jcjR4E=;
 b=hxRFCY4rlkrpYsNe3qIMFW02xVEaxtIzX7KVMmwnvbEJtg/JdhcZcQ9s8ToquRC4EVDPUFNoQpUR60IpBAOb6Ysg+plQAhuED/rXAEDNARHEU0oJcAnKomw78jVxYEl8nLJd2kINjgxGNBlUNVcAbc9NgKtScHx8IB6DRgK6oIqCF+/LgTTdHOKvsA8qZMIM+fcHjJmvwVbyHDhTUF4wunXvN/Hf0IOQp9nektsBn+pLW+/RCCWzW1BAhbQS+UAH2iDyXuAREl3Uujd/jqPZBUCmhxjkQZ4sAFCJL7iGQ/rwjloAEMEnFddn+Bd8qSCZInELl610b8QZE+lJaASbdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=wavecomp.com;dkim=pass header.d=wavecomp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMhAaPb3Co477k7rDny6wCuyCH2GWQtjyE4k1jcjR4E=;
 b=AYo+YQv6eXcElRov082KzYR5cuOO5F2YXLSytu7xHc21+f2jlznpeevzQwjyuZdteE8zGkfSM072vk92iaJPy8wacI1W5TtmsOezzVqziPudjEXrFlqT4/R54UciR6sjzc9W+vsCdWQnJRMd+SCoyHLU5FR06Yumpb7DBn4y0ME=
Received: from BN6PR2201MB1251.namprd22.prod.outlook.com (10.174.81.139) by
 BN6PR2201MB1153.namprd22.prod.outlook.com (10.174.91.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Fri, 26 Jul 2019 11:16:28 +0000
Received: from BN6PR2201MB1251.namprd22.prod.outlook.com
 ([fe80::509b:7797:a22a:f2bb]) by BN6PR2201MB1251.namprd22.prod.outlook.com
 ([fe80::509b:7797:a22a:f2bb%3]) with mapi id 15.20.2094.017; Fri, 26 Jul 2019
 11:16:28 +0000
From: Aleksandar Markovic <amarkovic@wavecomp.com>
To: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 "tony.nguyen@bt.com" <tony.nguyen@bt.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [EXTERNAL]Re: [Qemu-devel] [PATCH v5 09/15] cputlb: Access
 MemoryRegion with MemOp
Thread-Index: AQHVQ6IbUaNvFRVr0EmGVWMLY+9noqbcvsrp
Date: Fri, 26 Jul 2019 11:16:27 +0000
Message-ID: <BN6PR2201MB1251F66358DF5F3509046674C6C00@BN6PR2201MB1251.namprd22.prod.outlook.com>
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123618147.19868@bt.com>, <55d4c7f3-633b-0005-f74c-53578dd1bee1@redhat.com>
In-Reply-To: <55d4c7f3-633b-0005-f74c-53578dd1bee1@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=amarkovic@wavecomp.com; 
x-originating-ip: [82.117.201.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a61eea7-4539-4106-2d39-08d711bab436
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR2201MB1153; 
x-ms-traffictypediagnostic: BN6PR2201MB1153:
x-microsoft-antispam-prvs: <BN6PR2201MB11534D8FA4150FC71ACD8221C6C00@BN6PR2201MB1153.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(366004)(39850400004)(396003)(376002)(189003)(199004)(256004)(229853002)(6116002)(11346002)(478600001)(7406005)(7416002)(3846002)(2201001)(110136005)(8676002)(305945005)(446003)(71200400001)(81166006)(186003)(8936002)(5660300002)(81156014)(54906003)(7736002)(66066001)(68736007)(6246003)(316002)(2906002)(71190400001)(66446008)(25786009)(7696005)(66476007)(486006)(66946007)(74316002)(66556008)(55016002)(52536014)(76176011)(99286004)(2501003)(86362001)(14454004)(53936002)(55236004)(6506007)(53546011)(102836004)(4326008)(26005)(33656002)(91956017)(76116006)(6436002)(476003)(4744005)(64756008)(9686003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR2201MB1153;
 H:BN6PR2201MB1251.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4KU2PwSAK63ITFVXkvAkFV5ojQsacORvqtWnu+FY7liVglWwmGp3f+WRr4WKSv5zOyrl6bJ8zqeSUM/sPt/Pq3kwayp4C+a1fwyRgmHHXR4/jeQPZaSUA/mfosf4X1KV52Hg3OTOTa+Z1JqTgyRWTuOBaSF1yk5nf2Zmclkp6ASI8i5hoUd9ZWz0hZlNTYPXbfjMeW0ZPR9JDJWdUjp8/RFOn1rAN0uuaFmssyXNAMTATmqg9GYLC8gSSJacuFHxv6gFx1oe4HYBeJOVZCmiwsQP/nIgh38xJOUIZ2UiO7O0zto09jDebw+KfLQSOmfhS2K1wFo/hEmhDfLCYAx/7MXCdyr5plFQ8IRCpvMWt/BtzL9CV0oNHJkQOTw8OqtQ42OQJ6jE31TO4QlgcrQW4rZvd0y2BPNyuZsbyiHPgEA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a61eea7-4539-4106-2d39-08d711bab436
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 11:16:27.5425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: amarkovic@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR2201MB1153
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.71.106
Subject: Re: [Qemu-arm] [EXTERNAL]Re: [Qemu-devel] [PATCH v5 09/15] cputlb:
 Access MemoryRegion with MemOp
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "walling@linux.ibm.com" <walling@linux.ibm.com>,
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>,
 "mst@redhat.com" <mst@redhat.com>, "palmer@sifive.com" <palmer@sifive.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "Alistair.Francis@wdc.com" <Alistair.Francis@wdc.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 "david@redhat.com" <david@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "rth@twiddle.net" <rth@twiddle.net>,
 "atar4qemu@gmail.com" <atar4qemu@gmail.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "shorne@gmail.com" <shorne@gmail.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tEydlW55jV+p

On 7/26/19 8:46 AM, tony.nguyen@bt.com wrote:=0A=
> No-op MEMOP_SIZE and SIZE_MEMOP macros allows us to later easily=0A=
> convert memory_region_dispatch_{read|write} paramter "unsigned size"=0A=
> into a size+sign+endianness encoded "MemOp op".=0A=
> =0A=
> Being a no-op macro, this patch does not introduce any logical change.=0A=
> =0A=
=0A=
"allows" should read "allow".=0A=
=0A=
"paramter" should read "parameter".=0A=
=0A=
"logical change" should read "change in behavior".=0A=
=0A=
Thanks,=0A=
Aleksandar=0A=
=0A=
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>=0A=
> ---=
