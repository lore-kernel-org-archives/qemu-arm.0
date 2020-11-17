Received: by 2002:a0c:dd89:0:0:0:0:0 with SMTP id v9csp24719qvk;
        Tue, 17 Nov 2020 11:48:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyznGhBZu7kr0TeyK53xaHPWIeExFIHSk2pFZ0RUT+V7PhwdpW4WTJGdCTPmLGpKc4KNXDg
X-Received: by 2002:a25:cc91:: with SMTP id l139mr2096045ybf.507.1605642510879;
        Tue, 17 Nov 2020 11:48:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605642510; cv=none;
        d=google.com; s=arc-20160816;
        b=XjrPMKX5AW5isyxf82JY3xz5+WLZXOZW1rvY0wu7+vORl5K8sX5HVh4CfxnPoHcgV4
         8u5i5Qtm3ooSXGyD/+JVW/PGJN5rTAonJgXjQD1TIiSLXCuI3KPrtEuk15qDUteJTPo9
         igxNGkr8NtyXzQ4HZL9WmuUKROyGgIo8zBRA7RJeY6E2OZQqF9ZHuld/qNfm4Y6Ieczd
         hoFZie6KMLYOdaxdPvuvTjAJBXy9xF8/7CNjE5DxpeBLGMh+WFATysREYkrWXjrLwyoe
         pqPV1xtszQ7z8lx7dEO+g32E0isKRVkavAxPtfKRnKfA0q3r3OvfFqFsy3hhlHORQjCs
         AzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=DIUXeoA3lk+w4RURriBvHtMBcIS7LrYTyXNTTVsuak4=;
        b=AV1VbySbD2HDNBoHmd19ZIALkTo9j4qdgkmWrlgUN/JyY9UcyVahHyJ0dcYTE7ghRc
         Rp2Vks4ihQSR1VRspfwpl67wVZ7Gsky17+fNNeAF5glfIPYhuaMgBaRkVlm883llMmMT
         8cIAjIWXp+aQowrMdIBQM87SHwGnRe0OmkldreruIRyqXyfe8o2h6VGYLgMtCekzW74K
         z3CahmYI+aZg+iycYPwG36gwY0pqY/yVPzHEl6yJps4FHLb/+k7TaS8F9tOhucYfkn12
         GA+a7zlae90sBwA6ZPOCkUvryzmX2cJ9JtFfux8OrMg4NNMqlnhI0vqk/Y0piaQZcGq+
         iTtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e4kzEMnT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j187si20934262ybj.98.2020.11.17.11.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2020 11:48:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e4kzEMnT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kf6xq-0002yq-EN
	for alex.bennee@linaro.org; Tue, 17 Nov 2020 14:48:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6xO-0002yh-J2
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 14:48:02 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6xM-0002vD-T2
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 14:48:02 -0500
Received: by mail-pg1-x543.google.com with SMTP id 34so13456647pgp.10
 for <qemu-arm@nongnu.org>; Tue, 17 Nov 2020 11:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DIUXeoA3lk+w4RURriBvHtMBcIS7LrYTyXNTTVsuak4=;
 b=e4kzEMnTWHyq8+GOL79UE+or0ikPU2voYAke04JBolYIgzZrg1wVixwEEbDyDsKE4n
 5/UTxsS6IIRrVkNg0bHhWT1B4RvlyqRQMSBxv7am0/Y+sGpAjOb1xNk/yGOUFJVcMjzD
 9Ya7jqowgP6C8VQGBBkV2y48QROoqsT8cRCPMIS1jx5xLN6eKk2agfg6+DEh9+gxAi/z
 46QswlsBHleahwsXNLZtLARdc8HosAl+cuEwsmtO00itCDga9/XkhWZQCGn567TS2y+e
 PXNKc/qV0I1xe86ekp7ajScCJj9rO4Lzfe37lx5cslYys4AhCbGv8G9LK84NERrF39s6
 bWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DIUXeoA3lk+w4RURriBvHtMBcIS7LrYTyXNTTVsuak4=;
 b=TBX/eC+SBFHCOAMYd7CjAp5ZasEQnhkFaYawgM+BNaCYJ1P1ER0gag9idgO/3CquUr
 xATL0VaCiSa81s0RbdJBshvg4NGJ+ejtpnWZTcRfXmAHLY3X255UByJBvcmcBA91OuCl
 iU/lyzyzaqUMOrtFm6bwh66w8PLCO75q3gBYXmh/YQEfMoa+dEGGZaFAcZE/ahN8knsB
 oLkUvuODrg0U4qDpWaPZKiSGir9BL+gfXD+eXAGHiDEsKRF3xkw2EGHlXQ2NdVtQY1Fu
 cS2/YdwZuaSI1S8gLSxuhCH8V3vDkXciSB6fsIkrh/9GMGTsvBAXpRZbmYQheURZ5tyV
 rN3A==
X-Gm-Message-State: AOAM533JQkRWiIKpp6hoCPNkyR7Cm5YSHPcsqJB080dTD9Bhs2JpA0Cw
 mf55g4+J73lfS5o7rTA9lr6eTQ==
X-Received: by 2002:a63:570b:: with SMTP id l11mr4933852pgb.110.1605642479168; 
 Tue, 17 Nov 2020 11:47:59 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id c6sm15160690pgl.38.2020.11.17.11.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:47:58 -0800 (PST)
Subject: Re: [PATCH 08/15] target/arm: Move general-use constant expanders up
 in translate.c
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <21e3448e-2574-19d9-3573-193af7795913@linaro.org>
Date: Tue, 17 Nov 2020 11:47:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: 8D2O22jPl+Mv

On 11/16/20 8:08 AM, Peter Maydell wrote:
> The constant-expander functions like negate, plus_2, etc, are
> generally useful; move them up in translate.c so we can use them in
> the VFP/Neon decoders as well as in the A32/T32/T16 decoders.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 46 +++++++++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

