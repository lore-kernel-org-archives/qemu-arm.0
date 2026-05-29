Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44478CD4F54
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 17:11:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT0jr-0000eg-1w; Fri, 29 May 2026 13:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wT0jp-0000eM-Qa
 for qemu-arm@nongnu.org; Fri, 29 May 2026 13:11:13 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wT0jo-0007V9-BB
 for qemu-arm@nongnu.org; Fri, 29 May 2026 13:11:13 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-82fbf5d4dc2so9769102b3a.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 10:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780074670; x=1780679470; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m/FonfV9xysczRoV2MiizOpkSgqxtGDJN8eXQSghS6c=;
 b=E17NafjV0aU6MkBm99BieIXfVeMwVQ+KZtbXM6nDuDSjVgejprit6gzimD1QRucEHz
 x96OUYbqj3haf/E4tRQ3SqhJDeqsZAJ02vyMTaE099vzKK2bUmLukUTqockai5SuisE/
 55P9LLvM6vL9iWsQh+uFlsONicH/1NTLv8aZvDCFANXNJAYRJM1lHXRBF2OsBXoicuaC
 vHV1qsyzSI0D2q1wsnARjGTR34FsJRoPeX+IYhX3+eADXOzbD4KFsRdOT78gK4WUJ8mj
 HDSHNXl7axmhYs7IvCldfXcOh36c5VNvPBFZXlj8qr7z+rX0SJ9mtUriOe5yc6QSyz64
 Q+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780074670; x=1780679470;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m/FonfV9xysczRoV2MiizOpkSgqxtGDJN8eXQSghS6c=;
 b=p/xSqEHLLsH2y3B1TwoRBABs8cV6krKROs3XnzmDi0WBQtg3bhysfFf9JtBC/6yHKr
 OPgceUxMruF29PmOPQrZErAD1ClQL3aIvGV4tP0KaptxC+u5jzBoIoplp7TFUJKv07tj
 b8545KdZGz3CUOzs26ljycq6VlqAYPXqXA1BhCzhmJP9xnp5pIRRtn+3/xloPNolWSBY
 m41VCaSXOXxhuXpoxltZHgMBeKUpHjMZ3tnH2EAw5ayxNKlQ7Ho2D03JNZkpZ9P4xXqo
 6IX2jCAftYShUgsaT3Q0QYvpODu4UG7eARzzU07s+hnYYhyd/sbQxO8BclP4oumbKTgU
 Krpg==
X-Gm-Message-State: AOJu0YyyNbsrbrBVKTZWZsyVadPeDzAwcn0uaZyysny0McxBKdT0WvMb
 6JqinHkmkQekGjHdPXRkASIhY90IoYSwQoweaTyai24ZNWvsO6D2zMbzr37OXzWJ0ze2PFJ8gff
 XsWPEjzw=
X-Gm-Gg: Acq92OFykW6hYzP1Xphj3FtoixujbmzvdscabAPS6E9sWJ0NWVQA64+2ePU3zZmVEm2
 wf6O13snV4SdQBEqUAgMjw4ylL0i+Uj/bloHMY2ttuDOS8S2xSOS0v3PEvPqM0RmVFBrUUi4r8S
 UEyqvsp68P/YUQJSig7haOuwtuhDLSlTAhvXoP9KDtoCeZvagpw4wD9Zhq+lkUrZGPk0+zc0pH+
 nG7J5n7vHrsobruDBkjOm5Gt3Sh0J61irJpzZJB1bT6+o9sgdlZ5+4gqRaARf19SRvfAja4KbYJ
 E41vqXkLLJEwH1mOiAcy9bKMGes+gjdRGoswtvqoUlxpfPJrqNfoIs1i1i6KUFuymQ9p9RTB4Fy
 XPD3t7oaohI0GmUb5SmJDirZ5/abAekCa64qYJU1vyZwvVXdT4+n07asUPcJf+4OtD3IUgqXEq7
 DmsQsgFVB189ZS4W70oe95wzCyIuvX61/prsdbA3Sq6DLBonnrXpUKaxVgoQ==
X-Received: by 2002:a05:6a00:3489:b0:827:3d52:5d1a with SMTP id
 d2e1a72fcca58-842251b184cmr486198b3a.0.1780074670165; 
 Fri, 29 May 2026 10:11:10 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84214cc0d1csm2675397b3a.42.2026.05.29.10.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 10:11:09 -0700 (PDT)
Message-ID: <c21051c1-19b7-4fa5-b14f-772a50717d8b@linaro.org>
Date: Fri, 29 May 2026 10:11:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] target/arm/ptw.c: Add Granule Bypass Windows
To: Jim MacArthur <jim.macarthur@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20260528-jmac-gpc3b-v1-0-d34c46c5069f@linaro.org>
 <20260528-jmac-gpc3b-v1-3-d34c46c5069f@linaro.org>
 <c5e98ece-ecad-42cc-9b83-154453f535a5@linaro.org>
 <ahnCgXdlwjro5Ybj@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <ahnCgXdlwjro5Ybj@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 5/29/26 09:44, Jim MacArthur wrote:
> On size and stride validation: there are reserved values for these fields,
> but the ARM does not say explicitly (that I can see) that they make GPCBW
> /invalid/, so it wasn't clear to me that we should fault on these.

It's right there in the pseudocode for GPCRegistersConsistant.

r~

