Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E487AC53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 14:39:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woixa-0002n5-T3; Tue, 28 Jul 2026 10:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woixY-0002lv-V1
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:39:09 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woixX-0000mY-Eq
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:39:08 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-6688dfaed31so5151675d50.3
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 07:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785249546; cv=none;
 d=google.com; s=arc-20260327;
 b=JyWiLnA33Kyeih1tm8Zyi4ZVaxyGAxRCk8nVDsGx252SxVRAOcDMYk9V7co5WYAby+
 1Uq4vq/knzERFXRr7LRVG8B51wZnBUwkww4S4PzxlHxwmLzfT+z29ebrhQtIJu0crdS4
 n/F2dmCFIoLd8Od/M4vcenN2tawIDUczLvM4UDnIwz0bZCaFtzvvr/TMT4nnc7MHOTfG
 kRigOJGct7lFwuZDGcPPSohlh37nycBW0mCIie/xk+QnOy3PU+zLFWupwx/9yA5cIs9c
 4tmI0nRrEE0qEThrrrxl9Za5dG3CpHqF4tu5PdjA4+DIp9qTVofkT80EJshucxUt+9B8
 iYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=H0pP+XrMAwMqRZG5C6J60GHZJEAKEPpIro+Dr/Olv3o=;
 fh=NpNujuWU6DV97NBsx5hGz37vDQlgCs4QLxN5FXLPPvc=;
 b=PCauzUg0+sm3U8mUnjenEU4sB5cyaqVEfwlCA00f6YrK72BNvo8YOg25rXzV8EHjfj
 Rdr9V9ZaUlcsCFyppoXFzq5MhcJ4nNoM6TQZ9K0aHyaPexipPRRSZdt/oqkeCbb88JYk
 rUYoYjzkokh7qriZwOz/y6D3mVYS+6VRXgKdIDC+r5zj943XwJWDrLTtr/2ETawjgOAU
 b00dD+N0ULrcFGdovci7vuWQWHovFVShfbBwanNH4CFoIQoOyvH1QdHzZ3ihgD4PEYhf
 ZAR7WUJMk4xhm8SgX91/4ADTmrFwaaJJpXFn865c/MYXHUfZZfAH1sONQhERsilDthYV
 rzCQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785249546; x=1785854346; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=H0pP+XrMAwMqRZG5C6J60GHZJEAKEPpIro+Dr/Olv3o=;
 b=M7IR33OZNOzGYryCCWJNWNhZiWFJtfC1VP6MgrhqxXPzOloFjJonfQPwHnqLZ2fXkA
 n/dS9VKaeblefZ3FT4EwONW4gl28Bnw2AobjNO54ofmO56OvbW+mYbHEA4OqYW61cM0v
 UNf0Dc06U7ccTG0sLv92KckLD2GF1Zj8tjLMup7XDZyzQ9f8OoA5Xoq/cKwPZicvzNVL
 HQMGuI/yJ1WknojM/bkXsDz/VbxnGhM7DBByWHFSV1h5KKqgy+arPu67fXVGsqHOzhNN
 gibi9QzdKeweBi84ZIywl98YieDBWtyHC6SRsJxwi352nPsD2iBh0qH1YS2ItbubDo0O
 OzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785249546; x=1785854346;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=H0pP+XrMAwMqRZG5C6J60GHZJEAKEPpIro+Dr/Olv3o=;
 b=osdBB/IyhrbwdO5vIn0D6fapcH7fE+F6ttgwWaC3KzxFFpVM9FQ42EQtAQhak2Ys/d
 V+R06+4JnWIt0iOPdZoMZehU3ihQnXorMoVmPkNE6XMll+oBCsE6n32UETfh/mte7pL0
 BgQBNW2A7mu5MW/3m7JFUb9dV1hK03ubrfMK14GOOcfSrpz4x2ZTxV3VUwEDIA0OnSP/
 BDNOeZBapc9T85dPMvmdAIApvyLdBq/kTScWop7Kv1lMse/V7/Dd8F8JaO6m1+dn+ESP
 U+/NlDZtH4CL4sWZxcoiKKPhTzOqUufH9CAvkYnb5/I0KbSc7NxLiX//vBTR7w4zDNUm
 M0MQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpmWlBr/tVNlNPdce3sHwPR1JvvT6aMj8Sb1Aq4dyxzo6HLAykdikr81q6JjlIAcAj8gDCNqAVDZw==@nongnu.org
X-Gm-Message-State: AOJu0Yxkskcnqp29hOIJdM7hkbL8Ur/WarmdhZhw2nsgrwphk29N9s5T
 /Lv8EL05Tqa9WOZKTA7+7PIYL/wS6QQUCY54dG5fUn98i+MG0LSRi+x97zLtebl/ROTe4NvlryZ
 zITWFtoFjLcQyRm/1n2EUH6YojftmkjdA/SRnZD8tiw==
X-Gm-Gg: AR+sD10DmnECFwvEZ9Xu6yw7lhRiPZttJkYFlegchdYrbJ4P8C3gzAa1gx9p7jE15yV
 p2wA78MtljpoAfz3Ucro1w++kAHd4hY20GGnLz1QNOXOPHRyCPW6bpmvaE8AB59JAoT3C98L8Em
 Ohagoxt7Vvderyy1iY8yBsdZGibcWzA7PeRe2Ub1pYCuSAFMV7Xhy91DKU4GoUj0k+4kejcuIIF
 o7qiLsAHN7UhM7U99ZhtEAtDuAvFGcAoIPwMmDYaF1tkonZZQn4XKVimP16INS5bnuW7sslv89n
 qpWQYMqBUiIFELrC2p1FKPPkl01MrTEeU48krpT373dFrA==
X-Received: by 2002:a05:690e:4005:b0:667:91ba:9bdc with SMTP id
 956f58d0204a3-6690545d1b7mr1162220d50.11.1785249546204; Tue, 28 Jul 2026
 07:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260727032649.145381-1-gshan@redhat.com>
 <20260727032649.145381-3-gshan@redhat.com>
 <CAFEAcA9_tDRAd97z4UtNhFPK+fMbq37LJhWTSmD5cueo61hvvg@mail.gmail.com>
 <0a384d67-fc56-4a21-9d0e-25f218a45228@redhat.com>
 <CAFEAcA9HbTSj9cJfv8o=jYSuPhScr-RVKWCos4kpUJ+T1S6g5Q@mail.gmail.com>
 <13333e56-3725-4550-849c-9035f6925213@oss.qualcomm.com>
 <CAFEAcA9X7SNUvQpwXA2_xReUERB-eBETty3g32-PD=MVk536sg@mail.gmail.com>
 <2322668a-20a3-4a6b-8d7f-c04ddfef84f1@redhat.com> <ami94CmeBNRKy_es@x1.local>
In-Reply-To: <ami94CmeBNRKy_es@x1.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 15:38:53 +0100
X-Gm-Features: AUfX_mwPf8ZxxzTtyolXaaZ5S2ILmfPZnwZ5wIVgDG62c5eXdboXHCSKaUXDWTw
Message-ID: <CAFEAcA-y+vNK2u-rSq+SVjNZrhO2=BsUysEw2PtCdCZ=qYx2bw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] system/memory: Use qemu_ram_move() for directly
 accessible regions
To: Peter Xu <peterx@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com, 
 richard.henderson@linaro.org, alex@shazbot.org, berrange@redhat.com, 
 philmd@mailo.com, david@kernel.org, clg@redhat.com, pbonzini@redhat.com, 
 phrdina@redhat.com, jugraham@redhat.com, liugang24219@sangfor.com.cn, 
 dinghui@sangfor.com.cn, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Tue, 28 Jul 2026 at 15:34, Peter Xu <peterx@redhat.com> wrote:
> I think the bit ops should be more efficient. I plan to queue v5 with a
> fixup, v5 here:
>
> https://lore.kernel.org/qemu-devel/20260728031731.286666-1-gshan@redhat.com/
>
> Fixup:
>
> diff --git a/system/physmem.c b/system/physmem.c
> index fbe7df2391..2f37cbeb07 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -3162,13 +3162,18 @@ void qemu_ram_move(void *dst, const void *src, size_t n)
>  {
>      uintptr_t test, len;
>
> -    if (src == dst || n == 0) {
> +    if (n == 0) {
>          return;
>      }

As we're dropping the src==dst check here, we also need to drop
the "and the memory areas do not overlap" clause from the
documentation comment.

Otherwise I'm happy with the v5 with that fixup applied,
and you can apply my Reviewed-by: tag.

thanks
-- PMM

