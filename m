Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4968760lfa;
        Tue, 3 Nov 2020 09:03:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6s2fZ+k5lS1sBS9BK/SBTc1+yLrxo/VfHebbY/LAehj89e22adFo0KyRiKfCCa4qMlUwa
X-Received: by 2002:a4a:bb94:: with SMTP id h20mr16383248oop.73.1604422988946;
        Tue, 03 Nov 2020 09:03:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604422988; cv=none;
        d=google.com; s=arc-20160816;
        b=wDEY1WC47Im4B5rQVz3yTTId8eal+sbSRk9T74fbNUxHuUndE0OsE0msrwE5szTezL
         46TzRnSI7t+Ur+m23+01qkTUc1cmpo5+nyPhsDywugZlz+7w3e7Nn51ebtgJfjkf3D7h
         UoegS4eDDdgSNWuQJ03X9Me9Xc7oHggok2zzXrToYJAHaieMaA454M94d71dY4RV/Icq
         tYQjHUE6F1A5dXrWYe5VFahXRzTBniUOK/M+JFNbXnJw8EUvsDsev9xYV69HWAi5PmZB
         gWgrYhezMbkhDbL8eWTYVvHPav8hSH/cI4xlk1IbF8b4wWgE5lWtCw7HmdmtOwxWydkZ
         xMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Jxkel3JJmrCgif24PtuabRaQPDHuLtWFpcFv0QUuq/A=;
        b=xXNbiUBaC094wd8hy0vdYgx+pWTNYiykxomZwF9ErnzHMpYnmUKXaWq8uqpUSq9eQH
         Y0wqoCBShP+PDzT0w/prmv9qNrqMVcqa1Clr83Z5lhOojoL+gU5J7FTS9FOIqZW1bZRU
         yWRq8SQhkj+B5m4x2ICF/6rmQ209TIDJbDSOJmMMvwsw6C5uug0nBXMYrF8tkGPcG/Kk
         LGKvmDZY3yTf/tXfMp4OF4MhhBEGdri0zWNEPgFs03/5vyv6CsVW8wrXSu6+oi13dfvL
         /dmT4c+lP3tdKbKbnOF+Ys2r4bseSLcgke0TCsZa3gIFq1La5BAuYGxJEBEQRkI0G/Rz
         LZUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E87H5ZRO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18si2656742uan.197.2020.11.03.09.03.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 09:03:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E87H5ZRO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZzi8-0008U4-5s
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 12:03:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kZzhg-0007rM-RN
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 12:02:40 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kZzhX-0000D6-78
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 12:02:40 -0500
Received: by mail-pf1-x441.google.com with SMTP id a200so14734474pfa.10
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2020 09:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jxkel3JJmrCgif24PtuabRaQPDHuLtWFpcFv0QUuq/A=;
 b=E87H5ZRO3+u7x72vXH+uj+vJIqqUQzBW1Vx1V12rUb/oeP2n95K9JNuHgsAIqJ5y9e
 ogKdOskxBR5jdk47Cm2OBeCyim281MyXvnjTyo72YUbpLZ0jdMlTiVwUW6w2rKAO0L+h
 5V9bggcA+0I7CL6WbaPwVDU7JZC98cyDomY/M0vp93D7fRISq40MQ7k/Gh3WFyTgxPTp
 V3rlkrRZz5cNbR8QE9Js3NwD6trWHIJMjHBuPccpbPl+aNJjDTBZFGmoO9CM6tF9yomf
 8vxXE2F/RWbobw2nsQaI7zE0pB0SedIUeso9i+Xsl8026BpWDnfNYSuz/lAi0FV9nA0i
 Mtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jxkel3JJmrCgif24PtuabRaQPDHuLtWFpcFv0QUuq/A=;
 b=nNeGR/pB00zu16OYQd7vP1dIjFZW2nM2USejHqJD2nW5d3qPHvW7d/piOeNxA7K34M
 0VPr+5bdwN7NZhJIOfZVo2Q5k8/U9Qyl/l3gZP5YPo+UnP4hyYS1ljMkylkr2g0SKPI4
 EBM//sbq4z5AlpitcDzSVFOFGFXAa6j3TU8s3CAgU/vkV/YnQUjDsr+MAOe9jr4EOpzL
 ezGUhzvx3OmQi8RkfTQ354YfsbjNtd2yf3R7EFFfxZjqpHKpc/17HC5J2qBlCtDQpCoo
 zrNbAS7J3hKcKdDcrhaB2dfK6bECinnjTBekNiQOGOrWOSveDFn2s4JyuEmpOHfpeL/f
 OQjw==
X-Gm-Message-State: AOAM532z4pn6NMxRa6zfA6v1jP9vxHmjuiJsG16WWjdoXd/xmQHyj8hb
 42rCdVTZyS1H4RJ53whULyhZdSO/0lZckA==
X-Received: by 2002:a62:6496:0:b029:155:b152:f0cf with SMTP id
 y144-20020a6264960000b0290155b152f0cfmr26922040pfb.75.1604422949849; 
 Tue, 03 Nov 2020 09:02:29 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id e9sm6863292pgi.5.2020.11.03.09.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 09:02:28 -0800 (PST)
Subject: Re: [PATCH 05/14] target/arm: declare new AA64PFR0 bit-fields
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-5-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10a9c623-6969-a656-d44e-350e26cfb57b@linaro.org>
Date: Tue, 3 Nov 2020 09:02:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102105802.39332-5-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eLxMc/zTdl6U

On 11/2/20 2:57 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
