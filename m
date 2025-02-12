Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp977358njb;
        Wed, 12 Feb 2025 05:02:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXUZ7umB5KkhZcfGts77v/obR++hrJjzfSpg6DswVxzJyc7tgWeDyKmXbNeeYMhU0yoMjcc2XryW6BYng==@linaro.org
X-Google-Smtp-Source: AGHT+IG+CzhlFwxQh7dyWzxxQDr9ib/L9mbFKvTJGszgjWHwYaPj6/lb11RGYXJkAyggTI79qNgw
X-Received: by 2002:a05:620a:480e:b0:7bf:ff64:336e with SMTP id af79cd13be357-7c0707986b9mr501823785a.51.1739365332791;
        Wed, 12 Feb 2025 05:02:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739365332; cv=none;
        d=google.com; s=arc-20240605;
        b=Cn9YhOc30k4GO7eoiwdIAJVbM34jJwsnfTorDx+D2oXN3AON+9XAgp77/HulujhUe3
         M9rHpTRu/XoLCXfI26Rji/jOL0EYboflYApOanVZ8MGFVts/xo+pkY10VyTcBW/byfmY
         UxIvhRCn1FFYH/KegyezvH3Gu53+R3e06RB9jte8KM5+975yjx5QQwYihscBxfjq+7PG
         otcpwTpUWvAZgfg3cqU41q0B+8rqj4rrOrFtXTX5iymQs1LAd0NXNRtvJJPEn4RBTi/l
         SerYV0DhTaajAKlGddS4dbFY19kFQzwNWtREg29c7CliB4Ikl95tf7dCyVTeZ1/hwwSA
         z5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=P2gmYMpCTuNivtGmXJTWskYAevm5+F3zBjsIfFoSPBo=;
        fh=sCTuFlt2UwKTGA9egsijEtQJgyLU22A7d0SRTsLrzmY=;
        b=Al8SEnWRpYrnELvjcbSEUrOkk6iMq1nIM6IfjD4JLF9/djsx7xTjiwiostwsz6mOSf
         jdMI7BmY3jg7lGQcxbpEJQZ4dfx/jYhwscuCbdR5ctvVNxZ1kUW3mHZjau8OA5sREG/O
         d13QQeK2fMgrVTU03HJIz2Jywa5W3iRZG4tBoFL3L15ob/ESmQiYoWRSWoER8SXbskw2
         hWFAiXlKgD+kCs751W8EJc+wCX3M7sfHk/WI2A2lhZLBgIff1o/ctLAwT6B7riXhaM0g
         5vb6aLrt+3iiwjGDVbkUeQXQIIdCFzxIamVWJrGll4zcMs9Yi1WczJt/3tbZaaYkUvoQ
         OU2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OSPRwKLY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-866f943ee2csi2439965241.42.2025.02.12.05.02.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 05:02:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OSPRwKLY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiCNR-0004yI-Pc; Wed, 12 Feb 2025 08:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tiCNC-0004kL-Ib
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 08:01:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tiCN9-0007Ad-1c
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 08:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739365306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=P2gmYMpCTuNivtGmXJTWskYAevm5+F3zBjsIfFoSPBo=;
 b=OSPRwKLYkXtn02CIua+t4i0E3ytT/gEL66bZFN6eUfUzMTiQ5OlS74MPp6v4geLV4mGaIM
 y67AkVQj2qSdkMH7aufZksadvVT2KNWn93iAofq8TabPX4wjc4Cib2f50tuIkRtgg4XVbC
 BBWygp4l6EwFVuh/0E5wRIS103UaFJg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-l04fLxYpMFShUDEx1JpydA-1; Wed, 12 Feb 2025 08:01:44 -0500
X-MC-Unique: l04fLxYpMFShUDEx1JpydA-1
X-Mimecast-MFC-AGG-ID: l04fLxYpMFShUDEx1JpydA_1739365303
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38dd5031ee7so2015103f8f.1
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 05:01:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739365303; x=1739970103;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P2gmYMpCTuNivtGmXJTWskYAevm5+F3zBjsIfFoSPBo=;
 b=fPkRm1IbaVpbNO6bhhQCDav3KqAEmwjLhar+EI2X7GLcae+BVfKnRafMTc8bavt38d
 uVTKrCg/rtWu4OwynmrREU7nu3zPt4UZNsH4QfQERsFaRqTxnUFH6UKY8MXwbKgdJbln
 AjjgSiZvslEzc2WOvh3W4Ton4+uv3jDF7c7buyD8oTiNlgWsT79BDFVc8VjmbJNzNjfP
 4PR0WG/J6TecEw5UbSndzE5o2ghKbCSVL31Ct8gqAYslrwfV08/wsyrcH8QNpMCgFBq/
 C1M2BuQsv4BQqynhBQvG4afSpj0mJaviuIiM5e9J3XotGB6k3aauE79OkieJh7EVmMGA
 O70w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2X3Q14jPFtejsCPfL1ZcL0hC6LfXEV+wsLrr7mJcHgxH6eapdKWc4IWA6TDw5TI2X4JyIqdkLQw==@nongnu.org
X-Gm-Message-State: AOJu0Yy6aUiJEUBtMqtCpaG9wVbzIbVSS9UtS6bT8uzLyoCjH7kI2/gX
 CFfw5s0XKV9urBm+5RR1CjtVzHgjYTIdDUDkjuduI6cMW7lY2U5jqdESUdLGH/CXIx8VMUaqK/j
 iL57qxLVOoNRUBfXccGcW3JMHF3qBH1K3h5e8BVj94zGXqm9L6w==
X-Gm-Gg: ASbGnctxvwGS7wiiE9JLt5WHquFGTT2sOGJhSQm67WQ2vDF4uDTX6jmMwlDIbEtO5U+
 l84NjT1FWky0LSWIlgLKCQN6Ds6WfxueVSRzD+8ueJW4YBw9dzILxxU2ADKF1H86Ch/x8deEz2K
 28r5l4P+aamDdMP+4HBaEOkrzbwrU460wWusYIZQPfrtES7guY9pvr3J408sr7tdrmFe/GvipuZ
 SN/dj11+toUXtWZ4y30peSZF0n3GD8NXFoLKHWhutknYFWhhbjGBqQYR1Ezr0BuH+fMdczOmYMc
 vXHqCW2l7FFH2VecJ9y0Y5R8rcBJBqtRKw==
X-Received: by 2002:a5d:64cf:0:b0:38d:b57e:7202 with SMTP id
 ffacd0b85a97d-38dea28d854mr2815753f8f.31.1739365303395; 
 Wed, 12 Feb 2025 05:01:43 -0800 (PST)
X-Received: by 2002:a5d:64cf:0:b0:38d:b57e:7202 with SMTP id
 ffacd0b85a97d-38dea28d854mr2815588f8f.31.1739365301561; 
 Wed, 12 Feb 2025 05:01:41 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-37.web.vodafone.de. [109.42.48.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f227325bcsm246370f8f.50.2025.02.12.05.01.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 05:01:41 -0800 (PST)
Message-ID: <9241b53c-cff8-4a09-91e6-7f556862424d@redhat.com>
Date: Wed, 12 Feb 2025 14:01:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] hw/net/xilinx_ethlite: Make device endianness
 configurable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250212123659.52764-1-philmd@linaro.org>
 <20250212123659.52764-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250212123659.52764-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Yqp3s-Qa15qh4KWnQip15uAw9iJM-8K91L11lpM3wus_1739365303
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: xRUw7zLWA/BY

On 12/02/2025 13.36, Philippe Mathieu-Daudé wrote:
> Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
> of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
> Add the "little-endian" property to select the device
> endianness, defaulting to little endian.
> Set the proper endianness on the single machine using the
> device.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Thomas Huth <thuth@redhat.com>

