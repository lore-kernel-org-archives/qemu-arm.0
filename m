Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp322505ejj;
        Thu, 23 Nov 2023 03:41:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMrdPkn7TLTzK6dP7kUepuQqqeOYQZoyigLTnhpqAX4sVWYD3aEQTfKytJp9PhhgcU1x00
X-Received: by 2002:a05:620a:2048:b0:774:30b7:ed93 with SMTP id d8-20020a05620a204800b0077430b7ed93mr5474553qka.29.1700739709851;
        Thu, 23 Nov 2023 03:41:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700739709; cv=none;
        d=google.com; s=arc-20160816;
        b=ZxVAEj8s4VF+lQGkoT5LzMCbcg8P0VZs8CnVzpPj4FDWOCR8FKCaLqbinCeMjxy4Qc
         z0LPZ3NYGFiCB+btUANSAvqmAOhHGUr49Tbsh8qWlKAQRcFAwyjQGayWVsHBsbs+MfJq
         O29nlsALIat/3PNXkJjlgJvH33YVUdHz9JdSpA0iO/OhzRJBwAFgxBsh1RQj1rS3Tq18
         8FlnRRCcFMFx5BYOyo13lqaQwQVsvCKGgcojQO7IRM/76zXYJ45b5/THpULjn3OuADqJ
         XYQqiRcugaAZjbWVc9h+3q3HBrT8i4HbnYNQgdxVc5H51qaIwOl5tRamRHTm5nGZ8ldb
         QJ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=a8jW+oRd2zCpfNpm0y1vOAWuOryPcBDO8kJRrv4hZFE=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=HVEkWNzxJpUQ6N8CkL1HXYCrKCvZ4X9ws/6YBPaOS1XdW7OZoWm9pFrW7FrgA7n4wr
         P4+w6vO4J4QZzHCfUyyMmynCpkrx6yLXL7rXwvGI5tVxGVrl0Wawu+lFFGPCmk1Nuo/m
         bSncbvZn8mvv947RoRWuGzXWe4Ucq8opuwqBF1Lqv7QEb8bqwIAvzKUNzUGHqvqSUdEj
         7SGO+H2lGXJRv7EL/lesE9H7WO1yhsB5B7YUtQjQnWanHY1TIJ4MrOs0xN69XgRwh6me
         5EJ/4RzkbWtKwTzUf7rkwPbxFI267pxz0KyNAd9vWHbA8xtrzE5/LzQ8roz0YFTwJlBq
         +MFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FpEeb4BN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020a05620a244300b0077892b417desi989259qkn.333.2023.11.23.03.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 03:41:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FpEeb4BN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r685Q-0006tL-Nc; Thu, 23 Nov 2023 06:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r685P-0006sw-FY
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 06:41:35 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r685K-0004Nu-13
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 06:41:35 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-332e42469f0so239045f8f.1
 for <qemu-arm@nongnu.org>; Thu, 23 Nov 2023 03:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700739688; x=1701344488; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a8jW+oRd2zCpfNpm0y1vOAWuOryPcBDO8kJRrv4hZFE=;
 b=FpEeb4BN75UUqFGcYzWS9nfNCtWh8MpCYviAmkTeqqU668BdjAeE7Fya3IefcqInyf
 gZhF4fotzaR7MhpcwOu9/ADNaUuMtfxxd9gy/HOuyQDcfrfqXuvZ9vJ3uVH3e1dhLzg6
 FqR6wR1OO/rffqpZbirPIYR0dwp/e4odwAoIxiWlRKkY1sS/JkH6DBRj0oJ1lGiWJq9a
 5oA7rylKPZF/f2PbcDy4QL4orJcp/3XSzKf3DtYsrbYOqeCVbIvj6G4RPsUYNAu8DURf
 eRPVc0+R9La9khCsSeXLrGpyaQq0ZXnKjnVan381THdZGMIBx2p0zsBpg9WYUB7qcvfh
 /DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700739688; x=1701344488;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a8jW+oRd2zCpfNpm0y1vOAWuOryPcBDO8kJRrv4hZFE=;
 b=Fpsef7fQI5SaPjqWgUBX6MpTO0bdbNqT/WEwSyQYW7nU+F4L+STCaqq47oX7NF39/2
 +ZzF2BcSdjlcwgOWXqKl0NmoQZl5dIuRU2UozzGgxwQGrULjowjs8uie1nUCL1cVsQ+m
 IZE0HCKz4Z8Es06Udo5CAn+zFQerBnBOv/GpgUiFZ+K+6XjfHDuRfivSrWckSwJaNW4s
 7v0JZna3KMWxV7ZON3Kht0h38Qa6zyF3klM1CZCkVZt7QLSkZIFSS3yrCSCizvxzXURN
 +p5fo60swTGuJNxMlIBWCCrnblPx7RT+Di2eW/jGBA0SJ8eUQ+ayeeOAx6GCebbhRVhm
 p2nQ==
X-Gm-Message-State: AOJu0Ywhl9zkEguxqLPIL0X4maOtBcf+xs/jclgV+b0vk5nAsedFV6nq
 TXhqPwcWpnYGKzehJS4VOlWhyQbiPj7LD/ALcAo=
X-Received: by 2002:adf:f082:0:b0:332:c4e3:9b09 with SMTP id
 n2-20020adff082000000b00332c4e39b09mr3261365wro.30.1700739688483; 
 Thu, 23 Nov 2023 03:41:28 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 h4-20020adfa4c4000000b0032d8eecf901sm1455905wrb.3.2023.11.23.03.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:41:28 -0800 (PST)
Message-ID: <fe710001-1f37-467d-8744-405ad0ed7fb4@linaro.org>
Date: Thu, 23 Nov 2023 12:41:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/21] target/arm/kvm: Inline kvm_arm_steal_time_supported
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: ySzZDClyQ18s

On 23/11/23 05:42, Richard Henderson wrote:
> This function is only used once, and is quite simple.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 13 -------------
>   target/arm/kvm64.c   |  7 +------
>   2 files changed, 1 insertion(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

