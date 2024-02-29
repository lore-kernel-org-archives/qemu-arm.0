Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp344623eja;
        Thu, 29 Feb 2024 04:20:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVfP9nfcnObMvR1AKxzwchCerS1S98SAxQ5iSe7ssWAmLHxgyFTZ/TMrV7naj5jSpFsdRqLsicK6qWcGaDeX4TpEOIDSbDW
X-Google-Smtp-Source: AGHT+IH9RIYx0+s06cJOkkvrMsABNMZ9+7aNXvPRGgxsN6xVTlqBK28qsZPFGuHKzfBvPtpTgL+P
X-Received: by 2002:a05:622a:548:b0:42e:8a38:2d74 with SMTP id m8-20020a05622a054800b0042e8a382d74mr2059058qtx.37.1709209251397;
        Thu, 29 Feb 2024 04:20:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709209251; cv=none;
        d=google.com; s=arc-20160816;
        b=o1Ui64Y+vFiQQdODZuHfoDSqdBnenrb4M45jQsCQQ/JtqsEeyRm5NEGidyNexrCFcJ
         gx6GqFMQbGyKwV3g2/nCG3tyktPC74SJX0GsRuUM7IDt/yIgB8XKfl9/KMkDMPVu0y/r
         o6r4clabzvlafVyuHHRrry5voRMM60XLeNB/YMD/GrCm170uzCmIeC0YegRQmtonAHcw
         V3OsbVZGBM1WO+vjA9mu6RgAtX9LlQqljutb91Arlwu26/DWnZJb5HyBgkIkT+hRU3c2
         wBXBvB8uv1Zf1FyxxcWQ6ppCAOoAg3ZPrMyWM5QZ6/WrCZrfp3mu0DXeKT+X6+v4rGyp
         NQ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=EzWQiW86vCGifzKta1DXQzHatgEEDgAUck7S3qbJ0+Q=;
        fh=7hAnG8mt3O2g0t4S/UvlpYopBIc86fAdUNL/ShLRZ74=;
        b=Ft+bmoCOB2rN3m0aFTWLAYZBELltgVee7Fwa4vTwk9hCrrxtY/t1l9p+aJMZGnEv2v
         he0qSzlEFwqxYNRWFD2MOq3IxZDiqlFrPHVHv8TgUwKRc7D1elcOKG8Cil1rft0fjfDZ
         M+Lml7NIUARRHg8iS2NjaNn2D6846AYC8L8j4F8Bkmeiq8XPeHPwGB0kSUGYlJg6h2X4
         Ie6mKQweVIY8bJq+PX/fBXAeExXYdvId1h87ti7wf9KGoE7ilWd/nNi+0beJsHBKwzKn
         TbQxUkLMndGqtdQr7JZSAryl5oD9YzG5TcFqjskGivUCX1m6WcaYr7w8BgrGQfcevbS/
         R61A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15-20020a05622a004f00b0042eadf6c75bsi1330363qtw.216.2024.02.29.04.20.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 04:20:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rffOt-00020c-Gp; Thu, 29 Feb 2024 07:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rffOn-0001xG-Kr; Thu, 29 Feb 2024 07:20:31 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rffOl-00056q-Ew; Thu, 29 Feb 2024 07:20:29 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Tlqv111t4z67Mby;
 Thu, 29 Feb 2024 20:15:57 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 272BC140A35;
 Thu, 29 Feb 2024 20:20:25 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 29 Feb
 2024 12:20:23 +0000
Date: Thu, 29 Feb 2024 12:20:23 +0000
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
Message-ID: <20240229122023.0000407e@Huawei.com>
In-Reply-To: <SA1PR12MB719937D09D2DE7C2ABBF78E8B05F2@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20240223124223.800078-1-ankita@nvidia.com>
 <20240223124223.800078-3-ankita@nvidia.com>
 <20240227125317.00001cf8@Huawei.com>
 <SA1PR12MB719937D09D2DE7C2ABBF78E8B05F2@SA1PR12MB7199.namprd12.prod.outlook.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Tz2lngxh+mQB

On Thu, 29 Feb 2024 11:46:27 +0000
Ankit Agrawal <ankita@nvidia.com> wrote:

> >> ---
> >>=A0 hw/acpi/acpi-generic-initiator.c=A0=A0=A0=A0=A0=A0=A0=A0 | 84 +++++=
+++++++++++++++++++
> >>=A0 hw/arm/virt-acpi-build.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0 3 +
> >>=A0 include/hw/acpi/acpi-generic-initiator.h | 26 ++++++++ =20
> > A few more comments.
> >
> > Maybe _ rather than - as more common for acpi include naming. =20
>=20
> Ack. will change the name.
>=20
> > I also wonder if we need the acpi prefix for file names given context? =
=20
>=20
> I tried to keep it to match the object name. If you have preference for
> not having it, I can change that too.

Not my area, so up to maintainers of hw/acpi to comment if they care!

I'd not wait for that though before v8.

*impatient user who has some other stuff queued on top of this!*
:)

Jonathan
