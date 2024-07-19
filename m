Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp349798njc;
        Fri, 19 Jul 2024 03:03:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3k9DIPqDLDgMo3n6q/vWNZEAHoiTm7pCDQDqn8dx0iBeDV7P0qTpNpev/c0NnulZbMxzEHiJZTGnzm9GhLkhsWWEDsw6u
X-Google-Smtp-Source: AGHT+IH8+CdB+TBOJ93s4ABhhU475SLWYhR76ABOzdY7RDg723r7U4q3DfKZhExS1NqL4aWhYvMC
X-Received: by 2002:a05:6214:5284:b0:6b5:7f22:d7ca with SMTP id 6a1803df08f44-6b79c5e5e8amr63431936d6.5.1721383410848;
        Fri, 19 Jul 2024 03:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721383410; cv=none;
        d=google.com; s=arc-20160816;
        b=VWXmitI+52mW3cHyR90JW47gXEOd48QuhyXlmYdWXGFut64KoAkjY12VCzAOR1Yau8
         d/gup7keR48LBD+qVgm20SYSC/KVqQmgxDejlu9siSDcmcp5MhjqQ2A/+faAcCHG5eI2
         2EdbFv016Ccb5Ufa/4h2SvOzsGUeOYjGviZkuJPEwKtAvnsvIH1/+S6qzoRvqQalyLw/
         /pMbJ+JcIPop69ws82hi3MODWzsQKgathKiupkVraDDYMk8dmgeCIeGAPlDx98yTyKYN
         DNZjIC677XEST2fp/N7iLoUmTxC7rI0fJDphEld2Cx9QN8wK/FGQOdHH8Ajfz6T+QGOD
         f6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=K+s9Jc46BqcHR3P1ps+6GQNpOyAL1kSrVyfQEmyBtTs=;
        fh=PzN6pfa562tukKPesix/syz6BFDltbdTYLDAWJ5C41M=;
        b=QLOI25cLUpsH15JCeydOcATi+OjlOQm11eYgJo2ggks7PMjQHeYtBqsytNlzWL8Bwx
         nHgb2kKvgQpzOkWw0O2iuml3AL46Kg5lXH20ZTdk5Ke5afB3Paqwg/8YiXs6crYWAl2F
         QMpvzKS6thASZ5ZCocDpNMZZFZ+YJ1vTPJLUUKqv2g/7xP/cTvqLTXllA3XeRH/jYdv9
         iFODhrBqwi8Kn4OCYyxvXF6x2LHplMyE8qOQQYJwl5qWvfHg/mAdKoOQFfJE10Gf5ZNo
         o73a//fRDE/aRwtTaHSJO9xn6ZZ8iVkDpKi1IgZAXMLcO37yDKd8mf/bTMWiXu7gdSYp
         DnFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fg0hMLci;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac7a0b9esi11453376d6.9.2024.07.19.03.03.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jul 2024 03:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fg0hMLci;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sUkSK-0004cG-Ro; Fri, 19 Jul 2024 06:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sUkSI-0004VP-RD
 for qemu-devel@nongnu.org; Fri, 19 Jul 2024 06:03:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sUkSH-0001YL-3S
 for qemu-devel@nongnu.org; Fri, 19 Jul 2024 06:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721383391;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+s9Jc46BqcHR3P1ps+6GQNpOyAL1kSrVyfQEmyBtTs=;
 b=Fg0hMLcimgPUnTaiqmfBrtvH5N4v4gQHWdIG/TuXjD2pGZCNpxPtUTUrpUqZv7ydcMM5i7
 MxrJ82Rc6vgaTkPlN8uL8LvIky1h19IjZ08sZe1LaarG2YcxKmpu+VTMYBo4/Dpa0fDICt
 JP2Q3L2wlg5FOoE5eXf9JNlq/a2Wbk0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-360-K0U_C-wQOlmVMcSlXi4uUg-1; Fri,
 19 Jul 2024 06:03:10 -0400
X-MC-Unique: K0U_C-wQOlmVMcSlXi4uUg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B1EC31954128; Fri, 19 Jul 2024 10:03:08 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8265719560B2; Fri, 19 Jul 2024 10:03:04 +0000 (UTC)
Date: Fri, 19 Jul 2024 11:03:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH] tests/avocado: Move LinuxTest related code into a
 separate file
Message-ID: <Zpo51BC-DfrUOHIk@redhat.com>
References: <20240719095031.32814-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240719095031.32814-1-thuth@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9MN+uxX51AZZ

On Fri, Jul 19, 2024 at 11:50:31AM +0200, Thomas Huth wrote:
> Only some few tests are using the LinuxTest class. Move the related
> code into a separate file so that this does not pollute the main
> namespace.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/avocado/avocado_qemu/__init__.py  | 239 +---------------------
>  tests/avocado/avocado_qemu/linuxtest.py | 253 ++++++++++++++++++++++++
>  tests/avocado/boot_linux.py             |   3 +-
>  tests/avocado/hotplug_blk.py            |   2 +-
>  tests/avocado/hotplug_cpu.py            |   2 +-
>  tests/avocado/intel_iommu.py            |   2 +-
>  tests/avocado/replay_linux.py           |   2 +-
>  tests/avocado/smmu.py                   |   3 +-
>  8 files changed, 262 insertions(+), 244 deletions(-)
>  create mode 100644 tests/avocado/avocado_qemu/linuxtest.py

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

