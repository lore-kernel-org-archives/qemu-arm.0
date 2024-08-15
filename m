Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp786713njf;
        Thu, 15 Aug 2024 02:28:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1rg0wpmgjmDye9/+I6RWqPQj6cKhZQOFjoI2/vUb8klUi5//CdL0hLB8mg32mqTJC68K21Nlh6sDO8yCpWK8VYjILqqdx
X-Google-Smtp-Source: AGHT+IFQ4ajOmjP8JnAOO5uqPK1gXPMVj1rIhJQauljVt8VrXkzBAGL7Hxfci67zS+UZ60wyWiKU
X-Received: by 2002:a05:6358:2908:b0:1b1:a7fc:1119 with SMTP id e5c5f4694b2df-1b1aab85a1bmr719699655d.17.1723714096230;
        Thu, 15 Aug 2024 02:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723714096; cv=none;
        d=google.com; s=arc-20160816;
        b=RSKvQrj9oIKv0JeYGYAC6HPElJLBkMkM6pqgioA5OCcxJRYDSCixgsR8ppYh7hAVdb
         LPSKRArASNeImv9w114LlwubD8dSCMU0Va3AXGimUH6pZnUx4/xevaB+Y750ez3evLGp
         1Rbm3swJUjInhp9R+Mzfx/mHuhl5J9HAm18Z4u1D+VfrRthJNWRuWTPluENSt/uvebmr
         Q/L3TnZ3KCVpJNACiZlP5U34dZUsNLR0REpZsKvjMKA+mvlVSQHCjejqcfSgmXvBw3T0
         1OyQvAj++yCPOQZU8VQwxK4UsN5Tr+MSac0n92ELkIeZDh1YHB+jQ2A7xOc/MBK3b2vw
         vLmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Bpyz4uA4VLTLT6Q2iCunXp01ueOc6QiK3D70B3lOBqo=;
        fh=9sccWmlJcJQ4lfaLTCDVX/XCrXVej5GtQzOBhER8w3E=;
        b=hTpVKICqZ85XMbcx5FGMXHWcmZgDP96Bqn7XA+1F6qQN/8iBSN6BOAnEAgjVtPNobw
         8xIoFP3s2jKa50K/ScSkHVOeBp5ijWtR0LiXR7PtCftZvmdw1W171/VIY5NTRdJ7/ge0
         GcZjMf9I1/4L0SRqaiDyLsEMXxlpVlZYG7Ddsge6WqIXuu5X5lghbHoUx0QKxq8Yo+XC
         A7CSgBvnrB1X76maxd+1Yxl82gEefizM9+IOKTUT+BvcbLSywrDZk+JaQOABLVKICd2n
         co4bx1N/LwwNQSSYdVnvMsdqYeGqxbGNYOmVWw2grpRGIzi4BoIZYjuPotvxqH3bUvyK
         71rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zS9UwOO2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bf6fdcaa04si13367546d6.56.2024.08.15.02.28.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Aug 2024 02:28:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zS9UwOO2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1seWlm-0000OX-1X; Thu, 15 Aug 2024 05:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1seWlU-0008Vq-RR
 for qemu-arm@nongnu.org; Thu, 15 Aug 2024 05:27:30 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1seWlR-00059y-KI
 for qemu-arm@nongnu.org; Thu, 15 Aug 2024 05:27:27 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5b7b6a30454so1089063a12.2
 for <qemu-arm@nongnu.org>; Thu, 15 Aug 2024 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723714043; x=1724318843; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bpyz4uA4VLTLT6Q2iCunXp01ueOc6QiK3D70B3lOBqo=;
 b=zS9UwOO2E8EbG6zF2GchORxcM7kP6TdXvK6vE9S2vQU7GoP5r0j0S+V3iTeCU86NYI
 n/Dp3nrVtOKDm6j9wGaZgg7MZ8V+XTrBofhmZ6PGh4SLRjrRssJk1Fy2KTD7GjXH9BxA
 vuj8mXnAS5Cm/pKTRIu8OYHmOE5Wn+HyxFgmMf6CJu7jrW4uEi/r30vORDxbBG1cfDT5
 ree/DVKo3TUApCvztxSxriKVMELca08wpxMcOJBHyCX6xEssP2r/rtKi66COLXYEaWD0
 0EMsFqGbVHvAAvG0/bP1ezE3WFFUbQK6rcHVW1XCzCFpPCwJ7SeGrrFDZC2R8G2UiH0u
 4VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723714043; x=1724318843;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bpyz4uA4VLTLT6Q2iCunXp01ueOc6QiK3D70B3lOBqo=;
 b=HmGFS+7TdVInBN4P34ETIVM1kppz6/Kv6qz5dAskA9moH8YHdbdPlpdQwlK8b4lnZg
 jgjWq8lgyLJMB/0srx68qB8ND7GfJCXfC2VJbThmyEiGgiDF2dk5cTvX/dGNya2x5wD5
 +k8GD0rjBuu7y6nPDS/DxRruEbYJYk0p25Xw2OP6F5irKlWDyJclwy8dWujRwyw72HEG
 1gCbMNUJgpfbl3dFLKkol9vI6KuUflWzCvBXWeWeusSNWO3wYLPMrFxQH9PqQCfEeMic
 snOG8ORlZPrHL/+OfdsFJAMHZYxtBARqhgYJQwaGN8F2Q6ZBidR2ptPthaBuoVsY99Ra
 owcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMTIM8l43sulEwaXNDFMYHrBCL1X0WcusmQjgDurFmtr3yJiO+/QE5HAC2wdA/8QRQw7l4mCQZxC3K0GWSy83Puz05
X-Gm-Message-State: AOJu0Yy+ht43VyqHTpY5xubfcyyMjCl54P0VSLytWFfmcil8X+MNadE6
 fq99OrrDrHjcY1E2nf4FWd5ywWOVhH2FIFjwy7RmqHkfKk6wTHV+Z2XzkEBwwL8=
X-Received: by 2002:a17:907:c881:b0:a77:e55a:9e91 with SMTP id
 a640c23a62f3a-a8366d3ffabmr370495966b.19.1723714043144; 
 Thu, 15 Aug 2024 02:27:23 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.202.43])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83839356besm72638466b.99.2024.08.15.02.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 02:27:22 -0700 (PDT)
Message-ID: <d8ffe38c-756d-4187-875e-e6697631b7fa@linaro.org>
Date: Thu, 15 Aug 2024 11:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] hw/char/serial: Remove unused funtion
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Paul Burton <paulburton@kernel.org>, Stafford Horne <shorne@gmail.com>,
 qemu-ppc@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Joel Stanley <joel@jms.id.au>, Eduardo Habkost <eduardo@habkost.net>,
 Sergio Lopez <slp@redhat.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Jan Kiszka <jan.kiszka@web.de>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Jia Liu <proljc@gmail.com>, Helge Deller <deller@gmx.de>,
 Max Filippov <jcmvbkbc@gmail.com>, Subbaraya Sundeep
 <sundeep.lkml@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-riscv@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Song Gao <gaosong@loongson.cn>
References: <20240814181534.218964-1-shentey@gmail.com>
 <20240814181534.218964-3-shentey@gmail.com>
 <22fa9014-2923-b501-e38d-f5dd1e53d15a@eik.bme.hu>
 <11aeac5f-1985-494e-941a-5115d5e679bc@ilande.co.uk>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <11aeac5f-1985-494e-941a-5115d5e679bc@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: aPPRU8vxIqvd

On 15/8/24 10:24, Mark Cave-Ayland wrote:
> On 14/08/2024 22:38, BALATON Zoltan wrote:
> 
>> On Wed, 14 Aug 2024, Bernhard Beschow wrote:
>>> The serial port's frequency is set via the "baudbase" property nowadays.
>>
>> Please keep it as some devices might have registers that set this freq 
>> and this function will be needed for emulating that even if it's not 
>> emulated currently.
> 
> Why not remove the function if it isn't being used? In general having 
> unused code lying around is bad as it tends to bitrot.
> 
> If someone did want to re-add this functionality then you would likely 
> want to do it with clock API rather than using a separate function.

I also ended using it in a branch including this old series:
https://lore.kernel.org/qemu-devel/20200806130340.17316-1-f4bug@amsat.org/

Not my priority anymore, so I don't mind re-adding it.

