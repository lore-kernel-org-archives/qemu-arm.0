Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2421768lfq;
        Mon, 14 Dec 2020 02:18:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsmyWOyr84iIjfJ5uuyaH6h2ubrmY+dJ2KdFG1zIv8yZccfa5o2/FPvnu1x0q2TGnRbBIn
X-Received: by 2002:a25:7ac3:: with SMTP id v186mr2121142ybc.191.1607941111640;
        Mon, 14 Dec 2020 02:18:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607941111; cv=none;
        d=google.com; s=arc-20160816;
        b=WlcZGJTD8rmpmvUOWYNpJ0UN3uR1XK+021YauVin7LYF+TZtTZ9FlJUKY3sGrnrXEH
         eXEBwtAOEQ8xXRgKnUJ0/jKqtJL2hbMPyOD+eVq+2Jh7GW9VIcIwmDHJ9M4MPnFS30hM
         Pu2Z9OiwhQBbdpXaF5Sdc+0xAzrXqC39zt7ze6atPjTwY+h7o8oo+LnTWnUxx+Wl0xMV
         V49DrzGhTAovKCcX7CQAqIOZxaSJQ5CZ0PGYpXYBu8376kcjvLsdTMN34mJRkPYpHA9G
         FWd4sTTYmU07Whhij9Dzgfze/lDGOjrIPc7jdjb/i1wdWGJeoeUyDMFx0DOnEE+lRuAN
         BoxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rABuQ01f4xN4/9IJkTF6M26zuMCOEKUzY7Y45Txfisg=;
        b=VAufXq5cqmV1tUoA7LfEWwKekmcZ9pSqO71Vxbf6obInohU2cPuiPUs5MDzANSDXle
         xBbj+mzqqUm8L6xZBDoQrQecqBdrQGEWoEQKTuv7uv2UlwhkaQtW/MP3Z/VJMtfZQE5o
         cpfsLTOGCpK37FUbD+wMiAT5fTsD1JFbrLLVSF26i475cP8z0gywnX3xiPV1yJ+4Waps
         g4W+GfV7nIKx/XciFwxXFOy8Yer6A4FCyV+ZUxcdiw1ZYRqB2QIdhpKG/REwlr1Lu8ef
         jO7tHZ0cfof0EqW2BNJzaH37oYj+wWtXbnCxRvvRVLRB91ibKxONV6UbC6+lj/Mmr3/1
         /A6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a2PLLxsc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e124si16700512ybb.272.2020.12.14.02.18.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 02:18:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a2PLLxsc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kokw3-00031d-0o
	for alex.bennee@linaro.org; Mon, 14 Dec 2020 05:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kokvT-0002sI-Vv
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 05:17:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kokvN-0000NR-7T
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 05:17:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607941066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rABuQ01f4xN4/9IJkTF6M26zuMCOEKUzY7Y45Txfisg=;
 b=a2PLLxsc+9H/00znC8uMkWq4/rayE3GY1VgtERCgt6iy5L2na1KPecL0tR1JgSE9rnuMVg
 I0IX1SS9NyoMOjiKouIsCpOYS9tQNCR7+76J/tbeV79OROCYOt6jUpdKZiho2sf7+/oWAz
 N+RJUU9KeB0XAHpy3CGx97Wu1DRduMw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-RJ_o7YxNNZSmDOhJsbT9Hg-1; Mon, 14 Dec 2020 05:17:43 -0500
X-MC-Unique: RJ_o7YxNNZSmDOhJsbT9Hg-1
Received: by mail-wr1-f72.google.com with SMTP id d2so6441948wrr.5
 for <qemu-arm@nongnu.org>; Mon, 14 Dec 2020 02:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rABuQ01f4xN4/9IJkTF6M26zuMCOEKUzY7Y45Txfisg=;
 b=HM8fYn5oh5y9RT9fjpXu4OBCWJzRBI8MxVcLzz0wuCl2QGZh85W5ncheq6Bo4SDht8
 bqU3UtN/elXJMdcY1JVWDuwBTVPZbkIQdqIGe5aF6dUy4IOj4RQ/cLfHgWy3iWZBiGVM
 DiXv9nr30Ejwx5KW+srF1TjTpexO/QDx60UpXMVGUZSWYxnKoyJpYORNcG6aVM/q370f
 vIdsngmUOv8LE4VvKqy/QFTCT2KzGDCnuK4j+EKNoq3r3eJgV10hbD1dIjIxDFOOW+Ty
 te0CQl/5m+V322ZrP2IUKWb+S0KAJlpT19FWKh9g34iBr8qcrORC3bzc/iVVqpfhjsdc
 EkZw==
X-Gm-Message-State: AOAM532ZhoWvIFLtZpw6+kfhFLdGxU6AVigP33lrUIqEWS3SBuTjmqUT
 qhFrLMaVRO42P4GWoiAK1Nm9QejxnFxECKuUf7P4Eq8Fij7/CQjbMKBKYhCX3QxUw4AREBfP7HU
 nPUTTkFt5y0a0
X-Received: by 2002:a05:6000:124e:: with SMTP id
 j14mr22150159wrx.310.1607941061860; 
 Mon, 14 Dec 2020 02:17:41 -0800 (PST)
X-Received: by 2002:a05:6000:124e:: with SMTP id
 j14mr22150132wrx.310.1607941061678; 
 Mon, 14 Dec 2020 02:17:41 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id q73sm31034403wme.44.2020.12.14.02.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 02:17:40 -0800 (PST)
Subject: Re: [PATCH v3 03/13] compiler.h: remove GCC < 3 __builtin_expect
 fallback
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-4-marcandre.lureau@redhat.com>
 <fead8bf1-7848-8809-c67a-e6354e7b5cf7@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e70d683d-7eb6-5717-eea4-02115935d232@redhat.com>
Date: Mon, 14 Dec 2020 11:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <fead8bf1-7848-8809-c67a-e6354e7b5cf7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m91+9XzreH1R

On 10/12/20 15:32, Philippe Mathieu-Daudé wrote:
> On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Since commit efc6c07 ("configure: Add a test for the minimum compiler
>> version"), QEMU explicitely depends on GCC >= 4.8.
>>
>> (clang >= 3.4 advertizes itself as GCC >= 4.2 compatible and supports
>> __builtin_expect too)
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   include/qemu/compiler.h | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
>> index c76281f354..226ead6c90 100644
>> --- a/include/qemu/compiler.h
>> +++ b/include/qemu/compiler.h
>> @@ -44,10 +44,6 @@
>>   #endif
>>   
>>   #ifndef likely
>> -#if __GNUC__ < 3
>> -#define __builtin_expect(x, n) (x)
>> -#endif
>> -
>>   #define likely(x)   __builtin_expect(!!(x), 1)
>>   #define unlikely(x)   __builtin_expect(!!(x), 0)
>>   #endif
>>
> 
> Trying with GCC 10:
> warning: implicit declaration of function ‘likely’
> [-Wimplicit-function-declaration]
> 
> Clang 10:
> warning: implicit declaration of function 'likely' is invalid in C99
> [-Wimplicit-function-declaration]
> 
> Shouldn't it becleaner to test in the configure script or Meson that
> likely() and unlikely() are not defined, and define them here
> unconditionally?

I think the point of the "#ifndef likely" is that some header file 
(maybe something from Linux?) might be defining them unexpectedly.  So 
it's difficult to do the test at configure/meson time.  I would also 
tend towards removing the #ifndef and seeing if something breaks, but 
not as part of this series.

Paolo

