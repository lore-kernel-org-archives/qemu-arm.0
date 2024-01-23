Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp79303ejc;
        Mon, 22 Jan 2024 19:32:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaZyUfdh/v5qFDXMuRaOf49q4xrlEVsAU0rdYrTcN8yMc1mbHK8wr+qo/aDZ/bZb5c3bs9
X-Received: by 2002:a05:6214:513:b0:686:a11d:6ab8 with SMTP id px19-20020a056214051300b00686a11d6ab8mr269002qvb.42.1705980752185;
        Mon, 22 Jan 2024 19:32:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705980752; cv=none;
        d=google.com; s=arc-20160816;
        b=rhuP1tXwajWbZycFkcZuG1+1awW3+5XB020IDrxtB9ImGu6nbz1XiGgMYa+sGnKhb4
         oOs5blCWeOxH/WLPlp8bI9GXVHQVE3okUSPE/lXeo46eahgK0ARuus1HHrwWaU0nMXMK
         hSQwr3vBXjKum3sN9Q1Veay8RnscXoK2pUc0iahM7nkQDI3ILOJBeEBQpOtIv1QCREOz
         ND2wjLv12lHXSQEAjJd5+TQNA6QwlBgBKvjgqGymL3Sasmtp/WqHngBthZvkuDXw12v7
         2AtzM9xFr1b9rxbSzNYNLTey6Yvv9eR9FZ/R9aDPnzVE3/iTcGfihefDLFlUe7Ir5L0z
         ILXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rst7CkaOi1dkozdL9S94SxZycocSuZNQ9dDJxL/wk3Q=;
        fh=aEn574hqK8bQMt9shDkCPmwP//YLRncUIiwkIRHx75k=;
        b=T98pBHBXfEUdPg6V9ul4spnXJ1M0WSlwdNedFgw4BQSVuM6wktDyfMHemsIUtqxOud
         JJ+LpUiJFlOypxgoE2tklMt5GK7lM9rUwFf//Bqmy//Zs6YiS771jthCyFrkXwjLLnyM
         chfunX3XBW8rhRB21eRvhcaNOqzKTrWLhzOx6ElYErp25uo8qUmtMbi++jiA7ygJVPSj
         668Vfdk2eKOOlwbIvuoT7srYZFe3z/Im0eAhp70ura+PO3Vv4ke0vgDbyLRxbexr9A9D
         5dS8uwfGcOINsr1UjeFjxJhYJwCtFWLXkZvHor0MaaUMLbWW1s1GHd1KGfgDpeXVkO14
         lBdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DXXMK7JA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5-20020a0cf185000000b0067f79fc97f1si7075431qvl.397.2024.01.22.19.32.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 19:32:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DXXMK7JA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rS7Vt-0005v5-2S; Mon, 22 Jan 2024 22:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rS7Vr-0005ua-Qy
 for qemu-arm@nongnu.org; Mon, 22 Jan 2024 22:31:47 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rS7Vq-00031l-2U
 for qemu-arm@nongnu.org; Mon, 22 Jan 2024 22:31:47 -0500
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5ce10b5ee01so2666180a12.1
 for <qemu-arm@nongnu.org>; Mon, 22 Jan 2024 19:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705980704; x=1706585504; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rst7CkaOi1dkozdL9S94SxZycocSuZNQ9dDJxL/wk3Q=;
 b=DXXMK7JAkWD4dEwubpNQwRTlSMoKDzEg+YssXViEm3RqQ7w9y7DR7pm/QFKBZVUPbW
 PayYFxsCi1zQBEYYgG91GIbyobX3ecreKrs08MU/w35hw8XcoWDNyJwF5wW24QiD/1P8
 GOUXDZnSwEEgo701Qjx9YghB55rd/anI4uTG3zP4uKgXPvkroWBAv5Fd4bRLcTTAC5B6
 Hu5dSuMzoPB4qxPWpLwkifjhy7TWSB7CZchJGTvDV1TCPU+dNje4DNNzrHKVHmyXltTY
 KIyLRJJoP9mLdpHApN0BmOgQpsZQ2hE2rsRVvvdbs0s0v1XrqJtFFeIz4a00MBMlIijd
 96rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705980704; x=1706585504;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rst7CkaOi1dkozdL9S94SxZycocSuZNQ9dDJxL/wk3Q=;
 b=MJ5UeaLbpPbFC7he+CSZiphvsJNkl5sMvS+4rSUhLf5ASg/0GS3FCRYbj9P1X7Mken
 facFBfwrLerUh4jBl70JRXFtvO6Q6wCqjGcMQjrND0I8Xlsv1MW5GHtc1rfHERZ5EWBo
 zqiYwEcuSGHpF7vf8dYCl2DzBidVlhyVypp3eJUr6vYSzbxjqr5Js3QiXDKDjMzfWEFQ
 0cUAt2ZO62YR1tqLmo9fRaZf8AxiS8B0l7eXLTA6m6PHhwKtSXmNOdzediUWNH+xGISE
 VTeXLuU+ZIqbp2zPox7nozFbZdFlW93q5lT5ITl14oeJ429etCMqu+2lMyep5YXsSW17
 /ubw==
X-Gm-Message-State: AOJu0YwQnbT5ey5iugxwW56bZVvQqgBegElGOPg469Iwlm3+3a+o29VK
 Mo0mYD16VcnqqH8mNdIgBa8oUYzG9j4frLcgpKNYGuqtXC3FNgqMd8imLd6Etbo=
X-Received: by 2002:a05:6a20:8410:b0:19b:42ea:314f with SMTP id
 c16-20020a056a20841000b0019b42ea314fmr6431938pzd.16.1705980704173; 
 Mon, 22 Jan 2024 19:31:44 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:2a49:979b:9002:98e6?
 (2001-44b8-2176-c800-2a49-979b-9002-98e6.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:2a49:979b:9002:98e6])
 by smtp.gmail.com with ESMTPSA id
 fa20-20020a056a002d1400b006dbdfb7624bsm2775699pfb.170.2024.01.22.19.31.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 19:31:43 -0800 (PST)
Message-ID: <d2a08d09-5ad3-4ca9-a113-b481dbb5c866@linaro.org>
Date: Tue, 23 Jan 2024 13:31:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tcg/arm: Fix SIGILL in tcg_out_qemu_st_direct
Content-Language: en-US
To: Joseph Burt <caseorum@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, "open list:ARM TCG target" <qemu-arm@nongnu.org>
References: <20240121211439.100829-1-caseorum@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240121211439.100829-1-caseorum@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: n6bIIHhO7XMI

On 1/22/24 07:14, Joseph Burt wrote:
> When tcg_out_qemu_st_{index,direct} were merged, the direct case for
> MO_64 was omitted, causing qemu_st_i64 to be encoded as 0xffffffff due
> to underflow when adding h.base and h.index.
> 
> Fixes: 1df6d611bdc2("tcg/arm: Introduce HostAddress")
> Signed-off-by: Joseph Burt <caseorum@gmail.com>
> ---
>   tcg/arm/tcg-target.c.inc | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

