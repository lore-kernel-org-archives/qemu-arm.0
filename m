Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp4022120lfb;
        Fri, 24 Dec 2021 04:02:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbuMkjgiPdUWSJJ1ik/GPpDEEpxXPCxqDYgCvo+I4GQLuFIRU0q/shIBsZ46fGZUX5Fy52
X-Received: by 2002:a05:6902:1105:: with SMTP id o5mr9531056ybu.519.1640347376628;
        Fri, 24 Dec 2021 04:02:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640347376; cv=none;
        d=google.com; s=arc-20160816;
        b=SSzqW0fcTRDGLjm/6P/+x2+wp9PFbfoYTJSOzo6YPsEj/S/aZOOWt8tWcbVOWCdG0k
         FqdMEl8GtOPLOTEIAmtSzmp8vB1ipsjm3H8sANcOsY5/TPlut0VHiM2Qnpifq++jVDKu
         n3NUcwO7zvh96Pniy1OD/5lPy6UX+7z6Zzp26GK2NMe4uIrjxNqRG4NtfpVSslvGPTvx
         vaoZb2aIS2T4l/R8G2re00i99lsVUsXhuZqUR7vjUMew0n6MfzlvQ8+Q8POMKMEwFz/d
         yn+lio1GEBaWvVMIeMir1GOWKd4vi+4SqbEZJkZVtFXy32impnCroXFgCkeP0zPDPcYQ
         tqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=38vDKLwEi4tYEVwCh1vbimpYcBVd9Lbh7gnh/dzyiCk=;
        b=yEi6LXwz8SFLs99UI/27Vgjjckkuli5XraBBggDqNRf0/lMC++YnSsjdQibhXKkobi
         Kq5JZFaTnTDYIsTjvflyOQwTB7DtFn9/OVpZLHhBtX3PezQGxKR1jsBnaPoBUCCDhem0
         t2ivCVHalQHvKbteE6LbyygeM+ZKqTtITSfGxnYRfwmrQRlusXeIVIKpG/JARKnkq7RE
         QecoDhEjDxMhkvFcSBQ4qWhy4jLGE2sBjV5a8ZdA/jUX/CClVe2yu3rw/Acq6k7ZmGfX
         LKz6OE/An25ELIk0kjvUL3wyjkh5ilCkkJKnVeoyJXxYQuOqqJRkPK+UbD9Q2+bBd+CC
         h0+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GFYqp9WJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18si7471296ybh.83.2021.12.24.04.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Dec 2021 04:02:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GFYqp9WJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n0jHk-00082D-1H
	for alex.bennee@linaro.org; Fri, 24 Dec 2021 07:02:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n0jGd-0007yE-Hd
 for qemu-arm@nongnu.org; Fri, 24 Dec 2021 07:01:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n0jGa-0004P8-T3
 for qemu-arm@nongnu.org; Fri, 24 Dec 2021 07:01:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640347303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=38vDKLwEi4tYEVwCh1vbimpYcBVd9Lbh7gnh/dzyiCk=;
 b=GFYqp9WJ2E11jVaEQEUz+NdMuvTBDdziZFBjPnqRZTYCNVX5H4dzBz1CVZym97kJ+MCpfK
 hjmSf9fkO3VMY+cIBmsqRGJVZcdDuwbJqPXSoz58l9g7aoSh6j3BIRXMLoDv/ryHoZpxIf
 +r0lAghp9ctPM3O+0kW9tucfpFKlfxc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-x0wf5arIOEGpKA1nP6K9UQ-1; Fri, 24 Dec 2021 07:01:41 -0500
X-MC-Unique: x0wf5arIOEGpKA1nP6K9UQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 c19-20020a05640227d300b003f81c7154fbso6693679ede.7
 for <qemu-arm@nongnu.org>; Fri, 24 Dec 2021 04:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=38vDKLwEi4tYEVwCh1vbimpYcBVd9Lbh7gnh/dzyiCk=;
 b=PsjF91XG1ve81DKTRljC+ucPFSyO81Sr8LQcYizMONwNbZqsU8hlLzHThQLKuGukms
 x9wroYLzpaow6I2MeBXJ224eN/HiavpgbQNRJh2KTFQObF5RBCuDNL/b8QuBnBL4fxVc
 +jm63Beeg2Vs0nejHHxcD2OOOMx7UQ3VUd1vl+yD6R2Q6NZov8C+4CBrgIL1Z9cXhK0J
 FNKuC6BrerhdhKBnz7hhUKCgCTx1oQFfZ9oOiExWr6sSV1ygTAOBp8T4XQjh5sZNQHkJ
 KsFa6lnUvdBVjwx7go3CXypmfQIlteY3FqlFnDccwIMAarZBAHo//NuF3PlpCEysZegY
 /DTg==
X-Gm-Message-State: AOAM5325LfX0b6CVsEeUvHBHlUnHnZlhRsPhziyCFa752/YgWw7hwmFg
 75hL72+MD77j68OOZQyDdL95SsYeulkuxZnLiuAxBZMFuqtuaZjwQ3og/ouYj2LbRwx5nUAQVgW
 +5CiGZQKjekT4
X-Received: by 2002:a05:6402:908:: with SMTP id
 g8mr5721223edz.59.1640347300892; 
 Fri, 24 Dec 2021 04:01:40 -0800 (PST)
X-Received: by 2002:a05:6402:908:: with SMTP id
 g8mr5721201edz.59.1640347300728; 
 Fri, 24 Dec 2021 04:01:40 -0800 (PST)
Received: from gator.home (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id g2sm2669392ejt.43.2021.12.24.04.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 04:01:40 -0800 (PST)
Date: Fri, 24 Dec 2021 13:01:37 +0100
From: Andrew Jones <drjones@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2] hw: Add compat machines for 7.0
Message-ID: <20211224120137.wydq4uodvziqefvz@gator.home>
References: <20211217143948.289995-1-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211217143948.289995-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vyIOS4sDePd/

On Fri, Dec 17, 2021 at 03:39:48PM +0100, Cornelia Huck wrote:
> Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Acked-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> v1->v2: fix typo in i386 function chaining (thanks danpb!)
> 
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 6bce595aba20..4593fea1ce8a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2856,10 +2856,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> +static void virt_machine_7_0_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(7, 0)
> +
>  static void virt_machine_6_2_options(MachineClass *mc)
>  {
> +    virt_machine_7_0_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
> +DEFINE_VIRT_MACHINE(6, 2)
>  
>  static void virt_machine_6_1_options(MachineClass *mc)
>  {

For the arm parts

Reviewed-by: Andrew Jones <drjones@redhat.com>

