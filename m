Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp821465lfk;
        Thu, 18 Nov 2021 07:46:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLXJlK/4dpGp+PDdUZHviRYB5AeAUlqD/nYGDGK9GdKaQR6A50FNdX/HDgjKnrNxYXzzLA
X-Received: by 2002:a05:620a:a45:: with SMTP id j5mr21683963qka.392.1637250407651;
        Thu, 18 Nov 2021 07:46:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637250407; cv=none;
        d=google.com; s=arc-20160816;
        b=SEfrmc9c1wshvn25oiEuBPIE7Wzw4/z0OuY4AWrRdpb7V/lXAthuH/U6ledju9v/fi
         RmCN1ittftaP5hH+UbGt7uYeO/CPy6//MpOuXvifE8KtNRx54SqOiIJCUfeMQGZRiB4g
         t8c9KPqHsoemw7sAmpwDT1zhyoxClZPzll9yEuo5EgZrok4zbqcUz1Vqzr/uWzCfH/dT
         RlDi3KX1bXbTCp2g+3mww4Ahtcwn+8ZxuuUylYshr37BHnyx+DMVCc8YlXsiX1T+iGYT
         Xp2dXTFbXSeMes2EZljmYLDKbytzVERCGs+mvhHtucEQjq+htUTaQQ/KsQKvXUKC4FxB
         zgDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=dAZssIcABG5QkpLKKwjzqsxx5qFwUj/oXA8+wG/I6uQ=;
        b=o0Kf3FepRwtIqbqh0z+Q0hTxjk/QBMTIFiHk8gqX1IysgTbxp5ek8dKXwscbrr9m/7
         fHLj0NAkTaPktmIo4aModPx/AUtWn2xemHCe9cjjYfKCnw2wRZufqLawjAGYn5cyEvy2
         gedg16WPytLwrSUrbPKmXI+EL62QVsmIn/Bt5eCFWjtuhCuaJvQvsVk2OdwfBfcz2HVa
         gF8wc+DGB38UUOqFPac9XCaogg+Fd1FIKclH4zWeqAD9K+YGIzC+XGJChzv46CYyB66R
         LjSLT8tHt/KlAoFZztdAIP0mJkc6B9V6dtdxX7cwHU5JoBxsTQBDrJAn1nw5b9n/TI33
         nqmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="PJ+2/t/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si415346vsk.292.2021.11.18.07.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Nov 2021 07:46:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="PJ+2/t/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnjcd-0004wb-1X
	for alex.bennee@linaro.org; Thu, 18 Nov 2021 10:46:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mnjc8-0004uB-Lm
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 10:46:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mnjc6-0000cg-Oe
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 10:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637250374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAZssIcABG5QkpLKKwjzqsxx5qFwUj/oXA8+wG/I6uQ=;
 b=PJ+2/t/BcUiCzsAeyFIRC5LHWV+DOzftBDBPXfOoRwBfX7+y1jjdih7gArPJLQHveaBM5F
 sx8W5vMQTV2IcloFFjjcWRxrUXbazcK/crelCPzBMVHLucdYHWon+2MhAYtfXBGSrY9Crh
 uWS6hHS7vf404oIv3y31u64MQ2yyLPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-bTWV3ogKPEmPDWEE9o9CeA-1; Thu, 18 Nov 2021 10:46:11 -0500
X-MC-Unique: bTWV3ogKPEmPDWEE9o9CeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7656E87D548;
 Thu, 18 Nov 2021 15:46:09 +0000 (UTC)
Received: from redhat.com (ovpn-112-250.phx2.redhat.com [10.3.112.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D3305D9DE;
 Thu, 18 Nov 2021 15:46:08 +0000 (UTC)
Date: Thu, 18 Nov 2021 09:46:06 -0600
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2?] docs: Render binary names as monospaced text
Message-ID: <20211118154606.6mt73we5obw6pvav@redhat.com>
References: <20211118144317.4106651-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211118144317.4106651-1-philmd@redhat.com>
User-Agent: NeoMutt/20211029-16-b680fe
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, John G Johnson <john.g.johnson@oracle.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F04vVJVLXqgL

On Thu, Nov 18, 2021 at 03:43:17PM +0100, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---

> +++ b/docs/about/removed-features.rst
> @@ -658,8 +658,8 @@ enforce that any failure to open the backing image (including if the
>  backing file is missing or an incorrect format was specified) is an
>  error when ``-u`` is not used.
>  
> -qemu-img amend to adjust backing file (removed in 6.1)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``qemu-img`` amend to adjust backing file (removed in 6.1)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Why quote just qemu-img here,

>  
>  The use of ``qemu-img amend`` to modify the name or format of a qcow2

when the context is obvious that it is the 'qemu-img amend' subcommand?

>  backing image was never fully documented or tested, and interferes
> @@ -670,8 +670,8 @@ backing chain should be performed with ``qemu-img rebase -u`` either
>  before or after the remaining changes being performed by amend, as
>  appropriate.
>  
> -qemu-img backing file without format (removed in 6.1)
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``qemu-img`` backing file without format (removed in 6.1)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''

This one makes sense, though, as "backing" is not a qemu-img subcommand.

>  
>  The use of ``qemu-img create``, ``qemu-img rebase``, or ``qemu-img
>  convert`` to create or modify an image that depends on a backing file
> diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
> index 7a83f5fc0db..431caba7aa0 100644
> --- a/docs/devel/build-system.rst
> +++ b/docs/tools/qemu-nbd.rst
> @@ -38,7 +38,7 @@ driver options if ``--image-opts`` is specified.
>    supported. The common object types that it makes sense to define are the
>    ``secret`` object, which is used to supply passwords and/or encryption
>    keys, and the ``tls-creds`` object, which is used to supply TLS
> -  credentials for the qemu-nbd server or client.
> +  credentials for the ``qemu-nbd`` server or client.
>  
>  .. option:: -p, --port=PORT
>  
> @@ -238,7 +238,7 @@ daemon:
>  Expose the guest-visible contents of a qcow2 file via a block device
>  /dev/nbd0 (and possibly creating /dev/nbd0p1 and friends for
>  partitions found within), then disconnect the device when done.
> -Access to bind qemu-nbd to an /dev/nbd device generally requires root
> +Access to bind ``qemu-nbd`` to an /dev/nbd device generally requires root

As long as you're touching this line, s/an/a/.

>  privileges, and may also require the execution of ``modprobe nbd``
>  to enable the kernel NBD client module.  *CAUTION*: Do not use
>  this method to mount filesystems from an untrusted guest image - a

Overall looks like a nice changeset.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

