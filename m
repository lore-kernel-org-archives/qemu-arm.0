Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5955608lfb;
        Thu, 10 Dec 2020 06:33:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxRV8FAi8SzsF8D1tkcY/JkEEqcfV01H2G7KadWlc2D2LoNgb/8RTLp2jQGcorpL1kXmhp
X-Received: by 2002:a25:d04b:: with SMTP id h72mr12315519ybg.523.1607610807094;
        Thu, 10 Dec 2020 06:33:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607610807; cv=none;
        d=google.com; s=arc-20160816;
        b=xvXBad9iBSsitaIGrBFtF8MTIxZncLLxwSPQWJFbhL0LfjBpxIm/LnHJYON/EyYgPh
         ulhmKL+Up5Ig1EBj2NFaMTVCsjxQQntaNm7hlb6ufQoDfyj3o24TNWOlqqVYekDr9lN7
         Klkk6Zp6lpmM4vqn/hCWVwCfVox36OhQDVZ9LDH2J5SqmgALJnM9wiBJ+2Ba0XYo1/CP
         ncB0c0TsECVOzffvc59qzylpBm1jkNArHesMSBK7Hff9H8F82Kjdd/j5F7GE/1Cdx1UN
         R+fBOOzlDiOnZgXendogmDpBPiTK6k15CyaIzAlpgcleSKxGkAtfutVxkEig445xpKbR
         XPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rtNjAtow8SQkrLmz8+XRRA+YtRhz+KF6e43NFXvxDSI=;
        b=EQqx05nXSedgSEOFPXETKDLWVcsSTkielxfsktX0wbzol49i00myD1FZXcAWqtc3PP
         xSDapdNLQmlt2e0BC/XALkgOiOF75oGF3iO8C7IS7QWcsjZeA9KAFzX9+xNFPp2FqFYH
         3kesoV0nqXOhzbo0/G8puUpkMJnQ6eK4kOHLBdEDAHYZlodAI28U5JBWSVYpewADuXw3
         QzJ58u8/UPNvUJnsfmv2+DX15RYO+BE+pP4GoLt89vj3m7KaAmj/dkALDr2X7ePFD2YG
         ZZvKQfZmTV7AanTyezHVKcX9YU9+G6RIJs6NHoktgcNsFRuzWGTvceN+afLdRWxvmuJ/
         T1eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TWjFleb5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si6153494ybe.234.2020.12.10.06.33.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Dec 2020 06:33:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TWjFleb5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knN0X-0004WR-VV
	for alex.bennee@linaro.org; Thu, 10 Dec 2020 09:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knN0I-0004VA-JO
 for qemu-arm@nongnu.org; Thu, 10 Dec 2020 09:33:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knN00-000140-NB
 for qemu-arm@nongnu.org; Thu, 10 Dec 2020 09:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607610771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtNjAtow8SQkrLmz8+XRRA+YtRhz+KF6e43NFXvxDSI=;
 b=TWjFleb5lvlkK2DaUKlbuIvAhYTHiiLwdUAgNzmAEBa4twQaCFMYCke73vmbl9Vi5UT0yZ
 25MSrD3Vh2weKk/n9sZD4ASph1LNyQcNneNxvNd+lim2WsPigP1NfE/z2WT1i1uLkXNfX6
 9XfC2KQff5rBV+aI3JZfKFUyIMKe6Ao=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-i5vAOFmANiG3a-k6WDItYg-1; Thu, 10 Dec 2020 09:32:49 -0500
X-MC-Unique: i5vAOFmANiG3a-k6WDItYg-1
Received: by mail-wr1-f72.google.com with SMTP id w17so1997658wrp.11
 for <qemu-arm@nongnu.org>; Thu, 10 Dec 2020 06:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rtNjAtow8SQkrLmz8+XRRA+YtRhz+KF6e43NFXvxDSI=;
 b=e3VtkYq2lEh0yRibeTn3JcCKZUDLYHVd+bGoTpof002kehBKdV5yPmV3qfdQZNi7Ww
 0H/AGp0iJGTSKqvrX4oPo2gH5EjCr1t80OfACsyhgfty0IUXl9ZesHx8r1MClH33Q1MD
 w3omiPzf5kyuha6sZeftr7uxu0NO2zlFtr0OqkC6B/OvS+8dUbogLySjeqQ+w1a7JfhZ
 71P0EmfVKwT4wq45ZK9I9vjDufHXr6tSauWlUHDctgkEcQcsvF1Dy/vDcW9GT+5V5oOH
 odW8bV4UvjLqXeaeE+X1Bq/aFjobPmNdg64bHKwnPM/ij92gi9wlsYu1bVkp6YAtm7/v
 nJ4Q==
X-Gm-Message-State: AOAM530K4iOlozE0UCS5xEFohniQop+cJDiDg6AeoOLY9XxFUFpR7Mni
 Q10Fs/gmmSO1+Co48ZL/M+wBbJT4YL9mjE9sgx1Z/Ga4I5EDVTFes4StUMycixBgHcU7c3xChen
 uxZdI4kY1WkuR
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr8855728wmc.185.1607610768400; 
 Thu, 10 Dec 2020 06:32:48 -0800 (PST)
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr8855692wmc.185.1607610768234; 
 Thu, 10 Dec 2020 06:32:48 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z13sm9898753wmz.3.2020.12.10.06.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 06:32:47 -0800 (PST)
Subject: Re: [PATCH v3 03/13] compiler.h: remove GCC < 3 __builtin_expect
 fallback
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-4-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fead8bf1-7848-8809-c67a-e6354e7b5cf7@redhat.com>
Date: Thu, 10 Dec 2020 15:32:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-4-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IUy1Vp4s0RaF

On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Since commit efc6c07 ("configure: Add a test for the minimum compiler
> version"), QEMU explicitely depends on GCC >= 4.8.
> 
> (clang >= 3.4 advertizes itself as GCC >= 4.2 compatible and supports
> __builtin_expect too)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index c76281f354..226ead6c90 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -44,10 +44,6 @@
>  #endif
>  
>  #ifndef likely
> -#if __GNUC__ < 3
> -#define __builtin_expect(x, n) (x)
> -#endif
> -
>  #define likely(x)   __builtin_expect(!!(x), 1)
>  #define unlikely(x)   __builtin_expect(!!(x), 0)
>  #endif
> 

Trying with GCC 10:
warning: implicit declaration of function ‘likely’
[-Wimplicit-function-declaration]

Clang 10:
warning: implicit declaration of function 'likely' is invalid in C99
[-Wimplicit-function-declaration]

Shouldn't it becleaner to test in the configure script or Meson that
likely() and unlikely() are not defined, and define them here
unconditionally?

Regards,

Phil.

