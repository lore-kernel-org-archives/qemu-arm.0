Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp44013ejk;
        Tue, 28 May 2024 08:56:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXyCrfySP8BdbtG2ZeS4X+ailzjoqoOxdmm39Q3lRaHPyfpvClWIHMDN9XDkmHcfeYLVXy8QbG59wLMAyn4z91FYYYhsBpw
X-Google-Smtp-Source: AGHT+IH53CRe4bTSTVOfBmVXLogxj9S/oA5GJmvIr6y2E7gfzEL0ZUq5YX01cjgd5P5ljecQo4uG
X-Received: by 2002:a05:620a:1372:b0:792:d51f:2d38 with SMTP id af79cd13be357-794ab1131a8mr1378338785a.77.1716911765179;
        Tue, 28 May 2024 08:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716911765; cv=none;
        d=google.com; s=arc-20160816;
        b=Jw9T0smoZ+ilJmN0IMqJGFQke6Z+2fZJEh2/ujCDTlHBMb3Xc1tBP2zXYeVa8P+7/Q
         XpxZKRjI0+M/7mWXjTYT10EorubQtAXCYD30Y6sgb/3BnR8n80jIGUTO7nPR/SEAzkjV
         Io85GzuGFGj5bIm1grIwJOEEAYuowRZ7WjT2QBhSPidHaUR9+CRBHHKcggCSfAJGPjhF
         WxiZfvFZ8jY393TVm4+Ae8on5GBRfJhHIt0K1PAquiTeO3oT7gBXOMiBxMXr1rnACdw0
         ZQDZ2RjBZ5HqBsO2Hisc2IPuBkCvmxv0FCRkXKUMs6RQ0eW4w0dSZGYOGEIL5weshSda
         I0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OLm5F6depJtMTzcsncAgYmhRogGxAdC00QEfXvNXBNI=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=xPWCUVXbNU9WAXvLv0/B/Kwmc7M8q7rMgEYVOGkjoYiR4EHuzVzKSOt4bdi78Uf02p
         /xF2ESQ9yjxHvG1Vv+YbNl4yrm5ybX2PZ8vmTKubfCJO3kR7ixOB5j/ZlJ+5D0NjgqBJ
         w98HHKKufwjgg512S0cCrNvFSMwQ2QTElkqMd2Zr0vj2MbfCJf6V4V9KsyQtVbhmdlGw
         OTY+sxSj4VWoonPHdHoflY3i7PFPxJEidOwxmB6qV4t2S4BGEBDqRatL/jH9Ou0RtPis
         oGf+xvl2Xio3rp2M5cxPi+9+aSnXpKlxowj0UGkkxR2woBWnFAPyPFt4x/LlkntgSJuN
         t2vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rlZoQGiY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd51f08si1013421985a.641.2024.05.28.08.56.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 08:56:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rlZoQGiY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sBzAd-0004xK-Ha; Tue, 28 May 2024 11:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzAb-0004hq-Cn
 for qemu-devel@nongnu.org; Tue, 28 May 2024 11:55:25 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzAZ-0006xL-Pe
 for qemu-devel@nongnu.org; Tue, 28 May 2024 11:55:25 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5785f7347cdso1127923a12.0
 for <qemu-devel@nongnu.org>; Tue, 28 May 2024 08:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716911722; x=1717516522; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OLm5F6depJtMTzcsncAgYmhRogGxAdC00QEfXvNXBNI=;
 b=rlZoQGiY5DbXzA2z1fTfC+hQaJfdZgKjLLaf6qoYPl+D44id0ydio24mC20JxfFTZC
 GQ7710CP1g3FIGjxusinjG2vsRBJrmD5X1VaL+2wUC2N4QBH/s9JuhOgPbigj4j2swc9
 91b5hevLr35IfIvB5Z+CtD/DAlphurS2y2YTguBkEFwg5r2gWh5k/UOAgBmqDsauRRpo
 B2xD9AM6Ck8wj5B5Fk8NcGYgMWaVP7nYz6MR56XRg3c6AW782sEXgm+Q5+6XLCAPoLkt
 fiWlVKXPfxv7lbQj49WUH2uZSZMjiChBDWR+xTFxebgAzKFmqsq8YM0VHp2zb5cd8MYQ
 QS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716911722; x=1717516522;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OLm5F6depJtMTzcsncAgYmhRogGxAdC00QEfXvNXBNI=;
 b=X2VGTuxTScrPWoKKGKa7Tmfit0pAZfOVybeNKn/ndKkQcX4KTID5bpDuG4VXmRo8FO
 ZWp3Kbuq1Rhbi9PoiSIHzPKzZG8HT2lUaikEWWqGy3U20Qv7I7TJdRJYlWaOvBIC2F95
 TFsGIFqlDGuC2ePikbxe1ahau8TpAN5Ae8teJmVt4SfISVu154ekrK5+AtFT1B5WarSW
 eCOGavQucoyu/02rK1BS+0pAXQ2Oyu3KDZKvpdRKaACHIfy6bk0mcxaidaTpatMI89hb
 Yu76mwie1NcKRUo1YpSauqQf5/IbVIBtBK0xEnxBKpXfifQTTnH4oo4pxYaTAgB2WwXx
 XTPQ==
X-Gm-Message-State: AOJu0YwRdDcFvvnt6iosOJwweWsr4lEO496yfEFQv8dZ1spT7M9BAIEn
 dSRyLMYnQqzUxnle8W3TEnuyf0epoNXYrYOipCxRwWDLhRClvmAL+p6mg0OBNPUgcIn55SaYSCa
 vVoIboNOa7IgezhWKaQMitYQKtuUBjMUqH+0OxoFx6udV+sFP
X-Received: by 2002:a50:d550:0:b0:578:5242:a22c with SMTP id
 4fb4d7f45d1cf-5785242a2admr8435179a12.25.1716911722279; Tue, 28 May 2024
 08:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-50-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-50-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 16:55:11 +0100
Message-ID: <CAFEAcA-Hh4-A4B3rSmCn5UR5_LSiPXdvU7=2vd__SOKb7hFt1w@mail.gmail.com>
Subject: Re: [PATCH v2 49/67] target/arm: Convert SQRSHL, UQRSHL to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: dov52nyVknMv

On Sat, 25 May 2024 at 00:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  4 +++
>  target/arm/tcg/translate-a64.c | 48 ++++++++++++++++------------------
>  2 files changed, 26 insertions(+), 26 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
