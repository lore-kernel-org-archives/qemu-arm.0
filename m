Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0B0CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 14:45:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ4e4-0003yP-Vm; Thu, 21 May 2026 10:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ4e3-0003wp-HY
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:45:07 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ4e0-0003Vq-T7
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:45:06 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-44ce78ab5feso5269870f8f.0
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 07:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779374703; x=1779979503; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=783MGJ2QrLOoE3gfkfV0O2PFHK/94YQhK6UM2ldYWwI=;
 b=yOrvwrEbGebbX+ph3kYrgA9PGzh2IbeWZNGcPnZufRL1yo44rax7npLCdF+NA5q5Xc
 ctzuhMpAxVDQ7cl7iDzLsUoBq37mygOPCIfb39p/XDri5sUif4IoKFIOFQTXmpxCNCz3
 2MYF4rXM2zBg08nxSdAzD6TJSK16TiLQy0Iu7wWpn7YkrfIVNRLx8SFWWPblQSlr5lo+
 rkEsRphedUMFP1fD5oik+y7FwvaPWv/pvwl6qUYK68Lau/pS9AXN21oIW0zW5K+MBG17
 IMB+2xiwSJjWM9dOwihJi5DB6KuWPqqdcre/KLuWCY/QIxd3HqgQz6E8/Haxs3YqWTJf
 RFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779374703; x=1779979503;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=783MGJ2QrLOoE3gfkfV0O2PFHK/94YQhK6UM2ldYWwI=;
 b=O8wvwTT7tWk6hNhV86LbJasF6iVBxCPtGlgBa8AgoaNC9hUWqiXNZXinkGjzQ3fg25
 TZmnys1SQH9EqvSSEoxppFN9AgXi9ogj02c/Bfi7ukiL0P4xyWkzziotzFuD0kx2+/fF
 Par2UHUV3c2Cg4oiWKmQ5EfbJc79h3TKZ1HmTWVdXH7exMHA6bbvQJOlS491V9rqd0Vw
 NWsmVC2PJbVqGo4sH8KPv0w4aodqDc2o3uoRzvizDQ+EhM62t1w6WClVa2OdMyrOOY+G
 i0kuX1fyzVHHupxr9iJisFADN9OjM3CCY+HyHi2LgzCsM+n0W6pm9L1dcZ7/76aQA7a5
 EpDw==
X-Gm-Message-State: AOJu0YwByiOg/wiTuxU2m75J6tkGG9TpJDE6319K2f3xGROtFcZSz7Kb
 EaVn7se2F8VVxswT90RsbN1/VbX5srrlfvp7k3mnO4EKYQ4KRH90EIBEL1/p/HBgBUs=
X-Gm-Gg: Acq92OEVBgDYKSeIPsmteek5v1hZy6vpI+JZ0nz0z3L9kVIsjjsM0/gtiJ1JodLsMcm
 ksgrpIVptTnbyGK6K0+l5h+X8NykYVNeCof9UJOSaeQ8UtNH+05kxItKekgdxAM+JPHlr/04uGi
 VYDe5HQ6TYP+C1j4AyAKlJ9BsAHj4GW15RX9nT9pvLp+0gJW3ThHc3OD9Wd9aQwaAvfo6ro1myY
 GMs1mgJKwI1K34MwGVq52PmX2hkxAPVCOR8jB8o2Rk8SpND1H7IkNlgP3A+KS04yP8EBAHTBH/2
 jWx3VOXhAiauqwesZ4X6AxH/5wpl5Y9HA/OGqILGrNHg/mv3a+zrZDRWt48g7emR2zQReLeLDCf
 kNZrFel/hNyFD7l93LSqQiOjqrb00d4uvM7HfVcSLGZZhcrREN76Pzf7fbSxuaPAJuLQTAee326
 hSDPkCu4oUC87d0+wmM/nMCrqKHRMzSBpzmw==
X-Received: by 2002:a05:6000:25ed:b0:44f:da26:cbb4 with SMTP id
 ffacd0b85a97d-45ea38d9f0bmr5368576f8f.21.1779374702745; 
 Thu, 21 May 2026 07:45:02 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa9358d0sm3071266f8f.26.2026.05.21.07.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 07:45:02 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 213E05F886;
 Thu, 21 May 2026 15:45:01 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-stable@nongnu.org
Subject: Re: [PATCH 1/3] target/arm: SVE2 FMAXP, FMINP must honour AH=1
In-Reply-To: <20260521122913.1565011-2-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 21 May 2026 13:29:11 +0100")
References: <20260521122913.1565011-1-peter.maydell@linaro.org>
 <20260521122913.1565011-2-peter.maydell@linaro.org>
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Thu, 21 May 2026 15:45:01 +0100
Message-ID: <87se7kom8i.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

> The behaviour of floating-point maximum and minimum insns has
> some odd special cases when FPCR.AH=3D1. We get this right in most
> places (for instance, the ASIMD FMAXP, FMINP) but forgot about
> it for the SVE2 versions of FMAXP and FMINP.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 384433e70983 ("target/arm: Implement FPCR.AH semantics for FMINP a=
nd FMAXP")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

