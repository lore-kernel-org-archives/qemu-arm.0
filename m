Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3564927dlj;
        Thu, 16 Jan 2025 00:24:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUk94zjUZqYhfZ7bwr5buAnRaoSPHZa+3BuyOe5lABG1w3OgHwK3lE2P/FkmhdKqmrYEENZuo+4TSmMTQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGeUZP/NeNs8nDQAj6XhQkht1d28t6MIv2rH7rJkr5FuLuPYNpEgvG6rlbsOcFTbQf5i9VB
X-Received: by 2002:a05:620a:4694:b0:7b6:d34e:b21a with SMTP id af79cd13be357-7bcd97af965mr4980635585a.37.1737015873598;
        Thu, 16 Jan 2025 00:24:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737015873; cv=none;
        d=google.com; s=arc-20240605;
        b=XTBxbnAe+6I2KJTQ9VXniJusSYqmSMhU42clV4E73pDMHLTyaaAr3kajnHziUI10aS
         Ys+M6UAyuz4vd/qMv4nTlv28B8TyKmmKPSeOcuzTiuJIpXL7c/OsZ6puJRyxuL3XW2wP
         H+Q3zDBDH/RGq414tQ54DK+YJPFvD7nxB4LiZ+qxfDP9JhEhRqSOEpAUqTshRkUe5+cH
         lzE4hYHBLZQ1SFL4JisYO29t+WmCBJ8NI8ktQSmS8bXWGVJ+VveUVLPU5j5aaYqSxSCz
         QkLVz1SH1dCrifGBZCRoCEC25P3LQMga2WXRqvTV60A6wltVnAukJvhTl+ajex9E4BYa
         vNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Y7Stp3bDea/xV52G6ssm3Cqf2qTdmZUCLjGzQ3rSlvc=;
        fh=hzALL523gCYuWwt0C0io/bexMjL0WFSioFoZfUNygjI=;
        b=MLdVzgbrrcd/RrvluHCmPE0Q9Nnqpz0mDfLOVd2nTVRWVIIcCLwzN1xEALh0vevSML
         1CTR+lmE6VM894iMMnQCUKW69hJF2/dchV8BZqhGdNnEXWUz6kuazcq9tlPIynaAc3Ht
         vQxgsuC6st7uYYTWAtXYwqr1xbFhBQwJsEYx7DBgghozkaVwAowzr+tmBBqn2BcDpyxl
         q4Ta+5dqPowx9/d5jgC0PK4Ys2v9AefgBksvtbjYBqXnFNK8hyWsaptVteKm4FaDhgU2
         /jkqtH3ny3KkNWnSWUuQkSYJRw3nUOFK3DiUkCbhAYQHL8/SMX/3XLr4+xTtgeJoJfz5
         wlTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CYa+UX7V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfade99befsi170499806d6.195.2025.01.16.00.24.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 00:24:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CYa+UX7V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYLAZ-0005Dx-Tq; Thu, 16 Jan 2025 03:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYLAY-0005DS-Co
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 03:24:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYLAT-0003Im-TK
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 03:24:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737015836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Y7Stp3bDea/xV52G6ssm3Cqf2qTdmZUCLjGzQ3rSlvc=;
 b=CYa+UX7VZgS5M/bnJqLFWEpbvfZVmDUKnONC/ZXtxArz5npcBPGy511QGdO0ROnjtl25/o
 auSu0F9IAyOqt25isXFR1xjGKyKT/dwCC8UV4sW6vXq6u+qIim+kArjCtcsYWSfKN85fPn
 NQqYS6eZJYL/F3oASH2c97MVhU7cBPU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-Zt4iVSvYMT-oWkiODy5Exw-1; Thu, 16 Jan 2025 03:23:53 -0500
X-MC-Unique: Zt4iVSvYMT-oWkiODy5Exw-1
X-Mimecast-MFC-AGG-ID: Zt4iVSvYMT-oWkiODy5Exw
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-388d1f6f3b2so264069f8f.0
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 00:23:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737015832; x=1737620632;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y7Stp3bDea/xV52G6ssm3Cqf2qTdmZUCLjGzQ3rSlvc=;
 b=Rx8F/x5bp8pb4I3fMx2A1prDH1DMHgpYZx9EnPHuTwfb2x9AGeEoFLqWFElTCMHS1H
 c5L1biTm8TuBxKXiEs95sjGJHktdp4E0v3YsvO6360aAemX1rGUve0OuRkWrwKJl9Nf0
 MydWaS2Itee7W+D25S5kR5TMSq1r4kaYxLvd/w9Q4bNP50TkdUFCmKqzKF2KlJHDCz6u
 aPCKac+C7wHXBmMN93KNmKu6y7hPi4uF3tAuBCGiMmzcpyjeqx3TCaB1jbyUcnAMhfF6
 noAT8DmZD/0ZfebDHJ0yE4O74peCOVHUH0ehFkeSCNEXZ5u7V+z2/w9pU19IfdupR8mr
 sLpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBlx2+72ryTtgX4SttF81TOthZBX+HVhFps6YO9xHzmF7fxb9/jyWOjHbAvcVpsb+jB5fLMgadqA==@nongnu.org
X-Gm-Message-State: AOJu0Yyml3EDEOdDRsuTmLfqiKNR5ivsXZjpUBWz2mo2+3VWEWZ2he5w
 7rsYZVJ9ojMYPzCd2wwhOKChCI6XVW7h9p8RIszq0IhqNzEtIizeTDnejphg1rnuo6OGmmDBKkp
 J/to50zR0cZR8KoaXnwN9sYkh+TxUnvk528paPO9IyHQn53Ez/Y90GK0C4A==
X-Gm-Gg: ASbGncsI0VAJoxcjweGS77vgCHRlIQx9Pk1ilL+E9zYpHgnG3Y1h0Vznf/FJ+F8hDAO
 7JzHAHqcYgtx7VecsjXniN7KqzaOJ5LUCrssT7eflV6XVWM97HaSZY1jFBwKhcORzN8vaghHHLa
 dwE6zwsgjk1rgwvzt5Z48Qxb0HlYAWwuwWcb7H0PLX4WxuiofwOmyxxJwFddtPzGHEz3NMViRfQ
 hLcGYVrg0JmnujTZWBlizrLRDlF7032WjX8zi0eFHLq1t+1AXlxk/m6xrpBXHBEz+LcxnLCdvF/
 bUDXNSm+cYcT
X-Received: by 2002:a5d:5887:0:b0:38a:673b:3738 with SMTP id
 ffacd0b85a97d-38a87312dd3mr29305284f8f.33.1737015832217; 
 Thu, 16 Jan 2025 00:23:52 -0800 (PST)
X-Received: by 2002:a5d:5887:0:b0:38a:673b:3738 with SMTP id
 ffacd0b85a97d-38a87312dd3mr29305262f8f.33.1737015831916; 
 Thu, 16 Jan 2025 00:23:51 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-119.web.vodafone.de.
 [109.42.51.119]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37d050sm20153724f8f.15.2025.01.16.00.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 00:23:51 -0800 (PST)
Message-ID: <9907201a-d6e3-40d4-ad10-e07c9964e7ce@redhat.com>
Date: Thu, 16 Jan 2025 09:23:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] hw/arm/virt: Remove
 VirtMachineClass::smbios_old_sys_ver field
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
References: <20250115171009.19302-1-philmd@linaro.org>
 <20250115171009.19302-12-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250115171009.19302-12-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jvP7ghZiblWangrGxfOITSwbvsRweJvmzDePhRHOa_c_1737015832
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: dHzPuGmCqouT

On 15/01/2025 18.10, Philippe Mathieu-Daudé wrote:
> The VirtMachineClass::smbios_old_sys_ver field was
> only used by virt-2.11 machine, which got removed.
> Remove it and simplify virt_build_smbios().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/virt.h | 1 -
>   hw/arm/virt.c         | 4 +---
>   2 files changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

