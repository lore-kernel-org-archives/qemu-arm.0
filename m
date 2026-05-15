Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C724CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 08:10:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNncd-0006Wa-Rq; Fri, 15 May 2026 04:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNncc-0006TF-LB
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:10:14 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNncb-0003F8-1C
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:10:14 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-651b4d09141so1467393d50.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 01:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778832612; cv=none;
 d=google.com; s=arc-20240605;
 b=RJQTS8QwTD1aO82MrF/KwQgdDKRaiQWpu7XSrkJxwzieCzbkJqSKGN3ImSUwP1e1Sc
 ni9HeVaiq9JYpmNFHI9bdDgDWMCv6RXoM7FVsTtf+m9H1PAPdeMCLS62XxsUSpKI8bQh
 fub5vUjsXsDfkWrVBN1/9VM2i1LxwNjNOpcAQDfUbk1x+dligQGOQHivauzvB9ZUsJGd
 wx34nCk6Fi4nyxA9lulgHGfjLFrcoWjh1PVvrgOFn8e/+IZEm7i4Pkq5/HMOamYCt0hC
 JC6mqmtf961cmSUVaQqPMPs61kSYvPhhiQmBjerqI9wA3HbXJoOyey0LE64kgQHtKBef
 aZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=d5k81WlaxgiwhjPZuLN9+Zyth4LlK2+5FnTxOpjqhA8=;
 fh=PMBWxEpNylEPJMDsynKrBKwNrWlhU8CezWkXYHW4uAY=;
 b=aRAU6XJG0qcIcv1V1NN2t7TrSAk4eI0xWqEfy69KMaIRMegmS46IbcdvxLwi7oYKV5
 GADDBvk1iXaizHl5DBySZIZ4C719rONfS4ksNWBMmh+/mOhmp/wOYD540knpEEbukWHV
 nSEMpoT2Jlc8ATc+RkkmTo6MTyIN1Gf0iHm4f6lChIa/CN/eo/BUl8wswJGzOiSIrzHz
 otGc6MaFOrBDJJ0nfvJBKHXAMn0h0fryb7bqnP+fUDjtiCnxcPiM6FHYzp6OEU8VoRhf
 ZnnyU4LwcUit7Wpk0Bss83LyOUrR2Iak2rYKrgNrKtsE48lqzas+3FBMKjdcre34FR0Q
 3fwA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778832612; x=1779437412; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d5k81WlaxgiwhjPZuLN9+Zyth4LlK2+5FnTxOpjqhA8=;
 b=WbAr9EWkd1VQFmGwQOMs+RGheSdz4TZz7Wnkj0X6/2HJIHCrF8jxjEFdQJIkszlvT3
 99mRrDaDG5qEAKlFwath5TJjGWszAwY4AS+Dk4GChqf8Q44Nuh940zQN+d2qgYMjrFES
 cE+Zqm3VvpK6zkAI/MKJSLqg/H3WSz23Ut4YoD2frX0Y/j3yBrWoP+Jf4f4Ni3zoxssM
 t0LT6j1q0TSYSccgqLU2A2rEH4Eu1oNCeBBeEd27odlMYQuuU0n7Sh7OzMSbRwT5bvaG
 XVPNKrWFsG8INBu5+/KRuSknP7iI5r15UuChLX7Bhj9+evhncZJcDPWrAwP+7LuqN2EP
 EWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778832612; x=1779437412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d5k81WlaxgiwhjPZuLN9+Zyth4LlK2+5FnTxOpjqhA8=;
 b=NXnTLwErC5iIr9R5Xry0VMPEBeOmGgJwv6LFA3ZOKzw8JCK3eh2eoUHPdw98swWr2V
 eT7x4truKSZe8skLdjQ7QJXGxuN5boQ1iOQXyfUX4HVK/rIL+ljx89UeTO2F/whKkt3s
 NWwTlbqhMGGdCBzdGh6azkDn8rCcQfKMwiWCEDIbQH9hmhhm1teY2JR5NYu1XqdVA74P
 LnN+xynudLeNkzHoH31EW0MyayKNYa9Hn7k87zdOkdWtAF0rHPY46eZ/wfdXTyI3YmSf
 GJSDUNn6kBvDhAot8FTUcL4QFA87ZJOqptIaDcCurPeaTEen+mS/M/+LYuuOT7lHZL5R
 imtA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9o8XOw07p5GJKfet483AlJBjF9pAINl/8/CQpX19DbfNu2KtqlcvwBgNmESf6bOU02vXj09TdTug==@nongnu.org
X-Gm-Message-State: AOJu0Yz/Cz7Xdl1uddOf0DIfDq7N4fv+6X+xo2p0H91n2DceIzFgE1Kb
 1A51crIJoQuDixkP98l4qnqw9NR9B2I6TneNbgwlCK66rIoKzUpXsWn4vmZPb9VkwMA6WJVzYi9
 3qtJkgfeiyI98+Sd5MUv4i3Eyvm88PYiQ+7adOcbCEQ==
X-Gm-Gg: Acq92OFKhyxxy+BMiqG4ArboYO1mFeUiX7UL/gBkyve0x4ST+llTadllPsGhzgzpRL/
 /D+LtcDhrrkp4EfLjPu+i4q7L4O35QdRUa/mBpJDR6rIo/0gwKlbwj9NnepQ+tmg0G73eeYQQBt
 F5476iBczP+o1yuehVlTQ0By9xL9/J1uymXL7m5JPq3wqysfZMfUPYOPdnzuSEit0j8pCVq0njZ
 jZ5q8Tln/aEFqZXiBh7yU7gE/pakisV2HgApMWXO6c0xhc4f4M3O+qGrWNbUmE7ebw5wrpP+Tko
 5siGRpBvzoKtvQCyU92nO9XbmFN1HL8gFeZ3VMCPh53h1jMBFizXAkmKrpolyrrtFpI=
X-Received: by 2002:a53:d005:0:b0:65c:6f05:ae25 with SMTP id
 956f58d0204a3-65e216d83d6mr2228597d50.30.1778832611887; Fri, 15 May 2026
 01:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260513105517.146706-1-corvin.koehne@gmail.com>
 <20260513105517.146706-16-corvin.koehne@gmail.com>
In-Reply-To: <20260513105517.146706-16-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2026 09:10:00 +0100
X-Gm-Features: AVHnY4LhsCS6ErLIDSYFXTu_d6loJrxsEyIId2t14nGsemNciIMXY7n1NSdyhgs
Message-ID: <CAFEAcA8aLT4LQZ1HaQtduZeWm9w+62bDaXmLetbnJQHN3xq3jg@mail.gmail.com>
Subject: Re: [PATCH v6 15/15] docs/system/arm: Add support for Beckhoff CX7200
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Wed, 13 May 2026 at 11:55, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> This commit offers some documentation on the Beckhoff CX7200
> qemu emulation.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>

I had review comments on this patch too:
https://patchew.org/QEMU/20251204093502.50582-1-corvin.koehne@gmail.com/202=
51204093502.50582-16-corvin.koehne@gmail.com/

Please don't just ignore code review and repost a series.
If you disagree with the review or have a reason why you
don't want to address it, that's fine -- we can have that
discussion. But ignoring review silently is not a good idea.

thanks
-- PMM

