Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5001224ejc;
        Mon, 27 Feb 2023 12:21:22 -0800 (PST)
X-Received: by 2002:a17:902:e745:b0:19c:d169:cb3f with SMTP id p5-20020a170902e74500b0019cd169cb3fmr187118plf.21.1677529282056;
        Mon, 27 Feb 2023 12:21:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677529282; cv=none;
        d=google.com; s=arc-20160816;
        b=ED6jqz6awxPjRwqr4Sw4/JKz1ye56Uhu2Y4tllgmSkuaHoLolLOS/LxP04kCkweyLk
         EwLXG9IAnLtysm13lbop6mfEZMciDDUGHUrolq5cQlw81mv2G7vBEZDRQ6zlEXD5wcFI
         B08mW5ma0e8aBSz+fZ0WGa9hkbWoJ+fgTEXKn6ndQbd49pdfrWPIcegIq1fm1BQ9DJkK
         GY7El9eCZ0n04O5XQfgCJ5xNYcGwyov9Gm/9+jj01mFeRMAsiz1JX85mrAlxmDUeFhY/
         W3bWGxkJWtdmnUsQJJKsSZmyFj3AhQOeWE7KVvLQQXfGNBEa05HiIlVh4pa+ty+ZG9/d
         rdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wskDLqCCVfxDrvu5Vcz06wMz/jzQoFbqV3jXEJeYoyI=;
        b=toyVBz17F6A7dYcP5Ufrpy4PUHVdbeHdKdsEFGFKfC8zVvykn+0tow7Fx429QUPq1Q
         IlBrojH2X9Km1zWA1hnthpO6iLLfb0ZTTqvDFYU/5EJbove7zruSv1XwdT8F+364vq8x
         nFFjD/93RYGo60NbX4oMkh2w41sKIG+Vi2ksdIAa17BCuGI2BgreGrAnnJjRfRa+EL6n
         vu3+soY7cGBIVLHzA8p1hRVEE6o7DoyNz7LX2ESvVNPZcJddUMycxj0DX/JqQK8TliV3
         E2J7nOJ9KjBooPJYIHsRfSzL3bEVn2dDw4TB5ITymh+qVAkP212BhsTQu6cdhDSW/3jW
         G7YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eq570Uk7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e10-20020a170902784a00b0019cd8f47298sor2790946pln.141.2023.02.27.12.21.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 27 Feb 2023 12:21:22 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eq570Uk7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wskDLqCCVfxDrvu5Vcz06wMz/jzQoFbqV3jXEJeYoyI=;
        b=eq570Uk7nUf0H+E1ibMnyXd+duQPVSIXFSVpO8tz2fL005OZ44CTxh56oXPJ6AbnWr
         tcx8DpYLJ3za6vqFmAvo+mTVedTOqzojcNep+S6SRdN7XHn/ZTqV4dYVdMxuk3af/zCB
         ZzdM1h2KCMoR7P5PwOLwnxWpCCaFOPFUoJHKbbHSCRrMTH2XRDow4S8ousW6L3VujFm/
         zTSoaAKkyRJC7Qe3cqgdcgfwJ7+R6tE6DXk/+St4jhIDHext8GlpJTMXfh+8H792pEBs
         3eK7uwdqAlvh4GlFPSKnuuv0zO3PJHbVMbJnznxqcg9LPjgjdY0QlMG9NzMIK5a43Fq3
         imLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wskDLqCCVfxDrvu5Vcz06wMz/jzQoFbqV3jXEJeYoyI=;
        b=KAd5z5KXfRxfl8rlfpakBHbDtzNaRTagxb2HpXsFZdiYDB6UHG7YSQeF9nLg6WWozt
         Yib4ulXR0dFq/jR0aL1AG0zuYlEkteFx3pI/Ay4+g67bHQpCYxVME2/t/1irXoa9VV1S
         zdOWF6R/iRIoPNnjP/43jZCUzRReBXRSDiwrnIFf1F8+XEqGSMxm3q19dy4rfkeIhF/f
         qOCCU+0gnwkQOPIeJHblAIaBvWugxTUP8QxeMN0R5Aapp31acKd71lGA7xTFT9Jhk07i
         dPJw4FMNKev+uMAbL+xjjupn0fBIJJj9Sr0hSfWwDtAq2k0MrUu9oL1prXQIp96u950O
         h1yg==
X-Gm-Message-State: AO0yUKUKyHvpxHCksOuvFcropXe8SKB0Lt/+86uD7nLYeiTTrmgcMvNs
	eoSdRjAWBEgn9QTBWHIh/SNz9xKQ
X-Google-Smtp-Source: AK7set8ikfBIt7vwSk8VIe8f/SB+uBUUEM7nzc8hrLDES0Uq//JkcsqoknN07S6lfqP3UuhLjdVoFQ==
X-Received: by 2002:a17:902:c401:b0:19d:297:f30b with SMTP id k1-20020a170902c40100b0019d0297f30bmr245159plk.19.1677529281526;
        Mon, 27 Feb 2023 12:21:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id ik14-20020a170902ab0e00b0019ab3308554sm5011860plb.85.2023.02.27.12.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 12:21:20 -0800 (PST)
Message-ID: <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
Date: Mon, 27 Feb 2023 10:21:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230227150858-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: C4WHPAJdEkA8

On 2/27/23 10:12, Michael S. Tsirkin wrote:
> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>> I feel like we should have separate deprecation entries for the
>> i686 host support, and for qemu-system-i386 emulator binary, as
>> although they're related they are independant features with
>> differing impact. eg removing qemu-system-i386 affects all
>> host architectures, not merely 32-bit x86 host, so I think we
>> can explain the impact more clearly if we separate them.
> 
> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> a superset.
> 
> Removing support for building on 32 bit systems seems like a pity - it's
> one of a small number of ways to run 64 bit binaries on 32 bit systems,
> and the maintainance overhead is quite small.

It's not that small.  It only works for single-threaded system mode.  It silently does not 
honor atomicity for user-only mode, which is perhaps worse not working at all.


r~
