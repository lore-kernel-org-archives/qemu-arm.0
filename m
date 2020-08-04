Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp610540lfy;
        Tue, 4 Aug 2020 07:53:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxa36+MIcocP9rx0P0t6/HTwAEN7RS/NZlpp79sDyswYV0m8/oTWFUfRNZ1wfH2aGciQBe
X-Received: by 2002:a25:70c1:: with SMTP id l184mr31753948ybc.241.1596552818132;
        Tue, 04 Aug 2020 07:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596552818; cv=none;
        d=google.com; s=arc-20160816;
        b=cyIOhjo5HTmBg0U2ugF2/K4KRdl1IjNzxsWY0HT+lmQH7sxQZd54ykarWtbLRVMWsa
         TtDk9SIT+pendmSACNVm2+ZcECgxz/5pKtB+Urf6aOhRPo1Seee/i835CiDnR37OwzFf
         W7erXA23Mr08Do1cwNlmVvYci6TnGBMo4te+NP7FoToncFA8Ieq4e0icZnfVTBO8riO+
         d2lB6LqjSyRzGhpvUlBnNbsF+f4vItotiBWHtznf4EFBEwjNszFKJ5Kk2Zf2zNTQ0mxX
         7E6P0F/ZmIIaSN7sJSy2hkZ8UqwSor4fVLALrS9e53x1fiNw7bjdgYHjpyAXwOTl5Ux7
         dD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=G8iK6Ss606ZM/B4U+kopOI9YHb2G6ZZxhPAcDenrYw0=;
        b=Wm+/FGmH1M33fkXOyO7HlFx3DtOiOHwJT04bPeKEvTCYrf+vAUICBlXb2BJp0g/JaF
         S0c+XwoORJADrhHawmMrlqWuxjEuzEMNWQqPKdesxrPKjYAwwf1fRyhko4LBFgmCFfhH
         MDxFXLT0ZswcU9qXv9vAY3wLkrv70HIu/7+c0mo+DXb540aZYfiQvJO41IDcncIxb2q3
         XNyf9Rkq/Rv1zS+mp7ZE/Yseah427zO+xnNEeW8i1s53wJiGfJ6qV2VAlMl1RAsllSfh
         DRNYGZl/MeQQeDrSfvYInBIyN/17gRegWT2LQsYhafh+JWsa0bBCe0HK4yhSxZZPYuWb
         8BDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L6YgYEP8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m84si20760285ybf.486.2020.08.04.07.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Aug 2020 07:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L6YgYEP8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2yJt-0001ly-FA
	for alex.bennee@linaro.org; Tue, 04 Aug 2020 10:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k2yJi-0001lr-Kh
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 10:53:26 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k2yJg-0001PT-67
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 10:53:26 -0400
Received: by mail-pl1-x642.google.com with SMTP id z20so2287848plo.6
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2020 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=G8iK6Ss606ZM/B4U+kopOI9YHb2G6ZZxhPAcDenrYw0=;
 b=L6YgYEP8rBrg5lgOmnUQEU4E8dT8N3UFG6D0w3S2dG+E+qg6Q3+SZd9I27MCZfBp8O
 zGxaN2WHE6ZXI6zn84Yu/3UyfhG9fh9P32fUJ1nivXaLaSUl92m5VaXDseuWzvD700Ih
 0f081TUZTa/zrNsPa6J+uOCHorhICBJ1Px3UlKhm2GzmWYQ1uUCEaZMjCW3gVWaqOKvJ
 s4imOtaiCuswq/cl2UF96EYppDf3m9QkppR6lK1pZf1dTkWXeJbK/aaaTnVIP1HwIu/R
 KkhyECx1MZ6Js49HXRhogbPVNje9MQYz01AdPHGDIMXSQ/C3gySNshmY9fiHda7ULNoq
 kOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G8iK6Ss606ZM/B4U+kopOI9YHb2G6ZZxhPAcDenrYw0=;
 b=dV3V2pwAy01usXFlltdCKPTgNRFXaMbFHf/xw81vCKzmqzzbKNc+6iKApqxRSPcv/G
 YwCM+4eXUYHn5t69GcvJynukQQQTjLmvOOnHDTFt2TOArdNGPzcI3cjY21OQWuiO1VbF
 GaOQRZ9tt+6FC3CqhC831Rn+pg0AGQFTbiLzGI4cieZSzwtWB27FhYHh0LsuDGOtDfbh
 dmNMwYBaGHiaN2a8d4kDHavCaDjlxpTwka9I1FzcnILgtb20cXdQNe6LEHBgwUsgykr1
 16PZZ86no8pwaGN3BCULTrTa30B9TadbLQ+zxfsZQm5A/nNVtA+9XNl4GzTLxm0H48MU
 +3lA==
X-Gm-Message-State: AOAM532hf5+LSlf85WWnFjR4fhrO8NlPUmR1f4sHvdOffH+6tf6a3+LK
 eppbqTLnnpZT8Ro44hnE30eWsA==
X-Received: by 2002:a17:90b:1287:: with SMTP id
 fw7mr4662828pjb.218.1596552802173; 
 Tue, 04 Aug 2020 07:53:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v128sm22279409pfc.14.2020.08.04.07.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 07:53:21 -0700 (PDT)
Subject: Re: [PATCH 2/7] target/arm: Separate decode from handling of coproc
 insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200803111849.13368-1-peter.maydell@linaro.org>
 <20200803111849.13368-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <96aa534f-4892-1084-7899-de9c76f5b8a8@linaro.org>
Date: Tue, 4 Aug 2020 07:53:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803111849.13368-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: fOfTNSLHrjFj

On 8/3/20 4:18 AM, Peter Maydell wrote:
> As a prelude to making coproc insns use decodetree, split out the
> part of disas_coproc_insn() which does instruction decoding from the
> part which does the actual work, and make do_coproc_insn() handle the
> UNDEF-on-bad-permissions and similar cases itself rather than
> returning 1 to eventually percolate up to a callsite that calls
> unallocated_encoding() for it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 76 ++++++++++++++++++++++++------------------
>  1 file changed, 44 insertions(+), 32 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

