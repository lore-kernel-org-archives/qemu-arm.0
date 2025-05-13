Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp631233njb;
        Tue, 13 May 2025 09:17:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFyNzgfBEbdxPqI8rnlzhVBtSXMt/OD2xywNpdu1J7dPbpNqJNDenz+ynb17tnkaSEaJ4o0sMVsPCo3A==@linaro.org
X-Google-Smtp-Source: AGHT+IGLKhCq+PMTPyqFo/lVxaqi3vVIdi4B4MCjEviynLOuE7PlDH38Vk9nvnWRr/stYSftxMN6
X-Received: by 2002:a05:622a:410b:b0:48b:512a:a919 with SMTP id d75a77b69052e-49495c56ea7mr1428451cf.3.1747153058659;
        Tue, 13 May 2025 09:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747153058; cv=none;
        d=google.com; s=arc-20240605;
        b=lbFN5tshuCTlv4MfUIIvBci+ucJVV1n7WixHlWrMuDE4OP0FjPyefAQ8qqjOm2TKHo
         4frwtYMVpwo6byE+Sasfe/DYdZEA4yBJ3ViH+rAlm9p4hP7f5d8fQFWkBJ3GN4Zg2RWd
         iK7G2TYfOyschI6lsCwyDC03WmzeCByV+Sgw5wpalUg7a06R4T0bTXKZok7lGSNdnB5i
         ZvXQecAs2gFYgBgoPUGKVM4E18l4hYWnmyWEBKOAHTblppO/xR1Mm8w/zgHxxA2wTrJC
         RwvPyt1iVx1wfhA0bVSvdOe2ZsY/+gRVLAXoOHa2w8JbwPa9Iu9dAnVBU5MRVdpjmwBY
         GIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=xrlJmq+sxj06Pce/vrGFl4DL6yT50KGGqCTzoiNbwfQ=;
        fh=iM9GwfGv21/blqyxO272EqVSEyp03V2YmKTOh+3dT00=;
        b=YJAsGDgk/OTnUrRSVJiWQ65x0RbOPjdpqcubMz2NaHkJ0fT79wyf+0B4WRHHj6lhs3
         jf1giMVZhyse4A83qzk2+hROhH0U9DC8WKX+hT9cB5rngYg29s/WR5i55FtByuKWvmqu
         14qXuD2JXcoC0E1xk6grbfjsDdMb4O7OuLj6GGhA1mo6/ao6lS3Z+suBfBppzMwkMwLI
         dtWlCVkdPB+GyP2Q28kd8EV/cQ4VbBzEPn/wfOpkq6evIRAO364zJhXYcurUpQ5FVCAH
         wJsf0wHcvae+RH2QNrzV14OOLygR7mgwjWquwnH1cB9nJXq2axrvnlP5+q/CqFaLDxt8
         2Pkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h+o+XTox;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-49452557962si116597231cf.270.2025.05.13.09.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 09:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h+o+XTox;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747153058;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrlJmq+sxj06Pce/vrGFl4DL6yT50KGGqCTzoiNbwfQ=;
	b=h+o+XToxQEBvKB0HK59T2SBAtisQzhBdUG6kt/e4BymM5TUsGzZr6are6/XF6KrMJEgVyh
	y2WoKXjYB2eiKEYhLN/6x7Dz/0afAYL/kmgrxaPKbXZrT2ZrDeLKVrGmFuXFybu9ehw3TP
	xrZQfgwVRstksNQLAnG5a8Q7IneBYy4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-359-EqwJaqy9O9WjiFPI_ymCpQ-1; Tue,
 13 May 2025 12:17:35 -0400
X-MC-Unique: EqwJaqy9O9WjiFPI_ymCpQ-1
X-Mimecast-MFC-AGG-ID: EqwJaqy9O9WjiFPI_ymCpQ_1747153053
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0C3C2195DE0B;
	Tue, 13 May 2025 16:17:33 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.110])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9100930001A1;
	Tue, 13 May 2025 16:17:27 +0000 (UTC)
Date: Tue, 13 May 2025 17:17:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
	philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH for-10.1 v5 02/13] arm/cpu: Store aa64isar0/aa64zfr0 into
 the idregs arrays
Message-ID: <aCNwlHK5lNNLzxeX@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250409144304.912325-1-cohuck@redhat.com>
 <20250409144304.912325-3-cohuck@redhat.com>
 <aCNoEs-jQ7IUTt8q@redhat.com>
 <875xi4pkqp.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875xi4pkqp.fsf@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: 6AWHhWxie0Os

On Tue, May 13, 2025 at 05:56:46PM +0200, Cornelia Huck wrote:
> On Tue, May 13 2025, Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Wed, Apr 09, 2025 at 04:42:53PM +0200, Cornelia Huck wrote:
> >> From: Eric Auger <eric.auger@redhat.com>
> >> 
> >> Also add kvm add accessors for storing host features into idregs.
> >> 
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >> ---
> >>  target/arm/cpu-features.h | 57 ++++++++++++++++++++-------------------
> >>  target/arm/cpu-sysregs.h  |  4 +++
> >>  target/arm/cpu.c          | 10 +++----
> >>  target/arm/cpu.h          |  2 --
> >>  target/arm/cpu64.c        |  8 +++---
> >>  target/arm/helper.c       |  6 +++--
> >>  target/arm/hvf/hvf.c      |  3 ++-
> >>  target/arm/kvm.c          | 30 ++++++++++++++++++---
> >>  target/arm/tcg/cpu64.c    | 44 ++++++++++++++++++------------
> >>  9 files changed, 101 insertions(+), 63 deletions(-)
> >
> >> diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
> >> index 7877a3b06a8e..e89a1105904c 100644
> >> --- a/target/arm/cpu-sysregs.h
> >> +++ b/target/arm/cpu-sysregs.h
> >> @@ -39,4 +39,8 @@ extern const uint32_t id_register_sysreg[NUM_ID_IDX];
> >>  
> >>  int get_sysreg_idx(ARMSysRegs sysreg);
> >>  
> >> +#ifdef CONFIG_KVM
> >> +uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg);
> >> +#endif
> >
> > This breaks the build when KVM is disabled, and/or not available
> > on the build target architecture
> >
> > In file included from ../target/arm/cpu.h:35,
> >                  from /var/home/berrange/src/virt/qemu/include/hw/arm/digic.h:21,
> >                  from ../hw/arm/digic_boards.c:31:
> > /var/home/berrange/src/virt/qemu/target/arm/cpu-sysregs.h:42:8: error: attempt to use poisoned ‘CONFIG_KVM’
> >    42 | #ifdef CONFIG_KVM
> >       |        ^
> > In file included from /var/home/berrange/src/virt/qemu/include/exec/poison.h:7,
> >                  from /var/home/berrange/src/virt/qemu/include/qemu/osdep.h:38,
> >                  from ../hw/arm/digic_boards.c:26:
> > ./config-poison.h:185:20: note: poisoned here
> >   185 | #pragma GCC poison CONFIG_KVM
> >       |                    ^~~~~~~~~~
> > ninja: build stopped: subcommand failed.
> 
> I have already fixed that one in v6.

Ah yes, I was testing v5 as that one can apply with the KVM CPU model series

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
