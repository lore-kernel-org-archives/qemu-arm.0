Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp960065ejb;
        Thu, 23 May 2024 03:20:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEje2nNiSR5RH5OwJp3Xdu2WswhB64yEvpfAT33xDiFggb30yHyBFX4LeMyItZuUtogMnW8RkYfo4fSdjtDC0CO3rWmMSc
X-Google-Smtp-Source: AGHT+IHijDjs0P7lwGpHZp9pb0DoA621AY96epLFwODOwn/kRaBIdWk6ba7Xrx3CK7Bt/BBNpHPz
X-Received: by 2002:a05:6214:3387:b0:6ab:7ab5:de5e with SMTP id 6a1803df08f44-6ab7f36c50amr32992136d6.33.1716459649503;
        Thu, 23 May 2024 03:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716459649; cv=none;
        d=google.com; s=arc-20160816;
        b=OePZsU1A/9JTJ04R+Bl4ajk/G/PB+wuioaU0FSr4yg4oXJg0ystyTpF1Ylb+/4PDA5
         vgv26zaQfWQXUX7FvR1PRyQoQxkWV4wl/8dI/xv54c+hvHVW8wFv71hxuEHflxVfFnVz
         7mmAZQ7IMI2vltZtJcC9RPEn2Hi31hUM8gifu0cuEBDVwxOvvqKeDQEz4w+yutBVIk1G
         /TiQrcmJyReOZngetz/RoE+jPi4IfbDutbTN1Bw4ReRuMXBUeibSCh2gce0bhJ62Qy5f
         IGXDlCOLRDYgVSUE72b25excLCiljW9U73SrXZyYgtIFV5jmZJYgIJryTim+2ejhImY2
         jFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YSKJynSj0E3qnZhoMM3nAwR+TUoxebdocPhmdy5mH4Y=;
        fh=f53YqZLtye03JLIMezkG/Wsg2k9lL24q2xf2ov9oTbY=;
        b=uu8g8uVQV40WG4wUtPH5XByXctf+LQMjnUCOs+riciM7IfVq1R5aSbVXFurx1KZFox
         Ub3H/5OSQ/dToiI2vgDJP5sMhlItNTvxVwIJJguR1zrCFM14VGYzPaBQVRaA90y03Cq4
         k7bIaht9t06dO8DK/rAtxvuyjvlbs0Kfu04/XQajrsEvRLk2/zZSG2ZsgY28e7n+snA1
         8M1y/7TxCtNugw8Q8uRaHxomodEB2UY2QsBNN9SZ4Mhtmzd33xU9XlLjT5VjbxPGGo7k
         7j6gPQITU7OytT3KhxnzV4+k9o8JGmy8co6nhIyUzpGsytnsuT5hUozdqaOwV4pyJ7Cf
         UnNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cUNpT6Z+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f2b5ff2si338398926d6.346.2024.05.23.03.20.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 03:20:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cUNpT6Z+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA5YT-0001f3-Uu; Thu, 23 May 2024 06:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA5YP-0001ZF-VB
 for qemu-arm@nongnu.org; Thu, 23 May 2024 06:20:10 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA5YM-0007jT-9n
 for qemu-arm@nongnu.org; Thu, 23 May 2024 06:20:08 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-572c65cea55so3338568a12.0
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 03:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716459604; x=1717064404; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YSKJynSj0E3qnZhoMM3nAwR+TUoxebdocPhmdy5mH4Y=;
 b=cUNpT6Z+FstWJyd3u4337q05cWR2rHfMLZ9kEcAPpesV5YQnq0mlj15Ep1re4PsakH
 Pp7Jubluy3Q1HEC70mTAcHtBc52ElZqX+sXSYhXLxnmKcECZQ40aUhz2rPvLEO6rRuOX
 PC2wh4vJt25c6iCIvo06IbTy01yCmq1Gx3uLqtnyFKx3Y771mniOS2KyESKZzHbuPcQ5
 oI/OWp/AN4KN8XtVVecZc+pEdV2J6Oupb35tJtdBtszR1jdGUQv/20bND6w1eASF/Vyr
 UfTThJGf55VBW6yrQTSD45kTgZ1O1qZihu3B++1ktId9I6jdnyHk9zEraBU9Zf5XlxWx
 edIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716459604; x=1717064404;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YSKJynSj0E3qnZhoMM3nAwR+TUoxebdocPhmdy5mH4Y=;
 b=mUddXw9i0nBgTPLtU89/PwrWhOcP1HjzmfUScT5MgYPFXkMaueQbYgmaOpzNMdRY2m
 kmhkFlxKY6zALWNEN9XRH+7mFgYtwJn69vyCv6bBvRqHA67hqSnelg/r6VGyOdY6caTN
 xBRNLmerfAsub+ou/ElmzgXdBSMird7D89h54P2BUs8oY4tIj9V9Y0+3PblEvk1hbdQA
 dyflWQdiQvbTUrs9/NzPV/SnqG5PPioQ+ARi1o5SQxanoq7cshWZB9UiyR+DH/LW7NIc
 FusUXG7Vgoo0eOC0KEOECmS0VZQ2rhofICtQzf9rcEKAYmaH5O2el3KqKg1kjD0vSy9e
 BWQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBVKLGuem8I/I8WnSORtN04D9b6b4/RlzxdUDEmZRAgmdWyZWfc8cZzWASKF2iTzGWYnzfuIGLrhT+JSx+K34ZOLPO
X-Gm-Message-State: AOJu0YzOYZ5PPR1GtT6wXyfwqiJrXwtc6XPnJ+T5Bllxb5CUg4oY0g1X
 eBC3v+EAdxwrgJkBXmxGfZ7m7+rqa6hTmP8f56+UZLCP2jH/CFLgKCd5baNArrrU0FYjb6Eabw3
 aummP4XHiNaUvS47P5xfvQmU4cReF2PJzigjMQw==
X-Received: by 2002:a50:871e:0:b0:572:a049:c797 with SMTP id
 4fb4d7f45d1cf-57843ebd123mr1475369a12.12.1716459603825; Thu, 23 May 2024
 03:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-10-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 11:19:52 +0100
Message-ID: <CAFEAcA9oPawHi1_oy0gvU65Ob5RK0dYWXo4XsusT6L3zddsygQ@mail.gmail.com>
Subject: Re: [PATCH 09/57] target/arm: Convert Cryptographic 3-register, imm2
 to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: /v2lyb071zah

On Mon, 6 May 2024 at 02:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      | 10 ++++++++
>  target/arm/tcg/translate-a64.c | 43 ++++++++++------------------------
>  2 files changed, 22 insertions(+), 31 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
