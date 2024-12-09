Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2876289njb;
        Mon, 9 Dec 2024 12:56:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWNacCeMNGqlPiMiNRafSc2sGRCPX1ubCru3FTo0KB4hjh5b0RCWblDMtrs2mD35yRBZ8nLn1Vs1QT+NQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHHgdHtJ+OmMPdrMsnKDDGFLmq/tes+dJF0SU5WBSfs6N3hU+a2IV2b+Aze0UgovHHfOcFD
X-Received: by 2002:a05:622a:1f1b:b0:467:5711:bdb8 with SMTP id d75a77b69052e-4675711d479mr166569801cf.46.1733777769967;
        Mon, 09 Dec 2024 12:56:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733777769; cv=none;
        d=google.com; s=arc-20240605;
        b=GXehUh4FzDiVQ37+Zh3tlMVRk55EyTD52b6rbU/2knyYvfzCQabIq9e0Js7uK+dnro
         +ZX61UUcgsVuiGNzq8AUb7NJYIJIG8vyuYSi1SBn15Qpb3Dl7W3NL1ZFyrNk0SvPZem1
         QGs9VdTajUc9/qvgD8x5hdpBfX2G7Fpev6bqSSYFVl+DSSTwES1h9zEmBivsJg8YPYu5
         y+fn9UN9yLc5hMyzi7AvWhygYyO8xCcIEK2PWc4nXH242ERY5EiHul76tw5TotQ2mYqz
         ff7FF2/j8W60bW/kxJ8ctHCZ8aS9xr0844hMwkFo18KXgnGPNLnw62+PvF9vZE7SSfx0
         8htw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vVih/yCMHZs0OCxV6rX2JiJV5YrIg231k8R+fg6SUNY=;
        fh=s/gk7KtYIx+StNhLtvjY+2JP0JFJro8YAF+THkxi0GQ=;
        b=NdlCCu2DyFACDJTOub94VDSzyXiaXZ/WuYAoE2uXz0lkyTB/a7l1eNM/pxytnxsRmJ
         LE8ZrANJ/HPby5O446HsRQ8NbCrod5L8/ira8xfyEG9HAffVlKPUkD84oR4l84ZGIT/A
         0EdU1cQyXcAS8k8FlgDTyx18HeCVncmFb4ANZawQg0eoaJwOiNKR/DCxQlW6qbZHVpTh
         Io6APJ1uefngz48ONdQZ93u4DohxBM1mXNZbhcRVkL54wYVpCXJ6PIK9u0bSP9tSjBgS
         JpmDCt7u6+2rw2SRLUd8D+KvlJt3x7pVx5fWOjgfYdATmpMKueYzGU/PwQ+OFET3sSlB
         C6ZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=khCBSpfu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4675f959a20si42655341cf.238.2024.12.09.12.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 12:56:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=khCBSpfu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKknB-0006Jt-Gw; Mon, 09 Dec 2024 15:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tKkn9-0006JV-NF
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:55:43 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tKkn8-000531-7S
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:55:43 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so1988236f8f.0
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2024 12:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733777739; x=1734382539; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vVih/yCMHZs0OCxV6rX2JiJV5YrIg231k8R+fg6SUNY=;
 b=khCBSpfu+G/Of2vmGsnpPTUbpLo0EVxQ17YRIR3+u0hODWQoATRen8tjibx8AgHaZ3
 7cS16mRt6j3zSE7t+vbJzfE5kwgJyx8x9FxZgT4bQoaTFeAQpN1Af8wCfNrYwdH4mlwI
 jf8S8IP6H0pLjKsxXMF/LaUSli9O6UetOwNrkrNxE6Sa2TZnr3DNZEX93GFuMByBN93u
 0XDoG4hJEN5pKNeivZg8TtSdeN6WVu6crk4XbSgNlGVG1qVI3TlAfvdFEGiVwNh6al8C
 8jugJJFnutsXclsP50LMoP/jGNtdhi9iDt8d2X5G5Gpugnf59tcLemzi2a8MfFm6Oilw
 SMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733777739; x=1734382539;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vVih/yCMHZs0OCxV6rX2JiJV5YrIg231k8R+fg6SUNY=;
 b=X2Ula6OYAUjkODCmkhpTQ1VoylK3i0qvVuL7VgHL3ZR+53PyaQHKemTXtAqJ52p+Fb
 m7VJyhJ4CC+6Ow6kvZaG+36t8F7zJZStuH0e37YxKJnz279EkkLiyO7JASYSm1mS/weJ
 iqn9KCcMTKfYpUQtflBb0ujCrBOyqZpFMfg0EcmoNFIwNueOAzhJGENRiSHZMY/9x6HT
 B2oaSdkXiJpnTgFLYaGSpLC+ifsq9IEcCQve8/rjXBkPiPG0s6uMGzt0G+cnwD4E8Pbr
 UE03WC8mAIrKGCZE8blCccirmjhRIXnhhwH1JtlH8hhIH7uRDLQXdIJsC7loN2yPmrpF
 vlpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqa6BgsoWwP3jIb6QVkjLzkAJNZV0FOJntE35w+X0uhTsuiFuQE6Zxue+K06mD5JL2iN1pSNHGiw==@nongnu.org
X-Gm-Message-State: AOJu0YzjkGtoaSv0zycQ77yaUj38bp6pidjNFgmr1DnsPqvNmuArZOvV
 Aa9m6Efv8PrR4XlqXjEK57oyfzFXWBeXbZdkkIQyRSuNIFwEumWVwo6L0XXrsaQ=
X-Gm-Gg: ASbGnculjjgRCQ/HAXticNJjcn73haKxQRZ8PrT9Uov+8Q+TQ2sfqMyAiOUWZDDeyCm
 BbJDVmwJpcOAYNTUMc4YXCTNHb0En+vbxg6QJnVQA05jC9hoQnBvAMZeVUaRpaKhGvS9HVKR2iV
 HdGOuU7jBejXAcxsFIYBeZmF+LeO2rlY1gniEj/QnrjxHkfr9VD+i8OiBLs9SRtU34gDeSNTgTF
 OzfJnTwhSJ9MhnHZ86uFExbYuRySe/LySpd1PQ02PtaZPB3PRs8XRlh9sPCIXFuKxnVEDPisb4K
 HxanKmPe7UYyhN5pFK6BhDjDJEbt4o9R
X-Received: by 2002:a5d:47a7:0:b0:386:374b:e8bc with SMTP id
 ffacd0b85a97d-386469abaf7mr555572f8f.15.1733777738952; 
 Mon, 09 Dec 2024 12:55:38 -0800 (PST)
Received: from [192.168.1.17] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f981880csm49196075e9.44.2024.12.09.12.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 12:55:38 -0800 (PST)
Message-ID: <7ad94711-21b7-4350-a340-351ceef0438d@linaro.org>
Date: Mon, 9 Dec 2024 21:55:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] hw/intc/apic: Fixes magic number use, removes
 outdated comment
To: phil@philjordan.eu, qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20241209203629.74436-1-phil@philjordan.eu>
 <20241209203629.74436-11-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241209203629.74436-11-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: tWBgjuVgTAYq

On 9/12/24 21:36, phil@philjordan.eu wrote:
> From: Phil Dennis-Jordan <phil@philjordan.eu>
> 
> This changes replaces the use of an explicit literal constant for
> the APIC base address mask with the existing symbolic constant
> intended for this purpose.
> 
> Additionally, we remove the comment about not being able to
> re-enable the APIC after disabling it. This is no longer
> the case after the APIC implementation's state machine was
> modified in 9.0.
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> ---
>   hw/intc/apic.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

