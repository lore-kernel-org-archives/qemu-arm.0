Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4724605lfp;
        Tue, 28 Sep 2021 03:21:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyijVvhAWe8yJxjPQtmzMvelYRy61NE3Js0fmqreeu67nArP+jdfCQmD6VKqDanllqvndtz
X-Received: by 2002:a05:6102:3bcb:: with SMTP id a11mr4156562vsv.6.1632824479099;
        Tue, 28 Sep 2021 03:21:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632824479; cv=none;
        d=google.com; s=arc-20160816;
        b=rHo/w37T4uUraR8unAHcKNVjuL+7UnAFzbYTKbSNEOc7arrnMbCsIUIDq8eFrajRBn
         QtgaisjlCh5SR5xqng1jzidB3K0jUj/u3PohHz6GWStFlDVYpoAzha3U46ugT9BozMr0
         Dl7BqRI7R4AMnZZLLKDlAfS533IAdLs20SV5MEzEdfUqJ84GskNxmf4Lf+/hiyX2vdC0
         Rk65141Wz0wMnGIDMX4QweO7uDMG330g6Jjad30qu2JsCbu3VF6gagVo0vR/h87xyzZd
         NZiHS2nsCnX8U4FwjRyF7HS0HYMOBZaNVLVjcUtWYRRso6m8atTSFBTtWUuz+TnPPNdk
         Fy0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=NjcvWDELkeaNFQanzK65Tfx2zgtUSUIdu/uYkOSxj+U=;
        b=XJr2P4NqpuosoahQL8SmF7Au7HeShfgYZwd4zHZ+uF1z0MqtEXOotXWO2letRJwFyO
         VYTt7VrUE7/FrxHRpS+kevbHQ+aQNI0qGCvqZb8tjvVqq0LTHSpfLfK9pClVb3PVcpNn
         2C5f1bZOETuLKRGOp7kuHU1xiJgI0Iey6cq8uwfpQgtVZ6C1lpuS0nTj7ePq0/UJiXve
         jxiLjqfy/uwYoUIMYMBlNJP7AAwaZ/L7K7Jv3qxQQf7gei41GvlkhVQYLYWNzXFst471
         nFLRE5uTqoRYV9GkQWvp4tfFTR1B5JEoHN3crZ4ukROuxZmjMvkyvo83fn0a2Zz+Acis
         DubQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hv0hCrEN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si10546113vsm.55.2021.09.28.03.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:21:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hv0hCrEN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVAEg-0006l8-C5
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVADN-00065w-PF
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVADK-0001Ae-IN
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632824393;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NjcvWDELkeaNFQanzK65Tfx2zgtUSUIdu/uYkOSxj+U=;
 b=hv0hCrENcVpTXexEQn3Q2h63zEXcXdkEfvRHcml2BVVACRRbkYUvgpIPMDsxdWNJW+ob+o
 c6vK024+TBbqMID2A5dtiBCiACCZLHBZcaDNu51ZB+F97dcvzHmp7Kni5ttaaXxmSeD+mr
 Za/UYrC/r7iyv5YHuQLS5Ygwdtm2LdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-JYNu7j0LM4aFi6dkC7i24Q-1; Tue, 28 Sep 2021 06:19:52 -0400
X-MC-Unique: JYNu7j0LM4aFi6dkC7i24Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43C34801B3D;
 Tue, 28 Sep 2021 10:19:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AABD1017CE3;
 Tue, 28 Sep 2021 10:19:43 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:19:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v11 07/14] qtest/numa-test: Use detailed -smp CLIs in
 test_def_cpu_split
Message-ID: <YVLsPXRora52YtXe@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-8-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928035755.11684-8-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FSDp+kx/TSGf

On Tue, Sep 28, 2021 at 11:57:48AM +0800, Yanan Wang wrote:
> Since commit 80d7835749 (qemu-options: rewrite help for -smp options),
> the preference of sockets/cores in -smp parsing is considered liable
> to change, and actually we are going to change it in a coming commit.
> So it'll be more stable to use detailed -smp CLIs in the testcases
> that have strong dependency on the parsing results.
> 
> Currently, test_def_cpu_split use "-smp 8" and will get 8 CPU sockets
> based on current parsing rule. But if we change to prefer cores over
> sockets we will get one CPU socket with 8 cores, and this testcase
> will not get expected numa set by default on x86_64 (Ok on aarch64).
> 
> So now explicitly use "-smp 8,sockets=8" to avoid affect from parsing
> logic change.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  tests/qtest/numa-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

