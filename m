Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp463061ejc;
        Fri, 13 Jan 2023 07:12:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtKycquVi0lAKiXBDYMk7FjseEJ1dOXvDFU4clRBbZmPCusOewVujZcIS1NA2R6k94r2guC
X-Received: by 2002:a05:6214:5443:b0:4c7:80fa:755c with SMTP id kz3-20020a056214544300b004c780fa755cmr117736902qvb.45.1673622723523;
        Fri, 13 Jan 2023 07:12:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673622723; cv=none;
        d=google.com; s=arc-20160816;
        b=a+Kg0G1tN8KnN3QIu9TSoWqBJTWgj8gq5kiHpsknoIbhmFSWcazKRoNGAJUiqVSWEM
         LM23CtCr/HbLTu6RewKYIiVWjWH+945vAZm9nechhV2v1wwFbErjpEcRmbRyyo83mPd2
         WgWodt7DgNdArLYZK17+O/SDkuVF2UgUdUQjvEKRQBxkRJ0RTdblLP7ZtaFwVJ38sqLP
         l+qfnedBXLgmW8hEMgX7LHcX9lvszlXwqLI88SiHqZbuLy7ZER5i8E1s+OXUxRtQsDjX
         i62OCaSE009O5p7sfYKMuHbZJbPk3YxKSbuCWXhDeepXw1Q8o0JDGVtM79BXXx3nlKVd
         UEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nl1xDVoqTlRUrHVPCcsKQv1teTsrFu7kGyxVIDa0GVU=;
        b=N0uW6nvZCRSJXChoK3sxrXzGHs8wScsrCzc2SoVfUH4UOOzxXuRHh0MPHim4/bI4Oe
         c7oDJAfJqotuUPmcQWvdIUaaL1pVO2RTxtEEewBpwzaRPPrgluUgaNWM8hSJ4vtvSHoQ
         sAiTWbvkA8xb9xSnwbWuOA36crqkyKrSbGA58ArkTqEm1XRjFo3cjFX0JVMwsknm+24a
         mKUsW+P057GE6zGB8VjNMtW3T4bWSpqSPRlDwD0mymyURqmfYLeO14k/95L952iB4kpZ
         Le93QTFfpNqHwSgIQc8SxaHSgpWFcisTRE50NABE2EAuWHV6lkzsM29T5mHnjDsrVxnQ
         rT+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MZbGzEfG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020ad45bcc000000b004c75e51845fsi11875237qvt.292.2023.01.13.07.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jan 2023 07:12:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MZbGzEfG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pGLRF-0000kc-BT; Fri, 13 Jan 2023 09:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGLQy-0000WZ-BY
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 09:53:33 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGLQv-0003NJ-An
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 09:53:32 -0500
Received: by mail-wr1-x433.google.com with SMTP id z5so20246961wrt.6
 for <qemu-arm@nongnu.org>; Fri, 13 Jan 2023 06:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nl1xDVoqTlRUrHVPCcsKQv1teTsrFu7kGyxVIDa0GVU=;
 b=MZbGzEfGbVm9eML+3U8PkBQctaaR5+ehiq9NCikiqrFt+qwz+Rr9puCy9RfDaj9b7b
 ooca3VA99+FMzGuRw9S+5fWSiZGvN9ercyZbQ1S9tu91M87g9laXLzFm9rXEJoLrlfRB
 K3kbJIAgplTds3FlUVqrQABM/I/AfJzz0DgRvsuAhMF6Hy6c8ixxIG1S/uG6YliElZX5
 XNkkQZ1LIybpmZuxmHxF6HqDmGrKVEymm2J5hze+TmAjWjN/s+ysro3FwYub/dsFwmBK
 jAw6uQE+JWT2SmKlXuIwjRAIpp0kKmGa5cgVVy5Ch67upbGamOBZZiWW/IOQi6z4ETwP
 idQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nl1xDVoqTlRUrHVPCcsKQv1teTsrFu7kGyxVIDa0GVU=;
 b=t+vtLtRL3uwmv4HgXyefpqDB59Er9DKpHlRL/fGaQL9poOVvvkPUUPabPui6TuOOEV
 mi7qy24R7QdxvWY3Q2r6zr936GND3g3D2DYH4FnwvtsWXgDze7LhQhVYab1cGmejR3lg
 BOWJi8tqa/nIzqgdcKj08hhnEvR4nI07jV/alqEQnuXQEaHKY2snPdaSoH1bCRW4PiwH
 IhoOk+ADMKeJEmM07MVDn3R6GF+eYBODFiL4WeYJV2X0x59LSOC20k2rRquh1du2xoXE
 hB5bxSPmlyCcGeCZpeGgy7+10lPFwmQnOlkrseCdERbPnIQOm8iOYKBBdiJUr3RhviG7
 hQHg==
X-Gm-Message-State: AFqh2kpNdOey+kdxGS3z4a+rfKkKS0mhfrsoIhKA6CvwDfN0UNrmXSss
 HPLtcPR0AeG6uK2f+AhJhy3ikw==
X-Received: by 2002:a5d:4a4f:0:b0:2bb:f255:6bb4 with SMTP id
 v15-20020a5d4a4f000000b002bbf2556bb4mr13823940wrs.25.1673621607303; 
 Fri, 13 Jan 2023 06:53:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l7-20020a5d6747000000b002b57bae7174sm19236567wrw.5.2023.01.13.06.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 06:53:26 -0800 (PST)
Message-ID: <1f632a48-981a-95a0-6527-e0bb65034d92@linaro.org>
Date: Fri, 13 Jan 2023 15:53:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND v2 0/5] target: Restrict 'qapi-commands-machine.h'
 to system emulation
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
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
 <d8f97300-561a-6958-05a3-2789d139f9c4@linaro.org>
In-Reply-To: <d8f97300-561a-6958-05a3-2789d139f9c4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: BqrfIA5GNqgG

On 13/1/23 15:42, Philippe Mathieu-Daudé wrote:
> On 13/1/23 14:57, Markus Armbruster wrote:
>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>
>>> [resend fixing my last name typography...]
>>>
>>> All series reviewed, can patches be picked by corresponding
>>> maintainers?
>>>
>>> The "qapi-commands-machine.h" header is not generated in user-only
>>> emulation. This series removes its use in user-emu code by moving
>>> the QMP code depending on this header into a separate sysemu unit.
>>>
>>> Since v1:
>>> - renamed cpu-monitor.c -> monitor.c on loongarch
>>
>> Quick drive-by remark: we usually name C files containing just QMP
>> commands SUBSYSTEM-qmp-cmds.c, and files containing just HMP commands
>> SUBSYSTEM-hmp-cmds.c.  On the other hand, the existing monitor-related
>> files seem to be named target/TARGET/monitor.c.
>>
>> Keeping QMP and HMP two separate is desirable, but not required.
>> monitor.c is a fine name for a file containing both.
> 
> $ git ls-files | fgrep qmp-cmds.c
> block/monitor/bitmap-qmp-cmds.c
> hw/core/machine-qmp-cmds.c
> hw/pci/pci-qmp-cmds.c
> monitor/qmp-cmds.c
> qom/qom-qmp-cmds.c
> tests/unit/test-qmp-cmds.c
> 
> $ git ls-files | fgrep monitor.c
> monitor/monitor.c
> softmmu/qdev-monitor.c
> stubs/monitor.c
> target/arm/monitor.c
> target/i386/monitor.c
> target/m68k/monitor.c
> target/mips/sysemu/monitor.c
> target/nios2/monitor.c
> target/ppc/monitor.c
> target/riscv/monitor.c
> target/sh4/monitor.c
> target/sparc/monitor.c
> target/xtensa/monitor.c
> tests/unit/test-util-filemonitor.c
> 
> Do you rather 'cpu-qmp-cmds.c'?
> 
> Or is your SUBSYSTEM the $target here?
> Because , target/arm/arm-qmp-cmds.c sounds redundant.

IIUC the SUBSYSTEM is "target" so maybe you meant target-qmp-cmds.c?
