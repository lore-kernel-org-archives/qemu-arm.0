Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp625875ejb;
        Thu, 19 Oct 2023 09:10:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRbS2B2VTuwWOSnqEJqWLYaj0RmhRLYTHuFp6CwVwe4VCH0fivQsuXOPo7B0GZiW/KI9sL
X-Received: by 2002:a05:620a:4510:b0:774:187d:88a8 with SMTP id t16-20020a05620a451000b00774187d88a8mr3102107qkp.41.1697731811363;
        Thu, 19 Oct 2023 09:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697731811; cv=none;
        d=google.com; s=arc-20160816;
        b=LxKTIa0YOecQ/0tdZbPCYoRwJ2ypXhclbjiWQcRrAReIpaUvklyD30WYCvjbNaKM/w
         zXiPNdHEUVM4RUDijLIDvAdOw2/h/Dv2svOZYr/Xyy4YOPn6vbaLkoNRqX2CPdKf1GYG
         D1nrZ6YzHIIh8GGrRQfGOTeU7Gtw7L6LJoKxab/DdA4r7lKJ9x7z8y4S+Vvp8mH6Wq03
         xsOqcDRRUd0TnOenwxIB2ajoDHA++6LkiW8QZSBBKqg8FZmg2N6ZxzHmf+5510zZ45oO
         wRtZUroEGwRcL/Ki/5qyYFkKiYGvI2pCieD7c3RX7SQd2K9MIzHlNOYR6b8VE4hn4L66
         ISoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=cOl87/Sn2+mciPhEfa7y9UxN8cmVP6hNGOYdzHeBpD0=;
        fh=/coRUL1wBKUBvSHKckqPd31uAjBR6MoeU+vSbjwwHlw=;
        b=skFz3WmX/TE0o3hgrutwbK6PtpAAa35ryWlJG9dvGp5xZhc+X4GtfDiMy9VV7Ik+7O
         1+Ztv8Umt5tRk3aYHnQs8/aENFS2FmT1mnxOE2srqRFD0QuDWeYXgicK26GODaqqD6qW
         RgThl0Arzbf93tFnDDClSDDeIVBZ4CMxgmrZOf5qKRUtskTKfNcCeVqNNvvWtLxOsOOw
         mi5na/17+UEKHun8LLPve/zwAro3VWKHb2hjefAS3tcOG+t+NKylHlysFpa8qZs/vS2m
         GAyDp6sJ+vY/20C8Scqj701YcTKORAVvrlecbvgRN73U5UOpCd6r1IQv4i65giCbYYOh
         Oo3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eMiz+LCk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20-20020a05620a0bd400b007759f944c0fsi1840767qki.156.2023.10.19.09.10.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 09:10:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eMiz+LCk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtVau-0001B3-Kp; Thu, 19 Oct 2023 12:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qtVar-00019U-KM
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 12:09:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qtVap-0005Lc-Pj
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 12:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697731791;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cOl87/Sn2+mciPhEfa7y9UxN8cmVP6hNGOYdzHeBpD0=;
 b=eMiz+LCkztdZPhejwnU+9n++Mw+zI99rVsV5VaYQVWlS1Z1baAeTFAfqQ4gdlOUgR7k6PY
 9pGLhYqT3zd+2VDNjoHSSmjjzUkAAL9Kce9PHlxazxAVIXiT2AohV8fcTXwdrTDf7A1lPD
 MfV2HdYftTjK2wrgIIWdlSbLibyOR0U=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-mZ3EmrY7Pc6H40BWPSMv-Q-1; Thu, 19 Oct 2023 12:09:47 -0400
X-MC-Unique: mZ3EmrY7Pc6H40BWPSMv-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3368D3816B42;
 Thu, 19 Oct 2023 16:09:47 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51E6F2026D66;
 Thu, 19 Oct 2023 16:09:45 +0000 (UTC)
Date: Thu, 19 Oct 2023 17:09:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org,
 lvivier@redhat.com, qemu-arm@nongnu.org
Subject: Re: [PATCH v5 01/10] hw/fsi: Introduce IBM's Local bus
Message-ID: <ZTFUx/YiaCKHxwf7@redhat.com>
References: <20231011151339.2782132-1-ninad@linux.ibm.com>
 <20231011151339.2782132-2-ninad@linux.ibm.com>
 <ZTDlf2jfj5tYGuSM@redhat.com>
 <1159f076-385b-491c-974e-fe72f850f341@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1159f076-385b-491c-974e-fe72f850f341@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9qv2A25RLiYM

On Thu, Oct 19, 2023 at 10:34:52AM -0500, Ninad Palsule wrote:
> Hello Daniel,
> 
> On 10/19/23 03:14, Daniel P. Berrangé wrote:
> > On Wed, Oct 11, 2023 at 10:13:30AM -0500, Ninad Palsule wrote:
> > > This is a part of patchset where IBM's Flexible Service Interface is
> > > introduced.
> > > 
> > > The LBUS is modelled to maintain the qdev bus hierarchy and to take
> > > advantage of the object model to automatically generate the CFAM
> > > configuration block. The configuration block presents engines in the
> > > order they are attached to the CFAM's LBUS. Engine implementations
> > > should subclass the LBusDevice and set the 'config' member of
> > > LBusDeviceClass to match the engine's type.
> > > 
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > Signed-off-by: Cédric Le Goater <clg@kaod.org>
> > > Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> > > ---
> > > v2:
> > > - Incorporated Joel's review comments.
> > > v5:
> > > - Incorporated review comments by Cedric.
> > > ---
> > >   include/hw/fsi/lbus.h | 51 +++++++++++++++++++++++++
> > >   include/qemu/bitops.h |  6 +++
> > >   hw/fsi/lbus.c         | 87 +++++++++++++++++++++++++++++++++++++++++++
> > >   hw/Kconfig            |  1 +
> > >   hw/fsi/Kconfig        |  2 +
> > >   hw/fsi/meson.build    |  1 +
> > >   hw/meson.build        |  1 +
> > >   7 files changed, 149 insertions(+)
> > >   create mode 100644 include/hw/fsi/lbus.h
> > >   create mode 100644 hw/fsi/lbus.c
> > >   create mode 100644 hw/fsi/Kconfig
> > >   create mode 100644 hw/fsi/meson.build
> > > +DeviceState *lbus_create_device(FSILBus *bus, const char *type, uint32_t addr)
> > > +{
> > > +    DeviceState *dev;
> > > +    FSILBusNode *node;
> > > +    BusState *state = BUS(bus);
> > > +
> > > +    dev = qdev_new(type);
> > > +    qdev_prop_set_uint8(dev, "address", addr);
> > > +    qdev_realize_and_unref(dev, state, &error_fatal);
> > > +
> > > +    /* Move to post_load */
> > > +    node = g_malloc(sizeof(struct FSILBusNode));
> > This allocation pattern is discouraged in favour of:
> > 
> >      node = g_new0(FSILBusNode, 1);
> 
> I am using g_malloc() because I want program to terminate. I don't think
> g_new0 provide this functionality. Please let me know.

All the glib memory allocation functions terminate on OOM, except
for the ones with '_try_' in their name.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

