Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3548888njk;
        Tue, 3 Dec 2024 01:35:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVk5HRDO0dmbBkkOr/GmsEI6UpcBR7vd1uaFUDje8MpUbRNYCqaEyVY81xw+8g2fMwt9HzThu3OJiwsAg==@linaro.org
X-Google-Smtp-Source: AGHT+IHEVrviF8YXRcyjljx486u2WE1+gVCtYnsuABM85zkVDvJg5k6zCp7bmU4y0KdeKbywOaV8
X-Received: by 2002:a05:622a:8d:b0:466:9938:91f3 with SMTP id d75a77b69052e-4670c73aa94mr21992281cf.49.1733218519589;
        Tue, 03 Dec 2024 01:35:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733218519; cv=none;
        d=google.com; s=arc-20240605;
        b=gQUp8OkfPynGnMw6A7DwASvuM+tOxsxY+Eg3S0T3h4hQ3BNZBmYjarYL1FMTIGnbVF
         CNfnQW/OsbqDHoahTNN7DEpWAdOUVIRENiNEx6IXdU3La9Qc0+t0sqKNP1QTjzStTd05
         s/vrU1z/8cQhb4ZczTdnBXWKLadGFyhuGUzCKxjWEwtiqLPb2PCvtmnE8qvzsOQWmZTN
         lyQkq6lroIQ1gIIBYPNZt+OoGw32ZM4dr/f75Dryhv+kuTYcLfNSlojVb6yLYi6YZbly
         SIF5pXUDf7NXOw+v9zIBfQc59nNY38w+LIQWpJV6A80yUVaeas5f8yUIOsqC0gbOErQh
         iPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=WbCUJ3dVExYB6bKX4zWz/GsJygEsbgGFBQybZmklhPU=;
        fh=/qEdLwlIXb0q9N9NEMDYid9sN9rzPUN7vHyC6Fvo46U=;
        b=CNw94Sg6kjJSSQRwZfBjcXnnO/87KXLaIL53oAJOYgWiKm9c4rGVgSTwni8BoNDUQp
         DZRmkLE5zJyhtVLGavBvbnX7cqWN5wFMgrYhiPBKKbMXk2wKDKl0raLkQBgYkoq23dMF
         XR2Rq9K7cOa0pmK51mzPntMBhBjzs0X05INdz6XNffuFjn9jR5xKQQlEddRdanZMyAfv
         cOSaGQpA6azIdE35YKNFMlTtYU2be9OeV0ZCOp8ihSVBn7XeWQS4RikkOAUEuzCSNwkI
         dvz8p8wJROdEv8zAizR/3Nf98qaz6vD41ubvnC8hmQc8IiFEhW+55wHiDtOv47i4RTuk
         u9Ag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NKUBpypC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4225f2esi158110431cf.426.2024.12.03.01.35.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 01:35:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NKUBpypC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIPJ7-0005WO-Qo; Tue, 03 Dec 2024 04:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tIPJ3-0005Sl-1L
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:34:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tIPJ1-00047n-CD
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733218494;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WbCUJ3dVExYB6bKX4zWz/GsJygEsbgGFBQybZmklhPU=;
 b=NKUBpypCqadSw1HkPh6dKQDSfgYWhEylEksC6LJaflzSr1ThA8h0/FCZfhyj4oLR79zNDj
 BqVhgwFxhGZf2/Hp06SuF3y9gdW27apADUa4GbpApX8sKb79qpXdYrRlQcllOB8TQBvGTh
 rR2wljHgrnYxUXRu1qOiJCFV3MBXLLA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-376-GoRi7I92Ofijny-Oqj7edg-1; Tue,
 03 Dec 2024 04:34:50 -0500
X-MC-Unique: GoRi7I92Ofijny-Oqj7edg-1
X-Mimecast-MFC-AGG-ID: GoRi7I92Ofijny-Oqj7edg
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 508951944D1A; Tue,  3 Dec 2024 09:34:49 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9D3481956052; Tue,  3 Dec 2024 09:34:46 +0000 (UTC)
Date: Tue, 3 Dec 2024 09:34:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/7] tests/functional/test_virtio_gpu: Remove legacy
 '-machine foo,accel=bar'
Message-ID: <Z07Qs1ZiBXPoW4M8@redhat.com>
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203092153.60590-3-philmd@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: SaciwKKJezlA

On Tue, Dec 03, 2024 at 10:21:48AM +0100, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> Replace '-machine foo,accel=bar' -> '-machine foo -accel bar' in
> functional tests.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  tests/functional/test_virtio_gpu.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

