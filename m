Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp3213966lfk;
        Wed, 20 Apr 2022 08:18:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXjfwkTF3mnRN/7A2l4YfQZAFM/WyREZIN6quON3B8IF7hE6Ldl6FmZp3VaSiVqaxNNPOO
X-Received: by 2002:a81:ecd:0:b0:2eb:f1d0:9513 with SMTP id 196-20020a810ecd000000b002ebf1d09513mr21421996ywo.452.1650467906761;
        Wed, 20 Apr 2022 08:18:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650467906; cv=none;
        d=google.com; s=arc-20160816;
        b=YuQwVTVADeGtLAlASRB8b3EbVhTFlKs3e+7P9JMSWjcxxAFNxHn4KOamr4m7b83Ibj
         eLVd0opCP7AugZVPMpL2EFgaJmQKll6aQ93Wi1lXDOxiiSSrkadUUydEQNLGRCLoEjRM
         1o/yVyp0cAtkUk80TRRQAeKGp2dSCntaxokaxCbAfQcPFu72vYd0MmQa8WL8EyhhNWkk
         eXCMS/NmUN86COfEd+LWnS53OKcTqjB2cldKJWTZcgBxgbyZOuGM23SxBSCRDnI9ZepO
         xD9fY3+N2j3bIql8bmiS78FnnWOTZK/qkICThYP8NkBGeXtG+Pc0eC4Beck2X0FdJi/y
         U9sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=sR0XxAAxaizV/E6f9lU6QBnjbt3Cb8HsyBP7vVY9gvM=;
        b=sPBdQasnQ6ZTSM+o62IzIo8SzoLLNaQ2czpuX9c05cVMIVS+5+STn7Rvpqtgy7uqd5
         SXOGM6jR6omg54k8IucxvEl89vGUuXCWmxi52Wiu/xnKaHTDm7/V2Moy0NxRIFLLN0z0
         gsONdRPe2uQe0+7Wh2ruNhV879FzOtt5Qjs1urse6UJHlJJ/Rb0L1NTwi+cysPuACRI9
         uIY/kNpnmsMc6SpZz8qSz6N90Q66dyGWzXtkpa3znOHq2YQCSmGfDtCp2ErzsX/IW610
         mp8U+6OJnFQlXQicS0WBAujCqgwM234S+7i4kMg6Jhim92EucRJop/k4Sa2uvPR2GwUb
         WEJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cXQ7MuiD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z123-20020a0df081000000b002f1911903cesi168038ywe.20.2022.04.20.08.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Apr 2022 08:18:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cXQ7MuiD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhC66-000076-4i
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 11:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhC5b-0008Sm-FH
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 11:17:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhC5Z-0006fD-On
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 11:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650467873;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sR0XxAAxaizV/E6f9lU6QBnjbt3Cb8HsyBP7vVY9gvM=;
 b=cXQ7MuiDxxo/tvuOlFdlU5DX65qmGNaZyOvqJoIp8nDdSwpf6O/uQRvuqMRBKLpdwSitRR
 5HLibC8I8HT2xg2779ECVuN4Iru5BfU+i2g7Tl7SuhEUZi5gLtYeNJRFX8nB+pA0375Ifv
 48c0/RSWHM/HBlkJkDcjoH4dCfZAFlM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-V3hjg4jlOJaAj5iP2LstHw-1; Wed, 20 Apr 2022 11:17:49 -0400
X-MC-Unique: V3hjg4jlOJaAj5iP2LstHw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A0B71014A66;
 Wed, 20 Apr 2022 15:17:49 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 653F054EB01;
 Wed, 20 Apr 2022 15:17:48 +0000 (UTC)
Date: Wed, 20 Apr 2022 16:17:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 14/41] arm/allwinner-a10: replace snprintf() with
 g_strdup_printf()
Message-ID: <YmAkGnSVxKAXJLbH@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-15-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420132624.2439741-15-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Allwinner-a10" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k8z16LMxYYCw

On Wed, Apr 20, 2022 at 05:25:57PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Also fixes a GCC 12.0.1 false-positive:
> ../hw/arm/allwinner-a10.c: In function ‘aw_a10_realize’:
> ../hw/arm/allwinner-a10.c:135:35: error: ‘%d’ directive writing between 1 and 11 bytes into a region of size 8 [-Werror=format-overflow=]
>   135 |             sprintf(bus, "usb-bus.%d", i);
>       |                                   ^~
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/allwinner-a10.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

