Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1741140lfc;
        Tue, 12 Oct 2021 05:28:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4XEj1FKA1wBTyNm3ODagx2VJD/wU+7IzOG9Zu2+hmYI3RZIl6Ts0i4e+wp5i/vvpes4xs
X-Received: by 2002:a1f:2cd1:: with SMTP id s200mr25974671vks.3.1634041718522;
        Tue, 12 Oct 2021 05:28:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634041718; cv=none;
        d=google.com; s=arc-20160816;
        b=miVeFZJ8MnBZ1vzJemTLyhcwdeMPkr56jD9QwmMD4BO1KLjY8tK1tOtxPetOB/+GBr
         y50p6xVY90Pv+KfmjnKAm7a2Ol3ocp6EjZ39x2ZCdgjcVslP84YniRPT34B2juwyv63K
         mdZXmGkb4A9LDHTeEK0LzwNaQ0pv+eZ7TcknFEiUiSc9Hu3rutjZNpPic7A39HkmKzkT
         2qvbNk2FbOhRsj2gPyQ9+MZs/EmYXRC/dN0OmfiHYPzNoZLErWJSTGQac1tFTtA3Ipdj
         W2EqbYzqVQ75Hr/EiQ4Bzxzo2prHcKjwqImpEg9MlNsnGWu8BYQfhkRRxv9F7RtYc7Y1
         89vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=/pqYA7Tr3nCnq6g+rTs69vkidTk3Tpk0Bs4JZ0mBDQ0=;
        b=iYoVFd54qCN/+/vo+Xzwc3NqHeXcILzy0DzjDYEVROkv9loMMjYYeZAhyU1mZLfe8o
         lQjLyaAXRAqKYJoFTa1of1TZ6XeAW5k2AqZsHwlkwyXb4KfME3xQhc3oT1Oi6NDlVaN0
         2p+WNfW5iQeOrui0iM2EsmIe1ofbkHyaXnKYCcQYpHfNPX39Km2qXf00QzzLnneDFKCO
         BrGB7RuZp8Zwrhg7WdPiWbS+/+QYejX45fnmIWUk4RgyzSuSGcF7Con+L0U37JBUBgfy
         nbCzb9wFHagY1czMXFqWmILJgV7rHduYwshCQbQQkByFoxrjzdGkytgHi3OFgu36vgxW
         pPcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FJrAzsjP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p26si8032513uar.105.2021.10.12.05.28.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 05:28:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FJrAzsjP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maGtZ-0004a4-Qz
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 08:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maGt3-0004Xa-IZ
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 08:28:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maGt0-00017Z-F5
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 08:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634041680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/pqYA7Tr3nCnq6g+rTs69vkidTk3Tpk0Bs4JZ0mBDQ0=;
 b=FJrAzsjPr9oZzP+YzQpm+FJG9QxLN7d5OpGL9aAI12cXaXNQ4DFYcgdoHefZ1HPIgMxuVj
 9+92NIcCTU5eHYtrszhVyct3nYpZpAh7rM+olkpoK4XrPuXNRgX2ChKIc1iUBoUj/oBgIX
 PD3gao56VlrioXBDnD1KnXi48/+zspQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-jCS93vojMtGQd-NmtAR46g-1; Tue, 12 Oct 2021 08:27:57 -0400
X-MC-Unique: jCS93vojMtGQd-NmtAR46g-1
Received: by mail-ed1-f72.google.com with SMTP id
 v9-20020a50d849000000b003db459aa3f5so16154185edj.15
 for <qemu-arm@nongnu.org>; Tue, 12 Oct 2021 05:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/pqYA7Tr3nCnq6g+rTs69vkidTk3Tpk0Bs4JZ0mBDQ0=;
 b=4lnLOWA8Q7D9DRnQK0eSC5gpKD9LhhTwQOT7cbclx5+Ah9Z63fLJQDxZtMdI0gDSWD
 LXdB7dWOCbfZPejMgmyC3qtuqXP7NZ0SayeolwZ/N4bNJlgxVPE538+HnWWYIC7sa0cs
 EY08EuCbMCjBICOrbddLFBTK+DYvs/ObJosddMJuevpp7WuCaI67lbd8+IbRaPgH9jOy
 xio/jW+R6mGQSsd2Miz+45cxKqCCZt1idZwFbEs9ks3tEnKOYAifJMez81o67a6F5Rjl
 /z7lDEctD1tYZXzYBSIyt1IDiDFBPydRLT7YxQPYYyHUA7aSJjnqngXHyCOVz5ZOKDnk
 14+Q==
X-Gm-Message-State: AOAM532/NkGJ6qjNG3+SXQlzEFYylmVOvTj0BVGnZpDQsmwLpTZBd6Od
 opHXaQGK8sDf/CZEHbqnbsLxkc3+/nEod7B6Y4CoVcVUB8QM9KpEZ4Io25srRK+0VsxWOnKtLpt
 3TNcCGOncC/Em
X-Received: by 2002:a17:906:7847:: with SMTP id
 p7mr31435217ejm.335.1634041676597; 
 Tue, 12 Oct 2021 05:27:56 -0700 (PDT)
X-Received: by 2002:a17:906:7847:: with SMTP id
 p7mr31435180ejm.335.1634041676301; 
 Tue, 12 Oct 2021 05:27:56 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id v23sm1886452ejf.68.2021.10.12.05.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 05:27:55 -0700 (PDT)
Date: Tue, 12 Oct 2021 14:27:54 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211012142754.1c4e5071@redhat.com>
In-Reply-To: <20211012103754.kbyd3du26rpsi3ie@gator.home>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
 <20211012114016.6f4a0c10@redhat.com>
 <20211012103754.kbyd3du26rpsi3ie@gator.home>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Gavin Shan <gshan@redhat.com>,
 ehabkost@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: znEGxjhB7WnW

On Tue, 12 Oct 2021 12:37:54 +0200
Andrew Jones <drjones@redhat.com> wrote:

> On Tue, Oct 12, 2021 at 11:40:16AM +0200, Igor Mammedov wrote:
> > On Wed,  6 Oct 2021 18:22:08 +0800
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
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
> > >   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > > 
> > > So when user doesn't specify distance map, we need to generate
> > > the default distance map, where the local and remote distances
> > > are 10 and 20 separately. This adds an extra parameter to the
> > > exiting complete_init_numa_distance() to generate the default
> > > distance map for this case.
> > > 
> > > Signed-off-by: Gavin Shan <gshan@redhat.com>  
> > 
> > 
> > how about error-ing out if distance map is required but
> > not provided by user explicitly and asking user to fix
> > command line?
> > 
> > Reasoning behind this that defaults are hard to maintain
> > and will require compat hacks and being raod blocks down
> > the road.
> > Approach I was taking with generic NUMA code, is deprecating
> > defaults and replacing them with sanity checks, which bail
> > out on incorrect configuration and ask user to correct command line.
> > Hence I dislike approach taken in this patch.
> > 
> > If you really wish to provide default, push it out of
> > generic code into ARM specific one
> > (then I won't oppose it that much (I think PPC does
> > some magic like this))
> > Also behavior seems to be ARM specific so generic
> > NUMA code isn't a place for it anyways  
> 
> The distance-map DT node and the default 10/20 distance-map values
> aren't arch-specific. RISCV is using it too.
> 
> I'm on the fence with this. I see erroring-out to require users
> to provide explicit command lines as a good thing, but I also
> see it as potentially an unnecessary burden for those that want
> the default map anyway. The optional nature of the distance-map
> node and the specification of the default map is here [1]
> 
> [1] Linux source: Documentation/devicetree/bindings/numa.txt

Looking at proposed linux patches [ https://lkml.org/lkml/2021/9/27/31 ],
using optional distance table as source for numa-node-ids,
looks like a hack around kernel's inability to fish them out
from CPU &| PCI nodes (using those nodes as source should
cover memory-less node use-case).

I consider including optional node as a policy decision.
So user shall include it explicitly on QEMU command line
if necessary (that works just fine for x86), or guest OS
can make up defaults on its own in absence of data.

> So, my r-b stands for this patch, but I also wouldn't complain
> about respinning it to error out instead.

> I would complain about
> moving the logic to Arm specific code, though, since RISCV would
> then need to duplicate it.

Instead of putting workaround in QEMU and then making them generic,
I'd prefer to:
 1. make QEMU to be able generate DT with memory-less nodes
 2. fix guest to get numa-node-id from CPU/PCI nodes if
    memory node isn't present, or use ACPI tables which can
    describe memory-less NUMA nodes if fixing how DT is
    parsed unfeasible.

> Thanks,
> drew
> 
> >   
> > > ---
> > >  hw/core/numa.c | 13 +++++++++++--
> > >  1 file changed, 11 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > > index 510d096a88..fdb3a4aeca 100644
> > > --- a/hw/core/numa.c
> > > +++ b/hw/core/numa.c
> > > @@ -594,7 +594,7 @@ static void validate_numa_distance(MachineState *ms)
> > >      }
> > >  }
> > >  
> > > -static void complete_init_numa_distance(MachineState *ms)
> > > +static void complete_init_numa_distance(MachineState *ms, bool is_default)
> > >  {
> > >      int src, dst;
> > >      NodeInfo *numa_info = ms->numa_state->nodes;
> > > @@ -609,6 +609,8 @@ static void complete_init_numa_distance(MachineState *ms)
> > >              if (numa_info[src].distance[dst] == 0) {
> > >                  if (src == dst) {
> > >                      numa_info[src].distance[dst] = NUMA_DISTANCE_MIN;
> > > +                } else if (is_default) {
> > > +                    numa_info[src].distance[dst] = NUMA_DISTANCE_DEFAULT;
> > >                  } else {
> > >                      numa_info[src].distance[dst] = numa_info[dst].distance[src];
> > >                  }
> > > @@ -716,13 +718,20 @@ void numa_complete_configuration(MachineState *ms)
> > >           * A->B != distance B->A, then that means the distance table is
> > >           * asymmetric. In this case, the distances for both directions
> > >           * of all node pairs are required.
> > > +         *
> > > +         * The default node pair distances, which are 10 and 20 for the
> > > +         * local and remote nodes separatly, are provided if user doesn't
> > > +         * specify any node pair distances.
> > >           */
> > >          if (ms->numa_state->have_numa_distance) {
> > >              /* Validate enough NUMA distance information was provided. */
> > >              validate_numa_distance(ms);
> > >  
> > >              /* Validation succeeded, now fill in any missing distances. */
> > > -            complete_init_numa_distance(ms);
> > > +            complete_init_numa_distance(ms, false);
> > > +        } else {
> > > +            complete_init_numa_distance(ms, true);
> > > +            ms->numa_state->have_numa_distance = true;
> > >          }
> > >      }
> > >  }  
> >   
> 

