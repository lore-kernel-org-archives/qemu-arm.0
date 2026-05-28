Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D552CD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 20:00:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSgtz-0003WU-NE; Thu, 28 May 2026 16:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wSgtu-0003Jz-Fv
 for qemu-arm@nongnu.org; Thu, 28 May 2026 16:00:18 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wSgts-0003fv-89
 for qemu-arm@nongnu.org; Thu, 28 May 2026 16:00:17 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-36ad15213fbso2903417a91.0
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 13:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779998413; x=1780603213; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fZLtWAblyRSu7LvWSy+oeSFyJEExHTciFgWuOWW8KVo=;
 b=Qj1/pyDXq61gqpKG73UZoLUSl3GqMNSJd/4X6d4veDFeDincDrf9eiaozt3lMACMhd
 LeJZDEomhPBInhu7OrvuFn1VRzRusG7Xa9g9tlnPNOIjU+dAQlt1dZLn+hIN1sIAs54c
 zY861qXLAvwOmqYvcd44BHegBTu4H8t3gBwztTER1i0gVsQkK4ZljeDaJxho8IdKJiBx
 QutH3lbi9yO6MIujVGd5fYBMr7XSYnxfqoI3SOqV4nqxTYnWhrlLI5OhaFmK7Jg0YyQZ
 RxJRMyWTEj7huCT8zSd0EEuSUX7bX7G9kYJg7SWnWYkSrkkF1yILlPnd4ZZSDX1MmvYx
 bflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779998413; x=1780603213;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fZLtWAblyRSu7LvWSy+oeSFyJEExHTciFgWuOWW8KVo=;
 b=CACifHkfXTqrqJDvuRWb3VprbQx6/woCNJd+me/zv8x5Eh/R9Ta0s5VxWEJvxiRMWV
 M4F24QAbrci3Qz2gXMOm/MkDpPG0L2A+u3wJ1Sl4zaEVTpEZUOZ+lQHDL30YZVi4JnK0
 SZNo75xh1KcRCMoM0x1MaF+mkbIQjDrdNd1T+ghcArLODLAthKfu6cwPZqPsmHfExH93
 RA2JQQdLZnJD4CptOguLNQG0HDi7uT20oLGMTMpgl56TVPPAEqGW5qm62nISeIAC0wP/
 KqeWG3kkVcXDWZ064TfftUlANseuYjNWvE6+nBNslTRwHRlOFEifHGUhwUGtf2naEdXa
 2aTw==
X-Forwarded-Encrypted: i=1;
 AFNElJ90lOxAE8xtulld6JG0VWmTeh/kZWESlghFlFacA3BNmLKZLJ/VxDAV+gYGQRsAWGMtDpjj76DdwA==@nongnu.org
X-Gm-Message-State: AOJu0YywarYy6gdN4V8U45JLue9gzgXvHoVc8XT5ubZ00XcyW2U2hxYQ
 PdCAQEUee2xZWooiEtX1RXsIEK57iTtE4idhsPGSIYJepJQPynxMD5SCDzAgw/76YHk=
X-Gm-Gg: Acq92OFh0uEK4nxnPEeGqZtaY4WCOEblXB9BlUOGJFmC5FWrjhtNjAUKMnaPZnzyoCH
 LsBxKXpBOWusHeC70xvkubdFjmHI8IRxke89Vkt3WFtdJiEphfQixeBk5eQ98t3s333oi35CIvH
 kknzp+DWilItFPnG4Fdz7YOPmFTMLN+L1gw0V4NMvLSqWLuYt4/XVZU2qrFm8NIkteGERlgC96F
 AMCPwSSvmNpzJ0fgUsmXb5qNxacYEVTDz9Sbw9BpycDoIXATU4Y5OZqgvWs2/9kWXCtaub7Wv2o
 DUdMsOROcPNkHQamBWG0RBJQ6l+Ioc36fta8rt3DPCnqJroeEOfKqYbJ6MxFHvHQbGpPHwDarn8
 2lj2we/ZWL3Z+SdmhU8WU940vb5jmdn925MmPYEC5KhW4zry1doKzU7YVaVJzyGCPTzvGd3vU2A
 UoPOJgpl0YwEv3iAdmaSgmCm+jKLDwrsmRpMO+2qra0f1AS5A=
X-Received: by 2002:a17:90b:3a50:b0:36b:769c:e5bb with SMTP id
 98e67ed59e1d1-36bbcc145cfmr53578a91.5.1779998413045; 
 Thu, 28 May 2026 13:00:13 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36b9092ff50sm2189180a91.10.2026.05.28.13.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 13:00:12 -0700 (PDT)
Message-ID: <cf5b2f6d-fbb8-4c9e-8ce6-94fecf2b6d9c@linaro.org>
Date: Thu, 28 May 2026 13:00:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] accel/tcg: move jit thread manipulation into
 do_tb_phys_invalidate
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Kyle Evans <kevans@freebsd.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Brian Cain
 <brian.cain@oss.qualcomm.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>
References: <20260526110243.470002-1-alex.bennee@linaro.org>
 <20260526110243.470002-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260526110243.470002-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 5/26/26 04:02, Alex Bennée wrote:
> To invalidate a TB on MacOS we need to enable write access to the JIT
> buffer. We were doing this for tb_phys_invalidate__locked but that is
> not the only path into do_tb_phys_invalidate. Move the manipulation
> into the shared function that does the work.
> 
> As a result we can drop the tb_phys_invalidate__locked function and
> update the calls directly.
> 
> This enables watchpoints to work in MacOS TCG guests.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/work_items/3444
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v2
>    - make everyone call do_tb_phys_invalidate
>    - tweak the if statement so we don't miss unlocking on an early return
> ---
>   accel/tcg/tb-maint.c | 43 +++++++++++++++++++------------------------
>   1 file changed, 19 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

