Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp700850njk;
        Wed, 17 Jul 2024 03:01:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXOJGHFyADjXRTU0NDM1MdT1dHg1w4rmpj9+f9hrukAyhdw1ryeE2FCTRwC6xH66J0LRpL/FNHLM9BM8z+d8cqgiAt0Onr
X-Google-Smtp-Source: AGHT+IG/uu1OtHcaW6rUi2QErIh2i1rYZIHopJ9OQQO/aWZQlvUtjzpeuBF68hxK88UClSB5wsuo
X-Received: by 2002:ad4:5de3:0:b0:6b7:8edd:410f with SMTP id 6a1803df08f44-6b78edd4829mr17156576d6.8.1721210466504;
        Wed, 17 Jul 2024 03:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721210466; cv=none;
        d=google.com; s=arc-20160816;
        b=PDcjSjMs+UmIEQAr5cIlbH2EInWViW2gp74znUYEbbCdvk1Ew9uh/1S0k3Sfz2++xh
         UotEO6uTgC6bfkqY3Zx4PD5atATW43rbxbVU4DTX8/EELXbmbqp3u10Cohjj4puCnoG9
         bg8Urtto8CCqWiJjCzgQh6RXCZN0dZFvIepVCR+wdaVIc5bi1bXwTf16zb2o9dsv5Iyj
         +G13omMA69bJD427EisEB8K0mT0C4Sb9pT49OJEQylTycTF8ZT2wSMe2W78A+5X4v53L
         WPdcGakVCKQ7OoSIcxZuEwDkgexfe2+na5so+Gi0ToGwZ7mxa4Es15BQbg4mTc+JvM5W
         1KBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lQoBPXVRCm8cVKkizp8OCCwWgm+D9v0mM9zSAvYKnEQ=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=Djf4PN9iO0gBkxqMk06TsCTn9Ol5MN00VZ6eNxrHzvitNZRsYA4+RcjChVPVe8KqzR
         fgI7mp3bl+UGmF+FJYODXtx9qzT/T/8XwSy5kGnROpWX0cendp5FFSvQ/zVnl90kclkt
         jG8pRe2OVojdaV0GleDv0RTD7M3EWFCCFe8ZLLEVakrnxlxVW5CurQJklcXPSF4IEbSr
         dvm4zc0ARcA53WcXx9kKXth00MqwJy+iShj6NdH6D5dBa00jmfpkOf4O+yP3Bbo1KHck
         ZwUsl7QQ1WA8DYS74LOEw2n+v+gcb+NvBA4ygLi8XImgUzs2YrO0oFhkjwdbT6cAm++5
         EnBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K2OaxSbn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b76195067dsi95942026d6.69.2024.07.17.03.01.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 03:01:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K2OaxSbn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sU1Sw-0005yj-AK; Wed, 17 Jul 2024 06:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU1Sn-0005vF-7f
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 06:00:45 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU1Sg-0007aw-A2
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 06:00:42 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4266fcb311cso46862995e9.1
 for <qemu-arm@nongnu.org>; Wed, 17 Jul 2024 03:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721210435; x=1721815235; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lQoBPXVRCm8cVKkizp8OCCwWgm+D9v0mM9zSAvYKnEQ=;
 b=K2OaxSbnr7V7UWgw/w0+W2yipriCs/0hnEfdyXnt5lrjrVprDwDUuxZkHyIAiPiYOm
 vS9p7VQLU7+6c7/tmWuXlje5b4KV9fEvfG6gyiOpYAbb9XSAVBkSrwpqT1vR/IyTT287
 YJNOp6zBIC5cz78dC6w3xc4S9QZu9aw3zCaG58v2B7Iw+edQ5U1vTL2fj5YYgCQaUjXd
 Du4TZ92vZI5q8LmYTGK1U6UZsrAVLDWvphW2qB7KgbFFNH3krRG96ufMAEYHelUVbbCL
 0xF0nugjS/BHXpP+JMDW1aC6Be1tAzdOs5Wzi2zZjg/d8MyNWQpT7/rjbJIo/qgkMPD2
 hSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721210435; x=1721815235;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lQoBPXVRCm8cVKkizp8OCCwWgm+D9v0mM9zSAvYKnEQ=;
 b=MTtEAXMaAfpxnDKkEm/39cOL1RrKR6l38BWbqoue8zk59Mgdz17tVhnhzAOu0PxJs0
 d0IAMxFj0tKaxp+ZqJoh5XXBUsSMC4Ui4LubApLmhKj7xNsjak4basmPMq4b2GA/gimO
 METmmsnus8gxbOw5HcA1IaIZ8uBTdTKLaUAR1pUQ/sppnzEviL3gcUNuxvrHJg0W0+x5
 9Gn7nFh7M1UaFvWOng0pTSBAIWyPQWd09YmZrPy+qCM1HB0U5Vml6NBddz/1qjsslQtZ
 ta0i5UMDJcoFLfZ48AdriaPx+nz/DCDIklOitWgvDBziK2yMfE12XpxuIlPnEVK7lTps
 BhIg==
X-Gm-Message-State: AOJu0YyRdjz3krL8gRyOryLBXbrK/d4DPKeT/8ITyLvcIUon9NG8Oz/M
 BiHQcsAHenrfDrFwj/qShMr/U3jcFAJi4ad/ZVBCPEBqljGmtWyJI29OeUBfFbs=
X-Received: by 2002:a5d:540d:0:b0:367:8f29:f7ae with SMTP id
 ffacd0b85a97d-3683174763emr980282f8f.49.1721210434881; 
 Wed, 17 Jul 2024 03:00:34 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f276b14sm201024485e9.23.2024.07.17.03.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 03:00:34 -0700 (PDT)
Message-ID: <fe5ec27e-5d00-453f-a066-9be722b6a5f0@linaro.org>
Date: Wed, 17 Jul 2024 12:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] target/arm: Convert FMOVI (scalar, immediate) to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20240717060903.205098-1-richard.henderson@linaro.org>
 <20240717060903.205098-9-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240717060903.205098-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: tmwoBVUELiP2

On 17/7/24 08:08, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 74 ++++++++++++----------------------
>   target/arm/tcg/a64.decode      |  4 ++
>   2 files changed, 30 insertions(+), 48 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

