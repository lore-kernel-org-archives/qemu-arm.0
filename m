Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2241047njb;
        Tue, 30 Jul 2024 02:06:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXj/SPOcPyH8KHfHrptFMPxbmOTZOkzKZhYGa2U++roySrP7kP7KvSRGZ1YQhDSYCXJSDwtZKGsLC0yrUy4s+lemWzHNAo1
X-Google-Smtp-Source: AGHT+IHPrMV7H+yBPgH7bhXFO1z5smwzmM3bP+3KCSxichEyqubv8tyMRip5beyEuWPIHA6/1A4T
X-Received: by 2002:a05:620a:c54:b0:79e:fed9:7937 with SMTP id af79cd13be357-7a1e52c741amr1251744685a.43.1722330362232;
        Tue, 30 Jul 2024 02:06:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722330362; cv=none;
        d=google.com; s=arc-20160816;
        b=SriU0V5ROW98xvXov2X8yRU0H7wpNWUHYuDnxN/e115n73pjTjgO4/5eOWOynskuls
         pO4/FabyMikyXCLe8AJZsu7PIO7ibf6vxzrHJx/PJFqIJcMXbg94ojym3YTLbKwaGbnr
         3KYqMMdYbRQ0ALUJpZzcL74ZsUKsqHoqqt4XCpVqh9VfhGQD5Pc4/GgnE7ldzm4l9a/3
         LyKL1cG9ay5bCCnxd5VR7UhPyoaZgOv0Ha74nkUqzrIfm08hUBYt45jOhXOrvv9vzO20
         uMgaiM/wv3nzGlmLzasDhtm/3mjlWkX7HtwMXyZmg10/obknoizDm98XSUPlrI8zlnri
         k2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=QmvJ7nhOuNxxZ8osbvd0dOI7VfRiguK8Roi861qMoQQ=;
        fh=9hFDqFluQ4K0nkG/6lzcBQr+AmQg/OxQWMC/bennKy0=;
        b=LOkqlyjaN4tpHkjLWy4LjVuXkA5VX/FNeo4ezBhdot9ZoUT515WTMH3HvpOXNdBw0r
         zuNawpyJYcEXMQXiQD9smj4tMZqQmuOWKmPhG1/6Ecca7NZY4S9YZS1wo82ZW4PSUOGB
         W/TXwmiNX0m8fmFpuRsALl+fL0JYQJUhSIJqzsb8OdrXLWdjB44tVatgDhatI1UP7R0J
         qRCSWgXes9LHyPdfdhro4qNWM4QQ/DdCnYzAIHY1Rxvrze3cOD24SEc3D+gVE6qvKBwD
         tFVkoo2ttsrcuNOV8r3a++cDbYjEpbqAhRSM5KsAPf2kg0ONYWHpMoV9EtTCrVSBPFPV
         eYMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FmwuHu5/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe81376a7si117584911cf.1.2024.07.30.02.06.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 02:06:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FmwuHu5/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYink-0005wC-6s; Tue, 30 Jul 2024 05:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sYini-0005pg-Rh
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 05:05:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sYing-0002RC-4z
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 05:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722330343;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmvJ7nhOuNxxZ8osbvd0dOI7VfRiguK8Roi861qMoQQ=;
 b=FmwuHu5/X0X8jtdgJ8KmMfRe9+Lzj3WzTUZJytw/ZQx9PcQBW221IFSLnCAOusPp8oBKPl
 q9Yw1QpsAopeXWfzyDB23FiM5yvF8aN2DpYHS1m6fdzBjcSRJ0vLzNIHqfmZrMkO/1EEus
 WW6mSqRRRO9rpX4eiZVHA00IPOh8CaU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-385-BoRZ3pmpM-qSmoGzOfYTpg-1; Tue,
 30 Jul 2024 05:05:39 -0400
X-MC-Unique: BoRZ3pmpM-qSmoGzOfYTpg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2DCB71955F41; Tue, 30 Jul 2024 09:05:34 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.108])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8DAEA19560AE; Tue, 30 Jul 2024 09:05:13 +0000 (UTC)
Date: Tue, 30 Jul 2024 10:05:06 +0100
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
Subject: Re: [PATCH 16/18] qapi/crypto: Rename QCryptoAFAlg to QCryptoAFAlgo
Message-ID: <Zqiswqkc0Ga754t6@redhat.com>
References: <20240730081032.1246748-1-armbru@redhat.com>
 <20240730081032.1246748-17-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730081032.1246748-17-armbru@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: vFNZy7OQqf+7

On Tue, Jul 30, 2024 at 10:10:30AM +0200, Markus Armbruster wrote:
> For consistency with other types names *Algo.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  crypto/afalgpriv.h    | 14 +++++++-------
>  crypto/hmacpriv.h     |  2 +-
>  crypto/afalg.c        |  8 ++++----
>  crypto/cipher-afalg.c | 12 ++++++------
>  crypto/hash-afalg.c   | 14 +++++++-------
>  5 files changed, 25 insertions(+), 25 deletions(-)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

