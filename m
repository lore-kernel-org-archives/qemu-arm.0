Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7FF606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 17:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hBA9PWHk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWznP-0007Z0-3d; Fri, 27 Nov 2026 12:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWznD-0007Rs-8t
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 12:31:30 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWzn8-0001jV-Ve
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 12:31:24 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4bb6057b333so41094205e9.3
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2026 09:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795800681; x=1796405481; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=lobLpy3S0LVwWdkajhsOIiqDpjfok6+aOoN6TPxNluI=;
 b=hBA9PWHkwN2ZiOwUBksNKe9ntJx0FzpiFt+F9ekgp/gzN4vJJIadJ4gI3v/sJpBBU/
 89ChcqXf0cA53EHJNzKUrF1RdGtZ7FNxD7r+vPK+ydO6lsrf0CTzaIxniLwLlVH1xRcZ
 GyUWXeTd4jgtZSgGIeoOisi7ZlRi26UjiDr856DNEd5ZRY01vy8iankr+mI3cy7qP+/a
 NWYkvgUeeWc+tTUxSxs6nXsXSRyheHlXTvaYmkPUIWzl3opsK227eU9xHBOpGcfvSgYV
 2VSgXBT0JVVQ24NMFBrH+VR9C254qDxCJdh0iVmZFRpikSxdlmL6ZNr81WzDbN4b2Ih7
 GbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795800681; x=1796405481;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lobLpy3S0LVwWdkajhsOIiqDpjfok6+aOoN6TPxNluI=;
 b=JUK7YKKELopupWaYo3dMN2tzY4G+UkBPJ/oPAXU+78brStOfoUzs0ntY4YLMIF+PDF
 3OKC5b6F7HOuOMhVkI9bZyub8BqQx00VeI1IOLBhXS13AFNzeKrRQzdc8sq4XrNx6pqo
 27lAAHodHO/a2yS/RS88i+L9jOZEbocpR/0rJgMg8fFEDpHvXG0I0UoInFWzqdFofnqy
 AygKepOwkJeNewWoVqLp94uve8LyH3cm7W0LbIO4SevMn0lFbPpyJSSaeeM42UgOFHRO
 vF6Bu5juSe1OhudYwf68bNrj5YNXsLOkyfmJugOqAWWjO6PEuyy4T+aQqnlawUxjcdQU
 idXA==
X-Forwarded-Encrypted: i=1;
 AL+hErFSppF266LZwqqoIeNhPSS3iB/qrc1FESwvrBTPzGc3M5xujPVSOswS0sInIxexq5sIAkKkfgEEDA==@nongnu.org
X-Gm-Message-State: APuU4Z+c8GneHAEf4FumLi8PNkrSY5KLN5kWJ9QSbKTVyFZJKy1xXv4i
 KizRY+4to990arzzHosQEGz+6GJaCcC433BS3kUVk88LiIYV2SjfrUbXR0EQZ+jkZOE=
X-Gm-Gg: AZFdTZdeZhvMt1YOV4dfUUpuvwBsoOMEGOIJPNx5TT2kFZKNOvMkGS6CuRuESYS/A+t
 GnfQqWwIxL9tOP6nbRHRJKweBvz4mdyAjj8l4ohgmynKlVTSEtkHn7RW++awNa4FrqcXbJ5elLb
 KTpazHD/40mIjpOXpuK92x8DSooEJmTQAkIFzDnVMTxaNOhmCH+uKOzNC3EwDFmEY0ZOgN7IZ1F
 fg4VirhoGJeca/zLRxoGI+sks6VZZsm29B9pmuY29WTzmVmxGeMEXthCQvbZEwcOeHq9zFa3x5A
 dC1Lh0EkoiHq+U23E35Bzs7Vi1pvjITg4euscdzYqE+/TWEv64Zsc847ouRJ7E/kl3CtaU+6Jja
 JtvLWjZdepitBw45HdY7WW0WFT0TnKglPHy0EVZJ2ZB7vMjMaKR8JdwFXM9YDCrlgKWlpbguIM/
 TvudC3GizSuZ0Aq1g1kExyVSMLmsYTZ/+KwuXsJl8ZhB7XEM4wXu+sboBoX5JvoAtNXYYLhNamb
 yzj+e/B5OWCQj6r+NHsoFR8IzMi1IMyDyu0UHDqEC2BCXxBj3CbKFTkwLBOy7egB2N9+VcOYAF9
 cNtq/x33qLAqz6qdUrNRFx7HXavd
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id
 5b1f17b1804b1-4bb8881921cmr507788735e9.25.1795800681223; 
 Fri, 27 Nov 2026 09:31:21 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6ae2dd55sm46961171f8f.30.2026.11.27.09.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 09:31:20 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5AEFF5F8CD;
 Fri, 27 Nov 2026 17:31:19 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Maximilian Zimmermann <maxz@spacecubics.com>
Cc: qemu-devel@nongnu.org,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 2/3] hw/arm/scobc_a1: Add mission bus UARTs
In-Reply-To: <20261127-add-scobc-a1-board-v1-2-b572280dcde1@spacecubics.com>
 (Maximilian Zimmermann's message of "Fri, 27 Nov 2026 11:13:35 +0900")
References: <20261127-add-scobc-a1-board-v1-0-b572280dcde1@spacecubics.com>
 <20261127-add-scobc-a1-board-v1-2-b572280dcde1@spacecubics.com>
User-Agent: mu4e 1.14.5-pre2; emacs 30.1
Date: Fri, 27 Nov 2026 17:31:19 +0000
Message-ID: <87y0aerxjs.fsf@draig.linaro.org>
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

Maximilian Zimmermann <maxz@spacecubics.com> writes:

> The default FPGA image provides six Xilinx UART Lite instances on the
> mission bus, which firmware uses to talk to devices on the base I/O
> board and the rest of the spacecraft.
>
> Replace the unimplemented devices with UART Lite models at 0x5000_0000
> to 0x5005_0000, connected to IRQ 16 to 21. Factor out the UART creation
> into a helper shared with the console UART. The mission UARTs are
> connected to serial1 to serial6, after the console UART on serial0.
>
> Signed-off-by: Maximilian Zimmermann <maxz@spacecubics.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

