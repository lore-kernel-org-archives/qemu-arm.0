Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp47901ejk;
        Tue, 28 May 2024 09:02:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVO2cp9K9AQVZaN+8d6//QfEZeI3jIVb3oANjJ45tDfKFoWYRyrO3jIndg0EEi9qLMKG0BbPXJlHctH6Q144JWQduL0JoA
X-Google-Smtp-Source: AGHT+IGIwGOkZKfQNPUZOS5MqjgIPVVYYUIFkUx6hO6fpu08A30EpsoRlieak7MA+tF/ry+mR0VH
X-Received: by 2002:a05:622a:144d:b0:43a:b9e1:3891 with SMTP id d75a77b69052e-43fb0efed29mr141830721cf.51.1716912130735;
        Tue, 28 May 2024 09:02:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716912130; cv=none;
        d=google.com; s=arc-20160816;
        b=A6+JPLJ5YEupgreKGPxHmg6/jgXrMddDsl39w7mj1h93XTh/IIYYDAqenKs7FeiW8U
         HAnM3o6dvGf2byOpLl2rIJvVK1NH9DAZfHyCndrzTzHS/D4crnmTF/3RTj6yasArM8Dq
         xkEz5geYIviuOjL5TsDWMsOLHMv+LuxIImoELeQv9KG/8mrg6fdodg32oZAokXgRPx6X
         noczv4SXH/qGpPOkd8DlNUGuhdJcDouZSjxAdfqvZMyleKQc0fQ4PR4g+h2h35OVAqjy
         LuOaMXKS/XvK2eBsbQcVttQ91LO8XCmx2cPez5lxPf2v5T7hX0iU7njoy2dR1y8PjddH
         pf0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pHpodULsqsdzeSAudm3146gsyzitGajONPimXbKis+M=;
        fh=JobKPCfsCxpDmpiMXRYawXMxLR2KDcV6Ux8wcGrQzxc=;
        b=HH6m/CYDa6XdcegBIDSWbABn9mTw9taYpDYvP2dG7Y+AxESp8Mwn20ivXuhNQG0iNw
         I//FJcBWwhF62zQ/BZLVeJLs1PhaZnfvXZEJ4nxAXODE9h/X620XPrIvi8ttOAsAXzPu
         AdXiT9jtDxn3HOY9OVZaB9NwBvOe8ZfdeO7dsmY4GWkP4jstM1aYhj+NKQ8Y6Tz3EQbb
         nBWxjjQ4ULkTqwg96aZtsQ0FnoHzGxfC+i7o1zCYPYcGfoLgQlufDCKZeERFnROeUmjU
         fgCRqUbkPaYenzq4q3DPaHmm7khS7Ri5ZCs/lIUvLRXawkKFNqf9Jmc+JwfdXK3edMDJ
         pfTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P53QVAl6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794d714b64fsi106469885a.338.2024.05.28.09.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 09:02:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P53QVAl6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBzGz-0005BA-Pm; Tue, 28 May 2024 12:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzGg-0004xE-DG
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:01:49 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzGd-0007iT-Dq
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:01:42 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-529aa4e988aso1331331e87.0
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 09:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716912098; x=1717516898; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pHpodULsqsdzeSAudm3146gsyzitGajONPimXbKis+M=;
 b=P53QVAl6LSdMhfSk6lEEvoKqhAbcuEsYw44OAyFu0AJKd+VLBVc3QflfET+PCx0+MM
 AZPoUc7AUzNQc4LCc0Hp15UcUhquUpV0/W+EsDgE7bKp156leZUdEAEeDzu9uC3rXlu3
 xJmLtELD4iDL3onCf9Ws/Lpt7hSRQHKct51DUp/0+TTlP++5JEYgI4tB1k1KhHPFMfQk
 AnbeP6BCXbBZZ+uWStmztIRU+qqzE89voGS9hCg+UequaQtueuYhOI9FVeWcnoeWv8cP
 E2N6Efkh18HD0+6O5IpQzSUAuywaMK8Hiye44UMB4MN8XXbOniZdDzHReDGQ7hbbH0l6
 4/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716912098; x=1717516898;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pHpodULsqsdzeSAudm3146gsyzitGajONPimXbKis+M=;
 b=cI0RnjGbjNxGSuXy5c4pdty2DNUpqpyFNPQqQurTtr6uO0TrHp0+TMS+p+toXLtPG/
 nwu33MRnIehPfQ0odXKWEeUgdGxPZJpnAa9bnTUZ5SNAQ+VEN0l0Da2rq09Ki1H8uyxL
 iRgyEs2WxmgPraONpdFFGX9X6Q9Wjoke7AqVJat1cjMKhq08URKAInTGPPpgCuOarqU8
 8X+natRJTfWNLdg1rCo0qstoyyCiQGhvMbjE6IM/7Jha3GFuuM7m4wKEFMYZt4BSgtCa
 684xOFovQQA7rGWK2blkdF7fWytD6Y/C15JDg9dkHW6ZwUTFzGMIA2howmu5yjNZuBMc
 kLCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWzG2n/ymp3vClqqY7ey56+vZVHgXEsNoUImcKx2s9I1VS+feNV4pFnDOAzakrvXBOAG5DnUJBRFV5G8Ms+pc/q+oW
X-Gm-Message-State: AOJu0Yx7wQ6QWq/dCuL6+eF5Y+i5rQpBK9KMOdSYovT2QLnmRbqezs4i
 tRnFnUDguQPnsod6929+A8IXM0Fms7TXLclv6x1iN8HAD+tsO+bdqw/zbvGe1wGqS5rwJRIISRe
 toPWYy1T0g31qRYX4Ceh/260UyGIvsJtjffzP5A==
X-Received: by 2002:a19:5f47:0:b0:523:a5b3:5e1d with SMTP id
 2adb3069b0e04-52964204854mr7471049e87.10.1716912097604; Tue, 28 May 2024
 09:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-56-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-56-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 17:01:26 +0100
Message-ID: <CAFEAcA-CADhoCNyvERLq8-+huqqrg-VUDRhcS02+1kDpNi=LDA@mail.gmail.com>
Subject: Re: [PATCH v2 55/67] target/arm: Convert SHADD, UHADD to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 70LWU1f2OnXD

On Sat, 25 May 2024 at 00:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  2 ++
>  target/arm/tcg/translate-a64.c | 11 +++--------
>  2 files changed, 5 insertions(+), 8 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
