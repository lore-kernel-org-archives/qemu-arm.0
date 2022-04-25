Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2427599lfk;
        Mon, 25 Apr 2022 07:31:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuPhVYW3zs20FwVdLxQ5hn5QQKV/xE0ZVsIW8MxoIjaohNUDjDshhBA0Qs579UxVswVFWS
X-Received: by 2002:a25:40c9:0:b0:645:71c9:b3a1 with SMTP id n192-20020a2540c9000000b0064571c9b3a1mr16202587yba.557.1650897077065;
        Mon, 25 Apr 2022 07:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650897077; cv=none;
        d=google.com; s=arc-20160816;
        b=K+iNJ0pla1NG9EfJwJZHhVCUpXoSsnqZd5ba8FzMh5vPnFc7okWTB/Ze/h8WJB6ZiU
         BBgFqnP6FX3lpv2PHW2MAZ08xnJkU6h6Xna59owBh1PasO315lb9oZ8rcsEnl/uHpx11
         3N5s4rKgXq5kE0JeOpOlpNXpYcQbIP1gErzYtLCp4q4w9NBLumL9H8EDg2XDk/iq1IUW
         72OcVqbAS9vEc9zLDpzvpoaLDEtNknw3tLXofF48g3cAKTr5kRZW8iGv/VLyKY93E0Zx
         vRhONmqQO1UG/hkV290bB8WbH7jhVv4WJE0Gzv2Fhke4Xutn33Sf6zIglY9JWm25eQ1n
         UQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=avopix5/SPzj09GMg0byl1AJgKDngwK6xIFGNAjjtFo=;
        b=oo5mnvmoj+B8V+lWZj/laXQbCppTm0On9ArznhzgueUX6elD+8Ifa13L/y5IZsXEE4
         oL+jcvsvGYpxtA2nLGfKYECim3cmh4eSh4golcZcK66MVaI7vnetrbfiNvEpfnsOjLmN
         aacRVXp5pDOZmq2f47qL5swsG2NtzOGQC/Aq6n+NlqEEnKr0KYWM3TOZ2SEm68P3ETOK
         vVA+YlNw2UMBa254aGqgLtDDb8duh7+F7y1Jsn3tLhoSbFcdqUuIO2VtZK0IR8fvhlxC
         Z/tp7QczIdOvF0DuviJ77iGFSidDzf8RQ0cmda2m0qWfuYX3+YFwel7rb+9E9q5T9X/t
         FHog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C3+lYb2s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j129-20020a256e87000000b00641acf268e8si11201889ybc.549.2022.04.25.07.31.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Apr 2022 07:31:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C3+lYb2s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nizkC-0002r2-Fj
	for alex.bennee@linaro.org; Mon, 25 Apr 2022 10:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizYw-0000zY-2u
 for qemu-arm@nongnu.org; Mon, 25 Apr 2022 10:19:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizYu-0003WL-1J
 for qemu-arm@nongnu.org; Mon, 25 Apr 2022 10:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650896375;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=avopix5/SPzj09GMg0byl1AJgKDngwK6xIFGNAjjtFo=;
 b=C3+lYb2safKPY8WdTBzKwxhgZM2JceyXA6bewuz7UyuULHpCkqyHogp7x9Ce5ca8LsqEu3
 VijLd9yCoQL//R3Zc3ni4V+54bbcJGUZrkfzpHaBWGwUgt+jebnUYDTwv+t+N8qTXmlm+b
 Av7nZU2R5uLZijIZgyRdD3dmc8LDJ+g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-V_9R8X_dM3aNNMOxrR_2cA-1; Mon, 25 Apr 2022 10:19:34 -0400
X-MC-Unique: V_9R8X_dM3aNNMOxrR_2cA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6066E811E80;
 Mon, 25 Apr 2022 14:19:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3FA854E885;
 Mon, 25 Apr 2022 14:19:29 +0000 (UTC)
Date: Mon, 25 Apr 2022 15:19:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>
Subject: Re: [PATCH 17/18] audio: Remove unused can_be_default
Message-ID: <Ymat7+B1DQDB6cMu@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <31616bc6be45ba26e96beb54f7278d618f15a5fe.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31616bc6be45ba26e96beb54f7278d618f15a5fe.1650874791.git.mkletzan@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Darren Kenny <darren.kenny@oracle.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DA6iKcEztUDe

On Mon, Apr 25, 2022 at 10:22:00AM +0200, Martin Kletzander wrote:
> Since there is no fallback mechanism and default-guessing this is now
> not used and can be safely removed.
> 
> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> ---
>  audio/alsaaudio.c   | 1 -
>  audio/audio_int.h   | 1 -
>  audio/coreaudio.m   | 1 -
>  audio/dbusaudio.c   | 1 -
>  audio/dsoundaudio.c | 1 -
>  audio/jackaudio.c   | 1 -
>  audio/noaudio.c     | 1 -
>  audio/ossaudio.c    | 1 -
>  audio/paaudio.c     | 1 -
>  audio/sdlaudio.c    | 1 -
>  audio/wavaudio.c    | 1 -
>  11 files changed, 11 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

