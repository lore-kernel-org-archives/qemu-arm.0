Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp623549lfb;
        Thu, 26 Aug 2021 06:41:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPR4bP0Vx4FRZkeG64WMCJSX6ybpEWPlaVJYL9tROfSGtuf7TIizhSrgIShyre4jUmeOQO
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr3759588wmj.126.1629985272594;
        Thu, 26 Aug 2021 06:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629985272; cv=none;
        d=google.com; s=arc-20160816;
        b=uLd4rm1oKSe48sUksA8wyrgSaIraxaFUsUBSDrmhPOdCEWFpqUZvEhMfq6UU4gqgEI
         ovu3j6Jykl04bxtRTGt3WdzCDSyb2piwWi6GjgZyntuolWBQ2yE+21opApuowF4XfEz9
         kd5xQJUdHuOUmP6Sy6ZTpU4RKN7yJWnbupCgdMdVl2McKLZQqPb9j9KksUSuDttAXyg5
         ndepIJJimvFUqwDMCk4X10FxysyEPatpI4ODFzoIhpYsczTsh2Yiiq8FWq1dMNNjBBXo
         GB5m7dGFvGtZvMD7YWd8bX6VE1z3sS7XCFJr4tyhtTw53P2ObrfgGwUQmCq06vwQRQ+g
         gAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y0KkHSYVl7C+vp43dReA4vH8iDsv0muUrccBs6r/A8Y=;
        b=Q5gbWESDdhfJbodLaBeZC2f8e6sUS24pbmJhLFcgvqD3GK6P/2PKJLQinyMVv8E/8q
         qmusL0Nxszi6s9ag5hZCzocGAFpXflpxzP3q9bo8zob5wJ8kwZXUXrceChPsbphfc2H5
         JFUY+Zcgg4NWMUAuxFNEl27dvxNQGl/KBDJgG18tBaQo5n+YrOWB63xm7IF0Tgz85gIN
         ZDsA/lMUCicl5kOnK5VI4oblF+VJ+UCrExDyklLnOdD3lwsxRL0uEO9L0Xin5WP2mp0H
         ye7Iz7Fq+HL887mzecyDHGFzATSrYoqHQ7q1E7bID+MbzPcW8Ay4JMAE3VzTsYiysGk9
         BFFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vItRLIbi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18si3034072wrn.221.2021.08.26.06.41.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 06:41:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vItRLIbi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJFd1-00089y-MO
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 09:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFQY-000250-EL
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:28:18 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFQW-0003tY-VY
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:28:18 -0400
Received: by mail-ej1-x631.google.com with SMTP id i21so6327696ejd.2
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 06:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y0KkHSYVl7C+vp43dReA4vH8iDsv0muUrccBs6r/A8Y=;
 b=vItRLIbiqyyQlwfgmdEC8jBzCoqPahxwIF1bG7wNLre219Igj1TAxb9uXYQ7dvs+x0
 BrIXIqOoVqYy0wpF7AJS237zyb1VLmJnY85dJf1qeNGqPe78yt5w+H2jnPb6c9lIwmlB
 cXznzarsih0w3H7VOSUBc/JI8TG9wvF21pKgriJg1QL+uwzXJWLkZXvJ3UZ5ksOAlbth
 fVsKPU2kI9cEcCFXkmZi2DH/QUgswRsirLG/da8gytxPXe+qeA3nmHwUc3nUtm3mEjsA
 9z5vFtSkCj8wji0cUi1s0KZsYbrM5gzBuyGVXyM1anmtEQjXfHBKgKKuGjs5ufvFMgnl
 10jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y0KkHSYVl7C+vp43dReA4vH8iDsv0muUrccBs6r/A8Y=;
 b=B2CW2o9zDNWRwmoW2UL1+PwCrXxk8/ccZ+EHT0D6J0meDjcRi8Z8vq3Xf1TzjRXilY
 Kqv+GKDQYu1SyVrYSGTUvAzuI0hQ3XUvofVk6fhKa8G1rbMFKAjIcCtaYgxuOkYeNgAs
 6lsigIHFROta+X6fRuN6tMfqrZ8b7mb37Vg8S3vFEFzoqpQFG2ww38FI2lmLQJpc6C+r
 DKUEedPPPgRXtmygeWN9I6xzuZZY5+lwilOeGndSv3h1JK5QJYAFwOXGEy8TCo2tSINH
 9V/2RkvVdXO6M0LmhcjcWtXaNdzqBwIdI5jORXQQ8sqwveUpkoA2KJHs5/VXvbeCoPCA
 wipw==
X-Gm-Message-State: AOAM5327GLhwTL5qxniKztmoUgX4ZRNRaWh4BtHzShsIzpkZJQXI0DkX
 tzONwqevGk34PAL4p1we94TwUKsO77ri0UBz6WZ2bg==
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr4215635ejb.382.1629984495354; 
 Thu, 26 Aug 2021 06:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-4-richard.henderson@linaro.org>
In-Reply-To: <20210821195958.41312-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:27:28 +0100
Message-ID: <CAFEAcA_YbTp58qNouq1xaa6uk_K+Hy9xzE=QXjs6YESrw2uEgg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] linux-user/aarch64: Handle EC_PCALIGNMENT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1W1HDABtYHyg

On Sat, 21 Aug 2021 at 21:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will shortly be raised for execution with a misaligned pc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/cpu_loop.c | 44 +++++++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 17 deletions(-)

I wasn't expecting PC misalignment to set the FAR (after all you can
get the bogus PC out of the exception link register), but conveniently
for us it does.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
