Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DA4CA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 13:22:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1unzo6-0007xB-UV; Mon, 18 Aug 2025 09:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1unzo3-0007wE-S4
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 09:21:48 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1unznz-0004a2-M9
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 09:21:44 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-76e2ea887f6so2996126b3a.2
 for <qemu-arm@nongnu.org>; Mon, 18 Aug 2025 06:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755523301; x=1756128101; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=86Wif9ulXGxHAt/Z2m+j3pMd6lo1ynn1p+qvg8ULdwE=;
 b=l80DeuvziKt7WJ81p8PL17S0rQhu/kvJe2nXBlSIo+0RIwEIRx7jZJjAxPcFVqZLyp
 +YkrWIVHAJTwUmQbfPFcFTRV9HPuaLm++00nU9tnUThoJx6pEL/g1X8RgPlHjPmlHgM4
 QqIUEwMBc9P9MnlT/8a1Cub8tM4z7lK9yN8VDVpYQSp/8bh019gYggMGSvMEIZxu3FAa
 EE8102/dmzYegZ2oUcDDhI7T/GtpHCMxrI5/h7kBfkVxmxFIK7qEe8uy4t4ZUe4NF5Lz
 kN6DEmKeoo9PM2yU+pOFmUa7ChRbPoIAt6RXbQzU5eZzflp1vx0aB+vcmymSRu215vEN
 86Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755523301; x=1756128101;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=86Wif9ulXGxHAt/Z2m+j3pMd6lo1ynn1p+qvg8ULdwE=;
 b=XVOURn/5mkzjPBr1DpfWOTdbM7soP3lXCResXbTZkxk3E8g+i5q5kgFb4xlgEF3IlW
 tSAy/58VQ1mt/qpfrTs9lDzCrfo3Svszsi5QTbYg97NT8tQLLKrY8TYhksTSwA+MYYaY
 e7jZic38gMV+cI8oP3Zt6KW417+pvYZDYf3Z+p8A96eFfiy2wUQs4myT9WnLVv1v7sPJ
 3aWYwDNTCsjokASal+pw+QB+tp39eavuOSSmKzwlteqT7wjPzazi+m78LZLlpR1p4ES/
 DPkBad1la0KQt6dckcUCZE3CKrmwV2U55uioJg1Q9YpKb5Rggd/ba4IMZow+rje19T7k
 +ibw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUldYZjMKrKyUdzGsSorC3hnAdwJjEPQEEv7qLsXz/91wacrixeChkGZu1JLDaPuwvKnlHkwWqwPw==@nongnu.org
X-Gm-Message-State: AOJu0Yy/RtQOBlgVeHOmndW814keraftntW/GkqN9IQdcSCNaM0KIkY1
 6bL7KiheOYA3L/us1Ms6hf/x/hqrgr8kq1ffpyY+v5dJnYEv5R/DQUPJzFT00tprZyY=
X-Gm-Gg: ASbGncsOgWoPA2GF62/55s/tqa3si8hS6GAnbZa4726OnJCIjNNENtx24XYT92fn+z5
 QOWyUqvaDq2AWH0kMbzF/efoRldrL/SqNwaOio7q5w59P5cS87JHOhtKoIxektjS8oaCGLmryGL
 09r+6KPBn2C8Es4ldlxRiwI10r/gSv8Bkwf04pjwJbKzGffA9GLn1NIQEUav19isf/+zo9j64f/
 bJCqQ8ctaHlCDnxJqewIrwyLHT4ia7qBqKJs02iPrn/U4i8wOUO6llsxEtM+weIA0CdN1t+hJRY
 InU+0JQBtc5sVPO/mXA41bDF95sUJLv0k3rDRttmUEPWJ3kd7fltD0+lzPlKWjyBeHBPYbbI/wZ
 QDNSVywBlFRHFjaml8spU9PYVxqL9fbRrfE5ESCc=
X-Google-Smtp-Source: AGHT+IER8qps9oPLs1fSldjDL9hrKz7L8iPRP8C78DXCjsGCx7boXGhAcL5H5UE/5w3eIpEPVZI8/g==
X-Received: by 2002:a05:6a00:1949:b0:76b:f318:2d41 with SMTP id
 d2e1a72fcca58-76e446d6151mr17863865b3a.7.1755523301330; 
 Mon, 18 Aug 2025 06:21:41 -0700 (PDT)
Received: from [192.168.1.104] ([206.83.122.207])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e452665acsm7423435b3a.3.2025.08.18.06.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 06:21:40 -0700 (PDT)
Message-ID: <5b9e5f5a-b434-479c-8840-dbb4cda1365c@linaro.org>
Date: Mon, 18 Aug 2025 23:21:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] target/arm/hvf: Add KVMID_TO_HVF, HVF_TO_KVMID
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: mads@ynddal.dk, agraf@csgraf.de, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20250818041354.2393041-1-richard.henderson@linaro.org>
 <20250818041354.2393041-5-richard.henderson@linaro.org>
 <4312974c-9b7e-48c2-a190-071ea72da33f@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <4312974c-9b7e-48c2-a190-071ea72da33f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/18/25 22:41, Philippe Mathieu-Daudé wrote:
> Rebasing Mohamed's work I'm getting:
> 
> In file included from ../../target/arm/hvf/hvf.c:413:
> ../../target/arm/hvf/sysreg.c.inc:156:1: error: static assertion failed due to requirement 
> '!(HV_SYS_REG_MDCR_EL2 != (((((1 << 28) | (19 << 16) | ((3) << 14) | ((4) << 11) | ((1) << 
> 7) | ((1) << 3) | ((1) << 0)) | 13510798882111488ULL)) & 65535))': not expecting: 
> HV_SYS_REG_MDCR_EL2 != KVMID_TO_HVF(KVMID_AA64_SYS_REG64(1, 1, 3, 4, 1))
>    156 | DEF_SYSREG(HV_SYS_REG_MDCR_EL2, 1, 1, 3, 4, 1)
>        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


>      HV_SYS_REG_MDCR_EL2 = 0xe019,   <----

How odd.  It should be e089, if it were encoded like all the others.

I wonder if this is a manual typo that's now baked into the api, or if it's an OS bug.


r~


