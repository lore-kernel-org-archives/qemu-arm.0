Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp799346njb;
        Fri, 13 Dec 2024 15:31:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXp9Y+Dj/sDMky5/bf1dxNxHo60htvxrq1h7FcTjm0/0svz+OMuL9EsErofiW4d+HKyZG+MIG7+vCg61w==@linaro.org
X-Google-Smtp-Source: AGHT+IEecaF3R7m9yCDXWKRVCNjuPNH6uZWWcyMMODUQnOrt0g667xcKifiaWx98Eev4y9Vq/MoV
X-Received: by 2002:a05:622a:1887:b0:467:5c60:3921 with SMTP id d75a77b69052e-467a5803612mr87001081cf.38.1734132690501;
        Fri, 13 Dec 2024 15:31:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734132690; cv=none;
        d=google.com; s=arc-20240605;
        b=fbA4Xf4rMgqSKEMh9ukA2HCCMYGGCMJ0B74RkrNF/1PFiVIt7I9OYe7iylK9XmakpC
         MXvC9amYpFK3s/UT6WfLWg68wHp8qiI68bIhvgSRTL9HLNVfCWCyC1udzNUNbtMdcjRf
         nxUAEeAAzM8BOrX1Z5OCw+SRVRIWKNHLcVjsxYwyAoIxHkUWJtn7G6Kxp6nzA66YTSyo
         gMC+G1vz4DS7fWA3aAKevlJZQqZomXT7GHFE2bCt1VfbrE5zK2QTHZvXcnC6zhGnFhmL
         LPGqPEhLfEeX6k0ypTXzH4SKRfYBbP42hdXSAbOLNXfB9GOlD7LWc+1e4o0kwHJpm+as
         ifCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=g7fvn8USEKMq16SLa2wUNwg/HO1Jl6iGLjfEKjPyOMg=;
        fh=52B0aOxDFepDHpndNlEcaFgu6p3YS/PAkLK3KVWm/pA=;
        b=MAiAFfzki8gEtkrut5q5fLDos2sBqsNccYyZ2v1no8n1pSKt1ju/yBwIEACfEz4gim
         rC6H95jgYvGsXqAHaNVwOTHEA7DxGYFmDzzKdu2J2ifpakeESm4/bfnexkaYteiL5rJh
         RGBW8LzeEvl5PANSg9MawgTyZqJ9OqiZVdQ+NvPYdRctuRq5pPGQ4WeldvJPIC6ajjsi
         LgIKxoW3so5zeBCwdxaIYrLklJfhWM6LzrT+xEnnTPdL/gArIjqikkikiPVmgfIVg136
         e7iY/HdHhliat6PXovMBs7//VdG40kyK4GV9GLnbL/PonJRKPeIGpGDM0j60jTwHtZjt
         EY0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RWby0vRB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467b2f2afcesi7600491cf.678.2024.12.13.15.31.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 15:31:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RWby0vRB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tMF7Z-0001r7-6j; Fri, 13 Dec 2024 18:30:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tMF7M-0001o0-GY
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 18:30:49 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tMF7K-0002vm-Uu
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 18:30:44 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385e2880606so2150777f8f.3
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 15:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734132639; x=1734737439; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g7fvn8USEKMq16SLa2wUNwg/HO1Jl6iGLjfEKjPyOMg=;
 b=RWby0vRBRb7tMQVZaHUYmdx67oVe+N071IXM7dP2ecQ+pg8iX+zmEPZLlbmb+J8Pvh
 KAz7CSn3xbHfxxWo6b93DzlDhaDJ0ZLVmhghr5wUggyaLxkPVmKD5XFfy2hwwg0k+mQg
 seeLyRmCXMFbn9Ox2gcGFb1R39oeBX0kQqkVNW4VtRkeYH/1zk8Tt66birFuS06AP2Tp
 sXjZ04Gh22taIz/Ly4S8Lg2XzFhkOwfINnl1U7h9GrX4CrHHp9GikwcwydyxOYvGprIN
 1TuxHXIYPtxD2naeI9gNDyZ9rlPTq8NAHYDQAogSFqY6N0+HJuzTLPllkvg/LEqVjrI+
 9U4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734132639; x=1734737439;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g7fvn8USEKMq16SLa2wUNwg/HO1Jl6iGLjfEKjPyOMg=;
 b=C7OhJ58W87jlkNEZ6UxOCkdOhfYcCny6ibEcs+lGk2fiYyP2F0GMJm6C/06MU7P7AO
 hjKYqDuuYK6PtBLx6nYGrR0XMBaUcePZ5sC9D2fa4Gk/H2n6ugL3fzXWouyGRia1D9m3
 Iv5wVaEYnZtxr83ZOiFzXASJCrGgBwd8xM6KLR/zBaymrQpB1SBC9PlkMcjICbLeTTNH
 OU6sEYj4a1laELSTAWHUOQcNwGBoNGyeCG3ffTDZAvRngjWJmuxfanDCfB0cGIHq+5+u
 KIonWHknBxcdtPx8+w7yvbdsXGNmS+Rgj2HQ9CCiLE8RSfK+gWUpX1gT0t7g/FqIzJnC
 LizA==
X-Gm-Message-State: AOJu0Yw/c0MOPgxEWCyqKkimwzPxMW2+pzX4Zikjbg/GbKs5RWH3zL8Q
 2EwbQKjVcXxyv36WaVLf+TH+lKGrnAQmMFVTX5hkx+PKHxdl3yezPMKe+B2L+j4=
X-Gm-Gg: ASbGncuOnsbeUPtHJkgnSS+v4VRtkHsUz5A6d6uPziQuzI5FrPoWBWsHM9DhwHfWyIN
 Iz/wxwJsFawSr4AgZ4eAPwJwiDA7SoR6wD/GtQogXB4eo8EJZSkLIjOxhC8qvjZ0cxsY5orE9R/
 z33adcZShEmNf2zUa8WvvDtTInfnpGOSvwz1nToSXYybB62+dZ44CU8z6nV4l77Ln2ULg9vk/8w
 gItPru5W0dXTJ3NZ4iY8WW9Wg0xjGmfciXBfbB6diHHUy1dH0w2GDVWkwJaepugbbMbpg==
X-Received: by 2002:a05:6000:795:b0:385:e5dc:e285 with SMTP id
 ffacd0b85a97d-3888e0c0699mr3507368f8f.58.1734132638984; 
 Fri, 13 Dec 2024 15:30:38 -0800 (PST)
Received: from [10.1.1.253] ([45.93.146.194]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4363601406esm7328355e9.3.2024.12.13.15.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 15:30:37 -0800 (PST)
Message-ID: <28aa18d8-5015-4fa9-aa43-f988c591b200@linaro.org>
Date: Sat, 14 Dec 2024 00:30:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] hw/nvram/fw_cfg: Move PCI bus methods out
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20241213133352.10915-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241213133352.10915-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: yACUbe/6Wlx1

On 13/12/24 14:33, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (7):
>    hw/nvram/fw_cfg: Rename fw_cfg_add_[file]_from_generator()
>    hw/nvram/fw_cfg: Pass QOM parent to fw_cfg_add_file_from_generator()
>    hw/nvram/fw_cfg: Skip FW_CFG_DATA_GENERATOR when no data to generate
>    hw/pci: Have PCI_BUS implement TYPE_FW_CFG_DATA_GENERATOR_INTERFACE
>    hw/pci: Add pci_bus_add_fw_cfg_extra_pci_roots() helper
>    hw: Use pci_bus_add_fw_cfg_extra_pci_roots()
>    hw/nvram/fw_cfg: Remove fw_cfg_add_extra_pci_roots()

Series queued.
