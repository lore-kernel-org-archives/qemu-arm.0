Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3030338ejc;
        Tue, 10 Jan 2023 01:40:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtmACsaUkUawM+3qbfaU2r28RvGRIRcWarfZwnSnhx+snLVKUR5Fh4SA0Wm4j6mIoyQvX4T
X-Received: by 2002:a0c:e950:0:b0:532:24d8:22bc with SMTP id n16-20020a0ce950000000b0053224d822bcmr15328321qvo.3.1673343658894;
        Tue, 10 Jan 2023 01:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673343658; cv=none;
        d=google.com; s=arc-20160816;
        b=YDMIL9wEWabiqf2oN3VQvMjl6R3K5AMbnGcEueD62TgDbHzd+z2yrPJKGEpfUKcudv
         VKUuu6Uc+eSLl9QNeqOfgEacVFPhQ8OiOzjUX6swVqEoCM71RymCRhWNTQpJx2nzRi6y
         mRQvZZCheHYej7rGG9elSYfksKKj00DXT0kmQa86PvS+iEqi0JCWO1+ePJYMxlY+vaA5
         Se/9X3X/uy0sD53t05cPyBlwR/VlMM7RjLB9bV5QhS+Ft4VfcFlyxnyLhHTadLF3uvX0
         nVJbvhTtBycaJ1q69dTcWHAFzZe1xXMN9r72wXnk9KqQwtfynlEdVEAQdb29PGISoXB9
         2OKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CH4/JUFRuN1OZ3VEbfdDXHEUg2sOsswoI97hy4Nbam8=;
        b=UBbgAPP8wv4G0eLqFOrq3vMUTZrG0rcfnpCwpRRBKkzNF1H+vm+BAnfux+N893yElk
         E5ihG+xbI2RkqhdO8kvO1GQKFbaTEhRAXCg4UmZV2fMYALxJ1gO1zt7B5W+xaqAV1d1j
         F8ZqvYOXz+zo9VMrTMGOFTUu4YBZdjhc5k6pM2qxLtK2caIQ4O6qnpbCOSsAriJGufjd
         Tro1Jkm+pze7+jkIvzSUiyLDQmKDiZTFWX+b5/xFv0qI8LowUpUOiIFr6DX+LX6z51fk
         ADDk7lSmnslnF1YnhT+0M2jmlyQATIr/go+bb3MTZKFqMS0nhxMeJLhp+JqArhZg5C/L
         PsPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCLNBsMo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020ad45cae000000b004c624ad2f5dsi6194700qvh.322.2023.01.10.01.40.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jan 2023 01:40:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCLNBsMo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pF9xq-0005uv-8r; Tue, 10 Jan 2023 03:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9xp-0005u3-5N
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 03:26:33 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9xm-0005Vc-W5
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 03:26:32 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so9196352wms.2
 for <qemu-arm@nongnu.org>; Tue, 10 Jan 2023 00:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CH4/JUFRuN1OZ3VEbfdDXHEUg2sOsswoI97hy4Nbam8=;
 b=gCLNBsMohpDEMSDfSrukag26or3zZMCVX7DxgrYt/tz4kk8KLhK75fLg+D0weoqnlA
 0ok5n8UHczy5mUi5ZX4LpX2ALriV7SufTMVyWKhu06oc72d7FuLEXh5TSgfM6DZe50ZF
 w6gHvSVY0RLh8N4j//I7SyNTHwuvJZPnncjuNVrZtpUgXBG4842mlVuLYkxwNgIWasBG
 xUVK3Uk/Pa6SYrkgworYH9hI+w9nWMoy3mWDClXi5JpsxoBGJdsJkgySScn9ASs3ryng
 7TXTzDZLdBVkUvLB2AKZiR8xe6DTe66G3BxTTB/U9fDXj+cwS1ijlAjceXa9rnGJ4xK9
 cb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CH4/JUFRuN1OZ3VEbfdDXHEUg2sOsswoI97hy4Nbam8=;
 b=c2W8Yj4/Xc9xLUU6w5eY2k3DofMYDmt9Yv25igjUc4RyPQumzDLPU0MUlrsLbtCp8g
 aP+K+LREbXFDxj9TzaI6C6F/o8uA5DvCCmyu/KKZFHiJQ5VlevNFxuBwVw8n+AnBoVIG
 1u1Eif1Rfg1J4qkMveLJ7YbiJC0MB1V1980JTVvGB2tG3QSU0/1ZnjR3XLeY61femj83
 hkm32cI9hHDUv/SIUuCk1VDNI/GHEf5lgHe1R66s8w7POaxdfRvrsw14M5TS7M/56Zug
 8MynJm6B1A3U/rvwRtEy4l9P5JjkxdKP14XXCAwHP1tofRYzYPGiSoIPkJk2wiBj35np
 mhfw==
X-Gm-Message-State: AFqh2kpEHhdffK52hCzUEu4uKYPNtQaecpYBp3cPLOiTSEa5gA7g7qpZ
 9hCVzywx2b+nVDkPqhlGmqsadg==
X-Received: by 2002:a05:600c:4920:b0:3d3:39a9:e659 with SMTP id
 f32-20020a05600c492000b003d339a9e659mr51506349wmp.21.1673339189237; 
 Tue, 10 Jan 2023 00:26:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c35c500b003d98f92692fsm15395102wmq.17.2023.01.10.00.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 00:26:28 -0800 (PST)
Message-ID: <dd03766f-e4f0-03f6-de16-0d4f9ed8b0ed@linaro.org>
Date: Tue, 10 Jan 2023 09:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/5] hw/i2c/bitbang_i2c: Trace state changes
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109084121.72138-1-philmd@linaro.org>
 <20230109084121.72138-5-philmd@linaro.org>
 <55413dee-6141-2f36-ed8f-964df43aa578@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <55413dee-6141-2f36-ed8f-964df43aa578@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: PHnwZBG3RBB4

On 9/1/23 17:07, Richard Henderson wrote:
> On 1/9/23 00:41, Philippe Mathieu-Daudé wrote:
>> +    NAME(WAITING_FOR_ACK),
>> +    [RECEIVING_BIT7] = "RECEIVING_BIT7 (ACK)",
>> +    NAME(RECEIVING_BIT7),
> 
> You've overwritten your special case.

Oops good catch.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

