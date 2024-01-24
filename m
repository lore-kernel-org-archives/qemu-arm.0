Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp598066ejq;
        Wed, 24 Jan 2024 15:06:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6U+4tiQWmKPqgLzboBjM+51SmWtP+jDmRJebv3ZRFsJDPc4ap896Utcoln9bLtYToiAfy
X-Received: by 2002:a05:6870:4189:b0:214:4355:1055 with SMTP id y9-20020a056870418900b0021443551055mr30605oac.14.1706137584576;
        Wed, 24 Jan 2024 15:06:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706137584; cv=none;
        d=google.com; s=arc-20160816;
        b=OVQ9A7uS7qCO4P3/TXGHtN4+oOIXEQMi3IMuRYV/bW5/TEgp+Dq23J2lHisW/D35u8
         XCMwKCljYZc5IeCSRABTjeU0N9oneh9bj+wLoSfANVemuoHJNhznD072QSEiNneR4heM
         7y7XH3XJzINFTyHBpkks/rWMLGmYt3VVhyu89c50sogVpe02RByfhB9E4rkB7hOTkfXw
         UK76KyJHz399M9hA4KYyg4ugDLjL85wZBplPSO6FsYmuaYm9GrBiLA3cZUEyjzfDtMS3
         7lSs7TpRuCWIaswJktM9XHLLub1tvy//VVcuow3QuugidSDPMT66fm5o99DJLvPOP+9j
         +rhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=T3NiYG52z+57CnBGm9UZ73JyhValXWnn0MFiG1bhKYA=;
        fh=BV2EuOiWf6AH5YN8lynj7fi/DnpKhO3Y2LPVLIls540=;
        b=m51iehodoSKJwruxrEgYt9/Jg+1Ik6duV9mLRR6vcdjeJbqCpOjproV4yu5gPYTO04
         jKf1D4QnUBgPm6vDBIZjntLZULLHOnNnWtqNJxi7uIj4tAg5LyyjrzFs4MmJi6cetI+n
         rdnUgLTbEbeC/38YsYN5DRKNYzKPhxSmZC8b11pjwLBArNXIL03bLmNAVc632iMUJbsu
         +oXXA9WpGw6zD3hjKHVcX1TcRGY3CuhbjYCKqwNw1DahuXVMD4n4WkM8/3wrsxw/1gDU
         NhNFz4e/WCzyOpHFyCkhdq1+QFrzCczyU7eUBuw+HHCV98WOb96quvLbdkAKBP4HHrBA
         5WoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G4aFNvLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6-20020a0ce4c6000000b00681888f5741si11217584qvm.511.2024.01.24.15.06.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 15:06:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G4aFNvLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSmJw-0003N4-Kj; Wed, 24 Jan 2024 18:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmJv-0003Mp-H3
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 18:06:11 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmJt-00085H-N5
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 18:06:11 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-290a55f3feaso2819906a91.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 15:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706137568; x=1706742368; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T3NiYG52z+57CnBGm9UZ73JyhValXWnn0MFiG1bhKYA=;
 b=G4aFNvLk2RN/+UBqll4wneQrJOjG+4GsZtCOhelMJIYJGcbtWnoa9OIZSUEYcBsWvP
 WyHcjnIvTefe2gc3Egnn7GhvxfxTI9oKsU3tn1qd52e3SYyL4Yjkcvz0uVD5kyV5UtkG
 iDWLD3w9SfX8qr9Qbo7dAg24kQz5CS6FJiGgimmE0oaPqPDHTEqLHSukwwMdIr769s0a
 DUdFHWKMXNQjyNweiLpFYZRp0mxjUqitg/+1qBTUidyMksML2nhCX2IwPETSTG0ASOhK
 g3uPuTw4nECkWXyviDj2gWNfk8ytmYvTjQd8Mg2dE+JFmImX5lGBdsKoqydpzsSBVyKt
 E6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706137568; x=1706742368;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T3NiYG52z+57CnBGm9UZ73JyhValXWnn0MFiG1bhKYA=;
 b=uTEfw+uXyl1lEgSTZikuHg+dwJvi6ID1QqOAFzl2c+rgQ0AcNRhrBRcfNG3h6Li6p1
 E/1yYC/7kPXpGuDNeijcvW1DlDAJ0+oirveqs81Zr1apeDgwiObR7QP4y6Os8wciGpMh
 Yms7tFNYHk14XK7q4XD9Wofci5vOK0LZmhb3REuYR7+wAcKJScDtzam6nMycTVy+zPjB
 Y0WRGP4FZkRCkbd1qcJ/XydJwnyivS4VwCXCVZ7lwXzt0TNNTjtNrgdulQi+9/ykpcJ+
 NCQlW4rA5e194PfiYdmdvsDZgWv1x89GFwd0X8NxZlh04EWd0koK0yAXlUTDmmd13Cke
 xFiw==
X-Gm-Message-State: AOJu0YwLZqiMZpw3ulapNVFq0s3MvfinFXdl0jTz9Q8cAvfLmmBeu3/3
 3tITKtiCSQG2Bo5lJ8+pJ+LkQ8MyCWajzFbfI3SVtFJbDnxVO9S4i862Qh6Axnk=
X-Received: by 2002:a17:90a:a89:b0:28c:bd2c:b3b7 with SMTP id
 9-20020a17090a0a8900b0028cbd2cb3b7mr87687pjw.54.1706137567915; 
 Wed, 24 Jan 2024 15:06:07 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:5fcf:9e3:2e58:9c7?
 (2001-44b8-2176-c800-5fcf-09e3-2e58-09c7.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:5fcf:9e3:2e58:9c7])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a17090a2bc200b0028be1050020sm180008pje.29.2024.01.24.15.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 15:06:07 -0800 (PST)
Message-ID: <b75610b4-ffd7-4fd9-913c-5434c7e3d443@linaro.org>
Date: Thu, 25 Jan 2024 09:06:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] hw/arm/exynos: Check for CPU types in
 machine_run_board_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Joel Stanley <joel@jms.id.au>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Gavin Shan <gshan@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Igor Mammedov <imammedo@redhat.com>
References: <20240123222508.13826-1-philmd@linaro.org>
 <20240123222508.13826-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240123222508.13826-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: s/iDIdVyMit+

On 1/24/24 08:25, Philippe Mathieu-Daudé wrote:
> Restrict MachineClass::valid_cpu_types[] to the single
> valid CPU type.
> 
> Instead of ignoring invalid CPU type requested by the user:
> 
>    $ qemu-system-arm -M nuri -cpu cortex-a7 -S -monitor stdio
>    QEMU 8.2.50 monitor - type 'help' for more information
>    (qemu) info qom-tree
>    /machine (nuri-machine)
>      /soc (exynos4210)
>        /cpu[0] (cortex-a9-arm-cpu)
>        ...
> 
> We now display an error:
> 
>    $ qemu-system-arm -M nuri -cpu cortex-a7
>    qemu-system-arm: Invalid CPU model: cortex-a7
>    The only valid type is: cortex-a9
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/exynos4_boards.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
