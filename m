Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1478216ejb;
        Sun, 19 Mar 2023 01:39:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set/k9ffnxA7MKyago8CmYvTub/crhAaYAF3BwtqHOvU57AEJPSlqM8Mp2ikvbMAfN1VYBjDj
X-Received: by 2002:a05:622a:246:b0:3de:6d89:adb1 with SMTP id c6-20020a05622a024600b003de6d89adb1mr3970954qtx.20.1679215144440;
        Sun, 19 Mar 2023 01:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679215144; cv=none;
        d=google.com; s=arc-20160816;
        b=PHTo4jnuaeJ3UKO+VS3CPwQ4PE4YKTQId09jKTZnglkFtKt6NCuL509pD0MQZ14ii/
         Bm4Tb/vqws0rWZRg6z9NbAxItJ3bh91TQt7Ykbqg1HcSwokDgxPPW3XU/zIxh+ri/jYs
         w4kZVg3VO2FQ9donF81xonuDfE4f/HshveADSLbDM97crIrQwDnsl0XwVEhWoqmrBvlz
         a2ZcHXirtMba/tf3jao9HhCm+VP1GGBaHDJp4dzkVH5JJ1gbLX9lIAVUq7GwP39ZOdjz
         Uv4dVFK5NyObRSlSSY+Ws2LGzTHLH+bBt36R0CbDnYHI5/rtjeaMJrmAtk/aVCbvOsiI
         CL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=mXHF1RLoBbsghn/HjjSG8kxQYvkXnSWpyk7Pkz6u2VI=;
        b=VEp9iN4f7vNcaF4pX1bBmgbQKNCZk/VDc+cA6vIKlCJwnRDH4dHmKfIUWDUVLPTTO3
         1zW+V5MxydVuRD9gqVr1E4AxAhQnovpTtYrcdPLehsryTkQ+gI6QKEzqADRW2HyZ4H2s
         V1I2CdklEE/3JpdLEJI7aGMAPsZ7iBBh2UuUBm9gGa1nlh8rMB+10uRJxZnjYCZiUUVk
         gYj04/TZuqtMD4Y9MBYGA/RFSQKVqdU9F4wi9RmDFi1dGOM3iey+d2gt3cDn5dGe1GJn
         wxiMZB8q3cTTFSIkVQdaozds93kq8RpLu/l/9ivsEZzZtqvtBQHsol1+XvKdXrpsZ8LJ
         Cc0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=jhkKn3Z4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11-20020ac85e4b000000b003b6373c4ba7si4099783qtx.536.2023.03.19.01.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Mar 2023 01:39:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=jhkKn3Z4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pdoYn-0006rO-Id; Sun, 19 Mar 2023 04:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pdoYm-0006qy-6I
 for qemu-arm@nongnu.org; Sun, 19 Mar 2023 04:38:36 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pdoYk-0001Pu-0h
 for qemu-arm@nongnu.org; Sun, 19 Mar 2023 04:38:35 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3ed5cf9a455so86235e9.1
 for <qemu-arm@nongnu.org>; Sun, 19 Mar 2023 01:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679215110;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mXHF1RLoBbsghn/HjjSG8kxQYvkXnSWpyk7Pkz6u2VI=;
 b=jhkKn3Z4IMFAT2HKiwLq/E1NEZge193DqdiCbDLlNqAePQOL55us0TXy2BXLgNG5DX
 oKNG4gpQy0X33JWh7eP80t2+LBk31GyXxCEEoto0cPTW7Lc1qA36SnfqvQyqChflHYe1
 t0THfZ9oUuwiaQsIgF9K6Upd1U4snCc6+W64mFBFmLCvGTHMlKBGslJiEgUF/lgQnBGs
 2b4mLL4rF+3sf2pTF6qxbSPzO46y7a/17g8Old3DRg4NWh8T2OFQ/oDUIeXg1tqyKwCl
 zpkZuL6MdXWD12n8HgmyRI/ZtyEnRLWwjfqYdOmaM6L1aptReNf70IYSnFjRR6j8za4t
 RzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679215110;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mXHF1RLoBbsghn/HjjSG8kxQYvkXnSWpyk7Pkz6u2VI=;
 b=sW3SQEBQsYlbKcJ1JVqoRWjeuLH1WPU9gIkiKVx/PjazvnA2uctQT+S7kE4caGVsw3
 Q97GbliDMFz/5/ZAnxXlj+rTiD8J2uRovcOMm1CGBoeXT1c3Dyb8JCdtfT+nIfqyvKbd
 KVcvL6jU/cwa2ncWEoZ6wvYfbOaZJ1AnZTocIc7iwxMhf3y82E9glrt+6ZExSAlJZGxA
 p1n/3kAIwxFRkYYXJII6PdKjI7AeUXeQYYKCvdbTLaNqifQLX94HKzEQYek5T4da0mPC
 V/OztUcV8n99l/JV8k5z2bEOOvOY2KKfpjFQmNvaSpsGg/inS4XhVgRo61gDgAkyfk4n
 Qx6Q==
X-Gm-Message-State: AO0yUKU2yM6ZgxSLtVcPTAlptNy3aSouI+zD/97MNbFrtR4uefZ04L2q
 C26cMW0TtUTME/9SnUsWpXoWzg==
X-Received: by 2002:a05:600c:46c6:b0:3de:b7ba:f8ce with SMTP id
 q6-20020a05600c46c600b003deb7baf8cemr232564wmo.1.1679215110480; 
 Sun, 19 Mar 2023 01:38:30 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 n17-20020adff091000000b002c5534db60bsm6101694wro.71.2023.03.19.01.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Mar 2023 01:38:29 -0700 (PDT)
Date: Sun, 19 Mar 2023 08:38:24 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v2 03/11] hw/arm/smmuv3: Refactor stage-1 PTW
Message-ID: <ZBbKAPs6xFHNKw37@google.com>
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-4-smostafa@google.com>
 <13459f92-da9f-f7a8-9c18-1870a9def7e8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13459f92-da9f-f7a8-9c18-1870a9def7e8@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=smostafa@google.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 6SM+l4I1k+Al

Hi Eric,

On Fri, Mar 17, 2023 at 07:31:06PM +0100, Eric Auger wrote:
> > +#define SMMU_LEVELS                         4
> > +
> > +#define SMMU_STRIDE(gran)                   ((gran) - SMMU_LEVELS + 1)
> > +#define SMMU_BIT_LVL(isz, strd, lvl)        ((isz) - (strd) * \
> > +                                             (SMMU_LEVELS - (lvl)))
> > +#define SMMU_IDXMSK(isz, strd, lvl)         ((1ULL << \
> > +                                             SMMU_BIT_LVL(isz, strd, lvl)) - 1)
> This looks good to me. Just a question about the BIT_LVL and IDXMSK
> defines. Do they correspond to any documented pseudocode functions
> documented somewhere in the ARM ARM?

I see they are not implemented as functions in ARM ARM, but as part of
aarch64/translation/vmsa_addrcalc/AArch64.TTBaseAddress:
	constant integer FINAL_LEVEL = 3;
	levels = FINAL_LEVEL - startlevel;
	tsize = (iasize - (levels*stride + granulebits)) + 3;
	tablebase = Align(tablebase, 1 << tsize);

This gives the same result, however the equations are a bit different as
they use final level(3), while we use number of levels(4).


Thanks,
Mostafa
