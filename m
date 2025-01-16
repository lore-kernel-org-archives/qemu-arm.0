Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp4035406njn;
        Thu, 16 Jan 2025 13:13:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVuS6BCZwRZ0y9hY/eiWq43KQ6U2SvcB29poA0S6O2Ilds+WJU9DcshDjKYDjuZnLVK9FuM9SOKmcdhDA==@linaro.org
X-Google-Smtp-Source: AGHT+IEoqQNzdStkcpaBEgb+SbXYwCY1qdauMMngKrW++2LgXyUM0YOSVPWSfhSa8GSbpJ17f0Ff
X-Received: by 2002:a05:622a:58f:b0:461:3653:54f with SMTP id d75a77b69052e-46e12a0cf30mr3072961cf.11.1737062037931;
        Thu, 16 Jan 2025 13:13:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737062037; cv=none;
        d=google.com; s=arc-20240605;
        b=YoA8feGPWegpI5R7htEJliDz3Xgk4DCiUMJSDLk5flT4e9cPC7yeLTczGSbjPvQeWs
         RPxOfQVUsmef1Mch05Hq+HA7LWux+0W7w3QsiEoNhsgpgGseIRZCyhkS6bo/F3EteBqq
         qaNbTIY4E2UWjnBTNX8iKc9KFfhEdh+W38FqaCBD8T6TEfgCUZtXZfIe6hJwOxrTnYbj
         yNvcwoua0FPvYLp0QWHPvABJsw8JymI08hhH1ba2Or7aXCNceeUe1FQmJS78P+7J94Ju
         MAEzpNxUYz4W5SpCEUNa4OEvXjxt0GFVwPKTKftTIBt4xs/sEBPni+6DFjQZuA9chTcv
         P0UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FX/GjRhWW16iXaOYBDgPEwHErSqJ7l6E9oyhycYmQKs=;
        fh=hsbdG1fSLAketK8EJve7DAxPqCOWMve1KpQke6cUpaM=;
        b=gOLpTHckXEKnpumAjBh2Di1qDoN2wUz3Un67Yu53VpMfoQvVoFRE49l4JuXFLe5VgA
         gMLMZZTSXBovWqIXvetwlgmAXMUwBx11tEjSPnUflQE4Q1FPaKpXqp4vmw8G05Uf5sMG
         f5AjXsPRbxL1xF0MyEmJ3dG1AHzFrAsn78qkWi/iT/2mW2xUV4IZc2zOA1Me14hKmbZ5
         SuhHwheyYq+9UwxWwn5B2/sdFxn9w0uPftE2tGH/Dp1w/yXYnXbK9AKszCmmooaFTVT6
         Q3koKgkqR3SC/YMdlPKPTz3T/g421Jz+XscF05IKwTFDUwIrqTUkUhUMZBEAvmCBwcxd
         vnDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EKpmsU53;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e1044585bsi8577191cf.395.2025.01.16.13.13.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 13:13:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EKpmsU53;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYXBN-00068Z-Vc; Thu, 16 Jan 2025 16:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYXBJ-00067R-1g
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 16:13:37 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYXBH-0000jy-Hn
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 16:13:36 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so14895715e9.1
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 13:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737062012; x=1737666812; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FX/GjRhWW16iXaOYBDgPEwHErSqJ7l6E9oyhycYmQKs=;
 b=EKpmsU53cBxg6ZEZrZLembHe0UhLbbKmJiJhqGXVULVHRtMmvC0lt4COFq16RO0Kbd
 OwkJppoI5k+sWnou6Zj8GfF9fTObkdQ0IKckXvoanm3TxrNBjAU2jN8iR60Vg3R7Avwz
 DnZB4zHF//0JfpUpadjQGaKkcRRM4WbdOu2frfc6H9033BU3uR2WyQpNWRkLNIYmGZ+Y
 jBbXwvfT41U8vD519QAmBOYkjM7GKadAXUzNg3Rw80/I9LZkRbEqfTbJ0BtI/fpv8FV/
 xYOLyTCZUo14vJ419Jjzk4jCQkynnjYSSsURpc0gZR8MfWrPoHhh3jynGk1uBEg8932Z
 xnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737062012; x=1737666812;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FX/GjRhWW16iXaOYBDgPEwHErSqJ7l6E9oyhycYmQKs=;
 b=BbOH9NUXKE+1hfMiuEFhtnGLDl9BMWJx0/csZUcrw3545+WvEG5yveqoeGMgLMgMt6
 yXbGsl8OjSBuf/ln6to8Rpp6KhonRwDYjnRdQZjbPgcoYSK2PUGu9ivtggln/a4t0qAV
 mjMNGUACNeR2LmCz6VASpoEEWlwXzkZPq437G5OAb6b2OJM80rYn8pRCgiZL2ZF2SNvz
 PnvULnBS6VZUFY0/n7D1LmVq3dW0413MVpPLhsKVP44A1ANhEA8Lf05nDJS6GXK/l/tn
 zK3C/QGb+ZOnZQYlOzRKrn918sXJkqQ21KjGLfcn3aOBftOZAagDiIvV2DDu22EXpeFL
 SHrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3HoELvyAPwB2r6pvTjRJzjMF4kDWG22p4E1E2ozwpjMH2y+krjRWJ1+rO7Q99ZAX98Uon6WB/nA==@nongnu.org
X-Gm-Message-State: AOJu0YyJ2YU9F7w0OeBSnzFGDXNzgN3xDZrII7snqpMhFXh7bF1ao2LB
 qVG48N1XLuybRcI48Bd923DTB1mUC+2NCFbbK8Pyo7JM/oOD88nIzBfKi2VMYtA=
X-Gm-Gg: ASbGncvJHoZwZfqig+/FC/u7NekkfM1cPd+XjMngIeH6DEUlxgGZwPAr/NFTTzheBWJ
 eZZZT4uDWOVU5syBFpbWY266TmULig5u8XutLB6/6ImvqLXsvYWJpXWtUcmMVn/mkst8aKIw4b3
 RZUgmmMiKbxVdd8NcJ4mRsueQgifnYrlUt8vbN1uezFKShHM819CHY4bhIvVyh12lNmtt84mxDT
 hFIr4QvxacIwVKj8OJnUxhA6nOWE5muBatUS+lRkTBdujJQLHObgviMWyHwaQrJBLN3kWZMy3r/
 snNAzLtDJkFqDY7KVxZ8IoPZ
X-Received: by 2002:a05:600c:3ba7:b0:435:172:5052 with SMTP id
 5b1f17b1804b1-438913becb8mr1640905e9.1.1737062012447; 
 Thu, 16 Jan 2025 13:13:32 -0800 (PST)
Received: from [192.168.69.206] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890408447sm10775385e9.1.2025.01.16.13.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 13:13:31 -0800 (PST)
Message-ID: <823a0892-e9d9-4d26-b862-83ffd60c2ad1@linaro.org>
Date: Thu, 16 Jan 2025 22:13:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v2 00/13] hw/arm: Remove virt-2.6 up to virt-2.12
 machines
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Thomas Huth <thuth@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org
References: <20250116145944.38028-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250116145944.38028-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: YkjLdElhjM+i

Hi Peter,

On 16/1/25 15:59, Philippe Mathieu-Daudé wrote:
> The versioned 'virt' machines up to 2.12 been marked as deprecated
> two releases ago, and are older than 6 years, so according to our
> support policy we can remove them. Remove associated dead code.

> Philippe Mathieu-Daudé (13):
>    hw/arm/virt: Remove deprecated virt-2.6 machine
>    hw/arm/virt: Remove VirtMachineClass::no_pmu field
>    hw/arm/virt: Remove VirtMachineClass::disallow_affinity_adjustment
>    hw/arm/virt: Remove deprecated virt-2.7 machine
>    hw/arm/virt: Remove VirtMachineClass::no_its field
>    hw/arm/virt: Remove deprecated virt-2.8 machine
>    hw/arm/virt: Remove VirtMachineClass::claim_edge_triggered_timers
>      field
>    hw/arm/virt: Remove deprecated virt-2.9 machine
>    hw/arm/virt: Remove deprecated virt-2.10 machine
>    hw/arm/virt: Remove deprecated virt-2.11 machine
>    hw/arm/virt: Remove VirtMachineClass::smbios_old_sys_ver field
>    hw/arm/virt: Remove deprecated virt-2.12 machine
>    hw/arm/virt: Remove VirtMachineClass::no_highmem_ecam field

Please ignore this (reviewed) series for now. I'll rebase it and
repost after the 10.0 release.

Thanks,

Phil.
