Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp558960ejc;
        Thu, 24 Aug 2023 02:07:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2f9PDiWRPT6gHnqspZqNJUEJN+1ca1ScqpPY+p3CH/R/FdGlo5mDN84MatbM62pdRVYtr
X-Received: by 2002:a05:620a:44cd:b0:767:dd02:e908 with SMTP id y13-20020a05620a44cd00b00767dd02e908mr19354367qkp.64.1692868032387;
        Thu, 24 Aug 2023 02:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692868032; cv=none;
        d=google.com; s=arc-20160816;
        b=iZSdmIjdLriCq3xHSO0vrzvHUBF1Br9eAjaovIt5GgwfCtHxwLiITYnb43ytDV0ygh
         e01RacJiatNC6B8BPd7qRF4vCI9gXBd9kM9siBmzwEiM7usCPXaQoEOXQx++jetnV2Z1
         rEwQsCTtUK3wRX3NDwodcjGfPcyYC7IXeeml6p3kFaiYDTWstZzHFzM5+n0voyK9848z
         3P5BC8MIBIj5R30/KJrJjU/Zm1sf4h5b2mKM/h93i3DihjvxEphkJg7vUlDzavBIodHb
         tBO6iG4FJMxbTi9WIATHwyfqyxKhawTnVHJ0JwHv2svVV/gKXa0jcxLIhYMqX0ACRdtY
         rdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=Z7XHJIldVR3GLdVuDANhuuF9VsYzqbyJPGVrkW0FM+A=;
        fh=A1uafpQMEBDAHS3//ewtTcHqD+pAKBUNygdllEcuLS4=;
        b=iZLAkwTmpA1h3Y/32bStTmsTNVBMiRL78Hy2glAuDwiHrpG/7gDeigeYYtYsC538QW
         Hi5vpqGBkoqOlkgEHLOwxDAzFLHe7S6Ha2RBx21aJF5aollc/m63dFpc2r9kg0PGaDz6
         3ku9EKrFKy2fKqgcZUOGXH7weT5JcnikT5wTcymCaiqKxK2vyM7TQPSPmtyNwmjcZUTN
         rP0TuMFGkznwdSKrp7kHfFDxoAVbexxjT84Qv0ZjxfQ942TA+sekGc0Wwc1AaFjYT4Cb
         48BedBpQceBwfWG3wLcq9yPuApF0r8T1IbNDebtdSxHS60EOuj3XN/rWwBjWLbrOxiN3
         lUHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a05620a0c4700b0076ce7b71d9fsi8301955qki.586.2023.08.24.02.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 02:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZ6Iv-00038i-TQ; Thu, 24 Aug 2023 05:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qZ6Iv-00038B-0g
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 05:07:01 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qZ6Iq-0007EO-2Y
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 05:07:00 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RWccv6YVpz6D8cD;
 Thu, 24 Aug 2023 17:05:51 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 24 Aug
 2023 10:06:36 +0100
Date: Thu, 24 Aug 2023 10:06:35 +0100
To: Gregory Price <gregory.price@memverge.com>
CC: Yuquan Wang <wangyuquan1236@phytium.com.cn>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: CXL Namespaces of ACPI disappearing in Qemu demo
Message-ID: <20230824100635.0000565d@Huawei.com>
In-Reply-To: <ZOZho3SyqASo9MPD@memverge.com>
References: <2023082215220191352877@phytium.com.cn>
 <ZOZho3SyqASo9MPD@memverge.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: n5o/8oeIxIVy

On Wed, 23 Aug 2023 15:44:35 -0400
Gregory Price <gregory.price@memverge.com> wrote:

> On Tue, Aug 22, 2023 at 03:22:02PM +0800, Yuquan Wang wrote:
> > Hi, Gregory
> > I am sorry to disturb you, but there was still an ignored problem about=
 CXL,=20
> > Although I had sent an email to jonathan (maybe he is busy recently so =
he forgot to reply), =20
> > the Link is : https://lists.nongnu.org/archive/html/qemu-arm/2023-08/ms=
g00278.html=20
> >=20
> > Maybe the core question is that how should we use CXL components with a=
 standard PCIe system=EF=BC=9A
> > 1) In Qemu, since the boards or machines in qemu can only use pxb-cxl (=
attached on pcie.0) to add
> > cxl host bridge, therefore, users should avoid to assign an occupied bu=
s number by other devices
> > to pxb-cxl.
> >=20
> > 2) In real hardware, CXL components should use independent CXL root/tre=
e (ACPI0017&ACPI0016)
> > to separate from the namespace of default pcie root/domain.
> >=20
> > I would be grateful if you have some free time to help check this issue=
 : )
> >  =20
>=20
> Generally speaking, ACPI questions are outside the scope of my
> knowledge, but to the extent that i have debugged QEMU for CXL I can say
> that #1 is correct - the host bridge adapter should not share PCI bus
> id's with anything else or you will have issues.  This can be
> frustrating if you don't know what the magic numbers are.
>=20
> for my work, i have been using this when i need to attach two pxb-cxl
> deivces
>=20
> qemu-system-x86_64 \
> -drive file=3D./cxl.qcow2,format=3Dqcow2,index=3D0,media=3Ddisk,id=3Dhd \
> -m 4G,slots=3D4,maxmem=3D8G \
> -smp 4 \
> -machine type=3Dq35,cxl=3Don,hmat=3Don \
> -device pxb-cxl,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52 \
> -device pxb-cxl,id=3Dcxl.1,bus=3Dpcie.0,bus_nr=3D191 \
>=20
>=20
> In regards to real hardware, I'm honestly not knowledgable enough about
> ACPI or hardware to provide an intelligible answer unfortunately.
>=20
> ~Gregory

One additional thing to note. Nothing stops you putting a PCI device on a C=
XL
root port, or downstream switch port.  Some of the reporting is probably wr=
ong
at the moment, but I've messed around with NVME below one and that 'works' =
fine
as Linux doesn't read the relevant registers anyway.

Jonathan
