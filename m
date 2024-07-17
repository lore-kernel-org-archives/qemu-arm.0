Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp705420njk;
        Wed, 17 Jul 2024 03:08:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUK8snZYSNjWH3zAYbZT/83kz5JZ9SIEEvHrq8APAghf06/L9xQjwdtmY6U2FzYC1fFzxPRbS7yCCGlx353dLmOcrKEzllm
X-Google-Smtp-Source: AGHT+IEiftpIAs11h3toQmh+J3P8LrmbDKNY6Tw8SBKpV8FCfgZFu86A/HCfNfdLvCVcCA11a1Gb
X-Received: by 2002:a05:6214:e41:b0:6b5:d90d:ea3c with SMTP id 6a1803df08f44-6b78ca605c8mr13793366d6.3.1721210893932;
        Wed, 17 Jul 2024 03:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721210893; cv=none;
        d=google.com; s=arc-20160816;
        b=h9IMWe6pWyhXDUvzpJW2jfiXI5zJ2A90POfhhkT7faNhguViA6AG9LHJ5+vbuagzb1
         NHpfoESsl1CyJ8VMQVGHhz2CMTUAxAgPzJ0+4EEQpKJR/MLzaFn3AlAtQHTk7DTnRRMJ
         2gI7RQywLwlFueqfgIOqM8He4X2yAmFLDSR9OZICacyEEQBjyOtf3KNxh3x1IKi/cvg6
         mQdPrR69OvGOOD6F7RJEZouYfwUyYqYFozAbB6AnS6inPGP0KiPagK2/C/QMV1a2ps8+
         eLRzqHte+2FcapomPayyV16wbDMAqoIhcdGf7tuST7PcRxBB/26JV4G8Ilixa8qzkLh9
         XrEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QEXmQJgpZNe0qzeHejZ78j2XMC1F/Zpcp8sm1S9LZNQ=;
        fh=59lxnyLqla6lQDb4FEdzaiLZ8n+YiABebnoYublihno=;
        b=MSSBpdYcBxxoGuaODSTVZYViczTWj3oi1E0lYPPfrL7nUqqe5t99ZD9NFZKdi/2YIz
         3B79ZmkoZsWK933DGUkeG6c26NJ6Nt9A3zcIYv10ZsV2SJaQTfmU1l38zW/04JVNcDa5
         ZTtm1fwhc04zbvDmfsW8D0KhEidnZ1kg8hL/N+/SZ2/1WbatxYdtsJzp9A0gleyJzy+m
         Z3xfzSpc8iKcPvH6FTP6t1ig6tG/QIgibM6OtJ6U3cyrXEXMqyTJGRp49NEfNVCHUeIZ
         H0U3KVR+7LymJixl3uir3WKVC/Kqu2bWGmC1Ea46TDajqULQiy/RT0ZFgowXPWwl8vjy
         4teQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MYVm6pOw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b81408esi96883141cf.581.2024.07.17.03.08.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 03:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MYVm6pOw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sU1Zi-0001me-Ff; Wed, 17 Jul 2024 06:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU1Zh-0001gR-07
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 06:07:53 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU1Zf-0001TW-En
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 06:07:52 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-368313809a4so241992f8f.0
 for <qemu-arm@nongnu.org>; Wed, 17 Jul 2024 03:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721210870; x=1721815670; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QEXmQJgpZNe0qzeHejZ78j2XMC1F/Zpcp8sm1S9LZNQ=;
 b=MYVm6pOwdgS8XTq29fulEFX94MBI4yruAPoNcrlxUPWYcMyfCrGa7dtGcBRYlwQ7aP
 Fmasq+ZUC4VAU5QSFb4eFbIQ2JHG60MTC2ZNmFDmeo1mww0bVYNjgpJspPlj93wQ6FFu
 q9WtAC69EH1gYugqMEZ5hRT2me/H7/vNh0B90xsSTn6W4p3me5V7TI33B0fVOlAI3bkw
 W6Z4dN0tV5QSxNwarDVHmTRJTYmDlXec5bSBdSHmgUf/562tBobsd3NnWgRBxTTDWj2W
 GkuJJM+CvjH9l5HTTVe3a6AofIRdGRDsokfcietBAOudS/6Wz2Ys/LUUDFyxsivQ3Mbq
 7NPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721210870; x=1721815670;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QEXmQJgpZNe0qzeHejZ78j2XMC1F/Zpcp8sm1S9LZNQ=;
 b=xQ0Mi5XWNF7o6nu/FXvfAP09loKndD3aGvTdZM/Qfs8mgEr3ixxQ9/7JXpzwpPEUaT
 LnbOXBWk3j4UzxjVNPfq5GYcQmI1cF7jihmDrC13XUSuGZQbm9AYaZ9405jAdZo7K/Fg
 FaGWxHioMib9fFirCeKKOqIml+T5ZxZ3Z8mlFsDR7m3l4XAIYWP74Bp2S0+9Z3Y9qW3c
 0i2fbC8y/pQO/V1TtvhgCdZ5mvgmQY8bdh1PVWiK9Ly6Fu56RSOtLFUS6YYapdj5sshY
 tricFyTJE0vgi2fclXttqYQM1/3VkHsReSKbuB08gxgcWPkCxU5oyZSpMAfniVsNSZ8q
 Dtxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL4g0wqJu+Ue2v3v4NWJTq2cxfpWZnST7WjQHO/5fCcvZu5IGclsWhICehjDgrNZbHMRFjbPYs81w63aC61YKn+/o5
X-Gm-Message-State: AOJu0YwczGAGPeQL6jgsaDfP3VwHcnoJh7ObO7vKv5puHJpCSDIsr4/n
 XDwkGXQBhuht4jt6bbnPHbNjPeMTSzYldCO7ILLL7lASlk/PLBaxrT8odUBowXPz3NVOUZwMNM5
 Oyv6KYg==
X-Received: by 2002:adf:ef08:0:b0:367:89ae:c204 with SMTP id
 ffacd0b85a97d-368273d6961mr2992482f8f.12.1721210869780; 
 Wed, 17 Jul 2024 03:07:49 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2cc42esm200985315e9.32.2024.07.17.03.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 03:07:49 -0700 (PDT)
Message-ID: <1228cc4e-f8ba-4b1f-92ba-0b35c0aff9b0@linaro.org>
Date: Wed, 17 Jul 2024 12:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] aspeed: Tune eMMC device properties to reflect HW
 strapping
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>
References: <20240717063022.549849-1-clg@redhat.com>
 <20240717063022.549849-6-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240717063022.549849-6-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: YRKJK4wu9lDh

On 17/7/24 08:30, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@kaod.org>
> 
> When the boot-from-eMMC HW strapping bit is set, use the 'boot-config'
> property to set the boot config register to boot from the first boot
> area partition of the eMMC device. Also set the boot partition size
> of the device.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>   hw/arm/aspeed.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

