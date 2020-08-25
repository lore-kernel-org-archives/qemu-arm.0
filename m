Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3335990lfy;
        Tue, 25 Aug 2020 04:12:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgOkijOMR9nUCIn48PiSmSYOTmrQdYd6xNAIlCTKXCWZE+WSsY5uKl9KqcXMl2Dp6RmiBZ
X-Received: by 2002:a25:cf8a:: with SMTP id f132mr13286999ybg.139.1598353951776;
        Tue, 25 Aug 2020 04:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598353951; cv=none;
        d=google.com; s=arc-20160816;
        b=Re4xfGeuvtdgd2YA/IEwjvMH1e+bkfDSQtFNzfxJV3GFBZrlLgyjQ64nOi4luRv5gl
         QQwRuW0HvpL0uDjCB+d12GMb03Yh8JuykhMWfIuQtYR4GjF6dvDCKhhA+xfUINdI5P+W
         fO7JF2Cv4o2RPwcfyZiczt80m7WMkYWzkiI/nJs8P3RNpkkAkeX+3CbKcQuMwAalk9FD
         Rb/pjI0ZfQ5ny6k5AU3ihLmpAeZJmnqJy4AMeVy7oEiKMHarwIVYQjDILrUdGJ3dd9In
         SQQP5ZBZ3heX3InP/nb3g4iJL5Zvl5bcMxIL+NZZ2Rj0bgWh3rCxemx36BRlCfV6N64E
         yEvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=xB/yNdPerBZeAXz1ulVus+KtYpNCfbOy2SavkQSBh2o=;
        b=yCv+WSfubvgjfXphfdtVWKu9wVX3P2HLqObIyd8OvfRfYwaoZfZXSZSGv4y7/JHsrV
         MRZ6tqCYYZPlg/H+JNr6GaCSMhDQmDP/Pho1Fz6zAD/h3/3K1MxRtkHwezUyhyR/gInH
         RO1cB5bGBl47Zr6i7nSQfJvyT3HmyCYbFZAF7fbVd9OUyTGOE2Ko66ePL9JDx6UELp3L
         G8/8SqDXlJnJhowWio9akwz7vnUJ6fpKHjpMuGEbxO/pd4UU1/7QO8/8GvRseUFq+LF7
         zQERSaKzhhKlJBaJ+uFrFQEuElCr8npmEAJUtomJ/tWrJw7kGeTMjg3yxw89IvBothl/
         rv/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Oe+B6BHL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18si13851729yba.39.2020.08.25.04.12.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 04:12:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Oe+B6BHL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAWsR-0000bR-5D
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 07:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAWsF-0000az-Jh
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 07:12:19 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35613
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAWsD-0004Jf-T6
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 07:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598353937;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xB/yNdPerBZeAXz1ulVus+KtYpNCfbOy2SavkQSBh2o=;
 b=Oe+B6BHLXoli9Kf7zjH4EZ8X/vlDqWB7DzJF8UObWzAFbSTD5CbNAhDNVjmLH+gWv6/QJ8
 T5dzOVr+VGewMHBSG57KW8eHDbPM+N07RvhrHls1kSPq0fA9nThioiOIB3+mqz75QUq/ID
 7WGl/QrXQmxuh7U61OTRWkvOTyC8ST0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-_YpUc_piNoe7BbwnhBYmOg-1; Tue, 25 Aug 2020 07:12:15 -0400
X-MC-Unique: _YpUc_piNoe7BbwnhBYmOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37E62807346;
 Tue, 25 Aug 2020 11:12:14 +0000 (UTC)
Received: from redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFFC61944D;
 Tue, 25 Aug 2020 11:12:12 +0000 (UTC)
Date: Tue, 25 Aug 2020 12:12:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 25/58] armsse: Rename QOM macros to avoid conflicts
Message-ID: <20200825111210.GR107278@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
 <20200820001236.1284548-26-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200820001236.1284548-26-ehabkost@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:35:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U4blaY0nLFkS

On Wed, Aug 19, 2020 at 08:12:03PM -0400, Eduardo Habkost wrote:
> Rename TYPE_ARMSSE to TYPE_ARM_SSE, and ARMSSE*() type checking
> macros to ARM_SSE*().
> 
> This will avoid a future conflict between an ARM_SSE() type
> checking macro and the ARMSSE typedef name.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes series v1 -> v2: new patch in series v2
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  include/hw/arm/armsse.h | 12 ++++++------
>  hw/arm/armsse.c         | 24 ++++++++++++------------
>  2 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

