Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp4160277njk;
        Mon, 23 Dec 2024 08:29:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXa5/lfjIdFWmBqIxXU5F2ZYKWvC1/pR6TyEeIPO7cwRcZbfYlU/9FQZNqDpCbeuTypRzSnfvFR6bsg2A==@linaro.org
X-Google-Smtp-Source: AGHT+IEtYK5aFLZwa992R+0o8yxo8D3cwWYz9Xg1cMCA+sYVKohC+IIdvLjixPMeY+gNY2xNB6pT
X-Received: by 2002:a05:6102:e06:b0:4b2:5c0a:98c1 with SMTP id ada2fe7eead31-4b2cc462483mr12086332137.22.1734971389565;
        Mon, 23 Dec 2024 08:29:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734971389; cv=none;
        d=google.com; s=arc-20240605;
        b=BFs+57R6n2DaoDzyivS2pvYjJ16l2E2eZIiEc+XJjaHGML1OMu+2XEkLl2OvOewoKw
         Qk4QFK/IhA6Pgh5VO/6/LkdlPhn7heuLJtL/DXfw2pu80iVJKoyT22BjX+f39CZp8uK+
         8cunHdB3aiEVoaEeZ82kAOxlKU3AHqQ7GoeDeBrzjMD/EtyfRs0XdwiBgl3GI//XQe4T
         WfHrmm+AyEQc/frYw3pYvM72/KcLQo+gJqOkJJt/MvdQCpD4EeRJvXBFrNhta7mXhYsf
         SacMVfy5rkcccmMHPI5zVoyuuSBAw0D6fCezCl1HCiXtGiPKdzeDPlc94iO0fcdC63CI
         KRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cvOlv5tQioQ4u3aXYsfz5x1SOijsn7NLXaLikJkyybY=;
        fh=lVAfWPuqg4+a9KSuqfiHQ5ehZA0DiAteSN32RtCu2bc=;
        b=d6aZs8/cijPD2GpxI6NBb1amrSJ9XkVzLQDNpuKEvpxV0c2P6W4oOzPUK6bxVtvnWI
         fDq+pnFcQ75mcbNE8pmpOWGb03EVYshyyM1S3RQd1ybkHtweb8rHT5hhUtgW5AW/p8ey
         lClPCo2/4MS5I5ksyfgkz0DVre3eflJZQ22m8XKXoxcjhYW41BYjELBqKDq13FcO7+fR
         7QJXe/NOksGyOcdccSeziaQ9ACqcKwbO2L2bNgqIQ7w0lMr4jH9kxRkZw2XNNcPBR+XF
         U4pq0TAfLnuBRXNwlFPUUQ5NHeJ1w5zE0Kqn9HvjnyXbHCgvJccAU+LVOi8Vm61cxhOV
         rAug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B1BceDJe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b2bfba263csi3079321137.563.2024.12.23.08.29.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2024 08:29:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B1BceDJe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tPlJ7-0001U2-Ej; Mon, 23 Dec 2024 11:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tPlJ5-0001TB-KX
 for qemu-arm@nongnu.org; Mon, 23 Dec 2024 11:29:23 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tPlJ4-0004Pu-1Y
 for qemu-arm@nongnu.org; Mon, 23 Dec 2024 11:29:23 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43618283d48so32357415e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Dec 2024 08:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734971360; x=1735576160; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cvOlv5tQioQ4u3aXYsfz5x1SOijsn7NLXaLikJkyybY=;
 b=B1BceDJekwZ5qgpThfbhZbW97UmKbv5aMonoli8KA9C+WuzME0096GKXYb7OaQ26Dc
 RBU0/uV6WHLvc3LscHWxbEsdXtbZt59SysMLFfgR9oB82VnM+BSvxBeVYyBFJpYLUoq1
 ws+oySGgsFNNMYopJ/FSj9mRev7IjAtNSl+1g2jj3tUlcbwR9YiY2H82GIvItvKidpeg
 9h6i1qhDzfzaYPGjQndrGz0EiP5j1hb7u4t6eyQTkLLAZBVEcjAtNOTDYu0wtVYA0Htt
 GA8e0g1DND6WpgQlT4VQFOWGXQUdM3rfPlRC8uro4dB+jCyghVtihx5ewCl/xEt6wVEG
 7fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734971360; x=1735576160;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cvOlv5tQioQ4u3aXYsfz5x1SOijsn7NLXaLikJkyybY=;
 b=khDbRjsuPQ+FnAg3xQLt35/fstPqpGiBKg2koBFhw0gnXeXFnLWPbxqm3S/RQGsY7L
 4D9ynz8VbQnY3xggv453PiiZaDl/Hh0i5I/VqFGL/dH8mSN9612bjTId3WB5CrmngCMY
 r6ByAoLvA4bXh6QICiy+wlpCfM9qLGzElO19PgG7IQq7UbvUy9nyMNcjYLz8ZLv5OL04
 0Lik2c/7QQMpwNs5siPsHuriHQg8j29ePn+w1dY/nv1Cvm6PNVSlY17FnbGozHQRXAfP
 tiTuzGTL/y4peiIUppR+zBZJx3Eder7mRGPo4B98qP2OVId9qmrw5jVzdSckbkXKK1OT
 DS/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3AlsDvDhUZTa00NY7gy0HSXutUPJYTBf6mXAeCaZmeqLoYrI0kBZQcraEn3F+nTgrIROhz/0nxA==@nongnu.org
X-Gm-Message-State: AOJu0YyPJ098Wlb+TpRPs6KbDetkgXsvcgucu3cizVktcozc8LlY9ckw
 9I+lXP7EgAevHstq2APcLRiVj7SFtgNip54QdseHGxGPgij+QjjgzPJcJoPoWSw=
X-Gm-Gg: ASbGncsjnUTCjTkbIYKBLSfe3wEe9fFlEC4fIn7aDUTYVwHvEnnAlyyc0iTkaKUThQA
 MVd7UBY76NTWwiehOXIk4Bl4DvpYfBCBKww8qiD04707gOXZhwzf0LFXGs/qkP7vVn1Bb2RJV9g
 cCn2A9HMdFkbCSxb89HxGgVs1NzQyMPY/T+YGhpKSjmiy1ckx1F+GmDOve8o/4iG5IDlY8D3yrw
 g1HLkvuN6NmttUI6XwbHPH7B2yyJNd5Hmk3hgeD4ioUzXWKoSKM+hUaBtOT/Mg2DCDel79pYXp6
 nhJYbWe4oCBjCtruhOI=
X-Received: by 2002:a05:600c:4a83:b0:436:1aa6:b8ee with SMTP id
 5b1f17b1804b1-4366d356735mr97671865e9.2.1734971359957; 
 Mon, 23 Dec 2024 08:29:19 -0800 (PST)
Received: from [10.89.88.213] (51.171.88.92.rev.sfr.net. [92.88.171.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366128a44fsm140231775e9.43.2024.12.23.08.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2024 08:29:19 -0800 (PST)
Message-ID: <d861c401-483e-488d-a03c-cb11d0e80bf3@linaro.org>
Date: Mon, 23 Dec 2024 17:29:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 05/15] MAINTAINERS: Add myself as maintainer for
 apple-gfx, reviewer for HVF
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, akihiko.odaki@daynix.com,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 balaton@eik.bme.hu, Roman Bolshakov <rbolshakov@ddn.com>
References: <20241218202036.80064-1-phil@philjordan.eu>
 <20241218202036.80064-6-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241218202036.80064-6-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: k5GHAspo6s+s

On 18/12/24 21:20, Phil Dennis-Jordan wrote:
> I'm happy to take responsibility for the macOS PV graphics code. As
> HVF patches don't seem to get much attention at the moment, I'm also
> adding myself as designated reviewer for HVF and x86 HVF to try and
> improve that.
> 
> I anticipate that the resulting workload should be covered by the
> funding I'm receiving for improving Qemu in combination with macOS. As
> of right now this runs out at the end of 2024; I expect the workload on
> apple-gfx should be relatively minor and manageable in my spare time
> beyond that. I may have to remove myself from more general HVF duties
> once the contract runs out if it's more than I can manage.
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Roman Bolshakov <rbolshakov@ddn.com>
> ---
>   MAINTAINERS | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

