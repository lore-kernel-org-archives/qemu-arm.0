Received: by 10.25.44.15 with SMTP id s15csp457174lfs;
        Wed, 5 Jul 2017 01:50:00 -0700 (PDT)
X-Received: by 10.55.101.206 with SMTP id z197mr52350287qkb.207.1499244600443;
        Wed, 05 Jul 2017 01:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499244600; cv=none;
        d=google.com; s=arc-20160816;
        b=IXFq//VJ6goYp/oqbl6/KNCunaKuEB8eygcxEkMN76B87iZZsxI+7JMuhRIAq36TSA
         qQy+uVWITck2c8HuXU5lXUAa7Xjnpxf4e2jHP5DTeGLTn0aXAr1tGEynLyo77h3LPFtr
         9+pHT61UrtLCHiqmqrqHBRiPeId3Nhju2O00fc0krWlskBhD49xxDRwaEUqK7zO14StY
         klxJFkkDjx5+3BTmeORsxsPqehiIgwonQxMU/S/YTbqPWLVoK1j55nHmuDsCRYaT/mtv
         7rsLMNermFgMYWInNWBKp8+h3ywXpI2OZhuytaYhCLTAaNr+jBbnVbbVY/2M5Aajs0dc
         kCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=TjnBr6XSxUXbKq6a85t7EuOcpZhwVMm06P+rpykZnoQ=;
        b=HqLvDKzEFFcLm8XfoPul03w/TBkO/ePbzM9xio58TN1EKq2luliuq5NsbuQoV4CO0k
         wNV5z1MEE1aP5Kz516UuNHMixyDEx5JIuJSyWczHD/sMZ2o8FhgQE8RbCeWlDDVV6X1w
         VYKA16ceFTSAsdc8PfAL70ZaxjvaayIZtssRHFwTD5YruBDoBdN+eHTVfcxQn7zIQh4N
         FP055l0SmFdDYDAXvkWOuRzv0Hq9pTJx1slRNXgqFEqPe8XrDCQ98P7y2FUNKD+WQ7WZ
         OJchp+zePOvWiysCWBjvmZyc9JMj4B3RZZaMfBgBxfD49ENteqNO1vcUpddiqf6R4G1y
         qTaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=d088YOOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q17si20285139qtb.129.2017.07.05.01.49.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jul 2017 01:50:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=d088YOOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:44864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSg0T-0000VO-IB
	for alex.bennee@linaro.org; Wed, 05 Jul 2017 04:49:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dSg0O-0000VF-TO
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 04:49:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dSg0K-00053u-Rb
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 04:49:52 -0400
Received: from mail-eopbgr40050.outbound.protection.outlook.com
	([40.107.4.50]:38180
	helo=EUR03-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dSg0K-00052x-Bh; Wed, 05 Jul 2017 04:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=TjnBr6XSxUXbKq6a85t7EuOcpZhwVMm06P+rpykZnoQ=;
	b=d088YOOqP7o4Nr3g86XiCIQwiZkds+BRTAZXNMBdcf8FzNDBQPLOFAjAvWXf/duRM9NLQC0F84ZaO7Q9qnCOEW0V8Ia5sJqzFJLTTKyRhWGdygZvtOLx1YtBsq0XtG5cSlMEX/dp920V7RPxfDF6TvIkS2Q3hrnx7VAHzX11Xkw=
Received: from HE1PR0401MB2556.eurprd04.prod.outlook.com (10.168.148.10) by
	HE1PR0401MB2553.eurprd04.prod.outlook.com (10.168.148.7) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1220.11; Wed, 5 Jul 2017 08:49:43 +0000
Received: from HE1PR0401MB2556.eurprd04.prod.outlook.com
	([fe80::d985:38ae:fd1:4e88]) by
	HE1PR0401MB2556.eurprd04.prod.outlook.com
	([fe80::d985:38ae:fd1:4e88%18]) with mapi id 15.01.1220.018;
	Wed, 5 Jul 2017 08:49:43 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Auger Eric <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "jean-philippe.brucker@arm.com"
	<jean-philippe.brucker@arm.com>
Thread-Topic: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36dbfM0cmMlk0UqAg6W7m9YdMaIcD2KwgAAIugCAAE8owIAAB4qAgA9wB1CACwTDgIAOGkuAgAAYhwCAAABHwA==
Date: Wed, 5 Jul 2017 08:49:43 +0000
Message-ID: <HE1PR0401MB255696A487DFEB2B8972980F9AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<c80977c4-1955-4e9d-3fc8-4d884562fd28@redhat.com>
	<HE1PR0401MB2556D19D91F25DCE96FE7B199AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<8a7fb667-e6c0-2412-6dca-a8233dd27836@redhat.com>
In-Reply-To: <8a7fb667-e6c0-2412-6dca-a8233dd27836@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR0401MB2553;
	7:vOsu9Nx2denXsed7yrddXns+eqNeEoQXHf2S5/+4xBcYi+c+SKfXV3hOxu/OrQuj+Vnp1RygJwnbl9oVbfhNg9NjtQj7f61pOBr0a31D/d1K/vP2veozcvnAOTTpfBEQeQYD9Qr/PP1fGc7xx+5j6QPZs3w7udVck5aSFzcZXz5ttEdFvAUdUm4Y6J/+d0iScs8VYoVhuXaLCsusv6t612OaW1PlHAVDi3wHWbZZE+jKYFI9uIQSF0ibX5hn74RKeEnIsVT9yr5Swr0WoX+fKnMeU3yFQcg6+cC6Ko3H+p3cLpFhMTV+S2xSJHIaA7BM3/NZl2k0YLHuifHWSmd5qc08nymOMfM6+2VEsmbQW5rF4WWGSXHWi7WPvi4/73r66rAfStzdS/ZIW3VA/w5ypTrrEE7GiWbqmZUtkoJdRA4Yrs6Y33LAiZf3yQTuj3S0IiVEFVZNQv66u008OXW8UAupf+uF1CVYo5vwX85T+OdhmfMKUx01lPtXhH2MFDNSZJaHxe1JkEOOD7mlgwU12PgBMElfwWaO61WuetJ07tpVrtt/a2lNguL0Sz0j/HO0atfqnv360KJHdgKt4069ltwqAT++rTG1HT5xQDTSSYlOE9HBjE3VLUMxMmtqciwVxRfFmAmUaEVIIxOJXeyI802yrzb16yyTK0kaFbw1AbccrBOlDa/eNNw73c8CZ/1A2TKAnor3dPEJ5V82xXBIcq4jn9aQcdZfsoarJqeRLEak2+ckfHT1h0V/R3POoxV7oMI75QLZSjptoMV8JXOZDW8k0bbq7FRPAm7UmWXvsnA=
x-ms-office365-filtering-correlation-id: 6ee792d1-39f6-46f2-294f-08d4c382c825
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:HE1PR0401MB2553; 
x-ms-traffictypediagnostic: HE1PR0401MB2553:
x-microsoft-antispam-prvs: <HE1PR0401MB2553EE27575F98DE690FDE649AD40@HE1PR0401MB2553.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(133145235818549)(166708455590820)(236129657087228)(185117386973197)(48057245064654)(167848164394848)(228905959029699)(247924648384137);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(100000703101)(100105400095)(6055026)(6041248)(20161123558100)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:HE1PR0401MB2553; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:HE1PR0401MB2553; 
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39840400002)(39850400002)(39400400002)(39450400003)(39410400002)(39860400002)(377454003)(53234004)(13464003)(24454002)(3846002)(7736002)(6436002)(50986999)(53546010)(6506006)(478600001)(54356999)(76176999)(5660300001)(81166006)(5250100002)(2201001)(3280700002)(229853002)(4326008)(8676002)(38730400002)(6116002)(7416002)(33656002)(305945005)(3660700001)(102836003)(2900100001)(86362001)(6246003)(14454004)(8936002)(189998001)(99286003)(93886004)(39060400002)(66066001)(966005)(2906002)(54906002)(55016002)(74316002)(25786009)(6306002)(9686003)(106356001)(53936002)(2501003)(7696004)(2950100002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0401MB2553;
	H:HE1PR0401MB2556.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2017 08:49:43.5234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2553
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.4.50
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mM+7xIPNU/56

Hi Eric,

> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: Wednesday, July 05, 2017 2:14 PM
> To: Bharat Bhushan <bharat.bhushan@nxp.com>;
> eric.auger.pro@gmail.com; peter.maydell@linaro.org;
> alex.williamson@redhat.com; mst@redhat.com; qemu-arm@nongnu.org;
> qemu-devel@nongnu.org; jean-philippe.brucker@arm.com
> Cc: wei@redhat.com; kevin.tian@intel.com; marc.zyngier@arm.com;
> tn@semihalf.com; will.deacon@arm.com; drjones@redhat.com;
> robin.murphy@arm.com; christoffer.dall@linaro.org
> Subject: Re: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
>=20
> Hi Bharat,
>=20
> On 05/07/2017 10:23, Bharat Bhushan wrote:
> > Hi Eric,
> >
> >> -----Original Message-----
> >> From: Auger Eric [mailto:eric.auger@redhat.com]
> >> Sent: Monday, June 26, 2017 1:25 PM
> >> To: Bharat Bhushan <bharat.bhushan@nxp.com>;
> >> eric.auger.pro@gmail.com; peter.maydell@linaro.org;
> >> alex.williamson@redhat.com; mst@redhat.com; qemu-arm@nongnu.org;
> >> qemu-devel@nongnu.org; jean-philippe.brucker@arm.com
> >> Cc: wei@redhat.com; kevin.tian@intel.com; marc.zyngier@arm.com;
> >> tn@semihalf.com; will.deacon@arm.com; drjones@redhat.com;
> >> robin.murphy@arm.com; christoffer.dall@linaro.org
> >> Subject: Re: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
> >>
> >> Hi Bharat,
> >>
> >> On 19/06/2017 09:54, Bharat Bhushan wrote:
> >>> Hi Eric,
> >>>
> >>> I started added replay in virtio-iommu and came across how MSI
> >>> interrupts
> >> with work with VFIO.
> >>> I understand that on intel this works differently but vsmmu will
> >>> have same
> >> requirement.
> >>> kvm-msi-irq-route are added using the msi-address to be translated
> >>> by
> >> viommu and not the final translated address.
> >>> While currently the irqfd framework does not know about emulated
> >> iommus (virtio-iommu, vsmmuv3/vintel-iommu).
> >>> So in my view we have following options:
> >>> - Programming with translated address when setting up
> >>> kvm-msi-irq-route
> >>> - Route the interrupts via QEMU, which is bad from performance
> >>> - vhost-virtio-iommu may solve the problem in long term
> >>
> >> Sorry for the delay. With regard to the vsmmuv3/vfio integration I
> >> think we need to use the guest physical address otherwise the MSI
> >> address will not be recognized as an MSI doorbell.
> >>
> >> Also the fact on ARM we map the MSI doorbell causes an assert in
> >> vfio_get_vaddr() as the vITS doorbell is not a RAM region. We will
> >> need to handle this specifically.
> >
> > Also when setup msi-route kvm_irqchip_add_msi_route() we needed to
> provide the translated address.
> > According to my understanding this is required because kernel does no g=
o
> through viommu translation when generating interrupt, no?
>=20
> yes this is needed when KVM MSI routes are set up, ie. along with GICV3 I=
TS.
> With GICv2M, qemu direct gsi mapping is used and this is not needed.
>=20
> So I do not understand your previous sentence saying "MSI interrupts work=
s
> without any change".

I have almost completed vfio integration with virtio-iommu and now testing =
the changes by assigning e1000 device to VM. For this I have changed virtio=
-iommu driver to use IOMMU_RESV_MSI rather than sw-msi and this does not ne=
ed changed in vfio_get_addr()  and kvm_irqchip_add_msi_route()

Thanks
-Bharat

>=20
> Thanks
>=20
> Eric
>=20
> >
> > Thanks
> > -Bharat
> >
> >>
> >> Besides I have not looked specifically at the virtio-iommu/vfio
> >> integration yet.
> >>
> >> Thanks
> >>
> >> Eric
> >>>
> >>> Is there any other better option I am missing?
> >>>
> >>> Thanks
> >>> -Bharat
> >>>
> >>>> -----Original Message-----
> >>>> From: Auger Eric [mailto:eric.auger@redhat.com]
> >>>> Sent: Friday, June 09, 2017 5:24 PM
> >>>> To: Bharat Bhushan <bharat.bhushan@nxp.com>;
> >>>> eric.auger.pro@gmail.com; peter.maydell@linaro.org;
> >>>> alex.williamson@redhat.com; mst@redhat.com; qemu-
> arm@nongnu.org;
> >>>> qemu-devel@nongnu.org; jean-philippe.brucker@arm.com
> >>>> Cc: wei@redhat.com; kevin.tian@intel.com; marc.zyngier@arm.com;
> >>>> tn@semihalf.com; will.deacon@arm.com; drjones@redhat.com;
> >>>> robin.murphy@arm.com; christoffer.dall@linaro.org
> >>>> Subject: Re: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
> >>>>
> >>>> Hi Bharat,
> >>>>
> >>>> On 09/06/2017 13:30, Bharat Bhushan wrote:
> >>>>> Hi Eric,
> >>>>>
> >>>>>> -----Original Message-----
> >>>>>> From: Auger Eric [mailto:eric.auger@redhat.com]
> >>>>>> Sent: Friday, June 09, 2017 12:14 PM
> >>>>>> To: Bharat Bhushan <bharat.bhushan@nxp.com>;
> >>>>>> eric.auger.pro@gmail.com; peter.maydell@linaro.org;
> >>>>>> alex.williamson@redhat.com; mst@redhat.com; qemu-
> >> arm@nongnu.org;
> >>>>>> qemu-devel@nongnu.org; jean-philippe.brucker@arm.com
> >>>>>> Cc: will.deacon@arm.com; robin.murphy@arm.com;
> >>>> kevin.tian@intel.com;
> >>>>>> marc.zyngier@arm.com; christoffer.dall@linaro.org;
> >>>>>> drjones@redhat.com; wei@redhat.com; tn@semihalf.com
> >>>>>> Subject: Re: [RFC v2 0/8] VIRTIO-IOMMU device
> >>>>>>
> >>>>>> Hi Bharat,
> >>>>>>
> >>>>>> On 09/06/2017 08:16, Bharat Bhushan wrote:
> >>>>>>> Hi Eric,
> >>>>>>>
> >>>>>>>> -----Original Message-----
> >>>>>>>> From: Eric Auger [mailto:eric.auger@redhat.com]
> >>>>>>>> Sent: Wednesday, June 07, 2017 9:31 PM
> >>>>>>>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
> >>>>>>>> peter.maydell@linaro.org; alex.williamson@redhat.com;
> >>>>>> mst@redhat.com;
> >>>>>>>> qemu-arm@nongnu.org; qemu-devel@nongnu.org; jean-
> >>>>>>>> philippe.brucker@arm.com
> >>>>>>>> Cc: will.deacon@arm.com; robin.murphy@arm.com;
> >>>>>> kevin.tian@intel.com;
> >>>>>>>> marc.zyngier@arm.com; christoffer.dall@linaro.org;
> >>>>>>>> drjones@redhat.com; wei@redhat.com; tn@semihalf.com;
> Bharat
> >>>>>> Bhushan
> >>>>>>>> <bharat.bhushan@nxp.com>
> >>>>>>>> Subject: [RFC v2 0/8] VIRTIO-IOMMU device
> >>>>>>>>
> >>>>>>>> This series implements the virtio-iommu device. This is a proof
> >>>>>>>> of concept based on the virtio-iommu specification written by
> >>>>>>>> Jean-Philippe
> >>>>>> Brucker [1].
> >>>>>>>> This was tested with a guest using the virtio-iommu driver [2]
> >>>>>>>> and exposed with a virtio-net-pci using dma ops.
> >>>>>>>>
> >>>>>>>> The device gets instantiated using the "-device virtio-iommu-
> device"
> >>>>>>>> option. It currently works with ARM virt machine only as the
> >>>>>>>> machine must handle the dt binding between the virtio-mmio
> >> "iommu"
> >>>>>>>> node and the PCI host bridge node. ACPI booting is not yet
> >> supported.
> >>>>>>>>
> >>>>>>>> This should allow to start some benchmarking activities against
> >>>>>>>> pure emulated IOMMU (especially ARM SMMU).
> >>>>>>>
> >>>>>>> I am testing this on ARM64 and see below continuous error prints:
> >>>>>>>
> >>>>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>>>>
> >>>>>>>
> >>>>>>> Also in guest I do not see device-tree node with virtio-iommu.
> >>>>>> do you mean the virtio-mmio with #iommu-cells property?
> >>>>>>
> >>>>>> This one is created statically by virt machine. I would be
> >>>>>> surprised if it were not there. Are you using the virt =3D virt2.1=
0
> machine.
> >>>>>> Machines before do not support its instantiation.
> >>>>>>
> >>>>>> Please can you add a printf in hw/arm/virt.c create_virtio_mmio()
> >>>>>> at the moment when this node is created. Also you can add a
> >>>>>> printf in
> >>>>>> bind_virtio_iommu_device() to make sure the binding with the PCI
> >>>>>> host bridge is added on machine init done.
> >>>>>>
> >>>>>> Also worth to check, CONFIG_VIRTIO_IOMMU=3Dy on guest side.
> >>>>>
> >>>>> It works on my side.
> >>>> Great.
> >>>>
> >>>>  The driver config was disabled and also I was using guest kernel
> >>>> which was not have deferred-probing.
> >>>> Yes I did not mention in my cover letter the guest I have been
> >>>> using is based on Jean-Philippe's branch, featuring deferred IOMMU
> probing.
> >>>> I I have not tried yet with an upstream guest.
> >>>>  Now after fixing it works on my side
> >>>>> I placed some prints to see dma-map are mapping regions in
> >>>>> virtio-iommu,
> >>>> it uses emulated iommu.
> >>>>>
> >>>>> I will continue to add VFIO support now on this and more testing !!
> >>>>
> >>>> OK. I will do the VFIO integration first on the vsmmuv3 device as I
> >>>> already prepared the VFIO replay and hopefully we will sync ;-)
> >>>>
> >>>> Thanks
> >>>>
> >>>> Eric
> >>>>>
> >>>>> Thanks
> >>>>> -Bharat
> >>>>>
> >>>>>>
> >>>>>> Thanks
> >>>>>>
> >>>>>> Eric
> >>>>>>
> >>>>>>> I am using qemu-tree you mentioned below and iommu-driver
> >> patches
> >>>>>> published by Jean-P.
> >>>>>>> Qemu command line have additional ""-device virtio-iommu-
> device".
> >>>>>>> What
> >>>>>> I am missing ?
> >>>>>>
> >>>>>>
> >>>>>>>
> >>>>>>> Thanks
> >>>>>>> -Bharat
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Best Regards
> >>>>>>>>
> >>>>>>>> Eric
> >>>>>>>>
> >>>>>>>> This series can be found at:
> >>>>>>>> https://github.com/eauger/qemu/tree/virtio-iommu-rfcv2
> >>>>>>>>
> >>>>>>>> References:
> >>>>>>>> [1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU, [2] [RFC
> >>>>>>>> PATCH linux]
> >>>>>>>> iommu: Add virtio-iommu driver [3] [RFC PATCH kvmtool 00/15]
> >>>>>>>> Add
> >>>>>>>> virtio- iommu
> >>>>>>>>
> >>>>>>>> History:
> >>>>>>>> v1 -> v2:
> >>>>>>>> - fix redifinition of viommu_as typedef
> >>>>>>>>
> >>>>>>>> Eric Auger (8):
> >>>>>>>>   update-linux-headers: import virtio_iommu.h
> >>>>>>>>   linux-headers: Update for virtio-iommu
> >>>>>>>>   virtio_iommu: add skeleton
> >>>>>>>>   virtio-iommu: Decode the command payload
> >>>>>>>>   virtio_iommu: Add the iommu regions
> >>>>>>>>   virtio-iommu: Implement the translation and commands
> >>>>>>>>   hw/arm/virt: Add 2.10 machine type
> >>>>>>>>   hw/arm/virt: Add virtio-iommu the virt board
> >>>>>>>>
> >>>>>>>>  hw/arm/virt.c                                 | 116 ++++-
> >>>>>>>>  hw/virtio/Makefile.objs                       |   1 +
> >>>>>>>>  hw/virtio/trace-events                        |  14 +
> >>>>>>>>  hw/virtio/virtio-iommu.c                      | 623
> >>>>>> ++++++++++++++++++++++++++
> >>>>>>>>  include/hw/arm/virt.h                         |   5 +
> >>>>>>>>  include/hw/virtio/virtio-iommu.h              |  60 +++
> >>>>>>>>  include/standard-headers/linux/virtio_ids.h   |   1 +
> >>>>>>>>  include/standard-headers/linux/virtio_iommu.h | 142 ++++++
> >>>>>>>>  linux-headers/linux/virtio_iommu.h            |   1 +
> >>>>>>>>  scripts/update-linux-headers.sh               |   3 +
> >>>>>>>>  10 files changed, 957 insertions(+), 9 deletions(-)  create
> >>>>>>>> mode
> >>>>>>>> 100644 hw/virtio/virtio-iommu.c  create mode 100644
> >>>>>>>> include/hw/virtio/virtio- iommu.h  create mode 100644
> >>>>>>>> include/standard- headers/linux/virtio_iommu.h  create mode
> >>>>>>>> 100644 linux-headers/linux/virtio_iommu.h
> >>>>>>>>
> >>>>>>>> --
> >>>>>>>> 2.5.5
> >>>>>>>
> >>>>>
> >>>
