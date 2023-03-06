Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4705981ejc;
        Mon, 6 Mar 2023 06:25:54 -0800 (PST)
X-Google-Smtp-Source: AK7set/dLnt++J5oZnZGeGjNvxPRVEq/me6F3XoX5klvp2NWJ0tfDdMQTRiuKRUOe+X7FI9zXDK6
X-Received: by 2002:ad4:5de8:0:b0:56c:38e:9764 with SMTP id jn8-20020ad45de8000000b0056c038e9764mr18949047qvb.18.1678112754598;
        Mon, 06 Mar 2023 06:25:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678112754; cv=none;
        d=google.com; s=arc-20160816;
        b=RXY0fr4jY26U1FpXQY0ZvL5qEwhOddAGbMPFeWi37QzZ+K9ciiS0MeU56xhF4xqc+v
         nC4+MLxay4/7EOQIBfVnZ5GYINull7d5Urfc/2F2YXH2uEFiMWEAsK8dbvML/OLnQ4YJ
         IQISeHHjSlDBUJi9fQrboIb1qIyGUeURXD55llWx/qBt3Oul3iSerhcMAixxIHF7W1hI
         N10nztDrfxywm0aYeltki7uGveu+XZ90UtqlDHO+pu5XZ8GfkwuQjR7rqPzLaoQy7X4+
         a9DUWCwfUKhEyNuSWr6hVjUvstl+UClpxJ4dcOICyG7DHiICu00gJqDvmW21xD3zJgNe
         N1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=jUmBo2n1j7rGIkJNVwLu/Dgr9Lj3pQ6jxLfoS+Lw8+0=;
        b=oJrMGfB5oXhmoP6Q+RtWjOKppaw5T+Gor92u0YACb83D1+Vu+XGbX9S33ZRaW+yrFl
         uevLrdnhV/O8Mtr41NRQ9aYAmDRTCKZxZ4sqG2ucQfB2fsnYssbQVM0TYYgTns5Sa2e/
         d/WHSzeMb9+gpghocpiZFZpX2zz80ac5sxto4EKAGQ8fvgL2CwujOnjzNg63rDuOj/p8
         D43pLbBlzzdh9pThvWXC80eZEXEPHqf4SEyXR1fgwWuN6mWPFecXvRTqm2h/XmEahzXx
         q1z1YynjxEIfZeT4juWXDWlk73+xk0cO4IFaq7yKgY+04nJvR+tuMCuf57/fAtpWsea0
         wCkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=it8nzNIx;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o197-20020a3741ce000000b0073b83c609f2si6968094qka.659.2023.03.06.06.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 06:25:54 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=it8nzNIx;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678112754;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jUmBo2n1j7rGIkJNVwLu/Dgr9Lj3pQ6jxLfoS+Lw8+0=;
	b=it8nzNIx9jpVh6qjHtlzkEm2hBnUbBoonwmqG74tfD8QqOCQzYqj28St7gO0F5AsmFbyKe
	iskErvIGynbmpe+/bXevDUJl4s5gokLFHUHd2TQu6UpI0but14pgoPq+hFWsd6SZgBU+fd
	Qugt8BHjHP0YBQJcgJYOPU8E3K5DRmQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-E3cSk3IdM4S-H1nnc8DTYQ-1; Mon, 06 Mar 2023 09:25:52 -0500
X-MC-Unique: E3cSk3IdM4S-H1nnc8DTYQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66FFA80D0F9;
	Mon,  6 Mar 2023 14:25:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9512C16029;
	Mon,  6 Mar 2023 14:25:48 +0000 (UTC)
Date: Mon, 6 Mar 2023 14:25:46 +0000
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
Message-ID: <ZAX36kyxT2aEg4DF@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com>
 <ZAWx5eBskd1cItDx@redhat.com>
 <a97c8b6d-8e58-82b5-d73f-72a7061fb5d4@redhat.com>
 <ZAXzUIs6wODe7/hf@redhat.com>
 <7f1501ba-f875-b227-8d7e-f43e69b2ab8d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f1501ba-f875-b227-8d7e-f43e69b2ab8d@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-TUID: zSAIr/w30voR

On Mon, Mar 06, 2023 at 03:18:23PM +0100, Thomas Huth wrote:
> On 06/03/2023 15.06, Daniel P. Berrangé wrote:
> > On Mon, Mar 06, 2023 at 02:48:16PM +0100, Thomas Huth wrote:
> > > On 06/03/2023 10.27, Daniel P. Berrangé wrote:
> > > > On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
> > > > > [...] If a 32-bit CPU guest
> > > > > +environment should be enforced, you can switch off the "long mode" CPU
> > > > > +flag, e.g. with ``-cpu max,lm=off``.
> > > > 
> > > > I had the idea to check this today and this is not quite sufficient,
> > > [...]
> > > > A further difference is that qemy-system-i686 does not appear to enable
> > > > the 'syscall' flag, but I've not figured out where that difference is
> > > > coming from in the code.
> > > 
> > > I think I just spotted this by accident in target/i386/cpu.c
> > > around line 637:
> > > 
> > > #ifdef TARGET_X86_64
> > > #define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
> > > #else
> > > #define TCG_EXT2_X86_64_FEATURES 0
> > > #endif
> > 
> > Hmm, so right now the difference between qemu-system-i386 and
> > qemu-system-x86_64 is based on compile time conditionals. So we
> > have the burden of building everything twice and also a burden
> > of testing everything twice.
> > 
> > If we eliminate qemu-system-i386 we get rid of our own burden,
> > but users/mgmt apps need to adapt to force qemu-system-x86_64
> > to present a 32-bit system.
> > 
> > What about if we had qemu-system-i386 be a hardlink to
> > qemu-system-x86_64, and then changed behaviour based off the
> > executed binary name ?
> 
> We could also simply provide a shell script that runs:
> 
>  qemu-system-x86_64 -cpu qemu32 $*
> 
> ... that'd sounds like the simplest solution to me.

That woudn't do the right thing if the user ran 'qemu-system-i386 -cpu max'
because their '-cpu max' would override the -cpu arg in the shell script
that forced 32-bit mode.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
