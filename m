Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp165446ejb;
        Mon, 17 Jun 2024 04:27:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdbRAU2Pp/W9wwxWtcYo5gIFWWoFlgrvDMp+4/MFEEsahSijvDFaLFBTNr33QaK3oc7o7tqhkh9D27wudhnKWoL3SLjfUw
X-Google-Smtp-Source: AGHT+IE4MI0lAVWePI798ETl/w9AcnMFAyC4zNEvXTE18EKi8LZAQUi4EteGSzPTqktoQsGbWVEI
X-Received: by 2002:a0d:da07:0:b0:62a:a6:ad5b with SMTP id 00721157ae682-6322412579emr87310817b3.45.1718623659223;
        Mon, 17 Jun 2024 04:27:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718623659; cv=none;
        d=google.com; s=arc-20160816;
        b=DdrAhNmtfILKiw3qUm0JhPrVSrUEo8N83JsSWZ+E99Y3n6J5dF7K0cMEEzYJArPus7
         SXmHcUQp6m8ErsantiZcJBrqYQMNsXd+r6KoUhog3tkg2LsncmkiBK+wHYKM8sbFekxz
         VWChIP9zqXsFaceewn5Ues8vFgIQaaza/VGtZ/g4OH5c2IctOYgsr5XqY1R3vpPsegeA
         k+gsaQ5u2qiXf/j/5hl9l86HLfox++H9jbjec+Oxp1JCP/Vm5GNIdvzlbNOHzLsrr6cT
         1LkukGkspCRp/L5JVPmutgyD0Rd7NwrrErOvNpnLFquWUfhcEWowKx9KGiYrm73FbCe2
         fmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=JuweiNJFENCvFRlLMFOOuEoczdw5ZlaYJTV+EhmlyPU=;
        fh=2Gx3aUWd/x+nOQgH22HenQDuDVJ19XoaSxcz22UpLm8=;
        b=pVL0pOqJNSzVVxAyu47wBIfRvFsxFEulGmSFSfN/sbpviUlnKvBYsWIV1oSsVNlfoT
         9QWP7JCW6kx+FGhwpYTqGDjmnvwaQiZDtReA27aob7Lp3UG4CtDw5DkKzzJgKHHSWMdJ
         OePMrt1frbqbVq5avaavtEx5aqoVfBq6TNjruTQtiknCNTKJxFel8i+Hk1pu3suz1f+g
         YJr6qvDsEIvddh5zLDbnyZYe5Y7TiYbD+negmtdXfwc68R+pGK/TkDYGXvl2ahQ2XDtF
         AdTsOvYGIOcO9fX4FPrL9ZPnNf3/0GjRvshUtWOnzcYjqYuwhCbnY2A0Umkt6uMn3qFA
         We1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jr32cep0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5b2b4a9si99995466d6.375.2024.06.17.04.27.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2024 04:27:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jr32cep0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJAWG-0001TI-MP; Mon, 17 Jun 2024 07:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sJAWE-0001Rm-E3
 for qemu-arm@nongnu.org; Mon, 17 Jun 2024 07:27:26 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sJAWC-0003Kx-Nj
 for qemu-arm@nongnu.org; Mon, 17 Jun 2024 07:27:26 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2eadaac1d28so45488671fa.3
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2024 04:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718623643; x=1719228443; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=JuweiNJFENCvFRlLMFOOuEoczdw5ZlaYJTV+EhmlyPU=;
 b=Jr32cep0JRNKUSHeHNm3CV+KHlH4NWEQzotLTC2xXQhOYp74/WJ602DHUTtGvOzE0p
 iN8UhXFx3f+shH6lWSWKuHDaGghs5VRMHI5ijWaLHrvV4hXkr12FKblfR7wrbFO9IgXJ
 oLdq1jP7Az5Hixw2QQcpR3+dyVAjwYlHLFC+ufTEuSXw+KE2NaV0RwImtBqC8RCHGF3B
 A+FXwB0LvkkM4Fy+f8K6YOAz4JVjO5N5/PeJ2Jd6I/7HV5uEDOPLFI0iU8kSmcWOgNzQ
 lP1c/PDnQ236kbcj/uEn3VnyKl+lQYKbPkGGkPxejSEFsFm/tyoO5r+V0+4829QpgWLz
 C80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718623643; x=1719228443;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JuweiNJFENCvFRlLMFOOuEoczdw5ZlaYJTV+EhmlyPU=;
 b=Kat65w99RrTSaqEhSs0pOs+R5rzj5siYNgimZbsxK/kvkI0N0aCy0eLI1xFQUVs5VY
 HC1MdlfihangwWErRW0b9iHzX0e6Vg3afDhw4J50sfI/GPtLdb7YpDqPTpBhX2I7094w
 6joKNdUOxWPUkQ5t1Fw2F5CtyL1PzKTWMTLDkQO8Mg3HbOQhwKkGMx0FIfhzSlPb7JfO
 hFM6G0Fd9bxyRp5dePlFad2/ZaaXGtr2n/iHkFEAdEfwYK8n0Sw9Xo41bvmqjzbwdZWC
 3Y1Uh4AP4C3sZiFHx+B6juu2cR4bR7nHQ7tlly+mdQTsml3l38wpHDineuMKluFaNDhi
 wBZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/A31gggl2pBTycZeXsxQ5UwQUaRDyirgPgjTqxbXU0PL2QYD5g5dj0zyQUhzPi6QK572WCjzW7K31QzQvURxd3glJ
X-Gm-Message-State: AOJu0YxUI9LmCqwlnZe8Tcc702bav94bLmn5sAjG0GUDlkb743jtBCGb
 lkXXtrWBRKvDaqYt/9FCHS1NwDlqIM+XYaBnM7alEKUogD6srJ6OLZjMwF4Ic35JHCijCi1TP3O
 CUUo=
X-Received: by 2002:a05:651c:10d2:b0:2ec:17c6:bbf with SMTP id
 38308e7fff4ca-2ec17c60f14mr53025161fa.2.1718623642732; 
 Mon, 17 Jun 2024 04:27:22 -0700 (PDT)
Received: from [192.168.200.106] (83.11.22.244.ipv4.supernova.orange.pl.
 [83.11.22.244]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb7439606sm6283809a12.90.2024.06.17.04.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 04:27:22 -0700 (PDT)
Message-ID: <a896b9ab-8d49-4ce0-82f0-c40704fe0e1d@linaro.org>
Date: Mon, 17 Jun 2024 13:27:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] BootLogoLib: align logo coords to be even
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>, qemu-arm@nongnu.org,
 Taylor Beebe <taylor.d.beebe@gmail.com>,
 Pedro Falcato <pedro.falcato@gmail.com>, Theo Jehl <theojehl76@gmail.com>,
 Rebecca Cran <rebecca@bsdio.com>
References: <fcdc0626-a0f7-4796-a05d-2462c896f5ba@bsdio.com>
 <20240617083639.379608-1-marcin.juszkiewicz@linaro.org>
 <CAMj1kXEukirF7UZTRbdHCx-ppyX=7Msrwpw-b-OJpV33R8d0=g@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
Organization: Linaro
In-Reply-To: <CAMj1kXEukirF7UZTRbdHCx-ppyX=7Msrwpw-b-OJpV33R8d0=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x230.google.com
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
X-TUID: ho76dzSUVsaU

W dniu 17.06.2024 o 10:39, Ard Biesheuvel pisze:
>> If we draw logo at odd coords then BootLogoLib goes into exception and
>> boot process ends:
>>
>> Synchronous Exception at 0x00000101FB943E48
>> PC 0x0101FB943E48 (0x0101FB93F000+0x00004E48) [ 0] QemuVideoDxe.dll
>> PC 0x0101FB943314 (0x0101FB93F000+0x00004314) [ 0] QemuVideoDxe.dll
>> PC 0x0101FB92F798 (0x0101FB92D000+0x00002798) [ 1] ConSplitterDxe.dll
>> PC 0x0101FBA96BC4 (0x0101FBA8E000+0x00008BC4) [ 2] BdsDxe.dll
>> PC 0x0101FF7FDF50 (0x0101FF7F3000+0x0000AF50) [ 3] DxeCore.dll
>>
>> This change resizes logo from 193x58 to 194x58px to make it's sizes
>> even. And if coords are odd then they are bumped a bit to make things
>> work.
>>
>> Signed-off-by: Marcin Juszkiewicz<marcin.juszkiewicz@linaro.org>

> This should be fixed in the SBSA firmware

One coffee was not enough so I sent it to QEMU devel instead of EDK2 
devel mailing list...

> unaligned accesses are fine on arm64 as long as they don't target
> device memory. So this likely implies that the framebuffer is
> mapped with device attributes while it should be mapped  > normal-non-cacheable.

OK, so need to go through QEMU source now.
