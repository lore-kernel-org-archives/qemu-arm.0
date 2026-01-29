Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A91BD6101F
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 14:37:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlT8V-0005n2-KH; Thu, 29 Jan 2026 09:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vlT8T-0005m4-DR
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 09:36:41 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vlT8Q-0003BX-Ir
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 09:36:41 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so816445f8f.0
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 06:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769697397; x=1770302197; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wop6f6pSSz8jJXFqKfMSRxnNFbZ9pyIwseDHag2jDsI=;
 b=LvyR4MNV/r8uU8e7c31zZR+Wy3TEVKId1g9M1fu5Mx2iBGSuggGICJkB0aUvq/fTbI
 Bb1we8053tYw9r1Knbs8XZVjYjG94UxA9oXa1Ue3pQ1OrR86cG+5/+pJ7OdaYC3Bbg7m
 btiNwS7QDrln0isxgoDOX7wfbwCyPtVokqDHv5/cbgFTNJcdDlEZqRplSv6m0GdMvAwG
 yWBl27qK+ZB9VO9HayLmxpCIbCpmezg1OA0UyKhMFXqrHHF1f3ucEZIG7MqS8KbS4w2/
 CeAGow+RjDj2QVgecDUBXB/dDTmSP8s8Al8gi7WT13RhUTHDaP+oINtR7GBBq41IKK8d
 jGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769697397; x=1770302197;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wop6f6pSSz8jJXFqKfMSRxnNFbZ9pyIwseDHag2jDsI=;
 b=GV9hV+NOGT4Qo1SBCmHQtWaKeRq5jr8fyRLgQHLtO7pxIc/7M1BQW9HagcbCXwsTbi
 hDjuOUnAlPCrnNFvScnXHI2bNT/bf5uN+wJa5iqe4pYQrfuMMFl//sE/LNq2bbY9wMHC
 TW4NIpspWAiEdcZBrsB6GghtLlswwcMQFOPwVDYQlbSVzTusFl+zqqYYnmUQL2cZPt25
 URjbZXiP+BcoEQ5YqY8tpuOeD/SXxksaAQoHQDmB5hrf2MYHOmfRKHCLj5h2AsmdHUdi
 cKmaPEMXbGGiD09bdscdDOHaGHUvO2o9cDRMkwvy2WodV/JKqs0WmpOyaM1hmoQ+rukW
 4ouQ==
X-Gm-Message-State: AOJu0Yw205IdRoHIq5mDuYKqwvrtYPA/TiFJL0yR7L/fObzJ7CyrDtmc
 SG/OSKXn2s0SYsjUDoR7NerLrU+4/hB4zFGOGkn9acyx8GlpnH7hA7hATe+xzyV7yKc=
X-Gm-Gg: AZuq6aIITXdxC8UjXr/HgGJFiNd7JQ+0gQYUaATX/FIaNMVQMJa6eagr9S72/D5hEN9
 zi3L8hupJLcTwsf7TL4ATbSe0XOI0+nm35HnfszSYe6ma+oekJwv5RTkjEOZvEaDAEswT5jEQFx
 jZ4Xy79DXis5yY2BdsHSG1K1eIljMj6oMS20mvr5kS9WbkYF+Kts+GVb7BIzq/aDr78Ee4loq4p
 qDFO6K9KsO5tnAvDdpPtQHwqGmAw5jg+kADn6otoAPrXjrsgHX3ZWT3Ta0gQP8BqnN13miQjK9L
 LRCsbhNyD3UI95h0rPt0EIacS4KbIBdPqJBLRBtk5QiJHsgJjjevmn9n89OD4XikA/lzwx4GW+C
 LUdJLN9ek0U6Nf49lPJcVqltgs7VTATUBhrNzENLfFul8oBau2Qj9caW7eA/Uq/9/GZGYtK5Vky
 H/27jxKXhAwf4=
X-Received: by 2002:a05:6000:2310:b0:435:9770:9ecb with SMTP id
 ffacd0b85a97d-435dd1cd9d7mr13423264f8f.56.1769697396688; 
 Thu, 29 Jan 2026 06:36:36 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131ce93sm14535267f8f.24.2026.01.29.06.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 06:36:35 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0A4965F878;
 Thu, 29 Jan 2026 14:36:35 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH v2 2/6] target/arm: Report correct vector width in
 gdbstub when SME present
In-Reply-To: <20260129113455.1283266-3-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 29 Jan 2026 11:34:51 +0000")
References: <20260129113455.1283266-1-peter.maydell@linaro.org>
 <20260129113455.1283266-3-peter.maydell@linaro.org>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Thu, 29 Jan 2026 14:36:34 +0000
Message-ID: <87o6mc8ozx.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

> Our gdbstub implementation of the org.gnu.gdb.aarch64.sve feature
> doesn't account for SME correctly.  We always report the Zn vector
> registers with a width based on the maximum SVE vector register size,
> even though SME's maximum size could be larger.
>
> This is particularly bad in the case of a CPU with SME but not SVE,
> because there the SVE vector width will be zero.  If we report the Zn
> registers in the XML as having a zero width then gdb falls over with
> an internal error:
>
>  (gdb) target remote :1234
>  Remote debugging using :1234
>  /build/gdb-1WjiBe/gdb-15.0.50.20240403/gdb/aarch64-tdep.c:3066: internal=
-error: aarch64_pseudo_register_type: bad register number 160
>  A problem internal to GDB has been detected,
>  further debugging may prove unreliable.
>
> Report the Zn registers with their correct size.  This matches how we
> already handle the 'vg' pseudoregister in org.gnu.gdb.aarch64.sve: we
> call sve_vqm1_for_el(), which returns the vector size accounting for
> SME, not the pure SVE vector size.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

