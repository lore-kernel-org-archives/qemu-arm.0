Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B7F60A2624
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 16:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oaT1V3+j
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOzvF-0004bL-IB; Thu, 05 Nov 2026 11:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xOzvD-0004aL-9K
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 11:02:39 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xOzvB-0004eY-OP
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 11:02:39 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4b4571ff080so22226905e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 08:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793894556; x=1794499356; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=iu/QW62tQvEwErXcWLjoRCam40BVpMeHXiQWa5SZTo8=;
 b=oaT1V3+j2H6bW368D4QsjGonm5+Ka4YiMV/qeuLEb6xyZDAM/WfNgEEnSE57BKwzji
 1VNVUbg2QvwxRrQwU3LmI5trwYGe+6gUiiVatJmSzwaxYyr1s8TCYF0h0Mmp2AkY8Fw0
 cZtoUW1fVblxJOeaCGu+4VcCDglKgZhkKR3grqofKDOfFmDJrMF+HoXYYcWQuJbrYsQC
 yg9AZ8AxyvsxLjUjSBEuR21UkAgokcrPgxmqpJWgR0kpY7U3Q2wwXnqmv//Yc3Y2chQ3
 2MdsezBLe2HEYEBOYwmPInx7xSK7EFk1qJ8GPwB3aGksPuAJOvNgq+P5Tx9aqX2OderX
 pyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793894556; x=1794499356;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iu/QW62tQvEwErXcWLjoRCam40BVpMeHXiQWa5SZTo8=;
 b=vqSGUCoruwiPSKD6LchV6ytSWVaIy3qSLDY8Zfcv2jBFeHt4SqBhqzFh4zcXHm9fG+
 81W9sogmQZj4EQT6X5gwzWIJd9CgBxESA9sdGkfXgiuioVaTIpO/9bhjPyMg/+HHQFQS
 AzmqZeG05rcxSfaFY8XMbLPvssO/oJWxycGNbvn6gC0mLi0lgcu2m3eP6C2EAEvUlFTw
 hxpS3x856bB9imh6LdghXdTI6SI2f6n4n2bS1BJxhXAI80m1gEZ189PHqeM/IfpySP1F
 AC3PANYXuTCQ1nunnBvBLTu0Gpq4PZef2lXGdFh4fOKuZvidOYMT/g8UblXSchjjcUfz
 abJg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzSv//BUxBtlxNyh27UoJIoEAFvnm5ou78QjEXfOsJRBB1X4RD2SzRUbAbApKyo3cAM5YrZwQHogQ==@nongnu.org
X-Gm-Message-State: APuU4Z++XYbDQMjb+FuG/p40X+DOSj1MikDbujee+dIDSdvCm7YUdBCb
 dllPyHZsqXvi1CNu43XsbGltl84mC9dKxMt/kXB90z+w2A5yuZOT5SxfUTtfEFiitI8=
X-Gm-Gg: AYBFou0Tvx+PhQvT/TUhnTvsvEGeei4hL+15qGbqJ1RMpAXNl8comQCq6ATxkTob9EY
 DZ9ycJEMRBbQ0MkSJYaysjx3DvF7/88c/FhaN4zqwDrxumgSZAcPqJKXCgsqVgSabZX6UrpRjaf
 W2LDAow7d6gUR9rY/lpaiGK7a9d45r0+2+d6yvbE32wyH1TdVJA3Wf7E2UpB4xpwYhR9WN7e1ur
 78GtzYrgYKtODrp5qGRTSe0z0vHUE77uAo4WWZlV7G7le0gybuJ7pap2fe2K0U1HGyI3siAs63h
 wtWpcxuXXEwAb2CXIt9LQF/RnlSrUx4s0ekFILy5Pl66E/o1P64CBSzWXT2+kvsafwkG70J+kow
 8/pac4XwVTWn9UeLPkJURyXznyfWek/0OcXgT9J0vnvC9+K0c8+x0XHMXwjat8xcGg+zMEwB8SH
 0/DUFSMrBJvr8+4qvR8mM/5sRju0mmmp4V2w5dzOFBtRPugTOTzcbwDlsfP+icsV2+BUcX87ksN
 o0kCzFuOaaFr5tHeN/a4+/lv3UJTr2v5PTcilozUlJn8N7sfoVEH1sVBlzmbGGkiUVtEX0zJMgk
 wCG91biiS+CJOCA2aJu+drJKtAeKGEEkRU8unzcjafZYdSxDfA==
X-Received: by 2002:a05:600c:c09b:b0:4b0:c1ae:829 with SMTP id
 5b1f17b1804b1-4b0c1ae0ad5mr232416905e9.30.1793894555794; 
 Thu, 05 Nov 2026 08:02:35 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b64809c39csm18122505e9.4.2026.11.05.08.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 08:02:34 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6F2235F8AF;
 Thu, 05 Nov 2026 16:02:33 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,  Tyrone Ting <kfting@nuvoton.com>,  Hao Wu
 <wuhaotsh@google.com>,  Fabiano Rosas <farosas@suse.de>,  Laurent Vivier
 <lvivier@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 02/17] tests/qtest/npcm7xx: Replace deprecated
 sprintf() with g_strdup_printf()
In-Reply-To: <20261105125203.40320-3-philmd@oss.qualcomm.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 5 Nov 2026 13:51:47
 +0100")
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-3-philmd@oss.qualcomm.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Thu, 05 Nov 2026 16:02:33 +0000
Message-ID: <87jymr6zc6.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com> writes:

> Replace sprintf() by safer g_strdup_printf() to fill the QOM path
> and property names. This silences when using Apple clang 17.0.0:
>
>   ../tests/qtest/npcm7xx_adc-test.c:140:5: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>   ../tests/qtest/npcm7xx_adc-test.c:322:9: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>   ../tests/qtest/npcm7xx_pwm-test.c:244:5: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>   ../tests/qtest/npcm7xx_pwm-test.c:245:5: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>   ../tests/qtest/npcm7xx_pwm-test.c:255:5: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>   ../tests/qtest/npcm7xx_pwm-test.c:256:5: warning: 'sprintf' is deprecat=
ed [-Wdeprecated-declarations]
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

