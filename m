Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3712366lfk;
        Mon, 29 Nov 2021 05:39:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxPe2poBVOa5DEkIbCEidAzSb3enKNvjJay78YtQBkNc0IKaShjxP3MonQVkfZxm/k4AME
X-Received: by 2002:a37:b53:: with SMTP id 80mr38828184qkl.91.1638193172019;
        Mon, 29 Nov 2021 05:39:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638193172; cv=none;
        d=google.com; s=arc-20160816;
        b=QboUkkubXjdeR5U9oOjm4fay+aj6VAMKr/qpgsImKmaU3n9/nF2KGuYghezzFWt8Xi
         SmgZtYKDO0Hu7JHMVDPi3nXLDMSIb5o+TBI5Iq/1ywQHMC08ZzP8D8pGmYA9kEJ9hjLw
         IcH8mHjHu43Ctg50gGr4CO3wYwRy12CpmIZAZGX7zi2vwp0AYRBtgIFC6eryt/pqPqGt
         CA2pAQpsR8s2D/rs3bKXbiAZ3p4E4xqUxwIXifaTlr/0b79wyqJyc+JQjI/LclaHkRoI
         uXjVwXuLnu0wjpKifQKk/svvqcTx41Soo9l9o5kykf0zXGmLg3MnKUSny6u34om1QMcr
         Xmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wNfrtr4/7mjQw/0TXRMqEhEsBJL9QwYxUHkv85EybYo=;
        b=Nd9oVwI9p+lbDtjBxjoEYOZ1qEAozK1kH82yX0X87Fmq8nuTAY16nLc7aspmVMiPuZ
         9+2+qi3lN7uLQJ9BvfI27bzd2F3cwQVHK3pr21LUvmKKr5VTtyqLT6bfYxCo7dqWnarh
         LVb9dYn0iZLN4N3Qr0e3RpUn5Q+MLU0z5J/5T4FeNtqIfe3eunnEZl1RECHGEA+vK7JM
         0nB1lXexmGTk+nGCXk+n/10ZD8OGf0MUgzTrhDW9mtOEEUnrBUJMiXjbN413EPD6EKEw
         IC0s5b+ppji02ZxzoB/Dc+BfqI5nUTxpQIBD1UjY9s8h+BZbN5pLcxpI8y52c03BNLG7
         mO9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qsINIe2s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3si14107298qkg.89.2021.11.29.05.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Nov 2021 05:39:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qsINIe2s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mrgsV-0000Bn-Ex
	for alex.bennee@linaro.org; Mon, 29 Nov 2021 08:39:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgfv-00020t-1T
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 08:26:31 -0500
Received: from [2a00:1450:4864:20::429] (port=34392
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgft-000774-7T
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 08:26:30 -0500
Received: by mail-wr1-x429.google.com with SMTP id j3so36829181wrp.1
 for <qemu-arm@nongnu.org>; Mon, 29 Nov 2021 05:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wNfrtr4/7mjQw/0TXRMqEhEsBJL9QwYxUHkv85EybYo=;
 b=qsINIe2sK/DdugB5TY1ziuzscwt0i4p/zYWYd8QkzwvXesHH7hx7oFRuuvUHA9r6qc
 EpgOouj7NysgE8/5y9zppfZLAu62bZRLC1QWgfMeNiE/EGonxZUwaHKgNf2lFCENE/9o
 ORWUNk1WxpsQwvgoGHYmeP/nFlIPvI2FiuV3uS8Yrz+6FHlX3Xt7PSDN7geZrnSJv8ju
 3Bur7Lqq5MBAiD0srSc9kRN4NXk9rEzwZzoSdjJM08/XYH4jbmdcM4WI71MTeDxht1sF
 C6PrS9vRXVg+qAj02/E6mGuvhXqZ6atOYCnTLy7yOyyfFa7ZYtx6XGFzKGM6WTpJsAGn
 RkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wNfrtr4/7mjQw/0TXRMqEhEsBJL9QwYxUHkv85EybYo=;
 b=aiFkCNPzKodzSL/YJUgQRtYgcvB1ddu67AO4tdUhul6TvGg4ZSVu608svyRpE1ifP9
 R1x0lIh7KoWcWQW5SkQAi9UHo6iM2QKTz39d0Rmj+1v9i2YscWTrcZSgeIiCLjssah3a
 hesq/1TsbuejfWtDUli/ujN4/73nEFu7cnKLF905thG8sy4XhnJCBR4WSnylMj9SKY/I
 WKNyEO2IVsohCXomihSKUqPOJfj9aC0QlLV2e8Okdq2kdXxr1vLcT+o41cvKsNtxMo2n
 SsXOMaGwSmgt2WavRyiomBZH9rrJBkWCuB+0eTzy8g34pnyi1eQ6fHD5CDAD6t2NDa9I
 hJGw==
X-Gm-Message-State: AOAM531BWeH6QBK84/BFYk9oxd+LxAtUucNw/blu3wn4XnKC0BBzWUOG
 1f6q9BM5GwylTZgfkzc5vIt7mmXhHloXCSP/R2VPdQ==
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr32258976wro.484.1638192387840; 
 Mon, 29 Nov 2021 05:26:27 -0800 (PST)
MIME-Version: 1.0
References: <20211117065752.330632-1-joel@jms.id.au>
In-Reply-To: <20211117065752.330632-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 13:26:17 +0000
Message-ID: <CAFEAcA8YH9WqQr4c8wXsjsSOEc52-LkG0Oj6TZxkgr=sf44jHQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] docs: aspeed: Minor updates
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GjWG604zQx5O

On Wed, 17 Nov 2021 at 06:58, Joel Stanley <joel@jms.id.au> wrote:
>
> Here are some small updates to the aspeed docs.
>
> v2: Tweak board changes, add patch to move ADC to the supported list
>
> Joel Stanley (4):
>   docs: aspeed: Add new boards
>   docs: aspeed: Update OpenBMC image URL
>   docs: aspeed: Give an example of booting a kernel
>   docs: aspeed: ADC is now modelled

Hi; I've added this patchset to my set of things to apply
to target-arm.next for 7.0; thanks.

-- PMM
