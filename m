Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp275727lfa;
        Fri, 11 Jun 2021 00:33:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvdLde6Lou6SNk8jCPEOmFL0EPOHnpuhGzQ0DwYDEcnZsAuVbcGGX6Y5kQXNfTv351hADE
X-Received: by 2002:a05:6638:459:: with SMTP id r25mr2516211jap.35.1623396814353;
        Fri, 11 Jun 2021 00:33:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623396814; cv=none;
        d=google.com; s=arc-20160816;
        b=yaQLvwEnNGiY2rjk/F0eOe4Sc/yqwKuAqvt561IGHEHUSBAZwS8veHU3ODPzHbc5fj
         lvQHrREXUBPczBGMLCr0G3l/Nk51IBOrfYg2AcBs77JX8K2cZZPoftLDUj8J45iIC/eo
         n08j+E9dUaiD+7SLhrDr8XtEgiaeUzulpnUJsZNgAJLyCdA4uNebrYxnZ/gOxvAFpK+M
         PKbRE5WDi+SMHH4zPol7lj7gJxCxAnyDm5lg+KIJcF5E2a3m7GnN/S9kTmsezddeqPP/
         P6BkDprYyGkd5gOPGyajomf02qlIEzcSo91mBYoY8JpoXjSa3CsRXEhYh9V3/M66DGIU
         B6LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:to:from
         :dkim-signature;
        bh=jmjFBLaVkjwG6BrCxvUlhKotUE/DzCllYD6YFfDS8Z4=;
        b=DTloYriXdSFtgBPbuQEt5rOIdPrHvTUYQk2WFWDllxF55dJ44XCjB0qNryGmdZ3pD7
         NgdIIbytAkUzlbCg94aVA4MpR7DUaihjbgtkc/QqhV9U+I4I4rpdAZHCc1wmnrApdPne
         s+y2y+fJoWPBJjIkUZT6v2y8xHhyFTFYxGPneEnwjuLNwTkM5g5XZNB8bov/XxnYdflu
         vrYnC8DBpavjJIcaDLTdWlEZ86cfH+k6shQiX+f7i4a5X/+SYODuvnl4uZA3M0x3HRcP
         6XcqzyLxjNH3KFI2Dq0RA66WX3jnQYGcZFteoPlU+VhPDkUttESPpaaTYbdIQeK732xB
         nmiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HmwjGVLS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si5098545ila.160.2021.06.11.00.33.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jun 2021 00:33:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HmwjGVLS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrbfZ-000310-Ej
	for alex.bennee@linaro.org; Fri, 11 Jun 2021 03:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lrbef-0002L0-2f
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 03:32:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lrbeb-0006Xi-PE
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 03:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623396752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jmjFBLaVkjwG6BrCxvUlhKotUE/DzCllYD6YFfDS8Z4=;
 b=HmwjGVLS2WhpThk6gXHCPA9wqGCyuyeU+QNBZGayEtiYV1oufU+8i5Zrgik7k3w0o0RJnE
 JiQqE/4k7rCL8lK5v4oUEnbgiCjdn3GGG+NyeOSiGptjxdegxC9Vd2fPWRQFcMzlXUI2QV
 riGPVx3ldZ+34MdOUHFwbthZDpnwm10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-RjYRPoPPNHS2h5bHwC_7og-1; Fri, 11 Jun 2021 03:32:31 -0400
X-MC-Unique: RjYRPoPPNHS2h5bHwC_7og-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C24118D6A45;
 Fri, 11 Jun 2021 07:32:30 +0000 (UTC)
Received: from localhost (ovpn-113-95.ams2.redhat.com [10.36.113.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EA425D9C6;
 Fri, 11 Jun 2021 07:32:29 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/1] hw: virt: consider hw_compat_6_0
In-Reply-To: <20210610183500.54207-1-xypron.glpk@gmx.de>
Organization: Red Hat GmbH
References: <20210610183500.54207-1-xypron.glpk@gmx.de>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 11 Jun 2021 09:32:27 +0200
Message-ID: <87im2kzwj8.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Klaus Jensen <its@irrelevant.dk>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tuNumAVKTenl

On Thu, Jun 10 2021, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:

> virt-6.0 must consider hw_compat_6_0.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  hw/arm/virt.c | 2 ++
>  1 file changed, 2 insertions(+)

Oops, forgot that hunk.

Fixes: da7e13c00b59 ("hw: add compat machines for 6.1")

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

