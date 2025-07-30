Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009FBC87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:02:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhDvD-0003UW-TM; Wed, 30 Jul 2025 17:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDed-00047D-Pz
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:44:04 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhDec-0000Nr-8x
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 16:44:03 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-31eb744f568so248559a91.1
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 13:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753908241; x=1754513041; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t6DcCQMFfcE2XiBGouBemSe1qWTN8iZLRtU+CEFVJRA=;
 b=ulRvrbxIQ1g8K/CsaLxR1UZheH+RDEQL7glFDpI3Rtn+4nKn9Zj6wbZOqE1RkRphcg
 uv7MIU34E4e4H0Vw1KjNXs4SeOUhOhq8LAMU2LlxdCNtgPLpBzAKVKcWo1gMMOZt2ZTn
 EGfnomX+0aiggGjYyeyJmdGmI3boB95KryGu9/GrJjLp9k8nF2ndBvIaIM94o4fmqUlG
 58GRK4vGXTWBHvVSmqtgqO4DMmMtJ/hy7cfBU2oniAKiW/kVaiAtDnDk6rCPZoJNcf98
 pKDo9zoZHddWhRhAKHGF95SnbJSHCCdJazHyPR2bn6S3PIdUyLtkCVA46CIOIO4iHZVo
 +VBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753908241; x=1754513041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t6DcCQMFfcE2XiBGouBemSe1qWTN8iZLRtU+CEFVJRA=;
 b=c2UXblutVprmTC1yR0/N6Fg2a0c/4N2HvpowMHmC48+DrwIbBqeb/3wzdl4rk/dKgg
 tS0SHQe8qGP354Y/U5aGQL47fUH4g6QD/5DR/QxuJckQ3q5F4qYk87/ZjK4Gv4ZwOA5l
 orNcmMEJkaPZ7QMm8Lm3KBI7aVv7lRc/ieaN+AtXjT6cBUd6PUMjhBj6RJAFcYRQBvlo
 zsSfv6SSF0siCDKIlyAXCA5oAmSOsKmEsvukyti823UueoSNFDvzhaN+nOKGTAGrvVrR
 8NRaE8mV9bWR1Ss8aHfXv8gvV2x3ebjtaBElJFzSKDSD60IfQvKBDDPK3dIFn2DSFv2l
 DQ8w==
X-Gm-Message-State: AOJu0Yybe0J9LgtbEkpAT/O+1NL5fsrR9tZVSTUaEOCzYdTyKdQnxTzx
 m1GyT5TaoYlNIRlaj2lt6oTUjwCsGmcVdQjva26HD0Rp4/seliIvTnSCcYi9TXIpNfw=
X-Gm-Gg: ASbGncvAI+0kW1wpIK+qFq3EWo0CXXeSXo9SV4vBD3Cq7Bt8UPiO13Zw3hPJnzOs5P1
 LX3KJDvQO0GGOi2CwHLRSWhBvPBIn2MpgTk1TyPzZiwdHVL1bvuTdokuwmWG5S1z6FnDTIaXIJp
 Xa4WYSCNXkHP9593/ah1VfFU3vvwbhb10DvREKgRkJgy08lYf5lIJLmDiFvb34jGk0fdl1qdMf6
 8v4wsaZDwTdmzyezZqp+aek2aUwqxPxCCMSrDjVF+XHnZQsOW19qDzUYsCXZs6pTln1FuZVW6EY
 QSP1Xsv139lqyUd5BcICi7Qrc0tcTs/qy50LzA82HU/73MXom3mcp638A8GtKXrbvcXhfkwg0UB
 Q6p6iyT821dgyp0Evc7P8Eqpo7Fh7AW8waqI=
X-Google-Smtp-Source: AGHT+IGHLE6B6BZ6ZsfXKBfrs3zvkxdfZAZOA3U75CBiP/rrF5BL5bD742KqjcV4oY5Sw6W7qXU1pQ==
X-Received: by 2002:a17:90b:3a08:b0:31e:8203:4b9d with SMTP id
 98e67ed59e1d1-31f5ea4cc0cmr6322365a91.29.1753908240604; 
 Wed, 30 Jul 2025 13:44:00 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32084298fc3sm46474a91.31.2025.07.30.13.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 13:44:00 -0700 (PDT)
Message-ID: <8b66b866-eadc-4fef-bb2f-0af4e2300b5c@linaro.org>
Date: Wed, 30 Jul 2025 13:43:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/82] target/arm: Cache NV1 early in get_phys_addr_lpae
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-15-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/27/25 1:01 AM, Richard Henderson wrote:
> We were not using the correct security space in the existing call
> to nv_nv1_enabled, because it may have been modified for NSTable.
> 
> Cache it early, as we will shortly need it elsewhere as well.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


