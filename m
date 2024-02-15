Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp731830ejb;
        Thu, 15 Feb 2024 09:52:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXj8tXK5+g0zO5PCV4CjzRuDol2A26NkXFVHvkbJVtr3rCa4+86r1IlKGUXmOMCZCQkhMXuJcnyQopqwFZy5/xfrKU+/NvJ
X-Google-Smtp-Source: AGHT+IFtKzvWPn1N/NAM/a/C7DKfMPWbqzZoBKg5R84kar5+pTw9/Y8V27NUFjPm/DgQ0BO4kL9j
X-Received: by 2002:adf:ec47:0:b0:33b:48ef:e746 with SMTP id w7-20020adfec47000000b0033b48efe746mr2172918wrn.68.1708019557545;
        Thu, 15 Feb 2024 09:52:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708019557; cv=none;
        d=google.com; s=arc-20160816;
        b=OVuGPn/Cb1kT17b5dJV3XshO8GXn09RZAuzItOM0eBtJRQSm+b4XyLmtP69Pjxd0dn
         7uG/uFyRtNIS7DPtTqCrraRRNBnZ6KSp6FPM5kaJbZ6DkFxJm8cu3nuXoR1LcV2H9M2H
         HbeMQlfFE3EkPXeu1JbWCmkpPkoWIS6qkSRup18hZRSfrv3Xk+Hz+7DSZrYf094qmD/R
         PLPfVYGMT/EO5fTB0JdjnrmIZ57IEOQA3C5NEQEp7iyGpCtDYvPzvCrJFzJMCliF7ybM
         aVUTdKLaGLLX8VbgceSKL2nNWD2Azzsgj0cNG1a5HcC7XGyfcmrgmnuyM5GF5PR/6jgf
         j7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=b8JSWfSbqJ38j0ddbtTcXV/tKfgCQrmY8HQse6Eb7fU=;
        fh=0XzsTNuKfJXX1YZuspaDB3gyZJHyE3POz/DBal9yGM8=;
        b=q/PeTiKk9eYkcsbSMatcfwzoRYWwW5wyGrqIGyOiMbcLUPquVB7Rt+XeAOaQvUjeb3
         qhgPnMgAfDp2geklM3aUQ21t+Vn7z8pZ8sFXmEQPVBQLwFtCxE1CDrPq/hWyy5T6RbfX
         5PSO13W9pk3xY0vlCNEHRwzvyk+tkXuHbn9dBbnIMZb0GzaY/4qM1mK2T0ywEsULCZHD
         q+C+UnX7tXJNbut1BmKY6AeUC9DBzm4SJsHpPl5PkyZmfjq7dYMWMoTZXHms8Et/CDJl
         MCEUiR+cEPv+/ESckjD8IJVOg5sZd4isAcrrzPJr6Pq6hN2/90h9kNlpJn3VneeAYVI8
         cnWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=keb4hCWz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16-20020a5d5110000000b0033b376b9223si999558wrt.201.2024.02.15.09.52.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 09:52:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=keb4hCWz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rafuJ-0005NS-1g; Thu, 15 Feb 2024 12:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rafuH-0005Mk-Ln
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:52:21 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rafuE-0000Cf-Tz
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:52:21 -0500
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d0cdbd67f0so16080851fa.3
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 09:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708019536; x=1708624336; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b8JSWfSbqJ38j0ddbtTcXV/tKfgCQrmY8HQse6Eb7fU=;
 b=keb4hCWzoriIuEmUT2D9K5vM1etv0JHwRF09YHW/vIh93GgFyjNZH9DcrC9Snb0CmE
 fQCOTCGoqgnnNr3hhY3BlAgAud3ovbnT4WB6a/xe6sIej46lr0KyCjE9zsInQ15qGq8h
 UKPaL4zRpNy5qKwDOumzsQjpen83U31/lXxAXa82hz2L3KMx1BgUD6ZWAV0bY4mZqwZC
 1y0hmH9tRR5P5zFysEE49hpDSZHNV48fxaI5ymCLDy8OLbJbNAqEkrFERh9AEsXowLKI
 pPWX8yhvYy6fpQLE6LlFcxqqL+Oyym5oRdnlwpjiGEFdlnT0nx3DhyqP6NIN1we0GdQ6
 hNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708019536; x=1708624336;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b8JSWfSbqJ38j0ddbtTcXV/tKfgCQrmY8HQse6Eb7fU=;
 b=C+nKX3zKxRTd3/1pYKCy+ubWYPAsT+6IInqf2RiaaXXo1x7eJNgTv6Mi/rSuXoOBQE
 iHSEfF3M+28pwLwPyABIbDs0+Kh4MMmDmffbHxivAMxaGsKFtjbyj8LgPfVRk+y3Kchh
 gzdrMbigSgGv1Zhp55RoUeydL5YdM/r970h7Cj2fdwBB2PAFEpbmnyCG8M18wUlZVx5r
 RN9WmvIJQAoUrw0y4zkmQEl3CyY8Et6O1WD+m6a8v/4Yd4WhxRIC+sZbzosHn+Srk3IE
 VGhzVCfAbi63gGBhxmJTSQmqPJoiz7djUb3M6tLtedBTdN/PY4v+XYnAJWfBCqTFRL6s
 tq/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/2w20svnl9iZ1DeVW2myr/vcOjmi9HHiioOwJZd+/8aECdqKBrlqqtcwAJQqu6V0HUfpfqYdB39Gz/rjX/7ZEYtiB
X-Gm-Message-State: AOJu0YydLzjdol7sd4iK5FRPWq9ZTFdZEeB8WWznyrI2qFnCrXacDwN5
 kcFRQnFm6/YUvp9783moTdNAIvOEtfwiarxbggwZc3EHk5KgSjhOncxxeUcpQjI=
X-Received: by 2002:a05:651c:1033:b0:2d1:15d0:4711 with SMTP id
 w19-20020a05651c103300b002d115d04711mr2124420ljm.5.1708019535999; 
 Thu, 15 Feb 2024 09:52:15 -0800 (PST)
Received: from [192.168.69.100] ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05600c044e00b004104bc8d841sm5680826wmb.13.2024.02.15.09.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 09:52:15 -0800 (PST)
Message-ID: <b9a8f47e-eded-4e81-bead-1aeb4138641a@linaro.org>
Date: Thu, 15 Feb 2024 18:52:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] hw/ide/ahci: Housekeeping
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>
References: <20240213081201.78951-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240213081201.78951-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x232.google.com
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
X-TUID: 6cKRxf+xqsg2

On 13/2/24 09:11, Philippe Mathieu-Daudé wrote:
> - Split 'ahci.h' as sysbus / pci
> - Inline ahci_get_num_ports()
> - Directly use AHCIState::ports instead of SysbusAHCIState::num_ports
> 
> Philippe Mathieu-Daudé (9):
>    hw/i386/q35: Use DEVICE() cast macro with PCIDevice object
>    hw/ide/ahci: Expose AHCIPCIState structure
>    hw/ide/ahci: Rename AHCI PCI function as 'pdev'
>    hw/ide/ahci: Inline ahci_get_num_ports()
>    hw/ide/ahci: Pass AHCI context to ahci_ide_create_devs()
>    hw/ide/ahci: Convert AHCIState::ports to unsigned
>    hw/ide/ahci: Do not pass 'ports' argument to ahci_realize()
>    hw/ide/ahci: Remove SysbusAHCIState::num_ports field
>    hw/ide/ahci: Move SysBus definitions to 'ahci-sysbus.h'

Series queued.

