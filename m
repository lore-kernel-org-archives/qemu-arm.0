Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp880786lfb;
        Thu, 22 Apr 2021 18:17:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzesTpjwbx5fiCR3lFBwhIQB/+BzXxguoFfz6f2StzdnolbpAcVEkNG7WkkSRHol6c4fGcu
X-Received: by 2002:a05:620a:20d5:: with SMTP id f21mr1603992qka.135.1619140630819;
        Thu, 22 Apr 2021 18:17:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619140630; cv=none;
        d=google.com; s=arc-20160816;
        b=x62X6CQhKvGaPmLnKxMDfJtFKh2VAY7PLLOX2wycC5n1EjRHXtasme+7ItYsGl5e65
         pluitVFXFVgKRKe49HINM0Qb8cxmgC2kpd2oR4+kf0ZwSH8/styGpCzHjyrKZ+ojzOEY
         uvBM42rrE9qHoEAqlxHQ88qUf83HRoIM7S5QIkaziWbG4CwjMHNPG46sHWaprmW46rj3
         zXLh2HdgFmWlg1BQuIQDkgH4tujZhTgWXdFoaf7K8owaHLGj4OGm6GVUAm28LwAu25iZ
         D91zOYFzvNAGrx+NKZRUe0ntrpx8DQXKhKeREVScZLtQeYoHEmk+rEslTEmo3kMcG04I
         XxcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=O/kCEpTC4yHiCkbdHvM/Imm+Gi/Aq1a3B/+HkgrDKXc=;
        b=MumWqxkWDpM1TRBMJsQrg0mCqNLVWM/EhlIoUbOwKAqAi2I+xQ/F2nqu9zKsSrpUIG
         flIVKPLlEjQvbejtvfQLcDb6zsDRuwaN9vz16RS3XdZfSsrvhViNIDqVMGFT9PXV4SCP
         YHtLFqO10Z68dtwuCpGos1qjDvntkizJ+a7M5WT0hW3/eiqKhH5ESecDOMam2GnzvtLX
         ki2tVUpnN3uEUul1+WuNINL5bnxE3+s9Ix1+MbRKowtfCMgDgObFwy3wuTI8T8vpuUjU
         3RtS+tDsmN18m32SVLlJ23VaWd0Fl3LcbVnzKjn3z5HbHUs+kwdiSKXDxyFrIVJXGqkw
         Zu5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M3Lw0lUQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20si3017569qtr.276.2021.04.22.18.17.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Apr 2021 18:17:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M3Lw0lUQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZkRS-0007uI-68
	for alex.bennee@linaro.org; Thu, 22 Apr 2021 21:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkR1-0007tZ-1F
 for qemu-arm@nongnu.org; Thu, 22 Apr 2021 21:16:43 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkQz-0003mV-Fh
 for qemu-arm@nongnu.org; Thu, 22 Apr 2021 21:16:42 -0400
Received: by mail-pg1-x531.google.com with SMTP id m12so13380281pgr.9
 for <qemu-arm@nongnu.org>; Thu, 22 Apr 2021 18:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O/kCEpTC4yHiCkbdHvM/Imm+Gi/Aq1a3B/+HkgrDKXc=;
 b=M3Lw0lUQne+7WlSZFuaG93xSzzfshNbxK4sDm20IwhQAZp4BF8hJ5C4MMCHhLjLvv8
 9jI6309DEIcsKgwyVxkLL5KVzT7do0OyODHC9ooahEAUqa8CAnMtxfF9ulPFnAfmorhz
 p5O+g6IpYRgvLSVkLJ2yTZHpaRpVC06zHv68efvHqpNysWbu/N3IQaIOZD6LstUlxz37
 20BC9X6Ch64VtyfEe6bld7yGO0FmCLMAmg/sCXZarghNQ6bO8HcoepSJDW3K5dOsx7Hn
 Ad9JzNsaqEC2iq9sN6iG2hpzfQ+aQ9HiS5QkaVutYWuEBcNgdZwy45sd/l176g03l1h1
 eFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O/kCEpTC4yHiCkbdHvM/Imm+Gi/Aq1a3B/+HkgrDKXc=;
 b=Skp+n3bpWFzBHjQgP5PIJE4L+EwzaZyYffbTOJvd8le/x1ihx2QVORgNYJl6D9AbHb
 7mojKEWJ/tmRCGJrZsq6fAnZmX3WyWfEOr4K5didCoQUxohcTXskwL4/GaK4DnW3cuFF
 kdfxcUqz9d6dEYKFiyzW5ZPa5OXO+4/ap1bwt2Kgi/VBeyYAomWZGkXNlodmvd0uMr0j
 N1y2JUM0t+BGSkujOMJVojT8YZNNiPqUaXBG9dq2JFAD6hHidq4DfhHd1MiYj072NC/O
 70X1hKmmo52nRBx18GY+Phkc3N3djQU1JRGVm+g5U50AP3sQnfKxNC80kL/0LuekpAvC
 B6XA==
X-Gm-Message-State: AOAM532LCmMSxCvcNU9g/3knVMpLMoCfAiECaGwMtM7kAluVxKZehMJ8
 AKxJFPFYeOmun872cI6C4SSwrw==
X-Received: by 2002:a63:231c:: with SMTP id j28mr1377352pgj.165.1619140600079; 
 Thu, 22 Apr 2021 18:16:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id t21sm2988123pfg.211.2021.04.22.18.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 18:16:39 -0700 (PDT)
Subject: Re: [PATCH v6 08/18] cpu/{avr, lm32,
 moxie}: Set DeviceClass vmsd field (not CPUClass one)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210422193902.2644064-1-f4bug@amsat.org>
 <20210422193902.2644064-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eeaa99ae-da4f-d76d-127e-18a8857de8df@linaro.org>
Date: Thu, 22 Apr 2021 18:16:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422193902.2644064-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Anthony Green <green@moxielogic.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6OoPR+gr6Nie

On 4/22/21 12:38 PM, Philippe Mathieu-Daudé wrote:
> See rationale in previous commit. Targets should use the vmsd field
> of DeviceClass, not CPUClass. As migration is not important on the
> avr/lm32/moxie targets, break the migration compatibility and set
> the DeviceClass vmsd field.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/avr/cpu.c   | 2 +-
>   target/lm32/cpu.c  | 2 +-
>   target/moxie/cpu.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

Do you not have to increment the vmstate versions?

Though I can't see how the version numbers would even get compared, since we're 
looking for them in different locations?


r~
