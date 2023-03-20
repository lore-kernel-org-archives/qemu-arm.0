Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2832519ejb;
        Mon, 20 Mar 2023 06:51:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set9P1VOqhMkC9LrEMMQVaxkWscbdk9vEemjKvbIupIfvOyE1xll3rzM7blgqHOjan48v9XNG
X-Received: by 2002:a05:622a:1a82:b0:3e3:7368:b0f1 with SMTP id s2-20020a05622a1a8200b003e37368b0f1mr1832563qtc.19.1679320289007;
        Mon, 20 Mar 2023 06:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679320288; cv=none;
        d=google.com; s=arc-20160816;
        b=lRZjL00LtBeihjQQRdEhqKJ2OPkRkPhPmtsj4WLzgCV3SPiRejy6oiHEKZlmH/BKB9
         xM4Ra5cdbk7kYHGmZm7HDTN9ZcpI7nI1VQac9kvIAABKD5WeFnWvu5a6FLcEtHGIo3eu
         a/6pRkQfDrd6btJsE22M3uUQFqSCNADdOetiGd1T7sS4AO3bT5XJoneV6ExSJe3ByvCA
         Bb6pleXJ1azoBWlgdHb0zPYvlL7ZM5OHFTuI+5oFMiJbMqXt8AC5tpNkBy6NwrsJtyRw
         LY27mhzTYF16USqMABj1TwlWNkJvH26qZjCo3A3db8Oj2IeGRW2VE07eanXNi0FEnke8
         /LwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=kZu15T6cOb/YejN29+2I7YkNefrgcEHThEcYNk3wON0=;
        b=VCWT+zJfe7QX3IrKaweWeht1c0jMJIZsIBgmwCQnfcrEyZ0664khYrHai0vc0cA71V
         74d5b0KU99su2Rlck/fm6KIVZFNLb0amQGOjCA1gfTr0kQO8sfxy6GFjzFAJ4w6uFbha
         O/Nh7fAz8J9+ioz0kQsfNJb+bM2mh1mfSLLDgwdUwFSuu20I6EJa9WchNZSAiJHpUR0V
         jLPzPkri/i2Ia3S84o5AlE325CwZ2Ho183WJLsxu8Igr5PnewkwYRynM8WOoKP/iy0up
         0lZqY4V5HqgZL+y8VbihIqD+/UcvYYJP4dD5C4sGLiw5JAoUv+j6vC29jxsKsxuTQhzs
         I8gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HGaIIyDG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs17-20020a05620a471100b0074576196164si6369376qkb.549.2023.03.20.06.51.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Mar 2023 06:51:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HGaIIyDG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1peFui-0000Cu-1J; Mon, 20 Mar 2023 09:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peFug-0000Bv-TZ
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 09:51:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peFuf-0006qY-9V
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 09:51:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679320260;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kZu15T6cOb/YejN29+2I7YkNefrgcEHThEcYNk3wON0=;
 b=HGaIIyDGuE+zo7sCJyes0pZFBl/R6kGaPv4mj1L0RFEA9/AhTnqsbBpH+VUuVJ0ClsLPYH
 XwfhW5q06cd4skfzQRtGayxsqbijRDSby7PP8QKy//S3dSQKEBnmraHnfuMwBcv5EzlHux
 ptnAjpH2xojveTdwKgsXMmN0nONASFk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-gj-QwdmxNiasJTWFS99vTA-1; Mon, 20 Mar 2023 09:50:57 -0400
X-MC-Unique: gj-QwdmxNiasJTWFS99vTA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06BA9885621;
 Mon, 20 Mar 2023 13:50:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C20F8140EBF4;
 Mon, 20 Mar 2023 13:50:55 +0000 (UTC)
Date: Mon, 20 Mar 2023 13:50:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH-for-8.1 2/5] block/dmg: Remove duplicated prototype
 declarations
Message-ID: <ZBhkvQ1xt1m9VRJM@redhat.com>
References: <20230320134219.22489-1-philmd@linaro.org>
 <20230320134219.22489-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230320134219.22489-3-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
X-TUID: l5OOy9DuqcH2

On Mon, Mar 20, 2023 at 02:42:16PM +0100, Philippe Mathieu-Daudé wrote:
> Both dmg_uncompress_bz2 / dmg_uncompress_lzfse are declared
> in "dmg.h", included 1 line before.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  block/dmg.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/block/dmg.c b/block/dmg.c
> index e10b9a2ba5..a5d22fb8f9 100644
> --- a/block/dmg.c
> +++ b/block/dmg.c
> @@ -31,12 +31,6 @@
>  #include "qemu/memalign.h"
>  #include "dmg.h"
>  
> -int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
> -                          char *next_out, unsigned int avail_out);
> -
> -int (*dmg_uncompress_lzfse)(char *next_in, unsigned int avail_in,
> -                            char *next_out, unsigned int avail_out);

These aren't prototypes, they are variables that hold a funtion
pointer. The header has them as 'extern' to avoid the variables
being instantiated more than once if the header is included many
times. This code is correct as-is, and so this change is not
desirable.

> -
>  enum {
>      /* Limit chunk sizes to prevent unreasonable amounts of memory being used
>       * or truncating when converting to 32-bit types
> -- 
> 2.38.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

