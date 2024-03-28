Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1218011ejv;
        Thu, 28 Mar 2024 08:43:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSJyZUWbaJtkPkYeW/r0xY2j93I0vTMvopgQt5LgtzmGGpq7ZZbnsz2pkP2pdNwAELzYHhgzDWH8VUZ0/4O2deSYjRnflk
X-Google-Smtp-Source: AGHT+IHhaEfXg9ih+Dd1ThtgFU/vHrppa+o4kJYKZEBN/N4kD77kaUnpU9SZ5bP9XP48Yh2Trf17
X-Received: by 2002:a05:6830:1313:b0:6e6:cce2:fc89 with SMTP id p19-20020a056830131300b006e6cce2fc89mr3477245otq.3.1711640625056;
        Thu, 28 Mar 2024 08:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711640625; cv=none;
        d=google.com; s=arc-20160816;
        b=Konvbc/1JsNFQ8Elj/oBcIdQbXQMgB1CV96gi+v1zQLYV+WesTqexNQ37H2pPtWx0/
         k3UWbE1ba4zuTJyWUHT6EF7YroPBE18netNGiA6xqw0uZjiUwDJ6x0sf+MoxTMl1N+bS
         BH3clUm9duw1IZy3p2uJ+2ZrWA64sQ/bw+Ijw4UjCbquaDWbDbcavPR9XmQTxID9Abht
         XlVdcbQv/5m0UGV8KUVadBwb6iSzWTnJIsuj1lC46B45mhxaFR+Aqhtu8Z4AEMc95oJw
         obsvVV75+munQCdiyTHMAOgUUXlhCC6wvWsjY2NCLiE0+8Moy9qBQ7c8LqzC4qozc8g/
         olsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SA9prWQH3+BKQDdv+4CEIFUq0hrH5UT0eDVBRphad+Y=;
        fh=YiAzrS56PxfVdkyPJs6tLVpLvx4gYwnN5z0jpeaoOjQ=;
        b=pbyBXaL5NYs0jy2fZzfWp0Wj+2ePf2MDihSy7VAzlN3WJkwiXPTZgGh76JYb1u3dyI
         wgNqRW4JVkt3UPBfq2bzmF9K3sbTgh5JkhUxe/fQ5xEp0wspFs7+jvAzlHx4H+O2qQbB
         6arV8mgSDOytz8Ps2QaXX5kgCvmclMaDm6CReQnd9hB+5ALPqYWkv5DPL9dpn2qE5Sql
         ZBT3w2OjGcB/E6727JZZiKr6pYsGfC9yR4KZLW7UUmUbHF6Mz80EzbIms+ImlRrx2LdY
         SUMG/Rzywbv0ak60wZezhIeSHpf14BT5CkKMlIE9pXa45yAUGXz+PP3qWjhEUkUWGqll
         JOaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJtMgdxw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12-20020a05620a02ec00b0078a1aa8dd86si1653298qko.160.2024.03.28.08.43.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 08:43:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJtMgdxw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rprui-0005eY-Ma; Thu, 28 Mar 2024 11:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rprug-0005dP-T1
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 11:43:34 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpruf-0007qR-4T
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 11:43:34 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56c147205b9so1986551a12.0
 for <qemu-arm@nongnu.org>; Thu, 28 Mar 2024 08:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711640611; x=1712245411; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SA9prWQH3+BKQDdv+4CEIFUq0hrH5UT0eDVBRphad+Y=;
 b=TJtMgdxwbLMVgdCwtC/sK/89pC3KS+oMtjFlkj2pexjbfX9bjGX9eltuO6QTVynRGz
 gHc5c1TY6dbHzWmQmRxhI4q+c3Fg9seXyM5TgCzLed/o4kppYcA1S3Pomq3ciodIoLhC
 JRFjNq7G3KiMGNZa4BMePpIXJnOKGZM4e2Y3/e7jSGZigcRPZO1/cA82cukWyERi+juA
 U5Lji5d4WYjUfskQDGVZJfZZ2dAOs8IDZgo7qkZKWZjSJm1dcn5ZGmzcDFE+12e0qmns
 UTIKS/5qbCrrRbzjZwT1/0CD9mtp54nimFUNHpbhszPUA6SlGAfvT1fVwPIf1l9hRt5A
 T1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711640611; x=1712245411;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SA9prWQH3+BKQDdv+4CEIFUq0hrH5UT0eDVBRphad+Y=;
 b=pOtFSfwOdSzRSerstDuwqKE5oyasqOAnbcrn781p+g7xRz14hM253uFwbaYIQONRFs
 vI+oPcFK35eM6pHLS+BLt5M7q75H6HPX4h/HoGBD2GFXQEkL+EYzdK0z0ibZv05MHveW
 49AaDeW5EAiAx2fsdmKSJZL9kdke0+bMoW6M/FAP/h+ZphmNStn10m3tkBLHGdKql12S
 wmxaLPDmqMXrQMqP0N1PmTQ/mZ4HyTOgS5dzEImAcaXWSk3sUU6zmZ8U/4NvGBSP2nBA
 vfc3otnhqraJUZlz18BxQMHFTvJNq8IPvsInIUBRZcKtFwyAMAjsgWnmvevCWH0Gdyyh
 XEpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoiXaye6gAPquZwOQM5EFzvWLKRdnFT6/zSFY6jOrR7u/A7Tb6aMeon75eclfUAPYEatDeQ1rHNqo4hGdCFoLu0O7z
X-Gm-Message-State: AOJu0Yxo9IuYb2XMrlRQsbgckoQyE96/nIKN0MGCeb9FfCb4mq1G46QR
 E6aOaUtP6ryCE4gsAMBv3jlz3WDq04ClrYvm30wOtr0WQtVk8arDNmjYk9+L5lBROUdfqQElGOK
 sS0aCjQlNRg3OEKzlGoVCpBTp1iFMEax2FamboGlO5mXffUjg
X-Received: by 2002:a50:d5c7:0:b0:567:e0e:dda5 with SMTP id
 g7-20020a50d5c7000000b005670e0edda5mr2134150edj.17.1711640611549; Thu, 28 Mar
 2024 08:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240326095819.1268062-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20240326095819.1268062-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Mar 2024 15:43:20 +0000
Message-ID: <CAFEAcA_Hf_Ehk8Cc8kZGCO3niW_x18vwg4=JSFmYoFZOOTPzGg@mail.gmail.com>
Subject: Re: [PATCH 1/1] docs: sbsa: update specs, add dt note
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: Vt+ejqQ60lzL

On Tue, 26 Mar 2024 at 09:58, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Hardware of sbsa-ref board is nowadays defined by both BSA and SBSA
> specifications. Then BBR defines firmware interface.
>
> Added note about DeviceTree data passed from QEMU to firmware. It is
> very minimal and provides only data we use in firmware.
>
> Added NUMA information to list of things reported by DeviceTree.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  docs/system/arm/sbsa.rst | 37 ++++++++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 9 deletions(-)
>
> diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
> index bca61608ff..d4d1f2efe3 100644
> --- a/docs/system/arm/sbsa.rst
> +++ b/docs/system/arm/sbsa.rst
> @@ -1,12 +1,16 @@
>  Arm Server Base System Architecture Reference board (``sbsa-ref``)
>  ==================================================================
>
> -While the ``virt`` board is a generic board platform that doesn't match
> -any real hardware the ``sbsa-ref`` board intends to look like real
> -hardware. The `Server Base System Architecture
> -<https://developer.arm.com/documentation/den0029/latest>`_ defines a
> -minimum base line of hardware support and importantly how the firmware
> -reports that to any operating system.
> +The ``sbsa-ref`` board intends to look like real hardware (while the ``virt``
> +board is a generic board platform that doesn't match any real hardware).
> +
> +The hardware part is defined by two specifications:
> +
> +  - `Base System Architecture <https://developer.arm.com/documentation/den0094/>`__ (BSA)
> +  - `Server Base System Architecture <https://developer.arm.com/documentation/den0029/>`__ (SBSA)
> +
> +The `Arm Base Boot Requirements <https://developer.arm.com/documentation/den0044/>`__ (BBR)
> +specification defines how the firmware reports that to any operating system.
>
>  It is intended to be a machine for developing firmware and testing
>  standards compliance with operating systems.
> @@ -35,16 +39,31 @@ includes both internal hardware and parts affected by the qemu command line
>  (i.e. CPUs and memory). As a result it must have a firmware specifically built
>  to expect a certain hardware layout (as you would in a real machine).
>
> +Note
> +''''
> +
> +QEMU provides us with minimal information about hardware platform using

s/us/the guest EL3 firmware/  (or whatever other term you want to
use to describe the guest software that reads the dt).

> +minimalistic devicetree. This is not a Linux devicetree. It is not even a
> +firmware devicetree.
> +
> +It is information passed from QEMU to describe the information a hardware
> +platform would have other mechanisms to discover at runtime, that are affected
> +by the QEMU command line.


Might want to say also
 Guest EL3 firmware does not pass this devicetree on to later
 components of the software stack.
?

> +
> +Ultimately this devicetree will be replaced by IPC calls to an emulated SCP.
> +And when we do that, we won't then have to rewrite Normal world firmware to
> +cope.

I would drop the last sentence here, and use "may" instead of "will".

> +
>  DeviceTree information
>  ''''''''''''''''''''''
>
> -The devicetree provided by the board model to the firmware is not intended
> -to be a complete compliant DT. It currently reports:
> +The devicetree reports:
>
>     - CPUs
>     - memory
>     - platform version
>     - GIC addresses
> +   - NUMA node id for CPUs and memory

Otherwise looks good to me, and the updates to the spec URLs
are particularly helpful. As a docs change I'd be happy
to take it into 9.0 (at least before rc2) if some other
sbsa-ref-knowledgeable person wants to either review or ack it.
(But it's also OK if it misses 9.0 and goes into 9.1.)

thanks
-- PMM
