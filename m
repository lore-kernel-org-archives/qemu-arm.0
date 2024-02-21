Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2159956ejb;
        Wed, 21 Feb 2024 12:48:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX3hAClZehJ0kW95tb7dw1QD2+d4SgZkMglhd7JI0X8rrvmtdVW7HaOQUawA/gZ9denrbX1u2UeYh7NqXEbJN5pocIVP2JH
X-Google-Smtp-Source: AGHT+IHyWq5Ns1Ro749HIN0Qdc50nD5fQRLhxtPMaJ46UMu81gBPrudxNTV2NJWn+oDmXAF/Vxx3
X-Received: by 2002:a0c:ca12:0:b0:68f:6be:9f94 with SMTP id c18-20020a0cca12000000b0068f06be9f94mr12427939qvk.12.1708548539694;
        Wed, 21 Feb 2024 12:48:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708548539; cv=none;
        d=google.com; s=arc-20160816;
        b=smpm6KN35NAYRnt0fxcZSWlNjTVnboe9DYNMnl/WmKOd2+1QJ7YO8ZZ6tVibEGtatG
         +jqq2WQVplWAiMZFTIcczckcJhnu0dJ0iWqucZR0aeBuY+aIQOYznIgi02z8oMsFD6qI
         pPHOSNPcULhdsy3xuNEWWEG7HTpz13QAaSvN94gtwmmvCJBSa8E2TOF08pHevxq0EwIj
         cN/eRhlSFiq9b40C6nA/11QHbrzdOBPsPs3IVVQ3ofBrUwXjiX90q3ET9MAEOkeGFD6o
         wl+Vg+ol6xC0PHGCiPlSvs8y+bvbHNNa4cYpIOoWKMhHiruB6fuvif0+JnTXSyDwqr8v
         JIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=AHtrZR+We7Ro4+ZIuOyCYbuhvRB4K4yyX2R7ilByOWk=;
        fh=zBzHMlwT8I/wJ1A3ZJpk/gLaS5JxPPv0RVTA36uAHM4=;
        b=HRkBLuVP7ywiZPEF7d5HH2oibLiPTgMALrZ82qkbaTRcEkOhlhU1Y9NI9WF7N6hdm4
         UWYoa62Bsb2eklmC4ZECxdIpNWc+WWkbwj1HzTxo4N+Vp/TMzG8rbVCTCCNblj7SXSVx
         YUh98yMc3NQRVQ1qxTizUmoWYtkfyUe8/qqiVpMUjSCjV9ZMtnPzP6cruh5UKsYQayFV
         DmYa7tc7jLkc995h+MTksyUmLfOmUB95etJ2FVSr0R8jM7vE/MfS5ivwML43EJaahF0m
         AbPPierApqPHHC397DD9wKq4J+57LLYxkSPZXpFDDU6IBTHrZpGt53xSnnQI/+QNmUR3
         PkNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zS2YzDi6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy6-20020a0562140f6600b0068f44cb67c5si12024545qvb.145.2024.02.21.12.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 12:48:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zS2YzDi6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rctWP-0007Bb-QM; Wed, 21 Feb 2024 15:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rctWO-0007BF-OU
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 15:48:52 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rctWN-00042a-9f
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 15:48:52 -0500
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6e471f5f1a5so2163012b3a.1
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 12:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708548529; x=1709153329; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AHtrZR+We7Ro4+ZIuOyCYbuhvRB4K4yyX2R7ilByOWk=;
 b=zS2YzDi6ld+n5TQ6gHo24qvh7PStYcCYuD9bfdVt0cXQtZEwOiNmUp2y7WJ7xQPPcw
 wneuZkA+Klxs6m3dAutFyFuuVdUboy7VpI5mBg76XCjmUEP60hUjXfIjfBBsKNrGQIGi
 1YbCIfaQzYj+t24yLJBw+46OuGT21ILCzEvGHTG29WyjFn3trze2B6bKhl+2FKV5XW+Z
 tTc3xMw9NcbzjFHSeKJ7Er13C6DQcwopwjTq+bz1pzmcjDNBWaTMs4fXGDt6WtsjR5e5
 076de2i5hRuRpKW1o60io4MkA1qdKJOlpPKXlNbH0AY/7i3kuusQSyr+ryguL3NNa/0J
 jGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708548529; x=1709153329;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AHtrZR+We7Ro4+ZIuOyCYbuhvRB4K4yyX2R7ilByOWk=;
 b=DGD+uGxYW8sb/JPVPXsCde073tcgtzfVXTfSX0I/Obx3X9BALnFc8cTxdQK4h8VhgU
 ky20ODMQlxeEU1g+9AayUMeMG0n3P66v2JRmxG9k7yUNU0be+ALDe3b36A5XsDq0ikFu
 4mAiuNeTHP40Oz6pjmEhx9OF5Olo8Rfzw1jkaMCote5K5oD077UibG3IamU8fRkDy8pL
 KwiCPhkjX1sxs2ntp3Nb4qKP+i/L2pVxZvs7EKUt0PWj5dOuu2uQOM3FMKe3KPuF7ntb
 H76RPCCsRG2/rBRhOgbIC6K48NCRIlrsy9szHLrVqSdPgZTOhk14ZYTcd5ImhiXienKC
 09/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5iwpmdKJByQ6F3C0JAG3ZG1C5hEXy1TpoUkSrq3w89xM0s2dzMeNhdEs7X3EOVPVtYHkYXzzo19hiZZuq7D6euMTc
X-Gm-Message-State: AOJu0YyEBqlWaMWxS7GVnOWDKLnVbVV87VLBFFd17L0kqd/oYU8I3DGj
 ZjrJ6m5LrTOrxFxmUIaAqAZo9VNraDNRn+PethTRs+mpLfONl+k/EAjoptGeJD0=
X-Received: by 2002:a05:6a00:2d89:b0:6e4:8d1d:7770 with SMTP id
 fb9-20020a056a002d8900b006e48d1d7770mr4064930pfb.3.1708548529611; 
 Wed, 21 Feb 2024 12:48:49 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 r12-20020aa78b8c000000b006e3a9bdeb99sm8139133pfd.40.2024.02.21.12.48.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 12:48:49 -0800 (PST)
Message-ID: <6f6969ae-a98d-4215-9893-f9a1e3152963@linaro.org>
Date: Wed, 21 Feb 2024 10:48:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 15/22] hw/intc/arm_gicv3_redist: Implement
 GICR_INMIR0
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-16-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240221130823.677762-16-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: hvxyCAsQXbcr

On 2/21/24 03:08, Jinjie Ruan via wrote:
> +        gicr_write_bitmap_reg(cs, attrs, &cs->gicr_isuperprio, value);

Where is gicr_isuperprio defined?
Ah, incorrect patch splitting and ordering -- introduced in patch 19.


r~
