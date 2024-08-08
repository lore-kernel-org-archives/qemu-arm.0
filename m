Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp595561njc;
        Thu, 8 Aug 2024 10:24:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVl6FA0JwGXnGHIHguq+aCq/wc/Uul9vpGrceDxwnG0SIPtrJhcfpD3OaW8i/0jsKRc/gK4TtOJ1h2eLHbxYmlVcNDz7hxE
X-Google-Smtp-Source: AGHT+IEbrv8A2DQKLEXIJ1KW0PSKMwwY64FXp43D2C2arHywFCKQIORK8eJGmDgY8/f+zv2UUnCX
X-Received: by 2002:a05:622a:6183:b0:447:e713:c942 with SMTP id d75a77b69052e-451d427fec4mr23396461cf.23.1723137857480;
        Thu, 08 Aug 2024 10:24:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723137857; cv=none;
        d=google.com; s=arc-20160816;
        b=PkrL2ss6e4UznapqDqOxkKKNTp1Vjt/EZxZfskzpQMW7O0Vr3tfZcvvkQi2D2Kem0v
         CS1ZZUgeDUkKwSakrDj/8oZ+dl+JytXvhsIQmuO2GbtY9aOoSR7lGH+NkZCWO6IAvD0P
         ajHozjYG0pjSNndCMjd8VHDs2n5SMzG8bGl5Cd2Fju9zQWyGajSxWh4HdZuSTTHlADer
         np3cGlc9aVgYI7cJ+jDo2hH0XRzfNTNCNPc/ybc21oo6FqmL2HruJrbUEYuJAQoYaDAg
         axACr4nv6M6LY7wqZbTlkKiM8W2l+BVZWVBs1X86cgQ7CMrJ9xyj+EK/BZ0DmhjLelYz
         Tktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=jxHzMH4m8XCdk7TwL5WGYLiCXUnUazVoRzIrRnoBfMQ=;
        fh=N5HxHITUWSLOkULx7ITQ8OrnC9xUUIL/vatdVN0Rh8s=;
        b=JDSvUOaGTrbM6F3SUaXxgLVXr6l6mQldFHOfmJjxgh0wqFHlINAHUyry314toiarss
         X3VTt3VTGiP0sy8B8hX8bN+buIDkqnhxN9o5SP7Eolx/KKnHyzIfqfb56RPipGrTNj4b
         3elZ49aEUndDE5+c7gf29mHgNaWyVugBB49LgubQwrNdubrwSHo7u887hSeVzMeNRcHG
         1Xkj76DwvdkmSXc1xuc16yV1O/cM5eT16RKZW3/yh+HeomAN9wdm+NKtFTSrDLJbLcx0
         R+CJvL0wXqTHJFsVEnYzUZlcm2VKZxNFFaRx++olQhBXdvbJ6/IwXJCdn9nyEZLlVgZV
         SK8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GxOGuZz3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-451c87d8f8dsi45566181cf.310.2024.08.08.10.24.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 10:24:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GxOGuZz3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc6s4-0004LO-1N; Thu, 08 Aug 2024 13:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sc6s3-0004IB-AP
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 13:24:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sc6s1-0007Zs-Mq
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 13:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723137853;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jxHzMH4m8XCdk7TwL5WGYLiCXUnUazVoRzIrRnoBfMQ=;
 b=GxOGuZz35puF2k9RMrjAW2ktfEWW4QFvSkHbL5ulVTBxRlCb/iQhsJzUj+pEQ6BfPNLAlA
 sCT5izhceluNXcKOI2kuyVSBBUhG/P04Psic29ArolXXfTQ3TdMqIJGyp5RXrIpWrIr8BC
 YSNOYWAy7XTeLT9kWyNZ16fBQ2qcM9M=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-RprgvvtZN_ewkcvB-PWc4g-1; Thu,
 08 Aug 2024 13:24:10 -0400
X-MC-Unique: RprgvvtZN_ewkcvB-PWc4g-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 435381944D38; Thu,  8 Aug 2024 17:24:09 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.163])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8DF5819560A3; Thu,  8 Aug 2024 17:24:06 +0000 (UTC)
Date: Thu, 8 Aug 2024 18:24:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alejandro Zeise <alejandro.zeise@seagate.com>
Cc: qemu-arm@nongnu.org, kris.conklin@seagate.com,
 jonathan.henze@seagate.com, evan.burgess@seagate.com, clg@kaod.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 14/15] crypto/hashpriv: Remove old hash API function
Message-ID: <ZrT_My5f7WlsMAMI@redhat.com>
References: <20240807195122.2827364-1-alejandro.zeise@seagate.com>
 <20240807195122.2827364-15-alejandro.zeise@seagate.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240807195122.2827364-15-alejandro.zeise@seagate.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: s3JBKntetSSS

On Wed, Aug 07, 2024 at 07:51:21PM +0000, Alejandro Zeise wrote:
> Remove old hash_bytesv function, as it was replaced by the 4
> new functions.
> 
> Signed-off-by: Alejandro Zeise <alejandro.zeise@seagate.com>
> ---
>  crypto/hashpriv.h | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

