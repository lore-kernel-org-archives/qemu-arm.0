Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC167D66B9D
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 19:07:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVwsG-0003e2-1T; Wed, 17 Dec 2025 14:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vVws8-0003dN-7U
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 14:07:42 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vVws6-00005a-PD
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 14:07:39 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-7bb710d1d1dso9271633b3a.1
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 11:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765998457; x=1766603257; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M2Ij+TO9IRQQJ4HqFs4hJR0Jsov4OObzjS5ZcJ40pLQ=;
 b=Eq2K+6ABe2tZi74ss+g/3T0yNfM06JMn8bUlCg8QP6afFYcW3cCTVMYtgpT9ihpUy2
 JZ5YtNpKXaCHQtqEtqLL478OPV31CdkghLzwZbdbR1VyBmnV4ASSpE8p2oDYnYpbBU+k
 0ug4cmSYjLUoOa0Ko3tpIMPXHgtNxnQjYQ/xCC1hmfCSveAp9uokYTTanQZpmZkXnmJJ
 8FqahDwfq4QxP3txqtDWCsoKysTS9sYbDFXDekWcOPXfos447wYLZ09Js/WN/r4Pjo+K
 q/wICzPOidGjzaV0hXkgT0wXP+HaInOJL3h6lipLOyDPpko52FPQVOyXK4+NsI8AYM/o
 boxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765998457; x=1766603257;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M2Ij+TO9IRQQJ4HqFs4hJR0Jsov4OObzjS5ZcJ40pLQ=;
 b=oPyxQx4bQm8uW6zQYDgvOHZ3/jIv+D75Q2m6GyMC68vAKiV8b5Apu5vVLTGtX6mlGp
 K0ktsTGN/w0Mo3xt4Cx70ejl0wxtw75QAOcKTX5iaOajRAEZK1cn2XvX8gLmqm2FL4Dm
 3qWWssJSirMVXst1Km2sl6zYALHUesl9wMy516UJd4sqzGoOPevzw+hWo1b+hOGbEAKi
 pk2vP+UVCF8f2qTdiHmGoMjVVj/1E4b3msmBJItCn2F/m/KKvNwgFZqHmCrL4Qfupgni
 fsrIcXI1CsrPlHJWe2DR1CdfVaHSg8wRmVAY7uPPb9f7K7jAl65T/aKH+QGWs5cEPshD
 19uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7uBCZHANxW8v0hoUSlFreikGKm4+5g9Za2R659WlYbA4wjsLh9LP7+3gp8+onu/rNN35rqT6G1A==@nongnu.org
X-Gm-Message-State: AOJu0Yzcez2YFGfeav99xdFpItwVLiQe5kEU2t9BtMX+E1mW29/1iwoE
 0+TAgy+UtgwN6vp/6sSAzjmHVj1u8gwV4YLoY3iN3o5isW2Db0pdpuOepidIpkmIMTQ=
X-Gm-Gg: AY/fxX7nMQWX9YlcoWHKM8h2dm5PyAdYEMb4e1jwbdToXwWtuuDdD8tS5J9muOQEbJE
 jQmy6PlkeMqFakXILNm5wmIhJIBWKx2BJ9DNlLTHzmnU/u2vqRY9nmFDqyrKWytf1FdFnVdcXJq
 7xSvcXqo93/+a9e5jhOr4ZLJvxFdYoNYj3hLaCXs22++p4+3je8BdFcojlbmhrTDkCF9h8TEiWF
 d/D3EykwbPYJp80OC/keDwKSHnUcrdAlv3F9UM993nrGKSvylV1VTJYaMV9PUAtF2TL4pvM1aGu
 lOK05Mxbg2DrKV1hH9nvKxQlQyWXqzKxXUGu8JEvugU+JKEUjsun/EHmPi2jzLByJ9WhS2cazG/
 37FMJH8aOC83k1KPcl5cjZMRdk9N0+ShfNHdYCjK2frci3yhJDrCMR3xJ7Z9L2Ym6iV5oBRuOYk
 QlJvGr/8HZU2uwVUC3M1GQZmGqQtGoLQ==
X-Google-Smtp-Source: AGHT+IEnDs5mIT1HNCcg9ffKMB0EZQiDJkFPBSZOh8kfm7rzi/91q9+/2pUJpcZalI0aADnuz9oyeQ==
X-Received: by 2002:a05:6a20:a11e:b0:35f:2293:877f with SMTP id
 adf61e73a8af0-369ae4902e4mr21270864637.33.1765998457108; 
 Wed, 17 Dec 2025 11:07:37 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.245])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1d308bb972sm120798a12.36.2025.12.17.11.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 11:07:36 -0800 (PST)
Message-ID: <1d89855a-a760-411b-ba2b-a828564b1c78@linaro.org>
Date: Thu, 18 Dec 2025 06:07:27 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] hw/arm: Update bootloader generated with '-kernel'
 using stl_phys()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@kernel.org>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20251217143150.94463-1-philmd@linaro.org>
 <20251217143150.94463-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251217143150.94463-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

On 12/18/25 01:31, Philippe Mathieu-Daudé wrote:
> When the MemTxAttrs value is not specified and no MemTxResult
> provided, address_space_ld/st() is equivalent to the simpler
> ld/st_phys() API variant. Use the latter.
> 
> The _notdirty() variant is supposed to/not/ mark the updated
> CODE page as dirty, to not re-translate it. However this code
> is only used with the '-kernel' CLI option after the machine
> is created and/before/ the vCPUs run, and*only* during the
> first (cold) reset; not during following (hot) resets. The
> optimisation is totally not justified, since we haven't
> translated any guest code yet. Replace by the normal stl_phys()
> helper.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/aspeed.c | 3 +--
>   hw/arm/boot.c   | 6 ++----
>   2 files changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

