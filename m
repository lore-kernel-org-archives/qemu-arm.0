Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EF4CDB479
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 15:08:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wclga-0007YN-Fy; Thu, 25 Jun 2026 11:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wclgM-0007XR-2W
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 11:08:00 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wclgK-0005GL-Hp
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 11:07:57 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-49241dbf9c1so20582735e9.2
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 08:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782400074; x=1783004874; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ccD3CjECNJ4P0H4BwiPG6dGwuaFWZA8In+HFpq91zBA=;
 b=sy6ICFwRlBim+K/Cphc3/2YbKLntoHuBiDyTGRrc0Lfy1j4BDAKWrcbogpp2VElem+
 pSJmyNVtevnugMC8jrTw6cIvsKeFxtpn8GBKXpxaOzkf2HWUfucmfDonio1VZN5VUboK
 ld9f4glqde645DxTorWTvN+Tt8Ctx8EqtjwL9eft9EgtNecz1KFLEQdXlDqWMeFFqVsR
 DpxDye4zz+wustql1mCIWX86A9MtNAwGezcghAo1EuHELfBij+Dg+uswRKsY+cB2Q4aq
 qOndlWIzN3p/WOaOlY1GqRycDAkV9KQbT1mjKUoXsvn59/hXv8Ab5/shSgykPFZ8M5np
 iYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782400074; x=1783004874;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ccD3CjECNJ4P0H4BwiPG6dGwuaFWZA8In+HFpq91zBA=;
 b=fGELIM4coy643IVmUAl9GUu64Wki5vQ2EqO7N84oYA13W5Z/qcrgp7ScNGS6WnpoTT
 s2C4sKIXtzjWrLRVz9pIDof9V+zq6hBz19WodI2YRWhjtExRntJFq817YpMwW14df+lx
 rmsSe/JntQQiWHM8x+cV8YqjtylBoyB7O/6YEXB2L6Q6KU8F5NwO1dyl9F/jmq5oyTdb
 ULMLuoUrWRg9X2b3fMt0fsrbplBwOBzlhGJiCaZC97ZY7eMmYbfQeCmWgUuQbJc/HG7h
 QbZjBmKC/va6C91T9Y8I+ZCM7Ud9ExfPZ9tfkgMTGPq9i+TF4efmq/Ip73qFr//IQ2WC
 KDZA==
X-Forwarded-Encrypted: i=1;
 AFNElJ83CfSPfO8HU7/MjB93RGDKwKMUh36RPEjDeI4UbdjfzlKuDeMvZqRgeguWZURQrLU+v/ZKhT5HUA==@nongnu.org
X-Gm-Message-State: AOJu0Yw/dwjiHZh5j9SyUdnAHsV3Vpr+prAEuOctl3neBf6A2o+EOWPL
 DHD6H1JRvR3dQGW0YiW/ftDfP+cMPhsHbHDNPb2ZnYtY5zMv8uhKB8qDKXsna0pehno=
X-Gm-Gg: AfdE7cmE94nbKWSYEaA4lVnRMkfHI/6xl3sBDFBBCsI/Tu5abSJ/xU4m4EwdRJ3a0q1
 3uZqyXv6kNADzdTb8gI3iXQZi6G7RzfWqo1McjU/YkS8+r7Afmo5QfuJ8CfNUboSxMaEJF/PG5Z
 DsdsSmU8kx4nRzb7+BS7Cu1X6VxomKunJWP9HCHzrQX+/efZR/YNCFcFSR4dpf5uR9A0LtyB1xu
 t4OROW2nCykEp4FgS95pX8NLjYr1OEMa4EGV7W9WPX+yhOKJ2ey4hTBG/imI3h0M4+15JuXQ7vY
 ifucBD3zLVYD0VCsqA1r57cQw+4rGAzX+BxsQRAPwBGJWUxyJilZAeORiJD0Le56wjTRdkm2XYJ
 JJfE82m4HiqBZZ2+AjT1AbQ1h3HHvolBiolrIgy6wnXozfqNzbRrV0He3ipfu+dhRG3RlCvb9fh
 BNSB5SHj7PePwPbFui9OERM50=
X-Received: by 2002:a05:600c:3b24:b0:492:3fcb:22fe with SMTP id
 5b1f17b1804b1-492668551dbmr44532855e9.1.1782400074010; 
 Thu, 25 Jun 2026 08:07:54 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49269005626sm3267495e9.10.2026.06.25.08.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 08:07:53 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4E5FD5F8E5;
 Thu, 25 Jun 2026 16:07:52 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jim MacArthur <jim.macarthur@linaro.org>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 6/6] tests/tcg/arm: Tests for new FPRCVT instructions
In-Reply-To: <87qzlvhued.fsf@draig.linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9?=
 =?utf-8?Q?e=22's?= message of "Thu, 25 Jun 2026 09:54:50 +0100")
References: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
 <20260624-jmac-fprcvt-v2-6-dc6cf8e512b6@linaro.org>
 <87qzlvhued.fsf@draig.linaro.org>
User-Agent: mu4e 1.14.2; emacs 30.1
Date: Thu, 25 Jun 2026 16:07:52 +0100
Message-ID: <87a4siirp3.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Jim MacArthur <jim.macarthur@linaro.org> writes:
>
>> We autodetect the presence of FPRCVT in the test cross compiler,
>> which is a recent feature in GCC and not supported by many distros
>> yet. If this is in place, we compile the existing fcvt.c test with
>> an extra compiler flag which uses the new SIMD instructions; the
>> output from the test is unchanged.
>>
>> The existing [US]CVTF instructions do not have a test, so no new
>> tests are added for the SIMD versions. They have been tested manually
>> to check the new SIMD versions produce the same numerical results as
>> the existing versions.
>>
>> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
>> ---
>>  tests/tcg/aarch64/Makefile.target | 14 +++++++++++++-
>>  tests/tcg/arm/fcvt.c              |  7 +++++++
>>  2 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makef=
ile.target
>> index 6203ac9b51..32f2689273 100644
>> --- a/tests/tcg/aarch64/Makefile.target
>> +++ b/tests/tcg/aarch64/Makefile.target
>> @@ -28,9 +28,21 @@ config-cc.mak: Makefile
>>  	    $(call cc-option,-march=3Darmv8.5-a,              CROSS_CC_HAS_ARM=
V8_5); \
>>  	    $(call cc-option,-mbranch-protection=3Dstandard,  CROSS_CC_HAS_ARM=
V8_BTI); \
>>  	    $(call cc-option,-march=3Darmv8.5-a+memtag,       CROSS_CC_HAS_ARM=
V8_MTE); \
>> -	    $(call cc-option,-Wa$(COMMA)-march=3Darmv9-a+sme $$fnia, CROSS_AS_=
HAS_ARMV9_SME)) 3> config-cc.mak
>> +	    $(call cc-option,-Wa$(COMMA)-march=3Darmv9-a+sme $$fnia, CROSS_AS_=
HAS_ARMV9_SME); \
>> +	    $(call cc-option,-march=3Darmv9-a+fprcvt,         CROSS_CC_HAS_ARM=
V9_FPRCVT)) 3> config-cc.mak
>>  -include config-cc.mak
>>=20=20
>> +ifneq ($(CROSS_CC_HAS_ARMV9_FPRCVT),)
>> +AARCH64_TESTS +=3D fcvt-fprcvt
>> +fcvt-fprcvt: LDFLAGS +=3D -lm
>> +fcvt-fprcvt: CFLAGS +=3D $(CROSS_CC_HAS_ARMV9_FPRCVT) -DFPRCVT
>
> Do you actually need $(CROSS_CC_HAS_ARMV9_FPRCVT) in the compile?
> -DFPRCVT handles the compilation.

Ignore that - I forgot about the march flags.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

