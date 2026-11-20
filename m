Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B2C606A326
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Nov 2026 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P8yuglRe
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUQFC-0003Ef-US; Fri, 20 Nov 2026 10:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xUQFB-0003ED-Mz
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 10:09:41 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xUQFA-0007Oa-2C
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 10:09:41 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4bb6adaf0f1so8740435e9.0
 for <qemu-arm@nongnu.org>; Fri, 20 Nov 2026 07:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795187379; x=1795792179; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=eXjlIdzRAyPiGP26Ta4PQK01jIWRUA7UZbAweyQ4rE4=;
 b=P8yuglReB3wkjd1Ptb+bg0i6pK3Aa5uRpHBHHNmIMqRCUn4ywOpP4n/+BgH7pE46bJ
 +grFIz3Ux0mapIoANDUjouk5RDqpnRN7Ztd5J6+QTzlRY5nCqT6/74oXkRKlG9pVxiOv
 aaSQ0U4ig7ZrScM0unysobEo4HkPJ0goygprb98KZljbsn8+zJDi3542qEjIHa/tVVZM
 UQZ5BRxYGEgYlswoLXntDnQdGKV+forc77q17ueIh7VgqS9fjM4y3k0CinI2JenLJzsm
 lourcbJLkUS7FW4CwfRB73OJUpUNgd9MU6F5OZtzD9TIy0huwZ5n6+8dWJUE2WE6D1+f
 f1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795187379; x=1795792179;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=eXjlIdzRAyPiGP26Ta4PQK01jIWRUA7UZbAweyQ4rE4=;
 b=anWwFIf3LKJqGsGoRmM0+AUdTd0s+lKyhZNvT0JQllBWeU48oG2kAApa900DGDbj+l
 EkDJAPpJHym6IegZfenoI5KXkrSN5ljqRIqvQ/SvecvVIecoVIfLFsaC+2hfRtKHCoE7
 fXadfENYGPCW4/fUH1Kytly7QbelM8YIH4ZSOGsH1XaTShbwR9UzsvBtNfhU6nVvwj0e
 n3BNZnQ25/WHGnQJDTfSHeNpIfFkXUBZ9zjh07y1uzTFso8BNPtLl2dEgg1/gMC9+nRC
 MBPbWQoxxT/gO0bLv9/nN+giR0pDY3+p8lt8VhL9CVrKZ8c23aCSTm+4x2FrElYs35D3
 cDFQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFTsE82VDcWs7J5CNjlqcYX5VCm7FcjduJAY7qXPjnr7cd01pvLdaxjgel/Mjh4zMQ+whQU0RhVcQ==@nongnu.org
X-Gm-Message-State: APuU4Z/VEWmXy/0aIKGglBMvoF+u7cMUbiH8bin7I+/1F9PAkSu20K8w
 fiw6AsNvs7+/wXmShKZKoPq0m30dugCvjmmKvJ2Kv9KddCq27NbsC7bI+HGgR5Jv4rY=
X-Gm-Gg: AYBFou0pjmeGnQvq5hUgs5C+WTWByvhv5oinQ641vgb7lljSKRrdSzZ2gcc3YG4mGGX
 WksveN92nm0ErTaQMJtPZZO+nBpv2y4rPx8kle9VZhVzDyiz5WVcGpCc9pQi1X6853ZjZNlT1eR
 WOX1MkZVwKQeelscqbJUyKZYdb89/gB746LfoagWhpqIcZYs2DXcVJSoHmi3od4TjjLWjN5nPqJ
 35X45PviGpBfcwpbO6WXjZoWM4gWjouzbqYm3h+qxuObN4sBH1vw/mHKhO+VvVPgZpUg+kB/KTf
 c+QxXhAttNDuwwvBq+EdBw8SCCxyo3fwQxROl3wXoP9Ap+UPhM1dTWctr2JvZPfeJ1fxFWSd0Y/
 lsi1+1Z6hx/AYtsGCFkCeErds/v4JUxdSj6kRxkyVBYz+gd3WXPhjG0+yBbw8XPgp81s3Arasys
 PDBWXnu4dud/NchSePMObuqYsxvzoE+dmshWHtwx7uW3AVjgRC/B18MFTGoJC+VeWUjwxED/9qU
 d2bT57VO0LOKxhZTezF+oSD30ZdtiQctklE6gpXctNkl5jRzTf/3CzN6kI1nHnM/IJlm/QGEc9V
 dNuNj4ZJkZzbPROEaqqq2xodJTsUDC4N2Cf4gVs1l5oN/3IIV/A=
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id
 5b1f17b1804b1-4bb8881c630mr83051225e9.27.1795187378555; 
 Fri, 20 Nov 2026 07:09:38 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2d60sm6141798f8f.3.2026.11.20.07.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 07:09:37 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DF8A35F7FE;
 Fri, 20 Nov 2026 15:09:36 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  peter.maydell@linaro.org,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Kuan-Wei Chiu
 <visitorckw@gmail.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Alistair
 Francis <alistair.francis@wdc.com>,  Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Chao Liu <chao.liu@processmission.com>,
 Joel Stanley <joel@jms.id.au>,  Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,  Michael Ellerman
 <mpe@kernel.org>,  Portia Stephens <portias@oss.tenstorrent.com>,  Halil
 Pasic <pasic@linux.ibm.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Eric Farman <farman@linux.ibm.com>,  Matthew
 Rosato <mjrosato@linux.ibm.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Zhao Liu <zhao1.liu@intel.com>,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org,  qemu-s390x@nongnu.org
Subject: Re: [PATCH v2] tests/functional: use immutable tuxboot kernel URLs
In-Reply-To: <20261112133320.418012-2-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Thu, 12 Nov 2026 17:33:20 +0400")
References: <20261112133320.418012-2-marcandre.lureau@redhat.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Fri, 20 Nov 2026 15:09:36 +0000
Message-ID: <877bi75ykv.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> tuxboot rebuilds the 6.18.54 kernel images in place, so the URLs
> without a datestamp now serve content that does not match the recorded
> hashes and the tuxrun tests fail to fetch their assets. Point the
> x86_64, arm64 and s390 tests at the immutable 20260930 snapshots and
> keep the hashes that were recorded against them, instead of implicitly
> switching to the rebuilt images.
>
> Do the same for the riscv64 6.11.9 kernel assets, which still used
> non-datestamped URLs; their recorded hashes already match the 20241122
> snapshot.
>
> Fixes: 8ac1aab21fca ("tests/functional: update arm64 tuxrun images")
> Fixes: 09961fafc5a0 ("tests/functional: update s390x tuxrun images")
> Fixes: 467c9eb7dd31 ("tests/functional: update x86_64 tuxrun images")
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

