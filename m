Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp752121ejt;
        Sun, 26 Nov 2023 20:26:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwEWytW+enqWIzPrpgd+0NKksC9DIikea/2CrzZjtRMppM9qkJx1APvTzNiZYLWRFrQL4N
X-Received: by 2002:a67:f552:0:b0:45f:2a26:aa7d with SMTP id z18-20020a67f552000000b0045f2a26aa7dmr9600791vsn.15.1701059207765;
        Sun, 26 Nov 2023 20:26:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701059207; cv=none;
        d=google.com; s=arc-20160816;
        b=QaCQJBSgm2xkD1rqelujVZ0+GaQwTOw71nlrBS9SfHVsxEzGI18Q9rdFuZ3Qxbp1nj
         Ju5uyVWHy0bjtl3e3xPsNsH8Ypu+s6Hzs2E3J/KYC/+snG7Gx4AWcu6ha+H4qaoT/R3n
         p/pMEjUKiGQuXUr0x0eQUQ0mWOC5P6q2X7qoNXGt37jVh8dXxomNL5d1fhmY8jYQg4Oc
         eQq2DzBbjquz/2U0D7X1y3RaKV8NBo2AP+a5HoNA/Y5FSN2p7oBQgMnak3IQW4pTbX/F
         UXMXFh5jCpGIPyVPQOspqeEhEDUFHg+WsJa1hSeuuIZA5ZbadAhKux8DnUeuUPawTGO/
         hwTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sZZnkvSfitGisLGL04wWrdlz4T2wKJDLQwGw8KJBvFg=;
        fh=YIs6fi4xux502Hus2tOT+Pch2Mum+BNamOXX0MbPDX4=;
        b=EPkqPeV0ZOcKQKFXgYPzkBetK745mGaZLkESEVKw0a4ci/P3qlRt1ElrjxGe9M09/r
         roXgTGkdoprN5Goww4UmMfagnWUpmmUNgfR6m0oovQFFFGy5WheHidpvbcrPVfSPjlcH
         XHJDcvXMK0L4aod8TQoaVvxLeXsU6Lw9sW1vUzcCqIGkQCYshiYmxbJVHSSGY4IaAyzg
         7FYqxKrgALQVDz16lc/yHYFttH2CkDLS35vcY4Lzq4r/ooYj49iCxNi9BdDGf/0qhwtS
         cvWg8YMqWhERiVKMQcsYID99BMLqxsA2VSlFlZ+2cOYthq2DGaVDKPbjdKShvC8OfXFa
         z7NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PB3rrbDh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020ac85953000000b00423737d87d2si8644399qtz.36.2023.11.26.20.26.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 20:26:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PB3rrbDh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7TCn-00035C-BJ; Sun, 26 Nov 2023 23:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7TCl-00034P-OC
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 23:26:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7TCk-000844-Ce
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 23:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701059201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZZnkvSfitGisLGL04wWrdlz4T2wKJDLQwGw8KJBvFg=;
 b=PB3rrbDhFhAYGJu1tpDRetEJdZ4RPIsc2foTm4wermkzhGFhv28rcQ+pkcLhc5FfQMPOs8
 CqP2SgElbzfFRyVr3x+t3QJzMiLKPZulmibAbKLwr3e3hx3tkvLVVaeRN9qejPFhZqwvYQ
 uAC1kqYpmpygcG50ppHxzZiWfQ7qW+E=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-Ip9rci5iPA-iMBbgrIxVoA-1; Sun, 26 Nov 2023 23:26:39 -0500
X-MC-Unique: Ip9rci5iPA-iMBbgrIxVoA-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-6cbb6ff734dso3879067b3a.0
 for <qemu-arm@nongnu.org>; Sun, 26 Nov 2023 20:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701059199; x=1701663999;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sZZnkvSfitGisLGL04wWrdlz4T2wKJDLQwGw8KJBvFg=;
 b=KIfHGdFCB3fENU9WFtgy85sCMek9IuTnvgpt9T6q1C/etkcOwQewyH87rfF6EgXE+q
 02o3nGjxXGL52DBNcjrAsK8koKrjfPapS3op/xj3t1GiIqu1IFiaNysH7WSNcr9jEiUz
 MonIwm3OCDH1g3J7pFbo90Vbxm0tiKOIfXZdUp71zVjWONrccN36eHy7kWlzk5sL2uZe
 seKz5ifz0wME3a5j4vOWTd84OeAxMpzf9Za1KV11xv/gJDpW2w/zUIFAfbuXCMp8MpCV
 R85rVH6b8eu7klY9P9+pzzaU6BU6Lv4IcW1L/IcMt4uS6LIeIjnZQuQBp6CZTqAfIplR
 31LQ==
X-Gm-Message-State: AOJu0YwhkqXK4AQrXkataIHCeUAv2qCAK/NmrNmOObIHQm13QKBL8Tkk
 YqVEHII6XxhIEVlmqpUFg5Oyv10SHSSWP0lj4mvttoEW8pYpO6GKABe1VOqQW6Uetj+7yT7L4DG
 GscRG1YEuZTsk
X-Received: by 2002:aa7:9a87:0:b0:6bb:8982:411c with SMTP id
 x7-20020aa79a87000000b006bb8982411cmr9200720pfi.8.1701059198886; 
 Sun, 26 Nov 2023 20:26:38 -0800 (PST)
X-Received: by 2002:aa7:9a87:0:b0:6bb:8982:411c with SMTP id
 x7-20020aa79a87000000b006bb8982411cmr9200711pfi.8.1701059198624; 
 Sun, 26 Nov 2023 20:26:38 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 m22-20020aa78a16000000b00692cb1224casm6337813pfa.183.2023.11.26.20.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 20:26:38 -0800 (PST)
Message-ID: <a803c70b-319b-4b32-b0f5-fbe5723d33fe@redhat.com>
Date: Mon, 27 Nov 2023 15:26:35 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 11/16] target/arm/kvm: Have kvm_arm_vcpu_finalize
 take a ARMCPU argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231123183518.64569-1-philmd@linaro.org>
 <20231123183518.64569-12-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123183518.64569-12-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 48vo9FRMLqMd

On 11/24/23 05:35, Philippe Mathieu-Daudé wrote:
> Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
> take a ARMCPU* argument. Use the CPU() QOM cast macro When
> calling the generic vCPU API from "sysemu/kvm.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/kvm.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

