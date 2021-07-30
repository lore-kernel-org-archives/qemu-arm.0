Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp516523lff;
        Fri, 30 Jul 2021 12:38:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKKfRENBhJKwNL9u3LQtsJgrq/C63wUy7Z6WDeYkJEZYitPhTwC5LKouedCEFxaZDwhAL+
X-Received: by 2002:a25:9d85:: with SMTP id v5mr5294553ybp.486.1627673894138;
        Fri, 30 Jul 2021 12:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627673894; cv=none;
        d=google.com; s=arc-20160816;
        b=x/kWBM3DtGHVzSfCzVDZelHQ+Bh+0WxsQNVt1hBe17UtpcpLCa2aoPvTxKrHv9IWXk
         gD6b6JXTu8IrJzWTp0uJOV0SGVgj7erVair5uKNBgJd1akkuz9fLbpPOBbQ1EP37XWcM
         T13oXurLkQTxDhhhDEVAPlsEJw/rJsE0gDIOIAvA3SF7sK0sMGvpSshtW+RQ8sPcyAUb
         Y0XF5l92znQBRoxsmxjo9+FlMnSspDJrTQv6Y0zdoJFa+F7evuMgVTbenPNUaPDetZsV
         t8Xv6HCLSs8Gi42FISfIq2BPYzaotDD8zYuV2Uk2iSy/Hs2OW//8+qhvEqG/XllCpTQw
         fyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iV6gIF2ENaEkFG2MAB4GuURIeLK8atjv/HWcfOEyUxE=;
        b=JHCUjwEyM5pREGkzh85S8cjFfeSueHHm2cA6/l3IjxeseCPW0ivIxKLE/ZHUOYCsci
         PqLiU6AtywLH0ci6odjZLwlZc/QDkb6rL4kN7ygu9tXcd//CDMtB+Z6k5iW5GmJe1aeC
         ZxYik3vW/2hhFGE+fmK+1UgO022MrtWYLvYhbfmfyM7kt9DDr45oEFzsogonR3htmMzm
         4itI/rhdcBDAPthh3VXIMHeFTLHYS5Ru4jQYk29neIp3xYY4fvxduJuTKA8Ewp7QhOXs
         XrKgA3fUj3slaH7c8u4fjKXFmWHifgHJkPZTnxMqr0jiaYU62qiTyxL7osy73eA5hBiw
         VNXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Zk0zqT4/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3si3049168ybr.176.2021.07.30.12.38.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 12:38:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Zk0zqT4/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9YKj-0003rp-1O
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 15:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YK3-0003H3-J3
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:37:31 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YK2-0006VR-4v
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:37:31 -0400
Received: by mail-pl1-x634.google.com with SMTP id u16so3766588ple.2
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 12:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=iV6gIF2ENaEkFG2MAB4GuURIeLK8atjv/HWcfOEyUxE=;
 b=Zk0zqT4/V85xbqjokZKoFKllfsa0H+f9H9gTVmJIySD/lfZSddap4xvubrLhLkeYvu
 szUme0LyARKjwjbodxr5sLcZkgd8Ofz/6XUSg4rS2T9OrHP8rDz/BXHZJ9XIexSNXGa+
 E2xHrtIAmkylwME4ztM/N5VrxWjG56wR5HwacZmd62xhlZqrTdeXKcifRwbNoV5jHCiE
 Q2wmZpxFrdX2iej59JVTHTSylAkd8UIiyFzEA20cnorNW/Er2qLPbHzfcycbRKQJ196Q
 pciixXglMJRkYb/Twtgdqi0zclAI8Ueb+vvhOPIv9E8azWUCYhC0IGCRNrR6eu0wLibi
 /tmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iV6gIF2ENaEkFG2MAB4GuURIeLK8atjv/HWcfOEyUxE=;
 b=UZEWZOFTpCw1bf8+T8L0NQoqzSWu2Iv4S9ILc+yLH/0gA/7nmMVZo757jAHQ6bxgO7
 +awy5bkbhggcyGEW4ctxKshzKgweM4d47FnXSm4DgIUwc/LWq4OFbkpqC59gJCJQjhtl
 TRckKMAhSFJVEyXb6Mn9PVOLcrys9F5+gcWQKVfyn/gvWvkAfcCkv2bYFhRomxuspIIP
 KkdCdgJEw2y9PzTMjGl+gvCDKVN7Qb/TPIYMh3H5BUf+pwu5QOgs6Bj9E4qbA96WtGHK
 QEkZClBiKc5LL/G/SMYZDZ3dwGA9clXM5cQBuCyEdWAN1xghxfC4wE1W0WN4TvVJEHq9
 nnMw==
X-Gm-Message-State: AOAM53345aOG6MGAg1vxfyzE+F17+Y/UWTdAXyQm5vUef+Yr905B/c9+
 0K5eXTczXL2P3ICHKDqOAZ6x5LKZ+RU0DA==
X-Received: by 2002:a17:90b:1d86:: with SMTP id
 pf6mr4721434pjb.104.1627673848610; 
 Fri, 30 Jul 2021 12:37:28 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id n7sm217999pjh.8.2021.07.30.12.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:37:28 -0700 (PDT)
Subject: Re: [PATCH for-6.2 36/53] target/arm: Implement MVE VADD
 (floating-point)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-37-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4ca3395a-daf5-4f23-b494-9ba332e0bf19@linaro.org>
Date: Fri, 30 Jul 2021 09:37:25 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-37-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ULZ4yuLRn9Zd

On 7/29/21 1:14 AM, Peter Maydell wrote:
> +DO_2OP_FP(vfaddh, 2, uint16_t, float16_add)
> +DO_2OP_FP(vfadds, 4, uint32_t, float32_add)

Use float16 and float32 types here?
It'll be more interesting with some of the other macros later...


r~
