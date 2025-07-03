Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp430927dyc;
        Thu, 3 Jul 2025 03:14:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXw1AzWFxb99yr4dGBkXIlYyywUHNU5sL+m0dBZmkCW2BRrh0uyRDDlw71tm3HRaZsF7FcCHTnJPglhw==@linaro.org
X-Google-Smtp-Source: AGHT+IFSGWm1+bSOSuacbLOGEXmvYAcXHwEDqriByJqyzLf7vgx3i4jd+vO3bPOt4uKa2jP739rl
X-Received: by 2002:a05:620a:aa0f:b0:7d5:d49d:3e29 with SMTP id af79cd13be357-7d5d49d3f2fmr212490385a.45.1751537694291;
        Thu, 03 Jul 2025 03:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751537694; cv=none;
        d=google.com; s=arc-20240605;
        b=bE64uDgF/TmsV2JyP1MUmJvt37kPjdY0EQIFrHwtIhnY9UUVT9U26K6z5KCu4P6vTU
         b8zI/1y1KAjPN+teGwrMm/q/zWXA0/5F1cKfd3MjQiPBAShtwnwehpT/aF3gpN23LDoB
         P3oIVJDkoyFHl2/77kc558fusCyB7egt5AOPLjcT2q1z2UXzGPeA6oG4e+LDpDfRg+Ll
         EKlGOZsNvLC8wAUETqvKGWusz4rgJDFo3j2ztL4ARo/qRhHJAmhJo+BOOEm7EzVKBboP
         yOaNgQaI6L/DuSqlzF400rP6NpeITDnSNIQQH6BsH6P3/0UGtOR8+HMRsGfAphlMsvgS
         yD6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DAdw1JU6QcqbemXcyoAYoUX7dbH9h6/ZiKNeCYV0wNM=;
        fh=GGwW+Z/GMn9bMyXL+lcDXDk0FU0q3rm4wkt0JpGl4Q8=;
        b=SGBuATepDy92pnr6Va7xLGMtNMWM3n2jiBYYYl/RM74gA5pDnRpzCiOjz/i9UObDk1
         NwvYDTPYTmExQAHw8f3D00YhO0TpZFF6DEn9eYEWJcoDH6Lo3aSUKzn5gc0020RJ4lvM
         rhESwcIcEyXsxicplwTRMAFglJ9snHQm2YGOo6eq+Wj0sxmfhONdmCRB+4R4jew6tIg7
         kHZIMWqc7h+rWqMPXKZehLcaMQCd2YgpjmPdwn3OcI19vvf6+M+iCajQ9sE+Sf1NxcDE
         LnxUwhyea01B42ruo4lS4mnuWf0yZJTtP5KtUwAUSXtOD1xrf2byBoRhaIhvBhaueP9X
         NPbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SGu/MyfC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d443228dc2si1419437385a.232.2025.07.03.03.14.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:14:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SGu/MyfC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXGxi-0001u8-FW; Thu, 03 Jul 2025 06:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGxf-0001rC-QX
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:14:36 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGxd-0001G8-Ot
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:14:35 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-71173646662so57408367b3.2
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 03:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751537672; x=1752142472; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DAdw1JU6QcqbemXcyoAYoUX7dbH9h6/ZiKNeCYV0wNM=;
 b=SGu/MyfCAqi+/ZWfcFVSfrBV/TA4UC6XY1VaWs3VoImdCbVOAGnpSs79DMGx2ygdR7
 Y5gRCgglLgam8vr5wZDLEgOhpOgfdlzReqkthq1hFre6CYb8913uLEZeO1W4vp9g7s6H
 cog0XF4rp4ZqfY4H0SgI52jSKLDzN0AhWtSRAWNZV633bSwYNQ4y3xJs+ScXTDxd9cPV
 t1IYm0FH1Bz2+cS28k7q7vHFSICYM8pRYPwzLrFZH3Bw19p53J4RfiVJendPv4T2s/2q
 /8+BF+L8zL9iffhLaUiVz10G12+QTkwGMwLnoYXEMHXGRcWDfNDAWJzs9/qX1wCh8OFV
 CPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751537672; x=1752142472;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DAdw1JU6QcqbemXcyoAYoUX7dbH9h6/ZiKNeCYV0wNM=;
 b=T4WFNKZMasgWjnm9f+uEa0sX4rJrdl+9pQHxGq777VxtjoWi8PIlK4DRf2D98KbdRl
 RjmQrnQubUKYPl0fPcBBKE8hUzwK+E8hm8J8mmkRVssf38C5tVKdp4BOaj36yDHSDY5l
 IjoUnsds9Alh5kLRi2RU3h8HlUQOzaoIs8upOhVjlasiiDk9Nj8E1D0FhWmPd+QNQrPa
 cMwTa67G+cLx6hLs3CTJlNMZh2HfoFvy12tMX1oSH/ZKpx3B10UCKoMfm9MrgUUVaxiq
 P6TJcfbYeQ7swy5dDH+dw6yecT5UixOTn54tgyPLLUZI7BF/q14H+enBkgCSsikkEStX
 KYrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4XAilCvSWwuYZUomfBZjzkdOO0JASsZ7orXv854Luzxj6OKHbf3FcZ1xrOk1hYSrrAIPW3xOADw==@nongnu.org
X-Gm-Message-State: AOJu0Yxb4RaVwTD1OdJG58w108LnX/UvkSlsh9zabrdjHD3Ik4Vm7865
 +QiZPia6Ph0qsyfT2/49gaWPwdv1KzsyQeXFtJyLW+21oFLSTj51CS4nZ7dYP2uW/fuf2rnEUM3
 siDvRfqYVYDq+WSvadqaaY0UWWz4l7K1GlRUU5bTgoQ==
X-Gm-Gg: ASbGncverKbGIg8uWKLHQ/liT+AzAV2f5bKZoDmp9KA7Hm9F9RL4kRlXCzUJTukxQq9
 o0EjYfFgEGTeuVCFIliv84An+nymQBqzc8+t+z7bAXgFJoQPbXpzHdl8EccnZZQil3PQfXt2H/W
 DfHEBozPoQZcjjgqGz4mBHHuIgnH6Hip5AZrn1yNG1GzNa
X-Received: by 2002:a05:690c:6c08:b0:716:4ae0:7bf3 with SMTP id
 00721157ae682-71658fdaeb8mr35302627b3.5.1751537672233; Thu, 03 Jul 2025
 03:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-45-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:14:20 +0100
X-Gm-Features: Ac12FXzqdkLTqcus4fsyFzGRJ_-B5xJwjxHr9PWCq-IW4HQz_GRje5Hxdm4gz0U
Message-ID: <CAFEAcA9vjdu_V80QzmGgheYJRmYhvcjO6p1ouCHRuMokKdsKFw@mail.gmail.com>
Subject: Re: [PATCH v3 44/97] target/arm: Implement SME2 FCVTZS, FCVTZU
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
X-TUID: 2P+KlixiDVcl

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sme.c | 5 +++++
>  target/arm/tcg/sme.decode      | 9 +++++++++
>  2 files changed, 14 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
