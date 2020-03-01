Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1544567lfg;
        Sun, 1 Mar 2020 09:45:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqyS2dEAoi/ZGkAUZffFKihNmJAKm2h6/yV0WKhUtWgB08Wf9e3aNwmufurVj/FBDeVfEJfW
X-Received: by 2002:a05:620a:994:: with SMTP id x20mr10263744qkx.489.1583084711521;
        Sun, 01 Mar 2020 09:45:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583084711; cv=none;
        d=google.com; s=arc-20160816;
        b=bhQdywhshJjDm3XRWzJqgyjNqvpi9jF12gYMi85fjikta9sr+xzR9yvto8TQDIEQpX
         uDubdbYlDoiY7u+YvgRVmrmb4AEO1PqNHFdSreqOFCQVX/R21ZtTGbW3bnCkTHR/yQHs
         Eforg/bhC9khEXw/4OKcT2tP4jiDFeg12yZYIUi+6wO2SuTnQJ6kzR23VV9wvZDk2ZxU
         cp1x4pbzpwLElD8UpcX09abcZwy/H2AjyAq1XI5sqc8AhbP1j9NoL4Nnmxy8NXEgB4OQ
         4KsskJzDUQsjR5HuHSGZGxRZXZtvySwwtjX83suY3uZ+g9NTKrvXMwYqQ6eHt0UEcsuv
         I1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nkQT6rGBKPnYMtm8URmV1zH8tf60jZBKAmIPjfh9ms0=;
        b=sIarL9W6+GuJ+WubzLxQpnaFZ4F+oN9Pbsba5Yrgft9H3kkPCgCXO0cZ0CQug2zV3v
         9uoowptLt9OrAx/Csq/IMTnTAnCsV62RdQFlD3hRQwsb7ROwKYChB/NCycW9slI1IEI3
         BOYpl3kD7uKt4hHe3mdn0BjA84W4lOA+pSWgkHMFrSuWM7xzLpWVQu+UxwNNdyAIlvHa
         5MxIkKrDQY5D4Cgb3czwkM6Rv01zeZU0pc/9ebNa8shuCTQsCJGayXlrQjPun4cewdD1
         yRgrl5KVWZzHUcfyhk+XHDFE1TWCWCz+7VERf2xHdKmTrBL9et/rAM1ILaQv1QzwL+nR
         Jr0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="owD4r6/4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v37si4791479qth.263.2020.03.01.09.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Mar 2020 09:45:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="owD4r6/4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8SeN-0000dp-0I
	for alex.bennee@linaro.org; Sun, 01 Mar 2020 12:45:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32818)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8SeC-0000ce-Uw
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:45:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8SeB-0006eL-Uz
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:45:00 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:51696)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8SeB-0006e4-O1
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:44:59 -0500
Received: by mail-pj1-x1041.google.com with SMTP id fa20so3413875pjb.1
 for <qemu-arm@nongnu.org>; Sun, 01 Mar 2020 09:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nkQT6rGBKPnYMtm8URmV1zH8tf60jZBKAmIPjfh9ms0=;
 b=owD4r6/4DLF8lGJ2ttx9PBrPkMS2THxsYk7XSO3cfqkxg6vv7IvbloSbhachO5ex/q
 lL5eKKxOIIw/aU5w5kNIqw66S9dSXehGFwdgj3dxVIVf+H4XObAXSHS6HPidjK6dgr3B
 0fHj5kwICq9INdxoz4jo/Os+4Sou5jiiXVzhs+XgjbpyyJ6V6lWNT5m3lQnixbFHpPXg
 Jjjeuldl/04o0FwaDt7R4Y9doBgt318y7+ihXsdyWCPPM94Kaug24a9xQqhMR6LHjHtw
 cY2GxS4OMm26v6ptCHGTU6YPCgBBLobistY3f4vKI18TLUCBVmvyEhx1nvIQwxOovWtI
 G4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nkQT6rGBKPnYMtm8URmV1zH8tf60jZBKAmIPjfh9ms0=;
 b=C8cnj7NovbbNt57wXSQTcLQ9sMqXMa72MMkPVussDUWI8Ze0ifwRjTtpXHEv0geRjV
 NXohy0yHt3sFLMoTbabvG7cHxkc+5xLSL7y81bIJex7OtElGobkY/T9k+4lY3j52/Xrj
 DQcfpZd6Bzjg/hZp+4PTpjm70J+7oOjoOfSFlMSpAyGwZpAB8wCHJqMB0tJeuLwO2nQV
 /jrivE7XXK27HsU91JPWPECHcKwxLmVgKMPX3BoX4+K5M3DMp4V5cm6HXUggPGauiPHb
 +QTA4ugk5+tfAGiSC/8GJiNSycIMueY8lCm7jFwZYpftIg8En9XTG47NuKH6vNRW2bzn
 vIEg==
X-Gm-Message-State: ANhLgQ3SFClaJMmw1fF2x0QDWxvmiZwfAi5LgEuRTuDprg2pGFQss6oT
 uy63dAxegAcdhqHskTlQRQdj5w==
X-Received: by 2002:a17:902:8c91:: with SMTP id
 t17mr775590plo.98.1583084698558; 
 Sun, 01 Mar 2020 09:44:58 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 p14sm16866957pgm.49.2020.03.01.09.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2020 09:44:57 -0800 (PST)
Subject: Re: [PATCH v2 2/6] hw/arm/virt: Use VIRT_GIC_VERSION defines
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200301104040.15186-1-eric.auger@redhat.com>
 <20200301104040.15186-3-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7cdcb20d-4490-8f5c-2af0-0114142327d4@linaro.org>
Date: Sun, 1 Mar 2020 09:44:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200301104040.15186-3-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rr7+GubXNrUe

On 3/1/20 2:40 AM, Eric Auger wrote:
> +#define VIRT_GIC_VERSION_MAX    (-1)
> +#define VIRT_GIC_VERSION_HOST   0
> +#define VIRT_GIC_VERSION_2      2
> +#define VIRT_GIC_VERSION_3      3

Any reason this shouldn't be enum VirtGICType?

Anyway, this is an improvement.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

