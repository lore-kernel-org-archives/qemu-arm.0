Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2502686lfk;
        Tue, 19 Apr 2022 08:59:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxynjAdPen4UFANPn9NICKnSI+MokEi5D+nvyYvysuo4pGO8WgA2ONiBlviocQlPF+sJmFd
X-Received: by 2002:a81:84b:0:b0:2f0:cd11:76ee with SMTP id 72-20020a81084b000000b002f0cd1176eemr15685462ywi.378.1650383997814;
        Tue, 19 Apr 2022 08:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650383997; cv=none;
        d=google.com; s=arc-20160816;
        b=vu9MRMUHENJT5aoOfKEWarol5GtjAhLMN9DNU2EEaKvd/uXsXU6zhJ5kJ6sf63vP0S
         U/6oYrZU8MBrLb7jC4BXvhA2GSRjhKNyCzRMhMQlOW7okUoznqW4Kt2GHXWRm9N5YFGL
         r5pU8Je65i6sRRuJAA+S2Q0+RZUjrrvJ/uyVwvMOeBi3TAnN7Dqxxir/lZXNbw845c6s
         ppH0Isoy+cxcVwbN1VTY+LDSxVLWGGNM/dHx51lFwnjsQQiFpeaQJnb7JXPyUObqylKf
         4YBYzjHFDefc/3iUJc6Jq29CoRTdO1Yd+i2JEBwCfpCn+7x8VHWwvVTFu9QFM0803fDn
         SY+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=C9UTiYoTGanyoDVHRbb4z4p9Vr+toG4aCvouVG/PQUk=;
        b=qygIXCjfZEPH7ZI3cT2+hwj9/AXshDlnL49Fm2sqDbDH6RdOa87+0JwSX4dtlG8Dde
         nVDhsZPXZ7dECzgEOsVSNDBRiGUOTJQv1It6MhukOZ96gdRWe9knknXHVWZJ17xWRgru
         vNo6T/UpcI0FtbdkqzPtAA1dGu2dqhJIK/QhPPictqxEwQ9H2SHITC8Fq2QngfMzntTi
         dOiyS0wwsiWOg6PSB6sShsU/gV7/xxBtf4Ss1RUpTPJRCsEeVwCgJ3JP48xDl7ei/8pl
         oZ+B2uwwtXVPqi0DDpXF9uoIIdehdMjCfRwjPMiyoekW8TXxavxTR0yRUbM4VOgJDr3e
         +gNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OX8GqbcL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17-20020a250511000000b00633994043dfsi10807644ybf.73.2022.04.19.08.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Apr 2022 08:59:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OX8GqbcL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ngqGi-0001cV-UE
	for alex.bennee@linaro.org; Tue, 19 Apr 2022 11:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngqGY-0001YW-MV
 for qemu-arm@nongnu.org; Tue, 19 Apr 2022 11:59:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngqGV-0001wd-Ah
 for qemu-arm@nongnu.org; Tue, 19 Apr 2022 11:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650383982;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C9UTiYoTGanyoDVHRbb4z4p9Vr+toG4aCvouVG/PQUk=;
 b=OX8GqbcL7S0UHiZmqkNNC+11iCBY8fME3UiNNKlhHSrO6G5a4bvKK1ndP3bcTXNnfg4Y3b
 Nj9Tk6CzFCU7TC+jFBDsPPjEXtZVEg9rMe60OEjsh4E3qO4mV9P8MkCNQItg+IScMT/3CN
 5PJ3VexiwFG6E6Mj/oZ7ervkdrUw2Bc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-r9LOVbpZOAm3i1t6jsjVFQ-1; Tue, 19 Apr 2022 11:59:39 -0400
X-MC-Unique: r9LOVbpZOAm3i1t6jsjVFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1ED0D2999B57;
 Tue, 19 Apr 2022 15:59:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.155])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E23A440E80E0;
 Tue, 19 Apr 2022 15:59:36 +0000 (UTC)
Date: Tue, 19 Apr 2022 16:59:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH v5 1/4] qapi/machine.json: Add cluster-id
Message-ID: <Yl7cZuRxBLX9qPlw@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-2-gshan@redhat.com>
 <fedf507c-c5ea-aeec-9acc-586f08dcaea4@huawei.com>
 <6e27668c-0895-fcc8-165e-673aded5ba47@redhat.com>
 <f45a3f17-7cef-3d8c-e79c-e6a5898e665e@huawei.com>
MIME-Version: 1.0
In-Reply-To: <f45a3f17-7cef-3d8c-e79c-e6a5898e665e@huawei.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, Gavin Shan <gshan@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: omnFcd7rxbT5

On Thu, Apr 14, 2022 at 10:27:25AM +0800, wangyanan (Y) wrote:
> Hi Gavin,
> 
> Cc: Daniel and Markus
> On 2022/4/14 8:06, Gavin Shan wrote:
> > Hi Yanan,
> > 
> > On 4/13/22 7:49 PM, wangyanan (Y) wrote:
> > > On 2022/4/3 22:59, Gavin Shan wrote:
> > > > This adds cluster-id in CPU instance properties, which will be used
> > > > by arm/virt machine. Besides, the cluster-id is also verified or
> > > > dumped in various spots:
> > > > 
> > > >    * hw/core/machine.c::machine_set_cpu_numa_node() to associate
> > > >      CPU with its NUMA node.
> > > > 
> > > >    * hw/core/machine.c::machine_numa_finish_cpu_init() to associate
> > > >      CPU with NUMA node when no default association isn't provided.
> > > > 
> > > >    * hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() to dump
> > > >      cluster-id.
> > > > 
> > > > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > > > ---
> > > >   hw/core/machine-hmp-cmds.c |  4 ++++
> > > >   hw/core/machine.c          | 16 ++++++++++++++++
> > > >   qapi/machine.json          |  6 ++++--
> > > >   3 files changed, 24 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
> > > > index 4e2f319aeb..5cb5eecbfc 100644
> > > > --- a/hw/core/machine-hmp-cmds.c
> > > > +++ b/hw/core/machine-hmp-cmds.c
> > > > @@ -77,6 +77,10 @@ void hmp_hotpluggable_cpus(Monitor *mon,
> > > > const QDict *qdict)
> > > >           if (c->has_die_id) {
> > > >               monitor_printf(mon, "    die-id: \"%" PRIu64
> > > > "\"\n", c->die_id);
> > > >           }
> > > > +        if (c->has_cluster_id) {
> > > > +            monitor_printf(mon, "    cluster-id: \"%" PRIu64 "\"\n",
> > > > +                           c->cluster_id);
> > > > +        }
> > > >           if (c->has_core_id) {
> > > >               monitor_printf(mon, "    core-id: \"%" PRIu64
> > > > "\"\n", c->core_id);
> > > >           }
> > > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > > index d856485cb4..8748b64657 100644
> > > > --- a/hw/core/machine.c
> > > > +++ b/hw/core/machine.c
> > > > @@ -677,6 +677,11 @@ void machine_set_cpu_numa_node(MachineState
> > > > *machine,
> > > >               return;
> > > >           }
> > > > +        if (props->has_cluster_id && !slot->props.has_cluster_id) {
> > > > +            error_setg(errp, "cluster-id is not supported");
> > > > +            return;
> > > > +        }
> > > > +
> > > >           if (props->has_socket_id && !slot->props.has_socket_id) {
> > > >               error_setg(errp, "socket-id is not supported");
> > > >               return;
> > > > @@ -696,6 +701,11 @@ void machine_set_cpu_numa_node(MachineState
> > > > *machine,
> > > >                   continue;
> > > >           }
> > > > +        if (props->has_cluster_id &&
> > > > +            props->cluster_id != slot->props.cluster_id) {
> > > > +                continue;
> > > > +        }
> > > > +
> > > >           if (props->has_die_id && props->die_id !=
> > > > slot->props.die_id) {
> > > >                   continue;
> > > >           }
> > > > @@ -990,6 +1000,12 @@ static char *cpu_slot_to_string(const
> > > > CPUArchId *cpu)
> > > >           }
> > > >           g_string_append_printf(s, "die-id: %"PRId64,
> > > > cpu->props.die_id);
> > > >       }
> > > > +    if (cpu->props.has_cluster_id) {
> > > > +        if (s->len) {
> > > > +            g_string_append_printf(s, ", ");
> > > > +        }
> > > > +        g_string_append_printf(s, "cluster-id: %"PRId64,
> > > > cpu->props.cluster_id);
> > > > +    }
> > > >       if (cpu->props.has_core_id) {
> > > >           if (s->len) {
> > > >               g_string_append_printf(s, ", ");
> > > > diff --git a/qapi/machine.json b/qapi/machine.json
> > > > index 9c460ec450..ea22b574b0 100644
> > > > --- a/qapi/machine.json
> > > > +++ b/qapi/machine.json
> > > > @@ -868,10 +868,11 @@
> > > >   # @node-id: NUMA node ID the CPU belongs to
> > > >   # @socket-id: socket number within node/board the CPU belongs to
> > > >   # @die-id: die number within socket the CPU belongs to (since 4.1)
> > > > -# @core-id: core number within die the CPU belongs to
> > > > +# @cluster-id: cluster number within die the CPU belongs to
> We also need a "(since 7.1)" tag for cluster-id.
> > > I remember this should be "cluster number within socket..."
> > > according to Igor's comments in v3 ?
> > 
> > Igor had suggestion to correct the description for 'core-id' like
> > below, but he didn't suggest anything for 'cluster-id'. The question
> > is clusters are sub-components of die, instead of socket, if die
> > is supported? You may want to me change it like below and please
> > confirm.
> > 
> >   @cluster-id: cluster number within die/socket the CPU belongs to
> > 
> > suggestion from Ignor in v3:
> > 
> >    > +# @core-id: core number within cluster the CPU belongs to
> > 
> >    s:cluster:cluster/die:
> > 
> We want "within cluster/die" description for core-id because we
> support both "cores in cluster" for ARM and "cores in die" for X86.
> Base on this routine, we only need "within socket" for cluster-id
> because we currently only support "clusters in socket". Does this
> make sense?
> 
> Alternatively, the plainest documentation for the IDs is to simply
> range **-id only to its next level topo like below. This may avoid
> increasing complexity when more topo-ids are inserted middle.
> But whether this way is acceptable is up to the Maintainers. :)

Rather saying we only support cluster on ARM and only dies on x86,
I tend to view it as, we only support greater than 1 cluster on
ARM, and greater than 1 die on x86.

IOW, x86 implicitly always has exactly 1-and-only-1 cluster,
and arm implicitly always has exactly 1-and-only-1 die.

With this POV, then we can keep the description simple, only
refering to the immediately above level in the hierarchy.

> 
> # @socket-id: socket number within node/board the CPU belongs to
> # @die-id: die number within socket the CPU belongs to (since 4.1)
> # @cluster-id: cluster number within die the CPU belongs to (since 7.1)
> # @core-id: core number within cluster the CPU belongs to
> # @thread-id: thread number within core the CPU belongs to

So this suggested text is fine with me.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

