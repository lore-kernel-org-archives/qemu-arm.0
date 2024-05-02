Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1046149ejy;
        Thu, 2 May 2024 02:54:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVy3c9Vi0xCHvbUHMgFpey2qPcnphw4o2cQqNffLaYASUhbKc3W0OKqGnB4Gfx3ZQ+5n9IYIagbFQ77eBVOvM/4wk3yTWnG
X-Google-Smtp-Source: AGHT+IEiajJxzuAOUEBvQ6P754Kc03wHU23VkO/nRCw7U0EbujvWazdnoyOyJ57043RB1qxbjXUw
X-Received: by 2002:a05:622a:5e8b:b0:43a:7b64:2fcc with SMTP id er11-20020a05622a5e8b00b0043a7b642fccmr3869872qtb.7.1714643663787;
        Thu, 02 May 2024 02:54:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714643663; cv=none;
        d=google.com; s=arc-20160816;
        b=JZWXbLGt4j63PXPWGHy6K5Rh9whwoVrAP/Dfdun0KYRzz18s7EtR+Q+9SI5VDcNEA3
         Z/fTw4oQdia6dvfyxO1s5zi+nVaGp/Ee9lNAgxhaCpnBYxCrE5CshzmF7dSc8ENmtGGO
         xcikPwjXHo3gzMmOlt6rOju8NTu5BIrGGKceIN1h6m+E3Ny3bbMs11PIyBCi8/w241w7
         xU4CszOw9YSXptRxkMcVqcbLj45afePbokbHrCDNQ+zTK6UrMyIvavbasICxnenL/xpg
         gm1WT/ZKJ3N8IYG7VIAhOkYgXSETwSrAX8ktyzd1GFDQCOBkXfs54zKBYbQq47q0IMJl
         p0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=J/phAWia/j57n0ZJaqcC2oC5SPOPN+MCBg6IHAtFjlA=;
        fh=Ms16QcKpU70eAate/Hw38VHfo2hdtf7uGlCRNNJz0FA=;
        b=XvgS0AZr9WwnFW4K3CGj0MlGLn9HW0iTsOtxniDb8vkKy4Du+3Qd8IXx6EPhBucVlz
         vq2jOCQBfWMt/CjvGy+Ga6FJKzM0uExQHhZ2i9R4eNJN8I6YhXQgE2QkCjWgg84sDbuL
         GWYSnLb49Vcli3yKnGOjL7p1uIRIgSXdO6Gppmej6cFHQKqRHNMcBb0hKK2r7DCBJJCy
         2WQKmvNh/YbfPHX8ZVUKF4Rgz/7ofKMpM2kVynUvfViOsVwZ9vcolqplBXIYBek3IkkX
         ucDC++S5OikNB0ZBGNZ4goC+kcbE3YyI1fY/++hd38lpCNKkYeWQVOyqf+eh411LcjPD
         PLKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KFSUYtho;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22-20020a05620a167600b007905cfb4bd5si539694qko.361.2024.05.02.02.54.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 02:54:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KFSUYtho;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2T8V-00077R-Gr; Thu, 02 May 2024 05:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2T8L-000714-Iq
 for qemu-arm@nongnu.org; Thu, 02 May 2024 05:53:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2T8H-0000On-Mt
 for qemu-arm@nongnu.org; Thu, 02 May 2024 05:53:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714643620;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J/phAWia/j57n0ZJaqcC2oC5SPOPN+MCBg6IHAtFjlA=;
 b=KFSUYtho1gRcJTmfjms9apUkAZ7R9c4TE6eKdrX6ypGk58Ler05+pRSguEOJElcA1sf5P5
 DIbn59dRy4JEKKy2JTrmycY8upHV7fWKHZ9yrQpLzoUN7OdL2Qlc/2eTuB2FWOU1WqbGB5
 ungvckM4/i4qtC6yrpmuJWAiuBrDlaI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-8tLhLuu3PCy6pD1P10Dw6A-1; Thu, 02 May 2024 05:53:37 -0400
X-MC-Unique: 8tLhLuu3PCy6pD1P10Dw6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38058803505;
 Thu,  2 May 2024 09:53:36 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A7D41C060D0;
 Thu,  2 May 2024 09:53:32 +0000 (UTC)
Date: Thu, 2 May 2024 10:53:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clegoate@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org
Subject: Re: [PATCH 14/14] docs: document special exception for machine type
 deprecation & removal
Message-ID: <ZjNimqXiOr5nTJWg@redhat.com>
References: <20240501182759.2934195-1-berrange@redhat.com>
 <20240501182759.2934195-15-berrange@redhat.com>
 <8f301d1a-06ec-4c78-9924-a4379f56d0fc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f301d1a-06ec-4c78-9924-a4379f56d0fc@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.897,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: V7zS0FhfoN/G

On Thu, May 02, 2024 at 11:47:40AM +0200, Thomas Huth wrote:
> On 01/05/2024 20.27, Daniel P. Berrangé wrote:
> > This extends the deprecation policy to indicate that versioned machine
> > types will be marked deprecated after 3 years, and then subject to
> > removal after a further 3 years has passed.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   docs/about/deprecated.rst | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > index 7b8aafa15b..55120e774c 100644
> > --- a/docs/about/deprecated.rst
> > +++ b/docs/about/deprecated.rst
> > @@ -11,6 +11,18 @@ releases, the feature is liable to be removed. Deprecated features may also
> >   generate warnings on the console when QEMU starts up, or if activated via a
> >   monitor command, however, this is not a mandatory requirement.
> > +As a special exception to this general timeframe, rather than have an
> > +indefinite lifetime, versioned machine types are only intended to be
> > +supported for a period of 6 years, equivalent to 18 QEMU releases. All
> > +versioned machine types will be automatically marked deprecated after an
> > +initial 3 years (9 QEMU releases) has passed, and will then be deleted after
> 
> Should there be the word "period" after "3 years" ? Otherwise it sounds a
> little bit weird to me - but I'm also not a native speaker, so I might be
> wrong.

It would be valid to say either  "3 year period" or "3 years", but
not "3 years period".
 
> > +a further 3 year period has passed. It is recommended that a deprecated
> > +machine type is only used for incoming migrations and restore of saved state,
> > +for pre-existing VM deployments.
> 
> Should we maybe add a sentence that they should ideally be updated to a
> newer machine type during a service window with downtime? (well, it might be
> also obvious, so maybe not worth to mention it)

Sure, I'm fine adding something about that, as it helps to steer people
in the sane direction.

> >  Newly deployed VMs should exclusively use a
> > +non-deprecated machine type, with use of the most recent version highly
> > +recommended. Non-versioned machine types follow the general feature
> > +deprecation policy.
> 
> Anyway:
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

