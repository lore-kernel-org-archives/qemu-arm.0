Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F978C83F34
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Jul 2025 22:25:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uctUn-000391-5g; Fri, 18 Jul 2025 18:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucstw-0007aK-RJ
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:46:10 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucstu-0007QA-N1
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:45:56 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-234fcadde3eso30130125ad.0
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 14:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752875152; x=1753479952; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qFCgTEnGfbkQyGEyygjMD6Tgh0lIzYBSqfo2EolfHrE=;
 b=y+ylFT2IQPpeyMAzRsvVTaNJtvp1E0dSkyNENUH2Vmkph9vgyJCuiF9fKLX0MlewyP
 JLYOLJyRY3/a2UyN4CEuLQaQKRm/pHwD8y8m2x/GYNqnHtfy957TO3CYcSdBClIU+2oi
 i0vvT25XGltJgixr+mF/milo+RM25srJK/bFKj4RsBiMEEiLcZKzqKal4qL6flVFKHFt
 XriHw0fmXPIIou73yg7OllONjumvQ2UKXw2M230k2RtRojIcIJQ+kiayzNlYl06YYNiG
 TG3RXlh6SHVBdrKhF+u7yKA9A+FHfuvXyfjYtA/KyFq+SqZL5vKpmWSaYj4aR4H2dVnK
 ZI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752875152; x=1753479952;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qFCgTEnGfbkQyGEyygjMD6Tgh0lIzYBSqfo2EolfHrE=;
 b=Ael1k0MZ1bsQsiliXpLNea4EZ0nJlydTL+7u87ejkdvIPE2c/MLq7l2mjitd7KMFh3
 oURB+3e4nHUR9/fLCEOdmZ5ZtEuDYdj+QfX8Uz4+5sc8N0mDHxBJ8gfCk8zeq8Uy4dIK
 PgjJB/W9sDo93KlhTbf639AQGobzmFm7AF0kZ4JcsN3lyuW0xnrQTyTA3TuwtjNQgu9g
 6VbTxvmHi3ErvWnzczxaolcQmN19FbUfZo5qQERbnk3d++EdOGK2KmOyWWr6a0jXnDCx
 7In+RF1nj23V3rg/h2rdGwk569Xf/OVpxQOUvW+XZ8ygIgDdexly4WjgrxDchBDjFzIU
 eBAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA0OESzFrp659QScildPjJ2TQY3T0YD8xMVMzvAI0Qde9T66syUAwZS8cvevmVQ0Ka/p3REsoJxw==@nongnu.org
X-Gm-Message-State: AOJu0YznNMTaiKQ3H/aSpJuqXjdWaU+yCwsJF9ebDPhldf6lKYcmsCuR
 sL5V10sVz002QmCMiox4Oibc4ThurGlU6E4TNUYJ9vMeQHfJ3kO0bLiNyg6ilR50g8826dyIpWp
 ixVPK
X-Gm-Gg: ASbGncu86XQAsaqU4aBX2DJxkZkns6eHR0tVON7SYqMVlGrb4BWT68/ru/iZOCLIiIx
 RaDWZiohVfpI+zIYXLL7UyBD8nwhj8d9TBZsFqio4KXZZhUJdvKnEmC/iQdjgm9LPDGyrCPyq4Y
 9vbF6z2JpFtVaZpnxF4Y8xvW5YVDZyu3prDSyv/J9PvdLNm9YNKavo9hhB0Hdb0dhmsNXZCz5gD
 4KdZb7ZqPPajldbcz2CQnPGmX4S/mNehWgUa+YWd39dFjIgGr8txySqUOw0Pko6DfIrEbo7y8Sa
 n9ev5WoTXiPJLjaLO2y9rpPHxwYSzhZjisvBj3g6u0kkOG5jZV2JNR62U/hBzdC+2V9gnpYhtKa
 QSNrnIE1HxrM9ASp/qcLzrh2NnRLpwUj3mcY7izBRBA==
X-Google-Smtp-Source: AGHT+IEcfN9XF5zFoUPVIMTKoXQvKGvYLii74QjF2piLXT4zWBbXAd4vgMHmSrTJWWGEdpoZYGUVng==
X-Received: by 2002:a17:903:2342:b0:235:ea29:28e9 with SMTP id
 d9443c01a7336-23e25764c41mr213318765ad.38.1752875152430; 
 Fri, 18 Jul 2025 14:45:52 -0700 (PDT)
Received: from [192.168.101.134] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b48f2sm17959695ad.90.2025.07.18.14.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 14:45:51 -0700 (PDT)
Message-ID: <b19bc469-484c-4dba-bafe-62f8ddccdb15@linaro.org>
Date: Fri, 18 Jul 2025 14:45:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 09/10] target/arm: Honour FPCR.AH=1 default NaN
 value in FMAXNMQV, FMINNMQV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250718173032.2498900-1-peter.maydell@linaro.org>
 <20250718173032.2498900-10-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250718173032.2498900-10-peter.maydell@linaro.org>
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

On 7/18/25 10:30, Peter Maydell wrote:
> The FMAXNMQV and FMINNMQV insns use the default NaN as their identity
> value for inactive source vector elements. We open-coded this in
> sve_helper.c, hoping to avoid a function call. However, this fails
> to account for FPCR.AH=1 changing the default NaN value to set the
> sign bit. Use a call to floatN_default_nan() to obtain this value.
> 
> Fixes: 1de7ecfc12d05 ("target/arm: Implement FADDQV, F{MIN, MAX}{NM}QV for SVE2p1")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/sve_helper.c | 29 +++++++++++++++++------------
>   1 file changed, 17 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

