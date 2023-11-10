Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1128639ejq;
        Fri, 10 Nov 2023 03:44:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNVRSfTlN6R/4+79NKI2w/CLzrBp4Jprrt1Re6ZuddbQtM3L+UZVAP/vLKDKUFJXFZArv0
X-Received: by 2002:ac8:5c12:0:b0:415:1683:9cf1 with SMTP id i18-20020ac85c12000000b0041516839cf1mr8311684qti.21.1699616641029;
        Fri, 10 Nov 2023 03:44:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699616641; cv=none;
        d=google.com; s=arc-20160816;
        b=z+/EEf72lkVcyH5WQ/WOKwOtQTXz+/dWsjgsbjmGOvAGZM1agI+rtgDukSQ78EaGtH
         GTWauQvVx/fhlotKOSVRzHNWr1xTk2x4h+7kBf1Bl86QXAcXy8P7altZmxwJGzrV+BhU
         QVJX8WgPzaFga1uevQ2p21bOprSWC632P9npJ2GvRJ4ISSkDl7Wwc8LFuR78GrUPaFPG
         ZBPfMX/r9fnJYO10Zq98DTCLn/EaoKF7ZReUN+1yL2LIOntw0qwkt/AfeHndkQyDJOrm
         l8rKKV4kN6wF0e+IHX9jfcfPY/QxHHGrK0bP1+mZI5WflAgR/RhcHlDVzdimiXiDGDVO
         G6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=kRDjhwXQPNA+kVSRNZpHD99Z3R7j3cn2QnEVdGD2Zz4=;
        fh=72MCOq23xRK8edCk4wdljPcuG7iUDwEkfYhqBtdVZI4=;
        b=Yi+xJEaQQHn/fksijIpAPhLlJ2ke8Y6BNc99I9SlbfiCEoyLYVwWQ2t6h5sFjFhxLS
         gfMuJu74/BGLbVzue++8gQeBq3RmfuQHQdsBWThBx7Lab5/7otqkipzo952/qtIA0sqG
         pSDTk7zMgywIL+sIEIFWzkfYgJnj7BMouwJAbB4GiLLlMunM0VHPNfMYpiYqSB2c/p+8
         d2ARHqau3fNZHbvFHw+vxmghO/02z/IF4frc2DAG4bXrx9OMtkp1MI0cUXg4/DvFSHYc
         WZ0UGiLZdgkaM4nXb8LenTF6ur/YxTdnMyVU3V9ZMGsJrSmD4Tevq9s1WrarkK2jfcyh
         PYlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hI7UQdi6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12-20020ac87fcc000000b00421ba41b2b5si118601qtk.192.2023.11.10.03.44.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 03:44:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hI7UQdi6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1Pv3-0000bv-5M; Fri, 10 Nov 2023 06:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1r1Pv1-0000bg-Qc
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 06:43:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1r1Pv0-0001DX-6n
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 06:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699616600;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kRDjhwXQPNA+kVSRNZpHD99Z3R7j3cn2QnEVdGD2Zz4=;
 b=hI7UQdi6E9VLoJX/e3jd5yKtWlWNiwFnkoo5HLXpBQbN2m5g85yC9E4YZzR9wgPgweRtOI
 r+CoY+wJJ2RwgvGhEBeB+N/B3Y6QWicojeFeTREwD3Iy5HN14vbvyNt1Fbkt5m28AU0HoC
 kg2bUooAHLjJqPQqn6y9QECK4haC1oI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-272-exXiCJa1M82OprgTR86-OQ-1; Fri,
 10 Nov 2023 06:43:17 -0500
X-MC-Unique: exXiCJa1M82OprgTR86-OQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 326AE3C1CC24;
 Fri, 10 Nov 2023 11:43:17 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7935492BE7;
 Fri, 10 Nov 2023 11:43:15 +0000 (UTC)
Date: Fri, 10 Nov 2023 11:43:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 2/2] Add warn_unused_result attr to AUD_register_card
Message-ID: <ZU4XUqSxQUCKPOG0@redhat.com>
References: <cover.1699606819.git.manos.pitsidianakis@linaro.org>
 <4b040fc18cb0e563e92ce084ca18b89a050a8aaa.1699606819.git.manos.pitsidianakis@linaro.org>
 <CAFEAcA80sv6ewJ+LoROn-9ooEyLGQwiqYpL3=fqrK7gA0oZG-A@mail.gmail.com>
 <3wmne.fhuf28sb5yfg@linaro.org> <ZU4R+08zuo8xvlg8@redhat.com>
 <02562baf-3d92-f5b4-2592-a9d868586451@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02562baf-3d92-f5b4-2592-a9d868586451@eik.bme.hu>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: xNpsz28G/SCV

On Fri, Nov 10, 2023 at 12:35:56PM +0100, BALATON Zoltan wrote:
> On Fri, 10 Nov 2023, Daniel P. Berrangé wrote:
> > On Fri, Nov 10, 2023 at 12:44:56PM +0200, Manos Pitsidianakis wrote:
> > > On Fri, 10 Nov 2023 12:21, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > This kind of thing is why Coverity's unused-result warning has a
> > > > lot of false positives. We shouldn't introduce extra code like
> > > > this to work around the fact that the tooling doesn't understand
> > > > our error-handling convention (i.e. error_fatal, and the way
> > > > that some functions report errors both via the return value and
> > > > also via the Error** argument).
> > > 
> > > I respect that :). But I personally believe that clinging to C's
> > > inadequacies, instead of preventing bugs statically just because it adds
> > > some lines of code, is misguided. Proper code should strive to make bugs
> > > impossible in the first place. At least that is my perspective and I would
> > > like there to be constructive discussions about different approaches in the
> > > mailing list. Perhaps something good might come out of it!
> > 
> > Your approach to the problem:
> > 
> >  if (!AUD_register_card("OMAP EAC", &s->codec.card, &error_fatal)) {
> >    exit(1);
> >  }
> > 
> > is adding dead-code because the exit(1) will never be reachable. So while
> > it lets you squelch the unused result warning, it is verbose and misleading
> > to anyone who sees it.
> > 
> > Perhaps a more viable option is to pull in gnulib's ignore_value macro
> > 
> >  #define ignore_value(x) \
> >    (__extension__ ({ __typeof__ (x) __x = (x); (void) __x; }))
> > 
> > and then we would have just this:
> > 
> > ignore_value(AUD_register_card("OMAP EAC", &s->codec.card, &error_fatal));
> 
> I wonder if just casting to (void) without assigning to a value could avoid
> the warning? In that case you would not need a macro just
> 
> (void)AUD_register_card("OMAP EAC", &s->codec.card, &error_fatal);

Casting to void is not sufficient, which is why I suggested the
ignore_value macro, which does enough to fool the compiler into
thinking the return value is used.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

