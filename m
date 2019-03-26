Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp5368826wrx;
        Tue, 26 Mar 2019 10:42:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyBBh/G5utPPQ9Ky8DhAZOiNjDzVdxgo8YHmiqnRl336eQvVc7x1rV8VsTWJOM3A7lEi/Rx
X-Received: by 2002:a5d:8d93:: with SMTP id b19mr22673387ioj.54.1553622133378;
        Tue, 26 Mar 2019 10:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553622133; cv=none;
        d=google.com; s=arc-20160816;
        b=xEPERf9p2JNRihG7MW2MN1m5/sKGyYyjx7VUaUZVgyrU7nNYnea9sOEFHv3G+y2BKr
         Q9/aFgiuS7RVsq4+Q4N6o7fdR/5OSz/Ggd1yB3zaGxOTH0/oLIDgjI6tPwBQUxSLXbVH
         /YBFkrPgIm/8Rhmma4Ybw5ZlvfeZYF0EPuxjqJE76KNt9X35Qt15vZrMLAy1K7BEe40/
         HuSjRSEsPZJH00YAqpNtOWh8aOLrt484/y2rGVaVtcRlPN2G+uSUiY+Zniq2OivMiFRO
         Sy1DkMRq5cuNF/e2KKvVLofY0avj1H7evWLLxgZMScCHXwqv/psLMFE4XLthq7YdWYAt
         9dvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from:dkim-signature;
        bh=OEmQhhtOMv7yNh2H6A2r2KmQmjveYDpF1yfXZzXJspI=;
        b=dzprKlSR1W0XVVi47hGSCblmMYyXAzHuXt5Q7Ft0Z+ez8ONqhVFY1ZLaBBa0xDVC+j
         UoTsexXLLXKbXDwtV0tg6klY/ejH9x23JJxbglWxC+Mw9zM0FRp1WITuPPd8U2qqfCD0
         VJYlSqFSCg/uSFYS77IsO6FMfVAo8D6cZWjNsCxwvvUtSIL4QRz1ZJEBtjWTT1LgiKdX
         iVIQW3PPiYPBVVY1h2CxA4dMVvcwb/KKl5TAzo8LeUjyNhJXBfBfvFjv/RrtSRfO4Ayh
         0grEIBWAy0zQHwA4X8cZ28BNNSGXDAsjSxz9Kaj9aYKuehSJrr3B+MLG1Apsy/ZHZIEN
         Wh2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=HQAJl3XI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q18si8660390iod.153.2019.03.26.10.42.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Mar 2019 10:42:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=HQAJl3XI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:35761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8q5U-0002lO-FP
	for alex.bennee@linaro.org; Tue, 26 Mar 2019 13:42:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1h8q54-0002Mq-Tc
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 13:41:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1h8ps1-0001TS-Rr
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 13:28:18 -0400
Received: from mail-eopbgr760118.outbound.protection.outlook.com
	([40.107.76.118]:19869
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1h8ps0-0001S7-M4; Tue, 26 Mar 2019 13:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OEmQhhtOMv7yNh2H6A2r2KmQmjveYDpF1yfXZzXJspI=;
	b=HQAJl3XIm1mmS46e7SFQYsrPRCTOsmVVvUaOlgOGr4AXNlDj2urEJ5wY0REDuK7CFZ2pnkhacz5tiN2VW1v9zlQUIQo4clJxrhPBRJJlgQH1wPnxaQDGnt4klc8EgNH/RDhjc9/E4acXAB/jOKOw/10A3ji1SHpuEpQnLdcZ/GI=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4811.prod.exchangelabs.com (20.177.218.204) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1730.19; Tue, 26 Mar 2019 17:28:14 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d048:df23:56d0:cff5]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d048:df23:56d0:cff5%3]) with mapi id 15.20.1730.013;
	Tue, 26 Mar 2019 17:28:14 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: Andrew Jones <drjones@redhat.com>
Thread-Topic: [PATCH 1/3] target/arm: fix crash on pmu register access
Thread-Index: AQHU4Mub8o9NXhZ3Zk6HuVi5y8QqpqYeMQcA
Date: Tue, 26 Mar 2019 17:28:14 +0000
Message-ID: <20190326172822.GI28178@quinoa.localdomain>
References: <20190322162333.17159-1-drjones@redhat.com>
	<20190322162333.17159-2-drjones@redhat.com>
In-Reply-To: <20190322162333.17159-2-drjones@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR01CA0010.prod.exchangelabs.com (2603:10b6:903:1f::20)
	To DM6PR01MB4825.prod.exchangelabs.com (2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.153]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41acefb2-efe9-4e74-9437-08d6b2106d7b
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4811; 
x-ms-traffictypediagnostic: DM6PR01MB4811:
x-microsoft-antispam-prvs: <DM6PR01MB4811229314A5FC0FCA61B6908A5F0@DM6PR01MB4811.prod.exchangelabs.com>
x-forefront-prvs: 09888BC01D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(39840400004)(366004)(346002)(396003)(136003)(189003)(199004)(76176011)(53936002)(106356001)(52116002)(478600001)(6506007)(386003)(26005)(446003)(105586002)(11346002)(186003)(5660300002)(14454004)(68736007)(33656002)(8936002)(102836004)(9686003)(6512007)(71200400001)(6246003)(486006)(2906002)(71190400001)(476003)(305945005)(8676002)(99286004)(3846002)(7736002)(81156014)(6116002)(316002)(4744005)(54906003)(81166006)(66066001)(97736004)(6486002)(25786009)(256004)(4326008)(86362001)(229853002)(1076003)(6436002)(6916009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4811;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eHZgqpSsAylUSuN9APowah/bvjMkWKdvuskovTKlMoiPu+nQlPPrNQhDau/FR5PfC2ZCNrM7/+FbPYwPKXk9NOVbsAH0bN6eWf+LNKHwAsMBlAmoSvXWfhObJyJItMWnBtdVdvN4ibXlPSbGcfafZ9iYq7afapRo92QP56qef5EEeaNkVEbVAjR4211sqXandWxB/tW/8DOa1AUjPKVO1IqOumUPSD3TQz2Ltsv+CBL2qq/ZVjAtom9/4l6XMu8I7cAwAQImVXTHviE5JXD5nV4CYjxwr8RuOhGPPfwZd62SfkdXzWzKFRWd0d+ETYxi+4MwI1of6mNfITKBvcpnFHn4FyrG2wsbyvvwAvtNxI/Fg6SnJGoX2peARPMWo+Sg73S9Vk+WXNb1wPwqL9LVaZqaZB7R3HkBFBRBf+nw+Ms=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8D3BBC116E4A8343B39B8A46D6C1BB0B@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41acefb2-efe9-4e74-9437-08d6b2106d7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2019 17:28:14.8282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4811
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.76.118
Subject: Re: [Qemu-arm] [PATCH 1/3] target/arm: fix crash on pmu register
 access
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: //yIp7l7cY4j

On Mar 22 17:23, Andrew Jones wrote:
> Fix a QEMU NULL derefence that occurs when the guest attempts to
> enable PMU counters with a non-v8 cpu model or a v8 cpu model
> which has not configured a PMU.
>=20
> Fixes: 4e7beb0cc0f3 ("target/arm: Add a timer to predict PMU counter over=
flow")
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>

> ---
>  target/arm/helper.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index c8d3c213b6b7..fc73488f6cc0 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1259,6 +1259,10 @@ static bool pmu_counter_enabled(CPUARMState *env, =
uint8_t counter)
>      int el =3D arm_current_el(env);
>      uint8_t hpmn =3D env->cp15.mdcr_el2 & MDCR_HPMN;
> =20
> +    if (!arm_feature(env, ARM_FEATURE_PMU)) {
> +        return false;
> +    }
> +
>      if (!arm_feature(env, ARM_FEATURE_EL2) ||
>              (counter < hpmn || counter =3D=3D 31)) {
>          e =3D env->cp15.c9_pmcr & PMCRE;
> --=20
> 2.17.2
>=20
