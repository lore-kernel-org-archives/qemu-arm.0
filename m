Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp311103ejy;
        Tue, 21 Nov 2023 00:11:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeqMK+trR7BnzbxCwp28sDwGSQ0iAlUiMcR/jec+Bpp0RiOheWeyDxW1uSp4G4nusnJhrQ
X-Received: by 2002:a05:622a:446:b0:405:37fd:be80 with SMTP id o6-20020a05622a044600b0040537fdbe80mr11067827qtx.28.1700554313124;
        Tue, 21 Nov 2023 00:11:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700554313; cv=none;
        d=google.com; s=arc-20160816;
        b=fDi0vA7P0+LraA7t7Aeob15OO+lpx/OYyHpa/ZZk3/HzUMHpnwtYHlsUUL9/QXMKdQ
         4GsmhFX3hrdQjobOfcUvVfDMJj4p9YHupt+xYlbfFqWmgPrRNjqzfnDCRi8hWpb8cLca
         pHFVsDjGuzlJhadipd2h1wGpxbGLAklWCNMqdI5WlEX4z1dNTIOu7sHxzZZ7hiyMccCz
         HOVzUIQXJPlTtjrdubHZohq27o5eOjXnhzfCV0vz+x3S7sYr+d8JM2619lVVUITgTVtq
         2H1aRXHDiazH1pTxWMkUZXezaM6gmDB97sPZEh5n0KuMDPvkHMFZ/oE6YbwNWHNg8HN3
         XUhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9Y8iJLzZgVQddiNZxqZdU2o2KVrvF73/lYzKKDQsnis=;
        fh=uTHwqGPPCsucF6bwjoAfljT8t8GV+PGJztd6SSTa8cs=;
        b=edKgpMHrRUhs17gwmq+gbSpJisPFhnOZiPUDO5OWTyf9ssS8nrQYdNBqZQv6Cw7yp0
         LT5VaPLhV/pTC1+6d4Lq5tbDUJPnK/Bpv4SxggNQwM3naD/Ca+ZVtoMTNqlzykv9glWe
         MbPrGdE8RbLCqO4T5wlISogbUTHjnF3ebFPQ6dXVxl9AYrOmpXB0xNAwa2wVl6FugowD
         fSUzGnUqbOmm8eXmD/k9NR3MhODOlLt5lRn9vSeh98xRWrGhAYUw4cTBenODWpYSgKiZ
         0E5v8hB4B4M+jPik0z38Q60Lw8+cI+HAg/SsoXq7iuSuWHk1vA+UYK6vEAXEVf86AUM4
         ULHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C2Sufqgw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fc15-20020a05622a488f00b0042370603d7esi330617qtb.449.2023.11.21.00.11.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 00:11:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C2Sufqgw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5LrH-0003T3-D9; Tue, 21 Nov 2023 03:11:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5LrG-0003Sl-GN
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 03:11:46 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5LrE-0000VD-Qw
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 03:11:46 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40891d38e3fso20090085e9.1
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 00:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700554303; x=1701159103; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Y8iJLzZgVQddiNZxqZdU2o2KVrvF73/lYzKKDQsnis=;
 b=C2Sufqgw3s0rolNBabjnGnWb7Ie/09kiiSC75W1mOr9ytYO3/gRpX7rFxzt2o1YEC4
 JOV/6NC2KV6xbtXr2hJU0BM64/I49mMBB0XhgKh6MqnboS8HaSqj0+O8XtcG8PJjWbfI
 TBbN0G5IULfPqewc6QQy0E971a+KeDm3xxdpfthxwc1+vBUCbAw3ODdfjzwagmv9NIik
 vhZvexhCWu/20I+Mpt6Sg8Ic9VoHPRyyNVYUQDfOTr8bQ052Gta9XB0bQCNlVXVYXRVC
 DCz17niYlx5aQCKjJ+O+9dFFIScmUevFBlD2kGlxZIyXtR2XQtYtFDpGRz4oG9uD7H+Q
 UF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700554303; x=1701159103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Y8iJLzZgVQddiNZxqZdU2o2KVrvF73/lYzKKDQsnis=;
 b=Lv86Adfy1gjXHUXcTxAPQ7bXRyI0zyoTb3xrFHVPD2Sn2RvWFhHIOzP4NZL2gPpZm8
 63cd+8HRPb18RYn22TenKLff0uk+YOtHva5MidR9HbXLjufzKY2LxUwUo0ZOujD6tSXh
 aWnKrsp+PnITT5RmV/7izRa773iyGddBEXAxpBcFzIbuf9ssN30q01m5fEHWuVbBEvSi
 4qxsexxfC91a6DnEALsSdMhlYTtIBB9dhlsZxEEC8ZRpqcI5E/w+VCsjEs3VqWyqxEko
 xtcwu3isuR3CVUbSYA7qQU/RvQYqA1qeW2m+V7Bzr/LjQvprQkkCVf1XGnRm+YSiwJ0X
 H7ug==
X-Gm-Message-State: AOJu0YyHA6UfXOAynHE/4iMEsFBgd+2OXn9OO6HJaFAlnr7I56HUnG5I
 66RsQDRikvuBYZkWC+atucUFJg==
X-Received: by 2002:a05:600c:3103:b0:40a:20f3:d126 with SMTP id
 g3-20020a05600c310300b0040a20f3d126mr6688351wmo.6.1700554303060; 
 Tue, 21 Nov 2023 00:11:43 -0800 (PST)
Received: from [192.168.69.100] (lgp44-h02-176-184-8-219.dsl.sta.abo.bbox.fr.
 [176.184.8.219]) by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c510700b0040b2ae9ef5dsm704776wms.36.2023.11.21.00.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 00:11:42 -0800 (PST)
Message-ID: <bc92d36f-7dcd-461e-a151-4a6e5bd072ad@linaro.org>
Date: Tue, 21 Nov 2023 09:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2?] hw/arm/fsl-imx: Do not ignore Error argument
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org
References: <20231120115116.76858-1-philmd@linaro.org>
 <CAFEAcA-YRPL_UOu5JPwfY4yRU=USk678JayDjqL=DKQjv+SWWw@mail.gmail.com>
 <87learmww9.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87learmww9.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: iMY2SzU+qmei

Hi Markus,

On 21/11/23 07:40, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Mon, 20 Nov 2023 at 11:51, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>
>>> Both i.MX25 and i.MX6 SoC models ignore the Error argument when
>>> setting the PHY number. Pick &error_abort which is the error
>>> used by the i.MX7 SoC (see commit 1f7197deb0 "ability to change
>>> the FEC PHY on i.MX7 processor").
>>>
>>> Fixes: 74c1330582 ("ability to change the FEC PHY on i.MX25 processor")
>>> Fixes: a9c167a3c4 ("ability to change the FEC PHY on i.MX6 processor")
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>
>>
>>
>> Applied to target-arm.next, thanks.
> 
> With or without my commit message clarification?

I didn't get your email on this patch, but per the other
ones on similar fixes:
https://lore.kernel.org/all/87cyw3mu4r.fsf@pond.sub.org/
https://lore.kernel.org/all/87il5vlemo.fsf@pond.sub.org/
I assume you want:

   Both i.MX25 and i.MX6 SoC models ignore the Error argument when
   setting the PHY number with object_property_set_uint(). If this
   @errp argument is set, its following use via sysbus_realize()
   might potentially triggers an assertion in error_setv().

   Pick &error_abort which is the error used by the i.MX7 SoC (see
   commit 1f7197deb0 "ability to change the FEC PHY on i.MX7 processor").

If that is OK with you, Peter, do you mind updating the description?

Thanks both!

Phil.
