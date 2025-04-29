Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp319287njm;
        Tue, 29 Apr 2025 07:59:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWp2A7UwzffoUm3ggrPyDWlCasqrqifwZNdRLZmTZQFolqG/mA3uMBRKbTw1vKldNhTlj60Ai4V3AoUyQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFVI7RIorU++uKLQtHX+ewD2IpDAoEoFSOoYOP5Xo5vyT73zKAfaHTAe6bmCYGQ5ToHzu8p
X-Received: by 2002:a05:620a:2b86:b0:7c5:5e9f:eb2d with SMTP id af79cd13be357-7cabddb3003mr646703785a.44.1745938778301;
        Tue, 29 Apr 2025 07:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745938778; cv=none;
        d=google.com; s=arc-20240605;
        b=UBYIzl7C1hM5arWOBJPmbiMAshJ9PNbUa84Cb8bP53mmhvd0SnWDoiMsF9VOAI51go
         YcHmhwJyRnJgafMyPbRGMZpoeA+zaHJgvTkAatdeFmLVxkyXtPGGwTANWtW0VbGISzVA
         9OIQzbU/ZnSqSph9g3l85M7r8MqYGs02S4pPDTeIQF4UcDgCenaFJwCD4WjJDao+d7UC
         KFAI4hEyDDMoR1Rk0oxeN8+ZiyHg7v4VJPCIhjqAChRipaNs32jbU7/u25C31Hdp7xlI
         Pzb4usSNHhnG4heoDkaDqW2yihpydpKZhdnNSqxTUKwrqkU0zuvcgkPrx1aZNW2KCrvV
         890A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HMhmQHLH8iV90bKlA7RRenTXjvbapnut7sKnApZGq/c=;
        fh=OqRkgf0xw/sSCVzZ2kQMPV5MRwZzFjXMcz5C1MwrCdo=;
        b=Lp2TfZWRQSvRcw6MP7UitBbcYTc5D/FNAnGr4Y7nh08ARHkEBwxii7979S6p0uphts
         TZON6rZ8Lu5DFGFPROchmGDg8xJeoVw8fG8RYhM05madhjDVtFotX3C0DTHA4ICnE3qh
         7Xw6FbXI0Sjir38C0ceUAnadtcQGsygLwPWUTLlRX6pokhx4S0NvABP+fttxc306qIiH
         WR0tIUEN30bijbDEdurp2251NOwjlHjZNM5ryZMNshwCYD5QPnKyGuWYExQ2P8/PjEhc
         Di6exgYeHOExNi7ESs7KbV457tM6vxkSRF1IaXDauWq2TenTx7PcdNWq04zNqAqQ7a5M
         XMDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ztpsxTOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958d85651si1205833585a.222.2025.04.29.07.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Apr 2025 07:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ztpsxTOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9mQd-0004ZS-56; Tue, 29 Apr 2025 10:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u9mQc-0004XP-1V
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 10:59:22 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u9mQa-0008GY-6V
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 10:59:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a07a7b4ac7so1881026f8f.2
 for <qemu-arm@nongnu.org>; Tue, 29 Apr 2025 07:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745938758; x=1746543558; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HMhmQHLH8iV90bKlA7RRenTXjvbapnut7sKnApZGq/c=;
 b=ztpsxTOqU1dVtS2cbZt9RYdE3PTOM3k8e4/SHLlzC6MuauUyA1QvGZ6Lwr5YH8Xv7M
 b/PN8xI6pMEgsH0cfR9q0H/LT1hNv4jrmOcI8Ct4D2aHSyVkjmhmyAZOVmGtRXaeY9kk
 JFL0kWu4lWDCJeyjaM0tTRNNOOrXtYRFu/g4exvYAKoscPbBdGOmrtQiG9ODvaH/SFSP
 d6Dg1uwd+IOFTLtPPIOeNO+5s5b8RFxQVL3WL7NepRqcTyRFGmQXDO2JB+fMjVMfUT5x
 yrkrvZIhcmf/dvyNTmWcAEuumQHXZ/RyIpTf9eCoMiG5SZBPlOYGKTiT1SNqBbRIHBK6
 RDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745938758; x=1746543558;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HMhmQHLH8iV90bKlA7RRenTXjvbapnut7sKnApZGq/c=;
 b=a4G3vtJpWwYc4xTnKEypBR74FbyBiCzi89RxREHwoEmPq4vQVcBmy4jn1FJR4UTOCw
 dacgVXJyhsNR4u/dHxv6wboPTmXT8L4LwDmnLfKCwVrv4hHG/w8LRnd6eRCS3A6zv7ZY
 L4FVGIZ9ugv8v+u71u/P3x+gRUJDJX1ng1D5ULOsnkKHWpz/+bTIlF2oeZ8ngFoBaRfw
 m9R5d8hkkKewWPoTNpqq9Mc9qXtbMjDBe+qwfIXfN1cfJoCzfNkCjsogpE4kGQbM01b6
 rgAxXJxPfjv1sCuOOqPr9Mt8kf3Kdz0NYD/FwLwvcLVPTwtZJEuypUMrBWMfDQ6bnctG
 Wn8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO4vWbhQN5syxwZaF/kKzOw/yWw9te/KBDwrHZ3JrIuF4BmBRQIUFHJ7waVDhbpI3eOLQLYfCx9Q==@nongnu.org
X-Gm-Message-State: AOJu0Yy8krHr7wxUprUGKHWsKSAn6usd7rcPt8GTuwWy/QM/1060sCt+
 Ri13cRElB1XbsKeM5nPIOS4Nw7CxFAbzb9NWPSjp/KLa0HxNU8OAFX5DDTJBVLM=
X-Gm-Gg: ASbGncvlZts31tKFqE2y6ZFFvU5xtDs5eLAtwRCvcNh4/XOncj/4uSs9l7uXukDJW7L
 ooUYoLFqTYOBziw0pma2LM1CjrZItv7LJ6n+QS7iAy6yRCVwGwZbYggmADCaZfyUDePARO01+Jc
 2dC3E5kxQpyFog1VNjaqN8Uov1qZwvQKPJioNiUcVFfrEBIMHf4b2M7Y5bTWIF2Oj24I4BgaVbw
 j41lpyT+psCPD0EdDKFGgRPlOpVFhA7FH/1NNBr1W+NE5Ghu3sUZ3RkiqBwQ6R6PD1rq/4OlmVk
 m83ceMUkye4gNjSWKVsZSw7bJONaOPApFBGVQHT44pmuIvzc8oSzGmzx0G8cIzJEJAPx67WQkU+
 2HYLLOngL1WqSTA==
X-Received: by 2002:a5d:5f91:0:b0:391:29f:4f87 with SMTP id
 ffacd0b85a97d-3a0894a393emr3644098f8f.49.1745938758147; 
 Tue, 29 Apr 2025 07:59:18 -0700 (PDT)
Received: from [192.168.69.226] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8d67esm14339507f8f.17.2025.04.29.07.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 07:59:17 -0700 (PDT)
Message-ID: <fd4e6766-c5f3-4e5e-8eeb-5d2296ba440a@linaro.org>
Date: Tue, 29 Apr 2025 16:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] target/microblaze: Use 'obj' in DEVICE() casts in
 mb_cpu_initfn()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
References: <20250429132200.605611-1-peter.maydell@linaro.org>
 <20250429132200.605611-2-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250429132200.605611-2-peter.maydell@linaro.org>
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
X-TUID: B3LYlDlP97uF

On 29/4/25 15:21, Peter Maydell wrote:
> We're about to make a change that removes the only other use
> of the 'cpu' local variable in mb_cpu_initfn(); since the
> DEVICE() casts work fine with the Object*, use that instead,
> so that we can remove the local variable when we make the
> following change.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/microblaze/cpu.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

