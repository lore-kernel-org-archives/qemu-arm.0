Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp86129ejh;
        Tue, 2 Jan 2024 11:09:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz6zygq+AkgUZ8HwfGMhnmeC3ZA4jukIPnfGsw7EMxVSiaIbe3+6LP8e74BCux0TOOICC0
X-Received: by 2002:a05:622a:429b:b0:427:8aa6:80e6 with SMTP id cr27-20020a05622a429b00b004278aa680e6mr23365258qtb.96.1704222568509;
        Tue, 02 Jan 2024 11:09:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704222568; cv=none;
        d=google.com; s=arc-20160816;
        b=fllj3gnSZtXK8VsO9wunUANkNWccDHAZGWvSwCQbXThJk+yTrX/x8ycUe7vvSN44Ar
         f3+Xez9uTulQd4DwxG+p3P6sSSUUZhF1LYlp3G6zubZsmVk4AEExIVjKL5DpPIWkcGwN
         oMrxXn4gKkH9KgooIRY3KOaQ/BLfcXG0Uw6VcF3A6i5675gReG2EPCdSG+0MoiqRwOIz
         SK1QjDWTCAMaosoVWjHSy7NPjHY+oMq2yNRbuZwlVvMdbVVNKHMgqLKq21MK6P6fgIfi
         SW9itJTB9+wUFic7RLzQUJB3/ktLvnU3UgoVpd9hhG7wnWpjEi6gY5DArKHyCPL94/LC
         LgEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=P22KJd4xSMdDsULBNfpp2XHeqw0XeEFBkNPx7c8XCxM=;
        fh=ay4v0Scbyppp0vf+xOpZbhlnBtWc9AIbi9JrfpwWm5g=;
        b=a4TbqwUFrLW7/Tvx8++KWahjtei3XF1ArPaXlzKyLFrWMlQVR29pWUpP10DdwxmdVw
         kKzKIZEzxGMiqFKb2pL2PlXt4KxGXvBoaddWKBKpGBzmciUTOWn2gNl4UMXoIrya+P0T
         g1M/lE22wvpecQT4rE8MzWCvwRtXE9aIMteNuEb+/3KgrLJKTNchDuBnsnyV6fwOlOew
         gsyu2ZmlJacBw73tbjDhdex511yd+AKHHQ7glIaHumX9JY+1riQh9HBYwMGotBf5/BAb
         68uL5G9Bpfo+LPXvB0MkbxQ5LjkhvDGtsi9uXik/qM/XqGNBLzS9ybbCPIwIHjjxUcIl
         pxCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gVIqQ7uI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9-20020a05622a120900b00427f03fbdafsi14082889qtx.712.2024.01.02.11.09.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jan 2024 11:09:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gVIqQ7uI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rKk8f-0006r6-7h; Tue, 02 Jan 2024 14:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rKk8e-0006qq-9V
 for qemu-arm@nongnu.org; Tue, 02 Jan 2024 14:09:20 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rKk8c-0001ll-Ne
 for qemu-arm@nongnu.org; Tue, 02 Jan 2024 14:09:20 -0500
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50e835800adso5802359e87.0
 for <qemu-arm@nongnu.org>; Tue, 02 Jan 2024 11:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704222557; x=1704827357; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P22KJd4xSMdDsULBNfpp2XHeqw0XeEFBkNPx7c8XCxM=;
 b=gVIqQ7uIBrhf5q2Y+CPSF5RL4ptd9/BbLMat0tSSbFA+w+jjFdjfJkWtnuja9Iqr0M
 8tyLmwAlk+ZVjwYNAMM8s04aZ+/0VmggYLi3zX10NHX5ngFS6UVYtpHsKl7TKdm0+mft
 MpBfTEKWYt+RuLKBzj2etpYQD3OquscAUdVe0kJaVwQGva4gFVg4ElPxdTFgToSTSvXy
 0mJN4uiW7ZbvmjxEc2/bOEdjo9B8abrKvSCbllCDI96pWbHE1d4DEBlLJzzIhXOMdMkV
 ArKc86juj6PHyriQs8Av0Q4z0CToEr35sJbdMrRFW4RkFtLblnPphrb9cTahxTiu7++O
 o58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704222557; x=1704827357;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P22KJd4xSMdDsULBNfpp2XHeqw0XeEFBkNPx7c8XCxM=;
 b=iE7kr45uD6sQKdEeHF11tyiT/m2+yNoi7uj6+vWG5QQzIh/qp5tUw8RgjNAhpxpxCp
 BH04M2U2dmtOh28WqX651PXFVTZ1zkOpq14uxLqdtOD0RyM2Hd/csR/JAt8fwJnYCqaf
 gYk22v4NTrpQda649BMxTYZzqQYjZ2kk2T8EUiMPy9WCzYeUrk2hLXeoJOsIy03LnFuM
 yH7Ke3lIqbTTnamPrOdgSViXTDEf+KVejpKSvTToy6jJzDV05od3aOde+Ob+ruE0Go7H
 NnCphVUoPCJeaBf0vO3jTK+0W7ODvBX542hod9xnIfijlCBhzZbomL8rJBhYuiwu0/EV
 L92w==
X-Gm-Message-State: AOJu0YywrYVUXp08eQVTx1IkoLGBrFxg144sLb3bYF6Uv6mq6zwPVH9j
 v1h4ulqT/tywYmz779nrHEVu/BeHW3Dg+g==
X-Received: by 2002:a05:6512:505:b0:50e:3c22:9d8e with SMTP id
 o5-20020a056512050500b0050e3c229d8emr5195420lfb.59.1704222556641; 
 Tue, 02 Jan 2024 11:09:16 -0800 (PST)
Received: from [192.168.69.100] (sal63-h02-176-184-16-71.dsl.sta.abo.bbox.fr.
 [176.184.16.71]) by smtp.gmail.com with ESMTPSA id
 lj3-20020a170906f9c300b00a26a80ac5fasm11565207ejb.120.2024.01.02.11.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jan 2024 11:09:16 -0800 (PST)
Message-ID: <0ff293e2-4155-4ec3-a078-41e4b022127f@linaro.org>
Date: Tue, 2 Jan 2024 20:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 8.2.1] hw/net: cadence_gem: Fix MDIO_OP_xxx values
Content-Language: en-US
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 qemu-devel@nongnu.org, Luc Michel <luc.michel@amd.com>,
 qemu-trivial@nongnu.org
References: <20240102141803.117631-1-bmeng@tinylab.org>
 <985e87d6-0f8c-4127-b425-f1efc6034879@linaro.org>
 <f662a5cd-fa5b-4583-8864-6f1c1a1f6ec2@gmx.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <f662a5cd-fa5b-4583-8864-6f1c1a1f6ec2@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12f.google.com
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
X-TUID: xWXwj9drcRMq

On 2/1/24 19:32, Heinrich Schuchardt wrote:
> On 1/2/24 16:08, Philippe Mathieu-Daudé wrote:
>> On 2/1/24 15:18, Bin Meng wrote:
>>> Testing upstream U-Boot with 'sifive_u' machine we see:
>>>
>>>    => dhcp
>>>    ethernet@10090000: PHY present at 0
>>>    Could not get PHY for ethernet@10090000: addr 0
>>>    phy_connect failed
>>>
>>> This has been working till QEMU 8.1 but broken since QEMU 8.2.
>>
>> s/till/until/?
> 
> These are synonyms. Till is more informal. No need to change.

Not obvious for non-native/fluent informal English speakers.

> 
>>
>>> Fixes: 1b09eeb122aa ("hw/net/cadence_gem: use FIELD to describe
>>> PHYMNTNC register fields")
>>> Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>>> Signed-off-by: Bin Meng <bmeng@tinylab.org>
>>>
>>> ---
>>>
>>>   hw/net/cadence_gem.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)

