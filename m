Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp910761njc;
        Wed, 22 Jan 2025 08:59:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXqJzSHc0kFtBN6O3ZRXal3BHECtIA7ls0EHSZQjV+fV2wPa8DPdHap0B/oTACqIWXEBFb41vi7DDXzhA==@linaro.org
X-Google-Smtp-Source: AGHT+IFLgHy8ElVWwXQUxUp/5rxs7ZARQghTNhvzhko2zzMWeSlh/s2ov/QSqpoYurVsy+CFN16c
X-Received: by 2002:a05:620a:1a07:b0:7b6:d97a:2608 with SMTP id af79cd13be357-7be6321c005mr3379358585a.17.1737565150905;
        Wed, 22 Jan 2025 08:59:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737565150; cv=none;
        d=google.com; s=arc-20240605;
        b=JkpivIOTMiDnyjkpA0e3oKRapTC3sW0zZlZAawWs3IGRMlFPLiyXpk2RCrJY2rdgHA
         P/s8xXwG7T96rQ4Yf+7jwxUwuaWKYNIkhb5Gm5vRp82XmBxfUspavdt+udD/ZbJruJFB
         PlYN2H/OocGxtHiAlbjpkZYxmQxB3wJlXRd3abgPx9oQx/DcUL/L8kAYpsjgAuATIu1v
         LYyEWApG0VpiWdtSzC/0iV3ebrJB9OxnpTLmcVDyHrfZr+lybeH31CaEhQkuEoWXRKCr
         XmDKAZqi+BYgwvjlX1YHo9JsEqEX9V5NMGzlCJVm4UBUyXhGJqjOQQwxxm+EjGxpIGhK
         JDbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zBb0+Z25iBU/ZlpKFdEkVNY3Zn1H2tU+69Z2eZLvuBU=;
        fh=hJCQnDpuNhwYKxDL9SX593EWpUztKrl9H3CK1NVtV4M=;
        b=E5bRhbOXjS0UVNQw3cc4VHUux87ngbhiVAaV3+aJMvWML511rFj0GCAk+IMU/SNGwi
         fxwCBytl7kILBet+tizaeP2cSmVBTd81DTQHFq/zDhY48Qfbr+ay3YvjnsSr3I6O14M/
         mq1bPyMQm8Xg72J+RAOc93qOUXBa+g9tAQL1ZorHnB8xsLFfZL/4a64KMjAE6pqOZDmd
         9Btbswe98EvUkW0abuTbbhImH7bdkGYfteKkwp2ZQE4XNXQBeolgOYpijvuzQqMPdBxV
         nOnxqTbuPyMXt08+afUll8aBWaacOaelzg6RlWtGIIGLmaFm9xxkcCPD8q03Xz3vdLs3
         0xRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RrQhAs0V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be6146cc77si1589278185a.122.2025.01.22.08.59.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jan 2025 08:59:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RrQhAs0V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tae3x-0006tI-DT; Wed, 22 Jan 2025 11:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tae3w-0006st-5r
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 11:58:44 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tae3u-0000OR-76
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 11:58:43 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38be3bfb045so813739f8f.0
 for <qemu-arm@nongnu.org>; Wed, 22 Jan 2025 08:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737565120; x=1738169920; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zBb0+Z25iBU/ZlpKFdEkVNY3Zn1H2tU+69Z2eZLvuBU=;
 b=RrQhAs0VSbZrYnrTLHbqN35EvT30Kre9svUUEunF/0M1La6ylfZs+rZonTIEKPF9C7
 HTHNrMGfZb1lmLr4wCn5ZIGmZMqQD6nD4Y0yEhgMeqZNA6wWBkKvc3x1Vi8uwhA2TFtV
 1CNZbPW9MHw3Gqz9RspufSNCR9G7mpyz86cDXr0HxtpZCOGh99QdAKyNrd7x1ij+vkam
 CQvPyyBkagmqml/d3CQvUK2ALSFS28LmVpaEt1KLN9FcWyhNM5zEO3YJg4Gh5wkAebfu
 JoFA9F7poaD8BSRcJHrwFZxnEPetXnwtWCARpc0QhdZgzebL0Onry2o/4dyHbAZWaYPc
 6x4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737565120; x=1738169920;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zBb0+Z25iBU/ZlpKFdEkVNY3Zn1H2tU+69Z2eZLvuBU=;
 b=ormO+Wlgax8cSZIvu0dRpcvagbQyWQXD/i7jsC/STe2kaTYZmQIaQQhyCzJKsr6Hxx
 1ocZI7wF+nrg5lV4DkjFvxJ6gAKr+G0USDR8KAWlCK3OGFvqwN414mRARqGEtHX5Gmhj
 /2xCzyNclsSzz0sgPK6VUjsa9Gzi9PCP8rc/gtznczhx7iAvdz/SRx4qy7pFB+FQWf75
 32xzDO/U56yb0oZoJW2Uy1eu244NM4ai7YNhzBS/F/ueDAUm0FpDGfTjP+Jd+DH0WsOZ
 /pRwNynkpafwz++zd7+bB+RC0kMAV+nfrbnGpx8Ys/Y+Wmc0u2Kr0Ti5K4L0cCHkOmnE
 EdJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrJy2nOPneYaDPP3Lp7hmO+xrvSg0EKYPiTPpeGl/61auUgzCBXIoQQUV1QeqtSc5eIa+YmjgY5A==@nongnu.org
X-Gm-Message-State: AOJu0Yxi9llSIfjnuGdjNJ8Z05oSJvFeVQ7gtmKBZPbX0UUb1xv+SJs1
 MHqWqNWoTd8JOHcouWUpjatGPrlLNUInhcMZyVASZNOwXswnvC3PoxJgqrRqbX8=
X-Gm-Gg: ASbGncv7wTg69/yzrTmIlTQowidzps1CQSFeQC2gTWM15tzJYOI35Ys34Yqvsn4m+Ht
 28vocZ0H+Dt51O06fgAMyouXWMR6CeV26KEHpdfMA6jXLTS9k0EangUHzBuu02+Iq9BFSuP59Ib
 uT+vPxLQG75tuzHjAS+A31Cp88CiJWqsIDjJM+bc9VqHgfdyqchzEV/twqOaKyN0sOZ85of/CEw
 MOV8sfUhpuf5Q/5IcHdqa0sAuR2LtO93sz/WJKV5WpRQiy0FeokKHz8Sp2cyGxC/vPIsTXY+T/6
 jJZdp1qHuB7VOxssGY0fwpC/7IQFrPjKhyqs2A==
X-Received: by 2002:adf:9ccf:0:b0:386:4332:cc99 with SMTP id
 ffacd0b85a97d-38bec505da6mr19793785f8f.17.1737565120299; 
 Wed, 22 Jan 2025 08:58:40 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3275622sm17053580f8f.69.2025.01.22.08.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 08:58:39 -0800 (PST)
Message-ID: <cf3f5611-2e66-4d31-bc20-d70e3bf4230a@linaro.org>
Date: Wed, 22 Jan 2025 17:58:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/boards: Convert MachineClass bitfields to boolean
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20250122103223.55523-1-philmd@linaro.org>
 <6393ca88-0613-415e-8178-18a34778b2ab@redhat.com>
 <CAFEAcA-+9xhH+gXWGfN9bN=rnsShyRs0i+Kd0NDfMYrSNVbF4w@mail.gmail.com>
 <a48356fd-d964-4bd8-b349-3f63c92431a2@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <a48356fd-d964-4bd8-b349-3f63c92431a2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: byXKZOzVuYLr

On 22/1/25 16:27, Thomas Huth wrote:
> On 22/01/2025 15.33, Peter Maydell wrote:
>> On Wed, 22 Jan 2025 at 12:36, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 22/01/2025 11.32, Philippe Mathieu-Daudé wrote:
>>>> As Daniel mentioned:
>>>>
>>>>    "The number of instances of MachineClass is not large enough
>>>>     that we save a useful amount of memory through bitfields."
>>>>
>>>> Also, see recent commit ecbf3567e21 ("docs/devel/style: add a
>>>> section about bitfield, and disallow them for packed structures").
>>>>
>>>> Convert the MachineClass bitfields used as boolean as real ones.
>>>>
>>>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>    include/hw/boards.h        | 14 +++++++-------
>>>>    hw/arm/aspeed.c            |  6 +++---
>>>>    hw/arm/fby35.c             |  4 ++--
>>>>    hw/arm/npcm7xx_boards.c    |  6 +++---
>>>>    hw/arm/raspi.c             |  6 +++---
>>>>    hw/arm/sbsa-ref.c          |  2 +-
>>>>    hw/arm/virt.c              |  2 +-
>>>>    hw/arm/xilinx_zynq.c       |  2 +-
>>>>    hw/avr/arduino.c           |  6 +++---
>>>>    hw/core/null-machine.c     | 10 +++++-----
>>>>    hw/i386/microvm.c          |  2 +-
>>>>    hw/i386/pc_piix.c          |  2 +-
>>>>    hw/i386/pc_q35.c           |  4 ++--
>>>>    hw/loongarch/virt.c        |  2 +-
>>>>    hw/m68k/virt.c             |  6 +++---
>>>>    hw/ppc/pnv.c               |  2 +-
>>>>    hw/ppc/spapr.c             |  2 +-
>>>>    hw/riscv/virt.c            |  2 +-
>>>>    hw/s390x/s390-virtio-ccw.c |  8 ++++----
>>>>    hw/xtensa/sim.c            |  2 +-
>>>>    20 files changed, 45 insertions(+), 45 deletions(-)
>>>
>>> So if you are touching all these files, why not go with an even more
>>> meaningful rework instead? Flip the meaning of the "no_*" flags to the
>>> opposite, so that we e.g. have "has_default_cdrom" instead of 
>>> "no_cdrom",
>>> then new boards would not have to remember to set these ugly "no_" flags
>>> anymore. It's quite a bit of work, but it could certainly be helpful 
>>> in the
>>> long run.
>>
>> Well, that depends on what you think the default for new
>> boards should be. I suspect these are all no_foo because
>> when they were put in the idea was "all boards should
>> be default have a foo, and 'this board defaults to not
>> having a foo' is the rarer special case it has to set"...
> 
> That might have been the reasoning for the naming 20 years ago. But 
> times have changed... which recent board does still have a floppy drive? 
> parallel port? And the others are also not that common anymore...

I tried but not much interest:
https://lore.kernel.org/qemu-devel/219be312-4acc-46c9-8a56-16e5cb483ae4@linaro.org/

So Daniel suggested to clean the bad bitfield pattern in parallel.
