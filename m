Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2379818ejc;
        Mon, 9 Jan 2023 08:07:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtMXmye8Ee8qgexg2sRFwWd2nIDDqszR+1mRqwECiyyTRmJWAAqCpr390Y+Q6dhZpQv3vp3
X-Received: by 2002:a05:7500:3210:b0:ea:3940:cc7a with SMTP id bi16-20020a057500321000b000ea3940cc7amr5555427gab.17.1673280477817;
        Mon, 09 Jan 2023 08:07:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673280477; cv=none;
        d=google.com; s=arc-20160816;
        b=sqzyYZNES3weQswmQJqY/OV3GpENq/lVxALdaM+Dch/J81YgWPXsl0/p+dB36JnuSM
         ykAFjeo7iyhxmSOSDPwk/j8LqgNN1iI7UIoP4WR/zcS8CQUhMO6H2LGX4tXf+VOOLFPO
         TSKC0fMrwcqw9TajSOJiS3mqjHhkmhTirmv0JpxoTIQsbqDO2D3AOdEDCLXpxjJnyWHL
         TCL+u+Jb+f+xaewu95TtjWaBmUb1IX+TYb6YPY1wJubYDkLBUtms0PeOdlXfXd9+JLnX
         rOJpnIa7fHRtsQQCDqi5n0cXkmRRuTniYnli5DoJpGZ47zY9UmdR6gM0OlQD9ToC9T8l
         RjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QeD/Au+WkZZMoQ8NlNZ071A9bzA8RKkT+9L1j+ry3uU=;
        b=Zwsw1YPWgk+hKmedxZzaR0BKsGiWyGKNUiVe1sRR9b3RkoM0tR5xpaFOHMv/trI0aa
         L2VhwyH9LAHM/Ob53GESMkXO4gDsL4pfa4StpK5lgxHQF3Ixjf5CaHXwthmfKBjF80Vk
         TqWBni9rK2WbbMVpeRVifzjXyo1FaWXMu4be60TdBVwMgSBOBYPFGVLkfp1K452n3HAY
         zJkgucUI2mGZYnncN9HtXm9gFyRvTc/wb3uBVvuV1x68AjqU3FeLTInFeID5cysENKdF
         C4Hwgz2VK++mEPM3iz7MjBXp9xZFfgSzAOxp9SBddi1sHWTpWenXXTwyT0AcRpb4qn4R
         5xuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/gitLPZ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020a05620a268500b006cf0ae1f6e0si4696125qkp.623.2023.01.09.08.07.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 08:07:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/gitLPZ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEugf-0001jJ-SL; Mon, 09 Jan 2023 11:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEugc-0001h5-13
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:07:46 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEuga-0008Qv-3P
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:07:45 -0500
Received: by mail-pf1-x42e.google.com with SMTP id a184so6472791pfa.9
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 08:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QeD/Au+WkZZMoQ8NlNZ071A9bzA8RKkT+9L1j+ry3uU=;
 b=H/gitLPZgZ81jHnI8O8W67up7+tLDCBWiDiMEIk4qNpNTa7fkNY+J/Szj9JeDGUOob
 d92yC4ZPrT4E+Hrnj9QpaudPoZ2XK8cIUUfsH8pyZVHX4uJyw5SJEx4I3POjWPWpURKq
 QXHHPbvJnwcs5WFVN/G2G/poQVJgyoP4ifMUoy7U7L+U2vFxDRABy+wMGaxoMZWB9HUA
 5NCd4bgyBPN9bAyjVLE65s4CRk7ADA8JC+OS8Mkz4jfK6+wwwzkW2e8floVfJ9pgqt18
 9vwbu6ewd50alpXUdEp34DulURcprs2Z4PuwCz0hnZklKgCnvxIC3soLjy22ROiAoc9H
 eOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QeD/Au+WkZZMoQ8NlNZ071A9bzA8RKkT+9L1j+ry3uU=;
 b=ne9uI8ZowdqTpysCRFY7Rqxfuf7yNy1qP4lr35zG8l5NK/2/qp2kopdEsc4t3lnk7S
 xDZPbhDLtcP40XWokOttXpwBW2OLAlh467zOXcs2yJE5n6LdB72r/I4WfiE0CP14LS74
 mjFjwdltWB5JR8Dk6fsJRcigCaEI8Wf0cAo0uRsrbCAgZFErDncZqfOjOMx5f52NoW78
 6LnE1uLidhYW+dDTLxfKLAIkyg7U5spXX2c0RBzwJhbbSsy1QBvoyAKGKRATsliNZlc9
 vnVDaI18d4ne7prQ19xBuNWx6wJHRaLb9lOJDI2hpS9toHTNGUwiTLYRpwBtFg1dPJBU
 4H4g==
X-Gm-Message-State: AFqh2kokZnsRJ6vsdmwuhhIC1xjtpeJR/hiFNgmOV2qGqZaRRAVy2lUu
 iFhpBGZU7zQUZAhKJrYAy+LojQ==
X-Received: by 2002:aa7:9d0b:0:b0:587:e40c:59e with SMTP id
 k11-20020aa79d0b000000b00587e40c059emr5376792pfp.18.1673280463342; 
 Mon, 09 Jan 2023 08:07:43 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 z4-20020aa79f84000000b00573a9d13e9esm6275616pfr.36.2023.01.09.08.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:07:42 -0800 (PST)
Message-ID: <9a70edc0-9168-6d2b-bae3-a9e4432e7b7c@linaro.org>
Date: Mon, 9 Jan 2023 08:07:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/5] hw/i2c/bitbang_i2c: Change state calling
 bitbang_i2c_set_state() helper
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109084121.72138-1-philmd@linaro.org>
 <20230109084121.72138-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109084121.72138-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Bas+U9j2WyNb

On 1/9/23 00:41, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i2c/bitbang_i2c.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
