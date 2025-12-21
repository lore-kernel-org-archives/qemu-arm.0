Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBB7E66886
	for <qemu-arm@archiver.kernel.org>; Sun, 21 Dec 2025 14:41:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vXKcg-0007bp-H1; Sun, 21 Dec 2025 09:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jackson88044@gmail.com>)
 id 1vXKcM-0007UX-OL
 for qemu-arm@nongnu.org; Sun, 21 Dec 2025 09:41:08 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jackson88044@gmail.com>)
 id 1vXKcK-0007Lz-HS
 for qemu-arm@nongnu.org; Sun, 21 Dec 2025 09:41:05 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-3f551ad50d1so1127644fac.0
 for <qemu-arm@nongnu.org>; Sun, 21 Dec 2025 06:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766328061; x=1766932861; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jCNfRTUuxHny5w058jtRaDTaVSrfSJaYpdXiovAvXzY=;
 b=GN9x6G60lVuY4Ai0Lxbvrgmspe+aG5fty5Ftp4zvgrvE+2zVs0kv2c2DVSgdGeNzEm
 9aN8JMvF3B2r3PxBEWHI+cN9P0eHIL9UXL6ak/3X4xkhkhq0XHUTngSjDEJ9qEvm2zud
 VjWA+a22UqpsMrJN2Gfr+BITmzRHo4jx9vpjgduLGgE6sqHCk7O8UYuI15I+oVPWnHwe
 bup1wRlCvG7+TjtYA4BbMjXgSpyFOo9uznB8PSMP+hoV1767TC3eKo+587Vfj9Cmme39
 J5TRTRb6zI7x4xBZHb3iilMD0LC4BxrvL3ySfb3AItz4lwkpb3METF0jc8P4A2Eg5UsY
 n/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766328061; x=1766932861;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCNfRTUuxHny5w058jtRaDTaVSrfSJaYpdXiovAvXzY=;
 b=XuNfoqvAJPIhfLkWkw9fOrvVBWbeO4Y/V5KYjsrOUk7kOBsGF64QNsCKIlwjuxCZpn
 aZFiaJZu7SK3Jxqx8N9b3nrxKehSJ7MlHurZKaCmTjbUZDdXocNLY1b0vdYpD6m1GB7w
 Ac+6DQmrRy0C+CIJg/cMTfMC/rTvrCFMIzpqts7nW56M9E8ECC9NPPJRd4/3D5ZfN/zB
 oGImfiuxbCR2267+kjm5pgiNcxcLZJPmc6NkFzFvAdKzz9YUkb58ulw8nVcY2pL9mDVB
 eCZboF3qWx5AeL/w2o09c4AXJMoJmoDGcW+dCTXKyRhKv/AzIRRJDPlot8wStmtGPyIt
 HanQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlWIqeY2lfjRNcANz9AgtjHpjWlJp5aE1CBLUqnyZRn+MUokk5btlcUV17r0xR9dsYkhG7OmcuKg==@nongnu.org
X-Gm-Message-State: AOJu0YzGgZgfwT/il+JBXdaNB+lbyKy77VMwoDaiWs/fzQHyF8g+ctoc
 JzQ2L7ILYSeiFzEerzGqZ0UcMax5fPl6PHI7POjKPaqo49FtyeVIukYotshmvXGy4KY3a7EKk6C
 xCx4f9fN3zRFH6upijtfAiGFoaCt/qUI=
X-Gm-Gg: AY/fxX7YMScsB0jUYNFyYdTpaoNLkKvasvJh75TjdCEGKHKdjRRy/4wXU1GL9isuOXr
 CxYupefaRSt8bwbHSErRz7ioYIh3FCFloAIZV1gh1Pbm9bQMVzzf9qaQcJHwFNFRF5E9kKvTp8u
 J0mAQhHjs0ngASXxrpX+7Mvi6cYbTt5z+NDgSMeXtZeFBa7+tYAV74W+ctiPxvx5cHyY7EaiQmJ
 ZHtTLTWzm6Xs3sW2k3w28/IBqLJ1khDkgOlviN6uXunWLTuhzM/BN0bnTplvZW0F27tS0PF/AKy
 yvLKJpOHaXm2mOaJ32hsOnTusZ0sNQ==
X-Google-Smtp-Source: AGHT+IEwvYsSqk6LTPzonllM9kXKN3Ewokmi0uuxl5j8H8AfcEr7gpjGAIoqYU3uSub78Nm/7+3L6dfpmDNNbofvqC8=
X-Received: by 2002:a05:6820:2224:b0:659:9a49:8e45 with SMTP id
 006d021491bc7-65d0e9b6056mr3920550eaf.21.1766328061154; Sun, 21 Dec 2025
 06:41:01 -0800 (PST)
MIME-Version: 1.0
References: <87ike27ucd.fsf@pond.sub.org>
 <CAMyd1rQ6CLN2FPic=4pNpZtcw46io2xftkBDSLfd8V9S+Jyu0A@mail.gmail.com>
 <878qex3ac7.fsf@pond.sub.org>
 <CAMyd1rR9HLwn-fzWfgqu=ZdtOq_Ae6Den-0oCmZpXAjxbup87A@mail.gmail.com>
 <8e9cc465-fc3a-4665-b754-6d5e20bc3651@linaro.org>
In-Reply-To: <8e9cc465-fc3a-4665-b754-6d5e20bc3651@linaro.org>
From: Jackson Donaldson <jackson88044@gmail.com>
Date: Sun, 21 Dec 2025 09:40:49 -0500
X-Gm-Features: AQt7F2pCQ90zvu9NIx4_5sVnLmA4PObCQca92-a4xgIZnzHNiqazeUgDEidyefg
Message-ID: <CAMyd1rSG9FuSVYFHZpSwyN+CBi_HFYBUAiOqAXh35bZaiNQtsw@mail.gmail.com>
Subject: Re: MAX78000 machine needs a maintainer
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a45a710646774c79"
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=jackson88044@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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

--000000000000a45a710646774c79
Content-Type: text/plain; charset="UTF-8"

> My understanding of Markus question is not why you implemented this
> machine, but why you decided to contribute it, if you are not going
> to maintain it, because then this is more burden for other maintainers.

I decided to contribute it in the hopes that it would be useful to someone
in the future? It did not occur to me that contributing code came with any
kind of implicit promise of maintenance.

If doing so created more of a burden for you and the other maintainers then
I'm sorry about that; I really appreciate all the work you do.

--000000000000a45a710646774c79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&gt; My understanding of Markus question =
is not why you implemented this<br>&gt; machine, but why you decided to con=
tribute it, if you are not going<br>&gt; to maintain it, because then this =
is more burden for other maintainers.

<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">I decided to contribu=
te it in the hopes that it would be useful to someone in the future? It did=
 not occur to me that contributing code came with any kind of implicit prom=
ise of maintenance.</div><div dir=3D"ltr">=C2=A0</div>If doing so created m=
ore of a burden for you and the other maintainers then I&#39;m sorry about =
that; I really appreciate all the work you do.<div class=3D"gmail_quote gma=
il_quote_container"><br></div></div>

--000000000000a45a710646774c79--

