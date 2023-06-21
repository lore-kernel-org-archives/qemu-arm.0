Received: by 2002:a05:7022:ef18:b0:66:7a29:38e1 with SMTP id qy24csp3802555dlb;
        Wed, 21 Jun 2023 09:39:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7gASgznZ3dda1Q0HasdK8xpimtAOaELBBQT6sZTzbXPyuCMJVfMW1esGvSo2Tg4CyjmfA0
X-Received: by 2002:a05:620a:8dc8:b0:762:4405:a981 with SMTP id rd8-20020a05620a8dc800b007624405a981mr10708090qkn.26.1687365547722;
        Wed, 21 Jun 2023 09:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687365547; cv=none;
        d=google.com; s=arc-20160816;
        b=VGmZkLYp/4c/p5ZeY0QqT5EoCckPiQ8Bgz64+9Q6eWPVUH344air1qcAadHFHRWx1z
         AOj64jjqcXAoU8QQv5BJPWCSRJEe1x4Gc5tSvoliGkvPM/KX1wCx3uwwoqR4mvjz04+n
         B3owdA2gGLYCgyC9xyCP+5L2EA53R2yGwHqDnlSACJaTLkyUF86W8/gHHICM/jPGD+3K
         Wi6u8k3J50UvhDBHpGGaNKRU40kTKsEIIKBWA9wZpLwTyXlrq8WNpHg9/WD3eqY4c4P3
         rvfsWX3Zqv+sDl+MCvamnWGBtM0ObIJjUSoQNAivH83o6zu0ljXDsrwUV24ockSos0Dq
         nTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=QooPdPxGTJom9bQce6QKQkbXbajmlCADA4uPFT9ImnM=;
        b=es5Dnbji62IWZIWHc03P3mHZS7Ns/waAXiOSYBF0ygY13Tm+90kuHOBmuIJPRoObWS
         Dp8S3+kMioqIaF/G4kVKvnfqQbizUco0jX9NxIJHhbVbfDW+Tf1sjaIcrC+tJ/lkBH2z
         akiw4F3D79mgfI2rUK4RalB75GfFxbcyRLBjkQ/KYdawjbdW/fSJhZYtU87kSYYK3hE7
         N8JG7SmIE95HYO/91Y57zD6osE00e0AO6iO70ThphJOw89e9m6dlqONhEStLSXyfzDRx
         lugn7xN/d+W0uyL4IgpnnxJJhOwK+mdSeJlfkzJ7vxdjt3zuPS1AOB9WUbqKQJsFVmab
         pBlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bdKqwtTm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020a05620a074700b007627e13cd77si1862875qki.112.2023.06.21.09.39.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jun 2023 09:39:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bdKqwtTm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qC0rE-00026t-RE; Wed, 21 Jun 2023 12:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qC0rD-00024P-DC
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 12:38:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qC0rB-00024O-T0
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 12:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687365536;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QooPdPxGTJom9bQce6QKQkbXbajmlCADA4uPFT9ImnM=;
 b=bdKqwtTm1iG1yBlyhT1fMH+Aij/K3z80OqRYU0LpBrhr7TmLH7VPG6pJaBbRaxwYV6eqG/
 UELyjkw98+tqRGwagdcQRoMWc+B3nHp6g+mwEKwo6LVrMIKqRonoRb7tiRV7wsQF+NWJ1m
 97Q9foYHf6D5cKyvHiN0zakanaxJbWY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-9Hxo7_SYO1yCuWjr-AMp9w-1; Wed, 21 Jun 2023 12:38:54 -0400
X-MC-Unique: 9Hxo7_SYO1yCuWjr-AMp9w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A5AA1C06ED6;
 Wed, 21 Jun 2023 16:38:54 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CDD2140EBB8;
 Wed, 21 Jun 2023 16:38:53 +0000 (UTC)
Date: Wed, 21 Jun 2023 17:38:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 11/37] crypto: Add aesdec_ISB_ISR_AK
Message-ID: <ZJMnm/ziySmKWYVu@redhat.com>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
 <20230620110758.787479-12-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230620110758.787479-12-richard.henderson@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: fiN3iE3+zKIY

On Tue, Jun 20, 2023 at 01:07:32PM +0200, Richard Henderson wrote:
> Add a primitive for InvSubBytes + InvShiftRows + AddRoundKey.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  host/include/generic/host/crypto/aes-round.h |  4 ++
>  include/crypto/aes-round.h                   | 21 +++++++++
>  crypto/aes.c                                 | 45 ++++++++++++++++++++
>  3 files changed, 70 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

