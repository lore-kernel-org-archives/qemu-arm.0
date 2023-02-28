Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5531764ejc;
        Tue, 28 Feb 2023 01:00:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/FVYEFo8PxwrGR9YcQi4sEZtURU+WnqVCgwr3JPprYauBTns6cFzDP+O/sMT9O2optgXyw
X-Received: by 2002:a17:907:a64a:b0:88c:6345:d0e7 with SMTP id vu10-20020a170907a64a00b0088c6345d0e7mr1592622ejc.36.1677574836580;
        Tue, 28 Feb 2023 01:00:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677574836; cv=none;
        d=google.com; s=arc-20160816;
        b=DU73LDc9vEdudeDL3WJ+NWrpIe0uF18q6a3fcyrgsuiBKRcbKfI2K5j8fAxxXUAGHb
         9AuRUZofgZfeRFkfos1krpaZq0jiWTpCqf03Dsm+Czx01rKPiQYq9xliMKXnlul2fTNi
         IaSyo8kyoIaHoa0EPwP0kUrpdwavBzjlzS1uU+I3zPyOGAfgsLLfZvck26vRe8BuzOnn
         Wqb38ApVONRB0jCTESDHOsgHPgiu086zZCZGOs4Yj2HyLjTyI3p9xWX+AlU2oEHneE/z
         mMUI7nApg3TVmgv8mbpG5o9Ya5FpTIQea17DaD5Vs2wVSWBcZ/brYv7vTAgDw0nVGfLL
         oSxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=xRtxoAuLpdApFzU8iSpQxKbbqyyyhWT3y9LXsZFTdMo=;
        b=yPu5raCYDQPiggQ5r1+J/haH9mO96eUu5dCCO1HtJwk7UQgD1rimJrZBlQ8LVI/H1k
         N9UbDi3hc86PVbBd1qOQhV45zY4IjvdlS6gAO1H90wcyYnIo0hhyTfksSEjg19NrHnCz
         9fOzLTS75EyEIWxcnb5CGHyA8l75+S4wbolouB3pEZwAKltWCLkyrx/PfvQVZI+wImAK
         ZGquAmmjhbl3TA2C+Yxo/LHjrDEwhp5uRi7u4r7bonGtEpfj4a5bCCe2Oy0il2yspzQ+
         HexrTRkuKzUe43+CCUTYvtirGHssSeQii4hLFjpe4HIAxBkvbJhe3r38WbJ1z60W/Vg7
         hXTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U+DS6koP;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bi24-20020a170906a25800b008dcebb5a11fsi9299955ejb.845.2023.02.28.01.00.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 01:00:36 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U+DS6koP;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677574835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xRtxoAuLpdApFzU8iSpQxKbbqyyyhWT3y9LXsZFTdMo=;
	b=U+DS6koPBEwRqWRD7IriCWBo1WzOm0fLEpBRhhqUd/WKuc/s9ohfN/WwpCkF8pUd/0hYN5
	43JF58VRSpJdo0IanoD3glkscSzrACMAH5JTFJMTCI1BFlqCRlhVC7yJM8GhkpwavUmkBu
	pOQ7BmKituFyUdMVDzA/g06CWwe+8Ns=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-290-0-jR0FGQNraIY36d-dKjFA-1; Tue, 28 Feb 2023 04:00:33 -0500
X-MC-Unique: 0-jR0FGQNraIY36d-dKjFA-1
Received: by mail-ed1-f72.google.com with SMTP id c1-20020a0564021f8100b004acbe232c03so12669024edc.9
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 01:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677574832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRtxoAuLpdApFzU8iSpQxKbbqyyyhWT3y9LXsZFTdMo=;
        b=yB7vstq/6FYF24SecBrfDIXlsaaqNZzEnVey3XTBol16OceTxZiUPXYAPyTi/kaCnL
         DRDH9J07yrgcgmHuGXA9Bp2MQSNH/LYj+sMkUNrnWOO0+4Di4EVm688n4uh17fP1r90+
         6NDWkiZAHYurJB0k09xWRgBu2IKxnXZfcv62z/IY1HawlZmVqZRKb1lm1dg0nYszGnSJ
         /V5A/ONUzep/SplkvnoRZQ/cKCV8XN+gDgAadzztRvUpzqEPyVpe0/tDK8niQUbgu4KJ
         3M6+Y8Hi1kds9cXu813i4nwD9Zof2tllm7j995NmLqDL+WDzGhwq+tonN8yds1xXVGAR
         kOdw==
X-Gm-Message-State: AO0yUKVKiudKOG7PIQtym9h9/UkYHTxSAhkxxHF0GaRZ3/uiW3RFpcHM
	cgzzPmCymNeMo8jLgs6LVDxdu5Y0tgXIXN+Yt21NIBOCNKaD1eqbxBxeqf/eRt3PKoZx+HcM+Z1
	dutc10VdxeRI8iJob
X-Received: by 2002:a17:906:9e11:b0:88b:a30:25f0 with SMTP id fp17-20020a1709069e1100b0088b0a3025f0mr1283988ejc.32.1677574832260;
        Tue, 28 Feb 2023 01:00:32 -0800 (PST)
X-Received: by 2002:a17:906:9e11:b0:88b:a30:25f0 with SMTP id fp17-20020a1709069e1100b0088b0a3025f0mr1283970ejc.32.1677574831962;
        Tue, 28 Feb 2023 01:00:31 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.141.194])
        by smtp.gmail.com with ESMTPSA id gg16-20020a170906e29000b008d044ede804sm4189754ejb.163.2023.02.28.01.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 01:00:31 -0800 (PST)
Date: Tue, 28 Feb 2023 04:00:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com, xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228035958-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
MIME-Version: 1.0
In-Reply-To: <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: TOQITDVIoN1i

On Mon, Feb 27, 2023 at 10:21:14AM -1000, Richard Henderson wrote:
> > Removing support for building on 32 bit systems seems like a pity - it's
> > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > and the maintainance overhead is quite small.
> 
> It's not that small.

Meaning there are lots of ways to run 64 bit binaries on 32 bit systems?

-- 
MST
