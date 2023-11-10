Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1118324ejq;
        Fri, 10 Nov 2023 03:23:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5y1PFVMsn1n5LNIYEaC8eejgVD1GskH//WIa0gvq3CNbQxlA1uTh/v1dvzOzZI+zdJzMR
X-Received: by 2002:ad4:510e:0:b0:677:a0a5:c226 with SMTP id g14-20020ad4510e000000b00677a0a5c226mr1373229qvp.19.1699615407598;
        Fri, 10 Nov 2023 03:23:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699615407; cv=none;
        d=google.com; s=arc-20160816;
        b=B6jNWBiflnq/mbttdN/yJqbS/HZFCGD4BOQwUBi2lQQ9oTUH0TUqLrgfz+vW4+EgRB
         ruVijQXq9TaAWvkywzJUup8draKR0aDxWb/TnzmAmR0vz4OZTiuTF8mO4I5sphKnlyar
         edelSHqW8SblaZq+YO120+39RtU+Io1NBmE3jZZSpOiscrdYzLEc7Yq27u/LbgNrswIg
         bW7ycd/9kGeN70ueoRneMD8Dtp7mIPianRoRn+/6aEYtTVFCcWXBQOPA70L70j/W51np
         zIe9n49kOz8P610caiV3xlI+4L8Kwwttpy2xWL/AraNTzRC1UYtyKBIlTcDHo/dt0Vl5
         1vbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=NRO+hd2Nknho3S+fm83jWhO2LsuVoVb02z+etBZJKTQ=;
        fh=WU+1aYanTg4CEzIf3oDe+xIa03XQ0zsJ80WTeT7SWrc=;
        b=nD9bnJzMUzXcCea9SfA7oZ52K5XCH4ylq9EHEyIXH1nemFkUzAtR/XcJx8Y6pWTdGW
         vJ80QCQ6yGF023MYpObpmN9IhB5wNtgx46JB3uhdyy9Y3Tc7xOaRAPYE/0AXfSVnJTp3
         l8rV1Kaot0M3dRpWzyRtsPAKI+zezhR/1lYOsuFeqpIUq75nwwFN4Qbt2W893s9YJUWv
         430ugtF0vpdvqt8PbgBVkSYWJ/omSouYA2ee4/VH43dAibBd1BDO6UDmftD4l/MIN60k
         BO1+/eFoI4EWPyCuGVn87NvQhEvQDyPtr/rbE2od9PMMRpoxrXUmaDjPo5kQZcdpJsAy
         b4OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fKZuBKIy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dk19-20020a056214093300b0064f6ab4d034si4162575qvb.512.2023.11.10.03.23.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 03:23:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fKZuBKIy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1PbY-0001Xi-9P; Fri, 10 Nov 2023 06:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1r1PbV-0001XJ-SM
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 06:23:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1r1PbU-0004f1-7f
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 06:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699615391;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NRO+hd2Nknho3S+fm83jWhO2LsuVoVb02z+etBZJKTQ=;
 b=fKZuBKIy9lPszIe5e1vqoC3AfJFD2JGs1E8+ZI6jhx3vSt0l+LVq25AJX3UzFSgtJnBrw/
 pPlMF8JCwSVf9+INetgp5iont5D/fwxvYhTghjh3kWXu9eK131jvvCke8czrDo4yeNUMFI
 eLm3HdJ4hRCjrsYfrubAtThgfd94X4Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-_DCir9vkOc20SdmmGzI_NA-1; Fri, 10 Nov 2023 06:23:07 -0500
X-MC-Unique: _DCir9vkOc20SdmmGzI_NA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6287985A58B;
 Fri, 10 Nov 2023 11:23:07 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E6F9502A;
 Fri, 10 Nov 2023 11:23:05 +0000 (UTC)
Date: Fri, 10 Nov 2023 11:23:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 2/2] Add warn_unused_result attr to AUD_register_card
Message-ID: <ZU4SmH8LMGVJmGZp@redhat.com>
References: <cover.1699606819.git.manos.pitsidianakis@linaro.org>
 <4b040fc18cb0e563e92ce084ca18b89a050a8aaa.1699606819.git.manos.pitsidianakis@linaro.org>
 <CAFEAcA80sv6ewJ+LoROn-9ooEyLGQwiqYpL3=fqrK7gA0oZG-A@mail.gmail.com>
 <3wmne.fhuf28sb5yfg@linaro.org>
 <CAFEAcA-mSBgLuGLp4Tzaq0L78PtsxF19CVfmkJwaM8pHfwv7wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-mSBgLuGLp4Tzaq0L78PtsxF19CVfmkJwaM8pHfwv7wg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: at/QWwIEm9NH

On Fri, Nov 10, 2023 at 11:18:39AM +0000, Peter Maydell wrote:
> On Fri, 10 Nov 2023 at 11:02, Manos Pitsidianakis
> <manos.pitsidianakis@linaro.org> wrote:
> >
> > On Fri, 10 Nov 2023 12:21, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >This kind of thing is why Coverity's unused-result warning has a
> > >lot of false positives. We shouldn't introduce extra code like
> > >this to work around the fact that the tooling doesn't understand
> > >our error-handling convention (i.e. error_fatal, and the way
> > >that some functions report errors both via the return value and
> > >also via the Error** argument).
> >
> > I respect that :). But I personally believe that clinging to C's
> > inadequacies, instead of preventing bugs statically just because it adds
> > some lines of code, is misguided. Proper code should strive to make bugs
> > impossible in the first place.
> 
> I generally agree. The problem here really is that we've ended
> up with this odd API convention that reports errors in two
> ways. In an ideal world we'd tidy up our APIs to report errors
> exactly in one way (presumably via the Error).

The compelling thing about our slightly odd &error_fatal/error_abort
approach is that we can directly get stack traces showing exactly
where the error happened.

If we just propagate the error up the stack to finally exit/abort,
the origin context is essentially lost, and when it does abort, we
don't get a snapshot of all threads at the time the error hit, as
we've moved on in time.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

