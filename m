Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1681990lfb;
        Thu, 21 May 2020 08:40:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5k6sLaSWIUvtGzyil31uHpA1hPBuQ3x7zIRwGnGSxmxzSKNF2rpHLQGeYxTNgugm2y4Ge
X-Received: by 2002:a17:906:4406:: with SMTP id x6mr4117770ejo.160.1590075600184;
        Thu, 21 May 2020 08:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590075600; cv=none;
        d=google.com; s=arc-20160816;
        b=d4T4b9eEzAeqkYgLcQR0AqRqRB33X06xYEaQ+JCITJR3zcFQ7QRS1J2GxWPV9fRTaw
         1SvuqiR9SjQcqfBV971d/nUDOno7oHCm26ObQwCgtWf+nPzdqsqhInF6SSq1yVQEl/Lw
         Oy4zBP0jQIVIg0yBl9S7GwOaVv2amF9k9n7UnCybWkla/q0T/zbnAZm184NmO9d0DYs0
         YGKo3Amykb2NxHX9TBuVhE0oUqqyz6n9il11g8eUV9CYQOqZUGULsyQuM4t3j1RpOTqK
         jaEXyASsNInU9ZOFbNuDRL44qTdBXm8VSG/MZ3jFgwVYcNRpcz+q27vZlh7D3at9vyfq
         ZYaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=TLBmkzvqLo/2xqTgB3wKYah0MktTnKkMGLnj++PbV5c=;
        b=o/af+tnrZTICylaQKEX4jFHnt9gVZO3OWUlmek0oCIV0OT98x2xv8tk7HK8X7+6i/R
         3d/pN2cogtdknrha751gLE4/MUQhXkYhNLj587qIw0zkMXAUh5ucujecvboWPafTctlm
         /MpyvBExiLiylgSu02AF/dNKoaXlnN82nwPMUlsW5X4p0Ba41mG/d5cy63tFBsuRT6Og
         dyFfxXyhXMLJHqlIhWO3i4WOduBNI9PXRe5S2paTiZ4qWFwrM0B5jM94/qtjsN22G7lS
         DsztzziUnSAZdbKaN9jPgCLMddVlw500P9DjedDNjkvG2fqQqpmoSRJSAIxJ1HtTSy/8
         9bhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=etIi9N75;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id v18si3732466ejb.705.2020.05.21.08.39.59;
        Thu, 21 May 2020 08:40:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=etIi9N75;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730023AbgEUPj5 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 21 May 2020 11:39:57 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32595 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727030AbgEUPj5 (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 21 May 2020 11:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590075596;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TLBmkzvqLo/2xqTgB3wKYah0MktTnKkMGLnj++PbV5c=;
        b=etIi9N75CEkd9r1HInm7mOHOSJgdhpu/PdWMCQbxz/RlIq9jWjXcymp4Z/mJNQQnECFQGD
        kETEkfHj7NLSrNGEJa4o8M1mO8SxBS+zieO95aKUFCQaivL4gLAjTDbLKRFqhoRd7NGrlr
        /KCL0p6yRk71ZRwdf4SUJ8xji78A+9k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-D9yu5iGHP3mF74Z0XcecwA-1; Thu, 21 May 2020 11:39:54 -0400
X-MC-Unique: D9yu5iGHP3mF74Z0XcecwA-1
Received: by mail-wr1-f70.google.com with SMTP id n9so3055760wru.20
        for <kvm@vger.kernel.org>; Thu, 21 May 2020 08:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TLBmkzvqLo/2xqTgB3wKYah0MktTnKkMGLnj++PbV5c=;
        b=cUHpWwWYusTLi1oqs8dmjoDJk9xR2QDXYRusd25oZ243QjmBuD2TwZAxU+vmck9eLH
         l/mVBYPBntFRA88B+foV4ppZre5/uWcBWI+D76dZ2GVLYLXr0mJHwMb29i7o8phzlQ5M
         k1zGzUzRghqLEOakKlWWuP1gpIc/GncGjJi10zoRxhKbklwYLshYw5EBM98VuiNh+8IV
         3g0v3DamtaQ/TeREEb1kpRv1UD1E9PbcDy5KJWQvCK1ytq/sWjzx6XondKGoMsNGt2J9
         WZrYC+gurIW1UiDIiIs2xwOWZEy4FXYzsKjF8Xo5Vp2fF8wIvzX/Hgu0hGmp4xq98BIZ
         lKQQ==
X-Gm-Message-State: AOAM531SchsZ+wvGWWAurQyXzdKEgqV6xv+ZhsrF+FLzhbvEU8xPXghv
        xyNw85y2OPuwQndYbytlUcn67jAKmCtnbJHCD4ScvjQUqSNtLHJWOm5JFiQ7ltoj4n1VWqA5ZfX
        fL/wXvVry3dxm
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr9952477wmb.175.1590075593000;
        Thu, 21 May 2020 08:39:53 -0700 (PDT)
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr9952456wmb.175.1590075592732;
        Thu, 21 May 2020 08:39:52 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.160.154])
        by smtp.gmail.com with ESMTPSA id v19sm6410774wml.43.2020.05.21.08.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 08:39:52 -0700 (PDT)
Subject: Re: [RFC PATCH v2 6/7] accel/kvm: Let KVM_EXIT_MMIO return error
To:     Peter Maydell <peter.maydell@linaro.org>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc:     QEMU Developers <qemu-devel@nongnu.org>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
        Richard Henderson <rth@twiddle.net>
References: <20200518155308.15851-1-f4bug@amsat.org>
 <20200518155308.15851-7-f4bug@amsat.org>
 <CAFEAcA8tGgyYgHXT5LVGz675JMq6VWR56H++XO5gtTrcaZiDQQ@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0c0cbdc0-a809-b80b-ade3-9bdc6f95b1a8@redhat.com>
Date:   Thu, 21 May 2020 17:39:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8tGgyYgHXT5LVGz675JMq6VWR56H++XO5gtTrcaZiDQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Gv6StOWgtzBr

On 18/05/20 18:01, Peter Maydell wrote:
> The "right" answer is that the kernel should enhance the KVM_EXIT_MMIO
> API to allow userspace to say "sorry, you got a bus error on that
> memory access the guest just tried" (which the kernel then has to
> turn into an appropriate guest exception, or ignore, depending on
> what the architecture requires.) You don't want to set ret to
> non-zero here, because that will cause us to VM_STOP, and I
> suspect that x86 at least is relying on the implict RAZ/WI
> behaviour it currently gets.

Yes, it is.  It may even be already possible to inject the right
exception (on ARM) through KVM_SET_VCPU_EVENTS or something like that, too.

Paolo
