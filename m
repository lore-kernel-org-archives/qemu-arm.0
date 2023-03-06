Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4683393ejc;
        Mon, 6 Mar 2023 06:06:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/YwGZ9NxhASM2NTpHzOkDIqmwoj33G4IhYu7fAtjO+98Gw607PL1G5LtgxN08HUc8xtRuj
X-Received: by 2002:a05:6214:627:b0:537:4b09:670f with SMTP id a7-20020a056214062700b005374b09670fmr17876103qvx.25.1678111597214;
        Mon, 06 Mar 2023 06:06:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678111597; cv=none;
        d=google.com; s=arc-20160816;
        b=YQkfzVWItK7mbBS+aRMW1QXUhO9VTZFvXWlQByg2fiNXnUEGUxQKNrFbd81khjMkyM
         QDT8QeDKLTiueI76TroKo7J/vpi6y5h/TArs8K3jHnKlt4jx+6HWRPiU5huokF86ryH9
         MyyLclNvTWfDRbpTq02CKc2OS4QcjiTRmFAckfGmAcYqcfRLtfRjOchgyeHkQeVl49rB
         oaS7HQedxAVj8983LNzRsadIC4Y55UwSylU4xjEAnZGgP4ocrVKPbIEWHmI/jf2IqiUO
         adDwIYHGdfDi7nKShQPSNS/4rlt9JBS0sQ8OU5/YjPvX31HVTvEEaxeUIWGEHWSMdNeo
         JEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=voMt6AB+9qNIUfz/3mjHZ4ciEx34KDCiHB56iJwYfX4=;
        b=MW3woTEgSV/K2Z/UDz9RVH9kQdG3s8jfHTs0IpEdAHug5zfuta6BpriIlJGfFbl6KZ
         LhHkBu1xOD1FkWFCsBdn4+aFwcwyKNQzqP7pky1OZEcY9OeORtfnY6iG8N2LjGwrseys
         CUIeTJrfHu8AYnxGFMHQ2qIFQa5ry28aC/YPatku+PHB6q5qkfJfLbYsYY1pvW/ChTjf
         dguzwKG4GpkNBMvajQXWqe0y6g12icms75qOGc4o9yK/vHNtm7frYDiVtVykePE8Le+R
         v3S9P/vO0z1kzMtbT7Rcu0R/x/GkzQrZYB7/iftqZXetQTp4qZbyLzzAkXHB9+DX1kFh
         fBNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZJLEAGre;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id q12-20020a05620a024c00b00728811980bbsi6848421qkn.532.2023.03.06.06.06.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 06:06:37 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZJLEAGre;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678111596;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=voMt6AB+9qNIUfz/3mjHZ4ciEx34KDCiHB56iJwYfX4=;
	b=ZJLEAGrecUxCYD9MEVc+hcAxuVCN+ILXZj8/vNCusrpnpKwcQJzJcTyENCEbq9iT6pRyqI
	+sr34wAKSC5RVHK82t7uk7hjbejbq/m4udSpy8sF73C9k1qldVwTvtEfTBskf4L+/yvgrP
	mTZReEIyTsClRNNxc+82P1DbfkhY8Qg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-l5ZckLzFOV6jvPPgyotFqw-1; Mon, 06 Mar 2023 09:06:33 -0500
X-MC-Unique: l5ZckLzFOV6jvPPgyotFqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F118830D44;
	Mon,  6 Mar 2023 14:06:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C159C1602A;
	Mon,  6 Mar 2023 14:06:10 +0000 (UTC)
Date: Mon, 6 Mar 2023 14:06:08 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
Message-ID: <ZAXzUIs6wODe7/hf@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com>
 <ZAWx5eBskd1cItDx@redhat.com>
 <a97c8b6d-8e58-82b5-d73f-72a7061fb5d4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a97c8b6d-8e58-82b5-d73f-72a7061fb5d4@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-TUID: Zt/wEJNA1X6h

On Mon, Mar 06, 2023 at 02:48:16PM +0100, Thomas Huth wrote:
> On 06/03/2023 10.27, Daniel P. Berrangé wrote:
> > On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
> > > [...] If a 32-bit CPU guest
> > > +environment should be enforced, you can switch off the "long mode" CPU
> > > +flag, e.g. with ``-cpu max,lm=off``.
> > 
> > I had the idea to check this today and this is not quite sufficient,
> [...]
> > A further difference is that qemy-system-i686 does not appear to enable
> > the 'syscall' flag, but I've not figured out where that difference is
> > coming from in the code.
> 
> I think I just spotted this by accident in target/i386/cpu.c
> around line 637:
> 
> #ifdef TARGET_X86_64
> #define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
> #else
> #define TCG_EXT2_X86_64_FEATURES 0
> #endif

Hmm, so right now the difference between qemu-system-i386 and
qemu-system-x86_64 is based on compile time conditionals. So we
have the burden of building everything twice and also a burden
of testing everything twice.

If we eliminate qemu-system-i386 we get rid of our own burden,
but users/mgmt apps need to adapt to force qemu-system-x86_64
to present a 32-bit system.

What about if we had qemu-system-i386 be a hardlink to
qemu-system-x86_64, and then changed behaviour based off the
executed binary name ?

ie if running qemu-system-i386, we could present a 32-bit CPU by
default. We eliminate all of our double compilation burden still.
We still have extra testing burden, but it is in a fairly narrow
area, so does not imply x2 the testing burden just $small-percentage
extra testing ?  That would means apps/users would not need to change
at all, but we still get most of the win we're after on the
QEMU side 

Essentially #ifdef TARGET_X86_64  would be change  'if (is_64bit) {...}'
in a handful of places, with 'bool is_64bit' initialized in main() from
argv[0] ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
