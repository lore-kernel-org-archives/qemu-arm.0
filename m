Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2399453wrm;
        Sat, 19 Oct 2019 09:51:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyAHPo/HGCJqeczTDxi/xbB7V8QO/TxJ+AJiBQUhykPuVvelRSAadd8Ic0sQEztlP6iAwMU
X-Received: by 2002:ad4:53c1:: with SMTP id k1mr15657899qvv.223.1571503873546;
        Sat, 19 Oct 2019 09:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571503873; cv=none;
        d=google.com; s=arc-20160816;
        b=UzgxN3nebATIKncpGhHu0SPDoj9bC+1+xnOVZ58WeR3miT6cwUfDPCVT8eQHOXVElj
         AHbmFj+NW+yMmWEmcdZcZfNNXDV/RZREu+/P9lV7R5ULyTqUAFQvJ16WweazFjNK3rfu
         CTNCU3VpURuL5Z8W1j8+JFfR/dE7b9YZuh0TKEdVSpD69bJVdK680lF1VD4yeO8uvrdz
         9WjB9QH4VNqfJf+zAIlgSmDkUq22gbe0XgDV14k/i9q8RugzOgSaJFZUGwZ8m47u1TMV
         +7YZBzEMcWFySHJSgwZoQK+zij06b8V6ZJ8FARRW3u0M3y1tZ8IfOXf2w27ZoIfBkieb
         T9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=FxDFqE3eG+O7GtEVvkolZdOkFCN/7fVr/VO3XBoBZn8=;
        b=BwgGyMJpa2ZtgLN2cGKvRZZW3FelV1LGDbPNsbrmMk7wCdjFxy2861WJ7HhkH7qubp
         Pb5B4I04cpUAYkx3qSGKe9qqG7vCjzb3ZT1Qj7iskS+guPoHFJqXXlaGT3G5L7Av7PL7
         oFQzNrJppE6p8Py6crktNlWVv6oR1XI2ykXQOf2XZFr1iT7EYro15a0AG63mtaZ5ORHt
         xtbpTPNSgPI1st664MQN5Vw5oEZ4WIY+ZCbejhOoXT/Z9gf+uj7yqXKug6WAHNV5cUCZ
         dtr1pb3YyKo/6n6Dac7CeW7G1DU498uELFLU8GX8J+2BH4f6WjEYN7t0Di5anIPcPzHd
         fCtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YyirwtuB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si3357493qtc.204.2019.10.19.09.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Oct 2019 09:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YyirwtuB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLrwe-0000Hb-Su
	for alex.bennee@linaro.org; Sat, 19 Oct 2019 12:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53969)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLrwW-0000Gy-If
 for qemu-arm@nongnu.org; Sat, 19 Oct 2019 12:51:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLrwV-0003d0-Cp
 for qemu-arm@nongnu.org; Sat, 19 Oct 2019 12:51:04 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36141)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLrwU-0003cQ-VG
 for qemu-arm@nongnu.org; Sat, 19 Oct 2019 12:51:03 -0400
Received: by mail-pf1-x42d.google.com with SMTP id y22so5742562pfr.3
 for <qemu-arm@nongnu.org>; Sat, 19 Oct 2019 09:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FxDFqE3eG+O7GtEVvkolZdOkFCN/7fVr/VO3XBoBZn8=;
 b=YyirwtuBPyg1e/y/hKcNhqPBF8c9c+joPHINpZFv0kmE1fV8HxCONY5EZBlMo14UPv
 G/oxcawuON8meLk7MsLJUu9JWj06N+tB8Dk+aQHdtjhQIzCjkP6FOsvVKqE5aRgkEHjg
 7xOuj7wjmobVjrb2jtDbuMO5jg+ThiZB68pS29NOQbX80sqDCiqketw2CqC2TXAQHLST
 dlkxpEIFTydA+eJF98At0yttTh3PD2rlyg3+N2as9NB66kjYgjz13FH/yEFch9nFFd2U
 9WrDmwJ6UFrxpwZJexH9E0j+iKFwXVAtSurlKfgInnSInYa3J0nd7L501JcOf+nBDmOS
 Rydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FxDFqE3eG+O7GtEVvkolZdOkFCN/7fVr/VO3XBoBZn8=;
 b=TFPMwRne8rseaC8M99hICeFGQDkLEs6x00udn51jYLttse5Ci1ydHpR3Fi460kW1bx
 6MhhB30CsYbvbkQuyUzF2gC5xXQhHEl4cZYWuOfm6E7bIeppMF6QURHkbs7OcA8ZZxks
 Zev38te+2PKOJYVP1AWq8d58F3Zv34hNn2ckwARwpLE3lFlnwWqo62hgvsS1tbMFT/vy
 aGLBMVayX28a5LFV4q0vOBUO2L6e6t5zvseGpC14x3SAW76oqtgZSHMl/6jhvZlvcfzk
 rOi8FAB+bU9RY5IiaROGOBVJLrZ27JeK/0eDJ+uK1OYYEnzk5FbameJfl4cvgxhMyKrn
 +NtA==
X-Gm-Message-State: APjAAAVu4EFfaMTa8fs8QgdE6wAsAaf8nbbGdI2AbzdeLlCjneljRLCM
 xn+dDV0LMwDqCKo0BHIWmpksOQ==
X-Received: by 2002:a63:ef57:: with SMTP id c23mr16181401pgk.436.1571503861406; 
 Sat, 19 Oct 2019 09:51:01 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f128sm10494778pfg.143.2019.10.19.09.50.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 19 Oct 2019 09:51:00 -0700 (PDT)
Subject: Re: [PATCH v2 06/10] hw/arm/bcm2836: Create VideoCore address space
 in the SoC
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20191017225800.6946-1-f4bug@amsat.org>
 <20191017225800.6946-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <09a2fc8b-9ea2-84a2-bb88-39cf72334c4e@linaro.org>
Date: Sat, 19 Oct 2019 09:50:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017225800.6946-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42d
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
Cc: Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 Pete Batard <pete@akeo.ie>, Cleber Rosa <crosa@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m8AL8VRLoxxB

On 10/17/19 3:57 PM, Philippe Mathieu-Daudé wrote:
> +        static const char *alias_name[] = {
> +            NULL, "cached-coherent", "cached", "uncached"
> +        };

While respinning,

  static const char * const alias_name[]

r~
