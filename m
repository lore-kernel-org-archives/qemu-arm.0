Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp738332njm;
        Wed, 5 Mar 2025 03:45:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1VnuCmg6za9UcBKzZKVFrik/EFSKk4ppK5ElFpyGzqDvaOZB6xKEWtD0Bzr2ri7bRAkp3D2K2P2ngvQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEDnnGbrTgB7cCdGCI8rwuAOHVZDyLweDVTiOZvfsD1b7kf/ZCmO3IquzbhcAN3Ly7OZD4Z
X-Received: by 2002:a05:620a:2708:b0:7c3:d314:7238 with SMTP id af79cd13be357-7c3d8e65994mr471788285a.49.1741175156256;
        Wed, 05 Mar 2025 03:45:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741175156; cv=none;
        d=google.com; s=arc-20240605;
        b=U5Tzwfr3Vu3ZTAZ5VFjvs1oxJf4v/se3KVaC0frcwD2BFI1Y/VryUdAeyaldRcP8ib
         6tfu0MzpwY+0ReRjJGMKOT/Vve5b/pc8L31j0WPcS+BR7OKW6KHxXizK/m9hepaoFRFX
         MVtdmZS2FN+nV5AJL3geI0HQm6Hr2hGzyGe3psXrWq+oS68jegWJhzXXnaidOFTJTOK1
         IUIL3faAVVJXhoG1rEYdjgKiRNMfifSYCIhZkqvaTUkDoITJYW5M3yuTigyqqBEPHHNO
         6oE8coWV5XmSVwxv+/YOXUKoUmzunSvIpBwmM01IitGOL5GG39nQ4eW6OyX1GaTnk0oZ
         FFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UTggNXUww+YWPwGoUMFtXQUJkNqFzaaGF4Xq6al+Z3s=;
        fh=veGIjA+IKRlmE+egYVaQOzuTj1BN9XoYGyyYOVIhZ/U=;
        b=Xl3Q1Q+Qq3Knzc/XHqCGnnggb2wyNqMwYAMdu1ZHwBr3nqzE/4nU8hl48zUonjiJ2+
         j7aUgnLUPCd02NrIMifuzIDpne09gCOmIA5qdio/UZy2IqMimIlZalyYpi93GwkxbCo4
         56Vn4tEd4bGtM1HggJR4ZVMHwzzCiIOhn5sdVb6XfyhyH/i+AGPGNWNWfS8JUyKUnKUc
         4/6AzO4hOpu4bkLRmltoZXwLUE85oa+7tgjRnv2yS+w39hCF/1d6+qmxy6nnE2x1cSfv
         CSI9IsG4g7m/36PxkqX3319rPpGTrYovM79IMXoJKfOzz7hUJ/N2eauBiIZ6r+Xa7Q0m
         GItg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b+P7GEw9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3c59b6e4dsi466650785a.514.2025.03.05.03.45.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 03:45:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b+P7GEw9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpnC2-0005Qy-Q5; Wed, 05 Mar 2025 06:45:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tpnBY-0005L1-DO
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 06:45:18 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tpnBW-0001Nv-1H
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 06:45:12 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-390e6ac844fso5932270f8f.3
 for <qemu-arm@nongnu.org>; Wed, 05 Mar 2025 03:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741175107; x=1741779907; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UTggNXUww+YWPwGoUMFtXQUJkNqFzaaGF4Xq6al+Z3s=;
 b=b+P7GEw9FW7MzexRbZ6AWSXbKEi6hkfpit3562rQHo0+A3/Z7nMouULFwTr9NrIgpL
 8YiX9tQI2Sw9++tWGc64zpemsy+bFIhdiiwm8JrXtGDUZUmUsAFRLG7rimkH8iaQuahM
 R+Q2xIWoXsF0qQBqsQOLS5c0FpyzThH88P1fkV97CGHMDX6c9jEKHPNVGP+cgY5Y1cx/
 DTVzTUD3Zx9ud4ZNf17ihUCV53FT06Nn9B94WjX85EP5HSxgGjofMshwle6mH8dHFUWk
 WxmaXTocD0jabnpndhD6j66MxSOsQ8WfsG6g9f2REkozhDk015l5nGk3PUMz9RxcyVfd
 QX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741175107; x=1741779907;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UTggNXUww+YWPwGoUMFtXQUJkNqFzaaGF4Xq6al+Z3s=;
 b=B4vDjnxtkKCInSreXi70iauMomCW6lVbZvQRa7UoTpoM7zi62B8TI0pOx782Ic2k3W
 SIzKP+BLrkk+M4h10g7rkiu7fI3mFBS8x7wLnJEjqgHqxDLkUkSElivJGxBJEHphtw2Z
 /ZkhsrlPHTDlRIoI+793jihGeIOSPJx95vzWeiqIZBzWlTML2Fr/Om7STCiYm+XG8xmf
 Hv9qDyqru8UHb6jfPylmDGU5cFs2t6+CjkZG235nxBwMIgL1eA+XFyU+tK1UEActfVA3
 zMEyYazGMWUGAnByIQs7+ACVa236dJPSrS3WQXfq6vVkelTjOgTmNF5cvisjbePuQqFh
 DUuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyzGeM2XFiZlkT5Ec8i0IUzerI9YvaAdT5t/uWc4KmBKM+oWwyl2+dH5+B3/fafQPDEy7bAwbr3A==@nongnu.org
X-Gm-Message-State: AOJu0YwXE8vdmXZRUQVc8yRLtQAsC51ZoXy3shpHI63gfPCHdUxlKnLl
 J6nDRSmPx16lSc+9NXW+dJFvcZkvPeO90fjKHzWtvMbO8OontLuDxVduhpFZCfI=
X-Gm-Gg: ASbGncv6ilZ6wgOK3Kzrw7vekRX5D0rE6vmzZY03ut+BhF7fUCLEM3S223TtmIt1SBv
 3iVSuJBCTxCHUu1LXMAetmViq6hhxfRRU2YLfeZ+fn01Kz2YYob3HjENyE+LPAcujf1EJnpzkHY
 iRJEXcbb/NLAA/cAbsrYMqTG9Inx7/ArqjDtMP/CRICMb30S5sX0cw/qoEmy4u6YPfUHQ/NiaMh
 r0hyWHfiIurOGBbj/cVlBPkUG7kRhdr0HMquo5y+ojoOUM7FRDOl++oWG/odfxw/iYC0JLB/Yvp
 gjulyGZrT599FH8C5uUjIVxUvP47M3a7JKXgwH0KurXE7ip4zxL2shN1y2NIkO8z028gbhTfvWf
 POOcDNrt5krkT
X-Received: by 2002:a5d:5f45:0:b0:390:e9ea:59b with SMTP id
 ffacd0b85a97d-3911f73589emr2097976f8f.18.1741175106890; 
 Wed, 05 Mar 2025 03:45:06 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b6ccdsm20786072f8f.46.2025.03.05.03.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 03:45:06 -0800 (PST)
Message-ID: <66093554-5d13-44fb-8c80-3c042f0c12c4@linaro.org>
Date: Wed, 5 Mar 2025 12:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vfio-platform: Deprecate all forms of vfio-platform
 devices
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com,
 peter.maydell@linaro.org, clg@redhat.com
Cc: zhenzhong.duan@intel.com, will@kernel.org, maz@kernel.org
References: <20250305105800.949153-1-eric.auger@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250305105800.949153-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: UTfog/7QIcY1

Hi Eric,

On 5/3/25 11:58, Eric Auger wrote:
> As an outcome of KVM forum 2024 "vfio-platform: live and let die?"
> talk, let's deprecate vfio-platform devices.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   docs/about/deprecated.rst | 25 +++++++++++++++++++++++++
>   hw/vfio/amd-xgbe.c        |  2 ++
>   hw/vfio/calxeda-xgmac.c   |  2 ++
>   hw/vfio/platform.c        |  1 +
>   4 files changed, 30 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index abadf8de27..d11a7004df 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -434,6 +434,31 @@ Stream ``reconnect`` (since 9.2)
>   The ``reconnect`` option only allows specifiying second granularity timeouts,
>   which is not enough for all types of use cases, use ``reconnect-ms`` instead.
>   
> +VFIO device options
> +''''''''''''''''''
> +
> +``-device vfio-calxeda-xgmac`` (since v2.4)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

"since" in this file means "since when the option is deprecated",
so it should be "since 10.0".

> +The vfio-calxeda-xgmac device allows to assign a host Calxeda Highbank
> +10Gb XGMAC Ethernet controller device ("calxeda,hb-xgmac" compatibility
> +string) to a guest. Calxeda HW has been ewasted now and there is no point
> +keeping that device.
> +
> +``-device vfio-amd-xgbe`` (since v2.6)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Ditto.

> +The vfio-amd-xgbe devices allows to assign a host AMD 10GbE controller
> +to a guest ("amd,xgbe-seattle-v1a" compatibility string). AMD "Seattle"
> +is not supported anymore and there is no point keeping that device.
> +
> +``-device vfio-platform`` (since v3.1)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Ditto.

> +The vfio-platform device allows to assign a host platform device
> +to a guest in a generic manner. Integrating a new device into
> +the vfio-platform infrastructure requires some adaptation at
> +both kernel and qemu level. No such attempt has been done for years
> +and the conclusion is that vfio-platform has not got any traction.
> +PCIe passthrough shall be the mainline solution.

