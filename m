Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp527488lfb;
        Thu, 9 Jun 2022 08:46:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrIrLcP3O1xBRM8TXP9hQYZwgMIQQNVPGpLU3cdZvk0zmenZNuTo6zwkZNC2FV7XbgNfwZ
X-Received: by 2002:a05:622a:13c6:b0:304:ef43:e9d6 with SMTP id p6-20020a05622a13c600b00304ef43e9d6mr16147129qtk.252.1654789565078;
        Thu, 09 Jun 2022 08:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654789565; cv=none;
        d=google.com; s=arc-20160816;
        b=w13MSrpbjWRSCGBAEBglTeckqEa9vog6iH5aij4p3hHrvg2oqjGJIjd3+sklKSyXGu
         8rvMPlNbF6JS5zTdzgRbmv/sKsTtCOl6qHZ4DpEvthqgCh4WnoKpa6C2wwiJ0A/H7NDr
         BmllGqt50r37UlYo9wlevrkf0o2ijZt1oSgb0x7IGwzOY3ZIWLLZj63ycQ+Ux8pLRTY0
         MOYdrk0wDhXgj/2VjbdOMHtpbeIxT5FdSVH3/Lavif43YR+PLWt1CYViRNfGGFXScUNZ
         u+EW8kePq3mMWt7QKwqANvSQY8PucUYI5XrGWl9Q09V3tMbqRuuyBNOm4xmxZhERpQzY
         hfUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zeRUc+eBDm4UXB4KO3Y4Ks9sq8k72XszYd8newJgXhc=;
        b=oiy3oqZkb03BcCIMTo4o7l0lwrFh2wKEgPPdUDWQr81dArxaAJquKu2mh534wuVCta
         P6kVjsaASNTvLuPfm91LmDciRkYRsCn0IIiuyxc/v+EpoFOw8ENM7cVmsCz1mBPAtNzC
         aoWsNpM6pLvt+w+v4t0VoI/G79NRKbly+OXdqhOnZt/S6jeHXUGa8fcJdTn5VhVk09lw
         t86aCrop3LrQDQliDHypjGDNaQgo9rKWNSArF8cOWYqy3/rTqoUxqOke9q1FKN5DCF/5
         PVdGl3QCmCma2oZhkjb3XLJUHpI4UsDLwyI0gPNxOrg4cw/dWkep8uXRhxbt/vlv8ttr
         EiGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLk26Gdo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w22-20020ac87e96000000b00304f0cfb9d8si5775193qtj.86.2022.06.09.08.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 08:46:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLk26Gdo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzKMG-0007KS-JV
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 11:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK6l-00031o-8y
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:30:04 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:33504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK6i-0001He-2u
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:30:02 -0400
Received: by mail-yb1-xb34.google.com with SMTP id s39so14794473ybi.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 08:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zeRUc+eBDm4UXB4KO3Y4Ks9sq8k72XszYd8newJgXhc=;
 b=gLk26GdoRAFRMQh+63xHj5yvEBkYgsTwrdnEp/7ckUCN9KCMZroVSiGDrar9UHtFyh
 9qIbPvOG/xrRAHyLHL3ZLBEbgFvblkLRtIfrc9ZfnTbXJRtMmtr9MY5aSQRwIuepbeUT
 UbgRFo361OzAMr/hfso+S71nOcjSdQYicI/2vRuOV26J0IKz+jt+pzOO2qS05zcL1x7T
 TVSm5nddDp9DwAsrZPtdDWbXROdE118LQTtHWeDkdGFOV09KY1jI12vRlh4PQ24req5+
 DRyhqt6RAYOLaEggqH7GY97Fz2eczfe0428mNG2e/RKLvEuEyhypbubrPbGbC2H1IaJE
 cLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zeRUc+eBDm4UXB4KO3Y4Ks9sq8k72XszYd8newJgXhc=;
 b=vH/QOloPkM0ZOu5o2XAY9OT1BRHK3t8bAd95G2vU5dR7vPe5w5azuaDpcX/uNEQ1xO
 MqmCE8hm3Bdqilqv/ngrMnNKZ4AMSKxuheZhQNolkTWnNCJmtVfTVORZJLlJqP/RFKRS
 yv2AUSyI0l08L9+/DbA98XYUVkX5gGuIq9x6mDBxlEjYHY6rtX2vlwNE91gtKefz84Wg
 76mmdmdw5OY8ixdK50tQi1FImWQYxGVrIH2KY88CDWgnrOt/I9jdE2u3VlQ5e9CF1Z6z
 K6VzjsPv+nkQsxs2H+HoFYwOTYfcW0uSPqMkewoWpRjmJCMfXmApV3GpXX4fb6259GdL
 ZqjQ==
X-Gm-Message-State: AOAM531Tp6HF3Jx7E82u6XddO6mxv7t6XtiNiL3ZcrIEnCyZE+XCG/Gr
 2fr0LujwYfbea4qdvZllgo4pTKADrQMfu4M0sqgMbRLkuvo=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr40779980ybq.67.1654788593154; Thu, 09
 Jun 2022 08:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-32-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:29:42 +0100
Message-ID: <CAFEAcA_-dbVeDfEGiU0JzG8NmcvSPHT4cqpQ=hYMj6HgOx=JNw@mail.gmail.com>
Subject: Re: [PATCH v2 31/71] target/arm: Move error for sve%d property to
 arm_cpu_sve_finalize
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
X-TUID: +CcCU7pxaziU

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Keep all of the error messages together.  This does mean that
> when setting many sve length properties we'll only generate
> one error, but we only really need one.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
