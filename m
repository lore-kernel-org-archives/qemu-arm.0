Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp179140njb;
        Thu, 5 Dec 2024 06:53:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUWePeP46fBUpVYeoM47erNrX8HAwE3n8ITjtruVwm4Y5dlpQaOdV7Fp80+USMqiiILx6tcJHr1hhMn7A==@linaro.org
X-Google-Smtp-Source: AGHT+IGk75hE3Lf8cZdo2xcJkr7KiIrbE6S3foIcu+uc7hOT3OirUxpJ6qn13IQI/j/DcyIcKfsS
X-Received: by 2002:a05:620a:4721:b0:7af:cdf9:88df with SMTP id af79cd13be357-7b6a61eeb12mr960317085a.49.1733410424533;
        Thu, 05 Dec 2024 06:53:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733410424; cv=none;
        d=google.com; s=arc-20240605;
        b=Hw+v73mCWfVoaonkNpQk923P9t5YMWYvqeuATfwdnOu0Fns9Qg+Ktp/XNBg+eiMvGK
         P4QzEEIOxFfQa7poeLU0lo/6BcY5h1moeLPgVBmVinVK9xnxeklP0NyFaW3eoSS0AYfx
         OL4zACf9zMBIMjiNAz1R5Qcgrd+B/jn3N8yNjiGqNXctyOuu1TxjxIHxZKJZCymChmKe
         48hAv5pzwkPn+4CPKtikOxfYa9t5TwHi/kZgE0ynrb5S7m1sSmlJW6Pc8DH3qof97LQC
         U4eMzpFVAT/TN/uTZZHBN09u4NBBR26957Z/8NhirXCPQuVuCxxjIINmRe9Or2A2WV5G
         pSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=DgbjCCB16SErebcpkCcosJNhLesM5Vw3w3bIxhw/pzQ=;
        fh=/x/10RE2sEL1Vneakh/uo6S8HD4J/J173sPvuFrXUrI=;
        b=RT4+NmytnqDBD2yqaJKv2ibHQrG6vQTPL8uTf0nm+GWKcV1jo8NGp8vdhdOEnAFwCV
         SOAWDnh/FInLULaeLq6klyzl/yoNsUBvxbD8VvoO0+4XA5lP6pRHc43x4bCMeA01RkNn
         e6o3yvGSuo7M6ZtYZ5cHLuyu5osXRN4pmick2pLwkx2/zBujFSSzUf0aJRgSey9bmqny
         TJUPDU8gvw5sdwAwykXJw51KVIij5QE1d9ttcE9DleZIeWxFs7uo3UUrSIYxOTNfXKI+
         /umluLvCLRCFtmlhlt+91L82e40d/VwtUw+hmiAfhPCU2TnL2imjx1k13Mty3/p/Q/0U
         w/dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kn7hAABt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5abd4b5si173714485a.536.2024.12.05.06.53.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 06:53:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kn7hAABt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJDEK-0001RE-N1; Thu, 05 Dec 2024 09:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJDEI-0001QO-Uf
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 09:53:23 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJDEG-0007TP-FD
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 09:53:22 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d12709e1c1so1177744a12.3
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 06:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733410398; x=1734015198; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgbjCCB16SErebcpkCcosJNhLesM5Vw3w3bIxhw/pzQ=;
 b=kn7hAABt2bIW6UpOdYlFJ7Qy1j2OhXlLnITc9DJ5/zEU1I3v58KdgoM7SQM8uJxrRP
 H6PSGdd+kMS3l2WF6JgfgodjWKIo7DIW7TOjjjl7oGxuzBZcVd0RB0yxGXcsgu97mWCC
 Hhx8wBFgovIX3fxoUSDuibFX2DrYVquiAcVTEQuMQ7JKky3NY2W/Ghjsh8zi7vzJgL9a
 e6VByeUZwhuqdRcRGNV8L9pE8hct1WtKBOefTIdxbwWGWnQnMgIRoxM1LR4F6UdUVWOk
 2e1n40T4PifEAVs/rRslAUakqWJxb2MB7YPfyEI/hQcDgxhx79tMzlVuCj767Zb7gnpI
 fPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733410398; x=1734015198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DgbjCCB16SErebcpkCcosJNhLesM5Vw3w3bIxhw/pzQ=;
 b=U9H6SqELdFPjkJiKGW4xve8n5Vwb0BrbIbVulqIjcuBw4CokDEBGSCZOxan01TUIVx
 CqiFOj+H+V2A4JLTyxS+UIHclEY1uUwUdSijnzIdOR8cwmcgWLeWWlnPmZuFM6upjsyu
 yqXV6LpJxbS2jQHaVC5uzsLdy+AUWApR9UdrFictFxX51W0GPaM4vjltmFur7LzBy170
 6Nq6zyC6AGFfNYuZQyKKNUDMjFhBY+PF/3Bo55oMnNgLcO9x1ofFCNL8Xkh6uAqDCsmA
 ygF96cWWmrna/QrE54DDEzsqGKrx6u/uW07iDHFUWsx9kTfQ5f2KoYVOBmy2yUu5MHN7
 3qtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA9PHcu42pwhd38kES7s/xZF3SCfsBAY+O5fMSyaUcbczHl96e75tf6RXeD+3dWvS8jrFRsd5TSw==@nongnu.org
X-Gm-Message-State: AOJu0YzOn9ciACw0rnbIHXip2d+wVJedmEApgWY47/wYmn4+33yplaQH
 7ScnaHzp/Vwb/tTRbRHhz1vekF4oQpgE9mLJhlhb6tNmgdrOQygbYG5PawZEUE7QZ92lmX4aRTG
 zzSXl2QAi7FGnQVJ37ba1yfGfTgZS+vEEIuVbyA==
X-Gm-Gg: ASbGncvY2KgJUDQAAxoJF0yNpYCBckiDuuQH9HmrcD4TWzLHuAxpA3nH0ZdJW1C8p8W
 EQZGHLS0MHWmrb/6UtAYK2wmooiRvqKSF
X-Received: by 2002:a05:6402:5206:b0:5d1:3da:e6c with SMTP id
 4fb4d7f45d1cf-5d10cb556b8mr12211020a12.10.1733410398025; Thu, 05 Dec 2024
 06:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20241126084928.252067-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA_SkZ+ew8AAVpBHuw-9YW4S5wFbB0Vqx+dBzXf97JGDGw@mail.gmail.com>
 <cd635753-4e2c-42d6-bb7b-d558d90f59d7@linaro.org>
 <2106db77-88fb-4113-ae09-9bf77bce6ad7@quicinc.com>
 <c4245af0-3dd4-4cf6-a786-c15fa079ad05@linaro.org>
 <18ba737f-d669-4e6a-8319-fb5052223b26@linaro.org>
In-Reply-To: <18ba737f-d669-4e6a-8319-fb5052223b26@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 14:53:07 +0000
Message-ID: <CAFEAcA-P5P4AJidWcGgUScBTe9-K_C4Qm9N2o2XWnfiT81LU=A@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: bump default memory size to 2GB
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, leif.lindholm@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: +bgvw03Ym7Qm

On Thu, 5 Dec 2024 at 10:14, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> W dniu 4.12.2024 o 21:50, Philippe Mathieu-Daud=C3=A9 pisze:
> > On 4/12/24 13:17, Leif Lindholm wrote:
> >> On 2024-12-02 10:53, Marcin Juszkiewicz wrote:
> >>> W dniu 26.11.2024 o 14:14, Peter Maydell pisze:
> >>>> On Tue, 26 Nov 2024 at 08:49, Marcin Juszkiewicz
> >>>> <marcin.juszkiewicz@linaro.org> wrote:
> >>>>>
> >>>>> We are working on adding RME support to SBSA Reference Platform.
> >>>>> When RME is enabled then RMM (Realm Managment Monitor) takes 1072MB=
 of
> >>>>> memory for own use. Which ends with firmware panic on 1GB machine.
> >>>>
> >>>> Reasonable change, but isn't it also a bug in the RMM that it
> >>>> grabs 1GB of RAM regardless of how much RAM the machine
> >>>> actually has?
> >>>
> >>> I think that the goal is "get it working" first and then optimize.
> >>
> >> I agree on a different platform this could feel quite hacky, but in
> >> reality even 2GB falls within "ridiculously low for an SBSA platform".
> >>
> >> If we're worried about overhead for CI jobs that do not require the
> >> feature, we could always conditionalize it on RME being enabled. But
> >> I'd be happy to wait and see.
> >
> > I'd rather do that, since it is as simple as:
>
> This is sbsa-ref not sbc-ref. Let it just have that 2GB of ram. None of
> existing SBSA systems comes with such low amount.

Yes, I think I agree here. Changing the default RAM size
based on whether the CPU does or does not have a particular
feature is unusual and not something we do on other board
types, and it definitely doesn't match the general intention
that sbsa-ref is a "looks like real hardware" machine.

The problem with using 2GB, though, is that it doesn't
work on 32-bit hosts, which have a max of 2047MB (and
if you try larger then hw/core/machine.c will error out with
"at most 2047 MB RAM can be simulated").

As a result we have several board types which have an ifdef
to say "limit the RAM size to 1GB if HOST_LONG_BITS is 32".

(I think this limit primarily derives from ramptr_t
being defined as a uintptr_t, but also trying to malloc
2GB on a 32-bit host is unlikely to work very well.)

thanks
-- PMM
