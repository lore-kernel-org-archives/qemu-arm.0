Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp582210lfb;
        Thu, 9 Jun 2022 10:14:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBBG02urM1dGVDDZEEU/6Qi/JOptBoncuqnpIE7j9ydbUS6Xvv/iJfx4iaj21VUrPlXQ63
X-Received: by 2002:a05:6214:c6a:b0:464:68bb:c523 with SMTP id t10-20020a0562140c6a00b0046468bbc523mr35573705qvj.49.1654794873469;
        Thu, 09 Jun 2022 10:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654794873; cv=none;
        d=google.com; s=arc-20160816;
        b=Nb119pNfbhC0T0hWgAw811bKshDLbMVJRNS1eiV/Mk+5cLt0zza8I3MpF6cFkB7JdG
         7jPP0LA8T7ZOX+DFQwFavlTBEy6LIvUo3Cy09qKpavdltZM1VSf4COn6FAfu8LTjCcr0
         7hSlncZaqyQTZJ79PY7iHEzdbwfgZZa58dBs+EzjvM6bd7AOp9BwKBgTgybCFvyABRRV
         9fgjnRjZWl44nPugLxrP+FKlkPHhisV93EXXX+AH2QQ9Jm+4VQSGJVIYC5NhaAAWZAFM
         KaAOEEWjjh9r/3Dz024J+2WfzvMutUqBbSvA3hKUZNqmYn3awdhfo0tvsFFukokHCTfw
         ox0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QUYL+XBF/6OrF26C4ymh5kwzvEoXvGTDXuWqTMuVFNA=;
        b=ZVYqwD45hvBe+t2DjrTtXfwzEkqYIe8MejksEApGKjgSKPtTYz8tFZFR/nw6C9hg6G
         Yc+ZUUcgCpn35HPRZUCDQ/s6pvSFISG+ByRYpdZJoH9CZzM6R07wrGTxcaXwweHg3cuq
         skxpAUWm5Jw+D0Mo9U9ewFRzwk2k3V/yh6fTHVSn4L63eHazrKTrS69chiXeKXUezV9a
         f9zT1ZewaCYglK+1DLaWaKC+Yn7P+xXmoA9S+G7/RlNsXXGRtGZjkg1qzhRJUvWcBcLX
         xGw2Qd60w5VQxDb2/AvWEIm8RYm1kJaNLC7sCy0DajUO+oBxfIAW/mt1tXN2xGRN+ZbF
         LYug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Krh07Sjk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19-20020ac87fd3000000b00304f476b876si5099548qtk.196.2022.06.09.10.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 10:14:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Krh07Sjk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzLjs-0003fj-Vy
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 13:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKgA-0007ge-A4
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:06:39 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:44691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKg8-0008T6-M1
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:06:38 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id y188so13062347ybe.11
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 09:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QUYL+XBF/6OrF26C4ymh5kwzvEoXvGTDXuWqTMuVFNA=;
 b=Krh07Sjk2iPF1HvfbYjKicBF4srU+MEYY7M6U8VN1YKc7t7g+AJL66XlpHpre7TbHQ
 lRoYZukfrDJXpbNKfofCiR7BvohEv4piVo978G6PoiKmWZHlZJMIKw4EiZ2Bd5siZI+k
 Sk8h9CCR4uTUkPZiEThjDflo1ZtVJe9xS4hnrFF5VzOrSF2Bb7cYNBNC1oVsJVUAE5ev
 V0Nw91VhldX43yspS3UNMasmKlPS+62hdeBF5whgkDLtZ0Y49I/t1f+PU2FPkVI9CGT7
 TqZ3SLZnjhiAG71BKMi9ovhyUUlVAjuG6ijbRb+oNEJhCOdTVfiAN/YNMdY49N705nSH
 gx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QUYL+XBF/6OrF26C4ymh5kwzvEoXvGTDXuWqTMuVFNA=;
 b=fP9kK12EPm/W6soIVsvxWpVIl5oiu6koGzHWZkTNZLoiHPD6RDys8apRVeIMyYdI/l
 sxD+6amuMfynJTTn4Go2YDdCmOEQJVNsu6ZmFZXt67Ad6e9ofbdzKFaS8WV6xj5y6o9P
 4fF7Wz+bCmKFJFtpyNwU1w5C0C1VaA/NwBHDXXGmLlHmK5HsfY4Bm94Zq9eAd6PO7RFm
 cwHrHcMf0BfoJyusSFi8AAQCKMaVJVhkk8kzvazBIUfLRGKPEZNIMB9bGqntT4et+ce4
 8D7QauUJWmjok46FykyHKicx8QyKvmoA7WGJCpvuJoeBIvCGraaVRHvNwaobP6UKzbMM
 fu6Q==
X-Gm-Message-State: AOAM531MBmv2FO88ZawZLFRPIc0tXfyfsLMfdAMgoOyTc6uufDPsfLwb
 U+R3r4vkshojIaIxSEmCq6QQlk988WYYaMt7K9TcDQ==
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr26229314ybt.288.1654790795339; Thu, 09
 Jun 2022 09:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-14-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:06:25 +0100
Message-ID: <CAFEAcA9nPuE_LFrsmr6eKuJ4ac=LdQURyB0jt_w2n8RqOo-RBw@mail.gmail.com>
Subject: Re: [PATCH v2 13/25] target/arm: Introduce gen_exception_insn
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
X-TUID: lZKvHRRgH5cF

On Tue, 7 Jun 2022 at 04:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create a new wrapper function that passes the default
> exception target to gen_exception_insn_el.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
