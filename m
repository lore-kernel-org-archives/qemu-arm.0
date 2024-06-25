Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp646938njc;
        Tue, 25 Jun 2024 04:43:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTbaPBirIgAIfPInTpKltHQ2CA6rmIN4Kuiams/sWxpbkvOtgfbSkjSIwfllrltKWuBSzo1eqJmllBVoXpjKX/zPRQGynV
X-Google-Smtp-Source: AGHT+IG6b7F+G6IanMxJ4ubQU1CuLce19Kqq7/q72M8TQzJ0Vwq61QDZhe1igopgWQnKc/b++XqX
X-Received: by 2002:a05:622a:38d:b0:441:5a6c:6b7d with SMTP id d75a77b69052e-444d9370a08mr83289941cf.55.1719315791966;
        Tue, 25 Jun 2024 04:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719315791; cv=none;
        d=google.com; s=arc-20160816;
        b=Vn0IeyfNaZ5qLwMX63aEswE2b+yhttqf1H9Baejp5hA88h3cHWVVibV+M+aq/gLLVW
         0GFyPBR43+Md08+FEt7Vgu8N3d8RAlggL2rxyX8Fp8XDO9A4aCtROuSDwG8O9TErchbC
         OqcpW3mT6lQMaWDbLmw4d2mXR2rj3/vQ7qP8gYu0ud3j9N/G9XUSs8bPRXjNrcnzDFAp
         KiGALWZAiEKcHb+Ka5mnsGgaK7TCT3/0Y4dYnW779kicH4OPjgDt7fpdh35fKFwudv+r
         3hqdQ8yv/QcQilTjn5hX1ml+dfGZ4NvDgMx0S7ld7VCCGKbWhfkOxp1fD4UdgUM2E3PQ
         c85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lbhlHzqKAFNHgBfnOZCK8ziGh6lv0WMXemBIWKBjie4=;
        fh=GRGAhYIRyJLIexm/SQeD/ONQMnKo+TSDqNowgo15cfY=;
        b=1HP3HOBOvRp9jY9Eg/5fsM8Jwb2zuPOA611i0RDsFawDHnXOokiLvYNf9RKakjQYkq
         eljDWZSjTH1cvVZXP9Uf2iu8yTwSYQpzaQYWaSjTnDPvK9KMc9FGpusqCF0syeAqPf4m
         pQGkU7eznVfKQfGQlv/CINNSqtWEzvL2h/9hziEzosdSvcpJJaAgcc2ZcOk3A5AeITdy
         4d711WRpESR8VC++V4Uw0izCjrp1IUWckiJ/z7JwsfDg8szPiZUgi4jztKF+sPlcdr5r
         1l46d4JiqM2X9LMbPtDZjGQ0386TzTmtcgKry8AWj3xP7yTJ+fwpgpflpcDLpZKExVW+
         aGXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AZOwmSeg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444f6dccccasi10404961cf.121.2024.06.25.04.43.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 04:43:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AZOwmSeg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sM4Zl-00066R-5m; Tue, 25 Jun 2024 07:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM4Zj-00065l-Fw
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 07:43:03 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM4Zh-0008H1-Pn
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 07:43:03 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57d15b85a34so5632949a12.3
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2024 04:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719315779; x=1719920579; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lbhlHzqKAFNHgBfnOZCK8ziGh6lv0WMXemBIWKBjie4=;
 b=AZOwmSegoksSClxirEUwJgSyBuy33/gcyl2BucgytqlbW3V79pYrNYvxP5laFVPobq
 1hXpEDsUzL/G+QnS5YspTKie4CT9KnsPxp2hNae0DDkOGWCCwcPXtW93ryq9GkMJk75Y
 NZCaalQOkHK5Xhiz1pk3G9xY0hTQWsqVoxLqj2oNUZHbftmE5dZvsJu5fn30mana8gWU
 pz8144xv3abVcXgeRHyocnLFg7tYAkhRDPqTGpXz+dGJh3WvDITUmwv9o48EN2sQSfgK
 D58ZFHYgMWvxIBS6s56r2bQo47B/t5gp/KPp8Ny3Lvneb1IHNmG7ObZ8RT4v1SSygS4r
 6Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719315779; x=1719920579;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lbhlHzqKAFNHgBfnOZCK8ziGh6lv0WMXemBIWKBjie4=;
 b=thiVlE4AUeolTeBRhU5sOhaFiq7TlYOkU69pSH1c0VoXnsLBzntaAe6ADp02B1YIbu
 ujt8TSEQM4fcF2lNuswKW+FHJGmAY9lea0FC9RyM6SvUhxysFHMZZaswfX3FUxBBkf8D
 xh9Ny9iGDdGb5HGBuyJpIGPrTJkvyHHYvnG5fiktgMabcFYfCQW0CYi4zZL0NtayEqeB
 zLOMnK8wBzMUrSCsiz5E7Iq6ncSlwGPfW2oyzgco/E9ePIyAim+2gClevIZcVOQ8GYxg
 azUq1IMbWLoEcRd4qdLylu6A6ioMJG6Do7IMT04AikeaK/YBvUmdcPuNGoAFBc5SfHft
 SVRA==
X-Gm-Message-State: AOJu0Yx6Tlv0GABsPb29DMu1XF0T7QwAWNezieebaAJPq6Zm67h+GxN/
 svBue69HOPYrKgQejh41zt0Zedmsnx/juestvhXw3Bhss1dTa+lArd10u9Ndktm+jjI+TTbjWHP
 66O9ajmm6k6LyVlRTFhvGZGDXsfZogNH/gkm1KA==
X-Received: by 2002:a50:f61d:0:b0:57d:5c0:9dc0 with SMTP id
 4fb4d7f45d1cf-57d7007f509mr1947217a12.38.1719315778927; Tue, 25 Jun 2024
 04:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
 <20240625050810.1475643-2-richard.henderson@linaro.org>
In-Reply-To: <20240625050810.1475643-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jun 2024 12:42:47 +0100
Message-ID: <CAFEAcA_cSXxr=6Ye0QvQADGbZKTmtkTOUQe+FsvghY-Cv+bRQQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] target/arm: Fix VCMLA Dd, Dn, Dm[idx]
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ru/EoHk/PyWh

On Tue, 25 Jun 2024 at 06:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The inner loop, bounded by eltspersegment, must not be
> larger than the outer loop, bounded by elements.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 18fc2405781 ("target/arm: Implement SVE fp complex multiply add (indexed)")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2376
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
