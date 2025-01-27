Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2422097njk;
        Mon, 27 Jan 2025 05:07:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUbA9Il4+RomdZHU0iGqV99ziNQrSJazffmzpb4mrXPvd7AYRzyyNyayKuliMvkEIjSYXMFBpFZw29LfA==@linaro.org
X-Google-Smtp-Source: AGHT+IHYJ90iMDud6msKKo/Y+bABCkrdH5Lu5TLwj2U17rGuH3p69zNiVbCSDlkHtfqenzd0cHJV
X-Received: by 2002:a05:690c:f12:b0:6f6:cc20:1843 with SMTP id 00721157ae682-6f6eb662832mr348094217b3.11.1737983230783;
        Mon, 27 Jan 2025 05:07:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737983230; cv=none;
        d=google.com; s=arc-20240605;
        b=Ugx/QTLr9A7h3Cjj9nEsuuR6GkyIgctxNdBOu1XC2Rnsf9L/Qxu8WcrSqJ6jVARQLg
         BMV1jVhv1UDi8cKR4KN0pg2Reef5eyUrWBm4BOq3RR1DmGWinFeakaaNVk3/9HG/868a
         M/VLVrSXDsjE4zcZrYJ/Q8Da2h2QNcynuUJR6xfzh2uSYavXfOISlAs1zZG/OQfDpfKE
         51xyNYl6/uO/OAj1KKJThC92rkgwFI59fAuxakmXQlvoDX+ftW1u3i5tE7VsuAbFoqH8
         u95uT9IIkz0SKa+vEKdbwC8fJEd/hO4gp7DdQkc2MDGdQHYTWHRZQ7yRPWwkhdrbcHHS
         VRuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=RZ9N9l/esadIiCaTU1q421TEhhr0KPFf7kRDq2xl3eA=;
        fh=uNl7yB0bPxz9znrU7pKAohHK9uNFzSLodLHCZOOJ2ms=;
        b=PMVMkSfKXxsIJVyK84pMdDgnewDIci4k2Q6+mUpXBVFcIVw8bQFLjA2EBuUu5g7BP6
         CUOw1oJ42woBT2haqrBAHRsJBPGa0EwF4nfIAmftHAomp9rNBcisDaD581SgBcD6KMQL
         eyBNGnKzL6rh2S8dUq6ov3E7VaKGaWHyk4KcjEeAGY/Qi74GSHkial3q0ecaS1EdFCl7
         sCb8nvb68klr79qtlxiz2sk2/iX0ZBFJZ4H/CXm7JLUdkXPAfN0DchQmZ3Qzg1bfoU8/
         u8cDFN3SDwClnSiuu1BNamr6lZtNS+LCXDjc12dNzSWtQ5s1NY6emaVeC9C7lW+lTGKM
         QE4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tsqhzun2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 00721157ae682-6f757a2613esi56506967b3.355.2025.01.27.05.07.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 05:07:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tsqhzun2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcOpQ-0004Lm-8k; Mon, 27 Jan 2025 08:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcOpO-0004LG-CS
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:06:58 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcOpM-0001Xe-Sv
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:06:58 -0500
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e53ef7462b6so6701226276.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 05:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737983215; x=1738588015; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RZ9N9l/esadIiCaTU1q421TEhhr0KPFf7kRDq2xl3eA=;
 b=Tsqhzun2Rh6gUE1KWvU17qCwqJnnnAFpYrEuS4iNNdxWjY6B/K1ul6y3oeJX5rEPeJ
 IkuWfqCeDdQkEdwD6cwrBDn0pomRm4aymc1fA6lz+WpIQ4HTsLrvvinQLVnKkcSFya5p
 7EBBZk71FcsNetkgi3JDsG9+QFUiAnJBDLhgVQQkg8VSG0U9vNflKhF3TYJngnUYwEPr
 monLIuqyoG9ilcf/kHtAGwTopux/9riDU6JwFbB7Fq4rYIPQbMPleL0QZVR2kOdZ0uFF
 ReHCXnjG70sK0jcDZZ3ZIXIBGaFO3Zd1SiD/gYJLA8P8kPNRSNOiJylM1BYMwerRpaRB
 lZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737983215; x=1738588015;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RZ9N9l/esadIiCaTU1q421TEhhr0KPFf7kRDq2xl3eA=;
 b=GSNqoeVi/j9CcErHeW6s9It44KGWqApU3dSUhrUdtZZDTDqWrmYogPrGFGoPhVK3QS
 /+tvgUZSZYBBV2TjWGd/CHUA4GO3bLZRtKkMLASk8w2W1/CYY4IjuUaYg2IEktnP5TCH
 LSKe0stYopKZ272QMqsp/Ql23u0vf3cGfM2Q/3t07fE8Ff9djebplMOjnKknm2SysdDs
 Dd7bJ28Ddhd7kx1FZBual8ehWOUzJyxmoA2fcoeRDdUDXstW+ppYU14pSzEiSWgDfCR0
 +EmsWca3wU/+ceZbVMGctGu0mHZ/IQEYM6Sbho6TgA0TgIhLrr+xqxhvugDllx03LhiK
 8ncA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk01yQXtjip1fi0fXMbOI1EPUGbf+91tvsZXIEC4ib0b8kes3T0uAUvJDNfYu3CbYHJndmHlDGzw==@nongnu.org
X-Gm-Message-State: AOJu0Yw3jZXWcJtE+jMQXU2MLsYWz+S9ZiaYDoUWkhmzD3hqc2Ta6alU
 N0HLeUvHxUQFw3BjyWwuSpQpOedlXSzmxydJlqiRTfntClz+mUcK+ZRY/W2GbU1VQAlGbKVafl4
 lymDV61XOvd4Xf2QII1B8zGvWjbB+pMVKtZQrKg==
X-Gm-Gg: ASbGncuci1/eY0eNgYfspuYQrmBAJgOcco+0gXga1gVIknHad9f2yjKDrY2xL/AzZZO
 i/G4yF2Cm4J5E7GjNFLQ5BMDxeh95f/fFvfWmFoaLf8wIqkKTxTfbFA66MjG+v1o=
X-Received: by 2002:a05:6902:128a:b0:e57:d3c8:554b with SMTP id
 3f1490d57ef6-e5883d164b8mr774846276.22.1737983215711; Mon, 27 Jan 2025
 05:06:55 -0800 (PST)
MIME-Version: 1.0
References: <20250117191106.322363-1-kchamart@redhat.com>
 <20250117191106.322363-3-kchamart@redhat.com>
 <87sepgtp3e.wl-maz@kernel.org> <Z44R-cUz9CWMp5Gi@gezellig>
In-Reply-To: <Z44R-cUz9CWMp5Gi@gezellig>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 13:06:44 +0000
X-Gm-Features: AWEUYZlKJbJXWDufCAfjJFp8g110L43kb4AROtU-4_YVGFeafwo5GoGPkZA8JZc
Message-ID: <CAFEAcA9arxn3FLRYS4ObD=iRkX-idgCosZkoqknqTkQwYn0uTA@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/cpu-features: Update "PAuth" (Pointer
 Authentication) details
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 sebott@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
X-TUID: a/wk1CvAzzy0

On Mon, 20 Jan 2025 at 09:06, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> On Sat, Jan 18, 2025 at 10:04:37AM +0000, Marc Zyngier wrote:
> > On Fri, 17 Jan 2025 19:11:06 +0000,
> > Kashyap Chamarthy <kchamart@redhat.com> wrote:
> > > +PAuth (Pointer Authentication) is a security feature in software that
> > > +was introduced in Armv8.3-A and Armv9.0-A.  It aims to protect against
> >
> > nit: given that ARMv9.0 is congruent to ARMv8.5 and therefore has all
> > the ARMv8.5 features, mentioning ARMv8.3 should be enough (but I don't
> > feel strongly about this). I feel much strongly about the use of
> > capital letters, but I live in a distant past... ;-)
>
> Sure, I can keep it to just v8.3.
>
> On capitalization, I don't feel strongly about it, I just followed this
> commit[1], which explained that the rebranding changed "ARM" to "Arm":
>
>     6fe6d6c9a95 (docs: Be consistent about capitalization of 'Arm',
>     2020-03-09)
>
> That's why I went with it.  I see you know this by your "distant past"
> remark :)  To match the above, I'll keep the capitalization to "Arm".

We should probably do another fix-capitalization pass on docs/,
because a bunch more "ARM" uses have crept in since 6fe6d6c9a95.
(6fe6d6c9a95's commit message says that architecture names like
"ARMv8" retain all-caps, but I think that was my personal taste
creeping in -- at any rate the current Arm ARM uses "Armv8",
"Armv9", etc. It was right that "ARM926" etc should stay all-caps,
though.)

thanks
-- PMM
