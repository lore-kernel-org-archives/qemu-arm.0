Received: by 10.223.161.27 with SMTP id o27csp2290622wro;
        Mon, 30 Oct 2017 02:57:24 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RZaIOLeIjBNxPrHAlIRedY9wMPvzH/m1f1krVm/OL3c18ORNL+TZ8SI9XbJbiLszX1hSB7
X-Received: by 10.129.159.16 with SMTP id w16mr5758467ywg.479.1509357444639;
        Mon, 30 Oct 2017 02:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509357444; cv=none;
        d=google.com; s=arc-20160816;
        b=T5p8NCMQgHu7a+rZet8Eg2UpeXu3HahUZOaAj1zS8ZXm4IDJq3Dm8KGWGirHOhDFYE
         t6FrJPysq0M0e/F6tF2+jljEu+xpLlgp+Kwzj0iiStbnT9AZPHSjhHRCTQAIG3TsdsDv
         BpCxOhfVqmpsepsoM9mF7F5lzSWNR/bPSybfcaQ3c97BVcOu9DFnT41E8YTLD/Ip1sAS
         rWDpJOcgZpOKBU2proWIhGiUblvCsBaCvDZsjFtPP7zv48+y6zYsQOGIfjWP8kwPe+8J
         m54S3bJaR21Xw2HmMdXtox4dGhO77o3+T6nDmPsBneHFlSdQMWY83Cc/YGVQWW1ZQqjZ
         ljqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=RVBppM1QL+QTO9NRyc5AwB1/tR6g9SIzeYshbMQX0ZQ=;
        b=LoVy7ct/uxJV7EPtFQLIpdUKuYYf4692dS0ZsSsJnjUJ5MH0IxA/vX42x5eF87hfdx
         s2Baa5+WMm5eCX7W+3CgMBE+mtQgRiqSUpbUUAO3nsHlsriUXBnjdjebnbRc6E4X2mnn
         HhmYDx//fy7qQD/9XT+kh84k7g6jRczmEQOORQ0Mzpd14WVsQzY+lvhs7sfnSGA0e79s
         C2qtf9+s9/sqokGJ5dYA1P9Vl9N+SD3QTeSlnwURy/2mfxiKH8IhPvsbv5GOcCAG3r7G
         9BEPPqlx9ysX9wajl7oJnT0rhIdhAWw2v86cGGsxE4STjA0pRXkzQiqWpRLozq1JFDXP
         RHJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gVKOQSny;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o64si2086161ywe.731.2017.10.30.02.57.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Oct 2017 02:57:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gVKOQSny;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39547 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e96ou-0006Bj-2w
	for alex.bennee@linaro.org; Mon, 30 Oct 2017 05:57:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e96ol-0006AQ-35
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 05:57:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e96oh-0002HP-8F
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 05:57:15 -0400
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:49549)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e96oh-0002Gz-0d
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 05:57:11 -0400
Received: by mail-wr0-x241.google.com with SMTP id g90so11885771wrd.6
	for <qemu-arm@nongnu.org>; Mon, 30 Oct 2017 02:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RVBppM1QL+QTO9NRyc5AwB1/tR6g9SIzeYshbMQX0ZQ=;
	b=gVKOQSnyUfPA0ZCf5KuGWQud44LinJMyiAcRzsJcWc2/hHroAwB8KIPZi22cdpsDsj
	5d+o8gbB/5hBzgr7/U2OmyxOTWZBFY1M/T1jnjA8bFvTviqDgsc4czkvpUnuDbsqDrMc
	QEgIL3rjfVPYGfIdehX3df4yfawA+Kwgclf7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RVBppM1QL+QTO9NRyc5AwB1/tR6g9SIzeYshbMQX0ZQ=;
	b=khbFvJe0E+M7GrjJjGDC77ZkWUaFWXM0gcANI7p0c/EHsg55VM32zqmVl7pKGOa4gI
	dP/j/fmD8/rIbb6coVVPf6rSomQ6OQGYq68JIs0Tr09U6R17re0DvEZ1fOSIC4P2PgzD
	DAR3agPWKTqrQCbNJdxk1TS0y1b4usMsCadpl6ksd3lMBKx5gYSK9ipyDF+TB+Pri8UP
	xfwkAAESFqs6jgcH6ILi5j3GvF+7i/uzC7d3LZAl8eyhEsMtt5R4wX6lM/CoO+IzCxFq
	TcgCMDZeFcLpDoUgv2eXha7EaJ21oMTFtzXhaX5+7G6tZolxcP3reAa7P29PL43KcC8D
	K9vQ==
X-Gm-Message-State: AMCzsaXYzWlJdE4MpXE8G28E8zbPSI4y/qXksCR3WMeAr5aLpsrUKD7D
	HFOddLjLefUPrD7z/i4uHeLwyYd3H8kjeFzj7dQIAg==
X-Received: by 10.223.143.54 with SMTP id p51mr6729730wrb.138.1509357429823;
	Mon, 30 Oct 2017 02:57:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 30 Oct 2017 02:56:49 -0700 (PDT)
In-Reply-To: <20171030032521.2441-1-f4bug@amsat.org>
References: <08178b4217d1692297b8c9620b6d13a80bfb6822.1509175660.git.alistair.francis@xilinx.com>
	<20171030032521.2441-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Oct 2017 09:56:49 +0000
Message-ID: <CAFEAcA-bwavBtd0Xe2gYtY3pWjHjrccAtUNfiSD2w4xt7PbrCA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-arm] [PATCH v3] xlnx-zcu102: Specify the number of max
 CPUs
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XGvNAQxWco2b

On 30 October 2017 at 03:25, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> From: Alistair Francis <alistair.francis@xilinx.com>
>
> Specify the number of CPUs that can run on ZynqMP.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> V3:
>  - Fix my ASCII noncompliant last name in Reviewed-by tag :(
>  - added Tested-by for what it's worth
>
> V2:
>  - Use macros
>
>  hw/arm/xlnx-zcu102.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 519a16ed98..e2d15a1c9d 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -240,6 +240,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClas=
s *oc, void *data)
>      mc->block_default_type =3D IF_IDE;
>      mc->units_per_default_bus =3D 1;
>      mc->ignore_memory_transaction_failures =3D true;
> +    mc->max_cpus =3D XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS=
;
>  }
>
>  static const TypeInfo xlnx_zcu102_machine_init_typeinfo =3D {


Applied to target-arm.next, thanks.

-- PMM
