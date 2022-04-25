Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2411966lfk;
        Mon, 25 Apr 2022 07:09:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmKA+66au2rTwYp1W2pXwjzL8z0KdV2FOeycUUM/p2Q5Hbg9+BgcdVCGnhF39dirXHGkFE
X-Received: by 2002:a05:6902:1543:b0:642:3fd:316c with SMTP id r3-20020a056902154300b0064203fd316cmr16000347ybu.622.1650895750004;
        Mon, 25 Apr 2022 07:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650895749; cv=none;
        d=google.com; s=arc-20160816;
        b=p/50Z7v+mZ6D8tgquFhHR5K/WLoRPzZXUjp081k8AKV5pJD1puP41Q75OiGCwTIZR2
         7hTq73wOiNuLhNJvOrynmyUaSmamEKWfJ8lX0/LGZ12qPTF8jHgwK9Heban+PxzdgeQO
         605Ha6gnSVYGyfxg0z3Uw9GZhBbT0K9VOOswcTqw/d3WeMdF/Y3RQKmzCHnBT9OpUspi
         ydfHA5GuOcyJ8M0WSuYMjlaO67aSX/n9sGtSiEgrOixQ+dBmP5udnUzAnIREMrAZvpfK
         mPEsW6ayf+m4FCHz01rZSFnoPX244PxUrVAQUX4kzpRVxg1uQAd4n6587APTAyuHAyCY
         0aeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=xno2021meW7LEWiXQuf+nffEFdg6lMv/SmWcXi9TiWw=;
        b=EbZZ/Hdrwc8n9fEBtKhgNKuOtHQz4UfHdKvEGPicn+HJOlyEGfGJEogOLbYrXcr9c9
         TA+AHgH5RtmnvBNUWPs0KXY4vefjnp544WsefR6axekSskqhJf38/KDvqIO6aU8jxBB8
         OIsUjzh+9RT1jpBXvXZbv60aS8yblexFv+JpnrQ8TI4fSoMQ88ovWRUFtntcLOgcKlGp
         WdF8Md1q/Oti9/MZZ6mW7s8HA3kPMTv2pQ+R46ttX/GQBg6i/LYKbVzrHzK+UrVng/Zz
         QnBf//w91P8ez+hbjN+IQ0yRgdOfwqmG8KO+X328UmT0vAVs4pPsx14Cy8MlZI4T3BuM
         SJJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QjWJHqRT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d145-20020a25e697000000b006484db1920esi3229269ybh.642.2022.04.25.07.09.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Apr 2022 07:09:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QjWJHqRT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nizOn-0006Ob-BA
	for alex.bennee@linaro.org; Mon, 25 Apr 2022 10:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizO1-000458-Qr
 for qemu-arm@nongnu.org; Mon, 25 Apr 2022 10:08:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizO0-0001vf-4t
 for qemu-arm@nongnu.org; Mon, 25 Apr 2022 10:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895699;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xno2021meW7LEWiXQuf+nffEFdg6lMv/SmWcXi9TiWw=;
 b=QjWJHqRTKO8u23Ck7t4oP7rTjPTe/otBFwfhCFsHobnqemG7OxxwL//BGJNXySfPmcTd6X
 smX77TF9o2d+bbpTlwg2AyvuBlMoBxUWKGyrhBOlxaIyUiPPd8OAFRo+8lcA88DsfjFxsU
 63xrA5CeWNXL4nFhmjFGjE3Cfm9Qjao=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-bS99B7hLMmKo9ZJHsllMEQ-1; Mon, 25 Apr 2022 10:08:17 -0400
X-MC-Unique: bS99B7hLMmKo9ZJHsllMEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2FB21C05AF4;
 Mon, 25 Apr 2022 14:08:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63394200BCD8;
 Mon, 25 Apr 2022 14:07:01 +0000 (UTC)
Date: Mon, 25 Apr 2022 15:06:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 03/18] hw/audio: Simplify hda audio init
Message-ID: <YmarAktcIEw2BOjn@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <cd1df4ad2a6fae969c4a02a77955c4a8c0d430b6.1650874791.git.mkletzan@redhat.com>
 <Ymajh0MgNfAWlWwC@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ymajh0MgNfAWlWwC@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LDUQBpf9zCV+

On Mon, Apr 25, 2022 at 02:35:03PM +0100, Daniel P. Berrangé wrote:
> On Mon, Apr 25, 2022 at 10:21:46AM +0200, Martin Kletzander wrote:
> > No return values are used anywhere, so switch the functions to be void
> > and add support for error reporting using errp for use in next patches.
> 
> Making it 'void' makes sense, but I'm not sure we need the Error **errp
> addition, given my comment on patch #13.

Nevermind, I revised my comment on that patch, so

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> > 
> > Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> > ---
> >  hw/audio/hda-codec.c | 32 ++++++++++++++++++--------------
> >  hw/audio/intel-hda.c |  4 +---
> >  hw/audio/intel-hda.h |  2 +-
> >  3 files changed, 20 insertions(+), 18 deletions(-)
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

