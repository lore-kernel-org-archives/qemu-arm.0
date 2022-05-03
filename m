Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1531411lfj;
        Tue, 3 May 2022 09:31:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi7juwfDTYr1slqNe5pbA7rWbyXmy0APZ7penbFpQ25xkxR0aE5Y0Ch5IIko8faEvR16lp
X-Received: by 2002:a05:622a:313:b0:2f3:ae50:bea9 with SMTP id q19-20020a05622a031300b002f3ae50bea9mr3403692qtw.276.1651595469108;
        Tue, 03 May 2022 09:31:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651595469; cv=none;
        d=google.com; s=arc-20160816;
        b=mFKG1pqyxwMjlJtjw74QpU73oWUI5iwk1KYzZLatvKbvOuvayIAwbK0rqSZoqHBchb
         7AAOexS58j7jQ34tGhi2kiROT8rIzQhhvKe/KcChtrNYZnHBrZ+4aD9qEdvuQLGxZfUA
         eY/NaxMpACX4GnBHSpl9XCP8qFh1+VyZOIDyZs8D4onX2R9cM9fX2JjQRAgLPnLoGetO
         ZG8YYV5ymvG6nrn2y4ScUAjx8zPoPuJV9vHYlEYMKmBJVylrN6n36fm6jJREIw38sy9T
         8O3BhgAfKbq5NJIyCCdmFcC7RqCYn22IWKuHT5VNOfjy+EsYxw1EcXOX5almSxy+RfE2
         53xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+zzEb4FkMCxElM+ai3vup1PidQzwLCjGmY0/ePMDvpM=;
        b=jNT81sSq+ewMlXNbTgi8tyKUC4eGvTAZHpyrD7zcDOKWBkml3444W2Nihrl7+pRULE
         qST9YZQ1HvHsh5NJvYwx5eIEwhNHolIrZSkbpJn3TXWFDO5yLGPfQkbWwKfRizKd3jJN
         E+vKrSxc2LdNGvBL1Rn65oqXOYkw0RGL/FJwOZqBqfzV5vMBeIYgu6MSCQgSB3+QGvdc
         H7A3bFlxYjsrSj+ptxO+/pTuy0igeten6f3J/D+jgA16jM06ZYlEpAaa0VXw8BBXuKvW
         7yDUCCXNVBWCEQcc7oDLPCiH48Zt7p9kiPHR2UhROy2hdSOKgCN/5B+gYvlghUScGcqW
         X+4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JOSFrur9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12-20020a0cdb0c000000b0044c27313aadsi8101829qvk.6.2022.05.03.09.31.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 09:31:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JOSFrur9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlvQW-00034b-5N
	for alex.bennee@linaro.org; Tue, 03 May 2022 12:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvBm-0004FN-Eb
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:15:53 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:35662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvBk-0005XN-AG
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:15:49 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id w187so31937811ybe.2
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+zzEb4FkMCxElM+ai3vup1PidQzwLCjGmY0/ePMDvpM=;
 b=JOSFrur9yzCQSjG4NdY2/okOKqqLTW7Fj+dCyme97s+8xEsUROECJLHtuMiIwcoCEx
 eGwCIQLeLOa+rUsQTbCJU6c0USZCPptWx8G2BzQ/XMdI8Pc2HX1p9K6zeFeXMWoWbE6/
 Av1a7y4CuwMked+4g2h3m6M8IWxBzZhlFXYWyZ5MhSRZL5SsQDHsDoBZJtt0UUpzvxNY
 Dj6LpvdJs4fuE3cVKsATfPhWIgDSRPXIJmlkBRS4T2NF7vmoyRQ4EidGJtAS1PRXYh4m
 IsWFljhXK2Jra0ICGflohQM2iy9eF28F33zlqrY5g2IsvAummE6TjSfXDha9tNaXlF+s
 9Sxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+zzEb4FkMCxElM+ai3vup1PidQzwLCjGmY0/ePMDvpM=;
 b=pTZbCucqUWD0Z7kWeN14LTMaD7d5FSS/+w9Nj2TfThFlbVlNIhUWGyhMB+iK2UUaA0
 qtTKlyfrAa0RYZ5Wd7AFdTREY+KewZjLbpNJ6iU1I4Uok0+qR/1em5t9sIdlyn7SszHH
 IG3NyEHoW+wggerzhodGs3J+XpcnzHMcWbN5yudVGjVqWQRINEtWccrbPuti58o4tcIG
 SQIV16t8pEX8tonk8tLn4MB3vF5+1ZWZfNpySErJYbEwFs/SEcLk/8Ks27kWJ/9Kms39
 wzt6Zv6TxZ9IZgJ9Rl4bzWAWcMHmwLX3aQUXie9WCoBcL7VSuouGTjaqj5KLzzlASi51
 DJYA==
X-Gm-Message-State: AOAM5335WqxFk3qyqQCDy4KakbnG3noNk8qeQA92hAw8Keu7pvhgr4DM
 7nM3Pq9BVgvZGIouFMQRcQFJ8YxyKkGBjf1e0M9zS//PAcU=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr14084047yba.193.1651594547019; Tue, 03
 May 2022 09:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-16-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:15:35 +0100
Message-ID: <CAFEAcA_i4kMjPbP9kdk81Xh8vhLtYy6f1n__Zhh6_y5BF_6XMg@mail.gmail.com>
Subject: Re: [PATCH v4 15/45] target/arm: Use bool for is64 and ns in
 add_cpreg_to_hashtable
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vVfT27MoaWgE

On Sun, 1 May 2022 at 07:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Bool is a more appropriate type for these variables.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 4 ++--

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
