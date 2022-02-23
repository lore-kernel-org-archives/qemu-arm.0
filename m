Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp72026lfq;
        Wed, 23 Feb 2022 03:50:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6G6tuWWN5f7x8HJcCC5uehIqdIv5lnDmrk8s8mXNIrl+BDic5yUbA3Rw1YgqZs8wMXFQS
X-Received: by 2002:a17:906:940d:b0:6d0:ee09:6b66 with SMTP id q13-20020a170906940d00b006d0ee096b66mr15476757ejx.19.1645617058249;
        Wed, 23 Feb 2022 03:50:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645617058; cv=none;
        d=google.com; s=arc-20160816;
        b=phjX7XHziUkFmBxbecSAXamd3x5baNrOKJheWKJLdN6SiAjEoQfJrkj1bswVIk2F3y
         qDxPbyvNjoPvvAwcrQHx03kAWWY2nff1iSrFEfgKQycUJwFEZ/OBzK4mG3doUu/RvmT5
         +5PWAvQlwsHdSJ1nPzJNGt7CDsdd+BOL9d8dZcuwd4m+qsjpVezD3Dx+L1J2ZHVo/mY9
         9Ktq0xxipBIbw2xfgjSc2XyMsiUIXuMQ0jR3WGWsaq/plXpI02tfqgjNmG96kB6t4NTT
         g9ahtmh9o6EvwTVXrIWYVZHqZDkodkIBrcDh3UdRPJpOEbLdV4FyFXzzH2lx5fgW2DE1
         WK1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=DmzzM/vCeQ0ZUM6X/5YN8emb+k4deFyY9B4wLefJIPY=;
        b=A0ex3OwNOErlN+fSdNfz1Ji3PE84Me91adTIFPYWF8w45KdBfiHKYr5mYEIIQVP5ig
         i82x8Mqx5QF4P1T97P1emC6B9bwl8Wj4HBNro1cwt4EzNuNF4mvHMJZQAyOKfh+od9WN
         pRlQcwufB2ReNz+7XYWxkSBRiz4T4bqBjMBpSUn8Dt6cKvigZxdNWqFAUqkgYrtmOuRt
         SVLbpiuFG1cldd882drJC6wwMtQ8rJKGqonBmBF1EG6UdIw5or4cGfGAUtvXJrUtrZmi
         QkMTLyFmnQxp9YP75MJt/Lekzf//eBk3LjoRWamUnfzWJAqoK+Hi4cV50yGNfCZ/rdy7
         ADkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WSIUkzvf;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 8si12177073eje.184.2022.02.23.03.50.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Feb 2022 03:50:58 -0800 (PST)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WSIUkzvf;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645617057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DmzzM/vCeQ0ZUM6X/5YN8emb+k4deFyY9B4wLefJIPY=;
	b=WSIUkzvfQb9P8qj3WhEN9h2LTiT1sagI+wdnJSg3XHzhaTcsaiQCgCNwffDv1W0xb0nNa0
	a6uKim3pUNlosaq7m6HaSmo/hYj5USZq5IesGtlkF2BrYQJp/mnW/DBVwgsuSU61MEhGu1
	6QCx+AGObPV3Y6ybWg5SH4AVDhlhPzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-LTAHW7oJP9a190NvBGt9xw-1; Wed, 23 Feb 2022 06:50:56 -0500
X-MC-Unique: LTAHW7oJP9a190NvBGt9xw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72B728145EE;
	Wed, 23 Feb 2022 11:50:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B9246767B;
	Wed, 23 Feb 2022 11:50:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 7934818003BA; Wed, 23 Feb 2022 12:50:42 +0100 (CET)
Date: Wed, 23 Feb 2022 12:50:42 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Laszlo Ersek <lersek@redhat.com>, Cleber Rosa <cleber@redhat.com>,
	Oleg Vasilev <me@svin.in>,
	Richard Henderson <richard.henderson@linaro.org>,
	Emilio Cota <cota@braap.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Idan Horowitz <idan.horowitz@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <drjones@redhat.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Message-ID: <20220223115042.lvxgrjirr5avzkzw@sirius.home.kraxel.org>
References: <874k4xbqvp.fsf@linaro.org>
 <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8mNt_-nZoV7RL4_UQUV=nPQsDM8KBTA8qAGmiNtXWx9g@mail.gmail.com>
 <afd92ed6-4392-3181-5875-5e42ad5f41b9@gmail.com>
MIME-Version: 1.0
In-Reply-To: <afd92ed6-4392-3181-5875-5e42ad5f41b9@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: 0XWpvpqd27lw

  Hi,

> > Also, "make install" installs these EDK2 images, which doesn't
> > seem like the right thing for "this is only for one test case".
> 
> Well I'd prefer we never had them installed. Today I don't remember
> why it ended that way.

Probably to behave simliar to other firmware, which makes sense to me.

So maybe do non-debug builds for install and debug builds for the test
cases?  Why do the test cases need debug builds btw?

take care,
  Gerd
