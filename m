Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26515D6B080
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 16:00:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlUQg-0003kU-TA; Thu, 29 Jan 2026 10:59:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vlUQf-0003Xs-Ei
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 10:59:33 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vlUQd-00049P-Nr
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 10:59:33 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4806b43beb6so8946485e9.3
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 07:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769702370; x=1770307170; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJbR14Lk9ZZiIj+HmuNfoON+QnPkLGuyK6YiBSBe9LU=;
 b=oGxrzb1DeQXGi6KD6AOn0ZlWEyS/0/D/6Z73HQioawTSGYvdYVmXlt7OctyAiFKot+
 xTmvb98jkw0k8WbFgMeoYMCxYQ6Q4XU2dEgdrLyeYQBVHjEDNgeBe9HPvyh/M67G01Qp
 MR8lWTOBKD27mqC96+3x+ffN6cFIzzZ3bR8ydR4LsEPgwc1qKthfu36Sdp8aFvSHdon8
 xI4igxK8YDkfIRAFE+iQwqpT06hHxA4/zCtRku+F+SkmKrYhea+aO0JIc4usdhDr0JEa
 KpDjPo8yABN7vhDLpMHCfVf14vL7jRXovReRxgdC7buxwoPiTD8U2PuaeDYTEWupN0cx
 Tdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769702370; x=1770307170;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mJbR14Lk9ZZiIj+HmuNfoON+QnPkLGuyK6YiBSBe9LU=;
 b=ELHIqxfeUkICzFuJumKznS3jStu5t9qijMXniI8FSJV7f+xMB4fUKJmqQnJXZPafnM
 0QOREDR79hakHWhnUfqNGgCyKfc98w5LP73D4qTBr5M0ahYImFiSDZIojnQd2KOWwDkn
 +MgLmZL772/FyeSSUQqdw22fFSOkO5GK5ql1cUfkZUUYfF3QKaw3TAvirWBwc7NNgp/t
 L2egVsFTgIoMYlLpwNFTi3IOwpy6Ki51KEBSavyK2XGuAm2Dzr0HYS+hkbzYTM7VdnQW
 4wd1uDEZ/UEnpHELSRyVYCN+T57YBGBLK4b5C9VhWgRcfzl+eg5zwTwEkRY48L4U/Ti1
 a0bQ==
X-Gm-Message-State: AOJu0YxJcm2JFnChJVUVSLQKcyOHxtEwnChRei94knO/qZMyRJlOiwc2
 Xe77xthB5jNz1ugz0QdHQy/2RHalDGOMV92xKPn9CN30sSKS+zusCKJwmMowewtYTss=
X-Gm-Gg: AZuq6aL0H/B//SvLz6IIfwF/Wg5yZ5DCXpOuLzJV6jpVRRmh8SAO6ATJscoR0i3P4Hq
 mdVKVLihtFC1/RvEa4gIqnrJW5UhEp2AnZpoUFttXlfgdmons3DtFOsD+ktySoDEDM9YgfYlD1R
 A2B5scGcMc6zG0Xn5XJPRoPRlVzQcNg50wEGafepoAYkffKiI3/RasLcl2DI9V8pzPYbsnlfDgM
 cbzrgAdK91hRsih9g34MXxRaKwNcsVyfq9Jp/EVJGFcZHw5NyytiQSuuz3tvENW87Qeyg5bYRME
 k0PM/PU195UnAnXwiPE30VyakH0jawAz6TGrC2ljp3vNempI+0Vey7gGJeyL6KY83S4zI9ffkFU
 6j8KlBMqKqFKAmTxS8Ck8yBkxgc0020WEiEpms6t+HoEuLmHmpJ8gXP8G7fMDCzD7ni7niXJf2I
 ERjkWbrZhFxu8=
X-Received: by 2002:a5d:5f54:0:b0:432:dd71:8f2c with SMTP id
 ffacd0b85a97d-435f3a6aba7mr134364f8f.10.1769702369738; 
 Thu, 29 Jan 2026 07:59:29 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131cf16sm16376335f8f.22.2026.01.29.07.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 07:59:28 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 06FF85F878;
 Thu, 29 Jan 2026 15:59:28 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH v2 6/6] target/arm: Permit configurations with SME but
 not SVE
In-Reply-To: <20260129113455.1283266-7-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 29 Jan 2026 11:34:55 +0000")
References: <20260129113455.1283266-1-peter.maydell@linaro.org>
 <20260129113455.1283266-7-peter.maydell@linaro.org>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Thu, 29 Jan 2026 15:59:27 +0000
Message-ID: <877bt08l5s.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

> In commit f7767ca30179 ("target/arm: Disable SME if SVE is disabled")
> we added code that forces SME to be disabled if SVE is disabled.
> This was something we did in the run-up to a release to avoid an
> assertion failure in smcr_write() if the user disabled SVE on the
> 'max' CPU without disabling SME also.
>
> Now that we have corrected the code so that it doesn't assert
> in an SME-without-SVE setup, we can let users select it.
>
> This effectively reverts f7767ca30179.
>
> Note that this now means that command lines like "-cpu max,sve=3Doff"
> which used to turn off SME and SVE will now give you a CPU with SME
> but not SVE.  This is permitted by our loose "max can always give you
> extra stuff" rules, but may be unexpected to users.  Mention this in
> the CPU property documentation.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/cpu-features.rst | 10 ++++++++--
>  target/arm/cpu.c                 | 10 ----------
>  2 files changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-featu=
res.rst
> index 37d5dfd15b..9d0c5731cc 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -318,12 +318,18 @@ SVE CPU Property Parsing Semantics
>       provided an error will be generated.  To avoid this error, one must
>       enable at least one vector length prior to enabling SVE.
>=20=20
> +  10) Disabling SVE does not automatically disable SME. If you want to
> +      disable both you must use ``sve=3Doff,sme=3Doff``. In particular,
> +      for the ``max`` CPU, ``sve=3Doff`` alone will give you a CPU with
> +      SME only (and which therefore still has the SVE vector registers).
> +      Most users will want to disable both at once.
> +
>  SVE CPU Property Examples
>  -------------------------
>=20=20
> -  1) Disable SVE::
> +  1) Disable SVE and SME::
>=20=20
> -     $ qemu-system-aarch64 -M virt -cpu max,sve=3Doff
> +     $ qemu-system-aarch64 -M virt -cpu max,sve=3Doff,sme=3Doff
>=20=20
>    2) Implicitly enable all vector lengths for the ``max`` CPU type::


Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

