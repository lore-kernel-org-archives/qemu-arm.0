Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C387606A31E
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 12:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vbnbMzsE
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVT22-0004jW-Hb; Mon, 23 Nov 2026 07:20:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVT1r-0004hE-NN
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 07:20:16 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVT1q-0008S9-92
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 07:20:15 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-679aeeddc6bso2811133d50.2
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 04:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795436412; cv=none;
 d=google.com; s=arc-20260327;
 b=omkx11AQLVtKDsdD17eaS3255x7950vFFMDhvN3gSEjYpSOSGqbLT3MCU7RFltRBrB
 Jcz7WiRg24xzG2pJiXkhvVBSuRGmEcZCzErYvjX+0ZtKXukQY2FRRjBxoBUDeKeiwS9D
 bMb3dMfntobRoUswRUvfkgeXhyao9aQVoGNjc+sMgEma6FukMjEoYmJmoVUPo17XvtDe
 dSma9vB+joiR4xugi/gLuHZxQ4JIXlIOnjcZE9xihkflURp4YTOIonyu6as0ZI6zzXWA
 nblg9xSDEB79FxdH38wzLqCuvmCz2hOcAcAYmU29Ua+hU17jPAEu1MW2uNkXNVnYQm1a
 +XqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mPz4MWjNFQFPLH6jAjLZDCm2yugUXMclxPObktjn+ro=;
 fh=dBYaGeTL2f9Ey6tCaJAkuzDyf28KGK6Pfhwd/Fvje3Y=;
 b=ICoSwAyRotgpNuMvcPassNf6PCu9sw6ZcCGkPBd3lCvmhY+e5QJcL9n6+0C3522c2o
 1yihBAa/d5Rmvj70CvPg1Iu7hMo+OObZdGX1g89vkG1QvIm2nmsgv4V1c1mlgWQXF8uI
 ROKr8U4cDFWkAE3K3iSxz8B5D9ZWBLaxiQ8BB1Va8Ceim16o+2AwybblNQm2v/mFtT/3
 KYtEcGj+AnDON4MfQLiDTPMTRnAn9fvFqiQV+vgAyW43BuB6/X0l9oJtLykftbBb5G1A
 y3MEus3lU5/Xn0rOrdTENqsUWShAKc/OtabZUx5YgMq0xPIPGBh/uZqmXFVWy6y/EDfd
 d+dQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795436412; x=1796041212; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=mPz4MWjNFQFPLH6jAjLZDCm2yugUXMclxPObktjn+ro=;
 b=vbnbMzsEE1qM+1ho6U4vyQE8PrCe/e6nSWtipVGwnJLxv+LL0uRsu0qQPvA5xhlOeF
 DcaA4Z8eOsv1jr7j8oIlzJvKFJpuxdj42trFZEPwTSZ59yqhR7fXlIuv5APvMF9zM+Ic
 IKzNzRdtUtFzTM29KxutzeJli2/o3pbwC095OqfGwaB+UWV46iqRy8SJ4nuU/CdA1yZU
 clBKrs3GJZcjh5s9Ws458d3M0r+YRzAz7lrvreMozOl6NvmoH/M1eGoJcET367dEkTZE
 gZ43RBVALc/705OP77Gf0EKH0jYiOd8lrgQljxgvsxBk/YJ82OMHV2MMn2vRqWpBwIBT
 H7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795436412; x=1796041212;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=mPz4MWjNFQFPLH6jAjLZDCm2yugUXMclxPObktjn+ro=;
 b=FFKj5kE61WdhbIUv9zyohNkVehedbwUxjCRAORF7Af7eFrag4XkxgslX/M5aMvZ7u0
 ipkk2ST4MZ9f1MYltAp4wtVm1j/1m0I+gIbcxb9QPykkTKD1dP14Va0yhOF8vGGMpR0P
 v+smoCJVlRpbgIJgifcHpiAYJv7BLuopz3Or9IaMYk33cWKIlMy620SnpO0RBSzORca1
 Qm1OAvMbCmqSjbXesktuomdX6U0P2hl5SYrnLxrhMnmyjeF0X1HQBwcTQqdoU5ObgYhx
 s9b+n8COsZmaDDuxCTyJwGrypfkOSIWzk/9at0mmMvHwGhAclTDcYy0unRiR6PNnXgbk
 FkTQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHtZZ76JsVhYrbYcktMGLPFSmIlXlosTWOeGdnoAPTz22DE7r8a70zyisIirN7XpEyXwcTWSt/AmA==@nongnu.org
X-Gm-Message-State: APuU4Z+jPKL5aRBSlA4YS8SKw9o0hu9XFdHltZ8ZQ5vtUBboLjp34HEn
 QdxhsV6UcfdLP6w1Mwy2tnxb5d3C7AifKHmXM8BcAdnYTDs7X+eiwAyT/uceyl2o7UTYbJ9Yaoi
 68uQaD4WLWTDQIz+hygHEosFFSAT3JnqZiw3rdSp+MA==
X-Gm-Gg: AZFdTZfvd7W0WlN/MySWlSOdJ/8quso2sEl4WTzOiVWYwMeNvlTfFQomOGM6q3Nt4nQ
 Zq0YM67nKABycY0yadLU+hPnkQBjp9FdC6wpkue23RwmdgWYwjrU6ToI56t9sErVpaQusYMMc60
 yK9NdnP+VmuH986hpWJI+VnQO7+a2YQT+EvucOLOgYwZIPs64Lo5RQXLAfXwMQtm2xdEyiGLGVI
 4Dk0o73ampqsITbbzVoQkRqXt8/HQpPh+WUk2kzJKc9NE/Ikoy3g+txoWrCsNQcQusgdWrQUnjI
 bm+iUGyHsdNKGTlDU+PofjR8uDsBqIm1zvt22iB1L+QUF5V5Zlkd5BAGK/Fw2CklzfxdzfjFPSv
 QwCPWzvq80DV4FiPCR9fDU+ajM2yUWV1hWCBuB5oUxl68bZUBNH0w2TnMRyjnq1oV7bW/3nUYSm
 23cQqILfjgXnp0I7m8PeFh
X-Received: by 2002:a05:690e:4088:b0:67d:c305:ca38 with SMTP id
 956f58d0204a3-67df44521a5mr3881984d50.41.1795436412349; Mon, 23 Nov 2026
 04:20:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120124923.1656220-1-peterx@redhat.com>
 <20261120124923.1656220-5-peterx@redhat.com>
In-Reply-To: <20261120124923.1656220-5-peterx@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2026 12:20:00 +0000
X-Gm-Features: Aa3M54rsARZIkIE89AfyUBlIbzwbpyjpgm7BYbyI06goiIBWPfFRyhancj5QvOQ
Message-ID: <CAFEAcA_KaLtY21hnfAJimgdNFRiRBOLupsbshHpvXG7URgcKrQ@mail.gmail.com>
Subject: Re: [PATCH for-12.0 4/6] arm/machine: Move all VMSTATE_VALIDATE()
 usages into post_load
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026 at 12:49, Peter Xu <peterx@redhat.com> wrote:
>
> To pave way removing VMSTATE_VALIDATE(), move all four such uses into a
> post_load hook instead.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  target/arm/machine.c | 45 +++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 40 insertions(+), 5 deletions(-)

I think I'd put all of these validity checks into the top level
cpu_post_load hook, rather than spreading them out across the
vmstate structs (and expand out the _validate functions rather
than retaining them). That also lets you drop the comment about
there being an ordering constraint between subsections.

thanks
-- PMM

