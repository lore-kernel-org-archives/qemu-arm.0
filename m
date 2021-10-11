Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp889455lfc;
        Mon, 11 Oct 2021 09:03:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQxxyCgtBE33yg9cwxYvIc1yHjK4m3fg9swjDwPaOGeakOt0ZacneWULv7PuehCDWhf56C
X-Received: by 2002:a05:6214:188:: with SMTP id q8mr3461796qvr.5.1633968207208;
        Mon, 11 Oct 2021 09:03:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633968207; cv=none;
        d=google.com; s=arc-20160816;
        b=V+1rPWiup2oe0lPY4ldQK13QgrvOOmqLCKSHrMHfz1Rl623NJJWLmdEt7dMzTQAjms
         hGpBB0IwVHingCjSeHlbLczYsEv9xAj6o3Aw4Gko6Hh4UV2v+xC2Mb4LmedDS5n3hEwi
         l9pr4Bk8cqHMM4WQWPKPCnBCf/MU7AmZFpr3W6E5eRJKqUEW42H2S4sYWxOE/5eqacPJ
         5TTDvVULF8slb9ZWYWgapNRLgmYeGjlYud8tkafM5SRnrfBlXf8abjYkTtcQSUhgpHeD
         FHv/XnwVQqjT8kfr03Q75oYlK0gUrGNo9sZivSnPEZ5/XfOcxXblsD2+0F0TpyYseyVC
         thvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=f7J8ErIyYnJFcKyKhyY+pn7w6HQ5L7yIOoHmuELwx4w=;
        b=UnIrmmIAJhEdd2XbWVz2TtqcJKRd7m76/uL5foCFKrYZx2qAIM7GC5I7QLxgeLJYQo
         MLHcfnhQkgmCTaiwRSjjJ7AILimgNVE8bxcAeKR0x40mclBcToqX17BEpriLYPFpYVCT
         VV7E9/kF69YnuoaVGJn+rZzXhlOjvwR8aQpGZ4LGRWE251lLDrDIxGKNmARvTB9GdUBf
         IyW9v+n4lPGmoZulMpF1S6VECcZb6gDHD5/LyT3nk7w2TeLXVGX3HQWKY5ZuYiwVXWJD
         yMS1jwd5e2xyr4Mxv4jlhZC/x+IeovUhLo4vhU3thdlxOMiLOJtvhXaE7s4rXtQHFjIs
         yOWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IN1IZ2mQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si2529527qtw.176.2021.10.11.09.03.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Oct 2021 09:03:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IN1IZ2mQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mZxlu-0002ZN-Ic
	for alex.bennee@linaro.org; Mon, 11 Oct 2021 12:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZxep-0005Jd-OU
 for qemu-arm@nongnu.org; Mon, 11 Oct 2021 11:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZxem-0004nk-RT
 for qemu-arm@nongnu.org; Mon, 11 Oct 2021 11:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633967764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7J8ErIyYnJFcKyKhyY+pn7w6HQ5L7yIOoHmuELwx4w=;
 b=IN1IZ2mQrg21e+2G6s/QIKWGZc0ourtv3+xlQYeBq61Z7jGOq2VX4/y0LvHiZGXX1xntcz
 w0ZIzFa0n9FEhUqtyeSWUQegKkwfYbefn1eHhLLEFbz+BZAEas7g0s3/SOUup8JYkFBRyG
 v1K+smzZxT7BzSTLm1HR8nTZwSqkT94=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-URuurl76NH2eWR7XxqUEFw-1; Mon, 11 Oct 2021 11:56:03 -0400
X-MC-Unique: URuurl76NH2eWR7XxqUEFw-1
Received: by mail-ed1-f70.google.com with SMTP id
 h19-20020aa7de13000000b003db6ad5245bso7685879edv.9
 for <qemu-arm@nongnu.org>; Mon, 11 Oct 2021 08:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f7J8ErIyYnJFcKyKhyY+pn7w6HQ5L7yIOoHmuELwx4w=;
 b=vv5+jBfMMADevKchE1HH/nbM5HroCudHbMhicbASxCC6OcxOR55BQers0ISDtiBJVV
 SM7AI7YCLV2C8qWK0I11jxyAT4AMW6s2eChbh70w+/F0IE3h4eIQoJMTbZdgjvE4Uv5G
 QiCRQg1ycveZACSa3F+IfRytqkuYgIfXflf4ILsd0kHTiAQQma9gK4Laa40SFA9t2Jly
 hnSK0bromUYyU0mdmmZ7TVUbYo3xZCeyr7NwVec1NCx7tKZxoReP6OlWfeo40fs1F7Jc
 fLz1cIFEz+zAayNxwc7GfwmEHSvWbmFlQ+JWBoyLza8r3ntmWopIHlBruyH+JI2lajkr
 6xHg==
X-Gm-Message-State: AOAM532tX4PnrIh20lgBmcsK+1jUHFknAT1pvzQOxgYBdKIabJxnediI
 MPxfxA9UKc84nPmuOxJkyzJO17fwhEnK0u/Qrmw8H/2l3nZjljPXoDhT5FHvknuPQABy5+dI9w2
 ChNpYq0fFqGyP
X-Received: by 2002:a50:d809:: with SMTP id o9mr42724364edj.149.1633967761581; 
 Mon, 11 Oct 2021 08:56:01 -0700 (PDT)
X-Received: by 2002:a50:d809:: with SMTP id o9mr42724332edj.149.1633967761412; 
 Mon, 11 Oct 2021 08:56:01 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id lm14sm3673760ejb.24.2021.10.11.08.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 08:56:00 -0700 (PDT)
Date: Mon, 11 Oct 2021 17:55:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 08/11] tests/acpi: allow updates of VIOT expected
 data files
Message-ID: <20211011175559.3d10bab3@redhat.com>
In-Reply-To: <YWBjHrELdZIBXcOD@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-9-jean-philippe@linaro.org>
 <20211006101215.24414401@redhat.com> <YWBjHrELdZIBXcOD@myrica>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wQBnYsROXida

On Fri, 8 Oct 2021 16:26:22 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> On Wed, Oct 06, 2021 at 10:12:15AM +0200, Igor Mammedov wrote:
> > On Fri,  1 Oct 2021 18:33:56 +0100
> > Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
> >   
> > > Create empty data files and allow updates for the upcoming VIOT tests.
> > > 
> > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > ---
> > >  tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
> > >  tests/data/acpi/q35/DSDT.viot               | 0  
> > 
> > does default tests/data/acpi/q35/DSDT differs from
> > DSDT.viot?  
> 
> Yes the VIOT test has one more PCI device (virtio-iommu) and PXB devices,
> so there are additional descriptors in the DSDT


also see tests/qtest/bios-tables-test.c step 6
(---include diff--- part)

> 
> Thanks,
> Jean
> 
> >   
> > >  tests/data/acpi/q35/VIOT.viot               | 0
> > >  tests/data/acpi/virt/VIOT                   | 0
> > >  4 files changed, 3 insertions(+)
> > >  create mode 100644 tests/data/acpi/q35/DSDT.viot
> > >  create mode 100644 tests/data/acpi/q35/VIOT.viot
> > >  create mode 100644 tests/data/acpi/virt/VIOT
> > > 
> > > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > > index dfb8523c8b..29b5b1eabc 100644
> > > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > > @@ -1 +1,4 @@
> > >  /* List of comma-separated changed AML files to ignore */
> > > +"tests/data/acpi/virt/VIOT",
> > > +"tests/data/acpi/q35/DSDT.viot",
> > > +"tests/data/acpi/q35/VIOT.viot",
> > > diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
> > > new file mode 100644
> > > index 0000000000..e69de29bb2
> > > diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
> > > new file mode 100644
> > > index 0000000000..e69de29bb2
> > > diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
> > > new file mode 100644
> > > index 0000000000..e69de29bb2  
> >   
> 

