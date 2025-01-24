Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp971054njk;
        Fri, 24 Jan 2025 09:36:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWnmj4pV4CDcV0x2I+BhQcrCyY9h9s8ZPVZx8zLSgGrBPk8TuelR7BVeZ8MbUmD4caCQ7DCEsRBHAr5WA==@linaro.org
X-Google-Smtp-Source: AGHT+IEVQm0eanowSbz7djmXjjsOY5jMpGb3fNiQAhDLDO90EYUQsQpUHOZ65xc69Lir0njF3YRV
X-Received: by 2002:a05:622a:145:b0:467:7109:c783 with SMTP id d75a77b69052e-46e12ad54d5mr462356371cf.3.1737740178647;
        Fri, 24 Jan 2025 09:36:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737740178; cv=none;
        d=google.com; s=arc-20240605;
        b=Fvq1x+FXE8b6srKlsEdR+su6wVCXRv4dE/MDfNLrAmSJDO8skvjxRKPxdvVtsRiy1X
         nn0KaQLb124elaObkDMeQjxhdgwuJoAPLkAJ02UuPhsBAtSdoh44Rugl8a27qXjMQSW4
         qMiwrpDJAACcTere7DXvylQx80EZQpxBOfacL3BMINZXuqXgF+1fVbgbhaCFzWuMOL1R
         Pn5KP0P1mu5Lhw693UWJ5OV4Yiv2m2zeAtRFvdYogE0QxHjX81ZhcsMx6KgHJFRStLfj
         XDETXP508ZuvbC8A3XguIMHuE5EebugbmI+hyjzZlaLWVbXKigZSYWZ2Zi9KNPWUnxi6
         FS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Vj2bmY7ocEoFlIJW1XIP32ep602ok8GPszCadUjMCC0=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=Pf3fo1SsQwZ0ogvF+fwRAKijl9NzTzPtjqnem6Kn4Dc+UMZc383/tB45RMy1memmGk
         t/zH/vQ/IqdGK4mkEhVOtcsAbAckmXJ9Ltrrto5QUvWTeoXIuHn3wQJM+l6sb65UyjgP
         Wr9RVxCRFDZP/t0YG76WTOTzyPA/TWfaP28iR0W/RrTD5luZ4C8nx4VxD/XqWTOvfqQD
         RXzmHRnS+j6oqOHAB3KDqGcRabYirP+8PXnSf4N2LfRl+5IcMRtMVcToaoXJUiVTChN/
         sstKK4zsvQXRJ1gjmojWuCnYtZ8/Bip+UQgU3zOog8TkUDatojYbo6kM/5magKir+Wf5
         qIHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q2NfdE8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e6686d299si32117011cf.7.2025.01.24.09.36.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:36:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q2NfdE8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNb5-0006d7-3F; Fri, 24 Jan 2025 12:35:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNay-0006YM-Rv
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:35:53 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNax-0001aa-CT
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:35:52 -0500
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-467a6781bc8so19286241cf.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737740150; x=1738344950; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vj2bmY7ocEoFlIJW1XIP32ep602ok8GPszCadUjMCC0=;
 b=q2NfdE8WjKnllajXNWdfmj+UGrWXtdBzy/jmVavcROZSF5uLaXevueO2/UvwgPlyVP
 axJDsD6yiTSm/NDHSf/KuMGi8Pjj+bvoFbJfG6LyQE+l2TjZn+CA/KzOmo4rlKjj5dkn
 aQ4Hgy95FqpD1i3cO6sexQ/RhEt7ap6uqR9sV2CiBU1JLMB2+dD9AWfbt9JuW1OWyNPX
 Z8AHRvaBHZ9t96u2Ug0gXVllrT/xh9gjUdcvGzNkmSOxnyMII8xktrgyGakvFQScxWjM
 p83tzbihhxXwxfZU7WY2roAjnwpDnD00LJZCaJmZjhnmVIzzMbiNILnYLAUaWqEZ6R3N
 REwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737740150; x=1738344950;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vj2bmY7ocEoFlIJW1XIP32ep602ok8GPszCadUjMCC0=;
 b=Rx8tORQJ4oVV9S6Wf7U+HkodZMkQOP9TDl618fSBR1usT7sxqZHZggvb6YTjs0zjt7
 xAW/7zVUSZsYL5m2RpanYyNFa9lobejRasEroANBKPzdVpOoWAriK0ytnHPugtPLdyVs
 2XgyrWfVa/BzKKNhwvrNYlaUuSq2q5syi+VXRZlCLoBxBUGrXzOJjwVvEkE+KxHKTiV6
 ckh6stDRXraQ7LS0hT6YEymUlUSBubTjbqzO7TNlyysTSy4csD587n7M4kvBnSpNb/Za
 fieadoQ7VE3GioptO2MB5tVlTJtufrDQxM3Dptao4yUTnihz7MU/Jn9Ykq36Vl39bwLR
 u/ig==
X-Gm-Message-State: AOJu0Yzq0BujOzPjccPFUf8a+KWq1IjEzUgCvZ3N5OCCmCVuUr+VXK7T
 EYMxK5aH6MkCGvNlg1O0SUb0nQ/gqrNVem17eQqHrK8aI3/XCsYW/cJs16iIl8Q=
X-Gm-Gg: ASbGncvp8TEsa7JpiY41ocCGv4vgHvc4EgywhfNfl76EEJ/CylaPhHRAkDIYjFsyNCi
 RSHiLOx46DIeb8GvvP0NskWpI0wWbrbczaVI0TuUNLIjVRDomzm7qzI1Grei14GYbkKshKIMUHA
 TevsDxWfdRG999pKyS0FCsOVTi+M0YZnHMqadWuT0sHiC9hGQmee64VKqUVs3yIQUDlqaj8/iDp
 73PYjnBbfeRAowmD9wfTDgq1BZH+wwlF1ytIfxTgcguGa0y4M31Kn0LeaquXmKN4x/hDflsgC+6
 p1y1guYYtsgL2z6biieCPDeHhokSqBVpYeWM7sV7WebGoSTzQhHBW6tSR6wA74vL8A==
X-Received: by 2002:a05:622a:1387:b0:467:674d:237f with SMTP id
 d75a77b69052e-46e12ad5f7bmr480219311cf.11.1737740150360; 
 Fri, 24 Jan 2025 09:35:50 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46e66b84c9esm11820501cf.66.2025.01.24.09.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:35:49 -0800 (PST)
Message-ID: <83ce8b2f-6f97-4287-89ba-0f5bf3815eab@linaro.org>
Date: Fri, 24 Jan 2025 09:35:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/28] target/sparc: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-26-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-26-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
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
X-TUID: mYNBhpI7b1QC

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/sparc/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
