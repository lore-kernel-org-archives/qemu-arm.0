Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1571679lfu;
        Thu, 28 Apr 2022 01:38:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGrudAAkc6HTOv+1Sp/OU+HljijoRzfbZAEFJMuu+2PAZrkabaYHvFC9e1nr/XDI4olvOs
X-Received: by 2002:ac8:5ac3:0:b0:2e1:e117:b2ed with SMTP id d3-20020ac85ac3000000b002e1e117b2edmr21979032qtd.541.1651135133264;
        Thu, 28 Apr 2022 01:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651135133; cv=none;
        d=google.com; s=arc-20160816;
        b=du1CQRmYD7b6CFIN+quGQvKq4nPj+bq6m0iDl4Iyech8vYyjVQT8SSxJkV+1a5XxyK
         hB/YKCGc/TljI2NgUK+jQ1jk9JTjxS7n5BrXoJts20zyVyjRiKRKmt3j8w7aGfuNWdw5
         4CFDPBwZ/sGE730Rph1sdQO0y7qcQzTLBze1S68zjE8cOC6xUjKpwUGF0o92NTgrJgXD
         H1jlj6U+E+PnkXhIz+pd8G4TLytaNRWQ0mRlWnmFxfbheZiqHWl+GGQZzIxzRGpYN07s
         klxE2eIcnrNowdPgLqGc9DK5ZDmGWdQUud8qcdiBtEv0aXoZ3J6y2dfIIkXD0qn9rczC
         xDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VL8xtjjxjT5aAa5osjDjJHX/L8SyN+iosLKJc7qiRec=;
        b=Tl/qhJJBzD7NVO2ThPH+q8Zsomk7klDAnmwXH88vs9xjM84q9cLpmZieaQDXFhgRAn
         EMWnP8z93N7XP0ssJcL7gS+upTYIB1aubX+ESBTZ9OH2FAaWe/7lj0Q5aoCSE6OebeSI
         Mo86v20EkppNennE97VZQGuwqASRb4m0A0T0t/2muxFhfw7CjU7SWK25e2Diu6JE8jiT
         UBQ93gFrqCcqeoN1h7qvWrAiBCr0BzK8P9I6C3/GlJzN5G06yQP9DvrKRcX7vU4b40ep
         GMvuuYxI7RMrYDkaVNGSmTdzO0MXYym4/6+RGtZ9LBlAageAF0p82wgT8qOZd/ytR1vj
         zgyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OrVhQUCZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020a05620a268600b0067e4be2390asi1436488qkp.335.2022.04.28.01.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 01:38:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OrVhQUCZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njzfo-0002d3-Nc
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 04:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1njzeu-0002Zg-8Z
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 04:37:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1njzeq-0004ch-Ak
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 04:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651135070;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VL8xtjjxjT5aAa5osjDjJHX/L8SyN+iosLKJc7qiRec=;
 b=OrVhQUCZBk+U3H8L5BjxkEchm7T6tKgkzD8wj5fGC5goegM5D5CBETzalF1uaqcvPHL4Qm
 YQ2pEdf+XNDPOhRo8Ro6m8/MuNyoyZU8DCUhBvGTB7hk/HwShtuZSN9VZC/Xz/k9OBGm3G
 a7ZjJ5cLkgUjJr13rAJVunByWkgFPCk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-QUPYiPhUOTG5LV06TDCCkg-1; Thu, 28 Apr 2022 04:37:49 -0400
X-MC-Unique: QUPYiPhUOTG5LV06TDCCkg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r186-20020a1c44c3000000b00393f52ed5ceso3309369wma.7
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 01:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VL8xtjjxjT5aAa5osjDjJHX/L8SyN+iosLKJc7qiRec=;
 b=ern95+1Li5EJK4GptYXK4kRyM66MoGXY/La0Li5uqPhRIvNhuXp0SyKuurEzXLqbd0
 B9TPSpgyZkEZeFzJldkOBxnoGktxuuifUy37xMYjw23FA+0igbzOfJR2rEmFadvmXPPg
 KrfQYhPv8reccUpN89u8epij3CQ7s/LMx/MEyPW0aEkoVzfPQS5aLq4LhTsiS15jjaH3
 qTZajBTypZcdfj36UbFp7AIiBU87RhFS7hohix4y/0HcM8X1yFnmYwmThK0BrG80ZPnE
 YMdNZW5Sk92ySRO7ssWQ2qtTdNscNSz33zErb1NWOIB5r7wvQLd+40SKj3B6b2A0zX9B
 MSyw==
X-Gm-Message-State: AOAM530zbo/tTtdAgM55aZIOLuJ5PtrudKbZ3KbfGSgdmAeiPWK8FLcc
 azuWaok3KaBvbGl6DScZ09XfCUqUUClxEFSt9U9lTfqE5hZDEE1jU3fpDlyQRNP4Vjag+K79R8I
 9zfLvRCb/IshJ
X-Received: by 2002:adf:ded0:0:b0:20a:f070:6bb0 with SMTP id
 i16-20020adfded0000000b0020af0706bb0mr5630883wrn.208.1651135067944; 
 Thu, 28 Apr 2022 01:37:47 -0700 (PDT)
X-Received: by 2002:adf:ded0:0:b0:20a:f070:6bb0 with SMTP id
 i16-20020adfded0000000b0020af0706bb0mr5630866wrn.208.1651135067659; 
 Thu, 28 Apr 2022 01:37:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 t4-20020adfe104000000b00205b50f04f0sm15129669wrz.86.2022.04.28.01.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 01:37:47 -0700 (PDT)
Message-ID: <4cd9121f-6c9f-f461-836f-a4b1ba8fedcd@redhat.com>
Date: Thu, 28 Apr 2022 10:37:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] hw/arm/smmuv3: Advertise support for SMMUv3.2-BBML2
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220426160422.2353158-1-peter.maydell@linaro.org>
 <20220426160422.2353158-4-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220426160422.2353158-4-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KWbMssbCa/nG

Hi Peter,

On 4/26/22 18:04, Peter Maydell wrote:
> The Arm SMMUv3 includes an optional feature equivalent to the CPU
> FEAT_BBM, which permits an OS to switch a range of memory between
> "covered by a huge page" and "covered by a sequence of normal pages"
> without having to engage in the traditional 'break-before-make'
> dance. (This is particularly important for the SMMU, because devices
> performing I/O through an SMMU are less likely to be able to cope with
> the window in the sequence where an access results in a translation
> fault.)  The SMMU spec explicitly notes that one of the valid ways to
> be a BBM level 2 compliant implementation is:
>  * if there are multiple entries in the TLB for an address,
>    choose one of them and use it, ignoring the others
>
> Our SMMU TLB implementation (unlike our CPU TLB) does allow multiple
> TLB entries for an address, because the translation table level is
> part of the SMMUIOTLBKey, and so our IOTLB hashtable can include
> entries for the same address where the leaf was at different levels
> (i.e. both hugepage and normal page). Our TLB lookup implementation in
> smmu_iotlb_lookup() will always find the entry with the lowest level
> (i.e. it prefers the hugepage over the normal page) and ignore any
> others. TLB invalidation correctly removes all TLB entries matching
> the specified address or address range (unless the guest specifies the
> leaf level explicitly, in which case it gets what it asked for). So we
"

unless the guest specifies the
leaf level explicitly, in which case it gets what it asked for

"
This is the less obvious part as the spec says:

"A TLB invalidation operation removes all matching TLB entries even if
overlapping entries exist for a given
address."

I failed to find further precisions about the range invalidation & BBML.

If you are confident about this, it looks good to me.
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric




> can validly advertise support for BBML level 2.
>
> Note that we still can't yet advertise ourselves as an SMMU v3.2,
> because v3.2 requires support for the S2FWB feature, which we don't
> yet implement.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/smmuv3-internal.h | 1 +
>  hw/arm/smmuv3.c          | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index d1885ae3f25..e9150a6ff33 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -56,6 +56,7 @@ REG32(IDR2,                0x8)
>  REG32(IDR3,                0xc)
>       FIELD(IDR3, HAD,         2, 1);
>       FIELD(IDR3, RIL,        10, 1);
> +     FIELD(IDR3, BBML,       11, 2);
>  REG32(IDR4,                0x10)
>  REG32(IDR5,                0x14)
>       FIELD(IDR5, OAS,         0, 3);
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 707eb430c23..74bc2e85ee4 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -259,6 +259,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
>  
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
> +    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
>  
>      /* 4K, 16K and 64K granule support */
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);

