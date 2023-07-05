Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3655358ejy;
        Wed, 5 Jul 2023 08:26:48 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHP455rEW+mZ9+cm4bZ6XjWxr6xOsT0J8BsSp+KCxwXv9lcSEQMwO/+LVsUBrt6ORIsDg9P
X-Received: by 2002:a05:622a:1a1d:b0:402:e08e:3f4a with SMTP id f29-20020a05622a1a1d00b00402e08e3f4amr3418459qtb.6.1688570808359;
        Wed, 05 Jul 2023 08:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688570808; cv=none;
        d=google.com; s=arc-20160816;
        b=KIKUEtvltMV6XFwl0JDcvVabh6vYRBRtXg7ArPaVrbllnREhao6Rc4AKvpUCW85THr
         bjZOT/c1AS6SoL2y+5tMGc9y3YXbgu4GINXkYhZH4NZ68jm9jHe0T4WQjgWVVYYcap/j
         OjglVJAiKHZvx76t+VIpqB/pLiXGz4YC2ysZsSAH9HSj/9A+LLL+BMTJfgZ0xE/GgVVy
         IL92ro7GFSKmuGbyJYfyLdxzNjs4vx2nmBXbS6UpFEr2MXJIcHt00kRh4eI/Ao/uAle0
         oBiGzu9+06xEfHYOd95cT86lxwepYJH3NS5gDTWdjm3wCTYqutfnzCIqnJqjSfZcWAUI
         nPmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=B2Yile8esPPs/3ib7DpmTipXPKTF/5nmpEd6mDvqcWs=;
        fh=5V6lsO/XbMWucEL95hDLnujkZS50lEqXaY3oFHinqBs=;
        b=ypfSFf9d4Dh75LSfAeO4l9sualETBVHui4Tv0RK87DPPzcU99npnCPVQb7mSLpuW15
         YWdIPL2uu0nTnu4zLk4oNlfDJE8FA1+JxanyhbIxJmMNuGRVymVSD2jQXVv11mnxqQKR
         5Ziiz1OzzZYosNlpBnn2gb3Thjx42aci3oiQ8BiKyGDsVkMlkLWVBJygeNoRPPkdyurW
         r46dKxH1fIVKllE+WwozqtTYO1omMOJyd4Zhw6IxOXa5BH5ngLORB1uJLQcSpgFMnpF9
         yzjrAJJFoHgVqsmYdDLY4NYRaX+C97dycUvr3cIpZNNApvPzHoF9uw9JlhEzRwZ9krta
         i9VA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KcZVLHmx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19-20020ac859d3000000b003f527a0b2a7si14581580qtf.784.2023.07.05.08.26.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 08:26:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KcZVLHmx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH4Ov-00033M-I8; Wed, 05 Jul 2023 11:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4Os-00032N-Nd
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:26:38 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4Oq-0004cC-QS
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:26:38 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fba8f2197bso7751894e87.3
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 08:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688570795; x=1691162795;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B2Yile8esPPs/3ib7DpmTipXPKTF/5nmpEd6mDvqcWs=;
 b=KcZVLHmxf7RLbFfMarv4CFNu6NXbhrjMK+uAoOvZSJmovqmxQvh6H7BGbLHvaqLKGm
 2//EMXFkEXutnC5sh21PfQDb/jNQMg7K/hmBkL3P5W03q3oK1nOW7HBgeRN6ggopQEl9
 y97Ns5ARNLDtkND5P4Y4it82rkByiUEwYU7bf+6QSxdzUR04o7rqgoHuN4d949oBfzU+
 YKFByQ5LDSouUoQs/Ynqq3avsLRjbYVIRamFgCoVsBlCF6cpu0CnuXp81FwV0IZDH1ZF
 yg0QpPPCJBxSzujr2+Wo3Pux4tgcqwYGrlP6QkNLD31Tm866UmZbxOP23gcoQ/Aak1gr
 xyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688570795; x=1691162795;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B2Yile8esPPs/3ib7DpmTipXPKTF/5nmpEd6mDvqcWs=;
 b=KkyNT00IGy6JNwefKw7iMnOF2ITFkHtDCquSnMVGNZ3+6pUt/4amQPolGwMdfHC0+4
 TtdGkF5X7jvVWmLoI4+jTgb4uM3yNSJ0rQ7GhtbJ98qgfx+zFmQ2r15BwIKVS36bbuf3
 d04s198+DvwV6Anhxz3+crmdpgrOSRz0dKIytP6saMC2Zh3jqRtNmiliKFW7X01LhUNV
 jhjaBfk571YVSd7fcQWKLj8QK2bDtC1OL6/+IfaJ6nmxG9tJtRIqlXDcz3NuL5B/RE7n
 otuURsQ22GoZaXvCFCsNR4ag2Jmf9i/1yhxXOLzNXBIi0sHIisWdmOTclRFxXZ12cftC
 YqkQ==
X-Gm-Message-State: ABy/qLZz8IUhaq+mhKIXnB9/aAwWk4g5M1JUMPt12ndLgqdI6QRZVS8u
 dk1FWJE7s8JXHD2656m5EmZ3Ww==
X-Received: by 2002:a05:6512:714:b0:4f8:554f:36aa with SMTP id
 b20-20020a056512071400b004f8554f36aamr10002200lfs.29.1688570794934; 
 Wed, 05 Jul 2023 08:26:34 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a19ad03000000b004fa52552c82sm5410694lfc.155.2023.07.05.08.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:26:34 -0700 (PDT)
Message-ID: <9ff6e150-5556-8a2a-5e0f-078cb9fae595@linaro.org>
Date: Wed, 5 Jul 2023 17:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 02/19] hw/timer/arm_timer: Remove pointless cast from
 void *
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704145012.49870-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: 0xF2MRYwoneA

On 7/4/23 16:49, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/timer/arm_timer.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
