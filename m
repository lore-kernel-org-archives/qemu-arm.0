Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp994954ejb;
        Thu, 23 May 2024 04:34:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8v2U6MHao2xY4Bp2e+c+zO1Fn1A63GokHrHo3CGdPJj5VSIE8+46tg39ZAstW023RiKFAvzjDz7OB0URFKpO773sGRJxm
X-Google-Smtp-Source: AGHT+IFLvTKiZByvsISVd6swGPlHKUJ84sNDW/Bv9WLpjAIgkzlXzE9azaX4Yh8psixt5DTJhS7p
X-Received: by 2002:ac8:7d94:0:b0:43a:f698:2b21 with SMTP id d75a77b69052e-43f9e0dffd2mr51124191cf.36.1716464058716;
        Thu, 23 May 2024 04:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716464058; cv=none;
        d=google.com; s=arc-20160816;
        b=W/8bTip9hcS6/r+zb+o7aj6YMsPT4KOnNbsRGylXwLkGIWiUDDY57xwoZkfiIr1ikm
         AUJmJFBH3XcXCve1KnyKXD//mKm1Dk1SXnGFz4ZrLlM91DlQHJFu6B7IDeIOM+oaQAj7
         lGDb1KqMw9c0m08/5dNS6klkyE39uXGDupn6YoWOaeu7p7h5Zkthf3hafzoNm7FaQ+QS
         HpjLOHeK8desL7fIcKf9GwH5hZq9vHRRsnZ6EjJecSPYj1EabIzD+GuxjX36bjOsLeqL
         DC8AM72/1HoNfubVTOVqkDUE6Zb0j2fsKv0w79Rjj61LfV9m9EcgJuoyIMnvFXejF2eg
         nZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LXyoHh/LlTtV23son32S4wXBIb55AcBOOE7zzdUn6bk=;
        fh=tI9PjUjjVbzMUR0kIyan4ayPuwIp+aArMp9dtSJA/ho=;
        b=kMbodhA5NcN6SUyXRBi9Qev+ctXwdD41nnmN8AIqifuUmJCoKL+kgJYgv7LAXlXy1N
         +BSd4jzlIfC026gRGUbunXqTb4QLVPAwvaEulqE2JESVRxLKJMZLq3eG3gv59ikqqlZw
         VuY2N/WuaWpfijsaMYbN9GXHLtxVhWUsxrZrU4CNaqnDUL7rKJhVpzF/SElsy1gWYIw3
         EDMvp5gg7OfhEKAiNTeF8ex5bRqrkmvXgtUKAITIYmr6/HqMdOeqUo6C6eL9W9/q7xCU
         M2dm2G6fGxUO2fFcfd121SDc1Q4jAekVxU9GjBIfHOOrkvH4EI8Vv8ny7SUFB8hOM5XP
         /vtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kb16GX6d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df54a2003si77291681cf.52.2024.05.23.04.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 04:34:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kb16GX6d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA6ht-0001Bu-NA; Thu, 23 May 2024 07:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA6hl-00018D-DU
 for qemu-arm@nongnu.org; Thu, 23 May 2024 07:33:53 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA6hj-0005Sd-Km
 for qemu-arm@nongnu.org; Thu, 23 May 2024 07:33:52 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5766cd9ca1bso6068385a12.0
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 04:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716464026; x=1717068826; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LXyoHh/LlTtV23son32S4wXBIb55AcBOOE7zzdUn6bk=;
 b=kb16GX6dDRXHpDywVd64iNR3/NyQgh6lwrui51btScPMWhqMnYU6/S/d19GSw3pD4y
 D+WxGZf4Moai1AVMovXMxKPpy0TbwPQLYbTCRU/mCdDx2OBap+58mpOuQ3/zJcqS2ge0
 lCd8r97w76ZD8YtCHf0VNSxqd3ZVQwBf47h4lF7iMVtrHuOqq8gvpQEBUs+QWmLlhA9W
 lZLkD/r1/VzXPXBlPgv/JcBuVGYVr6HHtnAPh9tI5FMgvoMM2QV7Scq6oj8154rc43Xc
 AZpHEjaMLEu13zb0BnPrfJ7Rrl/wH1rsb37mKgqu7pCC3IdPfY7ajtrVjZt/dmpKapmz
 4KNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716464026; x=1717068826;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LXyoHh/LlTtV23son32S4wXBIb55AcBOOE7zzdUn6bk=;
 b=RIeStLzG0CDQqkipn9gppA33upya9aY+YiUoPAUnZzcfo1R3I4iLoGzBPouSGa7205
 EfoGXQVgXncRtF6j3yl+8gkviDf6CjSX18JbT/jI2TzofzuMXgyUaUYoBVciyMpGEetz
 6j4W44YHCJEMOIIbmA7qVumClPYbt7oa0RjqVMwq+ODZPHeUI0r18dlptrF+d0M8JhLA
 EVZfffKjxgWyZNksFW9mLgSzRVQ/DKaoy/wTifylpD0Q5WsEUt4NeRuXZP2u8BhmwWbd
 uBMIW5Z64vR3IJ3tsEQEY28RFSpCZfYzm8WDXsE4GXX/cSFaNOr9U88Di9PjD0sNgpp0
 dMrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmn6wInKvy1V4qvwEax6qLJaUskZumGQ6865i9Kz4F78nD9VK65zCdwRT2fNLbEqjdY7s4ZxE2nQWlNXlnJG5mCz3g
X-Gm-Message-State: AOJu0YycCSVI0+MHwhqZIv8VLae0xzvDW/4wSpMTVXGALA53Wvc8WTWV
 +cYE2794MoUqqw8c+686zpXKj3uoydfnP+eZTI+vBQX4VyKRmfU7jr2reGm+Q8PmjKeiznsvXsA
 PDlpllFIvouaSJriQWO37DROLQN2mmRqXUuuis0dZS+dZVCCr
X-Received: by 2002:a50:8ad2:0:b0:572:a16f:294 with SMTP id
 4fb4d7f45d1cf-57832c2d013mr3575926a12.30.1716464025878; Thu, 23 May 2024
 04:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-13-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 12:33:35 +0100
Message-ID: <CAFEAcA8L6pw+d0X_4Wn+w4fZbxoDs+qEjn98gZAzHr9=nMfWTQ@mail.gmail.com>
Subject: Re: [PATCH 12/57] target/arm: Convert FMULX to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: LDguuENjTa1d

On Mon, 6 May 2024 at 02:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Convert all forms (scalar, vector, scalar indexed, vector indexed),
> which allows us to remove switch table entries elsewhere.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
