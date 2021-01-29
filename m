Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1080081lfo;
        Fri, 29 Jan 2021 04:23:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoW8gK/zCSgTzLIWcNUJYzKu6CGxd2ezifFf251peWG/XejzF6ZJReBwaj0l8kP056I6Jh
X-Received: by 2002:a25:bd51:: with SMTP id p17mr3263823ybm.274.1611922979941;
        Fri, 29 Jan 2021 04:22:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611922979; cv=none;
        d=google.com; s=arc-20160816;
        b=tzl2191x+W0nCNX5UOcECcz1hxGtM/NKbmveza4td82ji/BAB7G0OFlYr57EyAFOvV
         UtOlY2ihadqy73CFDinnn3wXj4AbYK1kUcWIuVvGcmVxeN8Vqx9H9ALETmiave+0UBkj
         ZTUMwj1lUyfjclvT3qITB5NspzsSPKZTdlPjx9n74VY1+G4wJ4kDtKuhzY+iwnDaD2jT
         ou6WG/Ao2Ubz0FmTUhQRTBXav6c+WuxvSbpePkO934MVz1iFY2of1lcB4dcVT3gmMJgM
         iDrRwRi6XqMmZLDwFFnbFLWz+z4fsGyi/KZFGY/RdyzadDlvPzzDQhdZMzQY35mca+96
         Ul3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=ZCpBpvcztZfsdnFPJvUirqQrQuAPKuXuq+owsiHvLH0=;
        b=VuKckYOA4s3TYBXqgzH/k94D1Fpha//wNvN4NEoi0STyjnZgoI41YlC37IZa2+hS8P
         /RPw7PirU5f9MCuzMR/tisCxnSgG+gf/qcI54R45g9l5GWPGayh7KViyN5ZVopRy6SXW
         YZJEACLPXMEeEk3B3TumQph7tIpIoDBmQd2/W/38COWW8jmq5auOZDHtn6BDwOBuryjV
         TkV1dNTWdY/4keYKDVVopRXSPfg+NHVlT8YOhtYX1JKNMaJujs2NTxjBe8yRwLnK/3DO
         XJUGmXEQFyWWDFJI22NeT3HN3KA5YXTBu968w8mICx93GwA5UxssMcwrZ3402kTu40w5
         9xyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="gnHtUd/3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si10111394ybt.392.2021.01.29.04.22.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 04:22:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="gnHtUd/3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5Snj-0005tw-7p
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 07:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5SjS-0002Lv-3o
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:18:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5SjN-0005q6-Gm
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:18:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611922708;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZCpBpvcztZfsdnFPJvUirqQrQuAPKuXuq+owsiHvLH0=;
 b=gnHtUd/35zrBwr+/2a/j9fIT1qrO+qmchB5G7Fr+pLjh8Mmgb3Z20uhhUl2HEnZS/FMHIs
 6zzNDupFj6ovcI2jDruvCtp+H1LZjtlu12rWwNFTO+BZrtiyeF3VlN48E65krJz7YWp0KU
 f+tBzcFLqElHYWh5vZjgFlN+UIje1mk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-OuMKDblmMQmOHH6CL5MV3w-1; Fri, 29 Jan 2021 07:18:13 -0500
X-MC-Unique: OuMKDblmMQmOHH6CL5MV3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C68C1005504;
 Fri, 29 Jan 2021 12:18:11 +0000 (UTC)
Received: from redhat.com (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7E2C19D9F;
 Fri, 29 Jan 2021 12:17:55 +0000 (UTC)
Date: Fri, 29 Jan 2021 12:17:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RFC 0/1] QOM type names and QAPI
Message-ID: <20210129121752.GJ4001740@redhat.com>
References: <20210129081519.3848145-1-armbru@redhat.com>
 <CAFEAcA_O=48U_3p_mKeRRY99OsJCRSTJmOefDT1gbHVdyE_C0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_O=48U_3p_mKeRRY99OsJCRSTJmOefDT1gbHVdyE_C0A@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Jean-Christophe DUBOIS <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UkKgpHULDD8R

On Fri, Jan 29, 2021 at 12:01:53PM +0000, Peter Maydell wrote:
> On Fri, 29 Jan 2021 at 08:15, Markus Armbruster <armbru@redhat.com> wrote:
> > 2. We have some 550 type names containing '.'.  QAPI's naming rules
> >    could be relaxed to accept '.', but keyval_parse()'s can't.
> >
> >    Aside: I wish keyval_parse() would use '/' instead of '.', but it's
> >    designed to be compatible to the block layer's existing use of
> >    dotted keys (shoehorned into QemuOpts).
> 
> > Of the type names containing '.' or '+'[**], 293 are CPUs, 107 are
> > machines, and 150 are something else.  48 of them can be plugged with
> > -device, all s390x or spapr CPUs.
> >
> > Can we get rid of '.'?
> 
> On this one, my vote would be "no". "Versioned machine names
> include the QEMU version number" is pretty well entrenched,
> and requiring users to remember that when they want version 4.2
> they need to remember some other way of writing it than "4.2"
> seems rather unfriendly. And 550 uses of '.' is a lot.

We can't make  keyval_parse() accept "/" instead of ".", but can
we make it accept "/" in addition to ".", and then encourage "/"  ?

People simply wouldnt be able to use "." as keyval separator if
they're using typenames containing "." (or would have to escape
the typename.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

