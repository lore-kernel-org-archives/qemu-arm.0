Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp1126916njc;
        Thu, 13 Feb 2025 23:56:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUlC8bTaITe2vb6060dJXRIhV13pa4GIdBljh3YR53q0r4yV9ieD4va0PjD623paWcWcdeIiw6cjXUa2Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGdFhMjrEv7qpSU/W13+5G/k1d7QjQsALvshgMX4qSknkoIlzIITHRbekHlEAfg5feyn9Rx
X-Received: by 2002:a05:622a:1184:b0:46a:3579:d137 with SMTP id d75a77b69052e-471afef7e8amr167630781cf.43.1739519766984;
        Thu, 13 Feb 2025 23:56:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739519766; cv=none;
        d=google.com; s=arc-20240605;
        b=OQuJFbgNHq9pVfhWqJfWu413t8tzIeItLYU/WLuW5pT1GSkWbdixwLOR8lfDQ9HQnv
         UrM3QLTl/quL7PD1Ql21wf/Bk7cp5HZvVefAODDiOw8cagTEgCqG+st+9Z4btLTQOjco
         +MTUg2puRF1KOSl8di5LqrB6GrY/5pH2t0GMOpHicEPMDBdMOjQWBowai5fGXM5WZCng
         j+YO6JC60B+56moRT10dIW0kXeOymqdj4Kg7ZXIwwcZ88itpFdG8W7xCgSPl5SinV/Kr
         qXdZTqbLCFSlIXqStDwRziPeWnsatQHlFYj5q6S6RSPrs1DewQ81oOXkBODMLneoOgSf
         vUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=WP4zcH4jQzM3SVKmTUMDEjYhSqNuk/rwlec40Xkjgpw=;
        fh=rrua58aPyIBHnRLYa6DhwCQw1Suzf5rAWcQoGwyatcE=;
        b=jm9w3XXVYhGwN+7gaaDgRjloqepAiD2qTFo9R64HuNHhW6PVjvvT233m/ewzz4uu1t
         uGKmUDSxXsOyZJvmftjcUOcYH6QULLDvkNV1KDK4MzcqDDds+I//FdzjofdvxxiGf4as
         Ozk7M1Q2k4T6oYxUUQtoyMwqz2DzE2xYh+uxEuGFwGTDzEGKKdoWD6ax0p2SN1eOQbTI
         0/q94ic0ZhFdPHl8uIiawKyYihdBnDt34tgGSLur2en43sreREiAlrANqQJWM66hEai8
         xqwkTnj5lCGNLWnRpuBPZLSnmWRbVrn1kLh7JOeFECoepAEXXxdui9RkNa2QEOP5mp1M
         fHIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=INua3jXc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471c2b60448si27802641cf.527.2025.02.13.23.56.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 23:56:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=INua3jXc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiqY6-0001Id-5O; Fri, 14 Feb 2025 02:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tiqY1-0001I9-MH
 for qemu-arm@nongnu.org; Fri, 14 Feb 2025 02:55:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tiqXy-0000En-V5
 for qemu-arm@nongnu.org; Fri, 14 Feb 2025 02:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739519734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WP4zcH4jQzM3SVKmTUMDEjYhSqNuk/rwlec40Xkjgpw=;
 b=INua3jXc/97QRg3l+ZeSV9aP3OsBspFJveSbM41pgEOLqhqgxQRLh0T18ILcqZVNLNHRXT
 oFuclv0VClMOPOGjg1QjCM+VOmRUy1ULQ9eBaKfR22CPeHlxcalnBzb+Mj1Jv+a1fgPKJx
 lislySGX+s91FZTbp0L4EpWXb11G7z8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-425-SdZaC7jsMVKS78xCF1-cCQ-1; Fri,
 14 Feb 2025 02:55:31 -0500
X-MC-Unique: SdZaC7jsMVKS78xCF1-cCQ-1
X-Mimecast-MFC-AGG-ID: SdZaC7jsMVKS78xCF1-cCQ
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AFE4D180087C; Fri, 14 Feb 2025 07:55:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.69])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E54FB1800874; Fri, 14 Feb 2025 07:55:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A10CD1800097; Fri, 14 Feb 2025 08:55:26 +0100 (CET)
Date: Fri, 14 Feb 2025 08:55:26 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 09/23] hw/uefi: add var-service-core.c
Message-ID: <5whdvrcqkpted5wl53yo5qbq2g4bf4j57vrzvbsebho56xfz4w@mjpktoiarmto>
References: <iuwaykfdm7bwtvblyz7lkew3em2ksi5xeztdphqjdv7tsp2ejw@s6j64y3lfmrw>
 <ea1d355b-7e56-47ef-b1e7-158003b6d85f@amazon.com>
 <kk4f5e3olb26qfjveqefkuzrjc45djikkk7uspz4yj7iesdmbj@zointitbvhdp>
 <73fe41f7-dff0-4506-8769-1997323c0a76@amazon.com>
 <4bwjwcs2k4hbrj6mokc57a5dy57jjssfxnvd4qm5257dgnid3x@yqdx7e47o2mf>
 <2c06a98c-f286-4632-a352-8b47dc4cc43c@amazon.com>
 <2vgc4scgezmb3med6dypykcym7te7gzlx7wp3vm5ehtfmxj3xr@kswpu35wt5ns>
 <f59bb48f-051d-4681-a702-6aed3420c2f7@amazon.com>
 <jnxvyw6q4vkng7jztu7q5rabgeohhpoxojdn4wt6xckc6pzmqz@ateji77pl5j7>
 <342a1bd9-52e9-4a6d-8a2a-63d2b478d896@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <342a1bd9-52e9-4a6d-8a2a-63d2b478d896@amazon.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9P3qB2OpAC1z

  Hi,

> > How do your patches pick the transfer mode?  Is that dictated by the
> > host?  Or is the guest free to choose?  In case of the latter:  How does
> > the guest decide what to do?
> 
> In our version, the guest gets to pick. It defaults to the DMA interface
> unless it detects that it's running either the macOS logic (a case you can
> ignore for now) or is running with SEV-SNP.
> 
> I think for the upstream interface, it would be best to have the host
> indicate which one it recommends the guest to use. That way you can force
> the fallback path without requiring tedious edk2 changes.

I'm more thinking about a hard switch, i.e. the host would support only
the one or the other.  That way we'll go need less register space,
because we'll need either the buffer location register (dma mode) or the
pio transfer register (pio mode) but not both at the same time so they
can share the location.

> > 0xfef1000 seems to be free, which is kida fun b/c of the 'ef1' in the
> > address.
> 
> True, I love it! :)
> 
> It's not enough address space to fit the full 64k buffer though, right?
> Would all of 0xfef00000 be free by chance? Then you could just direct map
> the transfer buffer there.

All of 0xfef00000 is 1M, i.e. 16 x 64k.

take care,
  Gerd

