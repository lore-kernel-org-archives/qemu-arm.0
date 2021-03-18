Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp321601lfg;
        Thu, 18 Mar 2021 05:37:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywmWmwoi+DJxSD+KkB7U7T4+1yllWgNo1ANrdXNirb+4NZd3xeUSS9AE0jmq2Jp0vaUw2f
X-Received: by 2002:a17:906:6bd1:: with SMTP id t17mr41277665ejs.319.1616071059899;
        Thu, 18 Mar 2021 05:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616071059; cv=none;
        d=google.com; s=arc-20160816;
        b=ZiSK1izENBaYS76YOjcVzCmboNfMzkONajZba8inBRLt2F6/1ZrOXU+TvXlwtsyol1
         FfWbsnkrxFHw1MwGey6BsblAhLCK6qcxbl+i55Mzzr3/rS5lqdyBeQD+RKHhYeeRP0u6
         J6IcvO9f8DnZtXZ9Q0aurF7NJbCWEYKz+9j46w8kLayBM+BTwGd5WDce8WasKXfngwfz
         IMjxdtXr3YaavIo/F5cgBBOJ7o/coepB36TJAlQvgWpH2bIHKUVVgLn7zeX9p+z7gan4
         xXLJbmqJQ0Hdx6qu7go63lBmh+7CUylQ0Dvken4bg15FiwHNowmiBNL5Uy5xJnkVKDz+
         mQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=pjfMQgJYVSrUGaiP9ILPqxapqg38vXx6HQEV4aMB9e4=;
        b=lEppK7YlwafTUGszNdaQdscXBT9KifUqphz7spbCj1Wveid8V0JT+sMd3a61jogaxt
         /3g4dvQ0teapTMp/IUcTqYk4JxDjU/LR/1sTz0o3UABZApUasQhY0UcpXGCa66NMVN2b
         nXNAMfcq7syTldehSJ+IthAa1gD3giq965iig/fQsudHDz2VNF0u2JIbVYN+vyuVZ4Ff
         p9blyKcX+wHplHo2f/uWx3xf9KC2A2yGaVBYRiZOa+j7lhpRNlGrLSRdejeBpnwkokjI
         tLsu+zigKkpheN7jAnklwTeiFDqPaT93JIzU6PLraNoxo495jHIkF/F4sP9wSTJcwqiE
         900w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Blm5nVu6;
       spf=pass (google.com: domain of drjones@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id c7si1607067ejp.450.2021.03.18.05.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Mar 2021 05:37:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Blm5nVu6;
       spf=pass (google.com: domain of drjones@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616071058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pjfMQgJYVSrUGaiP9ILPqxapqg38vXx6HQEV4aMB9e4=;
	b=Blm5nVu6JeZGIdvQ/1UtbJnNGlwctvQu/KskPxs8HGBtyIhqkIPWQou48sFIpN8iKsmiJr
	PnnY7jmSv96NTajfaqmu22VWqRwW6DBB5XaEikGbZlYVO5EulrrQwHGqP3NMlHMdIcfyho
	W+ZpuNBNysysuQfJZwfE97ASrHDgjgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-ifLk9UpQP26_0pgrESNJEA-1; Thu, 18 Mar 2021 08:37:35 -0400
X-MC-Unique: ifLk9UpQP26_0pgrESNJEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7A3384B9A7;
	Thu, 18 Mar 2021 12:37:33 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.196.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1F0E5C1D1;
	Thu, 18 Mar 2021 12:37:30 +0000 (UTC)
Date: Thu, 18 Mar 2021 13:37:27 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Claudio Fontana <cfontana@suse.de>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
Message-ID: <20210318123727.vfjaecuklzicmprn@kamzik.brq.redhat.com>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de>
 <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
 <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de>
 <ec296129-2c4d-fd74-d044-50c470e29609@redhat.com>
 <cd4caf9d-c32c-25fd-a27f-d352ece74ed3@redhat.com>
 <CAFEAcA8YybFf1=wQ7-scC2JnQEHr9nx0LBvt16dTBOXV0KuMAg@mail.gmail.com>
 <28540fd5-3bd3-30d7-624d-da21d0f39806@redhat.com>
 <CAFEAcA8t3Roq2qL1RTru1H+WZAQMVmWcN=VjCtJkvAzmyws_YQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8t3Roq2qL1RTru1H+WZAQMVmWcN=VjCtJkvAzmyws_YQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: IwYF7RFt/MZq

On Thu, Mar 18, 2021 at 11:38:51AM +0000, Peter Maydell wrote:
> On Thu, 18 Mar 2021 at 11:31, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> > I tend to agree. The problem is for the running VMs started before
> > 82bf7ae84ce (so up to any fork based on v5.2). I don't know what
> > the forks are supposed to do with the running VMs if they want to
> > migrate them to newer QEMU (or upgrade the host QEMU).
> 
> Anybody with a Cortex-A15 KVM VM is just going to have to stay
> with their pre-existing ancient hardware, their pre-existing
> host kernel and their pre-existing QEMU binary. That's what
> "we deprecated and then dropped support for this" means:
> we no longer support running that kind of VM, so users who
> were doing it need to either do something else instead, or
> else just keep on going with the old versions they have.
>

I strongly agree.

And, downstream-wise, I can't speak for anything but RHEL, but RHEL
cannot have this problem. There are no 32-bit ARM builds for RHEL.

Thanks,
drew
