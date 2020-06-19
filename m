Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1042613lfm;
        Fri, 19 Jun 2020 16:36:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXwAXW/EqSg1gxlLLp6G3hXK9QsSj6xS3dBrbzt/R21O9sRenMftIyfcZJZV2Y/gdi2m6+
X-Received: by 2002:a5b:143:: with SMTP id c3mr8835320ybp.168.1592609774687;
        Fri, 19 Jun 2020 16:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592609774; cv=none;
        d=google.com; s=arc-20160816;
        b=o1CaC2hv7+PoNgL5GxDHkh4jztlutNwtdJvfuckwXk7NlSov2LttxE899ihTrge/ud
         Jk4esGLQbtuMlVMMprbj14z1iIJXjyyzLHJ9Pykv92VqK1bIkMemjLvritIQaNofvbIX
         i9Sy7/1pNQhF0NGXMN4rnH4YrkDncvFiRW9wKWs8lFtgeY2IJqMjvavwGkqboLHdrmXb
         aAOt0XkAjoElripk/MxXJ/llpLIQqISgMdKsSbGZZvHzKRKc8BBFaYy/1/caqxS12kv1
         1G0mj+cL9yiCxVmvNr/fT8KftqivhF9GR7Ka5PxjmTvHZ5dyyWEeSEAx6zrohJ5Phml2
         g3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HF07ZQokGBlI0ovFsZMMTYdl2T9Vi+TfbY4gVr7sP8E=;
        b=AyKJGj/aZNpSm3olcW6t+M+OVqwUm70mVPr7G+b+Ufmpod/MjB7aEcBDdCSEFtCNnm
         SDvf/fZeb8odzDeoELFz+gQwfW4kumCvTdDWEnWJTsjtI9vaVuR0gXX3VktfK8iBLXIK
         1qrGP9idjmdGTM+t+PBmr3dL+SmEF5H5CCYhF+h3B4sNxJKAuumLE5VHNzeK9f4c7GMZ
         Ln9ZkQMbAmcim5+vNK3rYMEWusirEFfaI/x5nGortNpXajbSZK7Gw4bUQ2DqrEDks1i5
         vYQ0oXElAlc4pUe88Xguej97kq2NBbtON0B3mgdeVT7VHkECbMJq90rIBdG8YDQ9APGv
         tVgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bck6rl1a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8si5945412ybb.311.2020.06.19.16.36.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 16:36:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bck6rl1a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmQYQ-0001Zg-47
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 19:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQYG-0001Yt-Ld
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:36:04 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQYF-00019I-1M
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:36:04 -0400
Received: by mail-pg1-x543.google.com with SMTP id h10so5158034pgq.10
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 16:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HF07ZQokGBlI0ovFsZMMTYdl2T9Vi+TfbY4gVr7sP8E=;
 b=Bck6rl1aDJPUkImw54prockbm89IKWgi76gMTNMBfUKBv2stVBQ195yr25SPdhcA7h
 TAocdgRoJZN2kmICfK085JJ2Gx90uOuDHVzF56bI9Rx3pYS+AgaaYy1RznQDSE+BqAQL
 o90PNrQrSJplTxQ/+HNMOgjW2b++Cf6mquu2djqMReraOhgyouUGZXws7Er/QfyE9DsK
 Al3WvIxIiUzeQOvgI7DKEUsLNbjoGK6SACH3SAB2C/JHGamsSJggjklYYSdzsi109kd0
 mPGIbpVeQoCP3QOIqwZk+h/cGQalJWaoa9AZfDFEzhr+4jIC9aqypHDqlFm1R3M0x570
 rK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HF07ZQokGBlI0ovFsZMMTYdl2T9Vi+TfbY4gVr7sP8E=;
 b=J9UQ7j8e1ZeBlqHBWmlGs4aWMl9NNTUsF3nr/+65m3jETpSfvwP22QV+afOPuSxiGY
 9bRmuYnD7cYYW2fsMgiCn04rczDJ0MuIk1QYwVptlNxehcLKA80bOYlP/8pS3joBQjV/
 FVU9H3YKym7M0Pe/C4NNYCU9jOUndzn2aBVZj5jK7vfZ7yKD86cvnW/tpTiS+TFCE5+d
 Evro9e1/2YwFj3ryekf1qKoUqmz8624/POXNE6CJx8AYDL0hEKiksUuFdQEC/gRLznjb
 BqMzzzxPXIVKaVQWhhBOXnpb5+ZJuIp8VjmgSAyS8RNr4/5oGDRU9gLL/BS7ov4J+QhI
 Efeg==
X-Gm-Message-State: AOAM532YrBXOR8OLGqMzK5l8nw2cq+Cp5eMzaKD7JYLGyQnkMG/67opc
 BQUoKVwnTwu0Odrx7oYjgax7KYb6Faw=
X-Received: by 2002:a62:27c6:: with SMTP id
 n189mr10424478pfn.277.1592609761581; 
 Fri, 19 Jun 2020 16:36:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id c9sm6926808pfp.100.2020.06.19.16.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 16:36:00 -0700 (PDT)
Subject: Re: [PATCH 12/21] target/arm: Convert Neon 2-reg-misc VREV32 and
 VREV16 to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <13b3e56f-4aa2-b17e-184b-a84e345e1a3b@linaro.org>
Date: Fri, 19 Jun 2020 16:35:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qkj1/atkdZB/

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the VREV32 and VREV16 insns in the Neon 2-reg-misc group
> to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.h          |  1 +
>  target/arm/neon-dp.decode       |  2 ++
>  target/arm/translate-neon.inc.c | 55 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 12 ++-----
>  4 files changed, 60 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

