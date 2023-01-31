Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp13180ejb;
        Tue, 31 Jan 2023 06:44:46 -0800 (PST)
X-Google-Smtp-Source: AK7set+vwskDAaM8xQnkKaA+7NTGs9L+teIawg7KDmcDcb0qcZODywAsoStT1fru3gpIDtEVrxH1
X-Received: by 2002:a5d:5588:0:b0:2bf:cfb4:2e2 with SMTP id i8-20020a5d5588000000b002bfcfb402e2mr15788059wrv.17.1675176285858;
        Tue, 31 Jan 2023 06:44:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675176285; cv=none;
        d=google.com; s=arc-20160816;
        b=Rg2o1dOtHE/Q+vi/2owegNRaNscSIyTgYIQxncl4qYgyPz1NK+0Y4ulbwxJH2m53D2
         CI4+mvJuJ1bLRaPSVxXyA+QPpZgBZJCgBHdnJhphTUXwFNgW5lOsvl9QZvVl4gBft2uU
         8ZCW6LVPW/xSSHQMl1D3Nyq3Z1aT3UUDs0a72GiKOP0f0ysGwzNjXzPZBny1Q1j+rt7c
         pqV/fgiyOnOUcwxDuzabOwuW1N3Nlsa3fYf0hh7DdzppR4ddL6daf1fainWzy24cJ1SW
         xypVbDe5YUAWat9/Z8Q4AoxWqP4A4PTGAh1hLkcApS+X3vS3uWggGNJKkF40RpaPk8iL
         YLbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:subject:from:references:cc:to:content-language
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=H5sZcdlYr8wD6U4jT6c+IQVR/JWLJXvsaqgV2ilaLC8=;
        b=BNYyTRP5YcLimIJTVGnkuaWJglpt0kaa6f041mfuazv/kthvI9pma5ibwndlg84DNU
         9AbCK3onAk6sRBuBm5GFq38GZb0sXeqVkdsjvg3JpDtNjonjMmS5tY46pHT6Jo1RgX32
         nrCmRVW0StjsiZ6nROaNRV+Q3UW8B4SbQWJTGxAvGcbUXEYRwulwGMLM1PmqTPy4DJlf
         fLhEMyqLJNJyQPRmoks93OWt4LNaUj8R8cUStlo6ruME+Njnp7vjXWtl9Ly8wu6TOgh2
         e2PVlpIwnHMAhOApM0VfrIcwAgVFntSoXgO7Fa0x98JpPIkSwcskcV4PDgNGEiSxKihZ
         hjpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DeAglfyi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10-20020adff34a000000b002bfb777e2b1si1833980wrp.628.2023.01.31.06.44.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Jan 2023 06:44:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DeAglfyi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMrYE-000221-A7; Tue, 31 Jan 2023 09:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMrYD-00021c-5I
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:23:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMrYB-0007c8-3P
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675175034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5sZcdlYr8wD6U4jT6c+IQVR/JWLJXvsaqgV2ilaLC8=;
 b=DeAglfyi9WpVeQKJacOalvB1RtduI94elJl5mV+wWjaJ94TMVk+vE1agHXPE046TzFQs4k
 GERVHrYsIZiRhUYzwmHlPAd9u3ppzP1yknjrsf1EG3H4eknrWi70kXhkOPxqgJY58KpPee
 nFHf8i8HOJ6f1OEU1l5Jj55RnikJQJE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-346-CGACO9SKPH6jn7tKZ8fLYA-1; Tue, 31 Jan 2023 09:23:52 -0500
X-MC-Unique: CGACO9SKPH6jn7tKZ8fLYA-1
Received: by mail-qv1-f72.google.com with SMTP id
 q17-20020a056214019100b004b1d3c9f3acso8324022qvr.0
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 06:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H5sZcdlYr8wD6U4jT6c+IQVR/JWLJXvsaqgV2ilaLC8=;
 b=ZFAv65tLqTCdCdyezYdpWLEKUVKQgfqfgBXxLG2P+OZOjU5AomkaAA0UdE8J6Q/29i
 7Jt8DaBDO/p1Hmvi5dWccYKZQrno212KCvr1moIPkQbhGa4Hj1MvH2KSUVW5UC/WPiX2
 7UtJE6f0+XA6FeDb0LQt6MXRyVnnHyj+XRh9jFJyaT5koxVBSCjbddklQk/mLWSiAaeo
 5JiG8GDfuTbNddLoSHnmPKNtyJbCFwczllwuFAtdiwQy47J/uWGT1yC6w9ylRJWAg2qE
 51Qde/RaiY63SBxid+Ad+CXFW49MgkjZnpI5GhmA1bXyBxknvVhBJFf8+urUh7pTjifO
 PgSw==
X-Gm-Message-State: AO0yUKVaF4Yfr81TQVab7bcgc+saG9mD5OVFS+6/yYkbeceqUEO4FKFk
 Qx9VU8YxV9I5PUWAO0ObimySFsz+EaHQl0kd5mEq0PIcNhT2SmrwSfo1OKAfqHtGQxyP11vtK/w
 vDtjCpC7KQ+ndWlE=
X-Received: by 2002:a05:622a:1189:b0:3b8:283f:8a64 with SMTP id
 m9-20020a05622a118900b003b8283f8a64mr28876787qtk.16.1675175032087; 
 Tue, 31 Jan 2023 06:23:52 -0800 (PST)
X-Received: by 2002:a05:622a:1189:b0:3b8:283f:8a64 with SMTP id
 m9-20020a05622a118900b003b8283f8a64mr28876759qtk.16.1675175031845; 
 Tue, 31 Jan 2023 06:23:51 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 i18-20020ac80052000000b003b82489d8acsm8107752qtg.21.2023.01.31.06.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 06:23:51 -0800 (PST)
Message-ID: <ee0cad00-a6f3-f0c1-adf0-ba32329354f3@redhat.com>
Date: Tue, 31 Jan 2023 15:23:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: quintela@redhat.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-7-philmd@linaro.org> <87a620my1s.fsf@secure.mitica>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 06/11] tests/qtest/migration-test: Reduce 'cmd_source'
 string scope
In-Reply-To: <87a620my1s.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aeCr0AkC/bM1

On 30/01/2023 05.44, Juan Quintela wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> I am assuming that you will pull this patches through tests tree, not
> migration tree.
> 
> Otherwise, let me know.

I had some remarks (in v2 of the series), so I'm not going to pick this up 
(yet). If you want to take the migration part, feel free to do so.

I still think it's quite a lot of code churn for just supporting multiple 
"-accel" statements here.

What about introducing a new lib functions like this:

char *qtest_get_accel_params(bool use_tcg_first)
{
     bool tcg = qtest_has_accel("tcg");

     return g_strdup_printf("%s %s %s %s",
	      use_tcg_first && tcg   ? "-accel tcg" : "",
	      qtest_has_accel("kvm") ? "-accel kvm" : "",
	      qtest_has_accel("hvf") ? "-accel hvf" : "",
	      !use_tcg_first && tcg  ? "-accel tcg" : "");
}

... then all tests that want to run real code could simply call this 
function instead of having to deal with the list of supported accelerators 
again and again?

  Thomas

