Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp595213njc;
        Thu, 8 Aug 2024 10:22:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXaB+123Z82Zag0UgnE+BpAN3gjj87CoAqFFQBQyrx9/soYabQlWdjHHWkW8RNuKnwBxtFS6VGlqxVlJL0yY8TP+Qu4UqU5
X-Google-Smtp-Source: AGHT+IHIgrflS5t3uXnzwjhnyhQII108NMBGAwGGnFQ9DqocLCyuv017ZGOpr5U16OLGDf3vSWfN
X-Received: by 2002:a05:620a:40c1:b0:79f:10e6:2ec with SMTP id af79cd13be357-7a3818145bemr272469785a.35.1723137774558;
        Thu, 08 Aug 2024 10:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723137774; cv=none;
        d=google.com; s=arc-20160816;
        b=R7UJ019aeHFO83RiD9TBYC08tYn4aaZn3XHJmcR9dm4Aj/zTIFZDUjW7if4LWlUMc+
         LwPosKlREFIpVXbdqWKEDS5bGJBBTrBYRiQ3Cj/jh42Jz3PAOcW1NEgk/0Bfgyb/JUgT
         ZQCwJmq45n0whuX6/IMCv9ZlnjQnZPLu53cmGv0tQ7XGvyB5ZhL4osfA30edtNZBB1Fr
         Slig0XIAj0YRFMglaFJKzARuTO/JiGtHe1t/CzCEowAL7TYiunCCreumD698M2x+ATkN
         QdAJ/13rxIIwT6vr5Gc9+w4gFb/gPT10euiqeUGTpXb6miDvOtdbO7f+ydinD1DW1q+4
         4vxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=QaYyVHB+mxSzA1ftHlJTWZJ4MWnm5chCEnkVXEtMXpQ=;
        fh=N5HxHITUWSLOkULx7ITQ8OrnC9xUUIL/vatdVN0Rh8s=;
        b=wlBcMeIpTyMMCZm+0bgrwhbJlb8GidgfS35W2gZfuUlB4t7nIqn/MtCsxtpH+hUEQS
         BB1f7m1acMC8cZHKbY1Yw/1QJDlo9dWDyJ1w4MGCQfOBFoH9C2BrZBqzO9ogAje+Q5C/
         QdXkxwaq5oJtIdxfyOv6E44SuGaKnNiHjX/4u7k3e6EeFo+Zrx+SJpiNclzNfk3K45fq
         FjDVHCuLRU5X7QgxSuVORL80L8KbMAu8oLOAPgBSD0ftkXM/xUD34iLGl+FC/ALypKjH
         6LtRF0frxLLfifTSOuGiQ4m23srtV+oj/fHPBHMd6AF87Bq4fTQHQUvIQrIn2sA3k1JH
         wktw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hVahE/CK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a37870f7e6si460545985a.349.2024.08.08.10.22.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 10:22:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hVahE/CK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc6qe-0006VI-KW; Thu, 08 Aug 2024 13:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sc6qb-0006IM-E6
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 13:22:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sc6qZ-0007M3-SW
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 13:22:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723137763;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QaYyVHB+mxSzA1ftHlJTWZJ4MWnm5chCEnkVXEtMXpQ=;
 b=hVahE/CKqmj5bUOQ5E7AMuJ/LzhtwnJ7Xrok6WX9BnmYSs8p+7SLeJqEaVHNwS3pvQtVnZ
 /gZuoq9csDXkh2YMP8gDAfT1XDyJ6FX6HZI6bh9FwRVWKU6+NWC6uJIRPkchcZwOcZa3xL
 fsI6o82esDR2OIhBnJWSErkuwxYOKlQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-m_qH7z-8OX-QPQIAz0-WfA-1; Thu,
 08 Aug 2024 13:22:40 -0400
X-MC-Unique: m_qH7z-8OX-QPQIAz0-WfA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 535431944B2D; Thu,  8 Aug 2024 17:22:39 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.163])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0DCC81955E93; Thu,  8 Aug 2024 17:22:35 +0000 (UTC)
Date: Thu, 8 Aug 2024 18:22:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alejandro Zeise <alejandro.zeise@seagate.com>
Cc: qemu-arm@nongnu.org, kris.conklin@seagate.com,
 jonathan.henze@seagate.com, evan.burgess@seagate.com, clg@kaod.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 12/15] crypto/hash-nettle: Remove old hash API functions
Message-ID: <ZrT-2MAv3K8irj54@redhat.com>
References: <20240807195122.2827364-1-alejandro.zeise@seagate.com>
 <20240807195122.2827364-13-alejandro.zeise@seagate.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240807195122.2827364-13-alejandro.zeise@seagate.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: P+oXr2xJhhlC

On Wed, Aug 07, 2024 at 07:51:19PM +0000, Alejandro Zeise wrote:
> Removes old hash implemention in the nettle hash driver.
> 
> Signed-off-by: Alejandro Zeise <alejandro.zeise@seagate.com>
> ---
>  crypto/hash-nettle.c | 53 --------------------------------------------
>  1 file changed, 53 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

