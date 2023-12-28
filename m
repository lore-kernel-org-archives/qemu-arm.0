Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1245744ejc;
        Wed, 27 Dec 2023 16:42:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBko07VzTQd60lHglWI4ZgRxPozafTU+R7a9yAcJBBS3deXxEFJbIfg0aWdpZP88sq3SnP
X-Received: by 2002:ad4:5ecf:0:b0:67f:7e15:fc86 with SMTP id jm15-20020ad45ecf000000b0067f7e15fc86mr18245785qvb.17.1703724162306;
        Wed, 27 Dec 2023 16:42:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703724162; cv=none;
        d=google.com; s=arc-20160816;
        b=yVnvgFXfMoKg+MoeajnkDuu95v4rK7eWzgOFxfjCWdq7QZWLfowCexvpHiotZ/of0i
         ftqIVs+vM0Cx1zLPHJ6170P34Dqm51G4PYM6z64HlpLMnKiZHo+2k0Pdy6yriWU1tx+J
         tLrrPaZldP3EA2MCdzjpgDLMdKXzbm58zu9YQ9+pHirnqYBQIqHIsYPiMldy1VdyVucN
         QtodHup6lQpK0RHJDsoycWnbn4mcOItMR92yR9dAinmyK/NL4wrPO4i3GuxFU+se24El
         Z8stkT2/pqy1tJgcYWEkWt+nWGW5xiOV/krRRvPEv4snAqY/I9vaMS3usLk5EC77RxtT
         cD2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=NT5Q1fK6GV6MyLjZ4T9sXMjlwRF+piKN+7u4Jl4Q3cc=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=Yhofl+zAVKCUX3VDHCZtBOA/5USyz2J20qC8NAvWvqt+0aaqEebxzt41hcVzQbKFCM
         dibmtx4vzPRJ1hlcKKN4+4TlAzYSXX/9OPjCaQ8yevcaUSh8razRLR0v/hnSp+vA9IHG
         1reYYkV3aRFAHU038+ccsfkd6erRST1djDOc76oqM7T8rdp7QB2jiY71641e1pJjRQ3d
         z4irwOgMvRcZcP+dDV5+E+tRQMx1hQg1WZFi1GQup/RZXN5aqoHD1l4mkf3uYkgLu4P6
         Uby11O2oY/TEaP1F80wCJgwiNJ4NeLLGd4SbvqD2SWs2y5zdGv7m8thDi/F8aoS4thpH
         LH7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nBw3KTDT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de43-20020a05620a372b00b0077f11bca53dsi16312954qkb.602.2023.12.27.16.42.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 16:42:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nBw3KTDT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIeTW-0005qI-Pz; Wed, 27 Dec 2023 19:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIeTV-0005q1-Mn
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:42:13 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIeTU-0005OO-4e
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 19:42:13 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d4751dcb56so6688705ad.1
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 16:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703724130; x=1704328930; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NT5Q1fK6GV6MyLjZ4T9sXMjlwRF+piKN+7u4Jl4Q3cc=;
 b=nBw3KTDTaKc1yIQDcNLZuRYmkE+FY8teG4lkPSErv2LZ/ROK/k/MzzklEhugjDioQ3
 HBHV8MW1ccW7Us5KswXtS0Px9fz7uHOLGt36KfP5uSLUoQ0e/mkolmaaPzMVE7n06oXB
 Ng1aFTtp9enh4P+k6zWNJVprEH2/XSVGtN2SPJBTxXfuiv4QaHAfCgiRaMDDCTw5TbP1
 efexHuCHJmLj55wrQ+0inrnicaMUYRi0RugBcOLj9lpptwE45NUjc+TA7PznZVcPZlb6
 5zAZgYs6sM7Le8NHpPtR7nfrCu1s2iTB/o5xg+4xId5n53BD456AyvR3ZIGAVuvHD4vO
 qrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703724130; x=1704328930;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NT5Q1fK6GV6MyLjZ4T9sXMjlwRF+piKN+7u4Jl4Q3cc=;
 b=kBp8m7y4oxzWAmgiOxLCvlLfmWYnJQ0VRBb2OVYXeHLScxMChpQ6wuuVwBBMA7EjT+
 Vyc2m0gGRw24LAx5w+6ctAsLL8ppc/c6omU5xC0ZT1ZOySy+UuXPQOWWSwWHf1uQm8S9
 uiAW+ZcdOnlvAVdKbRGxvmLD52hr6ELHOqCGc8nOLXHKTFppVeQQwlwMPvGj8pYUVclR
 3sVVAIcvLF6VnC4XTvCaePLZQglpyF35FI73Ex9Q0EOrpJylPtw3HnVgWuuhwQB2UzEB
 NKR27Gw+B7birXZw+pHx11tfER0bu1K0+RNseHNVAzVx423nKZ42jPvtsydWkf0wIV6M
 5y7g==
X-Gm-Message-State: AOJu0YzCwL0mnoewfUSVZSUyNrT9FvRSN6tOSHAHzyTtbk/QQiHNNU7u
 8V6MV0q2fMao6F2Jlu/fzohvp2TmPtx0Fg==
X-Received: by 2002:a17:902:ba81:b0:1d0:c986:8aae with SMTP id
 k1-20020a170902ba8100b001d0c9868aaemr4037172pls.97.1703724130266; 
 Wed, 27 Dec 2023 16:42:10 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a170902db0a00b001cfcd4eca11sm12572426plx.114.2023.12.27.16.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 16:42:09 -0800 (PST)
Message-ID: <bf5e3af4-75a0-4398-8a54-eb8bdf641eb6@linaro.org>
Date: Thu, 28 Dec 2023 11:42:05 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/35] target/arm: Mark up VNCR offsets (offsets
 0x100..0x160)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-30-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-30-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6kdzNm0GBDEz

On 12/18/23 22:32, Peter Maydell wrote:
> Mark up the cpreginfo structs to indicate offsets for system
> registers from VNCR_EL2, as defined in table D8-66 in rule R_CSRPQ in
> the Arm ARM.  This commit covers offsets 0x100 to 0x160.
> 
> Many (but not all) of the registers in this range have _EL12 aliases,
> and the slot in memory is shared between the _EL12 version of the
> register and the _EL1 version.  Where we programmatically generate
> the regdef for the _EL12 register, arrange that its
> nv2_redirect_offset is set up correctly to do this.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/debug_helper.c |  1 +
>   target/arm/helper.c       | 22 ++++++++++++++++++++++
>   2 files changed, 23 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +        /*
> +         * If the _EL1 register is redirected to memory by FEAT_NV2,
> +         * then it shares the offset with the _EL12 register,
> +         * and which one is redirected depends on HCR_EL2.NV1.
> +         */
> +        if (new_reg->nv2_redirect_offset) {
> +            assert(new_reg->nv2_redirect_offset & NV2_REDIR_NV1);
> +            new_reg->nv2_redirect_offset &= ~NV2_REDIR_NV1;
> +            new_reg->nv2_redirect_offset |= NV2_REDIR_NO_NV1;
> +        }

Could use xor to flip both bits at once.


r~

