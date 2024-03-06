Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp726677ejb;
        Wed, 6 Mar 2024 12:00:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW2AAxVFxtqTLOopKICZlbKxtigZzQK4pn7fhxlcEnJKw5SdcEslXp47ezal6j5LtAsR2AdxVTQe4aS25rNVmhblqFdVX5R
X-Google-Smtp-Source: AGHT+IEBjLW19vvGJY8NP8gbhzzhQlt0gIKgcTh5wmFvewlgAedmWZDL2kfVd6OKWW6K3pxY8CQ9
X-Received: by 2002:a05:6214:3007:b0:68e:fa3b:5bc1 with SMTP id ke7-20020a056214300700b0068efa3b5bc1mr7960774qvb.31.1709755248230;
        Wed, 06 Mar 2024 12:00:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709755248; cv=none;
        d=google.com; s=arc-20160816;
        b=wWyIeV870wpGKJPBsbNpldFYaC5+7wcQB7/rXYYuqO/Di1Fs3ohNGA3mAGkOzGARix
         kgTBkW7DkgtvFRSby8mjP/OFy5vlU9upAMDq+Ij5+VUdUydL7WHsak1+JnorX3H9ilNc
         mYA1K9gHXD/gQhPgFfbH44W3qqKf8vABHlwZ5Xg4czbnSo8HmN8FuyWxD5TS9bzS+GUT
         K5s/tDg8qOBTeNph6pIIRlVSA3cq/gZGT0QZOdwa4WBpQ2I0KJy46qrDTBUiqIcc9CDb
         CLQYnRrkdwN6wdie6Ovjy+tN2gRB4kCiv8g+A3mb8K7wCN1FEGYaEctWcRrcVOpGMD0/
         PL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uE/+d8za9FOme6hIEIVOXrHDo/Jr6T++1vzl/Rw5YTs=;
        fh=A7r5IX6UkNhwOzBNyPEryVPO3hraZexKEwefK37oHq4=;
        b=TJ6wcXZqcb2Vk2P0L2Z64OWlDle/tq1rAV5ZLOr670AShoiknt8uhuqQD98UyKQGTC
         ol7LeU+YaWuW755Ke6QQBQvasoSUMErynU/0wzctK+OHOwGwWxGva17Q72yxExXV0Yxm
         cWXhT2zGdJK9fFaOzOgnhy9n1tQB4WyeWjKwrRknULTKAmyiDcHNKSm8UDlqMXrGXnqJ
         iQEFLflE1zU10dQwZEUpMPNQy5GTPMCeSDmnk/FV1KT302Jiq5Cb/HxpXTSB1YbdBuj9
         chB0RJApuZLZGdlMIHmwrrqHWb9teB2uPj4VqXP9UukKTLTrSFHMoZastvrNhKAnSlt7
         xeUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=a3UNQ237;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey8-20020a0562140b6800b0068fe583c0bbsi16720721qvb.314.2024.03.06.12.00.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 12:00:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=a3UNQ237;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhxRJ-0005Tk-AL; Wed, 06 Mar 2024 15:00:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rhxRH-0005Ss-FK
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 15:00:31 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rhxRF-00066B-VR
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 15:00:31 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1dd3bdb6e9eso768265ad.3
 for <qemu-arm@nongnu.org>; Wed, 06 Mar 2024 12:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709755228; x=1710360028; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uE/+d8za9FOme6hIEIVOXrHDo/Jr6T++1vzl/Rw5YTs=;
 b=a3UNQ2371erCuSTED/m74bEKu40OEwahwMeVbMoodTsueKzonESP1srAPA5zamCVJi
 /GG+Xyugvyik0fC3hWTJPeRDALvDtp8N9Ml6SvCnTSTlIazOi3c/VPW6LFTQ422ZerQc
 KfgWsXZxjGCTpuLNpOLlMgwCSwTYcv5Vb6es7/zfC7nYca5/5Gh68NqB6W7WS26+CRNy
 icFsR6By88fVA6dgA+63cIzrVyTPQ58zAkNVvnjh+1Da3deFlimTVvDcO1gsVn8ttCYi
 41JV03mc+NEeE1f826R+5466efH+cOBXbYVimaOww5bhFqMJj6goIujBPS+YARiQ3pnx
 DLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709755228; x=1710360028;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uE/+d8za9FOme6hIEIVOXrHDo/Jr6T++1vzl/Rw5YTs=;
 b=PgpY58xvjyvYQiDlufIbPlgTp6YXT+vT9YaC3UsKKnYF46bS9e9eEF/FuRTBb7lfb1
 KR0IIFEHh0ikC0wgbKbmWkz+gyo31qIFjJ6c5KJgPRqtBflgis5uzX4C3fBXP7o1h9/l
 6+sx8MgjBWN724crXBfWM4wi2xDtZ2u5twBGVZBgk5GGqRXGPuqfdRHy1sDqfwos0v+G
 KZAf6ox1rIxOEWF2TGlDnG88I/TTMxzgo8+yuNur4HHMmLHwblKdMUfXLN4YhKBMKgXv
 E9IBKP0wZpsaD3fyA0q+2GLmX7jYCu55aaMBw1mzuwjy00UiMejwgqIcuJmFmAnrstkY
 lepg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2lLvz1OGyTFByfCSlnQDX8Mum6OQLiohYUi0FYmDK6xwJ12wUCeoJIKywIuQF0eQ6cOkrBymlqu0ebVh/w8vs1jJc
X-Gm-Message-State: AOJu0Yy49LGV7NGK2bshSe1w6c0NJXRE/GAxed29CSy4eC3f3e3/5Acr
 TrXz+nCdTgKxT+FmBlmLqDeVYl7yIJuziXW4IlrqOdm2woSzGr6nGSRLhQGkAIc=
X-Received: by 2002:a17:902:f682:b0:1dc:afd1:9c37 with SMTP id
 l2-20020a170902f68200b001dcafd19c37mr6684943plg.24.1709755228142; 
 Wed, 06 Mar 2024 12:00:28 -0800 (PST)
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a170902b08600b001dc30f13e6asm12953234plr.137.2024.03.06.12.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 12:00:27 -0800 (PST)
Message-ID: <3d377b25-bbab-4401-b5e7-98f6efa81ca7@ventanamicro.com>
Date: Wed, 6 Mar 2024 17:00:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hw/arm/virt-acpi-build.c: Migrate SPCR creation to
 common location
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 sunilvl@ventanamicro.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com
References: <20240116010930.43433-1-jeeheng.sia@starfivetech.com>
 <20240116010930.43433-2-jeeheng.sia@starfivetech.com>
 <49d0d8d3-c7fd-4039-aeed-6c31ba16557a@ventanamicro.com>
In-Reply-To: <49d0d8d3-c7fd-4039-aeed-6c31ba16557a@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
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
X-TUID: sNjVdeTX0wAw



On 3/6/24 15:57, Daniel Henrique Barboza wrote:
> As a side note, it seems like 'bios-table-test' isn't being run for RISC-V. Not sure if this
> is intentional or a foresight.

s/foresight/hindsight

There's no 'make check' for what we want to say in the ML but hopefully there's
a way to enable 'bios-table-test' for RISC-V :D


Daniel



