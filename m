Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2807499ejf;
        Tue, 27 Feb 2024 09:11:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU5Swd79kPLdCDBcy8n3AdoivCkpt0E7b4BdVAgXofbcHuBOsk3vZzug8acNkikUa1hRw7/uRaTrdxBVMDFgRkdQElDflxg
X-Google-Smtp-Source: AGHT+IHZQS+ij8VZjXsH7ySoaRM/84pvSqgfFM3psqfYtc2YysCHt4+xnNfrAGAgHDW8G9Mdz0uC
X-Received: by 2002:a05:600c:511f:b0:412:abfd:2c0e with SMTP id o31-20020a05600c511f00b00412abfd2c0emr2435531wms.41.1709053904300;
        Tue, 27 Feb 2024 09:11:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709053904; cv=none;
        d=google.com; s=arc-20160816;
        b=SsR2crfblLva1gm3qHLPob33Dvow1ID60xFw5ukksS42uxmpU9LEhFIsHYaV8/wotO
         HpeFJ+E4xH4YfMkxc+ccC3fT/4fHf/I2peJYjPwHl9Yr7TcRllkAE3KDOZKd+QCQVdOp
         B0I9N/Q98ACoyyqUZZqdxGWL0e0NFhSKt/8+BXHCai9zpbnfwTGImhoh0FHf7pOW6buD
         96HpnSV/eumxedWDdbDNzdldhwNgBKQ28WMfjuswVdPZXSdmuN1860DGKLRmB3pLxyJZ
         6ZISDEtODZAjFsS+BrF1/xXGl0ziwvWjGTy7JE58NXVHDuU86C3PR9wSrqBKPWp7pJqw
         Gjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=rl+Qb6h1DK87FKvuDL3Draezf7PaMslwA2HVbdB5p6Y=;
        fh=7hAnG8mt3O2g0t4S/UvlpYopBIc86fAdUNL/ShLRZ74=;
        b=almA+W2Chg18otaavJcuJqqYfflOhgJn0TcT5k/mfDk/Hhlfqu4zN8ieNT3iFr77UO
         1sdec+pUST2JVVlbNHFQHrzMDQdHDHwLKUDjXx2MX+p06KTCVrYcBJugdifbCWFNEsu9
         S7hmOWLIVB2yJUVHFRxOaSpdDm2nDc7N8LNtUTsNmxogxLYp+Ty7wJXaAt9qwHehHzbu
         EPjcPCXW7CWT54zt1e5PnwXknHD3j+Bz0GAPegO7eWw+nF8GAbIb9NpfYbHiFhXcFdwn
         pD56GJ10y4ppr/4Rrhuz3MLNA6G8ZKMEEs+lDW+B7yje6d+yk/hqnMxZHx21ylz3V9CU
         pK9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16-20020adff0d0000000b0033d140bb182si4021496wro.518.2024.02.27.09.11.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 09:11:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rf0zS-00008V-Ds; Tue, 27 Feb 2024 12:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rf0zL-0008TU-O7; Tue, 27 Feb 2024 12:11:31 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rf0zH-0007iU-Gh; Tue, 27 Feb 2024 12:11:31 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TkkRN19nWz6J9mG;
 Wed, 28 Feb 2024 01:06:40 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 3A4E514058E;
 Wed, 28 Feb 2024 01:11:17 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 27 Feb
 2024 17:11:16 +0000
Date: Tue, 27 Feb 2024 17:11:15 +0000
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
 Zhi Wang <zhiw@nvidia.com>, "Matt Ochs" <mochs@nvidia.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, Aniket Agashe
 <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>, "Kirti Wankhede"
 <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>, Vikram
 Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>, Dheeraj Nigam
 <dnigam@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v7 2/2] hw/acpi: Implement the SRAT GI affinity structure
Message-ID: <20240227171115.00004c7b@Huawei.com>
In-Reply-To: <SA1PR12MB71992ECFBF9FA3EE3C350EA8B0592@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20240223124223.800078-1-ankita@nvidia.com>
 <20240223124223.800078-3-ankita@nvidia.com>
 <20240226164229.00001536@Huawei.com>
 <SA1PR12MB71992ECFBF9FA3EE3C350EA8B0592@SA1PR12MB7199.namprd12.prod.outlook.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: mgcMq2Jcsc4O

On Tue, 27 Feb 2024 08:37:15 +0000
Ankit Agrawal <ankita@nvidia.com> wrote:

> Thanks Jonathan for reviewing the change.
>=20
> Comments inline.
>=20
> >> The structure needs a PCI device handle [2] that consists of the devic=
e BDF.
> >> The vfio-pci device corresponding to the acpi-generic-initiator object=
 is
> >> located to determine the BDF.
> >>
> >> [1] ACPI Spec 6.3, Section 5.2.16.6
> >> [2] ACPI Spec 6.3, Table 5.80
> >>
> >> Signed-off-by: Ankit Agrawal <ankita@nvidia.com> =20
> >Hi Ankit,
> >
> > As the code stands the use of a list seems overkill. =20
>=20
> Yeah, I will try out your suggestion.
>=20
> > Otherwise looks good to me.=A0 I need Generic Ports support for CXL
> > stuff so will copy your approach for that as it's ended up nice
> > and simple.
> >=20
> > Jonathan =20
>=20
> Nice, would be good to have uniform implementations.

I've been messing around with this today.

They differ only very trivially.
2 Options.
1) Have acpi-generic-port inherit from acpi-generic-initiator.
   Works but implies a relationship that isn't really true.
2) Add an abstract base class. I've called it acpi-generic-node
   and have bother acpi-generic-initiator and acpi-generic-port
   inherit from it.

The second feels more natural but is a tiny bit more code (a few
more empty init / finalize functions.

If we are going to end up with an abstract base 'object' it
will be cleaner to do this all as one series if you don't mind
carrying the generic port stuff as well? Or I can smash the
two series together and send out an updated version that hopefully
meets both our requirements (+ tests etc).

I'm just running tests against the CXL qos / generic port code
but assuming all goes well can share my additional changes
in next day or two.

Jonathan


