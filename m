Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2315666lfg;
        Sat, 13 Mar 2021 11:05:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdue+4tCEHodAXd4oqcL6JK9KusPSv7v1Eq2jxlA9A+mTVo4yXJF93otXKkLE01Eu7+Php
X-Received: by 2002:a05:6602:26c6:: with SMTP id g6mr3214353ioo.150.1615662344531;
        Sat, 13 Mar 2021 11:05:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615662344; cv=none;
        d=google.com; s=arc-20160816;
        b=aNN2ZvaAWBamLifeZ8WyALeAboCodXhYepcHAAhAbtZCjIcH4mx2pxb8RZGY5vYqWU
         Btqkg9fsvclWCdiSkssAfFRK8GjNYhRl3lGpTQKEMSN6cDrDwEhiS58NQg/+yRwCdBt+
         WxScr4P8Nh6q2u+WrXHy1QdXyjfik7qWKu4HHssHxOh+1cyGjfGMleUQhVPHOok/sgWB
         gJZhTOcbl2cLuGIjOea6Rc9DMzpLRQgGkqE/Qe9dbAtL9A/WUPfUlmqdI8vjWP8Ey1B3
         Im9D5WjWzhgLA0Lyc3T91TGzGEZ+LTFs9vZyeTyFLsrBSAJZB343ZQwTPSoY3atP9qpd
         6FFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=VUfcgdKlJBbU+E3hRAyOQSbGUpRVGF0tqqZgDIXXeVo=;
        b=BAavuqTpqMku9m3+UI601uIikwGsc+6qWkdUB9qc+lDkrw8v8vbDmkN9DSzKTKjBjY
         /eegFoeuSzBOlpZZZehaDtFquUo/6CZxRWM3kiLRI1UWOjh0clq/Wnj9Lc1jR8WLAaMe
         zK4CV7dMIGbfLtmSdxQp6jH4abBzDyVjL79Z7zLVjJnPSIGpW3/yfM9Py8JvoidQQVrR
         I7DfqGCtVP5gFM6qUdZMHPvD0Yo9qylGbdf12rSVUyJq2fyYrLPZkBoL7MsOdtZAqm/A
         qWc05ESxzU8+/9KGi8wAQqBVvbPMpscwyFKr2ESqa/UuEv0yVi3nbpRVUNAASZHKhb3q
         bu4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gXPYNj8c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e25si7652788ioh.3.2021.03.13.11.05.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Mar 2021 11:05:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gXPYNj8c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lL9a3-0001Ru-TG
	for alex.bennee@linaro.org; Sat, 13 Mar 2021 14:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL9Zu-0001QR-JG
 for qemu-arm@nongnu.org; Sat, 13 Mar 2021 14:05:34 -0500
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:44653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL9Zp-0001s6-NJ
 for qemu-arm@nongnu.org; Sat, 13 Mar 2021 14:05:34 -0500
Received: by mail-qt1-x82f.google.com with SMTP id m7so6446084qtq.11
 for <qemu-arm@nongnu.org>; Sat, 13 Mar 2021 11:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VUfcgdKlJBbU+E3hRAyOQSbGUpRVGF0tqqZgDIXXeVo=;
 b=gXPYNj8cH/eYSMKkICQmrLscKw5PHz3Li1TYmIgmnA9QAH41PaSwvt5e6fvfumHNyi
 oZ/HEbpSMfMN+1llLishboOtA6zu+wk6wB+RGMKur4qWmEBRqR0odPem86F5FkNk0H9E
 Qihd8ehfOANnG2G8r7whDhD98ph9NzL+lXkcrMYkHl9G4bwSHGApiMEpXv1uNAAdURqm
 TZgTc5DesDldKhXqA/zN3VTtgS+QXCz5s8tGDFRZkkX7ShQDjQh2B5oFMFcs/k4teCWK
 IokfZftefvzHWX/ZdDDCA5ntHWg6Em8iIjf9Dt34nHs+raX/a9HEWuBPtoX0P/De3H8Q
 zkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VUfcgdKlJBbU+E3hRAyOQSbGUpRVGF0tqqZgDIXXeVo=;
 b=CQpw98iyQs7761bsbI5pX4J8p8DQe9sRm3WYiX3HX7yx0rwPxPU0A4hh4GUezVKk4Y
 5BOcri6mhTxfYk3seo61PVdRPQawO87LgZN2wRcPppmT2rP4oe8Hpchz2Gsn8DvBP+23
 pLEbCuw+Xp3NQ0NmmA1HZo5P4x6ZI1qKN4svEGXL8ogCLGDQK+2XAXe/M4Squ3yPVocH
 60v1cTLSaV39ouK6FzK5VRmCoP0pMzuDewvqlI78ng46ntaccazwzy9rrvrL+UvFT21z
 EzzNe98fl2wGBaYxtP/QRVYEISI3sg7+JlfWZzDuoU6fJ6rH1Dth3XoMaV6/njx/BDfj
 dANA==
X-Gm-Message-State: AOAM531xk3bzY8b6IAOZUNFecMVUddsNBanqKHuF2mwcrdf0ApMro1Oy
 2MlxwW2lesl506rU4Mks1UeLbQ==
X-Received: by 2002:ac8:47cc:: with SMTP id d12mr16749385qtr.147.1615662328465; 
 Sat, 13 Mar 2021 11:05:28 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id y13sm6330784qto.39.2021.03.13.11.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 11:05:27 -0800 (PST)
Subject: Re: [PATCH for-6.0 0/2] arm: Make M-profile VTOR loads on reset
 handle memory aliasing
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210312172939.695-1-peter.maydell@linaro.org>
 <CAFEAcA8PN3EQN_E8zo0qUP=F7cAg=XvuUc2V6iop8YOOYxMGxQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <657618fc-9e62-6c24-c65d-ccc7375c7fcc@linaro.org>
Date: Sat, 13 Mar 2021 13:05:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8PN3EQN_E8zo0qUP=F7cAg=XvuUc2V6iop8YOOYxMGxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kumar Gala <kumar.gala@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c+d6wRC+2mhw

On 3/12/21 12:59 PM, Peter Maydell wrote:
> On Fri, 12 Mar 2021 at 17:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>> This series handles the possibility of aliasing by iterating through
>> the whole FlatView of the CPU's address space checking for other
>> mappings of the MemoryRegion corresponding to the location of the
>> vector table.  If we find any aliases we use rom_ptr() to see if the
>> ROM blob loader has any data there.
> 
> The other possible place we could put this code would be
> to put it into rom_ptr() itself. You'd have to change the
> callsites to pass an AddressSpace to rom_ptr(), but really
> we ought to do that anyway, because a Rom has an AddressSpace
> that we should be checking as well as the address.

I like this as the solution.


r~
