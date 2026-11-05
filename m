Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C11A606A328
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 16:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RD4mFNvm
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOzxx-0006et-LH; Thu, 05 Nov 2026 11:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xOzxp-0006Vf-IJ
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 11:05:21 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xOzxn-00055P-7m
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 11:05:21 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-491971ac844so630829f8f.2
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 08:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793894716; x=1794499516; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=MTD+YMdenV8nPVPhjGdFh71FJfRNuOqVrF2HphRsq1A=;
 b=RD4mFNvmXDn/0vC3IMlVWZ4VJsDK3SnGbmCoQbYMNrBlfBHCj2ZYmP/UU+We2Jw6TO
 Mm2rIk5j4qhEvtNQqrAOOc3hXW3Pf52LSWLkPBdfFsMipNLBL8K881a4EYYnXpYUtzMN
 e/5XztZBA7LzttlFGdmbS5FxVQrT1BVAfIPXbZDr163lzR1lMpfZ8tyCDOkO+QfvFLeu
 43YjXpcPtVj1DNzbhxEX7li6dzlfkojhRvo0u65wt+Wkkzad2rplLQ8tbUGufr+3xvPX
 TuCJO6roOdoILgNoDKfeP+new9B1PEDL8QCd7JZgyKuRw7jbyTvZ1VcS0/kb5sM3Ahbp
 TZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793894716; x=1794499516;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MTD+YMdenV8nPVPhjGdFh71FJfRNuOqVrF2HphRsq1A=;
 b=0Mda/BsndIhA1gahefOD+Mo5Sz5wUgfHamoP1GLW/S9f/BQMBNBVHADtOUSoKFFqHz
 vhsN89dxAEgqgWSyjwANcFkWtHaDY5V9VpeyRLdcWXgERvxG+stXMUP09ICzgjg5yhEe
 4BqdBd2bRy5NI3wgUwgLktW63fO7EX2bzNxwV2FY6pHhzmFJkwA6D5TYlQmifFnVkDuh
 K6OgHxK4wA4OmUdrYCx10IA38GN0+Jto2l0gp23mGLTxvXcjLvz9EBQZJk0AsOk/YWT4
 4ccNQq24Jq6m1XKFj8Egnj7c6KM3xlWMIbbmLhJOy+a5i0CFG+EqySPeqYFpMbklYYPi
 V58g==
X-Forwarded-Encrypted: i=1;
 AKwUvByfBjSzEmRUh8SckGVo7qJXoU8tK1x8AehvBUWQeQLI97mNR72M3qpntfH2Ka8UhgfWGW1HAKIYZA==@nongnu.org
X-Gm-Message-State: APuU4Z+PMYBxPR5ODqr6lbrL6bdNVwb/CiweNmg6S/L7j9kwTIwH/xB2
 TMmaz3gZxYaTwzu8ZEVF/B4ksGZWcLq9WTYN0/ZSRxKsvUe++awdXz4fBtLROOh3Nb4=
X-Gm-Gg: AYBFou1CQE/FlYmphT6AmtJDFCh4c9dZcqbl7qXXpQ2M7DYD5Uw8wfAcCaSt8aCIoRb
 IwB87Obu6qUauY351SCNFfxN+/fipOl7MeZxO6bVlABJpqdwaiaa1/NOyoZYRQyUj5MV0sk/I5v
 jzMRSUqrhevzFWq8HSn/RlCxSoN3DyiBI69oXRxZMYnYrcgCCjFqrWuNXiXht6ZmXre0PU5qTmA
 uwDJOTWfqbAK/GpVm1C5dIzo37dBlCCeeLwg1+huspOLdfaWA3IvVZOHC33RQ8Npa2s9VJwPWht
 JoHDG/5Jic6HA2bL3ijVqu8Ga9xZ8inS8LGPL1JW9gupLDJiTQnyy7lxVIBMa3+lyP91PjL/TvC
 m16lvTJPdSM9kCXvP5iB0VAnRhummH+obbev49lesSECmQjNA93VMQZcWxZ/gDwrXcMY5nJ19Zm
 N7Lqyj6DhsAeRRbbqwlMGyeCXsfFOXUziaaBrUMx0t5m5RRDxmS1vlU2Np+u57KOVq+yxvuSDrH
 voOa+SQSfypmEYfMvpa6dqGStcm/+HYfWSsy5j9RJ/YTU7B483TRgoNQuZBjX3X6c1ig3eRSEjI
 4Qir2XmQMegBF5Lm/oXiG39zn6AB
X-Received: by 2002:a05:6000:2901:b0:48b:59f:db9c with SMTP id
 ffacd0b85a97d-492775f03ddmr79582f8f.53.1793894716357; 
 Thu, 05 Nov 2026 08:05:16 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec8d8734sm11354531f8f.20.2026.11.05.08.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 08:05:15 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B41E25F8AF;
 Thu, 05 Nov 2026 16:05:14 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,  Palmer Dabbelt <palmer@dabbelt.com>,  Alistair
 Francis <alistair.francis@wdc.com>,  Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Chao Liu <chao.liu@processmission.com>
Subject: Re: [PATCH v2 07/17] hw/riscv/platform-ref: Replace deprecated
 sprintf with g_strdup_printf
In-Reply-To: <20261105125203.40320-8-philmd@oss.qualcomm.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 5 Nov 2026 13:51:52
 +0100")
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-8-philmd@oss.qualcomm.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Thu, 05 Nov 2026 16:05:14 +0000
Message-ID: <878q376z7p.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com> writes:

> Replace sprintf() by safer g_strdup_printf() to format the AIA
> guest count / description, silencing -Wdeprecated-declarations
> produced by Apple clang 17.0.0.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

