Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1017557lfm;
        Fri, 19 Jun 2020 15:55:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZu502w5ERv+GFg2W9c9SfpZZe5jMNmf2qeXdzSfcV4agysS8Ueq/d4rWwVLQdk+xSAWGk
X-Received: by 2002:a25:7386:: with SMTP id o128mr9672589ybc.266.1592607339904;
        Fri, 19 Jun 2020 15:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592607339; cv=none;
        d=google.com; s=arc-20160816;
        b=AkD8UU6Jx09CngzZtfiAyX62peWFgxd3Z5GIBTTYicqNgjkBHr0POWO4gy5e4421mn
         qfxs3iH3Brnf3M11FELqATWPsRixuhQOdbAK+XJVOPKIc6kmIQxmWAupsN2EsWvl9PMT
         0yTzUjTtsVtESl3EQXKqyDaK6JIicLYE7AIX1WD4sxggUh2EwtwEB3O3fzTMseyTHKta
         YpD3rZkX/19eVB9mA62PQeUtQZ904U+cHIpteXJURc82BX9XLh00Kau7lS7o+UVaRJJh
         imlT9jkFhfyVHcfHkW/yoVObhe1E7Gn8RL0YsQc0468h4QOKIhWT4gPMFDsFTxjyqdMk
         fJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JJy6te62vgLsFiwBnTR022jPSplVVJ3aectN2uosuLg=;
        b=iJosaeiRdFxfHBDpWvX0uJWSrcTj+jew1i3hSENBwEOxrQbJC/UCnoYN0y41SMxgqs
         zxiA342vo2JkZu7BpTiuUya8w8IVglZJX/Uothe8NDSQfUWbXn5UCzRO0VrJFTQ/41wB
         sQqujvZ8b+H2I7FMfIyqXrHHAXq79riE8ycDsyFYnCJupTv2bMspungTzaFl2KQvhuEc
         mG3G/SI958UmZ8RuahadnnHiE9OiTpxWwKkM8AwZfjoJFH8pd33FqeokFKsc7zoZ8CRq
         6EItXifdOKL7EzY+oVUBxzc3J2kRoVdhLmkyccrL7zgMQvUjl2HR6gTv1IJCJbr370XV
         WkxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rh9dX1RI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4si6538315ybp.143.2020.06.19.15.55.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 15:55:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rh9dX1RI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmPv9-0002KQ-5Y
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 18:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmPv0-0002Je-Eb
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 18:55:30 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:33047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmPuy-0003FH-Tu
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 18:55:30 -0400
Received: by mail-pj1-x1044.google.com with SMTP id b7so4838931pju.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 15:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JJy6te62vgLsFiwBnTR022jPSplVVJ3aectN2uosuLg=;
 b=Rh9dX1RI6W9OcruHBwRy8pE8OIapQbEcDu5XDzUaDhaBCB1rz5WY2UyLbFVaOXroLi
 E8wRa5fxGLHskmZAR06onKBDkvrVFdzub5TB6RvcoM1o/Dtx8dB/zocjK1fN/ifEPKTB
 u5nQEp6o/O6uwlXhVW8JfOp/jm2h8ulgQdE25nn+J0PoZVl420VQKybKsA0qPaLmbK4r
 03WSUJobJ31jDYr1kZr0rrZbbpy2RUaCyEcsxRl5O7G9j0hAvLqKmdWuN6YBdp9PgGFi
 jx2JxDa2n9AmFkO7whARiML2jZ+hPbbzG0Tko4BPtFDniUx+kVYjLNU9hw2d/lw7YEc7
 uaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JJy6te62vgLsFiwBnTR022jPSplVVJ3aectN2uosuLg=;
 b=L+lPpZGELz/3yHPxhrs7FtIYwlLaKFvsFv7V+kRAm+G5zstaaCFn07aq+2ak955VSP
 UvZxZGmkKs8GGUwloxEY28u4oAwCCZoYAs3ELS4fx8oLIk7jfDXXtuL/srg0dxfzrNqJ
 NLLOMfZRgCTAswuhugmd6iM3Hw7F4guOoLf2umVWfdPgK3vgerNJWDx/cXxi266sRCX3
 G2x2cb1aMmsYP/RC3O/yycbve55zprMuj4hXrdlgglK2wJUQtr6Fv0Flphoj9DZtfKGK
 JsAVaA7lRLxB5zGBVedQsydUZQO78UjFK0TmDhivWXpv87Cu20WCvH556llT1JekNjVy
 4Iyg==
X-Gm-Message-State: AOAM530bGERHp9Vxt252Rf2qNivIrYF1UgXzjbK5YLFbb9mvHpxESGXf
 dGW4Y2tyzKsVF1zYVNQFHxGPiQ==
X-Received: by 2002:a17:90a:f414:: with SMTP id
 ch20mr5440387pjb.97.1592607327323; 
 Fri, 19 Jun 2020 15:55:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id z140sm7063799pfc.135.2020.06.19.15.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 15:55:26 -0700 (PDT)
Subject: Re: [PATCH 05/21] target/arm: Convert Neon 2-reg-misc VSHLL to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e19ef48-a3a2-ba5c-d2b0-3135e944d89e@linaro.org>
Date: Fri, 19 Jun 2020 15:55:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: 36x+Qrv8bPhE

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the VSHLL insn in the 2-reg-misc Neon group to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  2 ++
>  target/arm/translate-neon.inc.c | 52 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 35 +---------------------
>  3 files changed, 55 insertions(+), 34 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

