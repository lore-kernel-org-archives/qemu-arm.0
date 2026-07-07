Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52B2C43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 11:54:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh4NG-0003oD-Mf; Tue, 07 Jul 2026 07:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1wh4NE-0003nj-DN
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 07:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1wh4NB-0000U0-0H
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 07:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783425236;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gq4DLxV4CbhwFfb49qWvz+vgHF1w7s/gRW3FwsvxQnY=;
 b=eX8T3Mdleq0FAwG92B90ODCTL8x1aymJmUl4iudvuASlU9Y41Hd4s0KZg+VNkD8/VJAbnd
 8vocn/VvudWf1K5Yoc/eHYd4VGesxy3OfAN5tjK7tqFZ1M/jb/9t/nMVxt2MgsPD0wl/tc
 p0JjW+XKqMB4eAZ2f166nvLB/LuuzRI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-163-_CUpCbe3POmsJeeeCJtYiw-1; Tue,
 07 Jul 2026 07:53:52 -0400
X-MC-Unique: _CUpCbe3POmsJeeeCJtYiw-1
X-Mimecast-MFC-AGG-ID: _CUpCbe3POmsJeeeCJtYiw_1783425231
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0E8A31954128; Tue,  7 Jul 2026 11:53:51 +0000 (UTC)
Received: from redhat.com (unknown [10.44.33.142])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AC60818005B2; Tue,  7 Jul 2026 11:53:48 +0000 (UTC)
Date: Tue, 7 Jul 2026 12:53:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>, kfting@nuvoton.com,
 wuhaotsh@google.com, alistair@alistair23.me,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/1] hw/adc/npcm7xx_adc.c: convert NPCM7XX_ADC object
 props to class props
Message-ID: <akzoyX5w3pfbS_aN@redhat.com>
References: <20260703143408.3235231-1-mark.caveayland@nutanix.com>
 <20260703143408.3235231-2-mark.caveayland@nutanix.com>
 <akzoCkJVpWsoPIV_@redhat.com>
MIME-Version: 1.0
In-Reply-To: <akzoCkJVpWsoPIV_@redhat.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: tGTjogCEsCRVAb6y-olnW3817ryFLJIufMaRbFx8Y6w_1783425231
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Jul 07, 2026 at 12:50:34PM +0100, Daniel P. Berrangé wrote:
> On Fri, Jul 03, 2026 at 03:32:17PM +0100, Mark Cave-Ayland wrote:
> > Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> > ---
> >  hw/adc/npcm7xx_adc.c | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> > 
> > diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
> > index 3584c27c75..27d42f87b1 100644
> > --- a/hw/adc/npcm7xx_adc.c
> > +++ b/hw/adc/npcm7xx_adc.c
> > @@ -229,7 +229,6 @@ static void npcm7xx_adc_init(Object *obj)
> >  {
> >      NPCM7xxADCState *s = NPCM7XX_ADC(obj);
> >      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> > -    int i;
> >  
> >      sysbus_init_irq(sbd, &s->irq);
> >  
> > @@ -240,12 +239,6 @@ static void npcm7xx_adc_init(Object *obj)
> >      sysbus_init_mmio(sbd, &s->iomem);
> >      s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL, 0);
> >  
> > -    for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
> > -        object_property_add_uint32_ptr(obj, "adci[*]",
> > -                &s->adci[i], OBJ_PROP_FLAG_READWRITE);
> > -    }
> > -    object_property_add_uint32_ptr(obj, "vref",
> > -            &s->vref, OBJ_PROP_FLAG_WRITE);
> >      npcm7xx_adc_calibrate(s);
> >  }
> >  
> > @@ -275,6 +268,7 @@ static void npcm7xx_adc_class_init(ObjectClass *klass, const void *data)
> >  {
> >      ResettableClass *rc = RESETTABLE_CLASS(klass);
> >      DeviceClass *dc = DEVICE_CLASS(klass);
> > +    int i;
> >  
> >      dc->desc = "NPCM7xx ADC Module";
> >      dc->vmsd = &vmstate_npcm7xx_adc;
> > @@ -282,6 +276,17 @@ static void npcm7xx_adc_class_init(ObjectClass *klass, const void *data)
> >      rc->phases.hold = npcm7xx_adc_hold_reset;
> >  
> >      device_class_set_props(dc, npcm7xx_timer_properties);
> > +
> > +    for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
> > +        g_autofree char *adciprop = g_strdup_printf("adci[%u]", i);
> > +
> > +        object_class_property_add_uint32_ptr(klass, adciprop,
> > +                offsetof(NPCM7xxADCState, adci[i]),
> > +                OBJ_PROP_FLAG_READWRITE);
> > +    }
> > +    object_class_property_add_uint32_ptr(klass, "vref",
> > +                offsetof(NPCM7xxADCState, vref),
> > +                OBJ_PROP_FLAG_WRITE);
> 
> Are you sure this actually works ?

Never mind. I realize now that this depends on your previous
series that changes object_class_property_add_uint32_ptr
to actually have the useful/desirable "relative offset"
semantics.

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


