Received: by 10.223.161.27 with SMTP id o27csp3694558wro;
        Tue, 31 Oct 2017 06:07:57 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SMc30RRTegkUhXkcr7Qh9Ug6QkrBOjK77754QsVCfTcnc7UNwXCktulZQyrDiG5cKcqnH3
X-Received: by 10.13.211.68 with SMTP id v65mr1163932ywd.429.1509455277554;
        Tue, 31 Oct 2017 06:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509455277; cv=none;
        d=google.com; s=arc-20160816;
        b=w9raP37Vhdoj9hpgAU/v5xCX45nuFzBeO+mgFxJUqA8SIvzW6o1uQsd2pN7GkqcEP+
         L0OTP+FXajnHG2rwKwxmpITNCLmu4WW4HIKPsJdmm6UAutc/yPtfotGxJWsgLqokYOHR
         CLYTmAt9qgNU6DM3nHUx3eJEzkRosgSCKSnrJtnlQyrW80Gxc1vn6h+7Qwg89eKNBQD3
         p5xWpMIQWkCqKqt2Y5HHKyDtTzEWNwoaC+mKT4G5sY4m3AlVMfcSipcWS8lwQeAUZQjU
         mzBl/cg888LfdcTWcmopxsegbic9kQUdWiTzsIBDhFBeCp8Dpw1r/0MXpvyQ+DyMjMoK
         vZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :dkim-signature:arc-authentication-results;
        bh=pLOP7BmvD4agljMMnFFMpQ1VQ7NipujwRkbqF89RPpM=;
        b=bKH19Lova412loEnBo4jaMUoaLlbCbBRdkbuTqrboJwvqScdikkz5jNKq3/d62X/0N
         CRWW2SF9UbkqtWEgMXGmDJbDoAUTG5bEC16cPZW6duopsLcGHxB9fYbpM7A5/vReQzIs
         1gApqzFyKqPojH1XSLUBnTAReu4WYkXM7rQWWBe+ftVLtc4MJY0HUnSA/tvVNsAbrohy
         UwWrUcjZhHsAtP6qAMgrNeLmLBvPwkP745eVU0Q6pxbeGARRzHDQJuu9LQobALZrFfOu
         X4kLo9PZl3G6Dk8bjrtfrkGV52KGu9uEg04OKW949YSYl2jOR/qH35/NixA+RJTeSCtR
         uyVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=HQPugtlp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h9si394084ybj.219.2017.10.31.06.07.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 06:07:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=HQPugtlp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9WGr-0000xf-0d
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 09:07:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e9WGf-0000xW-BW
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 09:07:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e9WGZ-0003LD-8t
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 09:07:45 -0400
Received: from mail-by2nam03on0112.outbound.protection.outlook.com
	([104.47.42.112]:23130
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1e9WGY-0003IE-WE; Tue, 31 Oct 2017 09:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=pLOP7BmvD4agljMMnFFMpQ1VQ7NipujwRkbqF89RPpM=;
	b=HQPugtlp3OT7IEy5oc+1A3mb5u67Bl32d/YcWzsXhq8bDiEiR4figI92qgxItRgEwWGEiUlHUiEfmwrFrkC9FpDAT/yhAUR9rQSFTTpIjbiEwCSwTuajZMtG7OVjwyJyhxK61gCf/oDH2rTEjMbDya8tSJqsi95q/RnB5dbQDAk=
Received: from MWHPR21MB0159.namprd21.prod.outlook.com (10.173.52.17) by
	MWHPR21MB0702.namprd21.prod.outlook.com (10.175.142.12) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.20.218.3; Tue, 31 Oct 2017 13:07:37 +0000
Received: from MWHPR21MB0159.namprd21.prod.outlook.com ([10.173.52.17]) by
	MWHPR21MB0159.namprd21.prod.outlook.com ([10.173.52.17]) with mapi id
	15.20.0156.005; Tue, 31 Oct 2017 13:07:37 +0000
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH v3] arm: implement cache/shareability attribute bits for
	PAR registers
Thread-Index: AQHTUkiTgykr38w5FEOUf1HVx9sSSqL97W3g
Date: Tue, 31 Oct 2017 13:07:36 +0000
Message-ID: <MWHPR21MB015998D56801F7253F33D1FB9E5E0@MWHPR21MB0159.namprd21.prod.outlook.com>
References: <20171031130223.220-1-Andrew.Baumann@microsoft.com>
In-Reply-To: <20171031130223.220-1-Andrew.Baumann@microsoft.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2017-10-31T13:07:33.0398854Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
	Sensitivity=General
x-originating-ip: [116.246.28.225]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0702;
	6:jwquq+Ct6xZEXG0439rS2J5q5eWv7F51toulqrJAYLfdOcXUBHLmrZlJQyzg8xaE+UlZlBX0N4VIllnZ95+7nXdXAKQReJ6ckira6PJSKuS2l1CxtktwVkh1dTskIDYUllJ1muhlo9Gry3nUd3CbCC3F3AP/Ix6vPg4sqTDla4rjhGnOU/lEkk+btdZjxstAi50ifLh6TBcoAjQDpVgX+x+Xedc+R/I++Uqg2IxrDK5IpLGKrSNTkUrsYfmz6zmHLtj/DDtlLwViOXWGrJVYlbRvg7cOPIyJMW3zX0Bf0o2BKOwAbZ9i3VMTuidxdOMia46nw1knjI9MqEnT2GTbuxUX3z+e29fm5qL0m5iac0k=;
	5:E52lcBFW0pFydloHuO2SCSdLzObPpUwO9yz50uR8KjyeQWvSmUun/VSeuUHO2KK+hw3mARXcHBY/My9AoGFwIWhu8JvzmuZtB16wxW47SuD3QFqla295uRfUPkGy2U/FYl+ENRs7vhzXfS/wDFGgOS8vi1w+Is18BZdcurosirA=;
	24:1JI6rCcKfeoBfnBlTKPOcHb50zM7vAmaD7ILtBHstP2iUAFIuZxjwYzJuvT/WMpduv6WctEMQqZIzuZtMcdDgR9uOp3ir0WRKq0rWQ3krD8=;
	7:GTJDDnoZIEVmpoa3DYGfZ1PbpbAzqNobmNKj10lhdpWjSGoFj8vxbOX8axVeid2/dLlsRu0rBYl2PmRTF5z7c71WCSmVJNcYZREkNDYLjVTKPY2Z3FhiR3C9gaSIj6DM80F8IblFUFB2UqlB8SChmmEY+Zql857BvG+F0wa1KjpqYTg9r8Z9E1enBnfB6B3j2tBLpTKH+UAs56IPwSN85XSfez85zoUcx3EIuEejLLQDU0VdYFF/+kDskAOO7iQq
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 018a1edf-eab0-4ebd-8ab4-08d520605bd1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(48565401081)(4534020)(4602075)(2017052603238);
	SRVR:MWHPR21MB0702; 
x-ms-traffictypediagnostic: MWHPR21MB0702:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-exchange-antispam-report-test: UriScan:;
x-microsoft-antispam-prvs: <MWHPR21MB07028A29F1C2D38300B591289E5E0@MWHPR21MB0702.namprd21.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(61425038)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(3231020)(93006095)(93001095)(10201501046)(3002001)(6055026)(61426038)(61427038)(6041248)(20161123558100)(20161123555025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR21MB0702; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR21MB0702; 
x-forefront-prvs: 04772EA191
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39860400002)(376002)(346002)(47760400005)(199003)(189002)(189998001)(10290500003)(2900100001)(66066001)(14454004)(6506006)(6436002)(33656002)(4326008)(2906002)(102836003)(3660700001)(3846002)(3280700002)(6116002)(478600001)(77096006)(50986999)(54356999)(76176999)(72206003)(101416001)(229853002)(81156014)(81166006)(6916009)(2950100002)(8676002)(7696004)(8936002)(99286003)(54906003)(9686003)(305945005)(7736002)(8990500004)(10090500001)(106356001)(68736007)(105586002)(55016002)(53936002)(25786009)(316002)(22452003)(86612001)(86362001)(5660300001)(97736004)(6246003)(74316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0702;
	H:MWHPR21MB0159.namprd21.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 018a1edf-eab0-4ebd-8ab4-08d520605bd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2017 13:07:36.9759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0702
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.112
Subject: Re: [Qemu-arm] [PATCH v3] arm: implement cache/shareability
 attribute bits for PAR registers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
From: Andrew Baumann via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KGJUuOPbljKT

> From: Andrew Baumann
> Sent: Tuesday, 31 October 2017 21:02
[...]
> +static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
> +{
> +    uint8_t hiattr =3D extract32(s2attrs, 2, 2);
> +    uint8_t loattr =3D extract32(s2attrs, 0, 2);
> +    uint8_t hihint =3D 0, lohint =3D 0;
> +
> +    if (hiattr !=3D 0) { /* normal memory */
> +        /* TODO: to faithfully emulate S2CacheDisabled() for the case
> +         * when EL2 is aarch32, we should check HCR2 (not HCR_EL2), but
> +         * qemu doesn't presently model this register.
> +         */
> +        if ((env->cp15.hcr_el2 & HCR_CD) !=3D 0) { /* cache disabled */
> +            hiattr =3D loattr =3D 1; /* non-cacheable */
> +        } else {
> +            if (hiattr !=3D 1) { /* Write-through or write-back */
> +                hihint =3D 3; /* RW allocate */
> +            }
> +            if (loattr !=3D 1) { /* Write-through or write-back */
> +                lohint =3D 3; /* RW allocate */
> +            }
> +        }
> +    }
> +
> +    return (hiattr << 6) | (hihint << 2) | (loattr << 2) | lohint;
> +}

Right after sending this, I noticed a dumb copy-paste bug: the above should=
 be hihint << 4.
I'm obviously going a bit too fast, sorry.

Andrew
