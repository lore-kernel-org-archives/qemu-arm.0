Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4742172ejc;
        Mon, 6 Mar 2023 06:58:46 -0800 (PST)
X-Google-Smtp-Source: AK7set9D15/m/hdG0JNqwH/hGLqTjq3CisD6rluw8oPidv7JyND0GYazxRnPxetAxRhLH2L9UUSU
X-Received: by 2002:ad4:5c4a:0:b0:56c:376:3191 with SMTP id a10-20020ad45c4a000000b0056c03763191mr20072006qva.44.1678114726667;
        Mon, 06 Mar 2023 06:58:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678114726; cv=none;
        d=google.com; s=arc-20160816;
        b=XnXbyOOGie4nOOJDJtiqJjwKm0meGCWWWT1mGVu0Bxa39PSfj5uzA9K0vA7bgNY12Q
         QwXEPeAszU3n+pz6dQtXsZzLX+8VM0rbnV2WA32rm8JCQOPt2MwJ0sJ8RIYIvGKsSWAw
         DGUVFRAzXi5gQkoqFacTKOGYsYYmU7QONWk12jjpfrFdUQV98Te7/CB523TVvHTpVMI2
         9Y4Y6sbyO865DO52vSLCNhojswB46vpHqSF6rRqul4Ns2RaRb8aEGu7nb+zW+KIg2vgC
         1X0Kyb3mjRP78N+T1oYRwavXmg8a1E0XsBNtbBpqHmU+TiR/LvtDy6XbMXDwp8NAoUy7
         3TCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:to:from:date:dkim-signature;
        bh=a93oAn60717NX8pmLmU53M4NQQZCFhxdTP7eNfQ6xsA=;
        b=mdyEBv5coY5SdPucEkUle1WRUR8nXFC/iyuhhhkI4sTxaiN05krK+3XMFg5nNkFHLS
         cvIvKVZxMRfIqK8DsREy+fMl72P74u80Oo6Em9ajTactRiwbGh3uiRmkbnw2AFMxI/wq
         86e1n57jcwsG3LKk+5/4egSxXN4FCbxD5l1whdJPzpXcbuitRA/qA2jjKkEiBTEfjjmk
         0hI0oXzuU4AhaUrnF1eSe0f5sbvN/EoE9NflpH6Y4OGIP2oRvk2Nk3mxSOTIqC+GSL3z
         vfeYZwAOKShjXPS1Mvqf3aTJCBoQY6Xo7zVQG4YHmRVAt3hmg6TRYy+Hx0Cmf5a1mluq
         8EJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iJUw5ZN2;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id q3-20020a37f703000000b007223bb531aasi6703981qkj.726.2023.03.06.06.58.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 06:58:46 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iJUw5ZN2;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678114726;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a93oAn60717NX8pmLmU53M4NQQZCFhxdTP7eNfQ6xsA=;
	b=iJUw5ZN2k8lVWhXuxbjbLUj/WOeAuP2i7swJsWBlM/Iprg3zFnFiAF/ta/qsAQhzWH/+Ju
	OT5fckulQsP66Kibz4vD2aHemdarrnlBe+jXTKTHHM6v7kQwGJT7Yo4j75POt80dmpL8+4
	VTS4ECJiFuOwkWdx7IByBZWxV8SpSeY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-MPXax0aiPU--pOq_go1idA-1; Mon, 06 Mar 2023 09:58:45 -0500
X-MC-Unique: MPXax0aiPU--pOq_go1idA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82EC7811E6E;
	Mon,  6 Mar 2023 14:58:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E2962026D4B;
	Mon,  6 Mar 2023 14:58:38 +0000 (UTC)
Date: Mon, 6 Mar 2023 14:58:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, qemu-arm@nongnu.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
Message-ID: <ZAX/lqu0Duuxfy/E@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com>
 <ZAWx5eBskd1cItDx@redhat.com>
 <a97c8b6d-8e58-82b5-d73f-72a7061fb5d4@redhat.com>
 <ZAXzUIs6wODe7/hf@redhat.com>
 <7f1501ba-f875-b227-8d7e-f43e69b2ab8d@redhat.com>
 <ZAX36kyxT2aEg4DF@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZAX36kyxT2aEg4DF@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-TUID: yOM9dZWavbdJ

On Mon, Mar 06, 2023 at 02:25:46PM +0000, Daniel P. Berrangé wrote:
> On Mon, Mar 06, 2023 at 03:18:23PM +0100, Thomas Huth wrote:
> > On 06/03/2023 15.06, Daniel P. Berrangé wrote:
> > > On Mon, Mar 06, 2023 at 02:48:16PM +0100, Thomas Huth wrote:
> > > > On 06/03/2023 10.27, Daniel P. Berrangé wrote:
> > > > > On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
> > > > > > [...] If a 32-bit CPU guest
> > > > > > +environment should be enforced, you can switch off the "long mode" CPU
> > > > > > +flag, e.g. with ``-cpu max,lm=off``.
> > > > > 
> > > > > I had the idea to check this today and this is not quite sufficient,
> > > > [...]
> > > > > A further difference is that qemy-system-i686 does not appear to enable
> > > > > the 'syscall' flag, but I've not figured out where that difference is
> > > > > coming from in the code.
> > > > 
> > > > I think I just spotted this by accident in target/i386/cpu.c
> > > > around line 637:
> > > > 
> > > > #ifdef TARGET_X86_64
> > > > #define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
> > > > #else
> > > > #define TCG_EXT2_X86_64_FEATURES 0
> > > > #endif
> > > 
> > > Hmm, so right now the difference between qemu-system-i386 and
> > > qemu-system-x86_64 is based on compile time conditionals. So we
> > > have the burden of building everything twice and also a burden
> > > of testing everything twice.
> > > 
> > > If we eliminate qemu-system-i386 we get rid of our own burden,
> > > but users/mgmt apps need to adapt to force qemu-system-x86_64
> > > to present a 32-bit system.
> > > 
> > > What about if we had qemu-system-i386 be a hardlink to
> > > qemu-system-x86_64, and then changed behaviour based off the
> > > executed binary name ?
> > 
> > We could also simply provide a shell script that runs:
> > 
> >  qemu-system-x86_64 -cpu qemu32 $*
> > 
> > ... that'd sounds like the simplest solution to me.
> 
> That woudn't do the right thing if the user ran 'qemu-system-i386 -cpu max'
> because their '-cpu max' would override the -cpu arg in the shell script
> that forced 32-bit mode.

It would also fail to work with SELinux, because policy restrictions
doesn't allow for an intermediate wrapper script to exec binaries.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
