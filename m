Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4737141lfp;
        Tue, 28 Sep 2021 03:39:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxndNmqDU9tTK5zKuu2pP1JCF5zPDGkH1hYooirwIJY6/xG9ghBoyaI1T9Gpcw7haCjjj+h
X-Received: by 2002:a5e:d808:: with SMTP id l8mr1893796iok.212.1632825551823;
        Tue, 28 Sep 2021 03:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632825551; cv=none;
        d=google.com; s=arc-20160816;
        b=sODGHts1VTIdhvJ51qEQPDIRUwKB4Hbz8yXJsi2CtbqFL3JA/h4E9orst8HtIBEZ2E
         4VqlpZolDQehaHR8SIJTS41S66KT5p1iUipxpND6/ZFDunnqPNAdAmBkJuTA7Q7y2G7s
         x+qbJJfHWi4NH6Dq61/YFqLUOQvcRHdNoRupTU4pbKG9g4MLMk0SiBP5DEAE0ymMmXQs
         tPoKb5bnQEgcdDvMCtLiugitq4pru/6MDkx+Fd6lM8FmvLBdTzKeltl6eh0DwUPocMGH
         XM9E9wZ7ROXJvEGmHVZcAdhRF58ujJabDhDi+NUgQ8cZQ3l0331Jhs2AiIyibUK6Sr0f
         SVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Q754W3e8bSD4JzpHmIF0NGLgtctxEU7sQ5ZmeU8GZe4=;
        b=xNooJdoMlcwGr3b6M1sox6Z5ebeE4Wy2DfEwGN1WJ6O/icjWLUd8jQi6NZ3FzqM0rn
         5zsm6AYtmLIZTNPKpppMt8KKY3qasjnz61dJ4EirKD8x8yC/PWEc+ijexQR5fOjsdTSo
         DSdrK27MM12hQ+REAlkNfODRwNRpRwJmka20kfgt3TI8EDvZGvMrLMvjx66mKg3AgvVg
         +v9yEsHWnCafNYQYsB+zQF+nmDfqQTMQ/5nDIoes16ImgHRx5Gpvz+gAWYD564hk6sqU
         RhY4wlZISozk2jlt3rS+H78KHYr0VRcFGTlNZFh5DS3SITHkuP01+NdBbOgBc9xggS28
         tDKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dPT1D1P9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6si22962908ion.66.2021.09.28.03.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:39:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dPT1D1P9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVAVz-0004ec-43
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAVd-00049R-KY
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAVa-000052-GG
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632825524;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q754W3e8bSD4JzpHmIF0NGLgtctxEU7sQ5ZmeU8GZe4=;
 b=dPT1D1P94PNCzozad9TZ0khSeUd/ur+iPES2Wooz5yA60bnnYhgx8yR/Yg1xQ9aZsyAyKn
 yk6q62eJvwR/imaO/jYlqXnqR0w/t2nEC7r1Q2A8T2YaqBNdzZhUo4cIkgh+9xsp6BAQ6n
 +J2adG7cEgS85bBklRcFKwUkXwcxQwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-uKFWZ56tNR67GZQikI4HlQ-1; Tue, 28 Sep 2021 06:38:43 -0400
X-MC-Unique: uKFWZ56tNR67GZQikI4HlQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5752E18125C2;
 Tue, 28 Sep 2021 10:38:41 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF397652B2;
 Tue, 28 Sep 2021 10:38:09 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:38:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v11 14/14] machine: Put all sanity-check in the generic
 SMP parser
Message-ID: <YVLwj0c2hvsESDxg@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-15-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928035755.11684-15-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6Xob+ONMuYqx

On Tue, Sep 28, 2021 at 11:57:55AM +0800, Yanan Wang wrote:
> Put both sanity-check of the input SMP configuration and sanity-check
> of the output SMP configuration uniformly in the generic parser. Then
> machine_set_smp() will become cleaner, also all the invalid scenarios
> can be tested only by calling the parser.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
>  hw/core/machine.c | 63 +++++++++++++++++++++++------------------------
>  1 file changed, 31 insertions(+), 32 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

