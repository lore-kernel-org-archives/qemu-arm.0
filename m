Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp275107lfc;
        Thu, 28 May 2020 00:18:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxf3YUhfku+A0cvgVYIF800OX0ce/vdpFb5F9wl/5TCAQ/S2KfzdDpFoXXEbAyjnBEEr1lF
X-Received: by 2002:aed:2d02:: with SMTP id h2mr1584073qtd.83.1590650292882;
        Thu, 28 May 2020 00:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590650292; cv=none;
        d=google.com; s=arc-20160816;
        b=lJrxGcXeQwvlJ1twbwY6WJ/pbMejAhnCSM8qNqUCZGJZ9OEhpxtlfVlCwsOoMKSuSU
         aOv0XkcLn+QbvvlYKt5kxVFc8L8YcibdNrwagHjGB3b4mf6P9cC9lGoIVwIgFLnmNrEw
         /D0K8qYOSAO1t/faOh6J6d6Z8pFI2BY19FnK3T9SAUn1FgR6tO7ndMCHmleWXoBQzDa7
         bQOTWqpBWj8929oKoPNEVuwFk8IvmzQzmq72abYQZ1ZGNMKnJa6oYze3CLKW9lTvKOyR
         P5clSo28zb5PUcyX+vxJBGdzvGVM+SCrWOWW1ej8k8MYSOfv4yQd2IViQncx4S1HRPrK
         LueQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=uDn845oe5rzTC0g33pc0IdMf7Nz5JE0aUq8WGAWr854=;
        b=JM8pfWoYrqFyNR7sKGQoteap0LWhDJoB+48kbDs72tLLWbRFdgNOPuZj6/vJEUW3VD
         MO2kTrP1UfLfkwDM6SNlRPjFxcxjhjkAkKKr2XVhMlS6J317SWNXky2uHc8LPMri/0WE
         mLLWFiVSr/HpRBrbnJueIjxoPUN9DoLsprFZ0IHLkWJhSBoZH9hMyER4o97jVhLjoDdv
         T/wLRNejy98kMWSYp4DV36PvS1agckHQo38uRUPGB2SCgSR5LhZFBjXjthTS+jf+p/sk
         Bk5RVhoDUGBhZpOT4rdHFut8ekRXV6Jke7FKnPRoFEsNRsmQnHUP735i5w6j4FHU4t/s
         K0pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V1vmr8qn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o126si2310536qkc.152.2020.05.28.00.18.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 00:18:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V1vmr8qn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeCns-0004SW-7W
	for alex.bennee@linaro.org; Thu, 28 May 2020 03:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeCnm-0004SJ-E3
 for qemu-arm@nongnu.org; Thu, 28 May 2020 03:18:06 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38234
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeCnl-0005mW-4V
 for qemu-arm@nongnu.org; Thu, 28 May 2020 03:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590650283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uDn845oe5rzTC0g33pc0IdMf7Nz5JE0aUq8WGAWr854=;
 b=V1vmr8qnCH4m+KmVHDjzVUOw/Vin3tsn5eMBfFV1ck3rtp5pXRi+F/fbcMcy41XvjKHXgj
 5M7kUDtgElXWZRYaOyuDQH2GYIZN958vdDHYcv9ydDSa0FnIR/PXQYShYsEr/54apx8QhT
 PY7IF6qYEQJfVzgmCZoei9FBz0h5bG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-lLNlJYj8Paqm5HLegUm4xQ-1; Thu, 28 May 2020 03:18:02 -0400
X-MC-Unique: lLNlJYj8Paqm5HLegUm4xQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 027E718FE867;
 Thu, 28 May 2020 07:18:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0533060C05;
 Thu, 28 May 2020 07:17:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2C1F516E2C; Thu, 28 May 2020 09:17:52 +0200 (CEST)
Date: Thu, 28 May 2020 09:17:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 14/22] microvm: use 2G split unconditionally
Message-ID: <20200528071752.lqbvhazxta3fppfp@sirius.home.kraxel.org>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-15-kraxel@redhat.com>
 <20200521112921.641f12bb@redhat.com>
 <20200525114508.hhvyzjiqja6knz6l@sirius.home.kraxel.org>
 <20200525183615.5f8e67d3@redhat.com>
 <20200526044839.bncj6iltugnzgfmy@sirius.home.kraxel.org>
 <20200527142545.32e91049@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200527142545.32e91049@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 02:50:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tyq/zaxSVfaF

  Hi,

> >   (1) we loose a bit of memory.
>           it's probably not a big enough to care about, we do similar ovarlay mapping on pc/q35
>           at the beginning of RAM

Yes, shouldn't be too much.

> >   (2) we loose a gigabyte page.
>           I'm not sure waht exactly we loose in this case.

The 1G page for 0xc0000000 -> 0xffffffff (as explained by paolo).

> >   (3) we wouldn't have guard pages (unused address space) between
> >       between ram and mmio space.
>            if it's holes' mmio,then do we really need them (access is going to be terminated
>            either in always valid RAM or in valid mmio hole)?

Not required, but more robust.  Less likely that the guest touches mmio
by accident.

I'd expect it also requires some e820 hacks.

cheers,
  Gerd

