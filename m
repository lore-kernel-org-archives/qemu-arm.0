Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp472949ejc;
        Fri, 13 Jan 2023 07:26:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtQRfmme8amQ81WDz+N1tvOTO+k1q1lpOPQr6IPyTzRdKWx9hXYVHUXzPLvW+XjwP+a9Kdl
X-Received: by 2002:a81:6c57:0:b0:3d4:32f:7ef9 with SMTP id h84-20020a816c57000000b003d4032f7ef9mr26179563ywc.0.1673623588302;
        Fri, 13 Jan 2023 07:26:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673623588; cv=none;
        d=google.com; s=arc-20160816;
        b=oqov0lsDUmEAQAhn6QwbgCSqAH5StRyE7TJ4Am2elCqaG7APwL6+bVBgKJRlq3qysT
         MrqT/Z/Nq+dgmycEJxnHogtf/KFaZw7Wx1+nCGvVuKlXJTjmeTeCyxZEBVBbMbN6t79I
         flqc9YmE2KKU8gy2f43BheH4ywZnyUOmaQk1HaYouZFDcm4JD1fX1RmTV8sLri/v8dDs
         trm8OdPtn3JNHlrFwL7bYkKHsTKAzldSlDDbFznag77GursnN/S8Irqs8THktVeqDaHf
         IAh5OjxPYjDsblPiXV1bNBlrJ1lnEkdmXRb43bPxuUCH6mya/J3kacnO/WNz4zXteqcg
         JtYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PAlvBiYpAKfSZQu+t9WGZ+3cXmxbPgKUUNeBoA3fAF8=;
        b=dTi6OBrXYSGsqbATP9THFLLRJm2dCaM2ABIqZV3DP7cuMkMkh2Tlhh/8p2NIHX+GWP
         tlgEumGymp/d5AegejOyINeL8kDhd9/1wumHC8dkClvHHY11cj0wL3r9otIXU9g06SVm
         VdmtioehCb7z9axyZfZOe/lu6InttkwcwDQH2wEsdd6s7sIlZMIVJM7PPChYnRLU+XaP
         owoFSADvCizo24W9F0j3yA3eH+7Mr/o9EIGdWYUuaO7QJNA6zYzw1nk5J/1EkyAXlyll
         ZzBAm+wF8mLAJzmumRL4nF2lpeM33fSTIilSyIOdyViPdv5BoHZsKmKk3XLH1lUmLojr
         x42A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ParyJ4xb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id l19-20020a05620a28d300b007044375f84fsi13220037qkp.234.2023.01.13.07.26.28
        for <alex.bennee@linaro.org>;
        Fri, 13 Jan 2023 07:26:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ParyJ4xb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGLGm-000224-Cd; Fri, 13 Jan 2023 09:43:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGLGj-0001uc-Ei
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:42:57 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGLGh-0001OY-Ne
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:42:57 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bk16so21251395wrb.11
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PAlvBiYpAKfSZQu+t9WGZ+3cXmxbPgKUUNeBoA3fAF8=;
 b=ParyJ4xbVr1lrXZWtvwJtf7HYZkwMs+Q3d6M+g/5YDiMeR/hmP30dDnpefxCrPKBzu
 niQPVCEshmGNvcT7Q0c1j9U7JSymoOSB11kVRzrdvKQiJvUrDcCY0nymsPOLeOz7DPm1
 JsWTBXo9V2JoprFiqCcocZ08b+SVX2qP4EL7GpoXy7tToH5Aj1enuPYIcGxMOOPF6Wct
 JDZ3cr8nN4LsksFcLZvKQB8TLPUs6GJEhiQtblb2Os+97qWBH0I071MNjZw8ym/nRVtT
 2KWB2iXlHhhFS4/6rdj1u8os5O1ZTU3XnzmhN8coi4AsgW9W2QaFt5SRtvs81XjSkT2g
 NZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PAlvBiYpAKfSZQu+t9WGZ+3cXmxbPgKUUNeBoA3fAF8=;
 b=gaeanpXnbVdwrHucdkQohj4aQFFvBLaDxYttAulmbF4wm4p8sdZ5q8bBXgb+L5QK54
 jBPMP6GlrcrLOutcdHkExCq5OkOloJBK8R/97dkHndjZdcKocTjwBrh606S7W8e/hepf
 A9Q9qbB4G0doi1TFeYhf5v8xbArMkW+EHjoXKlJA2qsTJGpwwmfVlxTdkjqJT0e3nUxg
 9cvVsVYOFDhZAuYzz6nK43eGlp+JI2idwS4hm/LF+tpLLeVYsStjCy1LbyMIQJo6t8S9
 TA+Jdz/A6NqOqCWCqwqp/DZlmCAb9sxp5WXBmPwE+0tKqgogztu0Eeuhc5PI+DvZmyCg
 cjhQ==
X-Gm-Message-State: AFqh2kqY+vdqlnYrjnCZPSONXKI6adPKLw5KXSBFMWJ7rNbwUUjQjB6w
 0G6OfuOcDDuss+Ml4K8jSmFNRQ==
X-Received: by 2002:a05:6000:691:b0:2bd:dbbb:e7df with SMTP id
 bo17-20020a056000069100b002bddbbbe7dfmr3541577wrb.62.1673620974111; 
 Fri, 13 Jan 2023 06:42:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k2-20020a5d5182000000b00236545edc91sm19375778wrv.76.2023.01.13.06.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 06:42:53 -0800 (PST)
Message-ID: <d8f97300-561a-6958-05a3-2789d139f9c4@linaro.org>
Date: Fri, 13 Jan 2023 15:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND v2 0/5] target: Restrict 'qapi-commands-machine.h'
 to system emulation
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87y1q61qrz.fsf@pond.sub.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ibeQgg3t4xFQ

On 13/1/23 14:57, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> [resend fixing my last name typography...]
>>
>> All series reviewed, can patches be picked by corresponding
>> maintainers?
>>
>> The "qapi-commands-machine.h" header is not generated in user-only
>> emulation. This series removes its use in user-emu code by moving
>> the QMP code depending on this header into a separate sysemu unit.
>>
>> Since v1:
>> - renamed cpu-monitor.c -> monitor.c on loongarch
> 
> Quick drive-by remark: we usually name C files containing just QMP
> commands SUBSYSTEM-qmp-cmds.c, and files containing just HMP commands
> SUBSYSTEM-hmp-cmds.c.  On the other hand, the existing monitor-related
> files seem to be named target/TARGET/monitor.c.
> 
> Keeping QMP and HMP two separate is desirable, but not required.
> monitor.c is a fine name for a file containing both.

$ git ls-files | fgrep qmp-cmds.c
block/monitor/bitmap-qmp-cmds.c
hw/core/machine-qmp-cmds.c
hw/pci/pci-qmp-cmds.c
monitor/qmp-cmds.c
qom/qom-qmp-cmds.c
tests/unit/test-qmp-cmds.c

$ git ls-files | fgrep monitor.c
monitor/monitor.c
softmmu/qdev-monitor.c
stubs/monitor.c
target/arm/monitor.c
target/i386/monitor.c
target/m68k/monitor.c
target/mips/sysemu/monitor.c
target/nios2/monitor.c
target/ppc/monitor.c
target/riscv/monitor.c
target/sh4/monitor.c
target/sparc/monitor.c
target/xtensa/monitor.c
tests/unit/test-util-filemonitor.c

Do you rather 'cpu-qmp-cmds.c'?

Or is your SUBSYSTEM the $target here?
Because , target/arm/arm-qmp-cmds.c sounds redundant.


