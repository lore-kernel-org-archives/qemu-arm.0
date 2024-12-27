Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp6565642njk;
        Fri, 27 Dec 2024 12:36:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXJKlUpyrm4oeqvogumVTjGdX8GWCz8upUQMa6ofdlQfY1Lidpl3MRicmQAH6x16/loKnV8Q8e6ngNilA==@linaro.org
X-Google-Smtp-Source: AGHT+IESx4/O30KPyqvuthHKYTSCGA2aQ9GrljQ27Wkfq5MLF8ix9X5RPG5OT/L1UWRY658nt5FY
X-Received: by 2002:a05:6214:761:b0:6d4:3437:d858 with SMTP id 6a1803df08f44-6dd233574eamr555636886d6.25.1735331818209;
        Fri, 27 Dec 2024 12:36:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735331818; cv=none;
        d=google.com; s=arc-20240605;
        b=Uh/36gZHf3yksrR4vi2VQtitP0al490sepK/Zp8Vu4x6wFyBoOcZbGT38LvJ+92OYD
         yQreSJICV8w4DjnOVneDjpJPowKoslTgmpGj2ctnlgoUZx+AOVB4jSI2yzf+OeKJtTTA
         Nlh+9BbY/avGod9hP+nOzzE6Dae+JWmlvJCKcgdeZ2glzwhj2VIl33AzYzPpr4WwctLJ
         Nomu3vy8az1NE7Mn1y7oRJJj8cblpHha6aaY4rVRbZXHH3uTEb1ttmg6fqHFRpAqLLDY
         P9bM9VpL+3GiogcmVpy61u7/iNoWcl5Oywr3m65jYbjez3Cci/BfyhOoVEE+wi4JZBED
         jkGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bJBzFpT7aUuy2BWNtvX33lOSAzbJvJLAWdbFR1icwUE=;
        fh=LEyys4+bbfTYduddTIh5jmrPnWshFpbv9BnYALjBrxI=;
        b=XfsjXgJQ2O2Lo+pPlZXz5Qte60a6iDEWmUx54nnYczQz6alz0NmC+8wpGHCdAXZQj1
         lMONBhT1l0U0Eid8QWLnJ4kCmw0z3Ovd+Ot8LfqLlZ3q582RTbvoAE8NqXLb3ysaTp6W
         cKN/d0vSIVqNo0RHcUV5R1tMSICG7hfd67NLOcjSGp/nsAcQfEGjEOxZEiZ5dQawgEbJ
         OsB5Xb78G9HU8ibsL8oS9fQiMdIJrzg13epdTEKYD6bFLc3agHDHNKvGxn+kPkzK9Io2
         ij7kHGxGGJkKbW2yxA6vkpz5GLkIRiC7WEDtehUdjVblYfvVTiX/WL6kzM1v9Ra698h6
         9f4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qj6Wlz31;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd18236357si233687076d6.208.2024.12.27.12.36.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Dec 2024 12:36:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qj6Wlz31;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tRH4V-00008W-4t; Fri, 27 Dec 2024 15:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tRH4H-00005I-CV
 for qemu-arm@nongnu.org; Fri, 27 Dec 2024 15:36:27 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tRH4C-0006uK-Mq
 for qemu-arm@nongnu.org; Fri, 27 Dec 2024 15:36:19 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so75239945e9.1
 for <qemu-arm@nongnu.org>; Fri, 27 Dec 2024 12:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735331775; x=1735936575; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bJBzFpT7aUuy2BWNtvX33lOSAzbJvJLAWdbFR1icwUE=;
 b=Qj6Wlz31XY4y9JhmaY8SH3jfoR5DTRJqtSKfrPcm9Kz2m/PHq806qhMT3A2Rdl4GVr
 D6qZUYKGu1ZFyK9GlBIpEsOJ7RQhxfIsR/87RHpjURdFSDuzuFwY3qDPMhpLztqTMhnc
 mSW1HNJQeMlx7vBIdFtOkQDwIDXWt4IwLarDtZr7ZD3tfUinHoaGrXwAYz3xxlrTAu1g
 RgB8SBvZNnVupEE6UzTeRrTuEVpUu+5QIybjLODmGWN92lyYTEaS0+QSUQv5+F57dmx8
 bCx+hsrUWQVi2HFOt4kM52+FgckUHQ+B4SjR2IgcoIAs55sl2/Y7oK/Qr7OeU2WxInu4
 wPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735331775; x=1735936575;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bJBzFpT7aUuy2BWNtvX33lOSAzbJvJLAWdbFR1icwUE=;
 b=rEE7HB6zKTMciEz9881KPZM5hxA6YWW43SoSXhR8RWuvh5ixU5q4zLVqCsrM1H0N5e
 MKRN4nEQZeUgWD8kvPOfvilMT910OWToAxNSkLOQ1qBLhGtCwbXKjrHrtYk2YLTMTAZi
 cQOeU5+OQmUZPc893EwxPDUYdpDYaqpVykKS+/ty/KGjMyB/kVkOVap6SdmyXYAZC8+7
 nCYG1Ho40iy8FFac5kViroVr4T6hQTYpWutZcCUHXSsMFVQAlt0DUK9g2Rk/vJi9eIhD
 1us95B0wGz/GCbbWFhEyVF6YVR+MQCIdc97O0alKc+Uhx4RNty0Dr1yshebw2IZ1iDO2
 HuQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURLjTpD0Zqm0u+q+rEBVmAsZHQ7Ta/T4czZkOHuzHZ/opUZaNOaDd6uGn328WZuuNlUbFRsclnNQ==@nongnu.org
X-Gm-Message-State: AOJu0YwfEEXL7mqM8WDfXoTmrKX6e99V9BwW8A3NodBV9PEQxDivRD6x
 SxP3OP9QDYeUEPUrlrjVVHL7z7AQJxghtvA/NtxAm8IqWYs2Ygf0IZeIpgcn2Io=
X-Gm-Gg: ASbGnctJojcHNdMWznlZ7aITrAXxz0KdB+TtAyFECabT4TM6fcehyKr7cE8RoMoZjFR
 4fLv0IhmWqaUR1w/WhrL7gprTXYISQeIWfS2oPllKLqXrP12OgFdPFM1BM937VH3qc7EySfCiXG
 zDdu0o++b8wjTS5m+ynIOG1m4oU821hkI1aF9jJYnYoX9zSMBu1QmJlptdHbHJI6jDvxe5sR1hk
 rSOwI+N3r/8Wlu4PMAM3TPneDbwhu4ZVhdfV0yUx+t9UtTBJwqVJUu9jcx7PzVyn3upBeGSQpjx
 uvuJnhUC62qMPoObT9mJKXRA
X-Received: by 2002:a05:6000:1787:b0:386:3c21:b1ff with SMTP id
 ffacd0b85a97d-38a2240ffc3mr20593891f8f.58.1735331774957; 
 Fri, 27 Dec 2024 12:36:14 -0800 (PST)
Received: from [192.168.69.103] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436604e9c2csm277021315e9.43.2024.12.27.12.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Dec 2024 12:36:14 -0800 (PST)
Message-ID: <2ceda358-adce-42bd-9f29-9a2e441361f0@linaro.org>
Date: Fri, 27 Dec 2024 21:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 14/14] hw/vmapple/vmapple: Add vmapple machine type
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, akihiko.odaki@daynix.com,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
References: <20241223221645.29911-1-phil@philjordan.eu>
 <20241223221645.29911-15-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241223221645.29911-15-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: IeBemdJJaON6

On 23/12/24 23:16, Phil Dennis-Jordan wrote:

> Known issues:
>   - Keyboard and mouse/tablet input is laggy. The reason for this is
>     that macOS's XHCI driver seems to expect interrupter mapping to
>     be disabled when MSI/MSI-X is unavailable. I have found a
>     workaround but discovered a bunch of other XHCI spec non-compliance
>     in the process, so I'm fixing all of those in a separate patch
>     set.

Should we wait for your XHCI fixes series to get reviewed first
so I can base this series on top (removing this comment) when merging?
