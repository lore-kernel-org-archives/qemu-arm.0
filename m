Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2244971njb;
        Mon, 10 Feb 2025 14:06:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVAPRZPLSZnTyU64+TFLSqXqmYqKiALhGtlA/0T20YnALP5N5NUyTWyPRY6Q0+ia9XjIYBPMn3UFJAbOg==@linaro.org
X-Google-Smtp-Source: AGHT+IGyrvC3r6rf8xVG+9DjQW09/6x+oUMqqpE3OK6uCAmk7e2D1SPUmj7v8XXu8ucYFlI4+7Fz
X-Received: by 2002:a05:6214:29e4:b0:6d4:238e:35b0 with SMTP id 6a1803df08f44-6e44561696bmr217817586d6.17.1739225186952;
        Mon, 10 Feb 2025 14:06:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739225186; cv=none;
        d=google.com; s=arc-20240605;
        b=IP3xIFcfmJWI2sGecJlpgeoDvw5KqitUs4DE8T3Fx2Hxb0TUsIMWg5SNAa4NC1+ieX
         3CV24/PWokeECsxaJU2C71iFtsvxteJTdP52KBhmlP7btwagNhQ4Dgske+VMmW48mmbz
         sreyiiS/QP1je+bdls9xvxS5uWjT+IeEE8hlxF/mNJSO3v5jy7f7MW6QqaOUN5GRi38X
         Z5NUU1jhxV6N6wWe1oFf1TxbiXjg9NrBvqP5ufPqyefDAYArwP69bRShDnU1XeCWmoWW
         uwSH6a1Zy6RfanLqlEMs+3XT2UUe8ZKay7gsi+haySO3ts0l1Dq/rqR7zAjEboX6vlNo
         Q0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1iLQ3Fcjem5IgImYsaao2KKU5aHeiU/l6CC9WMjgOAM=;
        fh=jIE71ikUHnpFu79rVIzgLqTW7PcTaujBGOXCPMbN79c=;
        b=SOtKHu/pppmZUvTa+6pvC+bkKl5u73wgu/t086SoAMeP3OpYunw7fbmnESB552ylps
         QR+STOAJ0r/tKZxnGDHS71QhHchlARvIIsJzNlp/TA9b9DUbT8nWKM9ELweuqPfUhdqY
         E6z0QtdG+K+vt5ei9R5tmmsXqlosIcvPeTL1qqInTiTXvhvZmxf2ApGO2DpuDUIZD1cr
         OUV3oUfQVeU/O6hQlFrkaI0Xa6KSt4SfB41st6lEAjo6jNADIEJvA6P1I8OyzRuNz6ZR
         GqcpqJhGEy1SK3916FX2hbQ1ej8g1oEJ+8FjB0IQJcEH1feEpYDwNANmxwOqZooJ9E7y
         rkRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QoYK5Ind;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e444eaa930si89237926d6.26.2025.02.10.14.06.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 14:06:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QoYK5Ind;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thbuj-0006li-3D; Mon, 10 Feb 2025 17:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbud-0006k2-AB
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:05:55 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbuZ-0000Hj-3A
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:05:53 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38dcf8009f0so1659388f8f.2
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 14:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225137; x=1739829937; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1iLQ3Fcjem5IgImYsaao2KKU5aHeiU/l6CC9WMjgOAM=;
 b=QoYK5IndW7diMnFGkUluCKChc3KEC2nh2KK6xfeiuBu17hAuJ+X28XEMYPfcMNoawv
 vR/7m16xER3jSnQWnrNYOmtMq8RLo7DsOUl/FG2UO5HH2tcMvVUTdcnFl3VFi5i94s9I
 K98u8Dx2oMUr419Ny7+I2ovlGHJ7fP3Bl2jWrXlmlyFGWZRJG3S6zFz/oWiTa5aTQfPU
 hkGEdAmTa3kO+HJRzn8WBl8IpGnAtV7qY2yD1T8tSTxLKLB2TSHC4IOZjP0K1Cu0Hm9L
 r94Vvwroo6JRbpzQW32C9k/FLl1OplyDV5ysjppptAiMctsjJcmaweo1M19egEaggqli
 Pptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225137; x=1739829937;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1iLQ3Fcjem5IgImYsaao2KKU5aHeiU/l6CC9WMjgOAM=;
 b=tJquZaazM+vhOmE2YyrQmz4sgYuZgaKUeDUldNZDpS5dEHuu2RO7528l8ikvApmGri
 vdx5DkPE/SsbNhTQr4+f6Pv/TOKsCbGbIa0oU+s2EOpH4UGDUZ57CoOnJGOmZJUE7A8C
 43S0G5ASP2dZ06c4oeovtAhcB4FLNq1MBYgdU3g01N7GY+aPEnWS+ua3MYOVAzqUqArv
 TTNnLePlTjmagabYndMQ2Jc2oGI1JmgdFiNOCQeDIN1zWsrE4ihs4+OmpsDwyOk0UUzN
 jkFkyfmfFYbfaJ8fZeYQtpKZf09dmkvu1Sms1Sfbgikv+lMZlAUwBkFTwZCP+AtmYpia
 rvKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX53Ku2BXmgedQphtylPYGbYTr9MNgBSYzNmpczy6fjrFdbHTb6L+SXALM3X0vKM4CSVgHSI7vGmA==@nongnu.org
X-Gm-Message-State: AOJu0YxDz8ngAcZNRrzCsLxwI3k4WBHEiOCxYZFgBL++SvaIBwOaCAVK
 tp8xDGMY3ihCiW4QNoo6pZfEOEsiikwhuFiWI+TPWtey+rGK278QjlaRl1fBSc8=
X-Gm-Gg: ASbGncvSwW0yAAhASXZ8Py0jODaWRNlJAsy0xQVPnCYFV+owCJEhV1CqgsYK/C5tSXq
 S8kH8sfljbSBpy0QKGVS0+ZrYMJ0WU290H4NwvHeKEiYvGyejexGyLlUFwkFFkWPp88zgQ5mEv1
 HstJ13U3niTCNEEl0oTDhNSDIS3QQImtx9bY/4RGHRMis2Kvy/yHizbSf386XSv+OdHT1Ub0HXr
 WxCQEediuDBYs6pQx1V3GYbCUhIzSCoP+IOLhocc3/6T7PeRSvzQUdIgXXxpBKbCjPS0/NnWESv
 fqf+Ka3EykPTgHklVqQcOE4PyO2SRCJoVjTBbdJrHqGFjuXWcBs1bdE6pUY=
X-Received: by 2002:a05:6000:1f83:b0:38d:de92:adab with SMTP id
 ffacd0b85a97d-38dde92ae55mr5374456f8f.29.1739225137114; 
 Mon, 10 Feb 2025 14:05:37 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc9ce31e8sm10632809f8f.5.2025.02.10.14.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:05:36 -0800 (PST)
Message-ID: <5cfe8347-12e0-4f61-8e5e-f4e5caa80fed@linaro.org>
Date: Mon, 10 Feb 2025 23:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] target: Set disassemble_info::endian value for
 little-endian targets
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-2-philmd@linaro.org>
 <45b18fab-59a3-49c4-b600-b9a26b815961@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <45b18fab-59a3-49c4-b600-b9a26b815961@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: GvljjfI35xWt

On 10/2/25 22:54, Richard Henderson wrote:
> On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
>> @@ -35,6 +35,11 @@ static const gchar *tricore_gdb_arch_name(CPUState 
>> *cs)
>>       return "tricore";
>>   }
>> +static void tricore_cpu_disas_set_info(CPUState *cpu, 
>> disassemble_info *info)
>> +{
>> +    info->endian = BFD_ENDIAN_LITTLE;
>> +}
> 
> While this is not wrong, since there's no disassembler it's slightly 
> disingenuous.
> 
> This is the only target without a callback function, correct?  Let's 
> split this function out separately, along with the hunk in patch 10 
> which makes the disas_set_info call unconditional.

OK, I'll also move this line to the previous conditional call:

+    g_assert(s->info.endian != BFD_ENDIAN_UNKNOWN);

> 
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!
