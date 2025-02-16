Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp2598648njc;
        Sun, 16 Feb 2025 13:03:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXLA9md46PpD2UBK2165C/tHKVO71+WY2/rakMGFwi2dZwFzhe4xs62KHXf+kr592Q+6vn/0pHUwVT6NA==@linaro.org
X-Google-Smtp-Source: AGHT+IG14VTR4A+BDU+uIYcqr2YkIZHrSmcAy6/S2tBMTZvFq1fciRlQdi18DEY8i/al4fxWZrZd
X-Received: by 2002:a05:6214:cad:b0:6e6:5d62:b720 with SMTP id 6a1803df08f44-6e66cf30d94mr115015336d6.42.1739739811331;
        Sun, 16 Feb 2025 13:03:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739739811; cv=none;
        d=google.com; s=arc-20240605;
        b=QRkD43JXCprkKGOUPtld6T0DarLV+ZQ7cjE5zVWaPWx9E7x4XXsAZjq8Y8xxEXUuQ8
         rTqUbaU0jhvkxHxy1Tx/w50iQRzF/24Km3X6s/8zoKiAWlukS3hbI5CDvL5xnWYbslZm
         lRfnfXX1pXvvP1TJ/zfDVjXKOw/lLSIhBPCHuQlDuoKLoA0QEKXDVk9MG1dyJyR/kpsr
         v//yig1ehNxBahdUC+WmseBDR9fx60yPth06bHfml0ftSzhmYUvXjsDBJBORDo3OUmNX
         sq5NvtVTj5c9RrwA/OM+CgHZULKncLRvdsx/Wy9rGczfgO+x4EOVNiplFrRiRdIgi/dk
         AoXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qPXnTP3mseIxnWi5iwGj0e5kf+IUC/Zf2WfBfSwUIyQ=;
        fh=AMioeZ0MlN2yQR+rTHjcNHTgy/0y+67hs/xHEx5X68g=;
        b=XFRUldSYCKTn2FDVzad9l4NeOsQzT1TiJad7HawZqwDih7uESiLPrjLd4OsAIbmOjF
         um+SlV2VK5QEtMrOMT6s3sTciEEdXb0HwWBVfpeYSKyH1eEQRphFjexjKeb/an+3EHcU
         oGaDUfO9SmpUTCpXIbzPvGK5fs7enh4JK6gGsZ+CVl0APe0bocH+Nn+qx6nfMWTww784
         LkmE+ZNYml7RgAvgbj079CXbDWpBkt3PpDPHrbHEoykd7LkaSPPVabIjsAOB1DVvs9+5
         tZOF2caowTpG/Xt7WXmIQrr6HXiobDBf3BjjRz4ZpXD7ShuPH+Tn+2fFAIwqzs22atNi
         OMOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N80bRGaC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d73461dsi76918496d6.46.2025.02.16.13.03.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2025 13:03:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N80bRGaC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tjlnQ-00081h-7a; Sun, 16 Feb 2025 16:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tjlnM-0007mS-Q4
 for qemu-arm@nongnu.org; Sun, 16 Feb 2025 16:03:21 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tjlnK-0007zq-Qb
 for qemu-arm@nongnu.org; Sun, 16 Feb 2025 16:03:20 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4396a4d5e3bso21819605e9.3
 for <qemu-arm@nongnu.org>; Sun, 16 Feb 2025 13:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739739797; x=1740344597; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qPXnTP3mseIxnWi5iwGj0e5kf+IUC/Zf2WfBfSwUIyQ=;
 b=N80bRGaCrRZuPaYgn8bsIHidBUvFPGTTjYowD72J91lKZzv+vfJ7HYKRppuiXVJ5bG
 qv8+nGZ3mPx4W5OYdBWbE8xgEKkmZvaMCaj8HlN77SmElaOwuywaAlurhjFR2fVbsuuu
 YuMWv7Qm5ghV+gx9KYaHG+hnt6N5H2bcq4WC86ik6YXBIaUVm4KTKG7OOjYiQs3WKren
 KTAR6wjasfuRAqPdbj5WdxJbtt0t4Qzy2XstLFi2c+dDxVb/DA3nwmQA731Yt7gb53cB
 pQd87i0lSi8dlGC6sRvZJ7ks0vyH8Wnw2imdml44m/n8fdZogjEYiW95DYOMYipthjJR
 xGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739739797; x=1740344597;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qPXnTP3mseIxnWi5iwGj0e5kf+IUC/Zf2WfBfSwUIyQ=;
 b=CoAkXwEcI0qiyN95AhqCaB7cSHLTrJqrqqLnqxn2Z2BSvPXTQzuokW+OrbpIL5/R3N
 jnRfnUPdycen0euqgiLhK2I7OPB4ZCdPM7zpp58wVTdfzmqSQnN2Cx9HGw+CrjM6RchY
 Uzn/QupbTSWcE2+nvqdd03DwEdUMG2sgnspb2rFDhnqKB1RhtKioNKU9RS8bDa9j6xHF
 TtPTtz9uJW2aVC3JPRzF5wHE4LBjfE8OnmgcTP/zuCV7eZOHhe14fhoXkGQKtRedyoCR
 A1v6Pf4iahzreObh0bZl1a6kMpEJH64oAWUyLG2MMn962x7qGlZaVQE5aFYuLzcQ+m1b
 M0Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx5ZKKepTjg5K4Q4BGgBkTahqeIa8B2tTII+TtmeIWjUmYQilS4SW0Sx0uJxudCfZEEdeHq1ZmMA==@nongnu.org
X-Gm-Message-State: AOJu0YwYuUeUDB7632DkHSQusWa+rWXyP5cS8xxQUsHg3yxY2CvMOqvs
 2BD7LoWDs4+BALaZauwHi9t5YYiKgR2h7goaX/jz05ZatsEKGSl9ku9+NoIh0PM=
X-Gm-Gg: ASbGncsxbRJh74/wfxCnqy0bOAzyQe/P1lwG4srcs3gkCAZ1bX9TY3aRXRLroXnvjZA
 mdmMry195vGJzb1t5C5Ew5QZtCTExUWEoCjtj3/LrQxhsYfznX+iUkO3oN5cWV2k3yXFyGTEKS4
 NQirwinXq28Cg7b7DNCmYhC64zSaGQsj1r+FrzYzDsfeX0Pn0VRvSLP9koVgbJTEL8l4fKyf4uG
 57tuOam4IOewYksk0Lz3zEw4nCzOHBap03eEOZEUp2EII0A2XxcbX0bhSD/il39xxSXf4DuXrLZ
 NT2H+WX+zUHuJouxSakmnj7z/Ik6pdkPK4fmXxeIvPKyxsgFzZUil64rT955ND74
X-Received: by 2002:a05:600c:4f94:b0:439:30bd:7df9 with SMTP id
 5b1f17b1804b1-4396e6aa4a4mr57876685e9.9.1739739796980; 
 Sun, 16 Feb 2025 13:03:16 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1aa7e8sm135359705e9.26.2025.02.16.13.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 13:03:15 -0800 (PST)
Message-ID: <ff65a241-5035-41a7-beb3-d1c3232430d4@linaro.org>
Date: Sun, 16 Feb 2025 22:03:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/6] hw/microblaze: Allow running cross-endian vCPUs
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20250213122217.62654-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250213122217.62654-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: OObOiY1cBJfI

On 13/2/25 13:22, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (6):
>    hw/qdev-properties-system: Introduce EndianMode QAPI enum
>    hw/intc/xilinx_intc: Make device endianness configurable
>    hw/net/xilinx_ethlite: Make device endianness configurable
>    hw/timer/xilinx_timer: Make device endianness configurable
>    hw/char/xilinx_uartlite: Make device endianness configurable
>    hw/ssi/xilinx_spi: Make device endianness configurable

Series queued again, thanks.
