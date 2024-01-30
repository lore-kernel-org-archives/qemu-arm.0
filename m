Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp713204ejk;
        Tue, 30 Jan 2024 02:00:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEk2Up/1nKavFpiNleFxSSc0oe03b/UIZ2xvm4btfJnHDtXTz1zy+qFqLGb9eTKQfU686fW
X-Received: by 2002:a05:620a:229:b0:783:2426:8b07 with SMTP id u9-20020a05620a022900b0078324268b07mr7137636qkm.25.1706608843076;
        Tue, 30 Jan 2024 02:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706608843; cv=none;
        d=google.com; s=arc-20160816;
        b=ZphVkU/yLMMJoaIZzCkMd3TwtxH/l4Fow92m28Omop8yDAgK1s+3RJOeAzcK+tNxsX
         QAH/kUsD/fht92ioS7FO49SU/9Lz103eHPJ30AVWi14A5llXDiOM4k43SzjhEPmNOw+z
         T2zyvktCzCzPA8l9rrJg8LnJ8qIL2apKsNZhQwVt7bnF34zwp2iK/Mo9boiahfsxjI7Y
         57yH9BYSXt9O/R6jCAPA4TlptfpCWH5JHSe9kxlfQA0Fcquqt0qknfy+oGH0nhxf9rVW
         6ywwzFFM709GM5tV3KI8SSpd8Gg7MwC31CjST8KQTplrOgBtKTfQheKJz3ZxLuq8uAR2
         a7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=N6rrp1PZTWCFekP68QS7wfkG/TDpiqFhA7xNmGuR1oM=;
        fh=VWAXjdmzaftW45hGaX4NZJ1oQkX/R0CHfOfHCNHOIgI=;
        b=lh5Eou4kqHEYlljtd6iIOgYXNbBOT7Q1phgwtFSuLA2KuI9JgjLEin52Jkd9aXmqb9
         Jg3hVwmYDHdXhVa6L+GEn6onlwxody515Zof+M98oqa3QLcXKB/BnQZezzac9HsODmz3
         PH8XNkW0w9YOTE1yNQBDuJ7CwP8vWZR09W67wtB4NcbuOCx/LEJBD5tzNaeXOK4m4Y72
         Esq9dQqrxNhF4KteWxgEKRhZtT6L+gyk4otbewNGUg8rVwKOUHleWGItjbsXhTGo7roR
         82LA/TREnOfvi7/urlTcNkMFQO0AmdQ5ruAIlrgGb9OIRTfgdv3gIaVmST65rfaapysK
         HvNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yFGJ59Wg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vw10-20020a05620a564a00b0078408c3c89dsi1694724qkn.660.2024.01.30.02.00.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 02:00:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yFGJ59Wg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rUkuv-0001IV-3q; Tue, 30 Jan 2024 05:00:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rUkus-0001H7-JV
 for qemu-devel@nongnu.org; Tue, 30 Jan 2024 05:00:30 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rUkuo-0002XG-EU
 for qemu-devel@nongnu.org; Tue, 30 Jan 2024 05:00:30 -0500
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6ddb807e23bso1760415b3a.0
 for <qemu-devel@nongnu.org>; Tue, 30 Jan 2024 02:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706608825; x=1707213625; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N6rrp1PZTWCFekP68QS7wfkG/TDpiqFhA7xNmGuR1oM=;
 b=yFGJ59WgarB2ZtpV+mklR4A2IzT2zjGWkKqkz5QIgZP9BMCjvTQLLnUTPFiAJtXWv/
 0vdLR3ew26r+hosdAjwX64A5y2zKHPkGUTmEbEnbEG7nbtzR8Uou1ykkuEJivLNUzw61
 wbEbbuSIS/+ZZ7mWYFai3vg9hXY+pZltF3NvcQp3durcsYoqA2UlkOs+lZ2Xp5H+HJlG
 u3ZHy4oiL9mI20GPGHf9ar1KWfWPiTg21BN5OnnX3RDQyqc7HRiR2OzvjdYbaHzEF4iV
 C7L0EvgOhDV9XrdqHPtmNMV5CyNfnaeEg5bFAY+I0x4SU2/3v/GZNgWFWArtGW2zz/UC
 3KQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706608825; x=1707213625;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N6rrp1PZTWCFekP68QS7wfkG/TDpiqFhA7xNmGuR1oM=;
 b=dfFMofzQrhkZKacDmMI07qG7O71hUlKzIRmX/8rutVCKA0XAf5DsM1/V+IQjCiZZqt
 FQdokCeHEwrPBbUiooK+e2iHgfswi/M7Wm9mxqzcpMpAqxFA5KJtZwlyOFNcI06qUbgw
 vbcM6Tu+ikwa9BDySGdwMbdhn6NVCO+xrjpJaeoCjQ9UJ7d3XYfTRDVRMPETP9U349gI
 2cjKfZdnXr6TkzS88XZL+6i01ka05We85F3lMT/2oiGxCwgEsDPKANBcPBjb97xu2MZo
 qAuO8Q+1iNT+vzGBnuBRMNcU3+TXrlC+sHBhsxvq/UZtV8N/pU+F/5Qarb9DjHbuledM
 EzFg==
X-Gm-Message-State: AOJu0YxBeI1ngRSJnlXFHeBCCg76r+H1aI69/ptm7JSmkKdiqluBLyn0
 n0N37eTY7mVjzLUNkpLz0Vze2daMKOq0WjRClinlNDz5Sq9SoXhxzPta8dDY0ws=
X-Received: by 2002:a05:6a00:4fcb:b0:6dd:8743:9e03 with SMTP id
 le11-20020a056a004fcb00b006dd87439e03mr4125687pfb.34.1706608824927; 
 Tue, 30 Jan 2024 02:00:24 -0800 (PST)
Received: from [192.168.0.103] ([103.210.27.218])
 by smtp.gmail.com with ESMTPSA id
 gu7-20020a056a004e4700b006db105027basm7382769pfb.50.2024.01.30.02.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 02:00:24 -0800 (PST)
Message-ID: <40b11cae-39cb-4254-95c9-27d4a2a13ff0@linaro.org>
Date: Tue, 30 Jan 2024 20:00:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/29] target/hexagon: Prefer fast cpu_env() over
 slower CPU QOM cast macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Brian Cain <bcain@quicinc.com>
References: <20240129164514.73104-1-philmd@linaro.org>
 <20240129164514.73104-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240129164514.73104-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rrLJeFRL/Acz

On 1/30/24 02:44, Philippe Mathieu-Daudé wrote:
> Mechanical patch produced running the command documented
> in scripts/coccinelle/cpu_env.cocci_template header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/hexagon/cpu.c     | 25 ++++++-------------------
>   target/hexagon/gdbstub.c |  6 ++----
>   2 files changed, 8 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
