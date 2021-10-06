Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp219956lfp;
        Wed, 6 Oct 2021 04:59:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe4/qx/5rjUc+UKhleQhu21ZTXvsucqoRznhDTXrqnM/dRd6jDwdJrXVzSE0/zgmKoNH+Q
X-Received: by 2002:a05:6602:487:: with SMTP id y7mr1487710iov.0.1633521548715;
        Wed, 06 Oct 2021 04:59:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633521548; cv=none;
        d=google.com; s=arc-20160816;
        b=AcSbjxNP1+6YpLN0gV1rnOa7Ma3A+IiyNIvTzcFQjNJzMvIzwMsm75bhbEJ0HgXUcA
         flPR7Agk0ycwBeebAK1Z03+8+pC5DHY+XHjAx5re6xcBw2E59ObHvp0YwgqJJ5Kqgm7F
         wU65DXLJp6Q2tQJFuluvpZJoLQvaHGHprxkASZhSQP586PoLx5aah2V3XoH6puG2IzNG
         dXAJCiCj0dvqWhHJE1hGW4j+Ecg+eeIGyXpxwioq8MbIqKqYPixaKaZskxkxUFiN2ALJ
         kFeO1XW8+jYOkyJ5IRi6rjrIhg3vFXopC1BpqmHz9pplkxv54iy+NSMpWj5BsSmwaH8C
         buIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=hlDcCTOKOHqELQG0J9ELx1bzgh5+4e7b57/RbQy+ZIk=;
        b=BEY5ZduJUrZSbEbizQY6oI/lK/bKKekb8jaSr3eBFPnJJ4RtLuIQ4pHlExcKSd8GiV
         L/4J18ciIjSwaCub5YxRKnpAgNlswJ8K9qFIiYo556q4hDK9dSUUUKEjux2VuZLl9pWQ
         lJBNTb1Eu/HGYpaNT7ePhCWU3wgnnGl9U5cNUROnEIK+cHTbsxzNXbgOr2/YUXo85xuu
         TdVfpIdTsM0EbwMsHFVImyigMZQMgfyyaa9Oi/J9uGksEabB9yggH4iBAWn/2I5ckQ/J
         VcRe3Rk4ZyNrRneiCLszVr8o0APtRr3Gvpry0W7mtpmKg6hHqJRx0HU0HpAAc33tm2rW
         yS1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Ut7Ck/VV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si15998269ilu.120.2021.10.06.04.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Oct 2021 04:59:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Ut7Ck/VV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mY5Zj-0006bJ-Vf
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 07:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mY5ZR-0006Zd-SE
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 07:58:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mY5XU-0007mU-Lv
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 07:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633521407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hlDcCTOKOHqELQG0J9ELx1bzgh5+4e7b57/RbQy+ZIk=;
 b=Ut7Ck/VV6l7ebvtqsn0vsp+4lSk1FzhCPDCFDOiSzfoJGs3RR7cImKtZLWDFBvqxAzhDD3
 X0jnMxgV6hBO2MerndnNwwXsEk3jSgzuMsu86VIdXjVVF41v/rUXtGXyTBjgBgQJ09EwJQ
 8CHOdji7V0vImHH3hUxRhT+Bis9wyOk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-SakXQ-VdNliVsR5w0hFyew-1; Wed, 06 Oct 2021 07:56:46 -0400
X-MC-Unique: SakXQ-VdNliVsR5w0hFyew-1
Received: by mail-ed1-f72.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so371720edy.14
 for <qemu-arm@nongnu.org>; Wed, 06 Oct 2021 04:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hlDcCTOKOHqELQG0J9ELx1bzgh5+4e7b57/RbQy+ZIk=;
 b=Q2AIPz8RHiXsSNb1WNbwOf7CdftqT0Yd+77UoyiDA06+Bu6TP4pnY6b87sqGJg9Eqw
 LRJRUGL8OErd94GN1KkvECEZpVCfCPcSpVcrl9myQ1FNNFsO4uqWcHHumr6qfnq/XTl4
 v3bDECrpHhETEj/BdQ2Y5YxvT2xvsS+rD8npubudruS1FVXeoIymvP1epqOmBnbhpNZA
 kIrHcck16s+AlgbzojYiVCbQk1pDI0pf+T4Lcw0woXBDnfrpN4ge4rFuQJ65fT/sK+Ko
 3uxu/wb0aS1nATO27oi52BkAgbhA9EobKjMvP5MyEV5hxLEMd7o1id1VtSmcBLf2b75r
 /VzQ==
X-Gm-Message-State: AOAM532WE6otwPwRB5Nq/Zjp3Pvu+iFlSNcTFMhOHirInbY20ovXuOAz
 iIB9BaBXaOgtwytXb6lSNBSI3KpKcuE4Sbulf2GJpgsmq7Kz3sT3VF/SLGigOWVqhKikrkJt7vP
 FMxVKU5B9WsOV
X-Received: by 2002:a17:906:3192:: with SMTP id
 18mr31646008ejy.246.1633521405533; 
 Wed, 06 Oct 2021 04:56:45 -0700 (PDT)
X-Received: by 2002:a17:906:3192:: with SMTP id
 18mr31645971ejy.246.1633521405190; 
 Wed, 06 Oct 2021 04:56:45 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id l16sm8749479eje.67.2021.10.06.04.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 04:56:44 -0700 (PDT)
Date: Wed, 6 Oct 2021 13:56:43 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211006115643.p5b2qcoi4eagluqc@gator.home>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
 <20211006103529.25vjtmkmijmomq4u@gator.home>
 <688560f5-19a4-7a08-41ec-132266f76725@redhat.com>
MIME-Version: 1.0
In-Reply-To: <688560f5-19a4-7a08-41ec-132266f76725@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: peter.maydell@linaro.org, marcel.apfelbaum@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, ehabkost@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MXhFVO/ReTWa

On Wed, Oct 06, 2021 at 10:03:25PM +1100, Gavin Shan wrote:
> Hi Drew,
> 
> On 10/6/21 9:35 PM, Andrew Jones wrote:
> > On Wed, Oct 06, 2021 at 06:22:08PM +0800, Gavin Shan wrote:
> > > The following option is used to specify the distance map. It's
> > > possible the option isn't provided by user. In this case, the
> > > distance map isn't populated and exposed to platform. On the
> > > other hand, the empty NUMA node, where no memory resides, is
> > > allowed on ARM64 virt platform. For these empty NUMA nodes,
> > > their corresponding device-tree nodes aren't populated, but
> > > their NUMA IDs should be included in the "/distance-map"
> > > device-tree node, so that kernel can probe them properly if
> > > device-tree is used.
> > > 
> > >    -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > > 
> > > So when user doesn't specify distance map, we need to generate
> > > the default distance map, where the local and remote distances
> > > are 10 and 20 separately. This adds an extra parameter to the
> > > exiting complete_init_numa_distance() to generate the default
> > > distance map for this case.
> > > 
> > > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > > ---
> > >   hw/core/numa.c | 13 +++++++++++--
> > >   1 file changed, 11 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > > index 510d096a88..fdb3a4aeca 100644
> > > --- a/hw/core/numa.c
> > > +++ b/hw/core/numa.c
> > > @@ -594,7 +594,7 @@ static void validate_numa_distance(MachineState *ms)
> > >       }
> > >   }
> > > -static void complete_init_numa_distance(MachineState *ms)
> > > +static void complete_init_numa_distance(MachineState *ms, bool is_default)
> > >   {
> > >       int src, dst;
> > >       NodeInfo *numa_info = ms->numa_state->nodes;
> > > @@ -609,6 +609,8 @@ static void complete_init_numa_distance(MachineState *ms)
> > >               if (numa_info[src].distance[dst] == 0) {
> > >                   if (src == dst) {
> > >                       numa_info[src].distance[dst] = NUMA_DISTANCE_MIN;
> > > +                } else if (is_default) {
> > > +                    numa_info[src].distance[dst] = NUMA_DISTANCE_DEFAULT;
> > >                   } else {
> > >                       numa_info[src].distance[dst] = numa_info[dst].distance[src];
> > >                   }
> > > @@ -716,13 +718,20 @@ void numa_complete_configuration(MachineState *ms)
> > >            * A->B != distance B->A, then that means the distance table is
> > >            * asymmetric. In this case, the distances for both directions
> > >            * of all node pairs are required.
> > > +         *
> > > +         * The default node pair distances, which are 10 and 20 for the
> > > +         * local and remote nodes separatly, are provided if user doesn't
> > > +         * specify any node pair distances.
> > >            */
> > >           if (ms->numa_state->have_numa_distance) {
> > >               /* Validate enough NUMA distance information was provided. */
> > >               validate_numa_distance(ms);
> > >               /* Validation succeeded, now fill in any missing distances. */
> > > -            complete_init_numa_distance(ms);
> > > +            complete_init_numa_distance(ms, false);
> > > +        } else {
> > > +            complete_init_numa_distance(ms, true);
> > > +            ms->numa_state->have_numa_distance = true;
> > >           }
> > >       }
> > >   }
> > > -- 
> > > 2.23.0
> > > 
> > 
> > With this patch we'll always generate a distance map when there's a numa
> > config now. Is there any reason a user would not want to do that? I.e.
> > should we still give the user the choice of presenting a distance map?
> > Also, does the addition of a distance map in DTs for compat machine types
> > matter?
> > 
> > Otherwise patch looks good to me.
> > 
> 
> Users needn't specify the distance map when the default one in kernel,
> whose distances are 10 and 20 for local and remote nodes in linux for
> all architectures and machines, is used. The following option is still
> usable to specify the distance map.
> 
>   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> 
> When the empty NUMA nodes are concerned, the distance map is mandatory
> because their NUMA IDs are identified from there. So we always generate
> the distance map as this patch does :)
>

Yup, I knew all that already :-) I'm asking if we want to ensure the user
can still control whether or not this distance map is generated at all. If
a user doesn't want empty numa nodes or a distance map, then, with this
patch, they cannot avoid the map's generation. That configurability
question also relates to machine compatibility. Do we want to start
generating this distance map on old, numa configured machine types? This
patch will do that too.

But, it might be OK to just start generating this new DT node for all numa
configured machine types and not allow the user to opt out. I do know that
we allow hardware descriptions to be changed without compat code.  Also, a
disable-auto-distance-map option may be considered useless and therefore
not worth maintaining. The conservative in me says it's worth debating
these things first though.

(Note, empty numa nodes have never worked with QEMU, so it's OK to start
 erroring out when empty numa nodes and a disable-auto-distance-map option
 are given together.)

Thanks,
drew

