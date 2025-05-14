Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1026120njb;
        Wed, 14 May 2025 01:19:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXbLRg1u7/7LsoSQ1StSaIzsBnC0yKNrZNYaHmpb8En09Oa+5dag+kuVi9A1H5FNQw/b2VTNX6AwTffSw==@linaro.org
X-Google-Smtp-Source: AGHT+IEa0iU5ds+UjfVAjIYeR+nZnieXiX+GzCuDeg3PCAYC/tlHBiOyf3Ki7QDT5GMtMeGq7EOY
X-Received: by 2002:a05:622a:5c96:b0:494:9072:e5bf with SMTP id d75a77b69052e-49495b80821mr45618081cf.18.1747210743030;
        Wed, 14 May 2025 01:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747210743; cv=none;
        d=google.com; s=arc-20240605;
        b=WbCNdgSEWb2pWZCDfP6tYj+I5Qwas5kGwep2lvlqkfjfawhqYJKFZD7sx31nO5OTDd
         A/ppfExYltLJVaF32FrgSFrcwU2/CeT1+sdQ4c9WmJpqPBk3SPipyXm8ODRMSE7pUMxi
         cf+KqtOwjNJW051RKp7Bj2J1ILT3KKX33qHVDfyV75JZdTPbcUHZ/Ia5p5ksB7oRCaKd
         12dxpG4LueZ8TUfm//qd/yAO5c6eMEKxgAIi99HR2bBzwbeEYCpnzDHldcZ+YySb7o8g
         aaX+x5N712N1u+owSmLEMUVwbrrXuMjdjciB30TLlnxdzcTKxvmJfSsIitiWib9Q02oR
         e1cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TSd9zCPFpm9xCB2kRVM1sXd7mZ4FOuxpIOIZe1xh1bs=;
        fh=KLDW4z3xomWV9kpTuY4ifdltBLUAmo6YDAPCJxfAFbU=;
        b=Brn5XqW+xqGKNWS+BlXxHoBfS/3eFTxH6hQNa1wwMYTU7xFW0l3nFhjo5EMC0WmWCQ
         h7ikIZa8YbbxKx0B9mlqk/HHA25VhiZ2fVScZWaplZ5psA/6lFmD1AYYP5scCCgOSXl5
         8QKaw09eaINgl5Wds4cd1d4l9YDueT3UHkzbJaNiTit8IrUF//8zQ1qvdOGUZoXhTfve
         vJWeBeQ7msygz9P2IEjMRIZ5EyZkvBFehIOmJwKof/Wp1Y6Fcu25gNG2BfH3faVKYb+3
         W0FCiKcTDRClxt0zMHlGdYwkBp3cTfOHJUIwbkdML5k0zjJbrDtXosdrYNntfsAmd+y1
         AXnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YK56yLCx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4945259b9b5si123305091cf.571.2025.05.14.01.19.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 01:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YK56yLCx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uF7KG-0006wt-SX; Wed, 14 May 2025 04:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uF7KC-0006vb-Qy
 for qemu-arm@nongnu.org; Wed, 14 May 2025 04:18:49 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uF7K9-0004hG-24
 for qemu-arm@nongnu.org; Wed, 14 May 2025 04:18:47 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a1d8c0966fso468554f8f.1
 for <qemu-arm@nongnu.org>; Wed, 14 May 2025 01:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747210718; x=1747815518; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TSd9zCPFpm9xCB2kRVM1sXd7mZ4FOuxpIOIZe1xh1bs=;
 b=YK56yLCxckAgmzXZ5+RntEs3fV1T7PqlAygpur0KeMdb5rSsSyCLv0YwHJNA0cyiiY
 D4lGVhfSFtt0RYsOo+WHLNc8f4agjZMpT5LAwvlPJJmQmcknNYdxHRiF1sNfV46OFG/I
 8uf/EoSdgpL6auP0NRIy5ddNjwUkIJ5+DPqpNScPE0F7e3cNacUuY3EneL0zXDZ5DTZ/
 gyv6l8KEhV3LEKRzTU8ekKoLOmx8vyNhaOfGNdpUgI3BxfkXqnOgFtkhy8YkT0rPDmv3
 BlVVJqEmPJAWKHlRMHgUHVa73twTd6IIhoeVPZ1UPCP27gx2SUqCZ50fJCOaPjsSkxsa
 ss8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747210718; x=1747815518;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TSd9zCPFpm9xCB2kRVM1sXd7mZ4FOuxpIOIZe1xh1bs=;
 b=gmASyUX4Ihyc+GYG5d5CZ7SD9CBcjouk8SZ6Z8RR+cnV/0/QY/l8jraCVPVeoePjeL
 HmAxE7Ixtmq+E5O83Z3ZgKZXtaz5ujzG/pP2DQV0DZSlv+U8wvmB2BLNCf2ogfCx/f1N
 9f7EF/5i0KQrVDA8kHxv4XIyeG8Da33aFZYsaEgJywokM9H7Ma00ZF2bFVAXGNOksmpn
 XqRcQyHhK80U6gewopAl/58vLNXpfag3Qhm4PbSM/ccjjkNU4ySGoo2qUwzstLO74zvg
 bBXRoZEi5VFd8FHXRSNF6ALJkkhv04vMDGNwSp0pwpu91qbUL1B8awmPxEZimP2+43I5
 cohQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhKuUW22og/gUoH5R/PdPiem4L5BVNZZh4iMjWfy19RzaUntNPjONEloNyUhnXc09mIYjiRCdzBA==@nongnu.org
X-Gm-Message-State: AOJu0YymE8SWj1fQN/hcHjf1RmtVkVcqJ4Y1ZJwYMtTL/XooKTYlo6Mw
 iOGxSVi5eiEF6+b1X2UI58bQiClEKiKpvv5HeVnh/hFCu1L2hPscdVpfEirXIgk=
X-Gm-Gg: ASbGnct9LG8r4TbhkmHKHZyQQeczYXC3WNjkt3PxUIHG03OdHFSHpPH3XpqG9//ah5U
 tajK5T1RkUB71pQx9NOpd5N15wvlQEozSkZhjYdxLHDBaYcR/z1X3q7SWFbtmr1tPNdjwXXxO6C
 iq5v+UOZSX96MpKUasgan6Lftaqpg3u64CoGZ7vxBF1QMyImWECk6wSVPWcNTeglk2QxG78teym
 YG9MPxEAubkXI6lXvjsOv9zcnIZq5Kx6c8GP5LXVhdyyeN8/iwUksOjuORDojHalGfWMqkX1uXN
 XdFp8K1vaagjg1RYTKtHPJDpX7pb8NyK27LfEHnTBG9PL4OyGj/lET4RqdUxk+tbQIUFiSgi+Jv
 ODTvibVnLHt2XOUmb
X-Received: by 2002:a5d:62d0:0:b0:3a3:4220:1bb0 with SMTP id
 ffacd0b85a97d-3a342201bd8mr4357468f8f.18.1747210718595; 
 Wed, 14 May 2025 01:18:38 -0700 (PDT)
Received: from [10.61.1.204] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5d6sm18613745f8f.83.2025.05.14.01.18.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 01:18:38 -0700 (PDT)
Message-ID: <05b1a81f-9eb4-4066-8a0d-8c13a9a34332@linaro.org>
Date: Wed, 14 May 2025 09:18:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] target/arm/tcg-stubs: compile file once (system)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
 <20250513173928.77376-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250513173928.77376-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: Im9Oyf1j299T

On 5/13/25 18:39, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index b404fa54863..e568dfb706a 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -48,7 +48,7 @@ subdir('hvf')
>   if 'CONFIG_TCG' in config_all_accel
>      subdir('tcg')
>   else
> -    arm_ss.add(files('tcg-stubs.c'))
> +    arm_common_system_ss.add(files('tcg-stubs.c'))
>   endif
>   
>   target_arch += {'arm': arm_ss}

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
