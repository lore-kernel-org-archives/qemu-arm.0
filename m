Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6365292ejq;
        Mon, 15 May 2023 01:52:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ZlO7l44dMr1CYxd/aitFfuVmOgRS0aarcqIG1rpzu8LfjPmN3insN31u1qzLHAVf4XoRX
X-Received: by 2002:a05:6214:3014:b0:5f1:683e:9bd6 with SMTP id ke20-20020a056214301400b005f1683e9bd6mr52382692qvb.9.1684140751869;
        Mon, 15 May 2023 01:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684140751; cv=none;
        d=google.com; s=arc-20160816;
        b=pxfc63aC1NChgYdT/Mqz4H0nPNPsyBgcWsuu0CZBtpWjXFYQyTsD5GClFVmRhf0i1c
         +ZROe4YJf6HNriUFhdbw35y9jSqE7fEFCxZ0cV2cryk3DnkvJzEZekeUQua8nmDVX3RY
         ZSAOR8zigapKh0AW0+gXxm86BTXS32pdWzn4PszPUNdaqhL3WBLdTSpKZv+qR7H8LFJu
         UN7rASYBzFj9zwU3iBGZMNtXYYjlmFJ17h9GenVDHsVY6/7+9ic1YUkenqiA5Xu80XwM
         5cs9tZ1FRy5QxyXi+GOyYBBBc9v+ygpHdZ6ZGoWI0TL8eWDvwau6IA0CpQp1MLOggWRA
         MNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=NZVlOg28FdbfZwVK8jpACnAXAjM1hk1fGYx5M9A0rZU=;
        b=FSF9pSQWn1NdKHmcwEbb3Su0XGdAU5c1Jrt5GjhtjOW8f8AQ/MXikpKgTxpR2AhumO
         Eh/xTEAjWr1ov4XJ3VpykVbgf1/QkphEoBufxtvCfRLJuprhQWjrLtPo2SzVvUJQSL0a
         PngdLXbxExsRsuIjZsuHpAzdaTcXd9oUI4aYjYChs5dllgJG+FCj0WqSpuu1bJGuocZ9
         w2phDg0Dvpidxt8dvgJjuc1n/veIxxOILtyqXBbH1klkWPKqkiperE/JMncBbgPpr4gg
         vD3awifTSEevVrETysxspBPYX8gbZiv1aBD/Uk3UmVClKe4utlXnt2KaqYpSTxseCU9z
         hQxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NYtl6Cwt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu5-20020ad45cc5000000b0061b79c5fb31si9513267qvb.308.2023.05.15.01.52.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 01:52:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NYtl6Cwt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyTwR-0008MT-CX; Mon, 15 May 2023 04:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyTwP-0008G7-12
 for qemu-arm@nongnu.org; Mon, 15 May 2023 04:52:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyTwN-00065N-68
 for qemu-arm@nongnu.org; Mon, 15 May 2023 04:52:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684140738;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NZVlOg28FdbfZwVK8jpACnAXAjM1hk1fGYx5M9A0rZU=;
 b=NYtl6CwtXT3MhLXS2pEP6CFJ26vdnlEBCVWlftnlPiF+NzsgGCaYDPONujYO9v3wCfk4jy
 oAJeS5SCvl/IBqLg9z2V+H3lBKaA/IltytzgMcZ1XbBo4ZK1PbxgDTRYKva1KS32DyD5dw
 4wBuC6/8X3slOlJl9gVFKZFR2IbIALI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-lYKL0opTPO--kS8McbUP0Q-1; Mon, 15 May 2023 04:52:17 -0400
X-MC-Unique: lYKL0opTPO--kS8McbUP0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2618D88B770;
 Mon, 15 May 2023 08:52:17 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73406C16026;
 Mon, 15 May 2023 08:52:14 +0000 (UTC)
Date: Mon, 15 May 2023 09:52:12 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hao Zeng <zenghao@kylinos.cn>
Cc: pbonzini@redhat.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH V2] hw/arm: enable qxl for aarch64
Message-ID: <ZGHyvBb8BQdKhWEy@redhat.com>
References: <20230512093108.1180726-1-zenghao@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230512093108.1180726-1-zenghao@kylinos.cn>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: iWZz4WQeAZwq

On Fri, May 12, 2023 at 05:31:08PM +0800, Hao Zeng wrote:
> Qemu does not support qxl graphics cards in arm, it is recommended to enable

Who recommends this and why ?

The recommendations from Gerd are what I tend to point poeple to
for display devices:

  https://www.kraxel.org/blog/2019/09/display-devices-in-qemu/

and it had this to say about arm:

  "On arm systems display devices with a pci memory bar do
   not work, which reduces the choices alot. We are left with:

    virtio gpu, if your guest has drivers
    ramfb"

Not sure if anything has changed in this respect ?


The QXL graphics card is an incredibly complex device, offering
2d acceleration that is not very interesting for modern guest OS
desktops since they're largely focused on 3d acceleration. This
complexity is bad from a security POV.

It would also require a guest driver to take advantage of QXL
features and while I presume the Linux driver will build, it is
still mostly pointless because of lack of interest in 2d acceleration.
I'm not sure about status of the Windows QXL driver for aarch64 ?

Further QXL is only useful when combined with SPICE graphics and
the SPICE project is largely inactive.

Overall, IMHO, we should keep QXL restricted to as few build scenarios
as possible. Given the status of SPICE, possibly we'll even want to
deprecate it on x86 eventually, not add it to more arches. 

What are you seeing as the compelling use case that requires QXL to
exist on aarch64 ?



> 
> Signed-off-by: Hao Zeng <zenghao@kylinos.cn>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 0f42c556d7..d0bedf9347 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -32,6 +32,7 @@ config ARM_VIRT
>      select VIRTIO_MEM_SUPPORTED
>      select ACPI_CXL
>      select ACPI_HMAT
> +    select QXL
>  
>  config CHEETAH
>      bool
> -- 
> 2.37.2
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

