Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp117245njb;
        Wed, 4 Sep 2024 06:11:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUW2yQDwtz2y3FszbJPahb/iZg6ahIamPty4uOPzex7KWw+yq5foqvYZedwCuYojVK3Ur9uLe1AlHiF7w==@linaro.org
X-Google-Smtp-Source: AGHT+IHnqNlT40WD+e0pfJliLJioeZwwERFR+L4M/PFA3S1griTAkBkIPZSJkpzsvVKnrJwxaJ5G
X-Received: by 2002:a05:622a:1f90:b0:456:8860:9e80 with SMTP id d75a77b69052e-4568860a028mr184341861cf.64.1725455516773;
        Wed, 04 Sep 2024 06:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725455516; cv=none;
        d=google.com; s=arc-20160816;
        b=h0BFgprYLUkv93s9o9XvLvccVmP89vhiqsjQk5D5Xjrfh7HbA2Mz8LmzNta/oQ+pEK
         TO8rh6JXK1OjfNv/mS8VecYDJs3MYYdc0CgORD7fqm6iQu+8Z3958F8d5GY4RMHbRA2Z
         ZYBhTyYz1OMjRAsOCGp6H1SKEvnXYbEnGGJ81uZdHj2kpZUXrjcm9lf4k+4j/Z0xCV+v
         Wa9V0jJERgbfATqOgbmUUPZSBE86B3Qx0nLAmvK7jDp9OLKxsWnnJh+lJHv9vsJO2fvk
         kzVjVPHvGCBB/KfNI5cz63YzID/J2shLwyAWXQsi7mlOXhdwJWSJT3/3GDmMxMyy1fh2
         XP9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Lydw0gRhTGX+NYirz2VKthLPBJw5sipMFb9tROKJomQ=;
        fh=0Rt4Og+ZHYhm1FnmHG20fcl+LeXJb+GWarnlSi1zEEo=;
        b=favOwTA3T+70PnyiXriav2/LkkXil+8PO0zVc1UqkoBWT1/PkeFpbOWAhcTReYZgOK
         uNr3eIB4B/VfsmgPMD4e0pSGGc+K+elCjELHDDA520aEqXwZF3ud/Yen3iZsNmJqavKO
         o24h1L3MNTboSHTnlZ/FTeH8G5Mc/aZgDqLA3kwuQRGoalBxigZ5GRhWy+8keQn8qbM+
         DtI0TFiKn+LCYlWWU651uFaKIacLdVi+raGNNXs3n+wQo3OXBPQoHE8ZgVP8dE4Rfhc7
         V6EaGk74JNHLwk/NElgn8I6AxzCnN3cMtoSsUlDxjl5VFgWAx8AFEaVUyHZtLynNuyEQ
         hGdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ldMgOOsP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682d3e9a3si149543471cf.241.2024.09.04.06.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 06:11:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ldMgOOsP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slpn7-0005Tu-Bk; Wed, 04 Sep 2024 09:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slpmz-0004wU-0a
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 09:11:14 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slpmr-0001tg-U2
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 09:11:12 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-374b25263a3so2906685f8f.0
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2024 06:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725455462; x=1726060262; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Lydw0gRhTGX+NYirz2VKthLPBJw5sipMFb9tROKJomQ=;
 b=ldMgOOsPc+6k5f54vCnDutrJc/bIRCCVDyNPKQI3UiHeKtznxtoziXEsbnWxIIFfXY
 1sX90xwAmoUCv2d9jH7/ftIS+RkMK+1/ZgY+1hlpHa7C+NZKKVxW6pn7FxSs3Xv981lm
 8iDqMWy5GcX7dTsU6ITh0bJEJi6veolTbvPyDDBWkh33B1XeP54N/QskYP0LWMhl4uqG
 Tb9giZ+ErYQfdCvCc2rpdrUZBwn7Z2hSyz6224C5MSna+t44ovj4Qp3wYQZkOmojaBYl
 GVwHkV3rb1+4ZCZAexmkPQ6v6T0M3jgclDNl5h7Msvp/+T+zT50ardFHcEJOPLQkQ5Ra
 Q6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725455462; x=1726060262;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lydw0gRhTGX+NYirz2VKthLPBJw5sipMFb9tROKJomQ=;
 b=ftGabkfhbVfsUADShgC5Ux/qOpGjCGUspJs8Coed2vNV1wTmILwQp3B8cAatMc9AXs
 Z1X3l6YOBCRBh4QCKVLMV3deY63rGnfXiEE1f00VzQ1TqJQcc8dbWhbNOaNoaGg2D6Qq
 1r19WwypusXjKQsYryDD6UrafWP/XfNgxvPqsEQSAmJ1Smq7g/1JXlEYOy6t2wmjJ4r+
 peCbfm/rXEqDaGowmMGHjgTKu/LyrAmYju7fTX/08JGwanCISLJyNZuPx+ADnaUpFPTe
 B9jioEjbgUv4sIqzsUU035CkqMuWvnrPe9Yx9kPZ1unrGQeD5wVJv7C1vd6l7h+ZTYWa
 oq8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZfPqCmBe7EI4Tpt9NIEkSOZy8b0RXkwvXBqhv8MHPCr6mt+2VV/2LOo+AjmguQoRCr/jWmunAWA==@nongnu.org
X-Gm-Message-State: AOJu0YyIo63AsTsuVQsfh0ZCd/179Kqe18Yvx5W1lcQELlg0SpVA78TY
 Bj52IEW1PMJXq6alm4Vp+DJoPGV4p7oVWxNmnoO0ULI/gfBbYXJvrb1NFB6xKoo=
X-Received: by 2002:a5d:6d08:0:b0:374:cd1b:e10d with SMTP id
 ffacd0b85a97d-374cd1be31bmr5317776f8f.61.1725455462334; 
 Wed, 04 Sep 2024 06:11:02 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4d391sm17015443f8f.3.2024.09.04.06.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 06:11:01 -0700 (PDT)
Message-ID: <8c723f1a-a337-46bb-bf6b-2bc3c4c6824e@linaro.org>
Date: Wed, 4 Sep 2024 15:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 35/53] hw: Remove PCMCIA subsystem
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-36-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-36-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: ZbBe4sN1Ks+u

On 3/9/24 18:07, Peter Maydell wrote:
> The only PCMCIA subsystem was the PXA2xx SoC and the machines
> using it, which have now been removed. Although in theory
> we have a few machine types which have PCMCIA (e.g. kzm,
> the strongarm machines, sh4's sh7750), none of those machines
> implement their PCMCIA controller, and they're all old and
> no longer very interesting machine types.
> 
> Rather than keeping all the PCMCIA code in-tree without any
> active users of it, delete it. If we need PCMCIA in future
> we can always resurrect it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/pcmcia.h   | 63 -------------------------------------------
>   hw/pcmcia/pcmcia.c    | 24 -----------------
>   hw/Kconfig            |  1 -
>   hw/meson.build        |  1 -
>   hw/pcmcia/Kconfig     |  2 --
>   hw/pcmcia/meson.build |  1 -
>   6 files changed, 92 deletions(-)
>   delete mode 100644 include/hw/pcmcia.h
>   delete mode 100644 hw/pcmcia/pcmcia.c
>   delete mode 100644 hw/pcmcia/Kconfig
>   delete mode 100644 hw/pcmcia/meson.build

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

