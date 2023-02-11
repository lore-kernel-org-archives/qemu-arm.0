Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3181133ejb;
        Sat, 11 Feb 2023 15:34:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+kbWapYlxLYmnDticus6mB9pUOzTxdf6JQgKSu9zr2kPsZ6Y6+QrFvnoHKsPTA5dRfRvDb
X-Received: by 2002:a05:622a:5ca:b0:3b9:b211:7736 with SMTP id d10-20020a05622a05ca00b003b9b2117736mr32460905qtb.19.1676158480605;
        Sat, 11 Feb 2023 15:34:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676158480; cv=none;
        d=google.com; s=arc-20160816;
        b=ffKG8GCJhgET9ccN0ptBdXOa/U3vyP/di3yAmyuWqVtG5SVrksvsl0FLaR3DCpiWgz
         tkyItP4BBUEMqYIyjeDaMU/GEYRyhVC+c13x3DsvsmJ6gG+4p1pL89WSAEHgJ7JbGZwf
         1JfNwRcclepZYRmK7gZj+eU7K67NxyXSeulcCYabK383GfyIXWOPPfSFNDVoBmPirrLL
         +nBwSGl3xOqKiB6E+8KCXvM9DTmcKI1t3HNmeNFBqRwaGGgmIVkkAsrV8/5lLazjUg4/
         beJduYfM9yBqLaub6lHnWtmgLQza7lI7HkhNakjsXXrp4Wxzz6EWaVD0/nMjWQJIxHdd
         hOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=R0ksbUlvOsjub3ERkmM5ZHb8g1EY0/xIiYVsb57xGo0=;
        b=V0ncCnL69AAZiNqnjx2mgvodC3Mjph9Oi38GIAYF7ovQ4O5JpN80mbpSf0y6Se2gpD
         urIfmAxNRv6sYEZjGLCa3bFe/fI41XLaVfeiQ/50c0yQvcNluqnjiTwSVQIdxNk/H3kH
         Qke0uCehI6I82D4VnNjGdqXfqkAzz1tV1L/FLCrxi6y2KyqVR7dxmYvkzJ3FzQtdn4bX
         ToVRzpvUv248FjOqNrGpd1lZ0lS0WwjGs2GFjAzUDOARWnI1mx7TIhiC9D4t9I0ba6l8
         qHK9bYmpCXeKj/gf3R7UYzyJ6TxbaYykqhKq1ejseyrJPbJQXqzENjXYwNJAIgbzYqXT
         mU5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qWHN7L3e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a05622a044900b003b86c374071si6705478qtx.787.2023.02.11.15.34.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Feb 2023 15:34:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qWHN7L3e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQzOA-0000VB-P0; Sat, 11 Feb 2023 18:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzO9-0000U2-Vo
 for qemu-arm@nongnu.org; Sat, 11 Feb 2023 18:34:37 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzO8-0004d2-C3
 for qemu-arm@nongnu.org; Sat, 11 Feb 2023 18:34:37 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso13676581pjj.1
 for <qemu-arm@nongnu.org>; Sat, 11 Feb 2023 15:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R0ksbUlvOsjub3ERkmM5ZHb8g1EY0/xIiYVsb57xGo0=;
 b=qWHN7L3etPS0+K3I8gnHDge/dp+vDWROe0npkyjvPHomv5RBsJp/c9E2IR+eF8loAd
 Q6X+Q5f51HJe0s/jpHOGLUT99/3cTItz1GRIgUxB0zqHQnpmdoj3bHkVWMnn3Zwl0KAl
 32Gl2pb2axzy69Ur5bwjqqCqDIrCHZhBsjd3hb8ib7nWpeDMUHaJVLJ61t0zPoTjhqd/
 SrVpqhIOFcJOOp3ysdYZkUNZJM13lNe+wOCh4qvHa8t1PEsDvchIlrZJsT0PwFaKa5xT
 /RBGXl1fawRk3I6PhJEfzmCygeacbQyJXG/lzkipmp1bkSsEmkCM8MKCw/cBfgHgKJ4K
 5i+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R0ksbUlvOsjub3ERkmM5ZHb8g1EY0/xIiYVsb57xGo0=;
 b=nUNVG9Kvb7/2ZoFcKeK/srHluiQkxc2y6E5m4dAVwtz/9I6KGvRWHlbkOiEzV+OU5L
 8nmPRXMvQk+9kN/4+GAAol+j0rROMh/IRu0SYSBHu+TlGaIp1d6ZDnqwv5yC3TpkVD1c
 aXySHsYRtTc89fieuGY0xtefKnP8nfsRm+WyGd2Zo7QeyxynSc3+afhxclvhV4QlaMDU
 a864wFuYYa/p41znllc8vCrAIEYKSQnJ4K9oP3BAUIa4nAFf7EjRpYSvIed0q4r9vFiL
 ZO/4qVq0u/eCqtZ/4aGwlT0/pkKZCLO4Er+mkC53aIv6hEFekMd62Jc6wqzHRvuUMhCU
 ilVA==
X-Gm-Message-State: AO0yUKUkDklmHeiHjV8QT6DkWUxJZqwatAYSjdo3au9Sc2eCO9GN8Hpo
 7Px2LkWkd+IQmAUV5M7elBP19w==
X-Received: by 2002:a17:903:283:b0:19a:9641:d1ef with SMTP id
 j3-20020a170903028300b0019a9641d1efmr1214951plr.18.1676158475039; 
 Sat, 11 Feb 2023 15:34:35 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 6-20020a170902c10600b0019945535973sm5511251pli.63.2023.02.11.15.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 15:34:34 -0800 (PST)
Message-ID: <2de9abc0-8354-0cc1-dedd-5d4692afc54c@linaro.org>
Date: Sat, 11 Feb 2023 13:34:31 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4] hw/arm/smmuv3: Add GBPA register
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230210221951.1298668-1-smostafa@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210221951.1298668-1-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: VD33IdieTegt

On 2/10/23 12:19, Mostafa Saleh wrote:
> +static bool smmuv3_gbpa_needed(void *opaque)
> +{
> +    SMMUv3State *s = opaque;
> +
> +    /* Only migrate GBPA if it has different reset value. */
> +    if (s->gbpa != SMMU_GBPA_RESET_VAL) {
> +        return true;
> +    }
> +
> +    return false;

Just "return s->gbpa != SMMU_GBPA_RESET_VAL;".

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
