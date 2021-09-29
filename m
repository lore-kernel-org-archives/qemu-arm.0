Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp466549lfp;
        Wed, 29 Sep 2021 07:49:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFfNBPqUZpoCRZaJpuk18muqU4GHwCNPgDwIyLb25iC2HtR2eOTfb3xmXvCGKhShecZ2s3
X-Received: by 2002:a05:600c:259:: with SMTP id 25mr552256wmj.96.1632926962641;
        Wed, 29 Sep 2021 07:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632926962; cv=none;
        d=google.com; s=arc-20160816;
        b=KSkD3Nz6PQj7N0SqEfn4RMz/KOfxmmsUjfQuXis0BfdIgVJKxhNr4lziHEcNih4tg4
         RlQ1vlJ1ppj6FCSnODUyUINoHBYTjW7w/bZkLXOrCW1jtPvMwazpPlWSRVztnZMG4pmC
         a/NLekxMB63BXxpHpi8tLJ7cedJUvnDsDeIqWhwhdP4YAadHhInyOR1E8B7/OtfUtdpz
         T7kh+cRQrdpizTAljQXPM/6p1AHtsCt6PJstV5JVdtopGRj0C1vBZuzesdLOZfb+vrYN
         RAgb56ovfDI5PksE19C1p7RCI3yZSp20SbqdBM+E6NscTqmq0gC81ZyuJSWKK8cJ1Jqw
         UmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=8sZDAF8XuU6rLTxS3297Fu7JxvfcKkLHK7u672eOrm0=;
        b=IhlkXd7ao2yuH6uN8MnuN4MbbZwwP6K50+c57xjvFNuhARWknw8/kqpd7isBPXYVdT
         zHDN+9CYmKKNkyOB0/35tUd2IulGzd07UakF7oWB5Ql6+X2Atm8oBgoBTIPia6skR6O+
         uk4k4Wz9FW8QPrZnTJYEv9qL+smico0hez11HZaFavAH1zgNR9lXBVW4IlGssVOb3vnX
         OJIiy5XqInPDRtBAGYnRC4zppV2FpwTWF3eJOf/lSjxxUMNA2IQf24+0AbPJp9mroohO
         UgFN5JMQkMGsVHg49bhKHcp5fDBKDAcJTG3hc9hV92KyiyTCxD8JTLMDPuNUegKA5sXo
         F/NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cnOgnKpL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si2629805wrr.524.2021.09.29.07.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Sep 2021 07:49:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cnOgnKpL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVatd-0004na-OX
	for alex.bennee@linaro.org; Wed, 29 Sep 2021 10:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVarQ-0002LC-O6
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:47:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVarP-0001t3-5V
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632926822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8sZDAF8XuU6rLTxS3297Fu7JxvfcKkLHK7u672eOrm0=;
 b=cnOgnKpLfpsMUaqwXI2dHjYfJLYYNiKyGLwX9wH2ti8knYSkg4yLN9NIXJKQevnvS2uPY2
 5UpBV9m7ASVCGUOwkUUYGAfFgnta3zDdOhvjF6xY6TKPXlba+DxelBPPw7Yv32Vsgx1TUV
 GHD4mdeDVrLk+F31Ro8Zw3YO7XU1aiI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-iNOyHhPiOoKa33UB28Ye_w-1; Wed, 29 Sep 2021 10:46:59 -0400
X-MC-Unique: iNOyHhPiOoKa33UB28Ye_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7B6AEC1A1;
 Wed, 29 Sep 2021 14:46:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 227925D9C6;
 Wed, 29 Sep 2021 14:46:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 84D29113865F; Wed, 29 Sep 2021 16:46:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v12 00/16] machine: smp parsing fixes and improvement
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <83769e14-f85b-26bd-705c-498557b26f57@redhat.com>
Date: Wed, 29 Sep 2021 16:46:50 +0200
In-Reply-To: <83769e14-f85b-26bd-705c-498557b26f57@redhat.com> (Paolo
 Bonzini's message of "Wed, 29 Sep 2021 14:39:15 +0200")
Message-ID: <87sfxntp5x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xaXsXUvyUleY

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 29/09/21 04:58, Yanan Wang wrote:
>> Hi,
>> This is a new version (v12) with minor update suggested by Daniel
>> and Philippe. Two new commits (#1 and #16) are added. Thanks!
>
> Queued, thanks!

Could you amend PATCH 16 to drop ERRP_GUARD() in machine_set_smp()?

