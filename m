Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FF8CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 15:56:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRu81-0005bm-Au; Tue, 26 May 2026 11:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRu7w-0005Xg-AD
 for qemu-arm@nongnu.org; Tue, 26 May 2026 11:55:32 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRu7u-0006rJ-1L
 for qemu-arm@nongnu.org; Tue, 26 May 2026 11:55:31 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-65e39d1dd38so10027283d50.3
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 08:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779810929; cv=none;
 d=google.com; s=arc-20240605;
 b=S/AewsP8wxeaZkHO57gfH03aFr0K3IWFUpgH6r6NnhPN50Il0cOyg8gJSWs+9k+5se
 G1U9569baLWwpGjfcPumrpTqrHqHdAcD1iexQh5t/WUUncFHDkO7nK5z4XrvNWAt1qvN
 uidc9rDoDdgmUSvfZ2M1FByzzYa5ZcWAExSyxR16iAn7sUHGEO9J2RlMFQedvfRZiv6i
 JgR6wDMetqs+ip4q1aMOkzG1YRhPiIVVan73wnsFNOycI5wJ6Ig0r/1DMTm0fUSYQ7xe
 EyROqhAF9K3hHWa2k9KCNnFT1BbIMwRsXFGsKhEOw7gcr/PBL137RJSqKJWxoTGsMhKY
 ZBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+b9Kf/CszHgxNBcDmuakcMyonHIw3rytgxgZQ5SEFlc=;
 fh=23MTXIQdaa2N3OwefCfYYfIOCLtf0Ma2sPnbv5LLJm8=;
 b=LU8IWPZ3pmBoESvRGUD6J6dyZX2M4dVpimTACqmtIq5j5mAI1KJLlVw+TAVWt+bcqE
 ddeG8w4I4jpZ8H04vT8Zw9In5nTg1hfG6G2VMaYJODWlrFHTx6p7koaMz+Btdk9bSnj0
 I07FCi27tYOgUXs9VkIXpiVFw4pJkhwCToqp2q8+mXihTiNj5Kqip0oPxoDJNC3FdcYI
 A5isRgk6F4gnjemDE+NOabmqItYbm1pp/mRoaJiz1+U/2YAX/ODAy+z/xpYKYcaT7RD9
 9YyekHqjE6GtYFsT0rapQDWLsRPx26C6HW/cSZPhVOz+xYkKAtDv51m4XcVM3WEQu6at
 y5hw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779810929; x=1780415729; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+b9Kf/CszHgxNBcDmuakcMyonHIw3rytgxgZQ5SEFlc=;
 b=jCKvTXqIigHF6FNf/Sk3eaWm5ZC/p9Lb6SvLiSn6+5DVnYPxOxh6eGvbNylXUehiv4
 1pa923+T0kGYVQ79VJgcUd1RY8TxnXbda0wmhrfXBuHW2iCywwWDk4VzHKQkkUJr/oFX
 +y+mjd+BkdlsxLNoLcyinRQcSedNIDQLxpyLbtFm1hepttGuVooAkH3RrwlQyUSdEcAI
 yn7R9dvSTUAnf4724R/rPZWtot95acLp7HkJ44Hk/+80Rf3PfRCoIX3gBkCflfJqKy1o
 MRS9kbjIKcZfscAxTOu+y0u709WFgeDlCk/HKVlnaGOAI44BdsUnJ/+OR/8xDBabM2xd
 i6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779810929; x=1780415729;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+b9Kf/CszHgxNBcDmuakcMyonHIw3rytgxgZQ5SEFlc=;
 b=Yye60Ux/zmL9c1xNSlPowJsqX+8Lbq+hOh/oR4p7yR71Z9OtrDYJT7E+o0eJGu9RLB
 e61mJZNP21gMBKtF5T+tcLDa1zT9EI98pW5rZUH4lCdrKo2IcSMmQcMnOqT7KBa4s594
 /qsfw/iNt52QJIIyC/xRIgIMKaqFEs6Bh1j0oZznO4iZKNnwP04h+0yhgM4HqMoQEw9c
 /vLCdqBVbciAC+7G4oY6ggYKUhVjlO0cI8FVZl3B4IyaAw8GZ+cGmqOXCmWUh2jbMRE0
 SJfDTg8lQHIuCPKvLcrfqae934cD/oHDWzsFK+uMeJzpb7PdvWq4Hd0cW2d2eW06UHa5
 aDxQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8bCPERkSViQfPuNHy562gu07Goz2lwFwTVIJCVdm/TqW4IIdb9IfuW21nXFDg5bdviva/vubuzEw==@nongnu.org
X-Gm-Message-State: AOJu0Yzmad0qMbelwx6gnpf+ddvFATDU5n9CsNMvWyroXskgQXawyc71
 E/iW0Ae7qKVNntwpwZY4sN2a77CvB4BM5WuMUkTwe7XPMSLvXbDvB6zM+54b4zXjZbTDiaehme/
 Mo79ff+18ZxSmj/+h/AuzZXFoDCujgSugpLyoK9ozOw==
X-Gm-Gg: Acq92OGBDMP7GcDZidbEqW1z5BgLdw3kECW+XGEAlWgsiFSlqOpTZ8fBAivldVJqKcq
 vq67z4hcv0Y221KNIVLfQ7c2u4vgIIwFKPRCdTzmAb7JOAO5n/wgvdlguD75maDa1sUylWAB9XI
 DzbvylvptJjZDcSxAzfnr1U7vcLi3SxUOjtw2r1z3vBpI+52ewAXeAQjBxGwjBx585H9HcQPOjW
 cc9ZhZNEDKRNzgnbayOY2YHYPApvkj5nuwCJ6WZ0i2anwi1d1xOhAf3F0QoTlJ5FoLpqN7/dJ/1
 tfSs0kYUzKX6T8csif/+M2JfyA858NHSOS503cvidGyjSzQifO9+1fGiz3CgU2sMOD4=
X-Received: by 2002:a05:690e:4846:b0:65e:5aa3:9632 with SMTP id
 956f58d0204a3-65ec97a1f0cmr13931280d50.22.1779810928438; Tue, 26 May 2026
 08:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260519144553.91483-1-philmd@linaro.org>
In-Reply-To: <20260519144553.91483-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 May 2026 16:55:16 +0100
X-Gm-Features: AVHnY4LUaxuF0q6-gl8u_W9ULJLLNlXpmPuppjCisLcKLjEhHuvzM2fg0g1YsA4
Message-ID: <CAFEAcA9_RB-VjLuy43p5kgkvXNJPa=WyADocKLxRxve1rFq-Ng@mail.gmail.com>
Subject: Re: [PATCH v8 00/18] single-binary: Make hw/arm/ common
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Tue, 19 May 2026 at 15:46, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Series fully reviewed.

Since it's all reviewed, if you want to take it via
a single-binary pullreq you can have my
Acked-by: Peter Maydell <peter.maydell@linaro.org>

Otherwise I can take it in my next arm pullreq, but
that might be a while as I've just sent one.

-- PMM

