Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1756289njc;
        Tue, 11 Mar 2025 03:57:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/qtwMEIAHp6XpggxnyweYuMUDGBFYq0/LfVTiCbWO6fveZMMasrGuFxQdBVYAlCk0mnsCnbrWMX99IQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFC3H2x1qfJwUgEAHCi3jeX5RUHuUFc/gFUJO/m+iOhj2p9pB29cWoI0tP8CjHo32oQONuv
X-Received: by 2002:ad4:5c4b:0:b0:6e6:9ce0:da9d with SMTP id 6a1803df08f44-6e9006516b7mr189472156d6.27.1741690638912;
        Tue, 11 Mar 2025 03:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741690638; cv=none;
        d=google.com; s=arc-20240605;
        b=Aeles2NRvcRB/vPLnb4ucc8VN+vB6+O7NJGsB6BSe3cAkg4O483qcrZigAXrEJOYw+
         GXFoIpyEs1FaI0/fCa045Bx6XdVaU8yHGW8O5DSAv0WvhmWfpbVxLjgJVQp9c+L/QgfP
         VydyNGYvnTvn6t0dIsE9YiQB1Fr8xd08dYsvrBsCDKNJCAyPgg5fQlRYC2xbEWv2HIAf
         Z/SeHQNvMaMf7GXfmx6QUGwwYmtdmL2wfxz3wFoLLRNbh04nQDceGRvzJSveDyCKonL8
         QqlwLA4WXBeNNkmO+kf8+Y4oz8AQRf3fjcveiqrmmBmx6QnIikfJdxRTt8qFU/WmqDmX
         Jfxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YE+ZDF6UAZoVlD98S7SWWUuJGHiCd8738dOU83mR/Cc=;
        fh=jshlg5U3ua1vNkZ7E4Xews5iemX67yqKQ6Bhawsoppg=;
        b=XJkzfHc2CXp/DocuZCmKYQRagu8vERXKASu8N/8RQi5LetvkeLF7G0MDLJ0jGCf5zs
         ksSLr9/6OJ9mboH7QJ6DRU6n9MiFTrnfiyyyLoTqpiEm8TheXWCIutYko21XiZqdYSzM
         37br2GWZf0/p/Hce862jqv18VlU4CAhjvxz5AFm60Xm2oJRJOQka/Stx2b+2pXXUOF+X
         QkD1gp7nd/kpw8EGhRlYpPSCkgAXEg+S9Rr5jyskMJCsZZHd1q+5kXWJ+Wvw4/WuFfxG
         IsmPeYUw+vDxMpTNxEHcVAdTibhInISUO5Myc8bdqVNPOK3CCATzhMs9kk5D4+G+/8uP
         vx9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6CITMOH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f717599asi109946206d6.313.2025.03.11.03.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 03:57:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6CITMOH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trxHu-0008QQ-8Y; Tue, 11 Mar 2025 06:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trxHs-0008Nd-8W
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 06:56:40 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trxHq-0005qP-5m
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 06:56:39 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39127512371so2959381f8f.0
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 03:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741690596; x=1742295396; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YE+ZDF6UAZoVlD98S7SWWUuJGHiCd8738dOU83mR/Cc=;
 b=M6CITMOH4kB5hs0TI+87+hNtEQjaJVAslLQ2qDgKGMNSBH0QW7MPHaznC7Qo2Ds+Yl
 pthpwpStzJ/Ju0iPbWCySs+l4OPvd+jcnK9Ftx97zwGahSHHhVeo33nPhmVUB5reOdp0
 H9O61nScAAGmDKp0XCDdm3E8R/4JDqhbe9OeWfAt/GtBK0WG1I9KEckafAyETk/AKvGL
 wXsOA/RRusl6hJc77Tc4pFhy9W+dESnEG5QyzelXwZEj2GW3xagmHCj33pMlmd3ueFza
 IK6nGKRiDKcjOE//95CIsgBbQ1c9euZP0RAp4EBkTQ/dK9YEdvjEIxtDXYhxGFzLn5ew
 3vHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741690596; x=1742295396;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YE+ZDF6UAZoVlD98S7SWWUuJGHiCd8738dOU83mR/Cc=;
 b=vFfoRj+wRdgsW8tk8OAVmieJkPgT4AxbjE3uihegQwQ0j6RMmfGTq81UuJYjKsZVU2
 624wP+Z5vhV5cDjg/+Mss3zpYrG5fM22LFth3sbvewTbScJ1488CnZCdrf59PRbbtWtG
 yDifZ0ZHvgpNRkOSk6h/VaOdD35o02s/9/ZOj6YPSB9N3qw4gw77BnHvht+U1lDhJCms
 AupzaYKz5ugSJjEMNOWozbtEJX8s1tUxSi8pSjjIe8d+PZ8DXZ9Ss9QUSGatN27bqj1P
 WisJWU1lkjGv96isiXtdeUVpViNHvGi4qbb8SDLXjMHp+c7NLNpN259EoUlV74yZ9LpX
 dZJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuAlbQTwNv+QvZBH9/JMH+8T1bmcTKbXaj3D5KmCnkLZHUc9IeXvfApDv/UOKvwhjC0glgCTxZoQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy+3nXYliseC9yZkx1SsGSqIxwqey17TXg0lTh1L7/5/tvolXB+
 YLL5VfNJQJh9YY5HmkvTR+/3OGwQ5fM9AtSolTjdcvLnY6bGeL0P7zLPc+C151s=
X-Gm-Gg: ASbGncuqLBn3/g7XDFUTVBX8co/9OthcMxMeYdrWMMjOtmaVXD98eZX+L/w66QwF6uf
 6VKPUyDODPlWkhihvwGwj/aEv3hphoV9BxvRJ1sR7WcT5dg07ruiSeNZ/GCN7iDaPaWdCwe+xm1
 ZHiHCODjgsmMicw+jwK37Ffup1/hlRfx110hNWiy/y1KWSNtlTjCMYDBo7JFTALzdH6fmwWWyZM
 cJK/IfRLWV5JzQs1JLEx+K/WKNpFWv8c0sGU8wYkKDnIQeiIWq6gIvNpc+sBEyJVUVz8l1y13VQ
 nf9SAU6JGZtoz2GQFppMTKZfUwXLw8J2Z0BP08KV9fh2JvhC4JitpA1B4jZio0omY1o2KOKA93N
 s0M21hDNQFNpE
X-Received: by 2002:a05:6000:156a:b0:391:3fd2:610f with SMTP id
 ffacd0b85a97d-392641bcbfcmr4022361f8f.13.1741690595884; 
 Tue, 11 Mar 2025 03:56:35 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c1030cfsm18089026f8f.90.2025.03.11.03.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 03:56:35 -0700 (PDT)
Message-ID: <29acae00-8bf7-4347-b803-d86caee26e76@linaro.org>
Date: Tue, 11 Mar 2025 11:56:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/14] hw/qdev-properties-system: Include missing
 'qapi/qapi-types-common.h'
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-block@nongnu.org,
 Jamin Lin <jamin_lin@aspeedtech.com>
References: <20250310000620.70120-1-philmd@linaro.org>
 <20250310000620.70120-2-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250310000620.70120-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: BASqPlx6FUNf

+Markus

On 10/3/25 01:06, Philippe Mathieu-Daudé wrote:
> DEFINE_PROP_ENDIAN_NODEFAULT() macro uses ENDIAN_MODE_UNSPECIFIED
> which is defined in "qapi/qapi-types-common.h".
> 
> Fixes: 4ec96630f93 ("hw/qdev-properties-system: Introduce EndianMode QAPI enum")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/qdev-properties-system.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
> index b921392c525..49a3825eb46 100644
> --- a/include/hw/qdev-properties-system.h
> +++ b/include/hw/qdev-properties-system.h
> @@ -1,6 +1,7 @@
>   #ifndef HW_QDEV_PROPERTIES_SYSTEM_H
>   #define HW_QDEV_PROPERTIES_SYSTEM_H
>   
> +#include "qapi/qapi-types-common.h"
>   #include "hw/qdev-properties.h"
>   
>   bool qdev_prop_sanitize_s390x_loadparm(uint8_t *loadparm, const char *str,

