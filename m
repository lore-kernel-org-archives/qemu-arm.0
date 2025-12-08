Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21E7D3B7E2
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Dec 2025 17:09:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vSejR-0006er-Ou; Mon, 08 Dec 2025 12:09:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vSejQ-0006du-9L
 for qemu-arm@nongnu.org; Mon, 08 Dec 2025 12:09:04 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vSejO-0001Ct-4W
 for qemu-arm@nongnu.org; Mon, 08 Dec 2025 12:09:03 -0500
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-47798ded6fcso35558155e9.1
 for <qemu-arm@nongnu.org>; Mon, 08 Dec 2025 09:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765213740; x=1765818540; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yp/1DvjRTHSNKSXajeVBgxucRCT8YkMJ1b7rSmV4BMo=;
 b=o9utv3KdG/RKJ5KsLVyCxQ9CM2u3o5J0C01HW8OrrQf/5kRa46u6aiUlGG8asjcP2q
 9YgKk9GFNclH2aoIGSRCA1IBkFtgs2k+lcJMj+beO0K9UllsfC+AIAycIE3aY+AzOMLJ
 SG4hUoXcGYELvZgeJKfqf+YeEr7mI+4HbGdMcomufvFKI6XvPrlTCR5BCKJPcZINCiko
 PJAkvA0PJKUmMeArFcivXG/icFYyjYqY4Gs3QbnhCVeHsUzfzxfAl2rVgnUiqTqHya1Y
 tc0rthZZQc/cT962+vL2bQpJK03l0GxZUUCQ650dQ0Q190LkhYyqfUqJbRp7ASMCrCtd
 9xHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765213740; x=1765818540;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yp/1DvjRTHSNKSXajeVBgxucRCT8YkMJ1b7rSmV4BMo=;
 b=en1JTrQ83qGntKx8zaImzUSjwJ6N0PXNgmv2+tSVDY7UZc5AbO6R/vgi4bVCumuvtX
 FZhh9/pSdUppVJL68NvbQhZo5NtAbdU4G7NYMyQlPUZu6MBK91fbN+ncbsQsDyhYsBBf
 I/J3fvRVdrd/9wYW5B72pQwISc0NgchEcVrVTN/DavAE5tanAPoLNWDFw/UkQ14GF30G
 jbbsuRzPeDVuQMfGHxW0BOWJo7njqlD0mdWVHJ7KXg+7IBWJo5qjg83PVXguoTmEuZUh
 23e8PUcinzQNqdyhZ4/6g8qQcRRXj2X2oEO6Rd017rFFp6HJb9TL2bYodtGi34birT8t
 kCFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmh+D/0U5kNGjjAnSLENL6qRtjt412hjZxWs+/5dlEd9zqHrezh/rZOgVEctDKVomCa/aDa7JqFw==@nongnu.org
X-Gm-Message-State: AOJu0YzLQF6Jv4zoTI1H+crGwMbba5iRrA1wNpyZwdI+HxuTV3M1ABBm
 UQ3vWFVzVTVZBEnFXimwN5T/4wG5N2Yqz8MvNS7oLeIty92plivneaXQXqE8CVo8lfg9phu+7qN
 xuj7Y
X-Gm-Gg: ASbGncuWD0slbmOdMx+/04DpnTVhsZFXwIN2vGWDtFh6BXewBd1YyJf6scthmoG8wRJ
 DRdOZ/Xvq/pfer2YnFcpek7V7G7glo5oOizhJinCotZsu5ufaKbUc/Cse/BGoOp34PIj+RkY/77
 R5+myX8bjpMQiLnYZim5k8E8FL1QyLE6figcXdcCuFo6JWExL8Ult0bsZlnCXcKOKlCqeNR1O+W
 fPe9uSCh/jrIMEVIiQwhdwAUjNNLfxcgVEwALQFpZJT5FgyK+e0x6XQeiKjGFhIW6mr0dTbaPgr
 EiWTrJOSpchupsBmzWEXP8fcT0BYVgEgIhIVSVXu4WydX6oS5/rDWqSlhnOByg9AJAIzyMaWM7Z
 6DMJsA/YnfaIiMneNtS/PuCa+LXhaUDdlhbB7b+HkjVjMVRHmIPpA0PjV+p6itTox4bpTmuMjlH
 co6mXN0SAocDA=
X-Google-Smtp-Source: AGHT+IFB5M9H1XwTkmXpQHXIAsNagaxwwxuEgkky5qyiHd//D5sYM3MAjlsKiorqagRCvsEnYoqhBQ==
X-Received: by 2002:a05:600c:4e92:b0:45c:4470:271c with SMTP id
 5b1f17b1804b1-47939e1dc67mr79456045e9.18.1765213740208; 
 Mon, 08 Dec 2025 09:09:00 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47933aef61fsm211412905e9.7.2025.12.08.09.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 09:08:59 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B64145F83B;
 Mon, 08 Dec 2025 17:08:58 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-devel@nongnu.org,  Mads Ynddal <mads@ynddal.dk>,  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,  Alexander Graf
 <agraf@csgraf.de>
Subject: Re: [PATCH 2/2] target/arm: ensure PSCI register updates are flushed
In-Reply-To: <ff000682-b14d-4152-88b3-cb2761b60bc1@linux.dev> (Zenghui Yu's
 message of "Mon, 8 Dec 2025 23:30:30 +0800")
References: <20251205151115.2035930-1-alex.bennee@linaro.org>
 <20251205151115.2035930-3-alex.bennee@linaro.org>
 <ff000682-b14d-4152-88b3-cb2761b60bc1@linux.dev>
User-Agent: mu4e 1.12.14-pre3; emacs 30.1
Date: Mon, 08 Dec 2025 17:08:58 +0000
Message-ID: <87zf7shped.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
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

Zenghui Yu <zenghui.yu@linux.dev> writes:

> Hi Alex,
>
> On 2025/12/5 23:11, Alex Benn=C3=A9e wrote:
>> When we handle a host call we report state back to the caller via
>> registers. Set vcpu_dirty to indicate QEMU is currently the reference
>> and hoist the flush_cpu_state() and make the call unconditional.
>>=20
>> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/3228
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> This fixes the guest boot issue.
>
> However I notice that some (all?) HMP commands (e.g., "info registers")
> don't return and result in guest hang. Haven't dig further though.

Does this fix it:

--8<---------------cut here---------------start------------->8---
target/arm: make HV_EXIT_REASON_CANCELED leave main loop

Without this we can spin tightly in the main HVF dispatch loop and
never release the lock long enough.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

1 file changed, 1 insertion(+)
=EE=98=9E target/arm/hvf/hvf.c | 1 +

modified   =EE=98=9E target/arm/hvf/hvf.c
@@ -2020,6 +2020,7 @@ static int hvf_handle_vmexit(CPUState *cpu, hv_vcpu_e=
xit_t *exit)
         break;
     case HV_EXIT_REASON_CANCELED:
         /* we got kicked, no exit to process */
+        ret =3D -1;
         break;
     default:
         g_assert_not_reached();
--8<---------------cut here---------------end--------------->8---

>
> Thanks,
> Zenghui

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

