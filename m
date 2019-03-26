Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp5370880wrx;
        Tue, 26 Mar 2019 10:44:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzg/GplMZouEhMNjn4GtjueuukYJPutnPcVM1ODlQzYUQHU2LoTz4KmdzCSMut0yIdDxVDe
X-Received: by 2002:a02:9f93:: with SMTP id a19mr11363160jam.123.1553622285982;
        Tue, 26 Mar 2019 10:44:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553622285; cv=none;
        d=google.com; s=arc-20160816;
        b=L5q4hm+7t/OGV8I9/A7bPif2N5tnvCsbg5V+xZ3VlxksEIDTh2M2DtKAKWBpMr0Hme
         aieqod8msLpfa0JQXYPMa9gA9D9UXTsSBPsW922vfyg2l6Hz47KitJkX1Q2tKUQSMNav
         tweuFGF4V3nvOW9ECJu4FU3+qhce3+Ivdy3fTzHKRR7/3Cm41y/PEOp0zQTkHTPUvLTd
         J5xc2Yidjp1n59wAOtcLlh+mR59B8trmXLZExyMAObtPOnY63BmPveKZcMNPIFcSYWBE
         +Ie7EgQadAWKadISlAPb4COFspk2T+RTu4n+TCQpnpYOZvI4mJ1jeuW/w8oA+FhXRWC0
         4QDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from:dkim-signature;
        bh=uIhHohfdFfLmU/WwKn9qmMcmhnZM0uNsfLbI5nqiwq8=;
        b=HSTPGAaIiagGPvz5UayXocc7Z1uvDzMGrLZm0aYqZPOwkF09gz05IDvYbShXYcIT1f
         omQ0HFfzhOXDx2aqkP+FLn7C4J5sO+sNVGAGgDDmAtjlwjrTjuIi12ZQydkk5DrfJxqL
         sTfx+BavatZjAlwgFYTPDoVZLCitpm4GEwRP7dUgj76WhAKYzgRbpBUiZl912DkOcdu+
         TuxUIoISpi+a/wVakMjtHahy7IHea0nqnuoVARC/m6f7co6xvcvcvxatomadIkMFCYhF
         RsOpTbak6bIO+YKGKJBGt6m85C4CqqY7NF0tn7n2tAJBX0lsKAY9uxBTvbGQuXSbPOBj
         cWwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=MY6yidrS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si9455629jal.92.2019.03.26.10.44.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Mar 2019 10:44:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=MY6yidrS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:35795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8q7x-0004h3-6V
	for alex.bennee@linaro.org; Tue, 26 Mar 2019 13:44:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1h8q55-0002d7-UQ
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 13:41:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1h8prq-0001MM-Mk
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 13:28:08 -0400
Received: from mail-eopbgr740115.outbound.protection.outlook.com
	([40.107.74.115]:30408
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1h8prn-0001JI-8O; Tue, 26 Mar 2019 13:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=uIhHohfdFfLmU/WwKn9qmMcmhnZM0uNsfLbI5nqiwq8=;
	b=MY6yidrS3JFdFcUrCvhE7gTQ5+03LIw8SuoMtZXULfuL4wZ7pqavUevOGTLoqf2hkMxsY1EmiwY0TRr/3lanVN0m3lxyd63YrXzzopdTfE01Omi2jNw4RL4pQHW/DGrikKShGFupQn7D/VR7vXDH8lz0QOzfoUbPHEZPTnm1XPU=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4811.prod.exchangelabs.com (20.177.218.204) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1730.19; Tue, 26 Mar 2019 17:27:57 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d048:df23:56d0:cff5]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d048:df23:56d0:cff5%3]) with mapi id 15.20.1730.013;
	Tue, 26 Mar 2019 17:27:57 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: Andrew Jones <drjones@redhat.com>
Thread-Topic: [PATCH 3/3] target/arm: make pmccntr_op_start/finish static
Thread-Index: AQHU4MufC+vXa0XCQke+NXk/PvaiC6YeMO0A
Date: Tue, 26 Mar 2019 17:27:57 +0000
Message-ID: <20190326172800.GH28178@quinoa.localdomain>
References: <20190322162333.17159-1-drjones@redhat.com>
	<20190322162333.17159-4-drjones@redhat.com>
In-Reply-To: <20190322162333.17159-4-drjones@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR03CA0091.namprd03.prod.outlook.com
	(2603:10b6:910:4d::32) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.153]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9c47b47-1288-4918-a06f-08d6b21062d9
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4811; 
x-ms-traffictypediagnostic: DM6PR01MB4811:
x-microsoft-antispam-prvs: <DM6PR01MB481186E8169D1E4DD512A52A8A5F0@DM6PR01MB4811.prod.exchangelabs.com>
x-forefront-prvs: 09888BC01D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(39840400004)(366004)(346002)(396003)(136003)(189003)(199004)(76176011)(53936002)(106356001)(52116002)(478600001)(6506007)(386003)(26005)(446003)(105586002)(11346002)(186003)(5660300002)(14454004)(68736007)(33656002)(8936002)(102836004)(9686003)(6512007)(71200400001)(6246003)(486006)(2906002)(71190400001)(476003)(305945005)(8676002)(99286004)(3846002)(7736002)(81156014)(6116002)(316002)(54906003)(81166006)(66066001)(97736004)(14444005)(6486002)(25786009)(256004)(4326008)(86362001)(229853002)(1076003)(6436002)(6916009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4811;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hqpy1dHe8t0lRE6Y3wu63LQAxenRe1BR/nQeVt6kpi0Ahr3AvleclL68B7Epti52x/6aVQc+UutshihqvMKoqdCtoJ416jHzq0XThe4CPLClFb7cU6krv3Fo7ysP4dhQs+axUoIQMWOrQ5nkPY3dgovsKKhqp2lFrhBQ34r3vQ0c4CTxo1yglgoKr4djov/apB0BAkOd8i+N08rNHspOdIMK6gIVMIHgohmq/VXjwZ3+dsoPoSc5lMqI8xUznG5hZOXKYd1vTHkEt+K+cxiNhufnobDWIz+MgH5whPy5RUBslJeSGUg70ux7p5Gk8CPt9lGvTLQuFrud77SR/w1hHOuI0hHq+T06ZjuGCMXCibfI6oSBSJCcdAJqkwDBB5TOaS4WuoPfRYtnkNe6WgR+lGaH4yE84xwDVVODYWV7ybA=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <94941B9710EC0B409B0C28C5993DA33F@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c47b47-1288-4918-a06f-08d6b21062d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2019 17:27:57.1977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4811
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.115
Subject: Re: [Qemu-arm] [PATCH 3/3] target/arm: make pmccntr_op_start/finish
 static
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
X-TUID: yFdEIS2SLf6G

On Mar 22 17:23, Andrew Jones wrote:
> These functions are not used outside helper.c
>=20
> Signed-off-by: Andrew Jones <drjones@redhat.com>

I'm late to the party, but:

Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>

> ---
>  target/arm/cpu.h    | 11 -----------
>  target/arm/helper.c |  4 ++--
>  2 files changed, 2 insertions(+), 13 deletions(-)
>=20
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 5f23c621325c..d4d2836923df 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -992,17 +992,6 @@ static inline bool is_a64(CPUARMState *env)
>  int cpu_arm_signal_handler(int host_signum, void *pinfo,
>                             void *puc);
> =20
> -/**
> - * pmccntr_op_start/finish
> - * @env: CPUARMState
> - *
> - * Convert the counter in the PMCCNTR between its delta form (the typica=
l mode
> - * when it's enabled) and the guest-visible value. These two calls must =
always
> - * surround any action which might affect the counter.
> - */
> -void pmccntr_op_start(CPUARMState *env);
> -void pmccntr_op_finish(CPUARMState *env);
> -
>  /**
>   * pmu_op_start/finish
>   * @env: CPUARMState
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index fc73488f6cc0..a36f4b3d6997 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1337,7 +1337,7 @@ static void pmu_update_irq(CPUARMState *env)
>   * etc. can be done logically. This is essentially a no-op if the counte=
r is
>   * not enabled at the time of the call.
>   */
> -void pmccntr_op_start(CPUARMState *env)
> +static void pmccntr_op_start(CPUARMState *env)
>  {
>      uint64_t cycles =3D cycles_get_count(env);
> =20
> @@ -1367,7 +1367,7 @@ void pmccntr_op_start(CPUARMState *env)
>   * guest-visible count. A call to pmccntr_op_finish should follow every =
call to
>   * pmccntr_op_start.
>   */
> -void pmccntr_op_finish(CPUARMState *env)
> +static void pmccntr_op_finish(CPUARMState *env)
>  {
>      if (pmu_counter_enabled(env, 31)) {
>  #ifndef CONFIG_USER_ONLY
> --=20
> 2.17.2
>=20
