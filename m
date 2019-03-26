Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp5368368wrx;
        Tue, 26 Mar 2019 10:41:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwIJzZT0dMRwTZGhzmIVYVJvQ8RQZTeZmdZvgNgceC3mM+X8gISkzQ5phETAhGmKu/sJnEF
X-Received: by 2002:a02:9345:: with SMTP id e5mr23623922jah.29.1553622099929;
        Tue, 26 Mar 2019 10:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553622099; cv=none;
        d=google.com; s=arc-20160816;
        b=fuAAJdF9GWzFaKl5iKAShcmaVzWaFRl+oSJiY3278hosKuWcpyjllljdQUHdu/kRfT
         EdznT8395HwIKPqoc4gOST8fliJQX+E1piNgNKO1vYGYP7uUQV1IyaG7W4PlmRTU31de
         CqgfWQPBMZ1srBMFx02f3xstSjAMLgwRJ6Wzdrtu4ULGrVXDVAEC4Z1FezSMuthdwIqx
         b1/gX8MSz07I2j3nyUWwrbXlarn8KQuXjBi1IuhnYdfH+nB7+QiYhXrcG1Gt9zQFOTqH
         8QYM+TQIDet1RMaxaWQVxCGvA/HJDQ/7sYEQmpAADe1jU+I7r6rBv+GXIU8YFYQfcm9z
         ruDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from:dkim-signature;
        bh=nZ2i3iIDtCEA6N6qQbS7jwkbLVHbeuZ2CJ9hAr/U3yE=;
        b=NRMF8dZMDIC6D6HlxWhkUcqh+7hDnEQsF+vLKkQKB9AkIXcHVAmMdb+Fl9YShEO7aI
         dNgwX3Fbf2JdIXDjdM5fr3VWU8YzNkfkKduijZdmxEt7WRx6bIqOXvvNm+ol+I5Ncu4m
         snlCGmKzaK1LL1LcoAsLVBn9+LrkGmoHHViAc+L7A78QYUJ4ciT+R1ARIfCNmo6eU/IC
         VZonPR4S4t5ptxKr6KypEyNlSAIrW2zMVX/6ATrGzBu1UB9EKuejADfLNA+GxXlT6dVw
         FdlFZs/mzcUJa+Z5cA2WdEMbF7eviNqDtrLClCNZ1z4zIGxfwXjdp5q3xoyBMsntqJNH
         kiUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=aFFApqeu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14si2822503itm.24.2019.03.26.10.41.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Mar 2019 10:41:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=aFFApqeu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:35744 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8q4x-0002Na-3m
	for alex.bennee@linaro.org; Tue, 26 Mar 2019 13:41:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1h8q4g-0002KY-6I
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 13:41:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1h8q26-0005kb-Bj
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 13:38:43 -0400
Received: from mail-eopbgr780105.outbound.protection.outlook.com
	([40.107.78.105]:35136
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1h8q25-0005jI-38; Tue, 26 Mar 2019 13:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nZ2i3iIDtCEA6N6qQbS7jwkbLVHbeuZ2CJ9hAr/U3yE=;
	b=aFFApqeuUK/+OBtkYT93SaZ9vVlFUThzqBv++NzMKFDyWpx9MNO0pndXm+WidQlXPgwRkDw5IZLVlnPFfZW3J/CHcRq85qVE2Gf5W41oTNRb4kAXpWXzjSXvImvSBSb2US8vnaTr+06ykRM3b8Lc8p2fiwtMCbPJj2x8TZ9vsvk=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5306.prod.exchangelabs.com (20.177.220.83) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1730.18; Tue, 26 Mar 2019 17:38:37 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d048:df23:56d0:cff5]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d048:df23:56d0:cff5%3]) with mapi id 15.20.1730.013;
	Tue, 26 Mar 2019 17:38:37 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: Andrew Jones <drjones@redhat.com>
Thread-Topic: [PATCH 2/3] target/arm: cortex-a7 and cortex-a15 have pmus
Thread-Index: AQHU4Mud6LNwxyWNvkGkDlrMB9vPFqYeM+0A
Date: Tue, 26 Mar 2019 17:38:36 +0000
Message-ID: <20190326173844.GJ28178@quinoa.localdomain>
References: <20190322162333.17159-1-drjones@redhat.com>
	<20190322162333.17159-3-drjones@redhat.com>
In-Reply-To: <20190322162333.17159-3-drjones@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR06CA0054.namprd06.prod.outlook.com
	(2603:10b6:903:13d::16) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.153]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c61007a1-1d77-4eb9-b3da-08d6b211e054
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5306; 
x-ms-traffictypediagnostic: DM6PR01MB5306:
x-microsoft-antispam-prvs: <DM6PR01MB53063FB53DC116D2E4AC01228A5F0@DM6PR01MB5306.prod.exchangelabs.com>
x-forefront-prvs: 09888BC01D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(346002)(376002)(136003)(39840400004)(199004)(189003)(99286004)(66066001)(5660300002)(6436002)(68736007)(86362001)(14444005)(229853002)(105586002)(106356001)(1076003)(97736004)(6116002)(81156014)(71200400001)(256004)(7736002)(6486002)(8676002)(305945005)(81166006)(3846002)(53936002)(9686003)(71190400001)(6512007)(26005)(4326008)(6246003)(102836004)(386003)(6506007)(14454004)(25786009)(54906003)(478600001)(2906002)(8936002)(486006)(6916009)(186003)(52116002)(316002)(476003)(76176011)(33656002)(11346002)(446003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5306;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zjgbKrfJCER5FM2bqWHOZbhTywiZhTJ0JN2loIQgDHtA4Qbc++Fu2WIeIknpWxmPhUdYB4gkQOkC1Ku9F1M6/Oel7ugjjuLoDI8/0W8lZcOQ/N0KcssmrkusSwSpgPOz2lkPWVvkhN2x9Oqdu6yZCuHWWhq5Cd+Ieb4wDDda23OT9VdZi41gBTC2uC8G9YBvuEGDYVuqxBesnbvl8jjxGaYeSLQ2qGN6mXk038SmLORKXKA4rzuugztUXTf36/3pkpSlSpY0+OVPC/LFkA1W5UZBQB4cgBtBYr+q1u99Z1x6CNxkg3O2BfdTg4EqatCb+gteTZukYNklcqbfeJ9Ygtgl/yYf8HAmnLjzUx2god64F/tjSJuoz9WGNlF5brCYvE7BH1gCrqRrquHQULIjKISVUzZxnLPb8divK1dHwMg=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FC6F3FE22713A74DA5B6F58F0C4723B9@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61007a1-1d77-4eb9-b3da-08d6b211e054
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2019 17:38:37.0131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5306
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.78.105
Subject: Re: [Qemu-arm] [PATCH 2/3] target/arm: cortex-a7 and cortex-a15
 have pmus
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
X-TUID: tl/ddAOff6gY

On Mar 22 17:23, Andrew Jones wrote:
> cortex-a7 and cortex-a15 have pmus (PMUv2) and they advertise
> them in ID_DFR0. Let's allow them to function. This also enables
> the pmu cpu property to work with these cpu types, i.e. we can
> now do '-cpu cortex-a15,pmu=3Doff' to remove the pmu.

I'm a little nervous about this one, but PMUv2 isn't fresh enough in my
mind to have a good reason other than that I didn't consider it when
writing my recent PMU patches. Do you know if this boots a kernel that
can detect and use the PMU successfully while thinking it's PMUv2?

-Aaron

> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 96f0ff0ec727..504a4771fbd3 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1109,6 +1109,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>  #endif
>      } else {
>          cpu->id_aa64dfr0 &=3D ~0xf00;
> +        cpu->id_dfr0 &=3D ~(0xf << 24);
>          cpu->pmceid0 =3D 0;
>          cpu->pmceid1 =3D 0;
>      }
> @@ -1744,6 +1745,7 @@ static void cortex_a7_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>      set_feature(&cpu->env, ARM_FEATURE_EL2);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
>      cpu->kvm_target =3D QEMU_KVM_ARM_TARGET_CORTEX_A7;
>      cpu->midr =3D 0x410fc075;
>      cpu->reset_fpsid =3D 0x41023075;
> @@ -1789,6 +1791,7 @@ static void cortex_a15_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>      set_feature(&cpu->env, ARM_FEATURE_EL2);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
>      cpu->kvm_target =3D QEMU_KVM_ARM_TARGET_CORTEX_A15;
>      cpu->midr =3D 0x412fc0f1;
>      cpu->reset_fpsid =3D 0x410430f0;
> --=20
> 2.17.2
>=20
