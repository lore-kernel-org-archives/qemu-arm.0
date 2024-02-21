Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2186504ejb;
        Wed, 21 Feb 2024 13:49:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW7t5AkX7HQUEA6LfK4cprrilTGs8IAHbWD9brniqrDSgVLsye0k/+VkTu/6bfq5LI/OTskqBv8Qz7qsKH/vjDU09dD6CmQ
X-Google-Smtp-Source: AGHT+IHio1EHExJQ7pW7VOE8s8ALn19gE32AzsUAfGNgxAC2WQMzMgUZ/7chgwrsNsIuvDz5qRKz
X-Received: by 2002:a05:6000:1f89:b0:33d:4bc4:a6a with SMTP id bw9-20020a0560001f8900b0033d4bc40a6amr8210536wrb.42.1708552149339;
        Wed, 21 Feb 2024 13:49:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708552149; cv=none;
        d=google.com; s=arc-20160816;
        b=B8NfX1xBm6Oc4iAP4d8pNwmwR4xVk+DjTtPrKgc+89HpmyK9J3sv56P/GralRogkjX
         KhD0/fnTgYJRY0AdxpP6pDGrC1PjBEnxarxahIHnfvU1rpREQJiVI65YzwWmRj1gBO6n
         K5jhoQHmNpXPcqEDDDzpJpi1u+GQ+LKMUxnwIoZ94c+s/lZMs0SNT5qUuF6dzwBRbVCD
         EgMc9MoWtfR9q5QthyBvILWgbcvKDTpnt7IwMmmI3jqNeY6enQgaoyyy8XAaBPxBlqk6
         1nyahlmUMKd3cuS70hH71Zt00OVnZNWkRgVuUgQc0MyIBdasNIpGcObn3PPtv0eans0t
         mfLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=hlxAVMQey/7xdYaZGT3WiiNZ5rWp9+/Qa2oiSDnORXc=;
        fh=qmKF+T5CyNgcrBusr9udIe2qdhj38LmAtyYKv3lOj1s=;
        b=btrPthpwCVUvqxjrQKNfRDN2l2Ct8268Td8MCgYbHFDkv3F6Bkf3T3dA4bJX53HpFi
         zF5XZXFbEGxmGKSyGBoFeedKmiQfCGZz+zAPX9CKXM5o274h913XNHcG4PiUENeTmxXd
         +31Mmh88WpdnP1Zk9qcs29+TdqAuBPPZrqlvwaAt2srugcC8pkDna/YqRt6CXFk79yil
         2OwCUD1twYVYOYOM2rzNghgJ4G4A1fZ9Q/BpHmlENGe6IRzWlPOuS/HXzRMtz/vDATZP
         v6U17Nd0ECDnIz4FJzdKvF2W1LZ7lNr2K4oAoOoHSYur3jLtTQFg1sLnTWUKkKThSkoD
         ZJdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bCnCZo+u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1-20020adff841000000b0033d22755e50si6497382wrq.243.2024.02.21.13.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:49:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bCnCZo+u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcuSB-0003SL-Re; Wed, 21 Feb 2024 16:48:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcuS9-00032c-3p
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:48:33 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcuRv-0007Ty-Ge
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:48:32 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1dc139ed11fso1962045ad.0
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 13:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708552097; x=1709156897; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hlxAVMQey/7xdYaZGT3WiiNZ5rWp9+/Qa2oiSDnORXc=;
 b=bCnCZo+uyy+2xGEtQNuGqmzfbnQCOzXD5QlHoQlg7UJiwrTmu1+FIGb6wPftLwTfX/
 EU4605k/L1AuZ07xyU+wd9xgdOT+DMRkpmP9eShqEPx96rlJcIfEk62TPNdDCsU1omjm
 dlVBSsTRq96fnOHSbhiuxPnK8IsMKLZiyXeeVQRHg2kwqD0L9YflNAuxOvQtRy3Lb861
 AYDmPAjdUfCCjoTV+iPbIB5m+zVE8n3o4yu619nd6ry+0XCOrQyzKyoyZMs9Bj+Ug5Gi
 ryR9/NXkRXKLCQDda84x5QsveBOqlAZ+3d2R0GRYuHicjYi62QjuywWvZmSIBtJxaoQC
 Yyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708552097; x=1709156897;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hlxAVMQey/7xdYaZGT3WiiNZ5rWp9+/Qa2oiSDnORXc=;
 b=OP0iED3wcDhUr0veIQ7UDrLfN0ADQxr8wTvFix4YNWD+GqCzNsqilh1GJwDLed1sUR
 GkJN58m2UlBWPgHSWxGnNZhvTEBr8lGDrA/lCIsV7XBhJTB4gsqjnam/OhxXWBqQcLPR
 ycPpZn1Mj4snLROH+DsuHn06LFA0djirojuDnAtxpzD5sV+5ydr7gINqVpPqubIwwU5F
 mB6b5kaxTM+HnnZj3GGWYoWaYeoJwk1pY3+ZkOPrUCM/y8x2kf1C3Ku0CbnNeMHvKjg3
 7SIuEi+2yBemVOIuF3jqKSVT1NAnOoY6ien9C8L2UCOcywwsItXHr5cFTa4mvslaX5My
 4dng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtqrWiiyyEErGtWw35yBx14rSG9hrOAOvXSMQe92ILv6A4On2k3xi1WBfVcCzOhI/1EfQVV10cnu5RxDaoj+zKumkL
X-Gm-Message-State: AOJu0YwfVhtjfVyWbF3EO8tR19UFZN4p5HBcW8gvwaqzHXr0xP62mpTh
 H/wmPJocqZkmLbeknM+ShjI4mA3qhaVX/Dk3zsDP5oQoVFp2GSbpn2D+kf0U3BE=
X-Received: by 2002:a17:903:22cb:b0:1db:e41f:bab with SMTP id
 y11-20020a17090322cb00b001dbe41f0babmr979199plg.32.1708552096832; 
 Wed, 21 Feb 2024 13:48:16 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 ke8-20020a170903340800b001d901c2087esm8577345plb.302.2024.02.21.13.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 13:48:16 -0800 (PST)
Message-ID: <d2f050c9-070a-4cff-b9c0-754f5d30afab@linaro.org>
Date: Wed, 21 Feb 2024 11:48:13 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 19/22] hw/intc/arm_gicv3: Add irq superpriority
 information
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-20-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240221130823.677762-20-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: eYKQqv66ia2J

On 2/21/24 03:08, Jinjie Ruan via wrote:
> A SPI, PPI or SGI interrupt can have a superpriority property. So
> maintain superpriority information in PendingIrq and GICR/GICD.
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
>   include/hw/intc/arm_gicv3_common.h | 4 ++++
>   1 file changed, 4 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

Though this patch is mis-ordered compared to its uses.


r~
