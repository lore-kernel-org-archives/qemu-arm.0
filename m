Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7765C982FA
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Sep 2026 07:17:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8uko-0007CL-Sa; Tue, 22 Sep 2026 03:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x8ukj-0007B4-6w
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 03:17:21 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x8ukh-0000wp-FC
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 03:17:20 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd38e0e5dso53815225e9.2
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 00:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790061438; x=1790666238; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=LtpFaprIJbE5lud7P9rdRXmKqWACPbXQVY1+W2J+5eA=;
 b=oB49GdzN3c3xDeAbd0jqYwODW4LDX3j1DuDq9eXVSv3lFWWqs/33wet/QCkubnSUn1
 6TZfCX26leV4G5O6aSTLnWlGzNg3HY07etNELrVoVZ5n7y2iyz4qx1vY/CDDea+/7uj+
 9+Ru/LlM5RMqEkLUN0bDs4zslBE5H4ao6qnwo7rEQbqsZ59gjiNqCkaMJT7rLckEEeQ3
 rUK6Zp2mX9Pzws3+j+qzMioc8aiD+YIxzpMNDHCfXaSkrAjAnM8Y2Ty1CUEFe4t8NTXE
 5BbqN/mCCrxswyfc5ujkFORFhncxzTnXjfrhWZ4jPBR089dN2sdzNEMcrDZnnUuf0CZ8
 j5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790061438; x=1790666238;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LtpFaprIJbE5lud7P9rdRXmKqWACPbXQVY1+W2J+5eA=;
 b=TQffLUnngnrZhTf1Y+10sBDdtZkacR42J6IJL9h9GrD/F64QybmQ3u1ktuuJfMwk4b
 kwWwg13+j6Fola0yg9oXs/JYvXWjqVQyowYcJrYt4ITmEdLSXGrsab2z9po/WJxx0avQ
 vIFYdWwjArIhDP3q/42NNuetVPlBDY1V8VD8WHDX2UpVfzOcdSke6ezds+vrICg+4ppW
 u5wayHgAjzVXchf6Cug8a7JRoO9Iw2VZcBeNIYek5GmWkgpG2ewlBPkbeZLuqYbyJDys
 e5fDSa6bWFhT0PMe+Im/B+IpC04gdWKuHeGTkf78fmer3NspwLTda3gBPwYtYzEYtFzF
 AF5g==
X-Forwarded-Encrypted: i=1;
 AKwUvBz3a1UxWIOfSPClmSRrwH6BoUQoRAAxqcF/+qK6whwnSA/prbNS/7MUXtv/fVTeyH7B9dS/tKOXuw==@nongnu.org
X-Gm-Message-State: AFuF++ksZW7AxcuoV0siFjGaY8xj9tW9YpWBBswrBZRKt4rQj47I4mX2
 1UNrtt51xrm8zK+ewrF9f8IdYZCidrIpfAxUIYY4wPXFMM+738tOIAO8wfXec6IWj+0=
X-Gm-Gg: AYBFou0qDgB5l261coqWJUebC2c62nfTGZGUZ737pOxqxkkXJqzAgRyb+hH5yrhkjIO
 kZZFDPfzYSEauimLHr5m2dgTCPr3/tJzKGTQPrIsLgv3am1yd5NxeJTKqA9gTDuwmAfGNIZvdjX
 TJMU9CdyKUREQ20ORcoE7nMFJkZ4kIR3p1+2hX7P0SCn2fvU4xGUwzofGNVWjlJ4r0X9Bz6EHDO
 eo+QbkFBR89JybLOhdrykof9syT/t36eosd5wU9U7TT7BPPkXl2XOX5UiGkHG7zo8Jr1RNG9D8e
 dDtEjy0GqGx6MpWn4QklKyHG0Oo5TlplCql3E/cAVverT8PW/tIBnYQfmZkPkAbJlGRymIS8FwD
 mVfCJxX6lCKpaBkrmJlQrUm6YFmDwDEebOCwomGSWhAYYwZdLmw6lsXvzCB6taDbjz4tP8p5iWh
 s4/ip0qjfNc5oWp5i8I6/iokqXgH9O1cfluEAANiCCjF43nOMwDpWHMIqBfvgqQcXEMj+umg==
X-Received: by 2002:a05:600c:3b29:b0:49d:2450:68ac with SMTP id
 5b1f17b1804b1-49fc566e6e0mr181145125e9.5.1790061437562; 
 Tue, 22 Sep 2026 00:17:17 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48862774882sm2812191f8f.13.2026.09.22.00.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 00:17:16 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9A3C35F8F3;
 Tue, 22 Sep 2026 08:17:15 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>,  Daniel Henrique Barboza
 <daniel.barboza@oss.qualcomm.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,  Weiwei Li
 <liwei1518@gmail.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,  Chao
 Liu <chao.liu@processmission.com>,  Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,  Michael Ellerman
 <mpe@kernel.org>,  Portia Stephens <portias@oss.tenstorrent.com>,
 qemu-riscv@nongnu.org,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH 08/12] tests/tcg/aarch64: Don't leak memory-sve CFLAGS
In-Reply-To: <20260827050953.67184-9-joel@jms.id.au> (Joel Stanley's message
 of "Thu, 27 Aug 2026 14:39:47 +0930")
References: <20260827050953.67184-1-joel@jms.id.au>
 <20260827050953.67184-9-joel@jms.id.au>
User-Agent: mu4e 1.14.4-pre4; emacs 30.1
Date: Tue, 22 Sep 2026 08:17:15 +0100
Message-ID: <8733v121s4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x10.google.com
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

Joel Stanley <joel@jms.id.au> writes:

> The CFLAGS are added to prerequisites, so if memory-sve causes a build
> of printf.o and boot.o, they will be compiled with -march=3Darmv8.1-a+sve
> -O3, and the executables that link printf.o and boot.o after that will
> also get SVE instructions.
>
> https://www.gnu.org/software/make/manual/html_node/Suppressing-Inheritanc=
e.html
>
> By marking the rule 'private' printf.o and boot.o won't be built with
> SVE, which avoids SVE for other binaries, and is okay for the memory-sve
> case.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  tests/tcg/aarch64/Makefile.softmmu-target | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch6=
4/Makefile.softmmu-target
> index 3f30be6c5d63..196a2afa50ee 100644
> --- a/tests/tcg/aarch64/Makefile.softmmu-target
> +++ b/tests/tcg/aarch64/Makefile.softmmu-target
> @@ -51,7 +51,7 @@ memory: CFLAGS+=3D-DCHECK_UNALIGNED=3D1
>  memory-sve: memory.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
>  	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) boot.o
>=20=20
> -memory-sve: CFLAGS+=3D-DCHECK_UNALIGNED=3D1 -march=3Darmv8.1-a+sve -O3
> +memory-sve: private CFLAGS+=3D-DCHECK_UNALIGNED=3D1 -march=3Darmv8.1-a+s=
ve
> -O3

Good catch. You will need to port this to meson now it is merged though.

>=20=20
>  gpc-test: gpc-test.c $(LINK_SCRIPT) vector_log_boot.o $(MINILIB_OBJS)
>  	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) vector_log_boot.o

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

