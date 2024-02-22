Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp157554ejf;
        Thu, 22 Feb 2024 11:42:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUp/ww0DhwfTstqyTxx1wdguMUyDd2stq4nPV4yE3i4Od98Vu972B2/j7LwTYmplDhYlkARcxy/bzBi8ZaoxR3pUNNdQNEN
X-Google-Smtp-Source: AGHT+IGDZ25NC6+JmeoiDUahwoeP5hEExTXgB9OFOkQY52MMEXlr66G1EH/f4XdSKlbf3NAJUWcX
X-Received: by 2002:a5b:d0a:0:b0:dcd:30f9:eb6d with SMTP id y10-20020a5b0d0a000000b00dcd30f9eb6dmr149935ybp.57.1708630952719;
        Thu, 22 Feb 2024 11:42:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708630952; cv=none;
        d=google.com; s=arc-20160816;
        b=uF2nAgHYA3lsc7hqzcikAzr86O3mWaaQTQR2/2eX/L3De27uqybImuCr8Iv8RLUNKs
         uwjT5oo8LQDWzfmk0JLbTLOReF0itX53GEu6oTQj6ONDv2bgbZc1fcUdR9ME0XkRYiNl
         qwzXqFEbjFNNrm8OxRMU/l+bGEE7SGt19vSUxYIoj4oYa0nr9xVUuICG+QLPiz4mnhG1
         M7TlYdoGSgFfRlEhlY32Ui4s6Qt5I/ymeamHhhgQlEYcG3gSIjcumUwNuaGZEO3SAUwf
         wA4PJ/vQZUvxH0ulRQG+N+1EDTrjPVYbE45tEQhZISuMVDMrpdldSLDcf8yR8HA14UM+
         auUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=a14YzswJfF0EVEHKLUWnJPofJa7eJqbabN6+JNQY+fU=;
        fh=JYuZacsKwUV96lYWPdPnCOZldtbq5CiqsxJR4kmUgLA=;
        b=oIAwoP7/fhBoivnK2afZL4vDpzP+JfJ4MXQoYu8+w1yWAURN86/JFw+JWR8+iCofpr
         EUtijHcp6jt3RDRbtSw2DsJPnGLtSvyTTmMeB7i73Q0HH0QfngFWpfHiz++7QP8drsqz
         GcSD22gUP5+zwcX2jLvIWc+itbkJ8+ry0+B2GC5O6FWroqMRoNdzPDxcOuxvabo1cz1/
         n7cdG3i9Hl3RUxp2l5p45ehrQQyGeGAiF+yWwm9PyI171yuJrKywgVHKbRQBZh3dUKMP
         S3UPq4kHo+gq3jimmYnzHHNBKc8x1Q/lQWEvSiEpYg6YclbkAdVcTCmACPQeqpyQd78f
         fryw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fI9lpwMk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15-20020a05620a02ef00b007876f55c2a5si8071884qko.752.2024.02.22.11.42.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 11:42:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fI9lpwMk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdExc-0000Bz-Kl; Thu, 22 Feb 2024 14:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdExa-000066-Q8
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 14:42:22 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdExZ-0008BO-7d
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 14:42:22 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d93edfa76dso17365ad.1
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 11:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708630939; x=1709235739; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a14YzswJfF0EVEHKLUWnJPofJa7eJqbabN6+JNQY+fU=;
 b=fI9lpwMk1jOLwFGNMxxk70hh5ssDSETHXHqPr7XvRcrJa63S7mqFyROnuEH1VW+xQO
 8ooIanYTC3lJIDw6gw5puUDzsbw6n7h8FdMZmYu+g6U47OWMIUQhkSWHFpYXlfk7PigW
 nzOydzE8BFCm8DlMMJD1VtyQ2Nhs2Ve913FDDN1dv3jEtSDSXSejj38HaxAKY2rxWSsZ
 lobdQE+AuNn2h+ra483JuUXwFhBoLDLqUAnXh50zrHl0XD2avBWOFm+fFeCXdeHuWRTA
 mn6ITJpYUqd1Uu9ANpSVEEtfKuORwGrTL2FvOJ5EQVvefGT8daKixM1XRgZJfkY1e/xP
 b8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708630939; x=1709235739;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a14YzswJfF0EVEHKLUWnJPofJa7eJqbabN6+JNQY+fU=;
 b=h7hL4zhGfmviss7qDU9GnZS/1tqEnuwXwO3y4irwXQUjkSVx6vgok7wKxdxZPqgHKo
 RVujTU40jzyNPG26nGGnFFdp79K7XYPLwSJVrarxTZ8Y2aG5AHdmVJAU7W5tWLhcYq0b
 mOV2/18Ds0SPzUjzDvMP89jkUUr1CyFvHOfHxVKfqSfbNy5pivXuZ22lE8FE9y5lnh3N
 sPHzVWu7Lk3nQiFgS+KDlnS9NH2nipZv4ol7KmZdiAdzy5Jxq3DecstGLVAzYAK1mG98
 0jKkAfepluxJNBh6mb/4+HbdsczfyI37gidUu1D32t1SP7TRIt4m3/6SePVkD5c/qC78
 qYqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW95FHHhN2cMaOmEGeTQxLCVdJLYx/jHy5M5TOoSpq22Aw17zk00hfkvH7ZHYhA5Ip6R9YRbmy8mJc54doRbBpYxmH8
X-Gm-Message-State: AOJu0YygLDVlMQKED82KVl2iFsaQ5GYQUw6DkPzqHaZICr+rMeRnQoga
 VAFfqNWSu7xcKrvxy9zsg1XwGq+q3op4q8+FksFgSsHBF5UztU491MA83vGyMuI=
X-Received: by 2002:a17:902:db06:b0:1db:8fd6:915e with SMTP id
 m6-20020a170902db0600b001db8fd6915emr10523752plx.33.1708630939286; 
 Thu, 22 Feb 2024 11:42:19 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 6-20020a170902e9c600b001db70183611sm10248011plk.270.2024.02.22.11.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 11:42:18 -0800 (PST)
Message-ID: <7a8e193b-c266-4723-9dae-198a975d77f7@linaro.org>
Date: Thu, 22 Feb 2024 09:42:15 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/22] target/arm: Implement ALLINT MSR (immediate)
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-5-ruanjinjie@huawei.com>
 <9fb9c74e-e4d3-4a8b-b736-c8603414245c@linaro.org>
 <0911d6a4-7fd6-4d0f-83a8-ec4ba8420297@linaro.org>
In-Reply-To: <0911d6a4-7fd6-4d0f-83a8-ec4ba8420297@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: KVYjBkepHL1p

On 2/21/24 10:41, Richard Henderson wrote:
> Ho hum..  I just noticed that TALLINT only traps immediate write of 1, not also immediate 
> write of 0.  So one helper for both MSR Xt and MSR imm is not practical.

Quick follow up to say that means you can do

static bool trans_MSR_i_ALLINT(DisasContext *s, arg_i *a)
{
     if (!dc_isar_feature(aa64_nmi, s)
         || s->current_el == 0
         || (a->imm & ~1)) {
         return false;
     }
     if (!a->imm) {
         clear_pstate_bits(PSTATE_ALLINT);
     } else if (arm_dc_feature(s, ARM_FEATURE_EL2) && s->current_el == 1) {
         /* Use helper for runtime check against HCRX_EL2.TALLINT. */
         gen_helper_msr_set_allint_el1(tcg_env);
     } else {
         set_pstate_bits(PSTATE_ALLINT);
     }
     return true;
}

Generate inline bit ops whenever TALLINT does not apply.
This also means the helper need not check current_el, because we've already done it here.


r~
