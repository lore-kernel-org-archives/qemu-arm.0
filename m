Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp554701ejc;
        Fri, 13 Jan 2023 09:28:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs7U5zX2pFe4LDi0uU10flcqOZsZMctGkYNBuuier1/8O7EZ+dcJYlCyDBj5ds+K0lU9/n9
X-Received: by 2002:ad4:4482:0:b0:534:9c6d:803c with SMTP id m2-20020ad44482000000b005349c6d803cmr1650288qvt.11.1673630905310;
        Fri, 13 Jan 2023 09:28:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673630905; cv=none;
        d=google.com; s=arc-20160816;
        b=XsgXsyXN7N3R89Gkmy0PmyBNSZ3dYIQJWKPlGJn16Sde3+e+IiAeiv9G5qsSLuWcZf
         S8xSBGZsRnc/2p/96q8ghumokKbK42Lda7qK+eHgEUVWwpNpvV267uiioVl8IlRoZF6J
         /+HmLYe+K8OSLZl68HpmIBeyvPLs8ZPxV0VFD6nURYoE63rUgieCb1Js4KBWmUR1052X
         So8I+KYhaZEX190nNYKb+wAAtBulCQzcT7Ew2pbfjlsu8uD+L6kFJjNNGIEmmbk1AGLv
         vyTaG0VlPT9/z3DDeX8evWKSpmbuI5Fk+mpYcHNMo/Kfqc8ZkXnluKtDM/MGEh5sffCQ
         t3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vvrQQwP/YiVngYe/yHkxoQ+tXK29VdqGSrWKX+pnEYM=;
        b=VaHpoAOzoGW8QWGvUZPBlUzu36w4PUccd213IG5NRscwTqdJwczv3znqrAjQWubwi+
         8T+j4A7zZL1Rub1W+yO4b89Hs5t1z316H7TwMUBvhJEgqk6Cm01Qnf712eezgImCHKJl
         wyGEYpL0ECe10uSg4XseV2vEX6ZWYKLE5noadXLFn8frnze1yzsOeI8jQACnFLTvZaFT
         gFn+qT6j0Q2SuDA6QX9iCZn24w270WWh3xBzjAVuExPauLkIN1iAZcdJxuKIIUP1ffgI
         GaObm2Yc7rZbz/O6L37ddxLvxBKga9PSNJafykWlIoTimekoN206MWYLcA4tPyfin5a7
         KgHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RgNIy/ff";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15-20020a05621421af00b004b1a7a78b17si12156981qvc.387.2023.01.13.09.28.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jan 2023 09:28:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RgNIy/ff";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pGNkB-0003nG-OB; Fri, 13 Jan 2023 12:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGNk0-0003iD-Sh
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 12:21:25 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGNjy-0002CO-Aa
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 12:21:20 -0500
Received: by mail-wr1-x42a.google.com with SMTP id co23so21713585wrb.4
 for <qemu-arm@nongnu.org>; Fri, 13 Jan 2023 09:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vvrQQwP/YiVngYe/yHkxoQ+tXK29VdqGSrWKX+pnEYM=;
 b=RgNIy/ff1hBbAFSyLfv38nGPGLB8YbO1ylubcPMErWtaV4E38dDcyWhOXerbOJShql
 IGy9BK+0NzI2B2twju08wdxAddQGddFeyhTHrKKmv+sxwpjsnzO2UBRBtNDR8BWDQJka
 sifsUMypzROL/ef9SIyds2jWfAAuHp9N+jZdBM/2YIS6xdQI78UA91afP6PaeOH1Q1p+
 22HM8AGpT0vgYYci/BciXrcHUAZCkbL+aOo5ZaxOsWbnQb7HkhhlZrXRH7FUkSPdKFCf
 eHvQoeJzIxtLtOGT/PA3ZPiqjOqFa7aIgCHdxKj50AYXCYpwaK/lPpNJT4e/gZPZhfFj
 iG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vvrQQwP/YiVngYe/yHkxoQ+tXK29VdqGSrWKX+pnEYM=;
 b=wCJm1Rhoqj9aVKLBjD1hq9ItKbdZoLkAtKxvfshf61MJtia/eFmhiDZ9jInRaOkPU8
 d0xNM4bCtgwVvovi7mAOk8n/5oWaE5aaj6APS3W2FmIrKpW6khyty9CuEQLBgzXMNF7U
 glcOLNVMF76yBqpGnp6fcar8gKnubCyt52/7R1yIm9Efq3SdPBNmJK1eNh3bIayyrJnl
 HEwtvsFmAvrRsPb7km7o65O6Gy8u6a/nb0qNo3bPpbGkx14KL0gQQmC56EG6sDW+i4Mz
 oADMXdvCVSYs8tFszP/xrn1mltu949kNOObgk94D9vmIm9NuHNAY9T4qYPJm3jjwBZvv
 StLw==
X-Gm-Message-State: AFqh2kq0Gq0jeAUFezy0f+P5K+cksmOLq69LWpXWCC7tgN5bvyOxr9sw
 3bzesduDq6QPyBoqtm+4rcVczA==
X-Received: by 2002:a5d:6385:0:b0:2bd:e217:e1d with SMTP id
 p5-20020a5d6385000000b002bde2170e1dmr2268206wru.52.1673630476593; 
 Fri, 13 Jan 2023 09:21:16 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q18-20020adfdfd2000000b002bdc129c8f6sm7884681wrn.43.2023.01.13.09.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 09:21:16 -0800 (PST)
Message-ID: <de1ba5eb-c430-51d1-64fe-8b5c337160bd@linaro.org>
Date: Fri, 13 Jan 2023 18:21:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND v2 0/5] target: Restrict 'qapi-commands-machine.h'
 to system emulation
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>
References: <20221220111122.8966-1-philmd@linaro.org>
 <87y1q61qrz.fsf@pond.sub.org>
 <d8f97300-561a-6958-05a3-2789d139f9c4@linaro.org>
 <1f632a48-981a-95a0-6527-e0bb65034d92@linaro.org>
In-Reply-To: <1f632a48-981a-95a0-6527-e0bb65034d92@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: asYr+PYwcOwu

On 13/1/23 15:53, Philippe Mathieu-Daudé wrote:
> On 13/1/23 15:42, Philippe Mathieu-Daudé wrote:
>> On 13/1/23 14:57, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>
>>>> [resend fixing my last name typography...]
>>>>
>>>> All series reviewed, can patches be picked by corresponding
>>>> maintainers?
>>>>
>>>> The "qapi-commands-machine.h" header is not generated in user-only
>>>> emulation. This series removes its use in user-emu code by moving
>>>> the QMP code depending on this header into a separate sysemu unit.
>>>>
>>>> Since v1:
>>>> - renamed cpu-monitor.c -> monitor.c on loongarch
>>>
>>> Quick drive-by remark: we usually name C files containing just QMP
>>> commands SUBSYSTEM-qmp-cmds.c, and files containing just HMP commands
>>> SUBSYSTEM-hmp-cmds.c.  On the other hand, the existing monitor-related
>>> files seem to be named target/TARGET/monitor.c.
>>>
>>> Keeping QMP and HMP two separate is desirable, but not required.
>>> monitor.c is a fine name for a file containing both.
>>
>> $ git ls-files | fgrep qmp-cmds.c
>> block/monitor/bitmap-qmp-cmds.c
>> hw/core/machine-qmp-cmds.c
>> hw/pci/pci-qmp-cmds.c
>> monitor/qmp-cmds.c
>> qom/qom-qmp-cmds.c
>> tests/unit/test-qmp-cmds.c
>>
>> $ git ls-files | fgrep monitor.c
>> monitor/monitor.c
>> softmmu/qdev-monitor.c
>> stubs/monitor.c
>> target/arm/monitor.c
>> target/i386/monitor.c
>> target/m68k/monitor.c
>> target/mips/sysemu/monitor.c
>> target/nios2/monitor.c
>> target/ppc/monitor.c
>> target/riscv/monitor.c
>> target/sh4/monitor.c
>> target/sparc/monitor.c
>> target/xtensa/monitor.c
>> tests/unit/test-util-filemonitor.c
>>
>> Do you rather 'cpu-qmp-cmds.c'?
>>
>> Or is your SUBSYSTEM the $target here?
>> Because , target/arm/arm-qmp-cmds.c sounds redundant.
> 
> IIUC the SUBSYSTEM is "target" so maybe you meant target-qmp-cmds.c?

FTR Markus suggested ${target}-qmp-cmds.c on IRC, I'll respin renamed.
