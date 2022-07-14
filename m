Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp700180lfp;
        Thu, 14 Jul 2022 07:41:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v08o/WXb6aqOSaaSRF0m0jtC40QfkU8zDS7iWBcXImPGCZgn6fmQBul3pYep29SCS2Rb3B
X-Received: by 2002:ac8:58c5:0:b0:31e:b229:fa4 with SMTP id u5-20020ac858c5000000b0031eb2290fa4mr8122029qta.367.1657809690596;
        Thu, 14 Jul 2022 07:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657809690; cv=none;
        d=google.com; s=arc-20160816;
        b=hZaRnKoj/f5yZeD30F1+WcnbiIKroIFzWoORLGCQDy5YrUuh+yG52Ung3Q/7gyM+5i
         LtO7EqHl1twkPQhZDP0ay0jEXVN8k6zOmHhaTCwsqM6T2uvs0n6ctSzg49EIk//8Ieby
         j8CVNO/9Bxq3XvXVFf+J6tf4AJJZcUjl8HLApnmnJBtlHgheYSMjEt/5Tp8e+5ojbCNa
         tChDUUAl5MqSy8pgWOvMMYRdzKeO6eH5swcrOZJCy8KNiPEA0fF+OsS7iZZQz5DhZaNC
         F+BrLPkWuO+Sa1WxmiD2GOjAtyWfumcUK9UyPvLt/WVKS//dCixJfVtnuMSgLMM3ycQL
         7phQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oIc470HtpfblUvG6GfNwrecnOEh3+GQdhPGTNYKIECY=;
        b=yzIpnrTMWG/GHntAWh2jchd/pXe6ccqbcccpVaJgYqNSVMuWkivZog4VOzYIpTxZrA
         J/8m6YDLaefHBW6ZybwCAbHyQYvJZN4S/yzmb5DtUtKa4/uwmT72j42IkjGWmLQGw0F7
         6TFPEmfFovcF7EONBMFqr21Bj7S6yKGQmyARLcUM+WUkvs8lhmKxA81pRyqFmzoEs7h3
         /1Nx1Isrs4dCxXEC3KyRo233Wcmi/k0eOrvmH5HK/mVTu3sYFoCxDiyExhJVqEfXlhTZ
         080lgVsaAj3bil9wS31V1zTKR2HYZxjqx+bls3fsjyfGWpdci23wzTyPRWZ0pwzRKLqc
         M3zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KoGXyKaD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4-20020a0562140ca400b0047376716545si951943qvs.514.2022.07.14.07.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 07:41:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KoGXyKaD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC01y-0002ip-4o
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 10:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC019-0002hD-IC
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 10:40:39 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:41669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC016-0001oM-LD
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 10:40:38 -0400
Received: by mail-yb1-xb33.google.com with SMTP id 6so3540531ybc.8
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 07:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oIc470HtpfblUvG6GfNwrecnOEh3+GQdhPGTNYKIECY=;
 b=KoGXyKaDNj67v6ty3zSjCFENdSH4STDab8LbfjSBcQPK8pqQacvO3+eVFLXHEYW6iY
 hnCzLviqyre/SaV028iQUcNHMoBljZ2kLlbG9ve8THrA6uOEH6zD4TtcneQxx0gpQ9g8
 F1erTdZIybpM2ZJhVGYaJfLYx53hfRY0t5VKHs929seoJxrduGKcv0U0d2wwy+sMBfUL
 3WHo1hMbe6u+PGOIQqGKPMrZrgbwYM+osl6gMsD5aQdV/oDO3zyMUBXTDnjdQ6QvYj2V
 DaPzPe3RQEv1BeJY0vXx2O2o06vO40VChgfSF+CJyzh3Ym4gqTGrFjExci+0JsFMKVW/
 3TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oIc470HtpfblUvG6GfNwrecnOEh3+GQdhPGTNYKIECY=;
 b=rZn1bowXdg1HcH0RXVO5xypHZ9vUyPCm6n6nrLgUutx/ZC35PbNi2esE3eyRGLZlu/
 vDUx8NGGp9hvGBfmCQ1D3egkZuflpsxpzfWcP8GoQn6LAapd7Jw96o0GGAyQJcZPzgvf
 R2PkHB+iMB5axGyReQ/jf+sKEih6kGc3UDuU5eLEJZZycJ8dCNjgXBG6YPRtGpKGTcyO
 UEZQvBH2l5CFKVs2y+3hRrn1oYt/DSH09ErFlKnbtF908ZJOwdqJ3R06HtL2pDNGR1gt
 9a80yXYvJZevP6JAHHp7zzfNseq6P5McvFZyFhQ1neh37Fu2t0qTerozHGqauhU5dEL6
 uKmQ==
X-Gm-Message-State: AJIora+UNZFYYca49ZdgZeLBK3kR5Us0oh2X5Ll5Pxvp+9Bqsp5FV8Z8
 lcZnPbC/BRpgkzn8SE3d0EPmAPDpStL0IlZ4dFOVUQ==
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr9502762ybj.479.1657809635469; Thu, 14
 Jul 2022 07:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220713045848.217364-1-richard.henderson@linaro.org>
In-Reply-To: <20220713045848.217364-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 15:39:56 +0100
Message-ID: <CAFEAcA_f=YOWRk078WWkoCKAt+ccEUc3csDcpwO7FwZMNsu0gA@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Two SME fixes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, broonie@kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
X-TUID: 7tTq2Be5zZHf

On Wed, 13 Jul 2022 at 05:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Ho hum.  Let a feature loose on users and they find bugs.  Mark noticed
> that the wrong value was being picked up for VL when SVE is disabled.
> I had run the same test but failed to notice the vector length wasn't
> as expected, though the test otherwise produced expected results.
>
>



Applied to target-arm.next, thanks.

-- PMM
