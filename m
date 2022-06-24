Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp399542lft;
        Fri, 24 Jun 2022 08:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vKsIpfmcRv5lanI2VmzT/Ep5FaMrKv2M2FjgO3AAatDE75sUx3A0hot/sS4vw2k7SsAAv9
X-Received: by 2002:ac8:590e:0:b0:317:cc20:8880 with SMTP id 14-20020ac8590e000000b00317cc208880mr1842317qty.513.1656083870249;
        Fri, 24 Jun 2022 08:17:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656083870; cv=none;
        d=google.com; s=arc-20160816;
        b=JPORM4fckixNh+Uj/9iF+FtqmNpFHjRrz3OaugFTxFis59WV+kH42M2BpApcKDEy5Y
         iLW7f5MsksIJbc1lphl97oZJjLAoFgz9i8W1MqW6qQMtstokBcwPkWGUPIEDBdtoqRf4
         f+LmQswxxo8YDXA0EYejLDe0wfTkJkYatmItrYMwvFQL+ORX4FrVy88REPRhWyn5E7j1
         P5B42/DsuzubNwQVKyv0xFAqZEpBPh2cQckx7JUvWp8KFjuJAp994NxrxIoa3w4z+pqD
         ACEA+9jAewYDUtUFWvMmkp14z5amCrggZEvKAzT7VjBAtBzKrpJB1+fpwB2f/XEW/3qs
         6HYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZMUVfEdmj1R1Fl3ruViv9Azz9yo2bP4QqUaYYPj7nCI=;
        b=J81EyNQ7AluPylOFsnudJlSF1WJDKPHSFKAmxeGzLd9izfOFNImi35uf+0CF8degsg
         MdFIZ1GFRe6tc8ksiPDY+hk5zeQqglpj+PQCrw5x1KwRd4WxV4Ek/ZIPdga4jxE4NseB
         umdSLQO4J+41HfMX8gHNGkUmoPtyVTZMfkfkrYarmK8PTaj2f7dOtsPrDNKgGlkGq0mc
         xQKa98HG2pzRFUVZf4FgB2r3FT8d5apYTgK4ZFHqv/ORM5VQFUt53o69tnMMT9XyLomt
         h3uOu42eLca5UeN+jNBGmN5DUXXuZg9kiEY3G0Q/CSyRhIyOKWEYz5AYIu41JBsudzXF
         O3Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U+WOGkfk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a05620a0bcd00b006a7832a5de6si1654090qki.36.2022.06.24.08.17.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 08:17:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U+WOGkfk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4l49-00077Z-O5
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 11:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kyV-00085U-S9
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 11:11:59 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:39484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kyU-0003rj-EC
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 11:11:59 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-3178acf2a92so27749807b3.6
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 08:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZMUVfEdmj1R1Fl3ruViv9Azz9yo2bP4QqUaYYPj7nCI=;
 b=U+WOGkfk6yMFVcyaqguu+E75RMLRn5ncnIVcVpgGs8UeH4Bs/xgdRI6wbrTSzFbPx7
 ODuY2viHOgggP6l68WpsxGd1R1Jd6E359yxmEj+T9L4PFzYwcClX52AGaUmMPOHF+pAk
 6v6nC2kNzp88lD4YXMvniEEhbsw4HiD6qvUHKRJuH5BNRyOxRJdnLxMUYhTOA0j6fBtN
 Sa4t7gmQsWR6EjbUzIrh1G2M7nrLqbJCGfEsuQde1Af6bTfFuY0w2NOk0O7lcaaDy4FU
 o+Pq6rcOyMGa8Er7kgRZpJXmnOiz6sPiCrNytvItN4vKNY/LggTbwy5elg5Q6Pm9bkLH
 ijbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZMUVfEdmj1R1Fl3ruViv9Azz9yo2bP4QqUaYYPj7nCI=;
 b=Hr5wNK9/5uSOh4yljXokH0WwEMQZRz76J7QyU+2bL9na2oTncQ5SoI91+E2b+3bEW9
 bLV2q1ZkIra6kyMR2WhJgJ+SRPDC7DQaTOwsLf/tvN5jmZjiPH/TsW4ieKUV5fimTysb
 jIqO/igkxJ/g5+KoRPewrUJUcKIbEK1F7i+hKv07xOtJWTS4qEcpU0xLkRN1Yr/KdoBb
 Vp7YK+LnV05BgD5V01ya9RXuGi8oITS7OzBspr5Z9Uv9FHEbPl0unO8eau9fBa1C2q0V
 0GqXYpi5gCzbQ+D1DF24pdxCvwNQJptA1psTwTVSYyliO/hPy2o9/Ch+gRTCmHJOgi/6
 iAjA==
X-Gm-Message-State: AJIora95tL6u3+a9UMDhBKbMk/cy8sI4qIdho+Sno/hfIWguq9k8gjPZ
 ihSqBFc6JaUe8xakI3uIkT/jHIrRGcjX7zPS0gR0qg==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr17396384ywb.257.1656083517330; Fri, 24
 Jun 2022 08:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-49-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-49-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:11:20 +0100
Message-ID: <CAFEAcA8CVD1ep23f_Cfnb=FvHER8B6mPH9dRYu339Q9e=GC_4g@mail.gmail.com>
Subject: Re: [PATCH v2 48/54] lasips2: add QEMU interface comment
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kbbeVDLQ2Imu

On Fri, 24 Jun 2022 at 14:44, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This describes the LASI PS2 device interface implemented within QEMU.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
