Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653766082BEF
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 17:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OVu59bZG
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNvVB-0002Nq-Cd; Mon, 02 Nov 2026 12:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNvV9-0002LX-Bk
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 12:07:19 -0500
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNvV7-0005zX-Ib
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 12:07:19 -0500
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-67990a45e02so2874958d50.3
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 09:07:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793639236; cv=none;
 d=google.com; s=arc-20260327;
 b=d9aS9rbkmHLdgbwWHg+Z2wgZlJlcKywj0orSCdzYVMI/5l5VAJHvwmVINFZma7lzap
 A3taBMEQKsbo/qZSxeJT+R28QIRckC5NzC8vO7Tj3infFBpEKEcCKgfMtotDWe3SaFq3
 sVFrfEI6i2u2X2GPiKUBbWiMtoXRiKnK2y+LtgVyf44JlI5jfYBPSF1THNCc6COSue8J
 MRb2zdpfv+5DZkUdmxbH4nU2UBHQCGUJUU7QyrQUvTf8qJ3ogAqg/qSUzc69o8SE4enw
 6MOlWhgqfHQTzs8Vh3PY8M6mAMIswiIaVE/z9gK6+qxgyYI3pNpXCeBB2FpdpKHm31iZ
 hNXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jpbACo+t6286VTNY4WrR5Jfr75/v+ASeBxYHRk3dxTs=;
 fh=s96hbMQeaTyGE41S6Odb74FgUE2OU2gwppa28Ho2i3U=;
 b=OyLtJhizV97cZTRehQx2PDYKrDUYqiC1GnS9TsYnhf6bnmCJb8gNQrtpiMf5sQ7CLa
 pojXcHhAVMCa/j7dIUqlmMBTdoPrm6QaTY4j43Al64Qc8MkYkVqFKDavIioVIOAu871T
 YsN57s9ywoh4HPleabErhwJG1k48MSgoXLMx9MGgzx2dcJ9ddwTmWrwt+CaecPxDqGM3
 yScTSTmx0zX9B9HwD6Si2/cznWK/SeXt0Gckq+dj5ujr98flVo6kBrlKvgOL5BBef/CJ
 vAvT51Q3sd21k2sHGv3nBABAjxP5J/wG9xlOvVHTu9P2t5I1kIjOSPK+qYEQHphQUjZD
 4xRA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793639236; x=1794244036; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=jpbACo+t6286VTNY4WrR5Jfr75/v+ASeBxYHRk3dxTs=;
 b=OVu59bZGDPz+cLD1M9KKURm/ADOMnGlxVuIoKGkvnY2bTtkCoPgDAzZByAJ9YBJvr0
 eMUtIE/69TxbhDSDhZUiiwZrwzM4hUPPPM6At7XjBnvZUCBLLlYly7pY+CdDnWQijcT0
 Wyjs1v9yFA+QTZ4jGp/FyrgJzpZl/atwiWGHU68l0OrfZ/3M/WIOfGpRcZPBkaoVm0tu
 +E6wtMXmIDZjC7DDlwINskWBO4APLCr/ffaHexOan17OouWFzuW16A2fMYx9aoCB22lb
 Qc1kxQbbCObNbydoo4/zPW5DCX3khDY5sbjrYTTGG+ZHpnZqTEVZJoQeIpvDYzg0Ag3p
 25jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793639236; x=1794244036;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=jpbACo+t6286VTNY4WrR5Jfr75/v+ASeBxYHRk3dxTs=;
 b=gguCiyHoA7603OGcMVHJF0T93Ebo4GHkB0K+ObtMqr03gHafCiQqwLKzhpPLBdbt6N
 vw8bOOgC6f66h5pmZ7PmKRq+ixManHliyh+JfwhVC8HhBJzzdjr7z6HhqzgX0YrDmvGC
 ozlwyWV+v788HWXSxd3Ufp6HpiaEDSsk8RFV/x3Zyikg1Jrhg6L+oF3up6peGK/f7xYo
 9JyPae6r1QgAHINkekKQl6fLtpjSxzD5yfsnFTA862CGrBZi4YxpFm510rrQ0GvH4KlS
 klB1DbRRzluqDERYWgIaPOJi0xEaJvWxttFUjpo94iF12xvX6KVzMlDPonmMN9K1uwF6
 A+qA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzq/T3bhaQzeVns/PMzKWJoaBlJ7TcJme5bLZ9AeI4YaEkMmRJHIgTjn300hAHNLKfp8f377DEjvw==@nongnu.org
X-Gm-Message-State: APuU4Z/Ca4LkZOJLV/SJiQqDbczqMVKs2j5YxagQqnVBjwznQJFLNQhP
 Z50RWs5TujKG7FRK1fpjVzXGdiGY2luQYZxOygVr8qHbcQZ6oTXP4L+FuX5xOWEPM6+fMezxAxZ
 zPLZr0DMBn0xbW8u3FkYEaQAJXqAkmA9gUA/gPH3a1Q==
X-Gm-Gg: AYBFou1e2RNCXW6rNO2cBmfEc/eRjJDAatsIiPFtKdkQbjdOwkvDezOUrrY/KbZDi5L
 DFcsxBk6LDuYAtMIr6YD8vY/8UDCFm1f6CYIIZva9mQnxO71Vj0JJs/PTAk8Jba+r/tR4/33oi7
 Qv6EyY+lBIZH8ze5Q8/dk8vZzEJUT/g0vhuRnhkKl0Xue24zEelY+BX6HfVaBFE8x6Wo/0p/043
 wwlDZ3OdLaUga61kMqcrLAO0mKczbxop6kH2blxFiMBAO1VrHVQC2ULDsrje+1hOzi1L9EnWPe4
 TJXloTOn/TZnyspHMM8dsJjU5FjTB/6UYewoPbmEK8bXqTmnluvKZWvpDcXB0WBQf6axG8vBT8G
 fdZdLBek6Q2voU/sHcGif5ognulx88hAUDQPTlSpcPS5N4CLI4RcynpGE5Y3TESeJPZgc1ckXns
 HD05SkSnxojrHL/ab9gRvv
X-Received: by 2002:a05:690e:bc6:b0:66d:1877:121b with SMTP id
 956f58d0204a3-67ba4ed9d6amr8624803d50.32.1793639235939; Mon, 02 Nov 2026
 09:07:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027120135.53048-1-mohamed@unpredictable.fr>
 <20261027120135.53048-5-mohamed@unpredictable.fr>
In-Reply-To: <20261027120135.53048-5-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2026 17:07:04 +0000
X-Gm-Features: AclHuK8apI7uKQR7VJeflf1G7xivvxG3mLicxyyh1JXZSWglckzH1s-SlLEJ310
Message-ID: <CAFEAcA8YN2+YuU94W=+6Z-YBaG54Db4E1hkYdzn4DrSW0J8dkw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] hvf: arm: fetch more features
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 at 12:01, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> macOS 27.0 has some more feature registers available. Fetch them (but not using the values yet).
>
> Also fetch DCZID_EL0 at the same time.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

This patch failed on the macos CI jobs, so I've dropped it from target-arm:


https://gitlab.com/qemu-project/qemu/-/jobs/17671032296#L4708
https://gitlab.com/qemu-project/qemu/-/jobs/17671063089#L4702

> ../target/arm/hvf/hvf.c:1197:11: error: use of undeclared identifier 'HV_FEATURE_REG_ID_AA64ISAR2_EL1'
>  1197 |         { HV_FEATURE_REG_ID_AA64ISAR2_EL1, ID_AA64ISAR2_EL1_IDX },
>       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../target/arm/hvf/hvf.c:1198:11: error: use of undeclared identifier 'HV_FEATURE_REG_ID_AA64PFR2_EL1'
>  1198 |         { HV_FEATURE_REG_ID_AA64PFR2_EL1, ID_AA64PFR2_EL1_IDX },
>       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../target/arm/hvf/hvf.c:1199:11: error: use of undeclared identifier 'HV_FEATURE_REG_ID_AA64MMFR3_EL1'
>  1199 |         { HV_FEATURE_REG_ID_AA64MMFR3_EL1, ID_AA64MMFR3_EL1_IDX },
>       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../target/arm/hvf/hvf.c:1200:11: error: use of undeclared identifier 'HV_FEATURE_REG_ID_AA64MMFR4_EL1'
>  1200 |         { HV_FEATURE_REG_ID_AA64MMFR4_EL1, ID_AA64MMFR4_EL1_IDX },
>       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../target/arm/hvf/hvf.c:1202:25: error: invalid application of 'sizeof' to an incomplete type 'const struct isar_regs[]'
>  1202 |         for (i = 0; i < ARRAY_SIZE(new_regs); i++) {
>       |                         ^~~~~~~~~~~~~~~~~~~~
> /Users/gitlab/builds/qemu-project/qemu/include/qemu/osdep.h:541:31: note: expanded from macro 'ARRAY_SIZE'
>   541 | #define ARRAY_SIZE(x) ((sizeof(x) / sizeof((x)[0])) + \
>       |                               ^~~
> 5 errors generated.

thanks
-- PMM

