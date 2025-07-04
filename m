Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1265075dyc;
        Fri, 4 Jul 2025 07:48:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXo+e7FgR1v9xd664NCsO/6jUjOP4gnDgh4dsqXYB5w4YDGrT08lUVnDWFvVLk9XhG+4p3Ci13LJ6kBSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHchf8L3ZHsjUvwX4QKuDP49Qe9TH2akVYUD5JzDGgYWKZX7JoLojcUSqeiVRi5vqwquaE0
X-Received: by 2002:a05:620a:4688:b0:7d3:8f51:a5a5 with SMTP id af79cd13be357-7d5ddbe9142mr352086885a.51.1751640497916;
        Fri, 04 Jul 2025 07:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640497; cv=none;
        d=google.com; s=arc-20240605;
        b=CGDWVmAlfV8CLJo42jPMgL2qubgUVpeVEytTlrLgzCZdFCMVw+K1/ivuw2mH8YCDQR
         zKKpjVd97WUJfaeMgCnNvThV6yERMS4F443rbIXbxbDsjHGbmIRgYUs0ce+TxqOZ40eH
         532sfm9LgP6WfUVZ91gWCeKM8KW+RnMxC4UIZ//9hcFEr3/pLhKzZAWh8+AvFdg4W1yJ
         MsixLR4ytVYQ0WXLQ8J9rA9LysRqIWc/cEMuIB31zgc3BrDTV9V3osOSdgin/VxIxJPz
         E2w7xs1KGx2Zn0Aocgg5Yw4TZpUC3oJr91bSe1EM2Y04JOVnNCJk9OR2cBYi4p5yWP7c
         5DEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YYYLt+ac5CIf9dBt7IH0LmdYNv3xWnYYDj4nIFCxzhI=;
        fh=5/qeRCTcDiFDQIGtkbbDL65gkBCOqryA6VNw3ubf9v8=;
        b=aGBGh9b0l18unZg5tzgwPQCUx9mVPWBzDIcCGLkkrUIPVu/g/yHO7llXGdjUHokqxZ
         7wyyhn2RlQ9YiwIO0QCWYouFrAeB+xSPZqq0BGAM70hFMIFGeV6g9bPHggD+VGY0ySG1
         TlsfD0ggCmZ1OaA1DB5osYwWZoIglb+Pz4AJhKREF3Wdr1pdKty6uvfMMZq8Om7Ktvya
         tmE7FKBI+aIReOiqgCS+4ewD6UQjz1WNfX9QXJYUKszYdcptdwWrJgdA0fFVNgajfhrS
         8dN5DKeZdagW8/njqFHPBZm5ECX2kbgahggvBeapYzTXJbxkgPsHvQxuKgAtl9Fdb0QA
         byTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PwSLNIo6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702c4cd3ea4si20895246d6.104.2025.07.04.07.48.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PwSLNIo6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhaZ-00082L-Ki; Fri, 04 Jul 2025 10:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhUN-0003Uq-9N
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:34:07 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhUL-0000Je-RA
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:34:06 -0400
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e81f311a86fso830144276.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639642; x=1752244442; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YYYLt+ac5CIf9dBt7IH0LmdYNv3xWnYYDj4nIFCxzhI=;
 b=PwSLNIo6cXzC3Yk69f4Lj4+CV3qKiuqQZM/E9zh1up8awznUMTWTdhr5Ev+zmQHrC2
 raQwBIniDtaj2YwFnpEcFRCMzsgHhpT4qSU68FU0CKER4N0tDGnnQmKD1JGTjutJKVUf
 ZYyJgi+qc3MAEYdq15juxzKn5K7SqfKCxUwDV25AilVciOUU/T50J5Xt8rPLl7euUROo
 k3HOcfn2Q55YgfIQyhC7LOr23/g5LgNccaFIZhIGUhXogqgH2CzIKPxtzPhaQiH60fsr
 XYUS/MvUPOUXDFkI06jCZ7EFZZ3KhASwwIxd8sPYET5lwzKV7XcscmPcC2rWPpfjwxvO
 Mq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639642; x=1752244442;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YYYLt+ac5CIf9dBt7IH0LmdYNv3xWnYYDj4nIFCxzhI=;
 b=j+955TbpnalYNk/wSeaO2K9D0rt/Rg7ZOyVFfwn8DM5wd22AEGQqiW20acAtikpW2g
 8OME9GKwCZVHpeUCQhulwcpVwWdBh0go3RIza27S5UNZ7k3PgPpJvBgUPXhWBvnZtqIi
 u0PsO96dPewGJ6Q2OgNSkqU796ct9ElZLASXU6veNibKIpOqMPTOo5UDVxfvugp3g2aD
 +Id2T5toAfUayR4rYLm9b1PrCHlCxhgRI/Brcqsc7hjxct+HHFqyvR92jKJaXf4ikmKv
 JSSlOB1flImubWfPvuLY5/GBdPKX8M2HCLmmAR8SA9XiZ1pjCVLk+PSxua2C4Hv3OAjY
 NifA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRWXFPe3Q9vf4boHpiAylGEFb8NwECOPFdcJvYIqFBYLMDsJfcXiOV/USxQbzC3fuHm5mSJ5xl9A==@nongnu.org
X-Gm-Message-State: AOJu0Yyf/HANSjVBKDGoba3+V3Wm/sr4dovSz+hL1kEHTt/8prd98BRI
 eqwKJsDV8xr/JTxTLwrBdg13oH8iClJWDNBbXZ4+bJ93zMxueV4Zit8lD9D9GEThwKSEdXGcf/1
 wEdlnP3BleshH7nqts4ZpXgx4AEk7oyGV8JG+ZEwJuw==
X-Gm-Gg: ASbGnctkIDDGzQg47rx96exqARCMFA3t/51EgaYojfhUmVDWTAutq+DaI8w5lgFwk8R
 OSxx/lZRxsfUuA8AulDOcLSKgqA6vVbM1p8PaJj3CpZQFSkPykMrF9QaYWbBoxMqFlPuwpgg03R
 JM54cfjb9Uaamg3ji/DzjU/07yBGrFmx/gem4vwjEkMkj5
X-Received: by 2002:a05:690c:7201:b0:70e:404:85e5 with SMTP id
 00721157ae682-71668bf9aa1mr41866647b3.11.1751639642495; Fri, 04 Jul 2025
 07:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
 <20250704142112.1018902-75-richard.henderson@linaro.org>
In-Reply-To: <20250704142112.1018902-75-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 15:33:50 +0100
X-Gm-Features: Ac12FXyfduQyR44u3uijABXG1p87m_gk94VYea0mjgJGYU52LqJftifHNcBKPoQ
Message-ID: <CAFEAcA9q7yi1UZ_89GEtifVgk=TTB1hC=zgrnOKA-d=ZdwE-iA@mail.gmail.com>
Subject: Re: [PATCH v4 074/108] target/arm: Split out do_whileg from
 helper_sve_whileg
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
X-TUID: m0TXG40VIXM5

On Fri, 4 Jul 2025 at 15:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/sve_helper.c | 39 +++++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 19 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
