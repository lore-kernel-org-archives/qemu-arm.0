Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2474294njc;
        Mon, 18 Nov 2024 02:10:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX58Ecx3cxBTTLPCbTHdkj4xCiTZIiXHdj2BnCFzhWfKZMx+PosVXZefphXDs9Lq+X40WjLRfVNnyE3bQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHiPk+FeybSoF118LzKkjXw9o/BVQE6AbQ06046O7HMrE+O4jGyvDzvBhne5PEWMgkZzBe8
X-Received: by 2002:a05:6902:18c3:b0:e30:d4e4:b9ea with SMTP id 3f1490d57ef6-e382617597amr10300279276.28.1731924644408;
        Mon, 18 Nov 2024 02:10:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731924644; cv=none;
        d=google.com; s=arc-20240605;
        b=jhlT6Is5fRDQm7Ktraqt8hI31X4mfe9prTRLgQhkiJ1xfI6PaJVdX8E7XpV9J0+G75
         LeUDJIbs17yCgMA5lGNbRU/JgMpYOQJ9o532qJTtHr6i/UBv1KROhaOcFOHB/Qwuk7uL
         QvOQXeUaUidQh5hNQZeYNEFt0pJD1mgsWgcyGmvcJEAb0vBrdjCfuhh5YjMgChzbrmQA
         fM7tLjRxH7BJsU+pHpgnPBxUZfG4r5UerOwSkkQ9Xm/5go8LsS16vQlfAqCR92sP6GjM
         7UOiSmVWw0X5aEAPezKcgB6Xio2q1fTgXiPR9J4yo7N2NKKhdHKs9dSLQq7uI8X0qSOn
         Pkzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MK7BOP7Ei1yKNKupjCO/INk13vv4sKScdgQxzbucQ/0=;
        fh=UVC1Zq62HCJZEiqrm1U+zfFeDvd42oTUDYMOIHH0dzc=;
        b=V+ODYRAkBFHMGoYtslOPSju6J7Knkpw4a6R6OfLWycpb2BUiMNy/r7P+aAQfb3SQQj
         BWShX6N2v7g9QtO17i74ohNpy1jiIgEPyhVJxKhNHFaFovJFnAXEMGAdJb1S63TClBO2
         Y5CK193XKmpjlG6O5L9OU8Ddr+6BVOOWdBtUairkyOYwQusrddDqzSGXQCWJdj5g22Uv
         RyCOut5mqnQaen/YwfCHkkRqextVNgJ0fsyqtnDe/EIMRnc3t6yJYq0KCt/+K8Vs3oUj
         PGB1230nOd6zw13r1jHJLvOC86cIXdK9Y5T+ZL3fqQZVrTQXl5V3eD4Q0OfFG92qXwvv
         DLHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RsCgZ2yi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d40dc8fe03si60455256d6.310.2024.11.18.02.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 02:10:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RsCgZ2yi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tCyiD-0004Ez-Nc; Mon, 18 Nov 2024 05:10:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tCyiC-0004Eg-Bt
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 05:10:28 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tCyiA-0007w3-JG
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 05:10:28 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2fb3debdc09so20716491fa.3
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2024 02:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731924624; x=1732529424; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MK7BOP7Ei1yKNKupjCO/INk13vv4sKScdgQxzbucQ/0=;
 b=RsCgZ2yic6ev0+v9Npa3VXtwoZjiP0jye2Y3UPvYXS7Iu06ENAgtUR3jJIA3X4S+bn
 4yV2iKTpHEnYYNWDktGv7M2IfezUIN6QH3gP7meGHKyiaxHe8S1wN/CsZo1rlH5+y6n0
 p3e9+T0PHqvQUtTe2MFLiLoUolIi6n8OplaW3Py1VZpVh2VRwVESwbWgvjrqDxbwNXIW
 1Pu4ACOHFGf7/biDFJ2qp5uTbZzSXfQvOJzy6Au5xJMGnK6Hes47A8iMepkdKY+XKeuC
 MEMqHmcIz6cLSzEtf5KFnrGdvl3fdk8xm8M446tl8MY477A1locen8WO+OeepHKQtFhj
 aouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731924624; x=1732529424;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MK7BOP7Ei1yKNKupjCO/INk13vv4sKScdgQxzbucQ/0=;
 b=pvYrmZPW0blUu5F/uoi/ge1MuvFSaNJJomkqrtVVLqd5XropkL13XuN7PJCFhDRcSZ
 X0kRHCxYuzGonLPIUyTn1om5sViIs6BnhwQR/Kke+gy60696oUeLj3tY5xzjLMBWGoQo
 0ELmmrEbmBD1RPXTLFiDmXXEdfI7dRX5S8GRftZIpGE5n1NJFhEcFZYcd221V1aXVn6U
 wnpCYt74YYQoW1b0ZrlK5s1MsEN8hwZWv0MiBufkrzcne/TuW/ifamkI2C9QXUBpsFm1
 r299vJfUxoltuAWIDu2tVR2cyHXWue5s/4t8G/zYvntvof8btNiU4EN6r3VtQws8QGjD
 OEsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCPLAgdU2j2sHkzwmnjxgUV3u+q/iJ1gkzhUSr1r8hMnnvEYp7UGa/zRljrFeb1ktZ67dJEtqSYg==@nongnu.org
X-Gm-Message-State: AOJu0YxDuuz8WEQ79T46ieAUyF8CxUqoXFMrBbnw0j/KluAM7DJXjGcH
 NDep/SsMFm/msn/da/pjNUEunV+TMpxisSu2p7N9EK7gKwMEvpuTtgiHz4pEcmqI39S8wZHlwmX
 256SirRNf5Xvg7hKPuyzJPu2qddNYJ+sG0GEpmQ==
X-Received: by 2002:a05:651c:98f:b0:2fb:5035:11da with SMTP id
 38308e7fff4ca-2ff6072531fmr60666931fa.33.1731924623733; Mon, 18 Nov 2024
 02:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20241118021820.4928-1-joel@jms.id.au>
In-Reply-To: <20241118021820.4928-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2024 10:10:12 +0000
Message-ID: <CAFEAcA9tPhbjnJ6XjMcZq6iWS4i1BdrTB+=391L5UgaVSMkCLQ@mail.gmail.com>
Subject: Re: [PATCH] hw/aspeed: Correct minimum access size for all models
To: Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 BMC-SW@aspeedtech.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x234.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +IsVymRSo96R

On Mon, 18 Nov 2024 at 02:19, Joel Stanley <joel@jms.id.au> wrote:
>
> Guest code was performing a byte load to the SCU MMIO region, leading to
> the guest code crashing (it should be using proper accessors, but
> that is not Qemu's bug). Hardware and the documentation[1] both agree that
> byte loads are okay, so change all of the aspeed devices to accept a
> minimum access size of 1.
>
> [1] See the 'ARM Address Space Mapping' table in the ASPEED docs. This
> is section 6.1 in the ast2400 and ast2700, and 7.1 in the ast2500 and
> ast2600 datasheets.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2636
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/fsi/aspeed_apb2opb.c  | 2 +-
>  hw/gpio/aspeed_gpio.c    | 4 ++--
>  hw/intc/aspeed_vic.c     | 2 +-
>  hw/misc/aspeed_scu.c     | 4 ++--
>  hw/misc/aspeed_sdmc.c    | 2 +-
>  hw/misc/aspeed_xdma.c    | 2 +-
>  hw/net/ftgmac100.c       | 4 ++--
>  hw/sd/aspeed_sdhci.c     | 2 +-
>  hw/timer/aspeed_timer.c  | 2 +-
>  hw/watchdog/wdt_aspeed.c | 2 +-
>  10 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/hw/fsi/aspeed_apb2opb.c b/hw/fsi/aspeed_apb2opb.c
> index 0e2cc143f105..855dccf6094c 100644
> --- a/hw/fsi/aspeed_apb2opb.c
> +++ b/hw/fsi/aspeed_apb2opb.c
> @@ -259,7 +259,7 @@ static const struct MemoryRegionOps aspeed_apb2opb_ops = {
>      .read = fsi_aspeed_apb2opb_read,
>      .write = fsi_aspeed_apb2opb_write,
>      .valid.max_access_size = 4,
> -    .valid.min_access_size = 4,
> +    .valid.min_access_size = 1,
>      .impl.max_access_size = 4,
>      .impl.min_access_size = 4,
>      .endianness = DEVICE_LITTLE_ENDIAN,

Have you reviewed all the device read/write function
implementations for these devices to check whether
(a) changing the .valid value does the right thing, or
(b) whether there are cases where we should instead
be updating the implementation and setting the .impl
min access size ?

thanks
-- PMM
