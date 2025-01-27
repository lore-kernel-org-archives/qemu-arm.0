Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2460358njk;
        Mon, 27 Jan 2025 06:07:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW0L7CS1X1owUdPByEeDLglAOmTPOZw7gC/lMmETHEtA7VcvN7iRzhoTlPAHC7p8mK66TH/7reTniEr5A==@linaro.org
X-Google-Smtp-Source: AGHT+IEsq68XU+kIpFtgpYHpKT4OnLyA0BVdJICKzkD0n1nr/A3+jUb9asUgoQDbHu2/Q/okx2HM
X-Received: by 2002:a05:620a:2416:b0:7b6:e8d4:9b89 with SMTP id af79cd13be357-7be63249708mr6032505585a.34.1737986845774;
        Mon, 27 Jan 2025 06:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737986845; cv=none;
        d=google.com; s=arc-20240605;
        b=bZv00XPCJMID8PDKUV833m0ukzZy6adDy2bo+qf7bIhMOf8Sx0Al9uqXHMrmNkm37F
         kQX8V98/Mwr0nhMx5ZQ/aaiwJicDWLs4XO4GO2Fvvy2HGqMLQcENSRS/hnhdwjEumjFk
         E5uQEApt7FrrjogSJ8kbjFkuMHw5NGmRHha7ohXNzXv6XEAGbVpNUCajsYDv+NXH1tZz
         ofwh9ZllUC0+6lUgqttBbLMCS1H3ROtRF23NtYooqtLYyE65FlbleUUdusCu3bvDlW+h
         4navicxo93LRaFSL3CVFX3JrqkfpOkVjAbzGELihBtKi6ruVcSYpdk/WHlDtIEr7NvGv
         VFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uora7f7BTfYvMegFw8XG2TVR2DRXRe8oGNu2WeQsM9A=;
        fh=e0W4oAs66TtCnNNhlnw2xJDrIi2vuc0WFgdK2dZGHqg=;
        b=Wbp55eDR8Xqfmzf7eacG9AKOLrJdaniPtvTidJpWqEQBuYfsqTQmJ+SCrzWFDSqI/h
         b6hK7ypsUfWPRX+Vof9aN/IIDL4dnJ1UrcFVSUhujm2RN0NrTRomI2ISgdXCJGS1lyaD
         TC9E3Gd0OIfeJ+umgevR/TYwu6VLuewJluqGW95JycE1L0gBjq+R2X86SEpFYhTv4dls
         5KlbZL/xrBgM+GsUF/sNGH294jMNlRZbah9ttAE33cYa3OrJ7+1hjqHjwUugij379E8q
         Jeh8bHJGq0INZUyVwWqGwHkViWq7LvnQElc+gJCdb5YV+WiKOc6asoZQpezqk6+IgKAs
         TiJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZCInhUBF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae83397si978782385a.79.2025.01.27.06.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 06:07:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZCInhUBF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPln-0003qa-J3; Mon, 27 Jan 2025 09:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPlm-0003hE-01
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:07:18 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPlk-00010m-GG
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:07:17 -0500
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e549dd7201cso7897105276.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 06:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737986835; x=1738591635; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uora7f7BTfYvMegFw8XG2TVR2DRXRe8oGNu2WeQsM9A=;
 b=ZCInhUBFDwgG5vRZsIk5o971ZF6NfD8gT3vEjy7Ddumhcmv5vipiNxrup8gePioF3p
 76Ihi1BQPThYX+dNzzHk53k8GncONNUjIdE2cr18Vyft46o6RNS5eiV/e5TAMA+cyLdP
 NU2VxOc1mTKnZjGQUtme/0XTIT1vYU8NJuov3kbgXt9casrE0JBB08XpBHtruBRZC2FO
 bxldN4BaKM+obdKoQMRolJLxDL2awycG4HX8tHaB/k+ZhNSkqXUFcHw2hQNkGiphnRgj
 njNtSua0O7aLsZ8tZUpMz/3QQ9XtE8uLWT4BDbyvWb/YxOKoQmTZn/2G3yomV2dYQLWE
 fZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986835; x=1738591635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uora7f7BTfYvMegFw8XG2TVR2DRXRe8oGNu2WeQsM9A=;
 b=ZNKh/pUERHSJ7m0JexPwut1+Fpf7xT60RJOJLncbz5jHGIwjfvbXZq6pPdxy9tLrkt
 VQdfBErZQTfgPgIHZixcKn3oMjfayJcu0DcLoK+NkyiSF+HKsXY/bMEx/FN1acRpVHWV
 l87WEoP2dC1qviguag7kAE1Q+1Qf5PdWtdCDu+Hba0YnoFoAYLR3pw2+HI/OxmzJ2nzD
 vTWh4t2be3ni+a7kgHIq9IIpgbd7vOKlA9uCnJ1ACBTWLVAcG/TcshhQEcnvwiltt64+
 z1jzGCzFAfFtkej7WIKtxLXVbFvGqOvrpT0gNtP4gYzSYmr6BUR7taHkP3MnAxSoduUb
 sBUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1wzCD38CoJYf8tS4Lx9aq8cuA3wUDC6i6PC2lvZzmN7GAU8+Ehroz+8nqKdvv6xnK8kMuKBQsig==@nongnu.org
X-Gm-Message-State: AOJu0Yz34TlGhgRk8c1ytbWMD6xWWnKrh5u/CvCYkxxrMPaxCxj9VZ8O
 uxLM62NNdLYl20u0bpBtr+1w3rzdDjcq3EqX3+RuxiGleZoSZZfCvK4BfMLvaOzrKsvUEIn6kMG
 j8jPok8V05lFSRwFM9fUaKeT0/fDzyxJpBiwZGg==
X-Gm-Gg: ASbGncuNu2ZO/jlBxLIFHyjbTcfJvvDhyE27r7cDQR3VwOkK7OkEt10ch8Yg1DMJM6/
 vGAr9+mz6CRpjizmyi32+HO9HaKfhbzzKqlFz020De+Hg6UkHEWzDSJOpaG5qQ24=
X-Received: by 2002:a05:6902:2202:b0:e57:f5b5:dbd9 with SMTP id
 3f1490d57ef6-e57f5b5dcecmr23019716276.47.1737986835499; Mon, 27 Jan 2025
 06:07:15 -0800 (PST)
MIME-Version: 1.0
References: <20250110160204.74997-1-philmd@linaro.org>
 <20250110160204.74997-6-philmd@linaro.org>
In-Reply-To: <20250110160204.74997-6-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 14:07:04 +0000
X-Gm-Features: AWEUYZlAkEWhV99FqBXUNgk3QJJI9YQRuVkWrrLl80b3Y4VYBg34FGOwfi-lWek
Message-ID: <CAFEAcA9CqK0BM5C+GTJ_f57uNStHVrTfKk=6W4KdsNh7AiiscQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] hw/arm/stellaris: Use DEVCAP macro to access
 DeviceCapability registers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OW4omqsoWOtV

On Fri, 10 Jan 2025 at 16:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Add definitions (DCx_periph) for the DeviceCapability bits,
> replace direct bitmask checks with the DEV_CAP() macro,
> which use the extract/deposit API.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/stellaris.c | 37 +++++++++++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 8 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
