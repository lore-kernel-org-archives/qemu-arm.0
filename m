Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2825015lfg;
        Sun, 21 Mar 2021 06:37:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvq5mhcxFrCXsSk41DcnaB5h4D/2/jcU1SKlJMAjt3g5YiyQWmpxruOAK+xr8RWaosjIXh
X-Received: by 2002:a05:6e02:1bc2:: with SMTP id x2mr8162547ilv.205.1616333846129;
        Sun, 21 Mar 2021 06:37:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616333846; cv=none;
        d=google.com; s=arc-20160816;
        b=Uj6i8OzHom0qmOQTRLUUwOD8zHi5CuzRmHHjlZcNLNfemUImNW5Yg7MTAF5fKvO0+s
         PIIKreRTZBU0mJdvx908l03IzNtkU4PwPeoN4DDm2ehBxQ+EQQCOHPFmIThOqafPlr9e
         RiNwLAduku0xqh+Jzd6MZ7vfO2n6kXvDDFNIHWHvIc+0LSMlT4VD2EWD4W/RiFDCZpr+
         JQvzpJgIf9qFgsrom3CuyIERK6BgjH6jFc0QgVOuoF8WeK78mnxjus5/jwjWImWxykAH
         CWWLH0pDHlNH4SCmIj3jqKYD0fLxsDM7M2XJRFxMXu0G3SFy7siyvKQ6xJaffEOC89yZ
         omaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IF8x/kC6nPtihWyLpHWjes5Jek/gVOMY4PohNgH0KeA=;
        b=bis+VkEZD5QkbudgphXCKjr3E2C5O350nW7AjWmXkB5FYG5AF8B0DkpjxgATo+ptXS
         eZ9YX7Rgv6fDsYWQbny5ZsaAjXENIPi32O3JpYz/CO7oPLg2sd31Mr8IqdzYpWPZ/VUe
         ZfBID+VxZgx7OJFfVGCCUzmMUCGsNzr7SD1na8WV6u93qfHWYR3hSKfsqwv+P1pyT0rf
         9pZaEVAe/Uev0N9SgpqoUgbGo0Kjm9UPn033zaiFZ3RYmJBO/SEoKVyRibcALyz+6rz8
         wCrLYHB1SVfsRudiJSWeW7sVQBpr1g9NVKi03Zlw5WdS+Ux04kY0+RtBrEIUA1vicOhX
         kvQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KjW9EpZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6si6629842jaq.124.2021.03.21.06.37.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Mar 2021 06:37:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KjW9EpZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lNyGj-00081u-G9
	for alex.bennee@linaro.org; Sun, 21 Mar 2021 09:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNyGb-00081f-6b
 for qemu-arm@nongnu.org; Sun, 21 Mar 2021 09:37:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNyGY-0001NT-CQ
 for qemu-arm@nongnu.org; Sun, 21 Mar 2021 09:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616333833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IF8x/kC6nPtihWyLpHWjes5Jek/gVOMY4PohNgH0KeA=;
 b=KjW9EpZhwehtQzo8/U0n30LjOvp4Pe3Vttpm+J8BgUifea82kGRVyZle3FTCidPl5m0p3H
 F7Z1veqLMkn6KeqJHFUl/E5JZXZamrQvioHyiPeDaT3uB+7Yhmfce6m8vrZOeOiNW2IubQ
 /ZWqk2VFg3JWW7v5ZTF9Q/R4neyxT4M=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-EfwLoW6cOtmSt8cWm1xukg-1; Sun, 21 Mar 2021 09:37:11 -0400
X-MC-Unique: EfwLoW6cOtmSt8cWm1xukg-1
Received: by mail-ed1-f69.google.com with SMTP id y10so13503302edr.20
 for <qemu-arm@nongnu.org>; Sun, 21 Mar 2021 06:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IF8x/kC6nPtihWyLpHWjes5Jek/gVOMY4PohNgH0KeA=;
 b=A9P12RMoAK7MQJUqFXxb1jiykXKPzcilfvURz1/eEREVtXU4NJ6kbXZtzVjr9SxKUs
 VPLWM6JxqtEMN4y2T0cqdK4rY03/vZds1eeVtfYun/s9Lq0ca5K3ObL+GY3+BxV9Ua+/
 0XiPthJ4mWYvPrtHVdsMVvN7eaZRHkuoSa9bWWsX6nIuTspqiUD8iNMERvHcN3Wp+NHK
 hxDHi/ieknQN1cnPvJa8Lx2oqOSKhtZf0oYjBhIpHdZ8vWFyQrBETbrmbbFiXzdhmfRD
 v+djOD5o5E5bphD8ho5YCDqlrVXKRnXegYi0jfUeQ51N1oWgapMVQ6SXpl4Ucv3YghTV
 2Vqg==
X-Gm-Message-State: AOAM5331COYK2T9E8Teuli8KXD2vpvCpd3xd2ODU6GWY1aDUCNewCC2H
 nc8QKwNy7aW8YUdX8CKwKw64F5yVxJJwm3YBQlCmjGV4ksSadjLM6u9s0+01oCxakz0QYxPtWi7
 ohLeZQbk3g8uy
X-Received: by 2002:aa7:cd6a:: with SMTP id ca10mr20663863edb.7.1616333830025; 
 Sun, 21 Mar 2021 06:37:10 -0700 (PDT)
X-Received: by 2002:aa7:cd6a:: with SMTP id ca10mr20663841edb.7.1616333829790; 
 Sun, 21 Mar 2021 06:37:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id oy8sm7077708ejb.58.2021.03.21.06.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Mar 2021 06:37:09 -0700 (PDT)
Subject: Re: [PATCH v2] configure: Improve alias attribute check
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org
References: <20210321001703.81812-1-gshan@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d3ed2dd6-5bfb-8be8-6929-6277a768abcb@redhat.com>
Date: Sun, 21 Mar 2021 14:37:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210321001703.81812-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h7XlU9uYAt+S

On 21/03/21 01:17, Gavin Shan wrote:
> It's still possible that the wrong value is returned from the alias
> of variable even if the program can be compiled without issue. This
> improves the check by executing the binary to check the result.
> 
> If alias attribute can't be working properly, the @target_page in
> exec-vary.c will always return zeroes when we have the following gcc
> version and the combination of options "-O2 -flto=auto".
> 
>    # gcc --version
>    gcc (GCC) 11.0.0 20210210 (Red Hat 11.0.0-0)
> 
> This abstracts the code from exec-vary.c and use it as indicator to
> enable gcc alias attribute or not. The gcc alias attribute is disabled
> for the cross-compiling case as the compiled binary isn't executable.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>

NACK, let's first try to figure out a way to preserve the optimization 
without using aliases.

Paolo

