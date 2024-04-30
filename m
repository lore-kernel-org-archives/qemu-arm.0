Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2821523ejb;
        Tue, 30 Apr 2024 02:58:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJts1pWZj+c7FvulXLaffIeoU8LxS8MtbKuSuz1JKBzyiPK0sIc3aL9r724q1wcvtqMA1q3+OXM1bKWXq+hy9s7D971OTs
X-Google-Smtp-Source: AGHT+IE0J3tiPfMuBMnts2VAZPZ4Ov/274+7HmWJrR1GI1fi5mgVp78AUOzk583F7te6YG2ZHDpj
X-Received: by 2002:a05:6214:11af:b0:6a0:b3ff:1897 with SMTP id u15-20020a05621411af00b006a0b3ff1897mr9250929qvv.30.1714471133261;
        Tue, 30 Apr 2024 02:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714471133; cv=none;
        d=google.com; s=arc-20160816;
        b=prC3gHmVxz8yQf304wWEPaSQwkNutyuA4OEvGZHobV0s7AHxg/DD2rBnWk/TIaHc6h
         x7UKGEeAWqi97ZSiSvcUAMy1wGb7xk3mYXGOgz9y7tfLL5K6xAFXvGNSYQC2I7PwIZvA
         RUIHKd2pD9TxOPvZUIAAbIqPDIiuSFpXO4iaBPTe6+WuWgX1J+sJUE5rHKtr2gYtR+KR
         657y5LQ3FYNA/UQwBmJb/vMY+ObrShGVH8d56VnQ3NJ8Yf8mNxeh2uz+ep5m3aKx5s0g
         ZHIRaGyYD1zObTL18JOrSeJ54LcQ/z8VdtTE7bGJM+van9m1FUuGc9MQx2F4g+BjMHF2
         8atQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=kU9pPNikDf5lRccmsUFAiHv61aQpHgC9/O4y40MQER0=;
        fh=eGHpXTm3s+WOplAHmbSFR9dZtx2A21cYekWNlvwPGD4=;
        b=yneQgF7S5IrLwqVbdYQfj9E1YBNxkT5Ge6PbEspdAz9CyeTgEN1oP0mYN8kXHqECbj
         qQ+ifDP6bchRG4rr4FGxN8fZZrzmhqVnJn9t4gicK6SzqoRWo0aBrMk38oYhg1/djiLQ
         rxgkG1iTOXB4TsZbtsCS0Hh9+E91CkMVKxAHh97gnZKforCEQOCRHzl606uEV7ovAvG/
         E7t7f3n2lrPktt+8GtOfq/oG+69ELI1PIXNuO48VUPzp5azcwMYY5r86bx6TbtpUZIAv
         PK5zxRDnfCe4rTRp9Hj4XdTGC95IAWREYrGY3k7BFLXRLXceNsQOp8ecqjchBetSckOt
         wKdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Veu+87Bi;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id c3-20020a056214224300b0069b7a52a8a2si28359699qvc.550.2024.04.30.02.58.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 02:58:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Veu+87Bi;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714471132;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kU9pPNikDf5lRccmsUFAiHv61aQpHgC9/O4y40MQER0=;
	b=Veu+87BiVjuMGPjho9Lq7hC85nDxqd4ViWResHc1hhYeI4gM/yhxAmiQOSBzsY0//HEunB
	n/vBDgDvlaReIGqHjYVxd3RWqmBiG/pgt6VT5+48ZyCZxFhUWulElnGgJV3bbTBPzvoiSU
	nOfz8udKZyTuEGYpoN1CBGdTSfNUSmc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-na2ixJT1OwGlPqBXRFTMlg-1; Tue, 30 Apr 2024 05:58:50 -0400
X-MC-Unique: na2ixJT1OwGlPqBXRFTMlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D82580591B;
	Tue, 30 Apr 2024 09:58:49 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.59])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D28161C0F141;
	Tue, 30 Apr 2024 09:58:47 +0000 (UTC)
Date: Tue, 30 Apr 2024 10:58:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, devel@lists.libvirt.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH] docs/about: Automatically deprecate versioned machine
 types older than 6 years
Message-ID: <ZjDA1BFQwo19FLam@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240430064529.411699-1-thuth@redhat.com>
 <e0e836cf-f080-45f4-a71b-060dd2c90279@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0e836cf-f080-45f4-a71b-060dd2c90279@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-TUID: 6okieO3BwFm9

On Tue, Apr 30, 2024 at 11:40:42AM +0200, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 30/4/24 08:45, Thomas Huth wrote:
> > Old machine types often have bugs or work-arounds that affect our
> > possibilities to move forward with the QEMU code base (see for example
> > https://gitlab.com/qemu-project/qemu/-/issues/2213 for a bug that likely
> > cannot be fixed without breaking live migration with old machine types,
> > or https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg04516.html or
> > commit ea985d235b86). So instead of going through the process of manually
> > deprecating old machine types again and again, let's rather add an entry
> > that can stay, which declares that machine types older than 6 years are
> > considered as deprecated automatically. Six years should be sufficient to
> > support the release cycles of most Linux distributions.
> 
> Thanks for taking that out of my plate :)
> 
> IIRC 6 years was because of some old RHEL version, otherwise could
> 5 years be enough? (maybe it could be good enough for this old RHEL
> version as of QEMU v10.0).

With my RHEL hat on, 6 years gives an approximate alignment with
RHEL lifecycles, which have ended up being roughly 3 years apart.
RHEL-N, wants to support all machine types from RHEL-(N-1), so
in the worst case that gives up to 6 years worth of QEMU versions.

5 years could well be enough in many cases, depending on how
frequently RHEL rebases QEMU, but could also trip us up if the
timelines do something unexpected. So 6 years is a bit safer
from Red Hat's POV, if the community is willing.

> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >   docs/about/deprecated.rst | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> > 
> > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > index 6d595de3b6..fe69e2d44c 100644
> > --- a/docs/about/deprecated.rst
> > +++ b/docs/about/deprecated.rst
> > @@ -220,6 +220,17 @@ is a chance the code will bitrot without anyone noticing.
> >   System emulator machines
> >   ------------------------
> > +Versioned machine types older than 6 years
> > +''''''''''''''''''''''''''''''''''''''''''
> > +
> > +Starting with the release of QEMU 10.0, versioned machine types older than
> 
> Why can't we start with QEMU 9.1?
> 
> > +6 years will automatically be considered as deprecated and might be due to
> > +removal without furthor notice. For example, this affects machine types like
> > +pc-i440fx-X.Y, pc-q35-X.Y, pseries-X.Y, s390-ccw-virtio-X.Y or virt-X.Y where
> > +X is the major number and Y is the minor number of the old QEMU version.
> > +If you are still using machine types from QEMU versions older than 6 years,
> > +please update your setting to use a newer versioned machine type instead.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
