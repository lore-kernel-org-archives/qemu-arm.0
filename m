Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2995224njk;
        Mon, 2 Dec 2024 08:33:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVmDx/YOigyXn/BxX2xIaBBvXscCl9AnFfsOOTSwpANM0GQeUincmLREh6abE3QV5UwvVi2yuZ/cBqXyg==@linaro.org
X-Google-Smtp-Source: AGHT+IFSftcrcBQ+C2m42Rx9cnl7+R3In4w4VatUtkBDzYtmGNa6AQLMurp49ZDOB7S8MhudP7mw
X-Received: by 2002:a05:6902:1201:b0:e39:85e3:106c with SMTP id 3f1490d57ef6-e3985e31246mr15757066276.48.1733157236136;
        Mon, 02 Dec 2024 08:33:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733157236; cv=none;
        d=google.com; s=arc-20240605;
        b=E6D9ySjKv2TJ1gAeVe0Zm442GJ9cQEAzw6Hb0lfTois0l5jGll0WTjL2TvsTWbDGdN
         1Dq9UXuP1ogp1ZC8SrT0yHi6LX5n3lFfspPuOR8rkYpc24oCw7QBKrH/EqyiidQsVoS9
         zX1zUmZEXltcNHKkzccJFjKBBhfoGERq/zhZlTERb/AnMt79gFQjf4jVrdYQwNqJC311
         ACLCxz2sXjoEFXOGPtp/1fYStNX0BFrU30sm8KjrexaXvV2djboHNaPy984EgrmumRHf
         ppkWsaj8X4JdTK5hWsgbZXayH7Qa+Df8vOtwM2WKRL7ttoKHbgZ5SebAnGa4kkeRTP8L
         OHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=E6bWi0hV0u86tHnyEyjfthQ/EHZlzOgl3N8j1p49Dsc=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=an0JHLl4hGUaGzdFPpjLoOhDhqDUFzOtVOOe4yIseUidb74PLPTsfKXqfm5mV4kLlm
         O8K7t+fnP/jYTsLdwWZhOXQ25EbIqCXHzytAVZ8vOb/zDxpnY2H8N7/H0/3lH/DoWwvt
         +0nwUfDg2Aq7J6o9zXzJoGPjru7+2WiKEEegllmJnbeznIBHtBhmA8OpYx3Rzm578Mzm
         v5mAcUB39VPd4CKpr7IFiA/xuV9B3px4MrLfW3wSk8sTMcvPQ4a3v5a2EBQ6kv5tDSjh
         YtMDWte9I00Uia91gF+IZ8xQkkce4IF7nwVxeW//xAZKfav19hEvFcBs3jVgtO+iQyTV
         o8Lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TtX1nd2r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e3976cca04bsi9070980276.438.2024.12.02.08.33.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 08:33:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TtX1nd2r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tI9Mp-0006wV-Ls; Mon, 02 Dec 2024 11:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI9Mo-0006w0-3w
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 11:33:46 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI9Mm-00023W-Ny
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 11:33:45 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385e1721716so1498310f8f.3
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 08:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733157222; x=1733762022; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E6bWi0hV0u86tHnyEyjfthQ/EHZlzOgl3N8j1p49Dsc=;
 b=TtX1nd2rCxARTi3kaM+lvKdeSkWhGLyerbeceLz2wVlCJ2Ke5hl40FG+kMh42m18CB
 pv7UidvKv1puQH3Bpl/VjSHDMgmBZkWwXJj+c4Ln/IC4j32FtZ7aPcGPMjOO6hOKO3pQ
 wz4AwqdlYxnCfvoPXjXBlP9+vilDI63+epxj04krjd1GS595b0poljjHzUZ/7w4R8gkN
 LIuP18RXNByLQFupj3WVIAecbjKAD3uI4PoO88MxX7mEvqHkxBL5z1Ov16kdPADNKcr7
 LRJjHk6LL19Rmm6s045Qm+iAnd/CpU5mfc5Nx5tBwLw5t057p3nKGeYqw5cpxsHO60kl
 y0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733157222; x=1733762022;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E6bWi0hV0u86tHnyEyjfthQ/EHZlzOgl3N8j1p49Dsc=;
 b=GgaFg6k6Nip5y+NqdhC3qdD8FlCAT+p8A5O4EtbHCZGMTxHlQaBLHgY2HfZGLU/tso
 B+eYOfrvOzPJYFRxTZpjKkhzIeCXF9452Tvbl2fB4zqdmgYRwUnMOuSVzzk+nK/9Jgm4
 MT12cYhn0gk/NDOolbF7KSCfZXtjifByUJe2QlasuwXFN515SqpcUDegn2hEFYaVJEom
 2xCQ0B1gVGNuiivfsDu6SVJUTyJvU3uigc0w2qLeK3Kfy1349DKbcvfdBLIKXACmfpgX
 br73mNjC1RUKyZ9yn+Y1a8BDqULmIEwxmZKcqQXW/u1wU9ojAB6CIr3yCQR9b1jq/KAb
 S2jQ==
X-Gm-Message-State: AOJu0YxkkNtamONd3WsZfzq/r1JW6AgGFMKD9XVLkDrUNn0SAqOwh8RM
 tOUYGX3XeImkRxbCJm7BQRY2EirJ+McljQ79QiXKOqx3qIpaUU45IWJtO2b4xWc=
X-Gm-Gg: ASbGnctcqNWZY8roQC8xVSDRXshpOrNXDLNM8rcI1PjsjJsWEZuLttVLlyUXxiKQySv
 pDcnauUXolGnmZPR12N+C6un/i2Yn72robdbBFzIhxSU/vMvshSI0Thvrcla0HuamKu9Zab9QZZ
 oRoTIjTFbati3f8bk6xZBkoPeVG3grW42xrRsUyBuAOAdCTYON+f2Mh7I9D6FgPii3WxbLSrWp+
 Kqy/drx1qa/b6YvJBeV+kANN4pIC+uzWtKBWjbsKT0qjTCt4ovxD6HV8mHtYbw30D41eGrLyFk+
 u9+WsR2JDknVqvjC3QC9UtLFrrhc4g==
X-Received: by 2002:a05:6000:1568:b0:385:e2d6:8942 with SMTP id
 ffacd0b85a97d-385e2d68a13mr7424822f8f.54.1733157222033; 
 Mon, 02 Dec 2024 08:33:42 -0800 (PST)
Received: from [192.168.68.213] (72.red-95-127-54.dynamicip.rima-tde.net.
 [95.127.54.72]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa74f18bsm194172825e9.4.2024.12.02.08.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 08:33:41 -0800 (PST)
Message-ID: <0cbd29d9-6e60-424e-bfc1-38b55e1fa31b@linaro.org>
Date: Mon, 2 Dec 2024 17:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 47/67] target/arm: Introduce clear_vec
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-48-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241201150607.12812-48-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: IEayv161iUIf

On 1/12/24 16:05, Richard Henderson wrote:
> In a couple of places, clearing the entire vector before storing one
> element is the easiest solution.  Wrap that into a helper function.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

