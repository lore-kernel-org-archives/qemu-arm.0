Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp16419ejb;
        Tue, 25 Jul 2023 11:17:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFn/TV7X8PEe8h8mKdWk4uo+q+YdM732Ly5BqXGu+Ug8N+sewufKHMTI6i8c6vplkwBbdTV
X-Received: by 2002:ac8:4e42:0:b0:403:b9c4:b5de with SMTP id e2-20020ac84e42000000b00403b9c4b5demr4565399qtw.21.1690309075433;
        Tue, 25 Jul 2023 11:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690309075; cv=none;
        d=google.com; s=arc-20160816;
        b=r/5pOPX3SwOpL1EQZN4p+vPfYEJt4HE1KrTfv9fPQzPSp8VoRtiPjSJ8NYaS/EcTDL
         Y8DIE1JCfqo5U/ypFOILKIRWdb3RrW0Ose2TUXIyyoUys307ZlbpiYC+SKB0/h6Uepfa
         10i3QW1R77ecKxsKrDU6PxrE3oqkeHAPY3mcItqI2vqfspgXNhRFL02JDOMzAdeKWVnw
         RQmih7rXnOoJqjtn3RLoEy7bLxmBPrY5Mqb7lYd/aM5LO3CpdlOA5sITtzJmsO3fqZT6
         2aRp17kjNgzlz5vGZYrzaPS4yoHvWwZw+VuJl0IUiNQwz2RVnKKjhGl6Pd/PkK/7Jcs0
         4HvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=TS5EgoV+mKG4MXCBFg/t8wOQyZ2c00sKANAwGRPdhYA=;
        fh=zLQERmDA5TGOuXtIamHC2vUF6ncw0A4+dsMvQHS1arc=;
        b=yhPQsXY8vAC8/dtBBPkuxDjHCjenfA27yMeRYiY7XV+gt41rmVAo8ZdinxaOYPpmbs
         L3jwyV7tC9ng/fBNruFgZ25ayzMl6GjHpgulqgbGkzLWQ8AkbGp8S1eUn4biliWlblSc
         L/1GN8RH5qmyvuWvImIvrdNZon/ly9Oy8AGQrMSSSzu3OqONwjfNhdQOqRYSQBaq8VJC
         JA5imzlNyjEdaRMtFasSfHoGfGeeTJ9/Z8wQCIbPZmnHdUorWQOSxESQYVhHLaw3wXga
         kpw2SmHD7PE4xN37ZEX/czxb2oJk5dgPOyR9GO0qvK6LerW1WQJ9J0MXFKKR6LQRjsjr
         bpnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EyNkEKHE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4-20020ac85c04000000b00403c200aae5si6863222qti.638.2023.07.25.11.17.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 11:17:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EyNkEKHE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOMbC-0004OU-RV; Tue, 25 Jul 2023 14:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qOMb6-0004O1-5L
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qOMb4-0003wO-HQ
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:17:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690309041;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TS5EgoV+mKG4MXCBFg/t8wOQyZ2c00sKANAwGRPdhYA=;
 b=EyNkEKHEcnG3NpQvK113S9bYXPkGQRR1y9mdfO6FiSAXNlJf4ciz8b65OvqOKlYPrK2mim
 zChR//7SZxkjeyykPOXmUxvmyEQtZh5zaNxekgYP16tLG02Tnru/+JqV0sWCg/IUXApUSH
 OdC73y3419kn9FCOnS4fU3wCHACcHlo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-mI-1-uS1Mu2fpistjFnS-g-1; Tue, 25 Jul 2023 14:17:17 -0400
X-MC-Unique: mI-1-uS1Mu2fpistjFnS-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB11B856F66;
 Tue, 25 Jul 2023 18:17:16 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A78A31454145;
 Tue, 25 Jul 2023 18:16:53 +0000 (UTC)
Date: Tue, 25 Jul 2023 19:16:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Hanna Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 1/6] python/machine: move socket setup out of
 _base_args property
Message-ID: <ZMARkwF0ttwndUBu@redhat.com>
References: <20230725180337.2937292-1-jsnow@redhat.com>
 <20230725180337.2937292-2-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230725180337.2937292-2-jsnow@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2kuFBzL904uJ

On Tue, Jul 25, 2023 at 02:03:32PM -0400, John Snow wrote:
> This property isn't meant to do much else besides return a list of
> strings, so move this setup back out into _pre_launch().
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

