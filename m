Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1208718lft;
        Fri, 1 Jul 2022 05:38:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uWc+h1bVu4mOFuPV7ZmCqZSg2PqFaLetM3LIJljhZR3Yr592I5VNMwMWhGsanmS2vN9rsW
X-Received: by 2002:a05:6602:3313:b0:675:5d31:56e3 with SMTP id b19-20020a056602331300b006755d3156e3mr7362897ioz.102.1656679105045;
        Fri, 01 Jul 2022 05:38:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656679105; cv=none;
        d=google.com; s=arc-20160816;
        b=iWLdk8/3bgqWExkK5HRRlAFk9+GZpSUp9Sqn6QbeiNGuvGXGB6dwLNr/seME95JlYG
         P7OxXNQrC6/mNO4ooOTNl6Qqjc3fACycTqo2QaEWqXbqEr2PmngtU4x6akTEJqPpslUi
         i01qo5PNmqxDz4+pmLsFhB8AJ4RNFdFTYb49ZwMCRQUDlaQr6I4gDNZ2M4JafAOliAwv
         wnNRvYEd74dI9+zM+MES6a0fl03k4K1scTi8PUzPrXT5tr7JhPA9+B0vhenPj9uruAwI
         Wjatv3QmmHKL7WGNSy3TbT9mI1vfe6sd3atDIOloSa106QA7F1cU/bKiQzJjvqvEFc2S
         X5OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2x45qChXzSiE6ttQterCyPPWgGWkWOtA75UESiFBCRc=;
        b=d/XgsN/14Z/COTwfJ5k1uOCkW+QcVHwzz47IASUQocd2ooTyPiF3G3IA5XtIO4odss
         0sLKx72YlX8iWfPPXLrMwFBRwqOYruhD1FLY/BLTlul9/rla1lSPCDdl5XvUbB5hghct
         EJIM7mGGbWAtCDFyaviGC27EQmHljxbCOM7S+u1InQbv7zNBcCHPlg4pP/AaDYvVxrTo
         32gD3Af8sfcT+hR6yi4OHxidvBzGDK2zqHPRi+iSfwwwz0QONnhF5omfiHNQiD3vIFrA
         Lx0j9Afvb00Ohe0K0UcWlogQI/SLfq1ybKTGAU669eBOU8hkYCwcAlUjd/IDjT457RzT
         oBWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQFbt010;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n22-20020a056638265600b0033cc018b559si15897984jat.28.2022.07.01.05.38.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 05:38:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQFbt010;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7Fug-0007nI-Lu
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 08:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FqL-0003Pa-P8
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 08:33:53 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:41974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FqK-0006B5-9U
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 08:33:53 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31780ad7535so22071957b3.8
 for <qemu-arm@nongnu.org>; Fri, 01 Jul 2022 05:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2x45qChXzSiE6ttQterCyPPWgGWkWOtA75UESiFBCRc=;
 b=KQFbt0109Ht1Ai+c8JFNfCKUdAMiP9OaAhmY2rrjODWXoX5LyDk6AI6hPAio8GHmOM
 dM3ESsvTI3lOicsAQq17fkjWVYkOf0L+5qAFna/p3XAbSg/3Au4oCkVBeiZVPVn/LznA
 dOBpCIhE67UFItZshAYh+bSL8Cbvgf/AY47J7HdCwuGSHcx4k49Yi2isTcX5rnJJW3gF
 OZzIYAwqJS8z87oPkDYrQXYUVBrX9Cvxau7F/tJyu2x9BgBoOkzld1E28tpXzuFl4sG3
 ReQ8c1fs0LGJMsE7lr8bVVfPKi6ErwaLz2bveygocHRQMy7APrPVkT66DsQy0kfgXNo+
 KxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2x45qChXzSiE6ttQterCyPPWgGWkWOtA75UESiFBCRc=;
 b=rEIr5dT+cyAqtvxdXEfObYF5lpFotLAklsW8QKbtIdt7JmdUadaOYA2Xo5SK9w8r2S
 ltBv1VRajpgHRJCX1vJpkj5nzCe2L+V1aqDSQT4Rpeir8zX6aSWPaZtLhGmF2/qU3RHN
 G8aUSIVinXSXThFi1gEMP+3mkMZg/GL6JTt/wum7Cu3ZtmIBZnEQR1TR4V3ItQVBgNj+
 OdICq0XaKsBZABFdafvW3BxfhBiWd+px1WtcYLn6eVmNcmgwOw8wMU5AmdLCcUMosMg5
 ppk0angs0yhgWDcXDxcCKYw1pq9jeR3jpRkn/Rmnpa7Gr0sUS1Sz85KTyuuQ7p9kbzG6
 IEdA==
X-Gm-Message-State: AJIora/pQOnrVUcAnNr6f5zsCz8uy23rjlHr6IDNEXNQGm9PwcovHp/m
 mZ6WCTrkWxc8nZFkM0VUDh0Py095qWXMb9MHm6XiLQ==
X-Received: by 2002:a0d:db55:0:b0:31b:71d8:21af with SMTP id
 d82-20020a0ddb55000000b0031b71d821afmr17348810ywe.469.1656678825041; Fri, 01
 Jul 2022 05:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-14-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 13:33:07 +0100
Message-ID: <CAFEAcA-QHdQZz36BZNTswQBY1t1-NXsr3FtPAh1=+iOJRTM3GA@mail.gmail.com>
Subject: Re: [PATCH v4 13/45] target/arm: Mark LDFF1 and LDNF1 as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 65E7XQQah26N

On Tue, 28 Jun 2022 at 05:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
