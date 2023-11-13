Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1341327ejc;
        Mon, 13 Nov 2023 05:47:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkYQLdqSiGfEnrNuuYfX2CXreex2+WKJ9MNucI4tbEGI47Qvch1kf9XDQA7P/1i67FqHlg
X-Received: by 2002:ad4:4bb3:0:b0:672:118e:e368 with SMTP id i19-20020ad44bb3000000b00672118ee368mr6030417qvw.24.1699883256982;
        Mon, 13 Nov 2023 05:47:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699883256; cv=none;
        d=google.com; s=arc-20160816;
        b=MEzP96tJqKPls+S0lFRaLWQXOSs0VZwpLyAuoQpr0h7viGOB7OzEdjE4vVJleP82vq
         XHS3ws0cJ5a5DaePFmQ4loVWDKtHbk4oqKAMMHZSzv+GzCVRg7GVvjHiF/DImTLTmwj4
         YbIDarLsuP9fK9/SFkGXxOaWvHdts2uZi0jm3Vzhe3HYrJBY5HIAB602BIlz6Fep6+8/
         OAFXZiEi05Ad73AMIevP4klGLeyfxUmUesIXdusBqyclzoB/QaDsS5to6wwqrAjxpF2F
         Mx+VsDMdqcFBhfDS/f385OYhTatUKWEAq+YpLXSrYVz77dniauSGwzc0pzM7zR1BKVa7
         cZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=koG3wFadMnbCIFuBdAvKgcPGRPpjVQVYYyW4+SxH8zI=;
        fh=sMzlku3di9/1VcV3WlW62bczDL7FaWFxQiwSOzEz1FQ=;
        b=04Dap6V2oaOrEahBnSMT4gAzs1xBubq4fnH7DtOXXeMnlZx57b5AKQZQhpTO/FuM8x
         3zaKSw5l2w146ZnDAmem5+G06uzhLlyscEsZgRblYMQbmY47M5qm1xi7xa14XJoPjZWC
         ussywr8nQxpy5aD9rt7KfYQOVh1D3Tnt9sffDzFuoaaEGTUsKMvpi2ILuv3GGJCTKkXJ
         /vaAA2krQIPcisJ6rRyBCz4p1RjvhHny/0CSxiah20TiKG8ml227nXRc/uVhRDwm1ROf
         cIu3+4ZrH5h+p1g/I5HoXMQZxizo91vJa8Rm07KPYkMZsqmANEZtKShR5tDaiXhNOav8
         KVnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VmOlwY3K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4-20020a0ce744000000b00646f2d31709si4561382qvn.178.2023.11.13.05.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Nov 2023 05:47:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VmOlwY3K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2XHk-0007z6-Fn; Mon, 13 Nov 2023 08:47:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1r2XHZ-0007yI-Ta
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 08:47:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1r2XHY-0007QQ-8L
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 08:47:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699883235;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=koG3wFadMnbCIFuBdAvKgcPGRPpjVQVYYyW4+SxH8zI=;
 b=VmOlwY3Kv9/ks5KaNDvdFw59DpMfxQsR2ztrHwid0Nt3R9vZf0DyS4OFtHwRj/nHoSVKTF
 e6z96Wf21G6wd5sqw2S50A9hd0IhA/H82aaCti0xfHnmD/LP0H3yFke+JUO/PgvKXb24Vw
 MpLMStVFOZqdLrc+1ocfgKSpEu6w+ts=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-oKA9VAhaPDy7aFHa8oAC2g-1; Mon, 13 Nov 2023 08:47:13 -0500
X-MC-Unique: oKA9VAhaPDy7aFHa8oAC2g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D81F93A9A7;
 Mon, 13 Nov 2023 13:47:12 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4EE51121306;
 Mon, 13 Nov 2023 13:47:10 +0000 (UTC)
Date: Mon, 13 Nov 2023 13:47:08 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, alistair@alistair23.me,
 edgar.iglesias@gmail.com, peter.maydell@linaro.org,
 francisco.iglesias@amd.com, qemu-arm@nongnu.org
Subject: Re: [PATCH 0/2] Replace anti-social QOM type names (again)
Message-ID: <ZVIo3FsmwpfHzsh8@redhat.com>
References: <20231113134344.1195478-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231113134344.1195478-1-armbru@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: aJp1VRLS3XNZ

On Mon, Nov 13, 2023 at 02:43:42PM +0100, Markus Armbruster wrote:
> We got rid of QOM type names containing ',' in 6.0, but some have
> crept back in.  Replace them just like we did in 6.0.

It is practical to add

   assert(strchr(name, ',') == NULL)

to some place in QOM to stop them coming back yet again ?

> 
> Cover letter of 6.0's replacement:
> https://lore.kernel.org/qemu-devel/20210304140229.575481-1-armbru@redhat.com/
> 
> Markus Armbruster (2):
>   docs/system/arm: Fix for rename of type "xlnx.bbram-ctrl"
>   hw: Replace anti-social QOM type names (again)
> 
>  docs/system/arm/xlnx-versal-virt.rst     | 4 ++--
>  include/hw/misc/xlnx-versal-cframe-reg.h | 2 +-
>  include/hw/misc/xlnx-versal-cfu.h        | 6 +++---
>  include/hw/misc/xlnx-versal-crl.h        | 2 +-
>  include/hw/nvram/xlnx-efuse.h            | 2 +-
>  include/hw/nvram/xlnx-versal-efuse.h     | 4 ++--
>  include/hw/nvram/xlnx-zynqmp-efuse.h     | 2 +-
>  7 files changed, 11 insertions(+), 11 deletions(-)
> 
> -- 
> 2.41.0
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

