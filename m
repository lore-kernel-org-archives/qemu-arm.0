Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp419346lfq;
        Thu, 7 Jan 2021 08:13:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwCVsZbMTJa8PtsiK3WZmIsPpFANFNLAEK4AWC/M7qOS4QsX8Ao5i9vdN0zMpRz0eMrEHM
X-Received: by 2002:a25:aaee:: with SMTP id t101mr13234259ybi.517.1610035994494;
        Thu, 07 Jan 2021 08:13:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610035994; cv=none;
        d=google.com; s=arc-20160816;
        b=iKop50kDjzTk5rVxK74eqx4fianH0ybLbaEJfciNDkK2+MyCvTSWi05FoTphBzm2Uo
         goTPgKoUr/k1Q4oFNoHejmEmYWdnDgUYND9NiccEj5wU7lb1w+vZWbAEuOh5P2QlPfYW
         o+bgShrhbBqQrXWPOHKQE03cSXc0TWjrlQQCoh12tOa4a0SOuK2eaX0+37WkMkuGUHqZ
         iXgLgE0ldZGgLaXNjYkUZXIGT81AMtJ7JPJDwGIYq0Fdzm9nW+7Sh+KlCkvKaqpW9V/Q
         kEif7VOTibMGzMKoibk6nSLYK2dvDC8iAwjzZinj24eHY3TgfY5uhfjgaXXbK6UGr5/C
         tFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EmVuJZO1xsnixICZISkX1EleJkGIpy81PREPkCLn7tY=;
        b=Jj4K1gl61DQ0/6E+12dGqPZHLYB0pP8NCT0aKhuFtOftaM5iDnP2IvuWZdBUq0J7b9
         sGAmce+fcvAWtvLHps1Mo2mCcqNk/dcMFvWMy3+J11cYkfvOubjoajvjuoINp01Zxjz7
         EZaCZ7UpQRNruVpxnB9mnHs58DqIDRHSGIM/V3SnDrP4laOpZRspuJwLqQeCcK0gOBWC
         VNCQo8g7FBtXhZGLm89KGHLqOMQKBB+t/uZNzAjbTUdfTcfcZGymKeQH1jPDF+LHa54u
         Kf4xtJKL6IW0o9ay/+D8uqH5cvTpwFlQaa/7RLQfSo2DJkZNpclQJZ5j1qOvZ9YxlKgN
         MTDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QtS7BAGF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13si7639536ybe.58.2021.01.07.08.13.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 08:13:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QtS7BAGF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxXuT-0001Ed-SZ
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 11:13:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXrm-0007PI-4W
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:10:26 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXrj-0002Cc-SX
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:10:25 -0500
Received: by mail-ej1-x633.google.com with SMTP id n26so10420554eju.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EmVuJZO1xsnixICZISkX1EleJkGIpy81PREPkCLn7tY=;
 b=QtS7BAGFsQkjrNu1IHHAc9N+KI7PAjZnrVC4u7wIK/qDEm14eU4hIQ0qt/p4lAcxxS
 80JFxqplz1D6g9HATD8WRV8IfnGQ/yV9PYmH9NqwPUhf+f1AS5bGxmpchayZID8RfZWL
 GOD1NMdGY0tDpFJyA63O/A63yQSloeuewiyk7QYHNC5dv12eWyGPj/svkOggd0IXzrB0
 sZBdxXIUYYpvp1JYPBTnDdc3kofggtVKO4LHl47vsxiWh0z0ebcE1cnv5xrAbE+1UE7i
 +SmsWSBU6DSFXFVlpn9qHmEcokPaZIrx5e0chF3CyKIm5RgVZ7OISlatq5fnjWSrY8xf
 5XOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EmVuJZO1xsnixICZISkX1EleJkGIpy81PREPkCLn7tY=;
 b=WH9mFU77CO49tK9lq6/j37Ywfo79RNGnYTXPMVS3zDXS68XX4Ihc4GzJ3XzdWJQ6gA
 Cxq4Ctl9pIxBmm6SaiivJpj3EF8OlZdUKEZLJJpN2qIr0rdTtViJsmsDcED5DVQpk7R6
 mwPiSV9YwaPYhkR30tocYXU+rvJvSfO4fbkLZbupi88MMjOZICOsKVLLeK82vUHB7n6W
 2ztlkxhQEH4m5wJc/wuWD6YUdAr/0eLGygyvXse0+2tMd4NbD49ltSCTHBKz00myr7te
 ZikkUbDQL1cQdUIwvZVV7Adhel5MRW6VO68LNSghE3Lq87DkvCL72NSuvBa0cEHeTiGG
 sgTA==
X-Gm-Message-State: AOAM533mzUtNMgQFRn6KI2KOpz2tofvDIOC+Hpq89n1b/Dz1eunlD16S
 +mLQRnEGB/oqKjc4UfveMhciDcSBCpqDEHtsytCeng==
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr6580781ejb.382.1610035822057; 
 Thu, 07 Jan 2021 08:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-10-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:10:10 +0000
Message-ID: <CAFEAcA8PjDpouHHSQW_se10BcaahFQu5=etJ90Y_u7D--yGZXg@mail.gmail.com>
Subject: Re: [PATCH v2 09/24] target/arm: Enforce alignment for LDM/STM
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9hVjygZhEV8G

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
