Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2422496ejb;
        Mon, 20 Feb 2023 08:21:24 -0800 (PST)
X-Google-Smtp-Source: AK7set/pBr2Kd3Hlo4jTm/nzEmVgK/1gXR8hxmwqllUOLQs5739Xvug+tLWtWGJpf695cWBRej/8
X-Received: by 2002:a05:622a:2cd:b0:3b6:30ea:e95 with SMTP id a13-20020a05622a02cd00b003b630ea0e95mr15472250qtx.18.1676910084349;
        Mon, 20 Feb 2023 08:21:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676910084; cv=none;
        d=google.com; s=arc-20160816;
        b=ctym+cPwlOmsZxbyjX2T8OLc9aBwWrHst2ULhfbYwVVd8yEqRKsi4OJni3YEbrqGVG
         ZgHytlvKPbe/RbyK6MUmUEhtaIFcALN6uj7JnfRM6wh6p6zuRxdhd+apxTMmUz8HopgT
         fwCyhySFW6Mm/VFXnBrJYpQ0nwzvoWkbQW+mh29tKRwg/2n3uYVqajI1By05enL1liFu
         Xy11zZO29OazzL1kxa+v0JyXo1vapyUZdZ1+XzzlETocRXF1taS8L+Xxw0UHN81BzLdE
         I1GVdykTDkaAhTF5lcegP8ZHReYJNixmeV5uuKz/2KSxViwwbqzPtlfhklKvpI+Q00Rw
         F62g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=R0CigNqR+y6mQy6PcWAcwhXjOfblUxZgAnIovVi+BwQ=;
        b=FoAF0bmwZ/oZgbAWWyFUUilnttyVlYE0h+vFnYy8/uZbNXeYizgxuWNk0aAZcaQpQx
         Jl6ZVuPQ1aAftFnMA+5/A5IYypvbtEKMeU4kXzuFmKNbfTdzS0iA/UGUtDR1OW/UBh/W
         xPNy2GqWy+7cQoDPB/I110YWXKdN23YFFlVCUVkNsMGVep2amsdvtZmAGUMHVxwUgMD4
         USlK9tcY6Bp2SyL45sMJYgP1WOzQSW/I3s54XJBQ/DpDg1J/x5xsFKuBmBWuaK+jS7pk
         Cv7li6Tc/QWApv04NMoO9vCDVlBySALsKdPM3/FtzaHKmHfQsTyNOxENf52Doy2ckP/x
         2UIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XLl5G//n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x132-20020a37638a000000b0073b8e361f55si9057994qkb.81.2023.02.20.08.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 08:21:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XLl5G//n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU8uf-00044z-97; Mon, 20 Feb 2023 11:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8ub-000444-7v
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:21:09 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8uW-00026h-VX
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:21:08 -0500
Received: by mail-pg1-x531.google.com with SMTP id i31so300675pgi.10
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 08:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R0CigNqR+y6mQy6PcWAcwhXjOfblUxZgAnIovVi+BwQ=;
 b=XLl5G//nHtIB3B3Zjw99kr1he/EzwwOUlV/jY5SAx1TD1L8l/VKA9sC/tHLdltiHWP
 L/v3UUM/VYuOh7t7rWqj4cYNpfMmvq9dy6BZpheVQMycdvCGGiDehM7acs8/AmEKjn/z
 JQaoxbGcDfM4tyhiKZkuaDecnkvG7l+SAzrHCjPtRtXwZ/S0brz1CwwkKMQ77ylrhZlp
 qgtuWBosG3tS30yANqfYzjbSxUz78ZekxGWdRkSP2m2ExjFgia2LSUDbge33M8MSH8HT
 TOp+9hXhb6PrxDGgtzAXBemFq6gvBgr3ymIBNdhp9n2GqRawzk8lEJJCI2zENXKJJ+Gf
 jsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R0CigNqR+y6mQy6PcWAcwhXjOfblUxZgAnIovVi+BwQ=;
 b=ieRsb07lhAu6sgO0ICgtkCuPVngaUJ+3zzwCpinLSg3lFuO3mNBV60ATqSueiUbfSr
 JBaxKtK4ZhksaP6334b+cI984OIhNOE5oEQie1qXRprIjOnh1gyHI9sIO328phQ2yCW2
 MnwCqUeUAUoxmENEKTTQzEfEgzHBgLKTSzaAB9OCKKTmRIiuClS94+iDgz8y75NhZX9p
 CayfvyuOri5HZZyreLDuU+LDWTYonHCBOrszL3kGEolwXJJ3D5Cta/LaIRf2tbi76xGg
 qfaGhIkx2pzt2DfKDktKN7v/M1PWCGmguGkz8DMoumYmOyomUiuYPlqP8WBaEN8JcBL+
 D8tQ==
X-Gm-Message-State: AO0yUKVTqsGCEBRpIJskhMsCU5ptMophB/0KYRrSTn4txv346S+mhPbZ
 QNZslFl7DNhj1wqj84dBGqZ70dbbFf4HDq4pwBKS5Q==
X-Received: by 2002:aa7:9396:0:b0:590:3182:933a with SMTP id
 t22-20020aa79396000000b005903182933amr265126pfe.1.1676910063336; Mon, 20 Feb
 2023 08:21:03 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-9-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:20:52 +0000
Message-ID: <CAFEAcA-tOWZq-ppwn__ct+qiRBHPRgPO6dy6QBUWmcHChZA-cA@mail.gmail.com>
Subject: Re: [PATCH 08/14] target/arm: Add name argument to
 output_vector_union_type
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 4eztmREYW0z/

On Tue, 14 Feb 2023 at 16:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will make the function usable between SVE and SME.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
