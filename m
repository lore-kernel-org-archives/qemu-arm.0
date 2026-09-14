Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE497C88E64
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 09:24:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x62vJ-0003rk-PI; Mon, 14 Sep 2026 05:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x62vH-0003nJ-3e
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:24:23 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x62vF-0007Fa-IS
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:24:22 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-671061b015eso2899940d50.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 02:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789377860; cv=none;
 d=google.com; s=arc-20260327;
 b=BKTmamKr5yIKg4izsk3oBLfyBDHBDujf1kTg5wh+aVWGjmNhEsJo394T8eHZKoy7XN
 AkSmR3qjmpJJTEGQrfgM8yB5opz3/Ym7Re80WY1p+wLhyqV+C2tFO8IbstJ314ZOM5Pm
 utxiq6oZ50nNd8Wdufj+wQGgOOgYXfjplmWrx1SfAxBWd3IehZz2BCDArOf0QbbnpJe+
 oSMuusBvAE+j1Wb62XAIN3qjCZ5/Z7zU4PzxtsN369BlhYQC1+2vXr1UcFvrMXdgrh3Q
 ShncNDGcaDEWQng9zjEsct0cJgQ9Kl9XuS6FYbfJMdiHnsWaV8+8nOmVyhM7mQb1c4MI
 M6fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=S0jGCMEOwyERVB/Q6xGZYgF8vtoajFbOFCS95ew2TQw=;
 fh=V/gCb8vUyky/WpFGadW0bE1yr/C7lEWx09f+PQxSUvQ=;
 b=KLh73L8voJH2ykyAGN142DEbgaHpLPUuqOECKIqMCU6fqckbZTV88f2YdiRaLjavVX
 Nbx2EqoreNNP0szRLmuE+IhMn0F4EK7LxI/58JwXXXLoY3AapY3FWjhySqBoHcpVU4Vz
 lXiMx/OgvjBBMZ0oi2KjhmA3oSLpwFVvU/zd7KnhHrvb5QBSi4fzCwKxxOUgBUkagOAY
 +FlyjmbqY8TYc+/colBzL11TGN8IIRkrgAiFSAcXn7kX1A4K1pkiOczbr60gf2XtLKP8
 vwlqCqHGmwp7yhvc9m2Tc9AefVKmMzsG1X2C2f65KCtfTtlXfNbaixptCQnfnaFC62TX
 SQwA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789377860; x=1789982660; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=S0jGCMEOwyERVB/Q6xGZYgF8vtoajFbOFCS95ew2TQw=;
 b=vRSDUgICPynlM+LcZv+fANZVsdaJVoErxpItmRDw8tEagUj4EnBTHXaMvPBCzHPDo6
 hkfj6NBwdG0s2yU+v0bNKoanVQuJdQJNfuTu9EbEZXMx7q9dXo/VQan4ZE1sKMDQ2rve
 jcbJvcJt5RIujcRNtRFcTCH7YA1bRL6WVdaqlynDYuFMAZrXM5+6Df7gafe9vX+eMoXT
 lcmVMP6cBk2wHYPuVbuTLnYaZujBq3Tnz8hYw5bali2y5FAGnQ86JW4g9kLz9bW62tIa
 kcUPxdk0PNL787f5yBU0bsXTU3qnUJZ001HbGs66HtFx+LaB2alQ/gUfYbVJCCF1iuSt
 huVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789377860; x=1789982660;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=S0jGCMEOwyERVB/Q6xGZYgF8vtoajFbOFCS95ew2TQw=;
 b=f5vv6hDs3hvs2RlOf0RZZv3gOB7w3TpgB6TokNmdLVAmqKXIL9X2wEBCbk4bDZhmhn
 UGfgs/j4Dx0/OHXLZ01qmPBh+9in8lMwWg9ZbO/PIA+jyZ9m+osk1DleSbS6/dhfRKVA
 VF4sZ/rNL7xT1M1uCgjNPpon2D+134OP5ytNrnSSIWMvBJRlBhFBQuysnRzue8eJGWsz
 8F2gs9b+exexF2ZmPnsJuMqz+K44ZtOgZ3oEWBwOt+TgHk0vvnbJ5karzy5sY34eeXn3
 ERwxpDk6Ikm1oYW1QkR4uXS4ripD1wKQcSnTLwlx9oaCW+aIY1XxUOrO1lOq+cjVx/90
 CLzw==
X-Forwarded-Encrypted: i=1;
 AKwUvByhVohZmw6g01NuT8ECh4nXlZ1Qhb60gx9xNS6KuG1XXh5b1Wludm6MkU6XXBYr7cQ8dkewRs7Fuw==@nongnu.org
X-Gm-Message-State: AFuF++mFx2JVyzaWvnrYi4GvXzoj+fZX1IfNfFrxd7fKKH1NTi27jGon
 0qWJYT9rcD5BzVWEXCNGuFHsKJqOk24O6L8OVNbZcY29M329Pvq454RnZpm9JAomm0g4P/OIWIZ
 zIbOXO2t6jQFGpzBsPWzdr/dpMZ1SIn0i8iKqtSR30g==
X-Gm-Gg: AYBFou0i5ydKeh+K+tW/jHO0+8UIHCYb49oQPOCYbHVuk+1nup2CkDmLQZ9P56qUqmS
 sb8hUSl+DD1Lmz6wO3nq7/DoKYKtPn4Eix6wla704Gy/LKlNNV2c8fZFXB2Vr6dkBsUz0na+wRN
 zgh8+mUqTq5Q39oZSiy0dhUYb+I+/i3m7to4HRAz+gA+HR1gFRJdMGmiRwoTDtue/Ef8Og+5MCU
 AGKCEGQ4wxoX32n+xJZOntY1gD/tGXzO0MXicLvEw3o5Q1eEtMWzRfWkGK3O5IgnPlbXppux510
 Jw85VQfx4lwW/tT1LI0405iSZTd/urZ1LrtJFzPMCHZh3IqEoDW3pnMD4U9uIAQKqjsRHveRzUW
 LCEXZxubTpT8Tqx9qJYDMVdbIfZrtZI8lUvw8TFXkB6PzKxuRbN4=
X-Received: by 2002:a05:690e:43c2:b0:671:1bdd:899 with SMTP id
 956f58d0204a3-6714dfca922mr163710d50.13.1789377860361; Mon, 14 Sep 2026
 02:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260902165956.582901-1-alex.bennee@linaro.org>
In-Reply-To: <20260902165956.582901-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 10:24:08 +0100
X-Gm-Features: AcwNN1ULYW3B3qu_DEXBe3GgXmkfVuKpbMMw76NrNQQMKv1auyBqB0MGiCPo2o8
Message-ID: <CAFEAcA-FpLppmxP3bTnPhyz2b2=KQHQkTaw3LNyc482=TEV8QA@mail.gmail.com>
Subject: Re: [PATCH] hw/char/stm32l4x5_usart: Accept character input upon RDR
 read
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Samuel Tardieu <sam@rfc1149.net>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 "open list:STM32L4x5 SoC Family" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Wed, 2 Sept 2026 at 18:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Looking through existing serial devices this seems to be a common
> pattern so it makes sense to me this is the right fix and matches the
> API description.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4389
> Reported-by: Jan Brittenson (@bson)
> Suggested-by: Jan Brittenson (@bson)
> AI-used-for: fetch issue, apply proposed patch, verify build and qtests
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

