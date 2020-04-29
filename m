Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp902828lfm;
        Wed, 29 Apr 2020 11:46:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypLsLjDC6KDgdZz26cdGrG/IFQLoPI+m7sKL8r290yDli+IlIjhjik4MLFhkp5xfnb1Ln76Q
X-Received: by 2002:ac8:46d1:: with SMTP id h17mr35909279qto.72.1588186015844;
        Wed, 29 Apr 2020 11:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588186015; cv=none;
        d=google.com; s=arc-20160816;
        b=blzAhivloaFPUe+8qL8Ofr4FOXoBdXPopwP0W6RTbKahjOXNPJRr5mA/ZyioWc8Xmo
         4B6OoJWW1NVZdflfni7FiEd9TZTQelO++q7396GG3067SVrktzHBGC7lukJhh6014By1
         584H12hJaMxwB01nceR9WU1Uc3P1twJrzGH0TUilKilqZ8th33BtT9gVktqsN/k0F1D/
         a44liV1twEuDComev/6rKJ/ZITHZDXpfzjN20J+0OZtvCRWnFFjQzkQeqexzz68nI5de
         JO8M0TKhXvK4bt6moQtbNZULBx0oJ3LdcuhlUOVOoDu7BnAMXKKco4J1gTtr6QoItqxk
         1sJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sT7xYNB/pNhcIuB1QH4lh70g3ycEbYWObZyq67d7YwU=;
        b=qis8cmK2INKtu7wxnaQUOw8xfbanEsESNNicF1+5sEng6S2uNc/n2VxOAHd8Xt5r0y
         oHDFJ9eBSVxkdEEYt6kdIyH/NseHav2cbsf5OKMHVHASqicdhW0t7C81dIAFkyPGWjRV
         ZeGiV2HdZ7NDKWXmQBO6FFJmlc0CmbqEBmjSqIkYum2aRTwipWcXv8Rsh8Jw4H/QC8wv
         nVD3oc1ppkUmAOBCbx+MP/w4iTL8zzXAeWsdgajyRUrVDpPj0lna1mbxK2vEi+jlCDuH
         /ZapzEdITXduXxCnaaqStKLw7v+pL8jYbUhrMIdmAkMFDiYNQ0DlICuq9XjTWjmyeY+a
         Mygw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c4wek8El;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id u13si12659242qvq.84.2020.04.29.11.46.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 11:46:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c4wek8El;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTrjT-0006W8-93
	for alex.bennee@linaro.org; Wed, 29 Apr 2020 14:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37960)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jTrcZ-0004tq-Aa
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 14:39:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jTrcY-0005nh-Ce
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 14:39:46 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jTrcX-0005nQ-TZ
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 14:39:46 -0400
Received: by mail-pl1-x643.google.com with SMTP id f15so1162722plr.3
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2020 11:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sT7xYNB/pNhcIuB1QH4lh70g3ycEbYWObZyq67d7YwU=;
 b=c4wek8El4w1AEgivaAGRfz3u6ScZoySujT/D5mkOnCJREBVg3sYDw8B2mZvjF3kdPO
 m55gWDBGu0bfrSi/vdC0GvrM1xDEi+Bi0pwDkkrbRsHehSjNIxIEePYTe8xnzNJ+1Us7
 nbzIWAzk4ytQX6p+DheI+wKmoPOTwnfHuJ4r2Hm33gV0zuVXlcu+wJYx/4D9jD8+C69A
 9g680g9CSDc4ENybsRatUe0fcuyZnGi/xKYkl3jgUf/JhNFl05nhTvLIGsABmvqu4TNY
 fTgvWGyE8UPs1C9E5kccaYdUlNRocUU64bDJe3DzTQSMKkImJpZpUeUGRgXUU3DkNS8e
 iN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sT7xYNB/pNhcIuB1QH4lh70g3ycEbYWObZyq67d7YwU=;
 b=TqRuDMZeSz4aWu3oliV7DTuC3eU2keTmEA+Wr+blC8PyKLKcN974GVg0/Hahmr03Ss
 RphnSnXsD7pybEBk1hk1qyE4aQAfYZPGBRRLrBwIuM8XLATYHqoFS1mkYz3+bPbwFw1f
 e3gOoTrh5NrPhUjRZsSHzDBjrtjSWU67asuPC2QldYqqUUflM5WAg/jclOmo8d1uA9pP
 h3PGpbeMb37YjyZqxuSmoLtqO01m9oiBav1HrEPxqpsH+98V6c6h5E73oFMTGmBs27km
 ChXUf76XGx8LwSBBvvdgBOGgjMLEsMY8uMnR3zTGr1Avsnk9hJFpmXdbvGdq3JdCHBz0
 lxRw==
X-Gm-Message-State: AGi0PuZpyZ2ypG4EeY7kP+89seYUwhAJwY8ETmXxkdsoFituXvfTbM9V
 ojGJgT1L1XpVNtn9TUSWKPRDyA==
X-Received: by 2002:a17:902:207:: with SMTP id
 7mr34159461plc.331.1588185583675; 
 Wed, 29 Apr 2020 11:39:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id b1sm1560094pfa.202.2020.04.29.11.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2020 11:39:42 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/arm: Don't use a TLB for ARMMMUIdx_Stage2
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200330210400.11724-1-peter.maydell@linaro.org>
 <20200330210400.11724-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <771268c8-6971-e6ff-3970-ee911d1413af@linaro.org>
Date: Wed, 29 Apr 2020 11:39:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200330210400.11724-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::643
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PKN0d7JuKwI/

On 3/30/20 2:03 PM, Peter Maydell wrote:
> We define ARMMMUIdx_Stage2 as being an MMU index which uses a QEMU
> TLB.  However we never actually use the TLB -- all stage 2 lookups
> are done by direct calls to get_phys_addr_lpae() followed by a
> physical address load via address_space_ld*().
> 
> Remove Stage2 from the list of ARM MMU indexes which correspond to
> real core MMU indexes, and instead put it in the set of "NOTLB" ARM
> MMU indexes.
> 
> This allows us to drop NB_MMU_MODES to 11.  It also means we can
> safely add support for the ARMv8.3-TTS2UXN extension, which adds
> permission bits to the stage 2 descriptors which define execute
> permission separatel for EL0 and EL1; supporting that while keeping
> Stage2 in a QEMU TLB would require us to use separate TLBs for
> "Stage2 for an EL0 access" and "Stage2 for an EL1 access", which is a
> lot of extra complication given we aren't even using the QEMU TLB.
> 
> In the process of updating the comment on our MMU index use,
> fix a couple of other minor errors:
>  * NS EL2 EL2&0 was missing from the list in the comment
>  * some text hadn't been updated from when we bumped NB_MMU_MODES
>    above 8
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu-param.h |   2 +-
>  target/arm/cpu.h       |  21 +++++---
>  target/arm/helper.c    | 112 ++++-------------------------------------
>  3 files changed, 27 insertions(+), 108 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
