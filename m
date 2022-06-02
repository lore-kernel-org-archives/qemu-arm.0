Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp4874944lfh;
        Thu, 2 Jun 2022 05:39:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2+7XZVooi16YkWwSz5+p6yJbe+nXaVlKfkwz/rJTRWPoEvz0FYEVKGZvIBePoacT+ID/q
X-Received: by 2002:a05:620a:4545:b0:6a0:74de:c70e with SMTP id u5-20020a05620a454500b006a074dec70emr2836375qkp.73.1654173593117;
        Thu, 02 Jun 2022 05:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654173593; cv=none;
        d=google.com; s=arc-20160816;
        b=HFZtzL+QhcSMnrqCFCtdW37lDjizXTa6/kVL7n/wFZm1POaOh5L1nJ9gRHtJCT2SMW
         re6P1HJ/RUPElHkdBSvgcYapRmAJsrWkpa0Uuby5CpfC+9D0E/gGRxDHgRg2gG+S61wu
         SOXAYseqfWYmEb90q5LxT2MfE1bWq9F2/3SRqP66zTayCyOu6dh5y2Wg6NBTgLYYjgep
         KVvDaKSk5XwtUDPqrm204L8DM1q8D3v+nvpSzwHKdo+/EElDBnl6P1WmAZ4hzzityRcc
         c+8LVF3i9LPglRN6Io57TQl6c29U8jHuymeEdFJlIJ3DHZtnU9Hh7caHQPCKCCBNSGfq
         KwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jhgbA2lMQPGoKsQJcVwIZxhhfgsvDfzzVu7M2rQgD5s=;
        b=UiIxz5pjFn3ux+SmVp65/tN9UB5V3izPTS4risGccOdWqCEVlx76kTtLUXIySKLEtd
         AByFyCVq8+yGEtbeGiY62o8BNutowKuMEbJhEaBGUEpXGrLwPsrpsFCdM4QLY5/dxRcs
         duvszqFSVn0szyYGklyGod8ZSSqFFGEYwLKEE7gy8Z4VDNF4h4rislfgcC5QCDP7Vo1v
         LjcfCpZvdG9FH4ULyRKb1jSilECKX3VksaPNkjr1lUE6s3KTLrO3E+aWoW4/TbA5CEiQ
         oZtgWRTsix2TNdBZpLCKA8uCaRYXQ46FNWP9S8wlsCoUa9IdXaZrUXZEKniHUtm/kHQA
         Yo4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WiZ2kOmL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22-20020a05620a431600b0069fb8b83814si2774221qko.298.2022.06.02.05.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 05:39:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WiZ2kOmL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwk7E-0006kH-Ic
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 08:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nwk6F-0006gv-Ch
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 08:38:51 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:45353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nwk6D-0005MC-DA
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 08:38:50 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-300628e76f3so49607677b3.12
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 05:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jhgbA2lMQPGoKsQJcVwIZxhhfgsvDfzzVu7M2rQgD5s=;
 b=WiZ2kOmLkefcATqnUb5IW0sNgvgIo0EXOUZg5otmGKM4AA4r2IQZqdM97RL/heAJpp
 iudnstKxyfv/DI6xyoxzDVq5VnJGooSKhW83IMTODuF5jmiWlEyX8VDfbsX7EjEea1O8
 vR37PKnGvW6LFUQIpzz2FZK67L1Z8FFnSuIEjXOrgv0kd9GaPTIRPCxBKSTvWtSIe/Op
 aY8v+95zw01wbWbcSmROMouMtDwWjH6U54PCLmuJgXC7nFY1wVLZG3Egp2eUX3MEiU6k
 nmjhNmp/fuy4geTjKB5ZEgTvbR8sLl7kuAgcB971JeDrNiP86LezS9mMvxMs+1JU1oAL
 uSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jhgbA2lMQPGoKsQJcVwIZxhhfgsvDfzzVu7M2rQgD5s=;
 b=1Vwbk8wHUmhK/LZ0xuqdMIUA/h/H8g/sa7lvQmWjeFhU0kAbeA4EdBI2wWcZaGoZkE
 1Or1AdZDkk9qBGRnGCzQ7C5cJAg5todW+XgLT5UVvb+9TNK5dFu1h70pWjtyr8jg0+RY
 4c7Lqv7jCCw7QaI5GkA/CYYTui60gKJeu8WDxpcb7z4l/5W4Npa74dqJpSP/WyF78J0d
 /NkgW4iOk9dQ/BubJT7mjD0CciaBTs/k5b0iIJ1lzxql5yR/6x245fI2VQaZduoaTBin
 r5jzqMrAdht1fFeoZyOhLqWXgxwtvkn14D4jpGSeRPYCfv+hxOy11Vzrt0szJGArYm0H
 MSPw==
X-Gm-Message-State: AOAM531YEV3T2+PhLbFW4zngYhDTOUwL/G5P9jkP7JyEAaVgAs19/9rb
 oz09yYaal9wyGzej+W0w7vYYiFowjwPDr7rsbAnL/A==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr5244192ywb.257.1654173527811; Thu, 02 Jun
 2022 05:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220530093333eucas1p2c05b46a5f9c66704919743236753858f@eucas1p2.samsung.com>
 <e3573c25-1ba6-cb57-f813-99c538a2d254@samsung.com>
 <CAFEAcA8EqCh0LDS=N+5W8fPnF2Fj-Z7r=wssDAD-V5tBWRM85w@mail.gmail.com>
 <5a05e699-d050-adae-ca14-c68b5534f214@samsung.com>
 <CAFEAcA90R49A6txYhP_vFHoa=XPV+g6XxoZdVXmHcS2EPW__Ew@mail.gmail.com>
 <b3d8f8b5-3976-8bb6-41b1-8b557524665a@samsung.com>
 <790734d6-1234-844f-0afa-a3e3b4020dac@samsung.com>
In-Reply-To: <790734d6-1234-844f-0afa-a3e3b4020dac@samsung.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Jun 2022 13:38:37 +0100
Message-ID: <CAFEAcA8V0EeeNL-s95hOdc+hCHVcmhrfJ7ppEW3Jisn6NXSxBg@mail.gmail.com>
Subject: Re: Help: NVIC, level-triggered interrupts and interrupt pending
To: =?UTF-8?Q?Igor_Kotrasi=C5=84ski?= <i.kotrasinsk@samsung.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
X-TUID: UJ/c5e+Ua0u+

On Thu, 2 Jun 2022 at 12:44, Igor Kotrasi=C5=84ski <i.kotrasinsk@samsung.co=
m> wrote:
> I don't have a test image yet, but I'm pretty confident I understand the
> bug now.
>
> As you said, an interrupt becomes pending if the input IRQ line is high
> and the interrupt is not Active. The first condition in R_CVJS doesn't
> mention any transitions, so the "event" mentioned there happens at any
> time the condition is valid. So, no matter what writing to pending-clear
> register does, pending status should still be set afterwards. This would
> also match the explanatory document I found.

Yeah, I came to basically the same conclusion. (On real hardware
it's possible that the 'line high and not active' condition is
only re-checked on the next clock tick so it might go non-pending
for a cycle, but software wouldn't be able to see the difference.)

I want to go through the rest of the NVIC code to make sure we're
also correctly implementing this part of the rule (ie that wherever
active goes low we check if the line is high and set pending: we
do that in the exception-return codepath but might have missed it
in some other places).

thanks
-- PMM
