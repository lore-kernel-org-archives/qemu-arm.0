Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp131010ejb;
        Tue, 5 Mar 2024 13:36:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUbdsvWlV5P3kXLDkHM3g2wouEilTPlrd/0yOgZ6tRBwhvLddjlx5rKTwewFkkW5pofCwFOCDnf8uMax2R/nfxAseX4o6js
X-Google-Smtp-Source: AGHT+IGaDetljJXym3xQxwLan/nYa6aae2wPsUT4gIJBf9/ZGL7d17P4DltmqWMQH3eb87t9tqoq
X-Received: by 2002:a05:6214:1183:b0:690:8936:dc1 with SMTP id t3-20020a056214118300b0069089360dc1mr2706529qvv.11.1709674616340;
        Tue, 05 Mar 2024 13:36:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709674616; cv=none;
        d=google.com; s=arc-20160816;
        b=0VNOVTfYKVEtf2sJxKuKtwQpmrRsoXh3fKQiQcD3lEUoyc/4Kd4efOFXuHpOR/Wpuz
         zUp/iqk5BpX0Qf7YBEeyVM8lEu2lKjACwUk2GH7oZNvA/ZFBTba4XXHIFS4ainO3ABE3
         UPO12BQywqpBE/ScQbPd8Oeo/5J3Vsaj3hu+6D/t5cLNHFmduzOgKrmdwr63HHuVZ784
         g4rR8an/tDjKdPzEc/YYQY8wAqt0ExCVF/epC0Or9l0vJgGunv4zJTiawmawTLEGcRGk
         DDyDb3rGp4gKW9qwy0977/15y3ROr0zC+FztDvCU6LrLY8vrei5eQ/+CKvRMZh0OoGkF
         dyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=uIDPaQ9p4Bh8kYkbG1aNC/r3mhO071zWcGdOe1pZtEw=;
        fh=WX/nap0ZRoFkKhC9xc+jjvWsb2E9cbhkGomLgWLClHk=;
        b=WypD8U6OvRjWusSGbf4sQ+vOZ42jPOvgTMktc+McF+7QevSZREyJI7W2AsHY0WFsoJ
         oIK16dmWBVYYCa2gGkPy2UWd/skHo6VZarHZhN4fhVSYBcCjhsGibEJpgKxtUjvUQJHo
         9oMubWXdZW7N5Q/2mM2qepr593Hxamo9Ekj16sWv/gQmGld0FsvN8prDZPfTAAstI8vE
         TL+CFSmK2OuDMtfWUHcxz6RSxfMkjYlrlsYUCght3/Kfq2r2O2mQ1WEVYc9n6+RwY3hw
         fI1ZpyNWI3scJfb0zzWz3cRtihpSjorJkE3B8T5yJ8NYZ7oeqX7Ra4uwnh7BccAY3iY4
         TIlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pUmNQEzs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ge13-20020a05621427cd00b006902d35afc0si12805107qvb.259.2024.03.05.13.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 13:36:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pUmNQEzs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhcSo-0004lk-JU; Tue, 05 Mar 2024 16:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhcSn-0004l9-0Q
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 16:36:41 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhcSl-0003ke-GA
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 16:36:40 -0500
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-365f91e490cso6525465ab.2
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 13:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709674598; x=1710279398; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uIDPaQ9p4Bh8kYkbG1aNC/r3mhO071zWcGdOe1pZtEw=;
 b=pUmNQEzs9Hv+pEDYGY/ePNU92wiUbQVpFdz01XaTyboiyyOg/xi8wO5hMJOY9JiBLR
 vxjEiarriaqlotCPAuVkc2v1yYJFgYJqCrl6PpV2ZfpniIYcTw1JzUEglWKRBew+85B9
 sV40W4BwiuPnTU3zK0fcBRR82UX1ic31gNvgzsfxEoHl+xIm0bNeo65NFDURia8AHys5
 2nrs5NKB4ZzMakrS+gIIniikopodRcDaE2zDVoU88quMnVallkDRmp6Lom28x88P8NK2
 we9jP+LI97GClzt7eL1pD8BOFObqG6Kn9ZZWb6Wuh3gz3RPlbz37a5+pRhAzKGSpS1Z/
 S/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709674598; x=1710279398;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uIDPaQ9p4Bh8kYkbG1aNC/r3mhO071zWcGdOe1pZtEw=;
 b=FCBmKirpic8+g3Y5xheO0WQa2EvmqG4irtQSwLpT0TWHtLEuj9AHTL/jI/K+dUrc4E
 8JLYmz6NK1DnJT1toeU0OzPPDxVyUX2eLqX1/CU1435i2WZB910qYoGfOVDtrxPEXtb4
 IUM9lhr4Eo2qGX6SOmeGbnLR1IH8hqMLCnxjhVj8Vmdt0G3bfWYzWk1XnJ+r+cJVHz3/
 oQj+ifCTWmunoiaO/mLo6I3pjYVzB2Y7r7DmWDHfrd/4035d/OHK7vIlWEDbs2PX2Sui
 otTK8IzaEGaZOSwdrRBnPWodHVDKGyZnkN36QPKPQ65HVLZoUKM6gRHsAS5hxsClnbk/
 GX2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnmkAAhT9a5G9vPTzzkWZVpKUslh54Mz1IG2RG7ry2WYhFM5MiOYwrF6oTMtOz9KwaQwT3cHyDtRSwr43QXJQUx9Lm
X-Gm-Message-State: AOJu0YzsYZLRxTljLxjIhnOXKaFkQ4qyWoQQZYpNwL5DAJZnokESIvHW
 hub+YOsJvrmBuTYtBbXjKI4ednmKxmhtW7uXijRZCQbPfHadUQpwrTUG+QnSbuA=
X-Received: by 2002:a92:c26f:0:b0:365:29e4:d95d with SMTP id
 h15-20020a92c26f000000b0036529e4d95dmr14481486ild.30.1709674598153; 
 Tue, 05 Mar 2024 13:36:38 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 q12-20020a63504c000000b005df58c83e89sm9684140pgl.84.2024.03.05.13.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 13:36:37 -0800 (PST)
Message-ID: <f3db8d07-71dc-4b25-b50a-94f52b5ad3b2@linaro.org>
Date: Tue, 5 Mar 2024 11:36:34 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 04/23] target/arm: Implement ALLINT MSR (immediate)
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
 <20240305070331.2151131-5-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240305070331.2151131-5-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: hSv4ly634H29

On 3/4/24 21:03, Jinjie Ruan via wrote:
> Add ALLINT MSR (immediate) to decodetree, in which the CRm is 0b000x. The
> EL0 check is necessary to ALLINT, and the EL1 check is necessary when
> imm == 1. So implement it inline for EL2/3, or EL1 with imm==0. Avoid the
> unconditional write to pc and use raise_exception_ra to unwind.
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
> v6:
> - Fix DISAS_TOO_MANY to DISAS_UPDATE_EXIT and add the comment.
> v5:
> - Drop the & 1 in trans_MSR_i_ALLINT().
> - Simplify and merge msr_i_allint() and allint_check().
> - Rename msr_i_allint() to msr_set_allint_el1().
> v4:
> - Fix the ALLINT MSR (immediate) decodetree implementation.
> - Remove arm_is_el2_enabled() check in allint_check().
> - Update env->allint to env->pstate.
> - Only call allint_check() when imm == 1.
> - Simplify the allint_check() to not pass "op" and extract.
> - Implement it inline for EL2/3, or EL1 with imm==0.
> - Pass (a->imm & 1) * PSTATE_ALLINT (i64) to simplfy the ALLINT set/clear.
> v3:
> - Remove EL0 check in allint_check().
> - Add TALLINT check for EL1 in allint_check().
> - Remove unnecessarily arm_rebuild_hflags() in msr_i_allint helper.
> ---
>   target/arm/tcg/a64.decode      |  1 +
>   target/arm/tcg/helper-a64.c    | 12 ++++++++++++
>   target/arm/tcg/helper-a64.h    |  1 +
>   target/arm/tcg/translate-a64.c | 19 +++++++++++++++++++
>   4 files changed, 33 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
