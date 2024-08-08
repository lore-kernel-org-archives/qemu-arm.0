Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp594305njc;
        Thu, 8 Aug 2024 10:19:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTeKI1ZEF6uXh1Ctxf02cGIiZYgznYr6dYAS2VweF73EoPs8oclX33ToEyfZCNyUNZQFq/Wu+YKSA2UIydlQ3aqdRu9e7S
X-Google-Smtp-Source: AGHT+IHdfrsbeqpVmTi+JCUZHzBAmBgUq2G4QqYlOnWtZtrb0z4Cv3ePrNSoA3mTWx51+eoplz32
X-Received: by 2002:ad4:5969:0:b0:6b7:923c:e0b7 with SMTP id 6a1803df08f44-6bd6cb46c57mr38778476d6.21.1723137594757;
        Thu, 08 Aug 2024 10:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723137594; cv=none;
        d=google.com; s=arc-20160816;
        b=oM6kCA7MsnkjGodbGR0P8+3zeUKbQn7OyWoJSqNbIdGC2Hkwz2k15y7aNebs2VL6cz
         C+IrONhbIYpUIMMzPouyaM723frvOx5L9Enfi36pKSGTWgkCQpwo4V53c26tqiNcLwWi
         hTx894ZHT3iUxFd4RLTX/ECaTvDGeDEnSRmNdz+iXRaCdDrmnvT6MDbj1qjeyrBDOILl
         ImfwzaSeYD5F55tRCfvuu3fsnXxJ2jMy3Squ6n4hn57w1kfbKeJ7OKpMi4GadZ1U39j3
         ekI7wWKaCODfkdjDUwbRTyQIXwdf0kyjr8eK/SWxBClP4ebQlgdGDGS8EuJ8l9zX5SRK
         mjKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=hSFWcQPD0C9QIY2I+ufTgtXon5sx/PeH4gb+XC4ZoJM=;
        fh=N5HxHITUWSLOkULx7ITQ8OrnC9xUUIL/vatdVN0Rh8s=;
        b=Rfa1HemcNvpAINkus8lJrZySXTwi599Ow5k2+5VKXXPrziGpPv2l4vpbBGfgyAma25
         Dd+hrsXt4f2sWw4H7xwvcEElkXgs149p6oa1rnrKfs6QbA+d9rvBfTmcGdEaJrcitZb/
         L0+EoclzhmGWTMCbfcK8VOnjqzqtzjWiYC/CUqM6pyuTpEvb3u29eFmOPVyGv+6GVuM7
         Pow/o1iXyZ/JzPNsZ3mNxSNlf+mZmAHcLcAPthQi0nsTusq3PNFD6jr6ZQoKas32lQUw
         g+bfjTFOD1Td2/8iZXjf9xp1yAIb/LgKFoAtbIvsJ86cnW0gel5ADTsgRrht5zLBVkVq
         K2Xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JKDWjf32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb8d05ebsi48814066d6.201.2024.08.08.10.19.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 10:19:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JKDWjf32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc6nj-0001hJ-Ty; Thu, 08 Aug 2024 13:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sc6nh-0001Yp-W8
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 13:19:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sc6ng-0006o2-ET
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 13:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723137583;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSFWcQPD0C9QIY2I+ufTgtXon5sx/PeH4gb+XC4ZoJM=;
 b=JKDWjf32csE6wuJXXxOyZOW2U06YpNdack4dyiNbZ9HuFxElqH0IFveOlgVGslkFG8Xaar
 JOdon6+/B9RuwUnPz+WFt6KBGC0Ra49a4aIB5h6/IDc6bmWjF66O7dhm1bdh6xvHcaGHrv
 Zz8uR9DxZGS5NxYhy7M+E2fqwwwvx9Q=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-492-CM9bK-WRN1OMMdyZpgtynw-1; Thu,
 08 Aug 2024 13:19:42 -0400
X-MC-Unique: CM9bK-WRN1OMMdyZpgtynw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7E4BF1955D5D; Thu,  8 Aug 2024 17:19:40 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.163])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8C73C1955E93; Thu,  8 Aug 2024 17:19:37 +0000 (UTC)
Date: Thu, 8 Aug 2024 18:19:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alejandro Zeise <alejandro.zeise@seagate.com>
Cc: qemu-arm@nongnu.org, kris.conklin@seagate.com,
 jonathan.henze@seagate.com, evan.burgess@seagate.com, clg@kaod.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 09/15] crypto/hash-glib: Remove old hash API functions
Message-ID: <ZrT-JRguOjS6wBda@redhat.com>
References: <20240807195122.2827364-1-alejandro.zeise@seagate.com>
 <20240807195122.2827364-10-alejandro.zeise@seagate.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240807195122.2827364-10-alejandro.zeise@seagate.com>
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
X-TUID: GNwp9/UnRKaH

On Wed, Aug 07, 2024 at 07:51:16PM +0000, Alejandro Zeise wrote:
> Removes old hash implemention in the GLib hash driver.
> 
> Signed-off-by: Alejandro Zeise <alejandro.zeise@seagate.com>
> ---
>  crypto/hash-glib.c | 53 ----------------------------------------------
>  1 file changed, 53 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

