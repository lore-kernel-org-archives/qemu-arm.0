Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1088550ejj;
        Fri, 24 Nov 2023 03:33:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHa461X1RzdpvsqmdlFgQXXTgfl/xfvIbip04wke6/6eKQrGbhXObfqbBSLwBQampHx0M15
X-Received: by 2002:ac8:7f92:0:b0:423:8f37:e395 with SMTP id z18-20020ac87f92000000b004238f37e395mr3317498qtj.56.1700825623291;
        Fri, 24 Nov 2023 03:33:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700825623; cv=none;
        d=google.com; s=arc-20160816;
        b=zmimf8AkXr7MBpqchw4fAqZ46OqH7lSAo5G95YJvXdPAvG7RVPdc1fQDl4EkEuB5nM
         uwAzXjR2hx9+PBJOdHpgKB47PfLJ8OriUM0zNbE4gc+hnpaB0k5Wyk4SYkqJcdWSDQit
         SyttEOPPptBFK8mRK+KA3xfqMl404Z/cMvI6vWLCn1TAyYOD+udJyrVoESZ9kBGTMM4k
         evfOLgXyJ+DJiZmL+IgNWRpjXmAdv0i7d5xJjMqEepEwYQfhh4thIo+cfIYaMI0rPF0P
         1Up46CabVf3d5iVWSYa2OLctNZQhzM6bMENsfrJ73cjWefP2GeJRFiLp/pX2U1p99Tx/
         I40g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cnIBb0DITQHegPTXKJNxK2KHGT7/5Q8XJ5dSx/6cJ5Y=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=FL5pBqvcLsnw6KZSMW1eg7GI2DH5EVGxdY6261gK3ahwQaEKWPG0uFlI6irO/Jg3dk
         /UZRWz12huOcf89mLZ0T0FD6kJufa8WD2YB5gGVfRXazJY3OtpXm1A3wPOw4WQl2DnjX
         UL+j7mix6XXz0UeoiCdKNpyGz2gUz35uyclPrW73O+K2cIAUcQZSIMkA9C9orQmAIDh+
         h1Z2hFMe++lYA3te/kL1Gfak/Bu//GaxJvnh6kzioouYCgMVJZtTcx68WYhvk3gu0Qmr
         oGVj/8mBSQspzjRP6+tUi1iHMLzCcHoPU/Ior57lEa+/koB2LNzkGsXj9iPkM4vMYyJC
         XhpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EFoYO0/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8-20020a05622a198800b0042370d06f2csi3326480qtc.381.2023.11.24.03.33.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Nov 2023 03:33:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EFoYO0/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6UR9-0004s6-0M; Fri, 24 Nov 2023 06:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6UR7-0004rN-8w
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 06:33:29 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6UR5-00071E-MD
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 06:33:28 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-332e40315bdso919331f8f.1
 for <qemu-arm@nongnu.org>; Fri, 24 Nov 2023 03:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700825605; x=1701430405; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cnIBb0DITQHegPTXKJNxK2KHGT7/5Q8XJ5dSx/6cJ5Y=;
 b=EFoYO0/g34NrqRyMXBGwpNc6dx/6PAUrvohEI5xKOZeCsNREfIXidQ/3vQsBu4AuA0
 Li/21ouOkT2Q84IUxg9QqIQmmmz7lnQTor4erNZ6SQEDH86BLcxSuW9whJRNqdfjRxMU
 +RMgzCj+G96ShFkWVvFf07fGHe8RiJsR0jfGKieuut0yjs6rPHwKcAqslnMvJHGtzb7X
 rW9iR45Kd2fMjZjIZE5SRbIevVVb7nUD84ve6PvAHE91OptEogYWYAu9tcIsq5t998xu
 WsMCaCskqH3QMyGaxhYQPJh7WVJcPzTbkPqPT1fCZBSt9EKTEx+gZctlJgav3CrxP0s4
 WCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700825605; x=1701430405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cnIBb0DITQHegPTXKJNxK2KHGT7/5Q8XJ5dSx/6cJ5Y=;
 b=tusT3lWqvHpH0SO0rsmHjXzNL/EQFLjwIPzymExiEOhC6ebL/SxlF9z3Y3K86DSZDQ
 CMqvDTOgOCjDLHWOkJou44+h+MwclHHmQbYjg2jb40ofHFV3OH0l9TfVTP4HujpTF4fW
 IwXyBMpBMCNAKhCQ2A6P9cyeVrTPZKVbnaeBwh1zL0WLXHniTh6VCYNNp4zSIadORkxV
 ejI7bFds9zKmDgrJPYF67VkpDsFyCscLnC6NARS0DeNO7pMcv7jc39ZDFqxmaJuebi0i
 faW84muF1ufuC7RgVq8UQS8xtb1CUzTzs3/AK7pxr+BSpY2UMnDnOtxKU4VnL9JsQRHy
 qkTA==
X-Gm-Message-State: AOJu0YySSdC3H2Cabt5D7aNG5Zrpvz5VHXFSUMesQ8XbRNPALKVRWXwV
 D3MxY9sDQXjBu52n10GDC4VxQQ==
X-Received: by 2002:a5d:49c7:0:b0:332:d4a6:1143 with SMTP id
 t7-20020a5d49c7000000b00332d4a61143mr1827500wrs.7.1700825605551; 
 Fri, 24 Nov 2023 03:33:25 -0800 (PST)
Received: from [192.168.69.100] ([176.187.218.17])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a5d504b000000b0032d96dd703bsm4076728wrt.70.2023.11.24.03.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 03:33:25 -0800 (PST)
Message-ID: <370db517-466a-418a-b73a-b6d4ffbeff08@linaro.org>
Date: Fri, 24 Nov 2023 12:33:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/21] target/arm/kvm: Unexport kvm_arm_vm_state_change
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: j7AdQgg+SijU

On 23/11/23 05:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 2 --
>   target/arm/kvm.c     | 2 +-
>   2 files changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


