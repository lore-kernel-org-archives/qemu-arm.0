Received: by 2002:a05:7022:6b88:b0:48:25f4:1512 with SMTP id dm8csp636837dlb;
        Tue, 20 Dec 2022 01:33:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf75pFx/yRWh1BAYmVAsqLVg5af7FL5MqILobXN07Gj4b5AoKmpeP2RVqdIOJ0n876rnuhfO
X-Received: by 2002:a05:622a:5a0d:b0:3a5:1001:2057 with SMTP id fy13-20020a05622a5a0d00b003a510012057mr59963966qtb.30.1671528806624;
        Tue, 20 Dec 2022 01:33:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671528806; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMmLHeLUZTMLHCmN3UrajWkyYsYeMQ52TY3UNJJQGbOUOj5dgpkShyng4C1xoRE4Gd
         Gp3y9UGaP3wWP2F2rqUueqjTsR+6pbrY8HBfJ8EhPIpdUffYMokvPsXbQBr4UA1/yuke
         Vblj+jlNzyvV78hAO+3PcU8qHkTQIvQO7HyizhK/Q1oysiTOZqy8nXw7s5fwsWvquDvQ
         X1J+oE0Re5s2JZW5EvdhJukbS4jvL8UK49Fa9K/yU+ILmKZZ7gD1gSFZan61gSAKUav9
         EisFPY3tQD7iISZjcfSCTrwOwlraxVlFJbie6g9UpIwgp2S3xQMpv+zs/MZH0x+7RagO
         bzUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=uxXCIJ4Nvz393c9ntfWUcy36GVN1W5kcQUWK9zoq6xE=;
        b=a9/R43OOCdDwEXuREwB0KsQe8IhKEwjoLl/Jcq2/Ddc4VT3uGeFxvb3djF4nGK3p4e
         8cxwlJ3a/aW86hhvTziEgjkwRqJir7uXASYx6i2lwiuwcVDSUjTII+P4CAYLsZjkgPyR
         qTwRrqzLOr50xLNkJWx28eeeZwFtIcOZ53aOqy0Ma0HK+AO+4R/gzFmOB5V74R1fJqiq
         ixNygZ5knz8FnrGmfbkKZHqLxN0bpmAezueBUuEZ1n6fB/0d3qM1x6WbbA1rjr43bL/Y
         pqkMssqAch1dZMny1aX8coq0a/rTqeWiK+ZNvjKU/S5UVe74JFzM/mPylNVg3YxSS2Hf
         5EvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QCxiZnFr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16-20020ac87410000000b0039ce7eadcccsi4920722qtq.672.2022.12.20.01.33.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 01:33:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QCxiZnFr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7YcI-0001gE-Ch; Tue, 20 Dec 2022 04:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7YcC-0001ZP-Ur
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 04:08:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7Yc7-0006dH-93
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 04:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671527322;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxXCIJ4Nvz393c9ntfWUcy36GVN1W5kcQUWK9zoq6xE=;
 b=QCxiZnFrz4LItcwXwrBIFa52IHjIjI3qcgsF+wIOyMi9DzwX8dWpHfbcKOYXOJMxNdrzt9
 Jw8dju1vjiYm7YEytvz2CfKDmsGCeYBv7W0ELS1wlVnogeTgTZkq4GNTXRaf9XYK2LGSgM
 6CVetNpH21k5/117Yh5IW+a1TFwcmgg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-ZR32ThfRM2enqIP5xJ4x6A-1; Tue, 20 Dec 2022 04:08:38 -0500
X-MC-Unique: ZR32ThfRM2enqIP5xJ4x6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C24D811E6E;
 Tue, 20 Dec 2022 09:08:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC591112132D;
 Tue, 20 Dec 2022 09:08:35 +0000 (UTC)
Date: Tue, 20 Dec 2022 09:08:33 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Xiang Zheng <zhengxiang9@huawei.com>
Subject: Re: [PATCH v2] pflash: Only read non-zero parts of backend image
Message-ID: <Y6F7kViHMEXrFMju@redhat.com>
References: <20221220084246.1984871-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221220084246.1984871-1-kraxel@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: YK+tiTjqmpvM

On Tue, Dec 20, 2022 at 09:42:46AM +0100, Gerd Hoffmann wrote:
> From: Xiang Zheng <zhengxiang9@huawei.com>
> 
> Currently we fill the VIRT_FLASH memory space with two 64MB NOR images
> when using persistent UEFI variables on virt board. Actually we only use
> a very small(non-zero) part of the memory while the rest significant
> large(zero) part of memory is wasted.
> 
> So this patch checks the block status and only writes the non-zero part
> into memory. This requires pflash devices to use sparse files for
> backends.
> 
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> 
> [ kraxel: rebased to latest master ]
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/block/block.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

