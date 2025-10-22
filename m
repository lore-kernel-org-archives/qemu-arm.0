Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30DBCCD1BB
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Oct 2025 14:04:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBZRS-0000fP-1H; Wed, 22 Oct 2025 10:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBZRQ-0000el-0y
 for qemu-arm@nongnu.org; Wed, 22 Oct 2025 10:03:52 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBZRN-0001pE-Pc
 for qemu-arm@nongnu.org; Wed, 22 Oct 2025 10:03:51 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-427007b1fe5so4607454f8f.1
 for <qemu-arm@nongnu.org>; Wed, 22 Oct 2025 07:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761141828; x=1761746628; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CgUcTvhc/Itn5uetP9wr2VdFL3LDyvl8uYUjR39f4V0=;
 b=a8Y4QUY8zkTCcQy93myHyD/pgZ2uP/WWifseGkSe+Km6MuKEE5Trtfu/eqOpQPPK4r
 ptt+PueaOg9YEjtzZQ5SN26wnF0MGIjPUzWnbfzHSGPipvJBwOiHaD3mp3R7Uh1gyruk
 M6SXoyyJRavCoMwh0i3EbGS0OVajpjIcvQilfuod+UxRxREnkEagsMqv1/83uSTwiwWi
 hbQIlSwoedYyi7myfjn5Mo5fsUFgsT8RGC5xeS8DP+PDqE2S7pGBO5hyLRQEPKi/Km3G
 vmFLNzvEGgdNIHJ0AGOirchNzphDvdXMeIy4EXJBrDy63UIO8P7/GpEfsYUE1wyB3CTM
 0ZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761141828; x=1761746628;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CgUcTvhc/Itn5uetP9wr2VdFL3LDyvl8uYUjR39f4V0=;
 b=Dhjr0X+QdHrBEwPrNgZ6CI2hLsS0p4g5SxKlCI+Wy0Qr57vv2zZRIAgK7pjlYirMJz
 IBmFiKUAxuGhifNPg24yJvd6SM3wBknMusWtHte+MdABjw5b7a1hI8bZhD6IGY7Ofcdx
 jz+ADa/Q1e+NzPyabcIcgJqv7jFKVSWP4+IC6M/vodZLxF3BG58CRRL/OeBf+BxtCfsX
 ZwcM4g3IartOmEgY8XxVLu/Lo7yelKHvAA+PkEke9TNgYYrOf9pgh9VgQ8NmYKHfgRdg
 R75Cyc2o+mDcJKOOmJ5cK4hUaxn3yw9uVysRoy3+OnOA5w81oLPqMoDzeQ6K1AqeEazD
 FG9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhavFVPP3em0jLZERL/4ZKTH+6SWmic8HA5Oc6X2xZ5cPs8SrrPDem4q7t745zc8513Wye7i1j/g==@nongnu.org
X-Gm-Message-State: AOJu0YyXxat3jR7FjEa1BuOLUXh1jdoL4rCzLFYKbqOLuz1uasMFhlYB
 h/0zJEM7yNuaozhVJ2EOFsLwSadRZz8mAUSXQR+NpPtfxZpfXUEmUe2ZHMEm9+6BCOA=
X-Gm-Gg: ASbGncuk/O746mGSba2lng/A/dtuN3P3rrdPoqbya22mmDFGFS8Eic5SpHCd95qT+rP
 CMbCL1xuPK6t6w2aG1BjrgcsAKxtAlJueik1jRo/5eEy5/Nm+WMltMxTkvLEKgKJPUPiCt158zq
 55s78UwWCk3ZIvjdnejHOpQUocAwl0sF7WFXT98KMv5F7NpQ9rysUA8ikNDLjKcRmmYmA/AHcDr
 GmHJa72WOsQfVzZ3hA5js5jnYSrNUQaq49aunV2xba2GotNy8IVQFl73IhdQVPP7vgqwnK6gEUU
 v7Lu5D9D6Kih+6kWkLrI1Vf47wdrMQrFtY5BdKPPS6CQyftfTkKfPMMJgDiebACWPjBLjZsulEL
 of/pfj+lH9HvACX9b/Jc1c99k0jg6s7mBo7/a0PUXrZk3e/w5dUQ6QqrFZXrwesnsSV4FE2rB0G
 mF1mfq1G0esvfq2Ugv2jv5K6ohxNldk9uSs/KO3ipCqT8=
X-Google-Smtp-Source: AGHT+IGyiU7BD1TK4Bc5fbUAg5DELawcYvAkctr4P23WdzDZ/hl6e/1+LeaMXZ6IJwRwSsPijbWCvw==
X-Received: by 2002:a05:6000:490c:b0:427:632:cd3f with SMTP id
 ffacd0b85a97d-4270632cd6amr14476322f8f.28.1761141827917; 
 Wed, 22 Oct 2025 07:03:47 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3dabsm26402898f8f.16.2025.10.22.07.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 07:03:47 -0700 (PDT)
Message-ID: <a244a654-7bd8-46cf-bc55-87ab5287bda5@linaro.org>
Date: Wed, 22 Oct 2025 16:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/19] single-binary: Make hw/arm/ common
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Anton Johansson
 <anjo@rev.ng>, Luc Michel <luc.michel@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20251021205741.57109-1-philmd@linaro.org>
 <CAFEAcA8A5xa0nJUczM_BDCvVu+sP-tdbt_CxDGos6hKW27qEZA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8A5xa0nJUczM_BDCvVu+sP-tdbt_CxDGos6hKW27qEZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 22/10/25 13:50, Peter Maydell wrote:
> On Tue, 21 Oct 2025 at 21:57, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Series fully reviewed.
>>
>> Since v6:
>> - Addressed Jan comment
>> - Removed aspeed/raspi meson patches
> 
> I'm assuming you'll take this via your own tree like the
> other single-binary stuff -- let me know if you want me
> to take it into target-arm instead.

Since most files are hw/arm/ related, I tried to get it fully reviewed
before the last Tuesday before soft freeze so you could queue it;
however it is based on my hw-misc-20251021 pull request, which isn't
yet merged. I'm happy to merge myself, but would you mind to provide
your Acked-by tag?

Thanks,

Phil.

