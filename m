Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2241618njb;
        Tue, 30 Jul 2024 02:07:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWv0znmUURELI/tAckdH1V8B61hQeBKVsO6BXC1WfLXADeGX7H3DPYr1Irk45XEp7Q99MGAr8Yot1CZUcMAAK2qQQUXJLO4
X-Google-Smtp-Source: AGHT+IH6gDe2gtp2Ng7zY8i7GfulFxRlQ/pG6TlQbEeUKluzeQPDh/h0AT3td6TCbCKiZ+3TupwA
X-Received: by 2002:a05:6358:4298:b0:1aa:d4a3:3d64 with SMTP id e5c5f4694b2df-1adc0472601mr1125437655d.11.1722330461130;
        Tue, 30 Jul 2024 02:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722330461; cv=none;
        d=google.com; s=arc-20160816;
        b=W5Bf/isXQgBspFL3q4uVG2uxwRhxSEKURcTyjqw2eFvIL0CiSEOQPPH/G4Dus2uFXq
         fIv8DL1/EZW+TTpd/Q2YtSHu+boNkbqPZDIi0FxPnT7BzC8P1ZR6Q3ahZw83zhIcHXIU
         Dr106DNr2onD6zGaypW/I0rcNEjs8SWZkxsSKazU3BlzObjCDAQcDRogpJy43yba8hRj
         ePrBLdsKEvBs93A7cyLYENnnQrnbcvaKIhZa0qCDfwHzA//jI1pgFyVKj/sjxhMP7QZe
         MRPPmypknRNXkITa4Uq5GDEmVRonTKWJxW3PVKzpoSemC5ljfx8cIuZYMMW0zBRZ1N7e
         wy6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=8G8Ati8s0mfJIwWhbqO1Cy1v5UKqA95Dovy5TDyMNOs=;
        fh=9hFDqFluQ4K0nkG/6lzcBQr+AmQg/OxQWMC/bennKy0=;
        b=nU5FSIE0uy0er4g/wojy7ARhbqaTTLXmTIe3V+XH1kzqTgplTHXKWLACCqsopVpNrU
         3IrrQo0I1jl9RvSLN0FMsJFGpghU3yDoTIW6N5xSGjfAjxyvYeWd6SEBi0c0RrNJNKcG
         /PEDkgSyIPFDZT2f0kP2r81aEt8KnSPRP/ayNEaZ+a9K2g19msHVboUO/vdwQgQiJxcf
         HVzKkfglcs64VzmuhTcr4/yXowXZ6JlckBdQFKTlP7d57Rh/KgcdW+FIhmuHTCe/rDla
         bK4HojhjHDFrYdFqIBg41iDBBAuSDnHLchJ4t0fLRB9WEk1cutPBJlNfpJk8QdiblwnH
         Mglw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dN0dPk0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3fb0845asi123205126d6.544.2024.07.30.02.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 02:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dN0dPk0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYipN-0005ab-8j; Tue, 30 Jul 2024 05:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sYipL-0005Sv-Om
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 05:07:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sYipI-0002kV-L8
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 05:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722330444;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8G8Ati8s0mfJIwWhbqO1Cy1v5UKqA95Dovy5TDyMNOs=;
 b=dN0dPk0U8pPKZu+ealO4ML1P7lX/WcLPPzzFyKL0h2dASqcUhxaRZvvp8y3mY2NtwBYNzv
 R6nGscO3GIaDMd5SxPa2+xsQ/I+2WS9Bz0MY2tJJx+8dA8FTVYsS94HHuRYeeALwJoxLO5
 eTprdjnIl+bFgdcxNwsqkbJ5WPWFXH0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-524-tl4Lklj9PCCoKtygfp27yQ-1; Tue,
 30 Jul 2024 05:07:20 -0400
X-MC-Unique: tl4Lklj9PCCoKtygfp27yQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A5F001955BF4; Tue, 30 Jul 2024 09:07:15 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.108])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7EE801955D45; Tue, 30 Jul 2024 09:06:58 +0000 (UTC)
Date: Tue, 30 Jul 2024 10:06:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, alex.williamson@redhat.com,
 andrew@codeconstruct.com.au, andrew@daynix.com,
 arei.gonglei@huawei.com, berto@igalia.com,
 borntraeger@linux.ibm.com, clg@kaod.org, david@redhat.com,
 den@openvz.org, eblake@redhat.com, eduardo@habkost.net,
 farman@linux.ibm.com, farosas@suse.de, hreitz@redhat.com,
 idryomov@gmail.com, iii@linux.ibm.com, jamin_lin@aspeedtech.com,
 jasowang@redhat.com, joel@jms.id.au, jsnow@redhat.com,
 kwolf@redhat.com, leetroy@gmail.com, marcandre.lureau@redhat.com,
 marcel.apfelbaum@gmail.com, michael.roth@amd.com, mst@redhat.com,
 mtosatti@redhat.com, nsg@linux.ibm.com, pasic@linux.ibm.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
 philmd@linaro.org, pizhenwei@bytedance.com, pl@dlhnet.de,
 richard.henderson@linaro.org, stefanha@redhat.com,
 steven_lee@aspeedtech.com, thuth@redhat.com,
 vsementsov@yandex-team.ru, wangyanan55@huawei.com,
 yuri.benditovich@daynix.com, zhao1.liu@intel.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [PATCH 18/18] qapi/cryptodev: Rename QCryptodevBackendAlgType to
 *Algo, and drop prefix
Message-ID: <ZqitLrbh3LrI9Lp0@redhat.com>
References: <20240730081032.1246748-1-armbru@redhat.com>
 <20240730081032.1246748-19-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730081032.1246748-19-armbru@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: CKncqnqEFBQ9

On Tue, Jul 30, 2024 at 10:10:32AM +0200, Markus Armbruster wrote:
> QAPI's 'prefix' feature can make the connection between enumeration
> type and its constants less than obvious.  It's best used with
> restraint.
> 
> QCryptodevBackendAlgType a 'prefix' that overrides the generated
> enumeration constants' prefix to QCRYPTODEV_BACKEND_ALG.
> 
> We could simply drop 'prefix', but I think the abbreviation "alg" is
> less than clear.
> 
> Additionally rename the type to QCryptodevBackendAlgoType.  The prefix
> becomes QCRYPTODEV_BACKEND_ALGO_TYPE.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/cryptodev.json          |  5 ++---
>  include/sysemu/cryptodev.h   |  2 +-
>  backends/cryptodev-builtin.c |  6 +++---
>  backends/cryptodev-lkcf.c    |  4 ++--
>  backends/cryptodev.c         |  6 +++---
>  hw/virtio/virtio-crypto.c    | 14 +++++++-------
>  6 files changed, 18 insertions(+), 19 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

