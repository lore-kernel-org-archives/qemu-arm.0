Received: by 2002:a05:7022:6b88:b0:48:25f4:1512 with SMTP id dm8csp649610dlb;
        Tue, 20 Dec 2022 02:03:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5f9cMx4NEfVs/bB3JEbqsqtJxyrl/3jKcJQb7W+Hq5N51mmI5qQHbUWXVD5n2i3PZfEmZj
X-Received: by 2002:a05:622a:906:b0:3a8:d1e:9bd0 with SMTP id bx6-20020a05622a090600b003a80d1e9bd0mr58923894qtb.67.1671530593359;
        Tue, 20 Dec 2022 02:03:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671530593; cv=none;
        d=google.com; s=arc-20160816;
        b=sRYMqZ8dDHP0Z5sYgUN1pzFCbCm0t+EJd0Xqnn//NoAPbXNrLbUVdTihM0/5HSYt6a
         LFUCpdak0EvxAx4z+LDRBGWqKrx+dJjEcDjqjChZo9LmlF3kIal317knGgF5W3z1sNeI
         uNTe4iCNv7+fx4+xxYeh5Wattk38m1nTa/IlNOv6i6eEwxSn2AuRXmtS7x2+8AndB71O
         c6DDt5plhjramlrR6HU9mi7pEqkEn+5Alos9o3H8u2cNZ8YXtiajIBijzK45wsfZVWOj
         tClVhzGbhVXOVOpcHS0Fk/1dIDK7FiVnGILm8+9UcOn2HTT3vF0d7ZShVZ49R0QUkhAN
         vt6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Rxv5T3YNaIXJXWUYsZ8FH2rXMjErvcLXb76cSywTPFk=;
        b=YKaOkSSn4fgiXlKS9T+Z3K3Yr2GG+Cak1WyMVhr2IW8QclB40hU6v4Y+v0So7pAmY4
         mzdb3NQYybMW5riPT39I4VOy/4N4x3xfO08XJzGZIE2KvGeYFfPKBeY7ueUkH62I2zeG
         KBmhSOujwl9YrE09SQwlFUIYJMF5hUkfF8ZNkRrIG4f8ufQHN15u+CBwFMiLwTmIYZ1r
         AVJ0fMqe11FzW+hl7HTIHm8iVDVTnPoz+2o0jwXXxr4NvqySl7Qj1XkgNMfNkuACbBS9
         65UkdIQjWQkHNczHXpJFqsm6GtMcODHI1ttj3hOMuqlIMoMH1A5P6mzDLI0vwbOckY23
         ulJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E2dncYPk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb8-20020a05622a1f8800b003a52fda7dd8si5208840qtb.17.2022.12.20.02.03.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 02:03:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E2dncYPk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7YzQ-0003uV-Ht; Tue, 20 Dec 2022 04:32:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7YzN-0003tR-P3
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 04:32:45 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7YzK-0002Wm-0w
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 04:32:45 -0500
Received: by mail-wr1-x42e.google.com with SMTP id o5so11155305wrm.1
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 01:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rxv5T3YNaIXJXWUYsZ8FH2rXMjErvcLXb76cSywTPFk=;
 b=E2dncYPk1AOqSGUH+ifOxk/J/LK0BnEdMWYUT11rQtGTXh+txdXxjYpuQbYZaJaNNO
 Llt8d/VqT4KMr7ZbyGm2X6qyncjc53qWqdzc/QilCn3wc+nPu3QoIvwEaQGbum4yQ58o
 QTCzh1iwg+YmaU59harzPkFYiyMuuwN0SRRLq2cigT3DUJF8wF8t5yOd4S5w5vd8bIZ9
 iQZ2QGPNOv0YRPQnZRFzrVNC4UOnCt7fscJvEZa4vcoEWE4R9B01fiHAqVdhQyi3PYZ3
 h95jW8z9t8qCes7Eu980FVOHu9cccWL+0llDcF7a2o0+569LWouQM8Lb/NAlvv2D1sXI
 Q7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rxv5T3YNaIXJXWUYsZ8FH2rXMjErvcLXb76cSywTPFk=;
 b=n6p6zV9TztJwG1IldnfCAfWtXfFBo045qaVzRu1e+sYR8yrWrDJ4MEgjbK7EzFZ4/i
 8rCuu5BYdEEjnyEDH310g81xnQ+D1Kvyc6hHz7dzE22BGd0V9RNpxjUwagtgOmGz3VHn
 twz8EQQS8wT5/iTzS/PUtzpKr6bJxbsF9sxCVVsHxnyAUzceMdinTiem8qaXZk2JLD3p
 haUbqzGFqjP8hGHZVS5mUsBIJwSAc/RhkaENDPRfWyBOZsOY0XCbF4Fi/2Uk78qMPUyx
 a/WJyOIDaYipVgpGOiErGW6QvZwYHNSsWEmmxkVBW76WpEM67kPQt3Be1UwTWQ0z3BZM
 kXGQ==
X-Gm-Message-State: ANoB5pnF1KyKX4eMr6w/MMD6FzdAFTLM5PPzECyk5pIM4HH0QYI4kpFK
 Dm3OyzSHQnDd5VL6l+1snH+ggg==
X-Received: by 2002:a5d:4e4b:0:b0:242:67f2:9d68 with SMTP id
 r11-20020a5d4e4b000000b0024267f29d68mr28197863wrt.34.1671528758164; 
 Tue, 20 Dec 2022 01:32:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 cl4-20020a5d5f04000000b00242209dd1ffsm12367136wrb.41.2022.12.20.01.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:32:37 -0800 (PST)
Message-ID: <a6606bd9-08b6-0884-ab32-f5f30cc3ce4d@linaro.org>
Date: Tue, 20 Dec 2022 10:32:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 2/4] target/loongarch: Restrict 'qapi-commands-machine.h'
 to system emulation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Huacai Chen
 <chenhuacai@kernel.org>, qemu-arm@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Greg Kurz <groug@kaod.org>,
 Song Gao <gaosong@loongson.cn>
References: <20221219211034.70491-1-philmd@linaro.org>
 <20221219211034.70491-3-philmd@linaro.org>
 <e1f13a16-e6a5-a484-8e6d-722b60dbaefb@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e1f13a16-e6a5-a484-8e6d-722b60dbaefb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
X-TUID: 33GZvi3BKD3d

On 20/12/22 00:58, Richard Henderson wrote:
> On 12/19/22 13:10, Philippe Mathieu-Daudé wrote:
>> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
>> user-mode builds") we don't generate the "qapi-commands-machine.h"
>> header in a user-emulation-only build.
>>
>> Extract the QMP functions from cpu.c (which is always compiled) to
>> the new 'cpu-monitor.c' unit (which is only compiled when system
>> emulation is selected).
>>
>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>> ---
>>   target/loongarch/cpu-monitor.c | 37 ++++++++++++++++++++++++++++++++++
>>   target/loongarch/cpu.c         | 27 -------------------------
>>   target/loongarch/meson.build   |  1 +
>>   3 files changed, 38 insertions(+), 27 deletions(-)
>>   create mode 100644 target/loongarch/cpu-monitor.c
> 
> Why cpu-monitor.c and not monitor.c like for target/arm/?

I figured later 'monitor.c' was simpler and renamed the other targets
but forgot to rename this one :/

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

