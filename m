Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp874733njb;
        Thu, 1 Aug 2024 04:28:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjsAvNdGhyGMvCsX1Z+y+Y6NBYCWMVji3kGHBrkbthK9iam+wAHA93rL9TFRU07QscrwYZb1Ns5bpVfWRMltvx0NIrqThk
X-Google-Smtp-Source: AGHT+IGtjGd03d6YpzPdU3v8oIv8ucQ86Hiw9PXJX3Dd3VZyn2FkteSDAbRuGfF972a6hfBPpLFX
X-Received: by 2002:ac8:59d3:0:b0:447:dedb:99eb with SMTP id d75a77b69052e-4515ead4585mr22708971cf.60.1722511718840;
        Thu, 01 Aug 2024 04:28:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722511718; cv=none;
        d=google.com; s=arc-20160816;
        b=WPMYaBKdYJGbkcShl+F7X+e5y2lWSf0IVFGbmwsvuSe5D2FQGJGBlueftkUoZPN//+
         cQL1o7noVATOMF5KjokONCMReP8i35PJ3TD8sRsGXnHUe/OvQYGthY77qgwcIX2aeDC2
         QGReWsQyFUGf9qMLvP6hqwLqm+2Bjqdte5fFjiOnyLQMK5NeK0MUjKbomeP/fwyR2V81
         9GzNGnv45GMc46CvzRliZsazOhx89D/ZYtRiCz6X1Wzo8xLmXzF5Tg2kCvP/jD1lvrHL
         oHqZPBb8OU+B7tuIL3uwOWaCIsCQl+tLgsAwNX+QLqVwxDKELOmRydE/ByIXNFbTQ9je
         RnVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=rDxUGggwXWhjZViKaa52XrXs/fzrEJLE9M/NPwvujOg=;
        fh=YtMdrrrL4AdjARoXd5Fxw8LjXJzXSJRO9dQYlO5BjO8=;
        b=ou+n2zBC4NZh3Wz/Nvt7K6Vspj96zCTRNlcvLEzWeDXz/HoX1RE41iFaWsh45/fTMd
         XLmoidBXQfmC4TYOGZUTGKmovNWwfgY5FvkRvAxqV40N73w7yk4OYnsFvyWD5MhRNNNg
         6nycedNJeHWZDEfDB/wJdDitTq/pEHHQ4YE0AkBEXXEvGohFCs3d1/EstUQisXxdJ/Vj
         sPR8CKGfbz8r2Aa58zt4X0Ts2Zt1T1ry8gDDp0IcN4EHzPDluoGyPjhR2/boKtYS0R3D
         0rVaTAm3O6pyuJz8WJ/WUOVmGBcRr5WLrBSK8xRaj0S0JRfktcEULvAUEsZt8wXhqHU+
         NDHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X4QnPTEu;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe81fc028si181956831cf.371.2024.08.01.04.28.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 04:28:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X4QnPTEu;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722511718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rDxUGggwXWhjZViKaa52XrXs/fzrEJLE9M/NPwvujOg=;
	b=X4QnPTEuniFwCw0cfQaUS/SAfY/sKv7028XPCjN4LAWRpiCH/gqfLR1UGBzVlab06KiTeQ
	iyWd69MHNJPxRhnECwfc5JRGB4+opqXS8mdoZw8XYK2K/Rglt3Qw5Sbd7gWdiJq+cwVAmP
	veOoZsAnfNJU+VI6NULUlAim2fVTSMQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-639-UbpUzyWTMHCWhQlKJuqY3g-1; Thu,
 01 Aug 2024 07:28:34 -0400
X-MC-Unique: UbpUzyWTMHCWhQlKJuqY3g-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B0D291955F28;
	Thu,  1 Aug 2024 11:28:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.65])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 77B3419560AE;
	Thu,  1 Aug 2024 11:28:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6556C21E6692; Thu,  1 Aug 2024 13:28:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Eduardo
 Habkost
 <eduardo@habkost.net>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Yanan Wang
 <wangyanan55@huawei.com>,  "Michael S . Tsirkin" <mst@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Eric Blake <eblake@redhat.com>,  Marcelo
 Tosatti <mtosatti@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
  Peter Maydell <peter.maydell@linaro.org>,  Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  Sia Jee Heng
 <jeeheng.sia@starfivetech.com>,  qemu-devel@nongnu.org,
  kvm@vger.kernel.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
  Zhenyu Wang <zhenyu.z.wang@intel.com>,  Dapeng Mi
 <dapeng1.mi@linux.intel.com>,  Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache object
In-Reply-To: <ZqtXP9MViOlyhEsu@intel.com> (Zhao Liu's message of "Thu, 1 Aug
	2024 17:37:03 +0800")
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
	<20240704031603.1744546-9-zhao1.liu@intel.com>
	<87r0bl35ug.fsf@pond.sub.org> <Zp5vxtXWDeHAdPok@intel.com>
	<87bk2nnev2.fsf@pond.sub.org> <ZqEN1kZaQcuY4UPG@intel.com>
	<87le1psuv3.fsf@pond.sub.org> <ZqtXP9MViOlyhEsu@intel.com>
Date: Thu, 01 Aug 2024 13:28:27 +0200
Message-ID: <87mslweb38.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: q5mSg0CxySHt

Zhao Liu <zhao1.liu@intel.com> writes:

> On Thu, Jul 25, 2024 at 11:07:12AM +0200, Markus Armbruster wrote:
>> Date: Thu, 25 Jul 2024 11:07:12 +0200
>> From: Markus Armbruster <armbru@redhat.com>
>> Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache
>>  object
>> 
>> Zhao Liu <zhao1.liu@intel.com> writes:
>> 
>> > Hi Markus and Daniel,
>> >
>> > I have the questions about the -object per cache implementation:
>> >
>> > On Wed, Jul 24, 2024 at 02:39:29PM +0200, Markus Armbruster wrote:
>> >> Date: Wed, 24 Jul 2024 14:39:29 +0200
>> >> From: Markus Armbruster <armbru@redhat.com>
>> >> Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache
>> >>  object
>> >> 
>> >> Zhao Liu <zhao1.liu@intel.com> writes:
>> >> 
>> >> > Hi Markus,
>> >> >
>> >> > On Mon, Jul 22, 2024 at 03:37:43PM +0200, Markus Armbruster wrote:
>> >> >> Date: Mon, 22 Jul 2024 15:37:43 +0200
>> >> >> From: Markus Armbruster <armbru@redhat.com>
>> >> >> Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache
>> >> >>  object
>> >> >> 
>> >> >> Zhao Liu <zhao1.liu@intel.com> writes:
>> >> >> 
>> >> >> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>> >> >> 
>> >> >> This patch is just documentation.  The code got added in some previous
>> >> >> patch.  Would it make sense to squash this patch into that previous
>> >> >> patch?
>> >> >
>> >> > OK, I'll merge them.
>> >> >
>> >> >> > ---
>> >> >> > Changes since RFC v2:
>> >> >> >  * Rewrote the document of smp-cache object.
>> >> >> >
>> >> >> > Changes since RFC v1:
>> >> >> >  * Use "*_cache=topo_level" as -smp example as the original "level"
>> >> >> >    term for a cache has a totally different meaning. (Jonathan)
>> >> >> > ---
>> >> >> >  qemu-options.hx | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
>> >> >> >  1 file changed, 58 insertions(+)
>> >> >> >
>> >> >> > diff --git a/qemu-options.hx b/qemu-options.hx
>> >> >> > index 8ca7f34ef0c8..4b84f4508a6e 100644
>> >> >> > --- a/qemu-options.hx
>> >> >> > +++ b/qemu-options.hx
>> >> >> > @@ -159,6 +159,15 @@ SRST
>> >> >> >          ::
>> >> >> >  
>> >> >> >              -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512
>> >> >> > +
>> >> >> > +    ``smp-cache='id'``
>> >> >> > +        Allows to configure cache property (now only the cache topology level).
>> >> >> > +
>> >> >> > +        For example:
>> >> >> > +        ::
>> >> >> > +
>> >> >> > +            -object '{"qom-type":"smp-cache","id":"cache","caches":[{"name":"l1d","topo":"core"},{"name":"l1i","topo":"core"},{"name":"l2","topo":"module"},{"name":"l3","topo":"die"}]}'
>> >> >> > +            -machine smp-cache=cache
>> >> >> >  ERST
>> >> >> >  
>> >> >> >  DEF("M", HAS_ARG, QEMU_OPTION_M,
>> >> >> > @@ -5871,6 +5880,55 @@ SRST
>> >> >> >          ::
>> >> >> >  
>> >> >> >              (qemu) qom-set /objects/iothread1 poll-max-ns 100000
>> >> >> > +
>> >> >> > +    ``-object '{"qom-type":"smp-cache","id":id,"caches":[{"name":cache_name,"topo":cache_topo}]}'``
>> >> >> > +        Create an smp-cache object that configures machine's cache
>> >> >> > +        property. Currently, cache property only include cache topology
>> >> >> > +        level.
>> >> >> > +
>> >> >> > +        This option must be written in JSON format to support JSON list.
>> >> >> 
>> >> >> Why?
>> >> >
>> >> > I'm not familiar with this, so I hope you could educate me if I'm wrong.
>> >> >
>> >> > All I know so far is for -object that defining a list can only be done in
>> >> > JSON format and not with a numeric index like a keyval based option, like:
>> >> >
>> >> > -object smp-cache,id=cache0,caches.0.name=l1i,caches.0.topo=core: Parameter 'caches' is missing
>> >> >
>> >> > the above doesn't work.
>> >> >
>> >> > Is there any other way to specify a list in command line?
>> >> 
>> >> The command line is a big, sprawling mess :)
>> >> 
>> >> -object supports either a JSON or a QemuOpts argument.  *Not* keyval!
>> >> 
>> >> Both QemuOpts and keyval parse something like KEY=VALUE,...  Keyval
>> >> supports arrays and objects via dotted keys.  QemuOpts doesn't natively
>> >> support arrays and objects, but its users can hack around that
>> >> limitation in various ways.  -object doesn't.  So you're right, it's
>> >> JSON or bust here.
>> >> 
>> >> However, if we used one object per cache instead, we could get something
>> >> like
>> >> 
>> >>     -object smp-cache,name=l1d,...
>> >>     -object smp-cache,name=l1u,...
>> >>     -object smp-cache,name=l2,...
>> >>     ...
>> >
>> > Current, I use -object to create a smp_cache object, and link it to
>> > MachineState by -machine,smp-cache=obj_id.
>> >
>> > Then for the objects per cache, how could I link them to machine?
>> >
>> > Is it possible that I create something static in smp_cache.c and expose
>> > all the cache information to machine through some interface?
>> 
>> Good questions.  However, before we head deeper into the weeds here, I
>> feel we should discuss the things below.  And before we do that, I need
>> a clear understanding of the use case.  Elsewhere in this thread, I just
>> described the use case as I understand it.  Please reply there.  I'll
>> then come back to this message.
>> 
>> [...]
>
> Jonathan and I provided different use cases for x86 and Arm. Could we
> come back here to continue the discussion? :)

Can you provide a brief summary of the design alternatives that have
been proposed so far?  Because I've lost track.
