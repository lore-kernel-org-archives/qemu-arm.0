Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp6822328wrm;
        Wed, 16 Oct 2019 01:11:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtwf0PZT9O1r+cJKpsUu6no6JQUqX/4Yc0GawBVl9lvvO4t0id5kQgsBnXlT2pP5+J3niD
X-Received: by 2002:a02:4ec3:: with SMTP id r186mr46340683jaa.44.1571213465867;
        Wed, 16 Oct 2019 01:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571213465; cv=none;
        d=google.com; s=arc-20160816;
        b=dfQ42hLqqQfAzsN7PRurlsL1LkVNNGx/rC766VL+dVrIGaNsSSlud64x/+Dl5PyM0k
         N4yvaXtmm2DNUGqmsIJqgtGXYnPJzce3DovbvmJ5CJskmymYV/D1o85rERAM4F3xv6Lr
         KfZHdWFg+QT8fZZRg13DMz4HRRoHqTtzpP1l6c1hinUSEwmbfkvMjqnJ+QnDuqpCyfB0
         WURMINB35QIP8N2P60hLP1hzqwnwUOoFiTHAAXPjhOyNKaUE+j7IZhD1gROwaKQVkKoX
         8Hc0I1ECU6vmknr6ZlV/vTAdsC3YV8GVyUltD7YSrSUUYD0/Nf3+Pwu/9NaXgkAvGlxp
         DlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=cdr8EBiZqmaefawunQgUBSQBvBNNyAX+JmqpD/vjLtk=;
        b=z+QXq8UoMqN+YF7C8LEQLkAB4XUOkZmeSMIOm/aKg+4B/W0BaaMtBX7OtxqmIyTv4E
         ipIVn6rbBtA/NegIEa2hmVydd4N3R4USbkKCQvLd2QUA6LCzbHx11XXHdpVooLWWbYKu
         Q6TDsSKGqSEqlXGMfpFPVGL9u2dHZcMBWlS9SbMHGQ6bZ0mgFjFzLkbHcu+hsd/fZ2Rr
         e84Z6zu//QL5KQoW5CYNF6H+pdgwOqc8jI/T/3cgygGFZdvKmbh3MmpAAtHdGDGVQfRR
         C14Xml/NmqSE+9dqovz5TAxPnlqxgcC77QvcwSipKDzZZVHvDGPUOyIeWZzqBKje06UW
         g/Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id r204si33555366jar.48.2019.10.16.01.11.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 01:11:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D9023082B41;
	Wed, 16 Oct 2019 08:11:04 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5ABE5D9CD;
	Wed, 16 Oct 2019 08:10:59 +0000 (UTC)
Date: Wed, 16 Oct 2019 10:10:57 +0200
From: Andrew Jones <drjones@redhat.com>
To: Beata Michalska <beata.michalska@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, armbru@redhat.com, eric.auger@redhat.com,
	qemu-arm@nongnu.org, imammedo@redhat.com,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Dave.Martin@arm.com
Subject: Re: [PATCH v5 4/9] target/arm/cpu64: max cpu: Introduce sve<N>
 properties
Message-ID: <20191016081057.svdt6uvftshzzjkr@kamzik.brq.redhat.com>
References: <20191001125845.8793-1-drjones@redhat.com>
 <20191001125845.8793-5-drjones@redhat.com>
 <CADSWDzu2mUvTDYJj42747DgBAzWRDoMQRNgtepqyvv23OArHNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADSWDzu2mUvTDYJj42747DgBAzWRDoMQRNgtepqyvv23OArHNQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 16 Oct 2019 08:11:04 +0000 (UTC)
X-TUID: QboChrkn7Fj2

On Wed, Oct 09, 2019 at 03:01:15PM +0100, Beata Michalska wrote:
> On Tue, 1 Oct 2019 at 14:04, Andrew Jones <drjones@redhat.com> wrote:
> >
> > Introduce cpu properties to give fine control over SVE vector lengths.
> > We introduce a property for each valid length up to the current
> > maximum supported, which is 2048-bits. The properties are named, e.g.
> > sve128, sve256, sve384, sve512, ..., where the number is the number of
> > bits. See the updates to docs/arm-cpu-features.rst for a description
> > of the semantics and for example uses.
> >
> > Note, as sve-max-vq is still present and we'd like to be able to
> > support qmp_query_cpu_model_expansion with guests launched with e.g.
> > -cpu max,sve-max-vq=8 on their command lines, then we do allow
> > sve-max-vq and sve<N> properties to be provided at the same time, but
> > this is not recommended, and is why sve-max-vq is not mentioned in the
> > document.  If sve-max-vq is provided then it enables all lengths smaller
> > than and including the max and disables all lengths larger. It also has
> > the side-effect that no larger lengths may be enabled and that the max
> > itself cannot be disabled. Smaller non-power-of-two lengths may,
> > however, be disabled, e.g. -cpu max,sve-max-vq=4,sve384=off provides a
> > guest the vector lengths 128, 256, and 512 bits.
> >
> > This patch has been co-authored with Richard Henderson, who reworked
> > the target/arm/cpu64.c changes in order to push all the validation and
> > auto-enabling/disabling steps into the finalizer, resulting in a nice
> > LOC reduction.
> >
> 
> I have most probably missed part of previous discussions around the vector
> lengths  so apologies if the question is not relevant anymore  but ...
> why the idea of having bitmap representation for those has been dropped ?

https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg03439.html

> Although the proposed solution provides indeed fine control over the vector
> lengths it also adds extra logic for handling corner cases and makes specifying
> those on the command line rather cumbersome in some cases.

Examples?

> What if we could re-consider bitmaps and add an option for sve with a 'help'
> switch to query available options and present them (or just a subset
> as an example)
> with additional information on how to interpret/modify it ? Smth like :
>            -cpu max,sve=help
> which would print the bitmap of available lengths with note on what each bit
> represents and which ones can be modified .
> Than it should be pretty straightforward to enable/disable selected lengths.
> This could potentially simplify things a bit....
> 

I won't be re-considering bitmaps, but arm is in need of better help text
for the cpu option. qemu-system-aarch64 -M virt -cpu help only produces a
list of available CPUs, which don't have descriptions. When checking '-cpu
help' on x86 we get descriptions, and we get another section "Recognized
CPUID flags". After this series is applied we could perhaps add a
"Recognized CPU features" section to arm's '-cpu help'. I don't intend
to do that myself, but I'll take a look at whatever you post :-)

Thanks,
drew
