Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp156812eja;
        Wed, 1 Nov 2023 22:18:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuUIqQcPdhbS33pHzRFWmF661OfLzXRPJ81AvZ/ZWXreSlYCr25l7J1IpJpnqWjW2zw8tJ
X-Received: by 2002:ad4:5f45:0:b0:671:f6aa:bd90 with SMTP id p5-20020ad45f45000000b00671f6aabd90mr14273822qvg.28.1698902301880;
        Wed, 01 Nov 2023 22:18:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698902301; cv=none;
        d=google.com; s=arc-20160816;
        b=OJOzVYdjwGpdJQC9pgV5J39cnXRa4lwvj3XliK9B7RkPJnS2VZSrPBhEWzXnm5Pd56
         ptVTaoNG5d7XWQdD6XVzGYj7lokGppEwysKgy94MUfTMt+75VMmfUG+9JdAMqUOy/R7H
         hTbvYuDpkpk3SfTcT3HwvNid6DUMiCvjGT9iRG7FEy00l6mQbErMPs1cGzWzrjOLeeTG
         iRM05u6xcQPNgUgtzdOnwzMwhmxJhXDDaRlvf0o0e5AeYmlJq16egF2972yE4Fmmw2hB
         KmLflhQEi4ekW2XQHTupXF6eddv+LGF+odNlipaBKXpX98KBqHi+8iULZkE5ugnZaDuv
         vEgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lY2inARoQiZMh3xseW4GS1PQsOQOAUDy5QVZPxkd6eE=;
        fh=q0jjEPenKFQ50+P8aorIeVEkTtjnNK+o3ieha+1Al3g=;
        b=Kr1+Y9XMd9Rl9QeoC7Q+TO/HXlfF2bM4jteDmvO3CjUzGJDzAL5CEfci9QvealMsi3
         kdL+BYKy6YhqxCnJlQtyGLyN0sK2xuKWwKDQB3pflmFg0p7XrH6PMGWqabLtkz661fGJ
         dx1ozPdxIlAk7B/3wLYDXBJRtHe3Ru2tbltP+UygBBxoeqfmxSsuxdayE5GaS0IJp0dD
         eY0U/WD4AlHGSEtEBPxzs2SKnzMIziz7OleMP343x5jPhYYDSFJbZScIunxz1K5IEWcw
         oG5krIstiVqcQtwrmyLQYvyCOEeobnMqBlewwP22ALa3y66RpuMAcYn4HPSbUl6a1Nsf
         uU4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rJTsc+6X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020a0ce8cc000000b0064f7b3cdee6si3864873qvo.510.2023.11.01.22.18.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 22:18:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rJTsc+6X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyQ5s-0008O1-13; Thu, 02 Nov 2023 01:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyQ5T-0008Js-O3
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 01:17:50 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyQ5Q-0002e9-Jx
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 01:17:46 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5875c300becso83484eaf.0
 for <qemu-arm@nongnu.org>; Wed, 01 Nov 2023 22:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698902261; x=1699507061; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lY2inARoQiZMh3xseW4GS1PQsOQOAUDy5QVZPxkd6eE=;
 b=rJTsc+6XEbE4Dvwww6KcPI/ZjdcrjS+lkAL/lBtXuFMaOrlBoSNFBu5f/5aDtEo7wg
 NgqAk19gDBL3fJe2K7Wn2JcmB/ZuzBtueBNHd5pttdO7hKKwgOMYAzmSCS3MIceVn2Bz
 DxeOccMtqpt1+IQFbY6OsW9VQ7gahv0Cv3ZoFUFetulzlu52BJbR6/raaerEiisvo0Tv
 wl3rf8PAlmw5lzia+dhVOzY6v38IVmyI1mOBgb/Ev55G7x9j2MFHzl4fbBtrl6i/KU//
 LM4aYP7bzlefO6hLDF/kMsW9pU/I3lyq0efD59YrWm+njGMhz5Btfi9rswfUNJDvTZe4
 qxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698902261; x=1699507061;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lY2inARoQiZMh3xseW4GS1PQsOQOAUDy5QVZPxkd6eE=;
 b=uIwpW0ikTbrP+qJLyIpQZhwBbR96O1eP+Uo3Jybtr/P+siQ5hjWAAHOV4bcX50G0fs
 6xm5dclUDfv8l3Nxnm/3Uw3mxd/l72fLFv79rX1kSO5ydIoJwLCG9NEE+lWDWnJ7ytZ5
 t/hn3O6DEMMOWTflSUB0Wb/DK+jFJBR9FeV4VH0B23JwMZ6rRaF781/7HL/P9Z2uIHl3
 /WmdDNXLgRuL0Zb1j0e/TajRb8a9vsK2ppn7IRIalz4r2D7KsgrjAMfPG1sJbw2att2S
 8D9FPkJULUMRTL984f0tiMnZDivaTBzBHWIwShM7g8dxu2XFkXPpCnQqMNd+NIzlsnJM
 KtRw==
X-Gm-Message-State: AOJu0Yz1h1E8gASN+cWM+TPr8irCxt2rBzD0202IDODpbZyxD1KLrLxj
 3nVDbg0UfvStX8JfRajNvHwiOg==
X-Received: by 2002:a05:6358:2812:b0:168:e69b:538c with SMTP id
 k18-20020a056358281200b00168e69b538cmr18241264rwb.3.1698902261307; 
 Wed, 01 Nov 2023 22:17:41 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a63b744000000b005b93dee7fa4sm551095pgt.50.2023.11.01.22.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 22:17:40 -0700 (PDT)
Message-ID: <8c32c5a2-d07f-46f1-ad51-92dbc1d3785f@linaro.org>
Date: Wed, 1 Nov 2023 22:17:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 32/33] hw/arm: Check CPU type in
 machine_run_board_init()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-33-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231102002500.1750692-33-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RY7vvJywbP2L

On 11/1/23 17:24, Gavin Shan wrote:
> Set mc->valid_cpu_types so that the user specified CPU type can
> be validated in machine_run_board_init(). We needn't to do it by
> ourselves.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/arm/bananapi_m2u.c   | 12 ++++++------
>   hw/arm/cubieboard.c     | 12 ++++++------
>   hw/arm/mps2-tz.c        | 20 ++++++++++++++------
>   hw/arm/mps2.c           | 25 +++++++++++++++++++------
>   hw/arm/msf2-som.c       | 12 ++++++------
>   hw/arm/musca.c          | 13 ++++++-------
>   hw/arm/npcm7xx_boards.c | 13 ++++++-------
>   hw/arm/orangepi.c       | 12 ++++++------
>   8 files changed, 69 insertions(+), 50 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
