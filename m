Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp477523ocb;
        Thu, 6 Oct 2022 06:28:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6DJIZ6xk8XnQEVKRivfoT5aDX3N60sDlOLPqyD1g+fmyGk534nyILDwijP78LLgHGRc5vY
X-Received: by 2002:a05:620a:319c:b0:6ce:ec44:3c6b with SMTP id bi28-20020a05620a319c00b006ceec443c6bmr3255810qkb.179.1665062935178;
        Thu, 06 Oct 2022 06:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665062935; cv=none;
        d=google.com; s=arc-20160816;
        b=IJ7aZ0RB984OMXw+6LIcVI6u8TOnS39iY4KAldS/f9iGzkW05tJhvfZpf8yG3hlKBZ
         ECSeC+9U0mL13YhVDJxI/qjSuS27em8NV07j8C2l3MW7eJrpk2Ad6ucLMr+UCxhZR7XB
         qrdTKenZZEDUK1of8JeXY3lprc7d5wphWnVQdbtWuyDHQqW7MNT62N0c2j0+vBQIxQU+
         D1H0kgzeJ9B89jbYFHn1Ps0b/bHkUPFdflFscaqqRrInPiXMbBFZfYUnmW39lEico/eR
         Vn76RwTT2Wf+gMB65p7f8VvMgZL23Wy9ojHbfPpAvJO19cHxQULGmPS7guOxhCwVmpEY
         YT2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eTB+vUn+2e6AI6dzJ525GBpI7RaDj6C8DPcqMmmXbDU=;
        b=nH7JzLkxhyK4cCEGrdSW694y7hyeHbnSKVChbLEysIow2e5RjPsa63m8udPlalkG6a
         FJgxtQ6D+jpAirzKetrtVsbeDc4F3DUCrdT+8bDgAktk2214yM53sDRUflVLFloXyXwx
         /Adhk+T7qgsgQzjydL5te2EIJC+XvjOpGtuq7kceFbvo6EpyprDjaGsN8pwAtYUuCYzY
         z7OSn156FT3js/drC0x/zy6taEAsUDVtuM/Tan1X/It98Xn7iYIdJV++RfLw41Peb4y6
         MsSrFQ5wUICctI7k5Nkf6nv0gqTRBxSSXXt4Y9oel8osAB7qubpexHKCa4WE9exNC/hv
         v+FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wvqYy/RZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de10-20020a05620a370a00b006b5ab8c5a5csi3666032qkb.634.2022.10.06.06.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 06:28:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wvqYy/RZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogQvm-00032y-Pz
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 09:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQm6-0001Cv-B3
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 09:18:54 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:35408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQm4-00025Y-NS
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 09:18:53 -0400
Received: by mail-pl1-x633.google.com with SMTP id h10so1709110plb.2
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 06:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eTB+vUn+2e6AI6dzJ525GBpI7RaDj6C8DPcqMmmXbDU=;
 b=wvqYy/RZX1KuglQP5iPpZhLMW3sulwlGfOr3F3otJrDdgxkH9FiQA+/oiDZzyP65JI
 EU+SoTDE3L54r82mZmxLFt4zeEjdMALm3ZZDOF2+wtzq0B1o7/r6lcdpBUK4hc6uT/a1
 EMmRXkE75g7zOoMNc9lZYYtufPG/mLELj0SeYie1eB8KBzseEtIXDQxygwQDLna7erw0
 HBBNmpjdBwu1PNE7p40nAEH/16VtuUGM9Lx0fAKFpxWddJLCHF243i9HR2iGtaR0baXQ
 +mbVFfdsFJuVYlZ2UOvEQ7OFZhpAQtF/Q930zjLqJJpJv+BO7cHQxYEMqLUwdM8xY0Ig
 KbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eTB+vUn+2e6AI6dzJ525GBpI7RaDj6C8DPcqMmmXbDU=;
 b=5vRIo/u8t5tdFO0dte6TyRrtFYCydxt07x/dpmDNLs0o6ZGNhxzZHd4QAB4YRgdMyV
 1Q1rixWgbuZQOoAm5gaG9d0Pd6fllfOi7wpTsdy6zGtUhRekA3/Wd4ZDyMCr3MJloW0x
 euvi3uUXTv7XUNKY66ymOclPeXZNgD4UEVM+LLhJue0+4y6/5jgkR2lRrtTXu7XX+yBx
 o1Zx1ugmaFs2dZeRq4k3UVZbX8ipEB24AnchxUxoUL9gqUAp0duUsyiClsgjJOuXWRM5
 2hTJFKF46Aj6GEv0k1q8B6960mp9qsKD0Ices0edp0vLhR9IFwg9h6cZLU4cCSV97hMl
 vRnw==
X-Gm-Message-State: ACrzQf0Te5tFl6U2gUHGGY72etJVisJkA3TKobGaolztmt/1tPrQPfEV
 OFy3iJ1dOHlyTySk5PY7BlKEdxLbX7/BUZa5+/JqiQ==
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr4712608pll.19.1665062331380; Thu, 06
 Oct 2022 06:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221003173810.1933849-1-venture@google.com>
In-Reply-To: <20221003173810.1933849-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 14:18:38 +0100
Message-ID: <CAFEAcA9x7oC9sQy8XNJ8-WRc3X=qBVL1nMLB==dGM=+O5Z-CAQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net: npcm7xx_emc: set MAC in register space
To: Patrick Venture <venture@google.com>
Cc: hskinnemoen@google.com, kfting@nuvoton.com, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, jasowang@redhat.com, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bECkcsTV/A7B

On Mon, 3 Oct 2022 at 18:38, Patrick Venture <venture@google.com> wrote:
>
> The MAC address set from Qemu wasn't being saved into the register space.
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
> v2: only set the registers from qemu on reset
>     once registers set, only read and write to them



Applied to target-arm.next, thanks.

-- PMM
