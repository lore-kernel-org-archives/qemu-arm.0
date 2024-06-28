Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp206935njm;
        Fri, 28 Jun 2024 09:02:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/2lXQCZlHhsIJXxntkpRNeCh1wz18KTLtCzNRq5oIwlwv0FE4XpKg6mmZFZ/oO99q/1GxxXK5J7KjH/ltUxBaWhhfZvHp
X-Google-Smtp-Source: AGHT+IGXdcoZbaSrkSum5Klt+nc3O1diLVpy7dC5zdRuVTDZf4pQMDVBEE6ew7QJNlUnoaYfAACt
X-Received: by 2002:ac8:5a15:0:b0:441:5370:8334 with SMTP id d75a77b69052e-444d920d436mr210309231cf.26.1719590530205;
        Fri, 28 Jun 2024 09:02:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719590530; cv=none;
        d=google.com; s=arc-20160816;
        b=bKBpBKUueetINLbifc0btU4XLROvzxxujerVISWCJIRr9HdvRDOf6c3wAsCJXJHFDA
         Jp4nDHdWFbpMZD0VZExv2isE08oRGvSoeBUBbBNw1VwJEvoZbcw07Vu/0yG5dKeaTMJH
         +MfoeDAn8zHpfRMso6z1EkNXlJ3thrwYHu92PHYwEdPpcWO+Fdn6hvNIlaU7LKChM3UC
         L27HQ70D//kg8mxsAsxPGsuES8zkIo21Ve3pZZeNnYgXsanxI0rsaoq0NlJUQ9jA3vJt
         oUj0guqsVTtHpGdmELoyNsq1i60jpbBdJT+DSYiKdWr1PhGyz73tbMKXSO9vhm4fR0e9
         7IYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=u1zBg2dSlMJBfyzgYydD9HYz4rygSlRXEQ+WL6SO1+M=;
        fh=GOEN3RiuOpNgsrWxp0u678MfNszqjMxz0Nbm3zpf+Mo=;
        b=ZuGRvZ90A4Z2+14q0HDa+LANIJLo8jaCk0ZLIZIjwq+mDYMW19vAQJmpYyFE9ruz8V
         wcDqP27Q4bNao7c8mWsRg6NGPjFwuGvtqNXm+P3LPOemFZbKZUBYky3ureHEq/EXxA9w
         cME4sFPju17m5fy/vx5wgLAg2J2MlzUmcb3gZjQ3YXSj0HL19noe6ttRnRei1ee8AdrK
         Ov6ESI8g5AXkLyd7nkXCf2B+RJgKV9KZ5yn4UdbMasvTJw82Y3SWDJNVCZHSXLBc4utB
         NAPfEP2B7T+8+oW601dIBL2bkdFEVwGqILJ4P0l9cAG0Lrvdply3GBDEnJPRNi8KmdoW
         Y6cQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JWLVTEbo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446513c1f7bsi22250131cf.89.2024.06.28.09.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 09:02:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JWLVTEbo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNE33-0006BZ-7Q; Fri, 28 Jun 2024 12:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNE31-0006Ac-8F
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:02:03 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNE2z-0003Gc-8C
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:02:02 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1f9aeb96b93so4726935ad.3
 for <qemu-arm@nongnu.org>; Fri, 28 Jun 2024 09:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719590519; x=1720195319; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u1zBg2dSlMJBfyzgYydD9HYz4rygSlRXEQ+WL6SO1+M=;
 b=JWLVTEboONZoRmphKES9e1VgKbpTs7pUWIGjJzQUmEchdSs0fVh7gxAQPLpfWg/WBk
 36mRRes9vM4EJlmvqGJ4SVH53Q96/YWkSBZVEEu7PuZDTQ9jJIVXZ7xl9mRzmPgPmawW
 Rt8K5ZiomCFh/aDhDFbQhF26tXDbTNI+zAwElgMR6/2D5ezts6NJevUdS7zBhmFta9V0
 fQfx4QUUxR4gIq/qKOHpVLCyuJ/D0sBZfK6GjAs5/4zni4fTfVnsljYqq5qG39ibTisw
 dDMPUGqidMizD+kdw8wIO24AkKrfENZQQctRZbGKtMHI8ZM0B51I0o1s6JU2+KOSyF6l
 zwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719590519; x=1720195319;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u1zBg2dSlMJBfyzgYydD9HYz4rygSlRXEQ+WL6SO1+M=;
 b=VzaxFvcP/QoF5idwGEiq0+vLqpBaVywlaKwRLPbdix1QapiYYPwORLEeejuNnf0kd3
 UTF7xqncSJ1ZT901MJq43+sog4hUMtUKirtttKoiGh3cGx0IychtZR+zIU0PM5tS6EYh
 i0JHMF1KEFaNI9nfflL7PKGBnP8dlANySBL0RT4PmXF75rIh/Dzj+9S2tRfr9tqG3kyU
 a7OQD4pzYd1PR0V5ne5q2hcBfTY1xWT3An5oQ63quPsDhFgt+AMwFsiS2pHKxzr/+n9Y
 E4DHPdEtV8C5Y2j/AtcauYhXjGxc1KEpuU2XbJweqFbVmnfWCPSmSP76gW1/65LUuG4w
 lgtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUheWsa/XKQL4det91C/dA1V+mxqbZChFiVdhB1z1kztNLp9RH5A9vMrkM0iDoFiyYiVaMulHWVTLYtvN9Qd9kDYqDh
X-Gm-Message-State: AOJu0Yyxi/ogrVQtGPh8qvkMsLWMKl5vo30C6Ncj3w2F7eEdIPj+qMmP
 HECkG+u/j3/mihBzfjfPuevBg0TDtnXituQfE67NyqgphCtrocU4i+OwsXE9GOo=
X-Received: by 2002:a17:902:f64f:b0:1fa:292f:cb20 with SMTP id
 d9443c01a7336-1fa292fcdabmr186282475ad.58.1719590518715; 
 Fri, 28 Jun 2024 09:01:58 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10d1ccesm17400135ad.20.2024.06.28.09.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 09:01:58 -0700 (PDT)
Message-ID: <ea780763-ffb8-4a97-8a60-5128f1ed017e@linaro.org>
Date: Fri, 28 Jun 2024 09:01:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] target/arm: Support migration when FPSR/FPCR won't
 fit in the FPSCR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240628142347.1283015-1-peter.maydell@linaro.org>
 <20240628142347.1283015-5-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240628142347.1283015-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-TUID: 3nADDkZEJn6R

On 6/28/24 07:23, Peter Maydell wrote:
> To support FPSR and FPCR bits that don't exist in the AArch32 FPSCR
> view of floating point control and status (such as the FEAT_AFP ones),
> we need to make sure those bits can be migrated. This commit allows
> that, whilst maintaining backwards and forwards migration compatibility
> for CPUs where there are no such bits:
> 
> On sending:
>   * If either the FPCR or the FPSR include set bits that are not
>     visible in the AArch32 FPSCR view of floating point control/status
>     then we send the FPCR and FPSR as two separate fields in a new
>     cpu/vfp/fpcr_fpsr subsection, and we send a 0 for the old
>     FPSCR field in cpu/vfp
>   * Otherwise, we don't send the fpcr_fpsr subsection, and we send
>     an FPSCR-format value in cpu/vfp as we did previously
> 
> On receiving:
>   * if we see a non-zero FPSCR field, that is the right information
>   * if we see a fpcr_fpsr subsection then that has the information
>   * if we see neither, then FPSCR/FPCR/FPSR are all zero on the source;
>     cpu_pre_load() ensures the CPU state defaults to that
>   * if we see both, then the migration source is buggy or malicious;
>     either the fpcr_fpsr or the FPSCR will "win" depending which
>     is first in the migration stream; we don't care which that is
> 
> We make the new FPCR and FPSR on-the-wire data be 64 bits, because
> architecturally these registers are that wide, and this avoids the
> need to engage in further migration-compatibility contortions in
> future if some new architecture revision defines bits in the high
> half of either register.
> 
> (We won't ever send the new migration subsection until we add support
> for a CPU feature which enables setting overlapping FPCR bits, like
> FEAT_AFP.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/machine.c | 134 ++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 132 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Not ideal, as vfp_get_{fpcr,fpsr} are called 3 or 4 times during migration.  But unless we 
have separate 'fp*r_migrate' fields in cpu state, initialized in pre_save, there's no 
getting around it.  And I suppose migration isn't exactly performance critical.


r~
