Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4719280lfp;
        Tue, 28 Sep 2021 03:14:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweBv3bhCXK3m+1SNjsvfWiR6S18oQ5ARvnL+wsuxCZQzTHnesIvDWNxXfLPZAIrfqV3F2j
X-Received: by 2002:ad4:490a:: with SMTP id bh10mr4656215qvb.12.1632824049866;
        Tue, 28 Sep 2021 03:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632824049; cv=none;
        d=google.com; s=arc-20160816;
        b=tXbdPDq2+mlTvMfJBDvQ1DbeyOOz3AjxPholMKLrjsgQKkeb1vYpuisXht97p9Lx35
         6Qkym4F2ctUJCnU2MPgzGR4jM2GVJfri0aFvbl6zNtcLLWWXoTW1PS5QX1HZt0lTQkxq
         rvffXZ1rj8A/ACG6Ykz96aGdj48V+XUGkiRgY8iB5hLGGqGEgO22HS1Hf+kyPH2YfpZg
         6UK1eq0xVPY5BmAivvV8RWcGDzlXgkZkC3/RMCCUl4GZPuZujupLX1o0sFr6Xd7f16MZ
         B/GqxpOa30sRFX+EWS5uInux7ai1cqkkgOXp8uZX4AvKUvvZKS1dH4Vd1/2oUFCumDZn
         pK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=U+TdXsikdxhvlYULXlz6N4S+pm3TQcLfLaTE5HMjaeY=;
        b=fkfYapHX53kjcA4TEJTrOdyIfCZu7SI0XavlsGT6QwAthSr3S1jSwYVGdta6aHcsHX
         anzwSYPFt1WROyA6ovQCq8AXrTYfRY6MZWcBHnSE+k767p1fG1KVXpWRPPOc+H3Dwu3Y
         T/yYnLBeuNn6rtEiJVHQWHV80ogBTk1tAMENjMTeL7+cw/ADswmVWaasNZeerY3BA8Qm
         1HZ/6OGmqQvZeN2M/AkTc8WFvyzlCDdvqaFTBqlloRs6tYJmw88yCEcpje6LeXH63p7L
         WeYYhAibqf29mTrU+C1W78OwXKe71pHfeiixJpPnsRD5fekh0eDTSk5pbHT5IaE5XS1+
         pEGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZcXXDlo/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e19si638853qte.164.2021.09.28.03.14.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:14:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZcXXDlo/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVA7k-0000Us-4N
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVA7a-0000UY-IG
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:13:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVA7Y-0004i7-VI
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632824036;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+TdXsikdxhvlYULXlz6N4S+pm3TQcLfLaTE5HMjaeY=;
 b=ZcXXDlo//RAz0fQM0js2e5Yc+e11hFRlJCq/jVINjw8891vvJTjtDXWEpDQAlyS15OCgN8
 w47/+58UVZXeV/kTJf32BjMHSVwHSB6PmQQBNBHG2N2W3z+HnszVNpDWJRGK0j9BVSvEhd
 +w8tUNzvPYoyyVGe6gjHP7rOu2p5KRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-tCFTdZPcPf64rVI4kvwFMg-1; Tue, 28 Sep 2021 06:13:54 -0400
X-MC-Unique: tCFTdZPcPf64rVI4kvwFMg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E53F801B3D;
 Tue, 28 Sep 2021 10:13:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E9B8604CC;
 Tue, 28 Sep 2021 10:13:45 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:13:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v11 05/14] machine: Improve the error reporting of smp
 parsing
Message-ID: <YVLq14CwQWB2uT57@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-6-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928035755.11684-6-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2kayjj5YWNgW

On Tue, Sep 28, 2021 at 11:57:46AM +0800, Yanan Wang wrote:
> We have two requirements for a valid SMP configuration:
> the product of "sockets * cores * threads" must represent all the
> possible cpus, i.e., max_cpus, and then must include the initially
> present cpus, i.e., smp_cpus.
> 
> So we only need to ensure 1) "sockets * cores * threads == maxcpus"
> at first and then ensure 2) "maxcpus >= cpus". With a reasonable
> order of the sanity check, we can simplify the error reporting code.
> When reporting an error message we also report the exact value of
> each topology member to make users easily see what's going on.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
>  hw/core/machine.c | 22 +++++++++-------------
>  hw/i386/pc.c      | 24 ++++++++++--------------
>  2 files changed, 19 insertions(+), 27 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

