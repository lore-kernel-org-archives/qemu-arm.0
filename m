Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B355CF3C99E
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 15:49:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuuei-0002nO-P4; Tue, 24 Feb 2026 10:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vuuee-0002ms-Sw
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 10:48:56 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vuuec-00077f-8U
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 10:48:56 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-65f771c6b89so276404a12.3
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771948132; x=1772552932; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uML87t6VTnfe6OqPR7lcOZF7XhWhMoV3DRRxCoR7948=;
 b=M8knFMlOtiTsXKzLYbyrl1jZSCVZ7i1lVS/wotiXzBeCd7plUziIj6fuolqCeQoqfG
 kAdO80zsUrYPtFsjd4jIsOAHZFgjinCrMEIiK0CQHqW/tCSt4KOrRbazeR2RSUM7b90B
 rLwtNvuaa79r+tkIBhfFFEo16TNp7KA3lSi3RZHS1szJC4zp7n84XyyiM2r2ADGbDzct
 NTBZeYSHlXvBnaxw/085gQ6SgQfEfRKfZtpfQOT84yLTKldFfXLOZ0/20ICabE5961UZ
 0tiBkKxrmFOOHlK6QT1nTq1Oif3aAstsF7sYxMNooslARtD9IdzCTwqRnQjxrMWPVu2s
 BxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771948132; x=1772552932;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uML87t6VTnfe6OqPR7lcOZF7XhWhMoV3DRRxCoR7948=;
 b=RRB6DqmxskVns19Mf2H5XUelH7Ipy/o73n+jPADBqG1otZFJwa/CLSBanU+40f0Ekv
 kaIHrD5erbAX9uKqqPuyZnYbkHQM+qHZzqRCSrcxCjtZBUS1W4Qctg42TwNSo6vFD4jX
 rjJOv2yiLMgm5wy0n7HhgfaKurO7PYIOFDvH9qUVGrpVKt5gQc9gpmf7EU2AmWwAQc1E
 lUOQU2eawnzieXFf+4or3EmDn1MqykyzykTB4eYulr57drwnlg2WuHBTnpyNWoAUTcqT
 NHtWmdhgpILhXCRt1vSX8DFsaDt8BBA+PeKEC101o9xCQNA0cg9aKfJNIbiT5IpeaIJN
 dqdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm0OaMqyKceXmGGuDujby7+NLy0loFwWo9eHTTqjYxajqDtjFBSTCPHUbk5Yq3Rhj58Y2EmAbn6Q==@nongnu.org
X-Gm-Message-State: AOJu0YzDTa1gC81kriRCwNzc9RZmCTyv5hCgtLNpmmkYjxq73COPN60G
 dA5rRLQdlOHlXELPYNj3eHLI8Lr9iLDMrBGH77HRznaBW9XkbZPMKUvrwE+iuIUsUnM=
X-Gm-Gg: ATEYQzwjr8SBfo6A/u2GT3kP51m3bT+Ak6oMlThhVrxZ10dl9Bm6mLPgQmEcJNVUlOq
 tJbF8mGEtZZ/ehbWMq9eq3t8gSTbQYg+n2oapLFfeXQhhBDC8HcPWiTVj9lwMiolSIPUzAWkjkR
 ZOFtHjRPOVwe8ep74YJdWHL97SS4HLBxuP5oWxvhDXip2OnzBc/CuO55hNrYcq5U4x9fJuM6WhT
 1Cqca2Imz7tahB3wjRRYA639odQ+W3gMFyyfo27tXu2XjY9rxS5fDD4rRwmqr0FUiE2DLWP1dtv
 43L7Kc89d/U9aDMfJP5SU0LSLKrLhrhrVinSWANLTvNAiTBzWLsHjN78UOD4IqWP2s79YhmwT+I
 uQUKV6B9Rr8GCIyenhsgbtU1m2qJfCEv5rT5AnCSwyaMKZ52qvyLT+78sjqHgqUsY2+zPaL+wvX
 zKgqQ0R/kieGOMtoJEJvlpfSI=
X-Received: by 2002:a17:907:2d90:b0:b8f:f078:4f5f with SMTP id
 a640c23a62f3a-b9081950b7dmr768622766b.7.1771948132247; 
 Tue, 24 Feb 2026 07:48:52 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9084c5de7esm424447266b.1.2026.02.24.07.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 07:48:51 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id AD9575F7B4;
 Tue, 24 Feb 2026 15:48:50 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH] target/arm: set the correct TI bits for WFIT traps
In-Reply-To: <CAFEAcA_rhRnJWQoC501HimdutMKessVbAF3VV=J6tFFvHMzriQ@mail.gmail.com>
 (Peter Maydell's message of "Tue, 24 Feb 2026 11:20:36 +0000")
References: <20260220171945.1065102-1-alex.bennee@linaro.org>
 <CAFEAcA_rhRnJWQoC501HimdutMKessVbAF3VV=J6tFFvHMzriQ@mail.gmail.com>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Tue, 24 Feb 2026 15:48:50 +0000
Message-ID: <87h5r63zx9.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 20 Feb 2026 at 17:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The WFIT trap should be reported as 0b10.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  target/arm/tcg/op_helper.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
>> index 4d708635068..aa14f15eb62 100644
>> --- a/target/arm/tcg/op_helper.c
>> +++ b/target/arm/tcg/op_helper.c
>> @@ -448,7 +448,7 @@ void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
>>
>>      if (target_el) {
>>          env->pc -=3D 4;
>> -        raise_exception(env, excp, syn_wfx(1, 0xe, 0, false), target_el=
);
>> +        raise_exception(env, excp, syn_wfx(1, 0xe, 2, false), target_el=
);
>>      }
>
> It would be nice to also report the register number in the
> syndrome (especially since KVM will use it if it's there),
> but that is architecturally optional, and getting the TI bits
> right is a bug fix.

Turned out just getting the rd information is trivially simple so I sent
a follow-up series.

  https://patchew.org/QEMU/20260224154347.344219-1-alex.bennee@linaro.org/

>
>
>
> Applied to target-arm.next, thanks.
>
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

