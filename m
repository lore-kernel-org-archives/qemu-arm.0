Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp117391ejb;
        Tue, 5 Mar 2024 13:06:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXWxIOkW5HYJokWJ475mTUZPKck9LR/qTNQNA8VcpjuuMYW2fAGxeCs0vL4uF18NLNeeQwc2FaR5yUF7yV4OV7XZAtkPLsS
X-Google-Smtp-Source: AGHT+IECaJ1GRA1vqXq+xn0boKEVNpOqSfL35azHtezIXr2CN33mWfuPaDoHN9EO6YigJrYJ2pLY
X-Received: by 2002:a05:622a:2c9:b0:42e:e20a:64ad with SMTP id a9-20020a05622a02c900b0042ee20a64admr3331236qtx.65.1709672808997;
        Tue, 05 Mar 2024 13:06:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709672808; cv=none;
        d=google.com; s=arc-20160816;
        b=nedRGvmOFyxn7HEIXyOt5vQHKeU210g8Ss4uutSYBucmJsRNFigx1DxOkaVG7loTrs
         jep64Py0MJD7jW73ymdQocGkVi4PhiF4DPq5SmwhHCrTZTr2qTMUyLIx+uIiUrRtpD6m
         Fg/PKNYLL0U2Gm2onP/jr1URMHfrurVDvCFfLqBDfNjCNtPDx7/vV75T/uVMS6zPUgWW
         FQ3QVKv4NFeljKWV7pWo84yCtb2D2VsLcE/rYyjURea14aKWMvMf0YDRACVR3rFMvoyU
         k3njsxA8fhhn7swCBiAORhYB0mvepFeGYTdo2PSOa5t1kvaTXom289qao8BTHcOD5MeZ
         uRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=C9w03BcOqjTzgd4vKbQG9yBp9Khp4JPRBtPNjWiUKZc=;
        fh=LZ+RUhHYG2nCSTREN0m9DAfgnX8qGZyfKo5OsDwtGh0=;
        b=CDaXt1UBDBTW1K04dIreWqvgPW7mzQAkUqCo0GNjGHOqd+ZDQGjOzDK3rYbpuDk6vu
         l4GKzlMKYE3+yYXkCdDDd15Tmv1j2asFcIQMXHoVyE3DIBy06YqAH3tvZgVBpZd1dn8f
         I6ivH7FtyJRhv9TFY91JZLHezF1WoJY+Cot1qhCqFrUYvO6PHomkINmG/2K0E+uoiGhx
         LlbDtXxuQl99HPkVEMECwvo3i31R0QRT85UQVAytIcWGQAnKTQzFKMf+J1fSLLTeM0sx
         ndRLOhLtATb6nylrm8GDGbuEHffrk/OrNTSwFswZ6rKOZCaf7ufEvuRHI692W8/OfbH4
         +N2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Iv+LyjDR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3-20020a05622a00c300b0042e897fd376si13381132qtw.766.2024.03.05.13.06.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 13:06:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Iv+LyjDR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhbzk-00074s-Lk; Tue, 05 Mar 2024 16:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1rhbzi-00073e-OP
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 16:06:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1rhbzh-0007A8-3w
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 16:06:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709672796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C9w03BcOqjTzgd4vKbQG9yBp9Khp4JPRBtPNjWiUKZc=;
 b=Iv+LyjDR9DHMuWTDrktnzdZDUBBCkCGRKtQUWMVEOKz9fbFVA73eVF06blPZigfYYLs5cx
 fWuLf3iI4n7wefMmQIgIbIronUA/JOPOWA412RCVXrVk6LRq+nWKzEJwQpv9kaMb8vhpmS
 zWlFxwS/jKs6hPG2Wk98kS7kHu8aPbs=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-H0xn8Td7MvWNX_BDAEcYnw-1; Tue, 05 Mar 2024 16:06:34 -0500
X-MC-Unique: H0xn8Td7MvWNX_BDAEcYnw-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-21fde24a4d7so5563877fac.1
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 13:06:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709672794; x=1710277594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C9w03BcOqjTzgd4vKbQG9yBp9Khp4JPRBtPNjWiUKZc=;
 b=mARG4+FgsbcxgJo8rp5NOjlLBJHIvSotDyV4NXQc5O2hTtMJvLifPXrT0QkRzAjqXx
 0brGYJt5nMScNOUx3YKWxt8AKoLcjXgnNT1dVRb0zQZEbld41+RcSmcHmGq37PjAPpO/
 ZbAqX+hPnG5LC3mZwZ8V5dEemb7iWFyNzafIeIQcsfLq5m3eoyDLo7jF5h8q+ANUjOH8
 IaBruPUtiAVWD2Yi8LRTPS8V8F6n1jnmPYHOA4itJQJu82RF+t/hQfBtjC7dxoZGtU34
 vj5ZbvDKTYkrM0ivLl6mfR0FXBVqlHm5mZQkEzJUtmhvirxaTqOTKsNz4KbGkwK4fLTF
 6Z0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2bkW9Ys1pRGutXnP/8uGlnCKIW/qDA1bZ9IqgEbafLCPbixyyoDB6ERKHDrYv8A25scdC58Eqlq9NTt+gKxWT1FCq
X-Gm-Message-State: AOJu0YxiE05qztfBWU9K1Z0C9cEm7AFw6migdaIdtctNHdnkuNwgixxG
 2WmcvW/a0Q5KpiC1jUc8J5WcOKlSScDAOEmcJGGAgy7AGsm1WKu13lFTOatvMBcaTxS+7HKxFHX
 X0wys6C0hnM+UHqCM9WcmyNDsmD4ofDaoycq+PAI+Z3yBhGtYCg==
X-Received: by 2002:a05:6870:612a:b0:21e:9ef7:f1df with SMTP id
 s42-20020a056870612a00b0021e9ef7f1dfmr3089503oae.9.1709672793867; 
 Tue, 05 Mar 2024 13:06:33 -0800 (PST)
X-Received: by 2002:a05:6870:612a:b0:21e:9ef7:f1df with SMTP id
 s42-20020a056870612a00b0021e9ef7f1dfmr3089461oae.9.1709672793476; 
 Tue, 05 Mar 2024 13:06:33 -0800 (PST)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 nd6-20020a056871440600b0022147ef9172sm177056oab.52.2024.03.05.13.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 13:06:32 -0800 (PST)
Date: Tue, 5 Mar 2024 14:06:30 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Jason Gunthorpe
 <jgg@nvidia.com>, "clg@redhat.com" <clg@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "ani@anisinha.ca"
 <ani@anisinha.ca>, "berrange@redhat.com" <berrange@redhat.com>,
 "eduardo@habkost.net" <eduardo@habkost.net>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "armbru@redhat.com"
 <armbru@redhat.com>, "david@redhat.com" <david@redhat.com>,
 "gshan@redhat.com" <gshan@redhat.com>, Zhi Wang <zhiw@nvidia.com>, Matt
 Ochs <mochs@nvidia.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>, Kirti
 Wankhede <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)"
 <targupta@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Andy Currid
 <acurrid@nvidia.com>, Dheeraj Nigam <dnigam@nvidia.com>, Uday Dhoke
 <udhoke@nvidia.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v7 2/2] hw/acpi: Implement the SRAT GI affinity structure
Message-ID: <20240305140630.5a3dd69b.alex.williamson@redhat.com>
In-Reply-To: <SA1PR12MB71995AAADE78D3D0052FAC01B0222@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20240223124223.800078-1-ankita@nvidia.com>
 <20240223124223.800078-3-ankita@nvidia.com>
 <20240226164229.00001536@Huawei.com>
 <SA1PR12MB71995AAADE78D3D0052FAC01B0222@SA1PR12MB7199.namprd12.prod.outlook.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 01/nhP57iPtw

On Tue, 5 Mar 2024 05:59:46 +0000
Ankit Agrawal <ankita@nvidia.com> wrote:

> > One thing I forgot.
> >
> > Please add a test.=C2=A0 tests/qtest/bios-tables-test.c
> > + relevant table dumps. =20
>=20
> Here I need to add a test that creates a vfio-pci device and numa
> nodes and link using the acpi-generic-initiator object. One thing
> here is that the -device vfio-pci needs a host=3D<bdf> argument. I
> probably cannot provide the device bdf from my local setup. So
> I am not sure how can I add this test to tests/qtest/bios-tables-test.c.
> FYI, the following is a sample args we use for the
> acpi-generic-initiator object.
>=20
>        -numa node,nodeid=3D2
>        -device vfio-pci-nohotplug,bus=3Dpcie.0,addr=3D04.0,rombar=3D0,id=
=3Ddev0 \
>        -object acpi-generic-initiator,id=3Dgi0,pci-dev=3Ddev0,node=3D2 \
>=20
> Moreover based on a quick grep, I don't see any other test that
> have -device vfio-pci argument.
>=20
> Jonathan, Alex, do you know how we may add tests that is dependent
> on the vfio-pci device?
>=20

As Jonathan notes, we've decoupled this from vfio-pci, the pci-dev=3D arg
can point to any PCI device.  For example, any emulated PCI NIC could
be a stand-in for the vfio-pci device used in practice.  Thanks,

Alex

