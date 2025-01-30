Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp60076njb;
        Thu, 30 Jan 2025 14:09:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUStEQ9fIAQUZwxccVduqNzODzT8bKoi/QcQ0FFIokoGjpHNSNlyz0vz4w3xkDROau2l4l2NiVKTQbxyQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHWCm24TePAGJVIVzidOD7HpayKx1PqOusmbcbJxspL4xKO086lNjI/SYFOqsKv3AqpvPoU
X-Received: by 2002:a05:6122:4f8d:b0:50d:a31c:678c with SMTP id 71dfb90a1353d-51e9e3e850fmr9200279e0c.2.1738274970556;
        Thu, 30 Jan 2025 14:09:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738274970; cv=none;
        d=google.com; s=arc-20240605;
        b=RR+psUChpDBykDTIk4KIT4gm+r2ZyBLrNwenqhW+lVtHuZFvf+NHQFupXP5S3bKfmj
         Jwl+tm4Ng4BdjMtQkpFkD6EF/x6TSGChPJ5+Z2kNhXJC/gV5OhMwPlqgcHuL2VXoTM6Z
         wv3Jet9IhSrVAkNTdfYnBZmTPQ6hSvu8w9lPc3h5SavjAlpNCQ8ZPGiZHVK/kfXrvrVG
         3cVJtIRTS6yknyjB8mODWj0BebgPGy/fak6R/7AVdidDuLteg6X8bGK8YckXOWrlJYwC
         s5SEisc+M6m3pGZcDB5fxqVGo9CWxyw1iYMYtqhGZgUeuBjiVjGi5VUfI2+kQzeFT+Ws
         Fe9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Fn/F6x47VKrDSM0Uhbt6IuerLOa+Dsq54IJS5cGe/U8=;
        fh=s0mGkcEkf6v/C1RgMcAh8WiaQV7LPFqz8rEdaK85oVE=;
        b=A5prOlg6D0+hS69F24hvPYqyw+bGdO0kUBuiYzS0/zmg420fBRv4iPNYbZGWFYScGu
         YOqDdfiD5Rr/yTCd2NstAs7mxz74KCt2bWunhT0+7s+J2jg9tOa92Jy0zAgag71sa5Q0
         evu0u/xoLxErGAc3SYAfa5D2chIkdm0KoxoUo4YmGhGfBCj3eIt8vjVZMwnXBZGoeWvm
         eynBQWcsuDnEOloi/pBA4vB1JzzSmiwwr0PwtdAVxJPKmLmQ0a/o1QNN+LprizeCIL8L
         zfth9MAZ1B+71z8MqCc5+x/C2Jac9LkgtAwqx4FdJSBWKE0fGnndJyZCsp/EzwGdgeRx
         8UQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SdR00HAb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51eb1c17699si724915e0c.70.2025.01.30.14.09.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 14:09:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SdR00HAb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdciz-0000Gh-0W; Thu, 30 Jan 2025 17:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcir-0000Ef-Mp
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:09:17 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdciq-0006SL-3S
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:09:17 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385e1fcb0e1so699650f8f.2
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 14:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738274954; x=1738879754; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fn/F6x47VKrDSM0Uhbt6IuerLOa+Dsq54IJS5cGe/U8=;
 b=SdR00HAbtpVPnFylqoPdVYkRfv+Ibvw41O6S8oVT6keF5j9bwwYlTlNcEDNrRb1irv
 pQcTn8Vbe/dI2ixC/VTJx8oGicB2HR/DZAyYfaQEoWraFHiYSBOX07mB9dxLgBhMg0Aa
 pfou4yYv3OfZAS5keAn7h+iCpnQjGGK4svZw75Be9+L+3t90GsB8SMwpEvF0c4wF/DdK
 VwPfm3jc/2aaOjsigKVmVCva+PkRR4SkdVe0eNQzkNz4k4t8MQX6YzaSBuOGnRg2ZyGl
 EKzr77F7e7LdOfASL2aKMiJ7krro9Yje3qNk9sTSJoUMEib9bKar4C9I3g4MNFmEUSpx
 +d/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738274954; x=1738879754;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fn/F6x47VKrDSM0Uhbt6IuerLOa+Dsq54IJS5cGe/U8=;
 b=CJHyr/dqgU2cIz6/ktgnlXGI5xP3ph1Kp620gBd1HoYOwwfFpdf2g8YEcJJDP1NvLZ
 3LI0x9JveSVqIodvgI0LXJAZXa+HT+OndFC3Ni21GOaJflAUt/2eep+SI7LiHruIb660
 uhMFg2nhN99xGHsx2HmztrzLI4xHWgAgA/BQ/KBHdFg72cFA3GNSdBDJ4r2qk0teyF03
 j2l7hiDLr5HDG7uOuyDKmW5Btw+WNvih7z/CMTf/4j/7kd8ZiR5KwFTKh9vmP/ybaQnY
 8qg2V9uAocQZidbgjkEsr58fs8kokGda10zwBwu1YUxiheXMGWUG44/GMNBqri6Xykva
 DUSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnaP55mPWRGdumObJvtdom1CrRfI4Phh/+DFCBhDgK0CnHrn8ZrzRUTizxPSkFxS+pnMrAue2yow==@nongnu.org
X-Gm-Message-State: AOJu0YwGhtDMV5hWDtLKmmXd6EYz9CKeNTUYfTqX2tvImw3YAfDb5xgU
 GgFKWVHdrX2Jxxes/T85n6hVCHu9M+A1Rzz5GcD/1e0h1klH8exuZYMZWcpmhPk=
X-Gm-Gg: ASbGnctfIr2XRiAt8EiR+PTmsPvq1TkHJWGujy6G1AZ0hFEoTBe1FsHO8XIzCye7bfI
 nJzaU0wfIxCdVHYDqEzxvqDh9Dd4xb/vWJpIpD0u/j0awe9H2EkBo7fdbaKNjI2tEb3NygFdqR7
 qYqxgqoNPVSZ/PinXkhAJu2v/xug2qooBrsBVTXXtJrtNIyMkxAhIl1IRShmF3WYrOx1UNQk/IS
 UJAbtgEWA5M2kpguQ9MJBdIjtliZjlalV14I/STkilysI6a6nIPjIqFXcQDX09l1Vn11VUKVEzO
 EPb53chXqr5wk9EfDSBByhdlLX0mL8V6AsXjDWDAIbKR4mcoD90p7dF7Et4=
X-Received: by 2002:a5d:59ad:0:b0:38a:86fe:52dc with SMTP id
 ffacd0b85a97d-38c51949a3cmr7701983f8f.13.1738274954505; 
 Thu, 30 Jan 2025 14:09:14 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c10191asm3061626f8f.22.2025.01.30.14.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 14:09:13 -0800 (PST)
Message-ID: <cdd71a5d-f754-4224-ab0c-96ce5b18a9f9@linaro.org>
Date: Thu, 30 Jan 2025 23:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] hw/sd/omap_mmc: Use similar API for "wire up
 omap_clk" to other OMAP devices
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
 <20250128104519.3981448-6-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250128104519.3981448-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: H0qR5OZQzppG

On 28/1/25 11:45, Peter Maydell wrote:
> The approach we've settled on for handling the omap_clk wiring for
> OMAP devices converted to QDev is to have a function omap_foo_set_clk()
> whose implementation just sets the field directly in the device's
> state struct. (See the "TODO" comment near the top of omap.h.)
> Make omap_mmc do the same.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/omap.h | 3 +++
>   hw/sd/omap_mmc.c      | 9 ++++++++-
>   2 files changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

