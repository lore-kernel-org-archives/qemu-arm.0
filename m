Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp499800ejs;
        Tue, 9 Jan 2024 08:38:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqDxjYGf/16pVu4cQL4xY4j/gsL8OlSozPMLJtMbOwpn0XXXVTP3+t3Ohx2FuNz984T93i
X-Received: by 2002:a05:6870:8a0a:b0:206:c73:2a40 with SMTP id p10-20020a0568708a0a00b002060c732a40mr6180089oaq.114.1704818337995;
        Tue, 09 Jan 2024 08:38:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704818337; cv=none;
        d=google.com; s=arc-20160816;
        b=zraqtwZ3auLynultKMu9myrdfFmIa/gAFEzWc7e8LsULTirrgn2KY6XjaqmWtybemM
         7ORC1GgmbJIEpT2FARg1mRmLRPpjZP5wEQgCWLG7PD+HOKvA8zMse3f/CHR+F9KC9321
         claP4bVLWGL3ByGxUGPfRqkutFq2S9/J+J0ZAwQv0xbd7DkubLRzq8RRJrKjgYrgrOhV
         uVvVjM2jdURaNDJVwIYMWtYdU7X9AWPJYKKUNtJtafOSnCsvq2fpKYmjMUwLMaHAKqDA
         piybw25PE4k0vjxzCrwFTRNzTXHAPPi3whqFM884oUA2OMAkJd9IDP4s8ryHyyuMbGwR
         G3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=V+rcWUvTN+eg4r5EYuCIMCRptMTQex7uxmfgFzbofjA=;
        fh=UG0QDQ2Ps/TMJesf45IXVQKYbGZ2ZTbtA7MOT/CrVeY=;
        b=PUKqXjWtKJN+eoY3dR8Xz6AYWrpmy22glqKpdsBDNl/YdSBkgzJH1LXv+fBS7hHH+0
         tyUspPPAXn0ecb5g/Zr88QZFEJjMHjsDzoQPOJM2j4PHUKSYhdoyURLwXIfnqWK99Mln
         qUV+AELxm3Q4ZM6Db+cH1QzxAY0ICU7lMfBcGEvkbljq+nUWPzyudLrQUBDQ+H4lu4u1
         3eElewNXFByKXdtAqDvhiWhhJMmhIpMZKY13fQIX8QRzzYZQRdGyBnol2+DT7eMhOS04
         xpSDkwF07Ld3U6ky9vZ2wJLGTvT1d/yecAI6nkv1wGTvaOlGNQ/WKAQS38iipy4Xa0ml
         SXVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w20-20020a05622a191400b004297ffb1571si2444926qtc.216.2024.01.09.08.38.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jan 2024 08:38:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNF7W-0007DY-NM; Tue, 09 Jan 2024 11:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rNF7T-0007DB-RH; Tue, 09 Jan 2024 11:38:28 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rNF7R-00038c-1B; Tue, 09 Jan 2024 11:38:27 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4T8c4C2TwZz6K6c6;
 Wed, 10 Jan 2024 00:35:39 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id EFB74140A36;
 Wed, 10 Jan 2024 00:38:13 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Jan
 2024 16:38:13 +0000
Date: Tue, 9 Jan 2024 16:38:12 +0000
To: Ankit Agrawal <ankita@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "clg@redhat.com" <clg@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "ani@anisinha.ca"
 <ani@anisinha.ca>, "berrange@redhat.com" <berrange@redhat.com>,
 "eduardo@habkost.net" <eduardo@habkost.net>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "eblake@redhat.com"
 <eblake@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "david@redhat.com" <david@redhat.com>, "gshan@redhat.com" <gshan@redhat.com>, 
 Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>, Vikram
 Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>, Dheeraj Nigam
 <dnigam@nvidia.com>, "Uday Dhoke" <udhoke@nvidia.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v6 1/2] qom: new object to associate device to numa node
Message-ID: <20240109163812.000030a3@Huawei.com>
In-Reply-To: <SA1PR12MB7199DF47EDDA9419E22FD79FB067A@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20231225045603.7654-1-ankita@nvidia.com>
 <20231225045603.7654-2-ankita@nvidia.com>
 <20240102125821.00001aa0@Huawei.com>
 <SA1PR12MB7199DF47EDDA9419E22FD79FB067A@SA1PR12MB7199.namprd12.prod.outlook.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_FILL_THIS_FORM_SHORT=0.01,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: /8o50PDTgF0p

On Thu, 4 Jan 2024 03:36:06 +0000
Ankit Agrawal <ankita@nvidia.com> wrote:

> Thanks Jonathan for the review.
>=20
> > As per reply to the cover letter I definitely want to see SRAT table du=
mps
> > in here though so we can easily see what this is actually building. =20
>=20
> Ack.
>=20
> > I worry that some OS might make the assumption that it's one GI node
> > per PCI device though. The language in the ACPI specification is:
> >=20
> > "The Generic Initiator Affinity Structure provides the association betw=
een _a_
> > generic initiator and _the_ proximity domain to which the initiator bel=
ongs".
> >=20
> > The use of _a_ and _the_ in there makes it pretty explicitly a N:1 rela=
tionship
> > (multiple devices can be in same proximity domain, but a device may onl=
y be in one).
> > To avoid that confusion you will need an ACPI spec change.=A0 I'd be ha=
ppy to
> > support =20
>=20
> Yeah, that's a good point. It won't hurt to make the spec change to make =
the
> possibility of the association between a device with multiple domains.
>=20
> > The reason you can get away with this in Linux today is that I only imp=
lemented
> > a very minimal support for GIs with the mappings being provided the oth=
er way
> > around (_PXM in a PCIe node in DSDT).=A0 If we finish that support off =
I'd assume =20
>=20
> Not sure if I understand this. Can you provide a reference to this DSDT r=
elated
> change?

You need to add the PCI tree down to the device which is a bit fiddly if th=
ere
are switches etc. I'm also not sure I ever followed up in getting the PCI
fix in after we finally dealt with the issue this triggered on old AMD boxes
(they had devices that claimed to be in non existent proximity domains :(
later at least one path to hit that was closed down - I'm not sure all of t=
hem
were).

Anyhow, the fix for PCI include an example where the EP has a different PXM
to the root bridge.  In this example 0x02 is the GI node.

https://lore.kernel.org/all/20180912152140.3676-2-Jonathan.Cameron@huawei.c=
om/

>   Device (PCI2)
>   {
>     Name (_HID, "PNP0A08") // PCI Express Root Bridge
>     Name (_CID, "PNP0A03") // Compatible PCI Root Bridge
>     Name(_SEG, 2) // Segment of this Root complex
>     Name(_BBN, 0xF8) // Base Bus Number
>     Name(_CCA, 1)
>     Method (_PXM, 0, NotSerialized) {
>       Return(0x00)
>     }
>=20
> ...
>     Device (BRI0) {
>       Name (_HID, "19E51610")
>       Name (_ADR, 0)
>       Name (_BBN, 0xF9)
>       Device (CAR0) {
>         Name (_HID, "97109912")
>         Name (_ADR, 0)
>         Method (_PXM, 0, NotSerialized) {
>           Return(0x02)
>         }
>       }
>     }
>   }

Without that PCI fix, you'll only see correct GI mappings in Linux
for platform devices.

Sorry for slow reply - I missed the rest of this thread until I was
brandishing as an argument for another discussion on GIs and noticed
it had carried on with out me.

Jonathan


