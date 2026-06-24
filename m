Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F6ACDE001
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 15:39:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcPh4-0001gv-OY; Wed, 24 Jun 2026 11:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcPgu-0001eB-Fw
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:39:06 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcPgr-0006vX-09
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:39:03 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2c6c101aeafso7248125ad.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782315539; x=1782920339; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B+Le6JC6UZJFeqikOs6p7XcSYx9F0PtvNwizfSFidR4=;
 b=D4xBF+2d2rZ7B60ArHtaytVw/YaYlaRSzfWZ3euYM+ikhKV4ikOPqWUqJbZjBHx4Q8
 iMUbVTJOFWa6DMotOjf7fGWLPqiNbmjzHnA96wHruJn3PwcgpliaP9M/BLgzERxq/vE0
 wO4sKEBJ0Q5C+nUyWGo8vqxekAnEJBCc/lr8mBzmTDblD7OZb+h6dWxso/6iTEfkZi1O
 27RhR3cFOSbQjWHFHgtB0cOgYKDnhWi89dBwNlyDrox0Qfov32dj+cVYklSNlqz+Bh8a
 f3KTBQqftWF+vXWy+Ni6pbEr8IdWYQ/URBXSc1q+igY5QwQ+p2NcvCKvtBhMbYY7DeEm
 HqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782315539; x=1782920339;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B+Le6JC6UZJFeqikOs6p7XcSYx9F0PtvNwizfSFidR4=;
 b=a3ogrwKSOEhDWj/R7mbqnDhJ7uMPKbcaWRGyxL1Y6rRlySaeQ5Wk/tw5zg998ITSaE
 eX9F+LGBr7w18W8cZ1hDm3Y7I4jGLvp929kS2unqgogB0cv3XFZpeZpfg9H6KMdofn1N
 C+IbzzQ4yli+jhD10lCExZ4raTpgIylf6mFHeSfMf3KG8Q6eNOt2agiIDxqI+YPPxH8x
 giP+et6+l+tIDftel+tR+8XEHBO5Nl2jedKtCl5yXoOjGeBplWcpHzsAbUMehcG5UeAd
 BDMHa9POoLvLci8wTrTN0A/LNWMQzf55RQmj0gq6vGHv8loRuRHTg7TsFrEoajFosgrc
 Qj2Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrrxL54U8MW5ns2Djzpwqtxpzo9ujxc3ofPaH0vZ1dsAH18Tk5tQ0XeWnBNN9npcotts56TKUBpgw==@nongnu.org
X-Gm-Message-State: AOJu0YwVFDKxoDUQ8EeYvshj5I0YAUXTgiJd9kJLMCfPWdp9WAeFbqxB
 ji5p+3qlRJ6uCmCs5BcOWTIkx2oVE3G/U/fjX6bYzBIcmced+GIDg7YDg4jDU9R/0oA=
X-Gm-Gg: AfdE7ckOCe+1rDEWLgvxjq96PBR+OtYikegV7aMmYdLqburjWRtdLu2ePglPZlnlcHG
 0TNNYz6Q+I+gmx8YIMkvFCkDB/6aoFgok2dzlkBSsPFthynu1gC+WFoYbi6DILzWSVptBoCW027
 XyxGVqhbu0FWZIYedEycaK0vbzmGxFmGqZWvedNjp9QUW28OIY3YJ7xWZFwjkLNxXOLckh0m8nf
 X6I6CsoCzDeFR4HKZZJuLWx0OWd3Rdui9HPP/qL2qYLorinYKTAinkewesjemet7cytm6ObPcza
 w6+5F747i+BAwxQvZ0xI8I+VwZvapfEX0xGxLEUj7hg+CDgyn1rYt3r9btbXWSJi2FeMjx6zjHg
 XAhJWhWFsGpSEVpvLTdNG3Sq0mS2Ebxntt3CFnLozz6yPkIHYHKMN8yA/7xoRqgRF/5UF5P+DV8
 cMMdgtZ6XnaptjhuhwmpB4YM2kwvPlDxBZxLKxOy3xhcVDKkhdE8H4b++Yew==
X-Received: by 2002:a17:903:988:b0:2c2:bd0d:3cf0 with SMTP id
 d9443c01a7336-2c7e157f332mr39925025ad.25.1782315539008; 
 Wed, 24 Jun 2026 08:38:59 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f65082easm505365ad.76.2026.06.24.08.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 08:38:58 -0700 (PDT)
Message-ID: <c154f7cf-9f9e-4b5f-8ed6-65accb382e82@linaro.org>
Date: Wed, 24 Jun 2026 08:38:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] tests/tcg/arm: Tests for new FPRCVT instructions
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alex Bennee <alex.bennee@linaro.org>
References: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
 <20260624-jmac-fprcvt-v2-6-dc6cf8e512b6@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260624-jmac-fprcvt-v2-6-dc6cf8e512b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 6/24/26 06:37, Jim MacArthur wrote:
> +#ifdef FPRCVT
> +        asm("fcvtzs d0, %s1\r\n"
> +            "fmov %0, d0" :
> +            "=r" (output) : "w" (input));
>   #else

Missing d0 clobber, but better as

   asm("fcvtzs %d0, %s0" : "=w"(output) : "w"(input))


r~

