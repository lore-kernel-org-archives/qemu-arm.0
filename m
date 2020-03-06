Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp4009734lfi;
        Fri, 6 Mar 2020 02:07:06 -0800 (PST)
X-Google-Smtp-Source: ADFU+vs8SInFY0zuVFWCEKXln0RmVfn1XGCNXSF8P3QbFKIO2K6PpkPx5tZ8Jj0UW3dXVbgT/zjL
X-Received: by 2002:a37:6ec7:: with SMTP id j190mr2017795qkc.301.1583489225865;
        Fri, 06 Mar 2020 02:07:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583489225; cv=none;
        d=google.com; s=arc-20160816;
        b=FjE6gzp32BZMGYvmqP0ArZP81f5zSWDtrQybSClOTClBIZZwyWO10mj9kTrXYqeFaG
         UshjGb/fqjhG3DoVkTKu124eIZE0p2o0+k1rXKQJrghH8S+DExlNSAqXODvvfFUo1HGx
         VnRjngPXsrIEpPksho1hiuH5j5yruJBWc2W1/1x39e9FXvySg+sqy161NbGo7VXqYKP1
         wEfByJ/ENPdFEdFshgN73Dpb3L+UAbo3jTUUPb9zbM8NSfuCHNmV37WkeB3sjTdiRWGv
         a3u93PmyC10GpXlxf0Eyo9z4QfP+hzOTbrHjihe0KpPHBRJjZNkoD0u6kbWVNBmXbEzT
         ZO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=JP8LGWYnVfj/fV0ZT5Pl/FciL2Holb5QrXqu5aUzObE=;
        b=nO4ZBSEzT1KDixvMNjRDNwUZqSl97O/TG9ZFQ4TPVD0Kbue02KpagoCh2tj9xCchzK
         nvj5YxsVeZblqnKjKKysp5sWHN97m4YnhY5PiIipKiJlpdEohRQFXroMTybCBHGYojmF
         bmXmM3ifN+L6/JWRIwTlo1cgFHUzhgr673OLP4w3V7PqMFo3wv2VytQCBS6PBmsdWMaE
         Nw3R+B0fFeX6obRTT7CQOpHR2pZ3YvrV0hZBWJqkKazN70M53M7wStkAP2vacuVLJajm
         UOYD/Uh4H/aqztHl/zyp+aDsOLbLirLxPKda7o24yaq4pj4u1hdpooiEdowwY+tF+JY1
         m/HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fHQMaB+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c136si972059qkb.250.2020.03.06.02.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Mar 2020 02:07:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fHQMaB+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jA9sn-0003kJ-9B
	for alex.bennee@linaro.org; Fri, 06 Mar 2020 05:07:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38683)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jA9sg-0003k1-Gp
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 05:06:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jA9sf-00012g-GB
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 05:06:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53978
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jA9sf-00011Q-Cs
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 05:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583489217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JP8LGWYnVfj/fV0ZT5Pl/FciL2Holb5QrXqu5aUzObE=;
 b=fHQMaB+EfVnV/JIZPoDWx+y0gkyPFchDonRzLVujq6BPyml9nTLy6X1BmwiOySCb4EY0ju
 JlkYhIjFMGy50VSDPAp46skH+tFRbOKOJoEwV96YjWUJKX0Idi2Vvggq3pE1x8EJUB0zdN
 vEAkaPC0btBsxZnihQdp+NaHvJFCnxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-CbtUNaUDM-OM_oYJS5wu3w-1; Fri, 06 Mar 2020 05:06:53 -0500
X-MC-Unique: CbtUNaUDM-OM_oYJS5wu3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 574F118A5502;
 Fri,  6 Mar 2020 10:06:52 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 195F85C221;
 Fri,  6 Mar 2020 10:06:50 +0000 (UTC)
Date: Fri, 6 Mar 2020 11:06:49 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: Re: [PATCH] hw/arm/cubieboard: make sure SOC object isn't leaked
Message-ID: <20200306110649.713ee0af@redhat.com>
In-Reply-To: <CAPan3Wqr8HuXSmZL1DZTSjD_PfcoxNO5FkKAr36rzY8+vyOORg@mail.gmail.com>
References: <20200303091254.22373-1-imammedo@redhat.com>
 <CAPan3Wqr8HuXSmZL1DZTSjD_PfcoxNO5FkKAr36rzY8+vyOORg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, drjones@redhat.com,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0/AOAFFJNvpV

On Thu, 5 Mar 2020 21:07:08 +0100
Niek Linnenbank <nieklinnenbank@gmail.com> wrote:

> Hi Igor,
> 
[...]

> > +    a10 = AW_A10(object_new(TYPE_AW_A10));
> > +    object_property_add_child(OBJECT(machine), "soc", OBJECT(a10),
> > +                              &error_abort);
> > +    object_unref(OBJECT(a10));
> >  
> 
> I see that there are a few machines which also do
> object_property_add_child() to add its
> SoC object to the machine, but they do not do the object_unref(). Can you
> explain why it is needed here?

object_new() returns object with ref == 1, and it's responsibility
of the caller to take care of it.
If caller won't track and call object_unref() eventually on returned pointer,
the object will leak.

(object_unref() destroys object when 'ref' reaches 0 )

> Or do the other machines still have a leak due to the missing
> object_unref()? Examples are:
>   hw/arm/sabrelite.c
>   hw/arm/mcimx7d-sabre.c
>   hw/arm/mcimx6ul-evk.c
> 
> Regards,
> Niek
> 
> 
> > +
> >      object_property_set_int(OBJECT(&a10->emac), 1, "phy-addr", &err);
> >      if (err != NULL) {
> >          error_reportf_err(err, "Couldn't set phy address: ");
> > --
> > 2.18.1
> >
> >
> >  
> 

