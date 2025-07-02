Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3866002dye;
        Wed, 2 Jul 2025 07:51:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUIJ633OCna/Tb8r4bK+FpftNmqpcQbVhoUtX/RxQCGpDzTXWenSAqs0btWvbCJYeptjnL6+0wOLlEzEA==@linaro.org
X-Google-Smtp-Source: AGHT+IFa82zuZF0ingTb+hvzIR4YntQjncpVKG8KdfMUVs5QOozed3U/ghqF217yR8tpVaCYPhVC
X-Received: by 2002:a05:620a:4152:b0:7d2:1684:2429 with SMTP id af79cd13be357-7d5c46ff20emr459276185a.31.1751467907564;
        Wed, 02 Jul 2025 07:51:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751467907; cv=none;
        d=google.com; s=arc-20240605;
        b=iVD6vnVNoxHEGSJEOpJRRi3yI6dCzOIpI6VYx8N3yH7hYTS3PNCCQAJsdGxFn8JDar
         QIlbsAVGdHu6MIQ8CxtV2CHHGf5ytSfEL0nfdueoj4xJyyYwV/tlcdjpcT591BXIYaGO
         VwOSNzRv4VWZ6/qFe5EN0yMnu/h7CURuHwCXWmxoRX0zEXwxZ7pbuRtIO9W22wzASt4E
         XczYpZUsTXWeUUnWsuB897Iw3ywgns3syf7EXgF+E28WzIrob04L4jj8W7uHou1DSuGr
         1108KI2xHqNVYr9dNbYBUonkgmcx8seYfWlbntcJbEN/LxRp179E8DeIx+9YW/SKiXjG
         j0rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=K6NyxPH1BMa5VGjsBHOrcZKnCYFYqUmbRgAoEZ9PAlA=;
        fh=KPMHK051mZY6R+5Zga0exMGtGBO6eziKHXBXI6BeNPI=;
        b=D6Bv/BxMoMWrpMEHtCjJoEkhVbOSbOOo1TZQYr7KJfcLOI+rd9d8H1nlIwD/3Kc+8J
         332T7FDT/IAQLAPTokpVsCAqJA9uKkE+Oki+AmtlSpLA/VFrKnYI5ozb86cwS2vdcVcZ
         zDzIbB2jRMJald2ht4yuAI4nK2u3bErKg9XE2kajHS/UFKchOftic+99zKfu8g9ShSwL
         hMKfTqiWnBI168LKPjWBqSMWvw/u2GJw4KJt6oawWrmu/VIebtuyxqJ9lwsKHzX5VKXk
         LNXEPoOk4poMNSn8ROaSQ7I7MSrc1NMRFIY8Hqb7d+Q/hLAp6BWTwjl658KfsdQKYjHu
         7ufg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fTHAh/Al";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44322529bsi1207448085a.201.2025.07.02.07.51.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 07:51:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fTHAh/Al";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWyoA-0008Mr-59; Wed, 02 Jul 2025 10:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWyo6-0008J0-UZ
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:51:30 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWyo1-00010J-Lq
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:51:27 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-735a8be4ea9so919452a34.0
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 07:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751467883; x=1752072683; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K6NyxPH1BMa5VGjsBHOrcZKnCYFYqUmbRgAoEZ9PAlA=;
 b=fTHAh/AlITsuI/YlvHyNQ6dtw4B54EA3FgRvg4pW5aJTuLNRMDc3loeiha0rG8/9wB
 oKPm+YOmcuqTb+/jX4yMJtKX+y/LZQyNsSjgQf/0npx3mO27V3IcdtCTABaVIv96+aj5
 x7pYQQaytn6/rCr+BVFqpXPnSthnkqlQr0JG5XYJxvV1ABEYKCm00TghOkhDekSVyVxM
 IGrX0rwXgKSEAY89mrVYRyxVjIkroKrNpCkG9/MBvL2U8udkMANilfIBsKeWLxU7lTpf
 EZaMkKSQloqVtv4d25T5jJ3lFuUvnw92noST751DxiGgk1KT1v90AyCWWYcLzRI/qG9B
 mptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751467883; x=1752072683;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K6NyxPH1BMa5VGjsBHOrcZKnCYFYqUmbRgAoEZ9PAlA=;
 b=mkjiS04DfuU/FuanmJ68NgPkeVlnQlqv3W5pC+OfCEyzVqsQeoSU/u5hGMFch5Sksw
 olTcmpyxmnGzqV0AEOv/OZmXaIOu0BHLrLHLLBze8XXqo7AvhLMQZ05dgrugS96YpwP7
 rXFIBIp4hYpNzTHY997DhzNQnJYyzURspBSmfV71rgeVZ5XxmzL2lZxPYtvXADjBfDmJ
 erJcEDKwhu38TG7JnDtTX9Bpysu8JhuzKdqHsc/oCCM9+eKfsF0NSfA2N3vGoM6QzE5x
 lJ/FVyqUc2eiE9qo6vrjoPPw6QfAyfSZkeLBPxBSUHdw0DXHfxL6ZnacJifE/V/FtEvC
 7BEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgGaJjCtfLLXrTYLLGJ24PUlY2+FmkbFlrFbPCMAV6WN38Xh1IYYKExyMKEYUVyegaMEGh9fkTZQ==@nongnu.org
X-Gm-Message-State: AOJu0YwIk5Cqq62tQxDIU1UFHIZKPNpmY4Ki8DrliSrEAGn6c5C+vKjA
 tlVhqSX9pX2qnSn+mLZBWH5qAmDOhdX6CBTwA1mfH3rc6qTJaivASlNMobo/udnVFwg=
X-Gm-Gg: ASbGnctb3uQIW+cUtUMu4IGq8MTR9mKtpAYPh5T8t+T71rD64rxke+SRcSJUguaWPdz
 dTF6I/nbDBewaOVAvaQxX2tPDy81aizjqNDDSt8ohCkW8Feue2UQTrJrevbedykVb/66fpqVTYb
 9/a9o/j/2bwWKQM3fIdNPoX14GztQgoCcWAglwGVz/4pC9qAOWZa/35UrS+b6OiBbpodckRnnaz
 H+Gc1tt3Z9KkeRs4IvM504BQMbNrW+J+CyByO5kMZ8UOLnxXJFF+rooG/TSQpYQcYiJk8c20vKg
 sdVVBx7ABSENRhWrFhhmvksSTtBfLktx4mkzUDT/JYjTpBIkZ3PoHlmgdNKNowhHYvzu9uMotXX
 M
X-Received: by 2002:a05:6830:808a:b0:72b:b8d8:3995 with SMTP id
 46e09a7af769-73b4cc83ba6mr1862573a34.19.1751467883263; 
 Wed, 02 Jul 2025 07:51:23 -0700 (PDT)
Received: from [10.25.7.74] ([187.210.107.185])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50f852bsm3938286fac.33.2025.07.02.07.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:51:22 -0700 (PDT)
Message-ID: <0ff03f6d-4632-4b5a-b044-1ccb7ce715f5@linaro.org>
Date: Wed, 2 Jul 2025 08:51:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] target/arm: Fix VST2 helper store alignment
 checks
To: William Kosasih <kosasihwilliam4@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
 <20250702111954.128563-12-kosasihwilliam4@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250702111954.128563-12-kosasihwilliam4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
X-TUID: FnI66X3Hhwok

On 7/2/25 05:19, William Kosasih wrote:
> This patch adds alignment checks in the store operations in the VST2
> instruction.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
> Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
> ---
>   target/arm/tcg/mve_helper.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
