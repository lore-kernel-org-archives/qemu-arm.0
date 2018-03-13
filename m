Received: by 10.28.91.67 with SMTP id p64csp931890wmb;
        Tue, 13 Mar 2018 09:54:53 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsj8V67hp5ZAbE83k3p6gTx1ttt8+XLMSh1I0AY1IRyxg7fNGBlH+YS8krn1QYMyrHBJhBS
X-Received: by 10.200.0.18 with SMTP id a18mr2095400qtg.337.1520960093136;
        Tue, 13 Mar 2018 09:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520960093; cv=none;
        d=google.com; s=arc-20160816;
        b=Ofdj/+mP/1Jg0QxuTgUZEBMt8WFsjL+52fcNsVJ5xCcpevkT5L96qFc7iPCJ1QlFBo
         UnDW40SQxX/cSneIq6H0AhevzV/Tm8/N/Nmg/iVQi2ejMBYno2Tr/Q1gzdQZVhGAWcvb
         fZjRHAK1qEm0T3Z5PIveyDnCag4NDBbshsLuJSKgXqU1XWmeRErF6Ej2IrYjKliYBipC
         pC+BtWlcwpw2xXJ+SQx4wst/NwyKPfiR3rl42q6CzqqcPzzI9b/LpYMg1e5NQG6Dkwv2
         CNSdXr6+T67obd1WBy+vV5A5Z5HBgsPG7L0iR1wj3nbGALI2MHvnG02c0I3AHvUXlct0
         z/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :dkim-signature:arc-authentication-results;
        bh=bhRxVStWXH2xGs1EKENKieEDsfJQoAWBtxhyJR8iywc=;
        b=GvBdba+3cwyazV5NnRpnqLC8LHCfJYl+lhOM4R/h1H5t2HraHEIVhxfsaiIA1tC2Cd
         6qHyCZ3SrY6QYEaMKl6clBIMyfKbj2UbupPTYBhp4+kNTDit8ejXELwxze2aFa+tKdoz
         0BRh8ZNE0+HdiR0f5OVQLTVY60RZT6vUEdpY6rT0FtK/w5O8YwZ4xnkY14a0DOkXJMqo
         y9V9+HV1/aCw5taI1yNaUiddiRcJ+XRugqVXXvBY0wRFUWTmW26qGvUbg1ye1VvzgZr2
         xb74MsCpZGnl3oyGLpHYu+EJhOvDnsXPNf5WWQK2bjfcvembkvh103iqxR11UwfLZCj1
         XGBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=CbuC48K5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i33si613882qta.255.2018.03.13.09.54.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 09:54:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=CbuC48K5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41221 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evnCO-0007lO-Is
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 12:54:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1evn1M-0006Rc-9F
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 12:43:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1evn1H-0007X6-RW
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 12:43:28 -0400
Received: from mail-by2nam01on0102.outbound.protection.outlook.com
	([104.47.34.102]:17482
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1evn1H-0007Wp-Gb; Tue, 13 Mar 2018 12:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=bhRxVStWXH2xGs1EKENKieEDsfJQoAWBtxhyJR8iywc=;
	b=CbuC48K5I/8nZoOec49BgM3XeCkCqcYnbFjqUIv+KbOLA45JhDRCY0kdBql+26nXji4cVMTDyskkSAMC/IKSbQhCRPBco1mMIPJDciPpXY60Ur2CeQfNIV3puRt1jPz4zgEGRpczbQEN/1ZbmcmtKPR2PZ7t224u1gPdULxcRYE=
Received: from MWHPR21MB0189.namprd21.prod.outlook.com (10.173.52.135) by
	MWHPR21MB0862.namprd21.prod.outlook.com (10.173.51.144) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.609.2; Tue, 13 Mar 2018 16:43:21 +0000
Received: from MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::6122:609e:a4da:bf1]) by MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::6122:609e:a4da:bf1%12]) with mapi id 15.20.0609.006;
	Tue, 13 Mar 2018 16:43:21 +0000
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH 5/9] hw/arm/bcm2836: Rename bcm2836
	type/struct to bcm283x
Thread-Index: AQHTuuMwVPTYB6p9F0WaZZzTRF+k4KPOXk4A
Date: Tue, 13 Mar 2018 16:43:21 +0000
Message-ID: <MWHPR21MB0189A866E273E023FC1D73119ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-6-peter.maydell@linaro.org>
In-Reply-To: <20180313153458.26822-6-peter.maydell@linaro.org>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-03-13T16:43:19.1932651Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
	Sensitivity=General
x-originating-ip: [2001:4898:80e8:f::610]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0862;
	7:Gs8O48gZZ0HPtqnV1e0DePLxcX4Yd2ndhOrAkXv92CFY+SVWkSzDH2X98UagoMVRaov7Lxsh2+5seAv3VV6wpAFUUsohLqzYm6zQmH9dG43DxAKI9LC0TS5tAN3g3moqw5AHDAUMufm0Ofj7q6wqLBD56PTUIlp8cb40XMSHTJaQSCaeLvcAkP+urwbTIJoI6FseaiqCHWk0XDY3pTxovqb47FboLsMsx1fozeXsUYIryQeoWJoYv55aB6D2uLsq;
	20:II+h4Zvvr8DGEtJTcqj62O5XLUuJoieIFi0oRhdoVA4/jgZfbSPTi6X1rE7xi+ts7lUVmBwfQgJnONhrrEbiPy2PW6tFYVuy8BSeeuI21KfMHFCwVi27jptMZlfA8vVzIW8zigqvD6mQDTG1XSz9feHZStiKoym31HYalmJA/Pw=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 75b0184e-601e-474d-a06c-08d5890187eb
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7193020);
	SRVR:MWHPR21MB0862; 
x-ms-traffictypediagnostic: MWHPR21MB0862:
x-o365-sonar-daas-pilot: True
x-microsoft-antispam-prvs: <MWHPR21MB0862F3116C85CF54AE9F153C9ED20@MWHPR21MB0862.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(89211679590171);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(61425038)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231221)(944501255)(52105095)(6055026)(61426038)(61427038)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:MWHPR21MB0862; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0862; 
x-forefront-prvs: 0610D16BBE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39380400002)(376002)(39860400002)(346002)(366004)(396003)(199004)(189003)(74316002)(3280700002)(6246003)(8990500004)(6116002)(86612001)(10090500001)(106356001)(7696005)(6436002)(110136005)(54906003)(186003)(53936002)(316002)(46003)(9686003)(76176011)(102836004)(2906002)(99286004)(22452003)(55016002)(105586002)(14454004)(478600001)(2900100001)(72206003)(97736004)(86362001)(229853002)(6346003)(2501003)(10290500003)(6506007)(2201001)(5660300001)(5250100002)(68736007)(7736002)(2950100002)(4326008)(33656002)(81166006)(8936002)(81156014)(305945005)(8676002)(25786009)(3660700001)(551934003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0862;
	H:MWHPR21MB0189.namprd21.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-microsoft-antispam-message-info: 3iSu7GMTiNpkFNk6wMUi+Y0RAzoLTCvX8GMy5BGKDSgKdsPYJGR7U1cW0/F0GOnu2rbki5IOYrSlKwtigiq/SGVim3PnB8S+Eo5DaUy9NQcE3FhxFMlL2+UAdrhnvMrGo/9eXg7WhlYcWdywlSaFGkFspM9LvSdFN9xWlhP1J+Fcq88SGp/ChIQK994VsWOQrqaFzyiWYStgj9UIx7RTFVVC63EzZ9ymC75p9QPhXZM/HckiGYgBnkfBXKBQ4Z/BSEaFsHt4fFp40X0lsupOBJ7+oCBxyufex3KuL5A4sstYi85wv49Foml9OtQHAc71UPfuNSJfuA6cOAZG7wVldQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b0184e-601e-474d-a06c-08d5890187eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2018 16:43:21.0531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0862
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.102
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/9] hw/arm/bcm2836: Rename
 bcm2836 type/struct to bcm283x
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	=?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gSccDUjtVfJ4

> From: Qemu-devel <qemu-devel-
> bounces+andrew.baumann=3Dmicrosoft.com@nongnu.org> On Behalf Of Peter
> Maydell
> Sent: Tuesday, 13 March 2018 08:35
>=20
> Our BCM2836 type is really a generic one that can be any of
> the bcm283x family. Rename it accordingly. We change only
> the names which are visible via the header file to the
> rest of the QEMU code, leaving private function names
> in bcm2836.c as they are.
>=20
> This is a preliminary to making bcm283x be an abstract
> parent class to specific types for the bcm2836 and bcm2837.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/bcm2836.h | 12 ++++++------
>  hw/arm/bcm2836.c         | 17 +++++++++--------
>  hw/arm/raspi.c           | 16 ++++++++--------
>  3 files changed, 23 insertions(+), 22 deletions(-)
>=20
> diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
> index 4758b4ae54..9a10a76631 100644
> --- a/include/hw/arm/bcm2836.h
> +++ b/include/hw/arm/bcm2836.h
> @@ -15,12 +15,12 @@
>  #include "hw/arm/bcm2835_peripherals.h"
>  #include "hw/intc/bcm2836_control.h"
>=20
> -#define TYPE_BCM2836 "bcm2836"
> -#define BCM2836(obj) OBJECT_CHECK(BCM2836State, (obj), TYPE_BCM2836)
> +#define TYPE_BCM283X "bcm283x"
> +#define BCM283X(obj) OBJECT_CHECK(BCM283XState, (obj), TYPE_BCM283X)
>=20
> -#define BCM2836_NCPUS 4
> +#define BCM283X_NCPUS 4
>
>=20
> -typedef struct BCM2836State {
> +typedef struct BCM283XState {
>      /*< private >*/
>      DeviceState parent_obj;
>      /*< public >*/
> @@ -28,9 +28,9 @@ typedef struct BCM2836State {
>      char *cpu_type;
>      uint32_t enabled_cpus;
>=20
> -    ARMCPU cpus[BCM2836_NCPUS];
> +    ARMCPU cpus[BCM283X_NCPUS];
>      BCM2836ControlState control;
>      BCM2835PeripheralState peripherals;
> -} BCM2836State;
> +} BCM283XState;
>=20
>  #endif /* BCM2836_H */
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 9266f27c14..1d1908654b 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -25,7 +25,7 @@
>=20
>  static void bcm2836_init(Object *obj)
>  {
> -    BCM2836State *s =3D BCM2836(obj);
> +    BCM283XState *s =3D BCM283X(obj);
>=20
>      object_initialize(&s->control, sizeof(s->control), TYPE_BCM2836_CONT=
ROL);
>      object_property_add_child(obj, "control", OBJECT(&s->control), NULL)=
;
> @@ -44,7 +44,7 @@ static void bcm2836_init(Object *obj)
>=20
>  static void bcm2836_realize(DeviceState *dev, Error **errp)
>  {
> -    BCM2836State *s =3D BCM2836(dev);
> +    BCM283XState *s =3D BCM283X(dev);
>      Object *obj;
>      Error *err =3D NULL;
>      int n;
> @@ -52,7 +52,7 @@ static void bcm2836_realize(DeviceState *dev, Error
> **errp)
>      /* common peripherals from bcm2835 */
>=20
>      obj =3D OBJECT(dev);
> -    for (n =3D 0; n < BCM2836_NCPUS; n++) {
> +    for (n =3D 0; n < BCM283X_NCPUS; n++) {
>          object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
>                            s->cpu_type);
>          object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
> @@ -102,7 +102,7 @@ static void bcm2836_realize(DeviceState *dev, Error
> **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
>          qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));
>=20
> -    for (n =3D 0; n < BCM2836_NCPUS; n++) {
> +    for (n =3D 0; n < BCM283X_NCPUS; n++) {
>          /* Mirror bcm2836, which has clusterid set to 0xf
>           * TODO: this should be converted to a property of ARM_CPU
>           */
> @@ -150,8 +150,9 @@ static void bcm2836_realize(DeviceState *dev, Error
> **errp)
>  }
>=20
>  static Property bcm2836_props[] =3D {
> -    DEFINE_PROP_STRING("cpu-type", BCM2836State, cpu_type),
> -    DEFINE_PROP_UINT32("enabled-cpus", BCM2836State, enabled_cpus,
> BCM2836_NCPUS),
> +    DEFINE_PROP_STRING("cpu-type", BCM283XState, cpu_type),
> +    DEFINE_PROP_UINT32("enabled-cpus", BCM283XState, enabled_cpus,
> +                       BCM283X_NCPUS),
>      DEFINE_PROP_END_OF_LIST()
>  };
>=20
> @@ -164,9 +165,9 @@ static void bcm2836_class_init(ObjectClass *oc, void
> *data)
>  }
>=20
>  static const TypeInfo bcm2836_type_info =3D {
> -    .name =3D TYPE_BCM2836,
> +    .name =3D TYPE_BCM283X,
>      .parent =3D TYPE_DEVICE,
> -    .instance_size =3D sizeof(BCM2836State),
> +    .instance_size =3D sizeof(BCM283XState),
>      .instance_init =3D bcm2836_init,
>      .class_init =3D bcm2836_class_init,
>  };
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 1ac0737149..58c6e80a17 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -32,7 +32,7 @@
>  static const int raspi_boardid[] =3D {[1] =3D 0xc42, [2] =3D 0xc43, [3] =
=3D 0xc44};
>=20
>  typedef struct RasPiState {
> -    BCM2836State soc;
> +    BCM283XState soc;
>      MemoryRegion ram;
>  } RasPiState;
>=20
> @@ -136,7 +136,7 @@ static void raspi_init(MachineState *machine, int
> version)
>      BusState *bus;
>      DeviceState *carddev;
>=20
> -    object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM2836);
> +    object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM283X);
>      object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
>                                &error_abort);
>=20
> @@ -189,9 +189,9 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->no_floppy =3D 1;
>      mc->no_cdrom =3D 1;
>      mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a15");
> -    mc->max_cpus =3D BCM2836_NCPUS;
> -    mc->min_cpus =3D BCM2836_NCPUS;
> -    mc->default_cpus =3D BCM2836_NCPUS;
> +    mc->max_cpus =3D BCM283X_NCPUS;
> +    mc->min_cpus =3D BCM283X_NCPUS;
> +    mc->default_cpus =3D BCM283X_NCPUS;
>      mc->default_ram_size =3D 1024 * 1024 * 1024;
>      mc->ignore_memory_transaction_failures =3D true;
>  };
> @@ -212,9 +212,9 @@ static void raspi3_machine_init(MachineClass *mc)
>      mc->no_floppy =3D 1;
>      mc->no_cdrom =3D 1;
>      mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a53");
> -    mc->max_cpus =3D BCM2836_NCPUS;
> -    mc->min_cpus =3D BCM2836_NCPUS;
> -    mc->default_cpus =3D BCM2836_NCPUS;
> +    mc->max_cpus =3D BCM283X_NCPUS;
> +    mc->min_cpus =3D BCM283X_NCPUS;
> +    mc->default_cpus =3D BCM283X_NCPUS;
>      mc->default_ram_size =3D 1024 * 1024 * 1024;
>  }
>  DEFINE_MACHINE("raspi3", raspi3_machine_init)

Reviewed-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
