Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp775577lfb;
        Thu, 19 Nov 2020 14:37:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwk9nOe6LVszDk9nfSpGLUmPxEbNdxvojz5oErXBzxOV/wofR2yGmK9yDeKrwrgxMiCqu8g
X-Received: by 2002:a25:2482:: with SMTP id k124mr14426824ybk.343.1605825474892;
        Thu, 19 Nov 2020 14:37:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605825474; cv=none;
        d=google.com; s=arc-20160816;
        b=Hi/ERy5nQEqAwhT9cYlhjN71MqDKs2PpV+XeR9eEoM5V2pVNwEmwTfl/OzhvWVL5qH
         mDs3QgdixSrXK6tqdR7UkiaTzV0YrnxbF9AK+mZ/FetcNFc4HiYBQu2lBMx9qek07TiY
         tUrasSt1fuZw01yEPsca/y05KphAVBHn4QeafvfadkLZuuqOoVbaFUgp/oUZiYXrTJPM
         5Xiov8XNvPTqYOJWOWMZXLm/9AbrU1CNpy96qLsXxrnoyNuc+2l0Tj+8tTyHtH81RwZ7
         WyjRBs1w7ZSYRLn1CZf8p2LXZE0QnG/upzNqPW1kqsjbVTeb91Pae9ieebYhTiuayeuN
         IhEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Q+IDYurMPfHEiOpBSneypI1nBCycXNGXQAjRtkYHeG0=;
        b=UYxFCe7AioWYVLIvmkU2L4iwlJiXKs7PHgzpS3aTtIJtArhLmHK/dQ4v50Uy9MDcwG
         laPClDDbLTwwD6otO9pPVayhJxe/ZRTAVNdGBKydr5xv2IkX5SNjipXNcTgb0phbNqoJ
         OZ24VRafJq4KuZDfq6hE7S6hlaHvZ6C3VgtN/WT+2xDKTVFFmZrXynBXuIETlUPxDFuF
         mBD2VreNLRa8azAFYUrPfkBX7ubVru4mRNkD3bf6uAFAjjAgG5FRZnZ19hpLNy2mbNHe
         AJ9e2eeQMkkxSxiXhnkFTk93a21TJjsO2J7BAezHKzNNYdqruyVuw1LLCjbKfDfIAL00
         OzHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gzfPDrrN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z127si902661ybf.354.2020.11.19.14.37.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:37:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gzfPDrrN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfsYs-0008Gh-AT
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfsYh-0008FW-Ax
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 17:37:43 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfsYf-0001Vv-LC
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 17:37:42 -0500
Received: by mail-pf1-x443.google.com with SMTP id v12so5903564pfm.13
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2020 14:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q+IDYurMPfHEiOpBSneypI1nBCycXNGXQAjRtkYHeG0=;
 b=gzfPDrrNo+stnB2cm7l+sXs+zI709TI5KictoacxJljAyWeW0XCaRX6CMQIDhNzvw3
 eIBkoLeTR/n/NJA6Om1HaDfuTn/ZMUQB5NC3UAmmtB07CyyxNMxxk0A3FBNAvFB6whz5
 t+faGYdQis1KlWKRXAYcgJl0KUm1ox23DvT700g0ymL7mCo3WTcogd+N6vcU0XvhEeIs
 mRvzoQAA6IkxZhsqjO+hFVAR9shA+XjuNHVLo47SmuLMaJIYm1ctjdWnzaNUaUKK1yZI
 PLR8cjILp1zdRS2EWNY4XVf7Txb91UacAmmwZkppyi35Xd6BwS2wpImCogbjfO3v/kvh
 0Q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q+IDYurMPfHEiOpBSneypI1nBCycXNGXQAjRtkYHeG0=;
 b=j3EO9tGaNuCEC+I7mGFo+vWyOWH0RktHwYZUl6F+2A85qJsdKJSvnb44NgsBTEuw6p
 Lx9M+7xasg2FG4M5Esv722y928bO65FtdUzZK8iijOLf0scGX4Xt+WJ0m63tJtwIrpo3
 etR5VPxc3nVyCIR/b2jhUH2eDVpmSOqyUBiFSIMzWA38k2PDyFlIMCTK5NNuU2RRoWtU
 5+Htk/KjszY+vViUO4Lsmow/eeMgiceiTBzV1pjcZVrVHGb1Z2yUTXXOb76nhYRRjDRP
 /U5EST/GdaSbw8ceGDshGYUe3uxm3M6uItsAVHE+5b+G1tEchZRIhF9360MJ3wbMGEAO
 OMUA==
X-Gm-Message-State: AOAM5307YVXdrLM9msLkL1bIetIwY8lkuD0DdPRpH/1jNTTqkHUOV0RL
 tLvf+Vf29csk9blfqHAYJYaihA==
X-Received: by 2002:a17:90a:2c46:: with SMTP id
 p6mr6898062pjm.166.1605825460229; 
 Thu, 19 Nov 2020 14:37:40 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x4sm699756pgg.94.2020.11.19.14.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 14:37:39 -0800 (PST)
Subject: Re: [PATCH for-5.2?] target/arm: fix stage 2 page-walks in 32-bit
 emulation
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>, qemu-arm@nongnu.org
References: <20201118150414.18360-1-remi@remlab.net>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dcebc069-43b7-0a82-809c-55d6b090fff9@linaro.org>
Date: Thu, 19 Nov 2020 14:37:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118150414.18360-1-remi@remlab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wd7eqLl8xm0p

On 11/18/20 7:04 AM, Rémi Denis-Courmont wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Using a target unsigned long would limit the Input Address to a LPAE
> page-walk to 32 bits on AArch32 and 64 bits on AArch64. This is okay
> for stage 1 or on AArch64, but it is insufficient for stage 2 on
> AArch32. In that later case, the Input Address can have up to 40 bits.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Peter, bug fix for 5.2 or postpone?


r~
