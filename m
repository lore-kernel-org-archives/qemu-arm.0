Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp21507ejb;
        Tue, 25 Jul 2023 11:27:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGpAKstMcxOYAvOh3YGuS5jLzhP0ZOBE+NOwrZl8RG9T9tnnW6ndANtc7i6JnGAT35ujBdj
X-Received: by 2002:a0c:b30c:0:b0:631:ed13:b286 with SMTP id s12-20020a0cb30c000000b00631ed13b286mr3266758qve.26.1690309641782;
        Tue, 25 Jul 2023 11:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690309641; cv=none;
        d=google.com; s=arc-20160816;
        b=E+pwc/o5rrA/9n9FKoUdlkU1X0aHO1QTxnMo2r8jJX3DEPcV1bfQsiwnaYakfUWtNt
         exjEafgRWFSxZzcJ1aGcN45GDEhRsl6ajRZQJRueIxW202qQDI7swADjIo98Wj7fAw0k
         IIlkI0IByQq6wJ2iv4RpnlPb7A1ji18OqKI5nnYsnGg66+vL+xznw8boT4nfJzaQG9I8
         tyBffTWsLsat7PVZjkkfDErsbRKE+2rpZLaLSYqorUnJc6CRJKaKi613wMIZMcebNTK7
         Gk/6KJCPmBdtBiG0ds+9sD8RRDstM4YTV4zwWmmNBsBMiQ3Xl8Jd1zoIiBMoUKBfjNC4
         jX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=A7WNfDsXQcbCcc33ykCWCOzImK2vphd2+XqueZX0J7w=;
        fh=zLQERmDA5TGOuXtIamHC2vUF6ncw0A4+dsMvQHS1arc=;
        b=uuhmpHYcSbCrf5MaWd7gLdxd+dQNTTtH+/2vpa38ORGN5UPSQbw8l3gIwYfO/mb/c8
         H1Dh+ia/+sjVq0m+WENcmdSzPK/z9z5TvcqPHlpn4i+E8Lw6XMWTh3Znz56nWQHfAlJx
         xXLEucwaaOquSBd8CFQF/7dMwU7og9L53qCxp3e2fQNjYDhR8N7qv6w2pEADxYusmJgN
         +EwJYP1fJVqngkyiqQQ8l4jmkWwPf/q73UKyGmmjHs2UOUSEEi4IuGIJPn/VlgHEh/55
         PHWC0gR2q88KGyd/MS+9Pxohyi1TiwlyFT/GE9HTNDI5rgIICkoxT+sDFKNIJaIshQTP
         6Kjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L1ZbABeX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h25-20020a0cb4d9000000b005eefc559ac9si3347515qvf.401.2023.07.25.11.27.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 11:27:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L1ZbABeX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qOMkU-0001pT-Ji; Tue, 25 Jul 2023 14:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qOMkS-0001p9-Bs
 for qemu-devel@nongnu.org; Tue, 25 Jul 2023 14:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qOMkQ-000634-PN
 for qemu-devel@nongnu.org; Tue, 25 Jul 2023 14:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690309621;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A7WNfDsXQcbCcc33ykCWCOzImK2vphd2+XqueZX0J7w=;
 b=L1ZbABeXliTiW+G+LCFIPPh4klxS4WRKZp53cs1O4wSaQlRNXdbEGizdJ7Ymr5wKrRsDgH
 /n89ddT1CuWn4dlGv7ALoHAAhi3y0waieZbtsu2Bflt9VpEFyGKtYyH/xXSicw4IafUx6s
 47m3eP9mIquO6tY6RaXaZnZueOP96J8=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-K8FDq2TVNwm6qhsg0tkcZQ-1; Tue, 25 Jul 2023 14:26:57 -0400
X-MC-Unique: K8FDq2TVNwm6qhsg0tkcZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11B4F280BC4F;
 Tue, 25 Jul 2023 18:26:56 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F800201EC58;
 Tue, 25 Jul 2023 18:26:53 +0000 (UTC)
Date: Tue, 25 Jul 2023 19:26:51 +0100
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
Subject: Re: [PATCH v2 6/6] python/machine: remove unused sock_dir argument
Message-ID: <ZMAT60PpKSIAemZ7@redhat.com>
References: <20230725180337.2937292-1-jsnow@redhat.com>
 <20230725180337.2937292-7-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230725180337.2937292-7-jsnow@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8l9hJ50jca/R

On Tue, Jul 25, 2023 at 02:03:37PM -0400, John Snow wrote:
> By using a socketpair for all of the sockets managed by the VM class and
> its extensions, we don't need the sock_dir argument anymore, so remove
> it.
> 
> We only added this argument so that we could specify a second, shorter
> temporary directory for cases where the temp/log dirs were "too long" as
> a socket name on macOS. We don't need it for this class now. In one
> case, avocado testing takes over responsibility for creating an
> appropriate sockdir.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py             | 18 ------------------
>  python/qemu/machine/qtest.py               |  5 +----
>  tests/avocado/acpi-bits.py                 |  5 +----
>  tests/avocado/avocado_qemu/__init__.py     |  2 +-
>  tests/avocado/machine_aspeed.py            |  5 ++++-
>  tests/qemu-iotests/iotests.py              |  2 +-
>  tests/qemu-iotests/tests/copy-before-write |  3 +--
>  7 files changed, 9 insertions(+), 31 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

