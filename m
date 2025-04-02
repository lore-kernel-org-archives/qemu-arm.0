Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3317816njd;
        Wed, 2 Apr 2025 02:13:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbLZ34ZdcJZ47TIZBD9PNHB5qjKHzSZeNQu5KaQNqnl0gCJDLr0Znuq5rFtyMg3js1Fg6e0X/Mw8FfIg==@linaro.org
X-Google-Smtp-Source: AGHT+IFweRnDBrkWJG/dJryn+29W76MucAEXoEm4Vu6nw5oWT0gbFWzJgm9n8MD9VLEW+PVD4gC/
X-Received: by 2002:ac8:5c92:0:b0:476:875e:516d with SMTP id d75a77b69052e-477ed669571mr210707801cf.36.1743585206515;
        Wed, 02 Apr 2025 02:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743585206; cv=none;
        d=google.com; s=arc-20240605;
        b=T6NPtu+5xLLvkvwNcPMnLDdn5xS+IgiE3akWDHj9zAXoAlxG6SEprNTw2FFoFdUK97
         sNowOuZr2pJJJBe4PWMddZM1SMDXCfvNKBP+Xp15X83duFux/GAKxn1TBEfNpVyulhiF
         l1tBXruj42HwQ5LyXN/uASkwLOIt7XYiso4TohTt69KbCm1zTVDvnGDz+8OW4nY1EtTr
         womglhXOF50pC/U+e4UzBvSNt3gO0Hc0jsNW5EF1b0CVERlVVD8wTYV81YykhLJin7vc
         x2Tl+JuIuZFr5KLj7b7rlsFfDVFBDTkEWdKyuBcMUHFqvl9D4/piWdHV3V2KAVYr3rgD
         mtqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=sEimIUh/PFlcgkgLBbWZnDanW52xf4UAwT/xZNKFpeo=;
        fh=KIQWrerkHcHGY8pI9tE4eJlk73GRvR/oZFuXy8RkeGg=;
        b=fBKhyqce1s4+BO3L7NcH8jP1aQPooS0msDw8SxLghnml10wRkdSix1nF9DmBDymFYr
         QURZyEeHPfqaPjE0LgupzlGfNKvjzrMlW+nCl4NL6kSR9Oi69JaprermQ8r04UDi+el7
         wa1cHMpqcuFfIDlxpCkb5dc8Kh2X6C9BMCU1aaJA0Pi8hSX0LZiY5dEtuoL4k5fzu9GV
         M9hUM3iBMMTG9BQZitGUbbghIE7/yrfhApn2zNPM6R4UqihYpa5sZZfsgNd6AnVEWKEY
         A6kdbnGVKzn7Y8EPb1qFQLRoMsM9GUj4suJEEA87U1bh/3IimFzIYTONTYbWQICzOxRv
         M+EA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47782a100b6si102616171cf.122.2025.04.02.02.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 02:13:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzu9k-0002QR-QV; Wed, 02 Apr 2025 05:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1tzu9b-0002Lz-Te; Wed, 02 Apr 2025 05:13:01 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1tzu9Z-0000Qb-CV; Wed, 02 Apr 2025 05:12:59 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4ZSK0574nfz4x3p;
 Wed,  2 Apr 2025 20:12:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZSK0174hsz4wbx;
 Wed,  2 Apr 2025 20:12:49 +1100 (AEDT)
Message-ID: <80edcef0-02e4-4427-a9b3-996e336ed04c@kaod.org>
Date: Wed, 2 Apr 2025 11:12:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 21/22] test/qtest/hace: Support to validate 64-bit hmac
 key buffer addresses
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
 <20250321092623.2097234-22-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250321092623.2097234-22-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=yfRC=WU=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: FufaZY4v/68O

On 3/21/25 10:26, Jamin Lin wrote:
> Added "key" and "key_hi" fields to "AspeedMasks" for 64-bit addresses test.
> Updated "aspeed_test_addresses" to validate "HACE_HASH_KEY_BUFF" and
> "HACE_HASH_KEY_BUFF_HI".
> Ensured correct masking of 64-bit addresses by checking both lower and upper
> 32-bit registers.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   tests/qtest/aspeed-hace-utils.h |  2 ++
>   tests/qtest/aspeed-hace-utils.c | 14 ++++++++++++++
>   tests/qtest/aspeed_hace-test.c  |  4 ++++
>   3 files changed, 20 insertions(+)
> 
> diff --git a/tests/qtest/aspeed-hace-utils.h b/tests/qtest/aspeed-hace-utils.h
> index de8055a1db..c8b2ec45af 100644
> --- a/tests/qtest/aspeed-hace-utils.h
> +++ b/tests/qtest/aspeed-hace-utils.h
> @@ -50,9 +50,11 @@ struct AspeedSgList {
>   struct AspeedMasks {
>       uint32_t src;
>       uint32_t dest;
> +    uint32_t key;
>       uint32_t len;
>       uint32_t src_hi;
>       uint32_t dest_hi;
> +    uint32_t key_hi;
>   };
>   
>   void aspeed_test_md5(const char *machine, const uint32_t base,
> diff --git a/tests/qtest/aspeed-hace-utils.c b/tests/qtest/aspeed-hace-utils.c
> index fc209353f3..a5ece614ed 100644
> --- a/tests/qtest/aspeed-hace-utils.c
> +++ b/tests/qtest/aspeed-hace-utils.c
> @@ -591,6 +591,8 @@ void aspeed_test_addresses(const char *machine, const uint32_t base,
>       g_assert_cmphex(qtest_readl(s, base + HACE_HASH_SRC_HI), ==, 0);
>       g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST), ==, 0);
>       g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST_HI), ==, 0);
> +    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_KEY_BUFF), ==, 0);
> +    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_KEY_BUFF_HI), ==, 0);
>       g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DATA_LEN), ==, 0);
>   
>       /* Check that the address masking is correct */
> @@ -609,6 +611,14 @@ void aspeed_test_addresses(const char *machine, const uint32_t base,
>       g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST_HI), ==,
>                       expected->dest_hi);
>   
> +    qtest_writel(s, base + HACE_HASH_KEY_BUFF, 0xffffffff);
> +    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_KEY_BUFF), ==,
> +                    expected->key);
> +
> +    qtest_writel(s, base + HACE_HASH_KEY_BUFF_HI, 0xffffffff);
> +    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_KEY_BUFF_HI), ==,
> +                    expected->key_hi);
> +
>       qtest_writel(s, base + HACE_HASH_DATA_LEN, 0xffffffff);
>       g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DATA_LEN), ==,
>                       expected->len);
> @@ -618,6 +628,8 @@ void aspeed_test_addresses(const char *machine, const uint32_t base,
>       qtest_writel(s, base + HACE_HASH_SRC_HI, 0);
>       qtest_writel(s, base + HACE_HASH_DIGEST, 0);
>       qtest_writel(s, base + HACE_HASH_DIGEST_HI, 0);
> +    qtest_writel(s, base + HACE_HASH_KEY_BUFF, 0);
> +    qtest_writel(s, base + HACE_HASH_KEY_BUFF_HI, 0);
>       qtest_writel(s, base + HACE_HASH_DATA_LEN, 0);
>   
>       /* Check that all bits are now zero */
> @@ -625,6 +637,8 @@ void aspeed_test_addresses(const char *machine, const uint32_t base,
>       g_assert_cmphex(qtest_readl(s, base + HACE_HASH_SRC_HI), ==, 0);
>       g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST), ==, 0);
>       g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST_HI), ==, 0);
> +    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_KEY_BUFF), ==, 0);
> +    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_KEY_BUFF_HI), ==, 0);
>       g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DATA_LEN), ==, 0);
>   
>       qtest_quit(s);
> diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
> index 31890d574e..38777020ca 100644
> --- a/tests/qtest/aspeed_hace-test.c
> +++ b/tests/qtest/aspeed_hace-test.c
> @@ -13,24 +13,28 @@
>   static const struct AspeedMasks ast1030_masks = {
>       .src  = 0x7fffffff,
>       .dest = 0x7ffffff8,
> +    .key = 0x7ffffff8,
>       .len  = 0x0fffffff,
>   };
>   
>   static const struct AspeedMasks ast2600_masks = {
>       .src  = 0x7fffffff,
>       .dest = 0x7ffffff8,
> +    .key = 0x7ffffff8,
>       .len  = 0x0fffffff,
>   };
>   
>   static const struct AspeedMasks ast2500_masks = {
>       .src  = 0x3fffffff,
>       .dest = 0x3ffffff8,
> +    .key = 0x3fffffc0,
>       .len  = 0x0fffffff,
>   };
>   
>   static const struct AspeedMasks ast2400_masks = {
>       .src  = 0x0fffffff,
>       .dest = 0x0ffffff8,
> +    .key = 0x0fffffc0,
>       .len  = 0x0fffffff,
>   };
>   

