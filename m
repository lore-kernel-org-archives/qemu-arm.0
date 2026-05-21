Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E5CCD5BAF
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 17:51:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ7Y2-0005n0-D2; Thu, 21 May 2026 13:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ7Xz-0005lt-8C
 for qemu-arm@nongnu.org; Thu, 21 May 2026 13:51:03 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ7Xx-0002zG-4y
 for qemu-arm@nongnu.org; Thu, 21 May 2026 13:51:03 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48e82c23840so52354155e9.3
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779385859; x=1779990659; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E93CL4DH4ar5MccsqxIg0d37nJPxBRV8JYrPMpHpOSY=;
 b=D3M76bwp/mHbSSMp1xu3TRN+PeNHuf5FwcFIEzFpZf410dayHRieqh8pcl9jDHRTx7
 3HTa15d4QulKbrXYiVQBsj9KqO02XgitjLWSJACI1C2ORfgSFqkXTOSwHs6auS1raPcY
 lxFz1UQ88EJamvxYAfz17/artAstBWPMC5e4lnvikKIulu1m21YvmQzGV6lCr0tAAfnM
 IjleZP+3tTC3RqeWr1Cj/B4TNpQgQEPnuLvgcQ+VU+ahJLiryGzpaYnyj0DoTG9u2vZg
 VQXsqxuoaWlK06gPefAN6A6mK1NjZsh04scjpk3Ce/9bXWe5eL0qHYw/k8FPjoeImzTG
 MuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779385859; x=1779990659;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E93CL4DH4ar5MccsqxIg0d37nJPxBRV8JYrPMpHpOSY=;
 b=c68676MXwjk0C0O/QHFr69uEuUdZcQkNi5L8ZCA+qp3xPwR+Nbu0ssmMGzmzovIBq3
 xzD99vcedXNSEl32fSIf+dYQ/haYGgw66Ww60aQN/zawiklEwMs3fj1LHZEzVxXIhICC
 CTgJhzNdLXbJBKcSMlU9S3aGNbhVifP4ydQ678v9O/Al3XACbGSbeM6VmdHsgO0xkk6Z
 EFqXpoaLULBkhvXIktfUZxSlUmhpa1vEWyFyOxyxSt1KewHLLuylZxKHrr8rAS3hSaxT
 sA9ln0XTUuOqzNhskXpi/Rmf2EUUt2QXrTRfSSP6me8trXja1Jialx4RDOFFcTrlqfOp
 DgXg==
X-Gm-Message-State: AOJu0YxaLEptkFSURn5pin8IkMjm7ytnHH+YYH1dhqnQs/4dLNKswyRK
 TZEvtG4GSQ6QWCUCAQknOnrF4CwgqFck3dz8toKMN4UiWKH6uJFsGrAMMHzPxO0lCKQ=
X-Gm-Gg: Acq92OFQql7mCFa5ymvZ+Wo7kvBcB3RnW1Qoj7C10+2vJTEdExGdAJXpr4enyYjCNGG
 ZIex2hJee7Zng+sY9/KGqOfaIL+Ht/b6j9n0GHLbVmr2g+Wwa/fh/c4NJR5EHfPUzGbZNENpcuC
 RJbifn7GH3XH6xYEZuW7zTU+oHb3DjP2hCKJ0j6QiNTm7t89M8QlpeEz6C8QZSc+qC6AoFKKoro
 n6BnhOR4OP71g4oCOGrguDiYSl9la8Ed1H0M1VjmDvyKjX8Nle2KJrA+faY4zWB0a9Dbgri7zER
 DWcMVio//2qxGYLb9I2SKTW8bzXtEZ3liLJA3qp8KTIckNHNz0tYmgpTFeX20Qhr0jck7w2QdM3
 F2NbW62QbWqAjSfenJ4ZE9OXbko2AxY1+BbMamBaHVuxdveyA2oQgmRwZERLdrJyMcJxtynSHmf
 4HpLEqiEhXPwcloGt3Rr3/Yd4=
X-Received: by 2002:a05:600c:c086:b0:48f:dfe3:dae4 with SMTP id
 5b1f17b1804b1-4903606b808mr45607375e9.13.1779385859288; 
 Thu, 21 May 2026 10:50:59 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903caede9fsm43911755e9.14.2026.05.21.10.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 10:50:58 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9578A5F886;
 Thu, 21 May 2026 18:50:57 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-stable@nongnu.org
Subject: Re: [PATCH 2/3] target/arm: Use FPST_A64_F16 for SVE FCVTLT_hs
In-Reply-To: <CAFEAcA9JuUY-en-_ZOnO3bjtgqG-MHp2ESGskdm-D0+fqFng_Q@mail.gmail.com>
 (Peter Maydell's message of "Thu, 21 May 2026 16:21:19 +0100")
References: <20260521122913.1565011-1-peter.maydell@linaro.org>
 <20260521122913.1565011-3-peter.maydell@linaro.org>
 <87mrxsolqb.fsf@draig.linaro.org>
 <CAFEAcA9JuUY-en-_ZOnO3bjtgqG-MHp2ESGskdm-D0+fqFng_Q@mail.gmail.com>
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Thu, 21 May 2026 18:50:57 +0100
Message-ID: <87se7kmz26.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 21 May 2026 at 15:55, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > The SVE FCVTLT_hs operation produces a halfprec result, so we should
>> > use the FPST_A64_F16 fpstatus for it.
>>
>> Maybe I'm reading the Arm ARM wrong (I can't find FCVTLT_hs but I can
>> see FCVTLT in the SVE encodings). But these are all widening operations
>> so I can see halfprec to single, not the other way around.
>
> Yes, I got the commit message wrong here; this is half to single,
> and we need to use the A64_F16 fpstatus for conversions from
> halfprec, not conversions to it. The e07b48995aaa commit message
> does a better job of explaining this than I did this time around.
>
> The _hs is how the QEMU decode file splits the half to single
> and the single to double encodings, which are the same insn
> mnememonic in the architecture.
>
> Improved commit message:
>
> =3D=3D=3Dbegin=3D=3D=3D
> We should be using the F16-specific float_status for conversions from
> half-precision, because halfprec inputs never set Input Denormal.
> If we use the FPST_A64 fpstatus then we will incorrectly set
> FPCR.IDC for input-denormals when FPCR.AH=3D1.
>
> In commit e07b48995aaa we updated most of the halfprec-to-other
> conversion insns to use FPST_A64_F16 as part of implementing FEAT_AHP.
> However we missed the SVE FCVTLT instruction, which has a
> halfprec-to-single encoding.
>
> Correct the FPST we use for the hs variant of FCVTLT.
>
> [cc, fixes, &c]
> =3D=3D=3Dendit=3D=3D=3D
>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

