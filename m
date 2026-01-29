Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FCBD61020
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 14:57:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlTRx-0005Sh-3C; Thu, 29 Jan 2026 09:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vlTRw-0005SN-Eg
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 09:56:48 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vlTRu-0007vO-V0
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 09:56:48 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so8788045e9.0
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 06:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769698605; x=1770303405; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bAlYZVO6F4imjhnmZ6cfstfROiq3dOuBQnCrWAgyRm4=;
 b=US8kJXsEQWEMjGE8mh97HXdCfSUrp1Kz8sCiuvPx5AxGzNmQdaasRqIKEEbUrYGHmY
 VUOxopjfG0uF3f9h9GrV5LtSbwjAJrnNVBwENSF/FfNU3Sw+wmbvGUMAhoroPTpHOlyb
 Li4s2z6zhFbd4Cub1TVV5rZCh4k8l8uuYZNrNyKLevswJ3XDLQRbx2sYnbzUcYlMVyUV
 7UT5CZP06oJuVXLAHcmTgZWumlE0wF2u+i1KoAHjAYCRM4dbHRQzNaZIq983KeqNYDES
 o8m/m4HVQqKWmEF0t98z3yVXY5VSJgJrXP+skHiduKrKrfQxYIfW+DZvvVCAgY+M7k9b
 muyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769698605; x=1770303405;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bAlYZVO6F4imjhnmZ6cfstfROiq3dOuBQnCrWAgyRm4=;
 b=Uk7Y+rzKjxSZ63sa3tQBO2+Ri/24ScDJSJmZkcTzT53rV3uTcDaHaAIb7sKEUBfbwv
 xP4YLcZW6gYEoQNCIkBA/H1t8EvRHorOc/5/Xli8kuTcA+SpL1ynVHN0Wb4Jbdp8rMPI
 nlbGvHFx6RVpFvubIiKQ4UECVGj8NNKW4mkJbgmRQ/3yw1iZvFyCMIX/ECby3V/KDNFO
 DG6lI4Q7t3m4NpsAotcny/li2B18T5S3ab9akp+mW/q4DcCQU7pDX/nNxKgAL2HJNSno
 vRIWeAex4du5RK7xQRZ9mCBLaRk+RzCFCIQJhYDVM0FsnnonFLl0yrjDpb9QKpqIEnl5
 tIcw==
X-Gm-Message-State: AOJu0YxGaUeOS++KcaoxYcONTa1uXuUyo/kJ7KPgvOb9IaRQl5YyMGAz
 i7YcUnv/MI1ob7625HMlNFiKMoNvf62WKhypDdpUz5FyXBamct+EHbZ1qiWlElZoPUQ=
X-Gm-Gg: AZuq6aJw7ZmJQ9GR+SBLjAz/RsPQg5x4TuQL+irce3UAuaX3i4BBzUe9p9tt6kNM5kk
 /2Ev2W7zQNnN7YLimCE7UUmoBC8hQNArthvz+I6jBG//RuENgLbhls/qhVG3Ih6KPLGHUmQtx83
 2GHLnOhIXHATq2GGDz2riKhXBA9QtgAZYW45Y/cQi0+T64KmI2AMOvE4WNHsZAWg3XtaURTae3m
 Ua5nNI/S6YcAtJNCNd2/MLZ3um55OjcElZ0Qk2Ac4pxTokH6Zl64iJfnW4Op9iPnPmwUk5/E6ip
 nXXo4XuS6T0jLPHxAfW3Tf498UYT0LMs9GmzT8Q0JvWbImnaVL3JxCQ6+zNOV6YgYATyLqMvqGg
 U1ZQjWZYHgp7HAXpjM9m6ol/7uuOavsKhUoZnaP0StdLacK4XKqt1Ixo9qhhStbIilEoslX/ojx
 3jI0Kq8xMiWaE=
X-Received: by 2002:a05:600c:1994:b0:47e:e2b0:15b8 with SMTP id
 5b1f17b1804b1-48069bfa73bmr116819135e9.4.1769698604803; 
 Thu, 29 Jan 2026 06:56:44 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-481a5d30f09sm5951065e9.1.2026.01.29.06.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 06:56:43 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DFBD65F878;
 Thu, 29 Jan 2026 14:56:42 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH v2 3/6] target/arm: Handle SME-only CPUs in
 sve_vqm1_for_el_sm()
In-Reply-To: <20260129113455.1283266-4-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 29 Jan 2026 11:34:52 +0000")
References: <20260129113455.1283266-1-peter.maydell@linaro.org>
 <20260129113455.1283266-4-peter.maydell@linaro.org>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Thu, 29 Jan 2026 14:56:42 +0000
Message-ID: <87ikck8o2d.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

> In sve_vqm1_for_el_sm(), we implicitly assume that the CPU has SVE:
> if called with sm =3D=3D false for non-streaming mode, we try to return a
> vector length from svq_vq.  This hits the "assert(sm)" at the bettom
> of the function in an SME-only CPU where sve_vq.map is zero.
>
> Add code to handle the "SME-only CPU not in streaming mode" case: we
> report an effective VL of 128 bits, which is what the architecture
> rule R_KXKNK says should be used when SVE instructions are disabled
> or trapped but floating point instructions are enabled.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

