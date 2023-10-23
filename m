Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1428827ejb;
        Mon, 23 Oct 2023 08:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+sE66NuPZ6SNTd1ypzsbodl9AhLXAcKYiuJA4tIK5xDpkTonarZDejZdpFHULDxTVBNdI
X-Received: by 2002:a05:6214:627:b0:66d:3433:d145 with SMTP id a7-20020a056214062700b0066d3433d145mr9566936qvx.47.1698073670862;
        Mon, 23 Oct 2023 08:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698073670; cv=none;
        d=google.com; s=arc-20160816;
        b=UYdPjZJSB0a1gfwhPa5ojis1R9Posntt/hjJx9OmkoZsqZFA6lxWpV+Z7YtW0D6q0U
         gCqH5Uub9NzhAXKwEsraTUfrZjs8y1OFdyP6EzqxZ4vjcxzV5/DBv2rSqxXT9JE/98o1
         TpN7SyIfCDp/cQFhlb2+QBrBz6OO46DlN4jymwqM2jted1hwLAejT9MBJWN1G88Oxr2r
         YezpzwDYFTutLn56h1Emc349t1fDk7rxXZLjrJw3TzGw26L5SpPYkGqWXLIHBdulCm6L
         b1fHA0Lh/3KBy/jyvbvlf6tAUdaY0YPf+bmxM0dRAnEAb//WVjX3VYdKw/a3MPOQo8mj
         la8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Jv0A2R3hTJrpeRfnVqPEVT9ArBPEHM4kSpRZVuBTy3o=;
        fh=63fuqXWdafnbqVGIWl8IQUGmwh8qKCI6VosO+FSh+Ss=;
        b=aoceZKHivAGSCOXtZsR6BOwM0VDUMEZBfl/FxIMTyXQwH6AxRigFzam963fILTYXk7
         SLuXOqVQ3RDrgHd9okl/OapwgY5CLjtaUwCtvOmI2KFdaoy+z2DuN6Z7ywKeSWFefG2u
         9TzrwrtkDUxNGXf4jeFvNahGxWToscx47UtaNA3ifoQUGhsgD2vN1wV2foS7ZxZEZY7l
         IE7sX/SHghrC+P9QBjChgH8FKtHUQeczuXYBHrOdva5nDxC1bgohgk0ShSJs5tPxkyRs
         WddRo8WSbSfrvBXNgw6U/UdCkcEYR3upwF5azItqOnl0pqOuOpmS34wu4af1brjoYLZB
         0VaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cN279sjK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21-20020a05622a15d500b004198b50a2c1si5444646qty.520.2023.10.23.08.07.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 08:07:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cN279sjK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quwWv-0004CA-0P; Mon, 23 Oct 2023 11:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1quwWs-0004BH-Qz
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 11:07:42 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1quwWr-0005n1-8X
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 11:07:42 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9c3aec5f326so946209666b.1
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698073659; x=1698678459; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jv0A2R3hTJrpeRfnVqPEVT9ArBPEHM4kSpRZVuBTy3o=;
 b=cN279sjKAymxTu5CGVXFs2Xq8Pw5Ps6siDSW0HrD5sqRK5GXJbqcKP1UsRe7RcxDFU
 h2VdqG+6OOXYbVOxaNt8rTOAqZgEonQrw4PieD8JU5VdKhyTvyxxFkhIg+rw6eLnxPBM
 CnFOG6O60r2lZ0IFAiEfDQl6bSNmcPPjOxcyxqNtUx3y4B/xDNQq/yevzWzCLCdXH1u0
 IReie7TlvLPUZwUIoLZ3MRmt8lVhU4rQTNkY5z+7VfTRjjQ+aCQDsHKUbzubd0hHYHK0
 KjebxjCp4SgLuRJtyu5xn/5ocRO110DFVKHwA8GRVvCPjygW+p4P2621ohx8Kd7Io+G9
 Z0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698073659; x=1698678459;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jv0A2R3hTJrpeRfnVqPEVT9ArBPEHM4kSpRZVuBTy3o=;
 b=PJxL+77dlQW7Wn1E/kGE+rSshLMn1HhfsZsMrKjmdZSA0jppqzs8YmrbiQuXpLR4JZ
 kJ5SAR3gsRmfQdjNd4Y7ao8YPWW2A+pcvOel0GKcBbqP/i/fkMgMfqMJ6vX0t4ItS93v
 Idp8Svqo/INHSA72RpSYGf76kPifxEZOPoA3sVQsM56HoctAD7iSsq4T6+gWRg11g8DG
 2m4fJS4QT8oJnfhidy/Ld1igYBtIzqqv8REha6BsQqYeDYeD+3iM+/IO9fAABGT3O+7c
 jU8kbF3G7StjxasFerLrww8+dlqdp96hktTwrixdj3EJL2RTcq9LWwpBql7qZg1nsA1F
 s1tQ==
X-Gm-Message-State: AOJu0Yz3hj2jgsY8J35Kjwz8CRzdm5UIjWbpX1tMTaYs0Jg06syMCATp
 O/qn2E2TbYQuyZn14dR/ecVdjQ==
X-Received: by 2002:a17:907:9727:b0:9ae:5513:e475 with SMTP id
 jg39-20020a170907972700b009ae5513e475mr9405311ejc.9.1698073659335; 
 Mon, 23 Oct 2023 08:07:39 -0700 (PDT)
Received: from [192.168.69.115]
 (thr44-h01-176-170-216-159.dsl.sta.abo.bbox.fr. [176.170.216.159])
 by smtp.gmail.com with ESMTPSA id
 hb13-20020a170906b88d00b009c46445fcc7sm6840380ejb.33.2023.10.23.08.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 08:07:38 -0700 (PDT)
Message-ID: <00fa1082-6f57-c4a9-c6ae-a5853f9e6dee@linaro.org>
Date: Mon, 23 Oct 2023 17:07:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 6/7] target/tricore: Use tcg_gen_*extract_tl
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, laurent@vivier.eu,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com
References: <20231019182921.1772928-1-richard.henderson@linaro.org>
 <20231019182921.1772928-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231019182921.1772928-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: as+MzjSy6YWi

On 19/10/23 20:29, Richard Henderson wrote:
> The EXTR instructions can use the extract opcodes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/tricore/translate.c | 20 ++++----------------
>   1 file changed, 4 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

