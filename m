Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4974195lfb;
        Tue, 27 Apr 2021 10:07:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+bVIikVKQVXG2kq14DytE1wsyy6LhVyBEN6ixQm1lg7MFgv/HmVRhnriuSEnbL6vhJpgi
X-Received: by 2002:a05:6638:41:: with SMTP id a1mr23314676jap.8.1619543273946;
        Tue, 27 Apr 2021 10:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619543273; cv=none;
        d=google.com; s=arc-20160816;
        b=CWfdshlrUjuPqSd9Chse0DB2+b0iNNTMRGk6VwOfSa7nUvsUpl3mmFpXMw4oIarJ+p
         6bk4XV7MJVe60Up0j1JCtckQiHAHCu08yAU1HLqATG9OxcyOfydkLx2t+W2sryug1tuc
         MYA+Y2p2e9jv3kjmF6tLm6OSz113FmpgGL0kiKuwibN1upwC97AOU1k5aqvfijobRrdc
         YSD8cVZEHADdRsRuThwkzFuMH+Y1DaUivfwoWGsCp5++5pMnNPpaIzkMTvKB9SGuzT6i
         QyHLm1NrB71Bq48R8SiJL3C7by3eYOpPzfRRmCgtMCs7et4fjKS5wGYwZqGzCh8gqaMC
         u2HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3boFMRowZ2b0ST9QKrRswSPlPGq8B0Kqz6A1z7xcLUw=;
        b=id4yQZ8K+IfkWaSipa0wj1ZBeVjTqbbiJA5V+/lCIYE9T5nve4Mbxz9O6b0QtH0zaR
         DAE3I+sD0Y86l02pGRfSoBHi3BWo6OESIItMHs7uNVQ84AMfbXNUPwYiJVSnN+0M/KjQ
         VkLCCyhNRqPXB6C56NowNBs5W6nvRmimzVklg2KgAen4PkjZBZtzFb8ZuuiuGggLxtwk
         W5WWGxw8Su1ccYAG8M81Yiv1AtKXs2UGvUkZSzUIlCfApgJT1LqmbPU+Tg50dUn5PYdE
         jsqmJxmRtQo/fLWiL69nOKBccoICYppHjGlKBf1PuXY8C9cqaZiirnpHhJ2PalGoHKsZ
         POVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BBiuiPCm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19si4228137jaj.123.2021.04.27.10.07.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 10:07:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BBiuiPCm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbRBh-0000iM-90
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 13:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRB6-0000fu-2C
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 13:07:16 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRB4-0004sq-Hh
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 13:07:15 -0400
Received: by mail-pg1-x52a.google.com with SMTP id m37so231413pgb.8
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 10:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=3boFMRowZ2b0ST9QKrRswSPlPGq8B0Kqz6A1z7xcLUw=;
 b=BBiuiPCmarHcSwO3292E/l569srBsCiRoWIEWoWIDM8bRZYJWnPqQeAcGsABbQKsSv
 DvigjktFHLMjfXD4FNuwbf/1bTLq7tPsJ7q/L3kTBPLP77xor34RHydiUo7Ov4IBX3Wk
 wKrLeQNXa4Ytr/7Z6D10WWNQIUpsby1ggp5sfqPl8EBCL0kZmB87Y/upDUFqZxT+p0hG
 fffoZe3ZYDwySCblK2GB6lFAOj/Pa+lNkhJ4CJQBDENw6EzkWph26uRIJM8qImPjwtuc
 sMazqdKWBj314zRzeAiPUbAGZ5+szLl+vYe+MTt1I4P3BHSQIw5gymilQCt8/WwF6ipY
 fa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3boFMRowZ2b0ST9QKrRswSPlPGq8B0Kqz6A1z7xcLUw=;
 b=MGWVZUJYJx+M8ZbzW6/YboX67rBABKsS2WTv/dWbGF+t75fLe7I3DLniY2KMIG575d
 l2ayOZsuF4PiuskJe//xFyhEIbcXq3XHMwlcS5D1kPhmHmh79TGnxvxEUI5n+Kzpe/FO
 6YKMckFp+s6h7YhCdXpcdwM6o85DKkT0AxY4RQPqYLLQSR68NoonMhYcffR0s1nVPGxF
 upzy6s8c5qeip0naQm069129wSgKVLuaUNCbmmW6p1EeRCWdmZKxOwN8YtHAnL9ecGa+
 Bin9zNdO94ycGfxmzLrYW0zz92rPZ4p08YHUvtNqMQTe//WXFkiTyWOkXbfnObwKGP5g
 MGWA==
X-Gm-Message-State: AOAM532Rb4+g3hiGVpYbTjLe9zPU7D9Dpm3KmhrnsRAlX7Rb5MzSQmEs
 K6tZn/fHeAMYUBWDO+d3pHOeJg==
X-Received: by 2002:a63:5004:: with SMTP id e4mr22380258pgb.61.1619543233134; 
 Tue, 27 Apr 2021 10:07:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id n25sm2988230pff.154.2021.04.27.10.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 10:07:12 -0700 (PDT)
Subject: Re: [PATCH 10/13] target/arm: Delete unused typedef
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <699ef103-11e7-7f52-f3bd-a35421480843@linaro.org>
Date: Tue, 27 Apr 2021 10:07:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4S886mLMWPoE

On 4/13/21 9:07 AM, Peter Maydell wrote:
> The VFPGenFixPointFn typedef is unused; delete it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
