Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A456CF31E50
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 15:56:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wArjh-0000ph-4H; Thu, 09 Apr 2026 11:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wArjd-0000p6-Vv
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 11:56:02 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wArjc-00026T-AX
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 11:56:01 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-64edf260b49so1683419d50.0
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 08:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775750159; cv=none;
 d=google.com; s=arc-20240605;
 b=f/Age8tU9sm2e4RtAItBPE9HYF7wDtEKAJUYBixCxodewOwJTGq/CT3J4IPAGGQTYN
 H4JEVcsQMix4/tPk0d0r4IlQ4qRc2FsgUk0R1WiWGga8l3yhNz6zlaQd2rsluE1MsdwB
 2DYd+lAavLWt5GbyZgRw4D6rrwBQZv3qYjYpaf4VBNDeWtYX+spcv3n/lZ/Xw5q4BxdG
 HTu2OpTZGi9MMngQVSzJ0/FBpE/X4JYnz611gxmaEupw4CEl94aGvyYVQENKLXHq9Ix9
 sC9ChwocqAgs2Oz1h4te/S+jiNVb4PkjFnPvpXcfCR1yrpwhGiXDibtkaCWTL59SGgs6
 KT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MtCWA1T0xQbBhegHDKM+349gzPs0rzIjx+JTPgMFJbY=;
 fh=ZrSabbqqUDsZb2fyky9+O4SJQu68/a31ZctZnVcNic4=;
 b=bhtYQd9VceZkdrywOkBW5JdrYGSWUZKtlywXys9fiZEeP6nsAispPkyLJFcOKzePot
 JvSctVPTS2k8RJugXus3PHKehaKVMmHVJ9g7iO1+srFxTGXjXEu1nDCswDWoP/+xaQtC
 LWnDHWMnPtVCpt2wc/HOdUICcDhlqn4MLfg0wZ/cq2lgwlyEWUAh/ypclhhCEHgMarC9
 QKgUQyxKJs6TO52nQV8n653OX4i7mYe2kAX6ac5gwjo08ot+p8SA2agG9JoFQ3Y3IR2H
 J9OLp11yQV1punOV0u9ke0fGbtqjrQ+tIcEwyoQ8NSeAllePN3do8I2P+ocIcq0HjSiw
 YSgA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775750159; x=1776354959; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MtCWA1T0xQbBhegHDKM+349gzPs0rzIjx+JTPgMFJbY=;
 b=L+9d2ll1ku8UHVwWWrsGA8BgdLHDeBIitvql2d3qC9qcu3R4EzuhZ1GeHefUhcTEyd
 OcwkJOjhKeQb5ZBta9VyOctWwvbl6R7RxRK1B3yFG91DsGuzXylxi6N2PDmI6DcxqCoG
 4jadE7tWl70/eTuHhT/kuz2q0jTDpKjHcsO1/U8K4ay9UNCmCNmD2oJDIRBGrGYjllf9
 uThOT3YzzBRwZWWcEi90FUq8TCvOf7+yp0Fa+TIRvqPflqyMIRay4jPlurYBR/+HpElN
 XMg29z2EHOez+5V1uw+gPRS8I50y2SfeypeGc+Kq97oQl08jciSImaDGLb6qLqsN6l5c
 OoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775750159; x=1776354959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MtCWA1T0xQbBhegHDKM+349gzPs0rzIjx+JTPgMFJbY=;
 b=QYdgDbCnBXC90KiwSHrL6W8IXORvpvPX5rr0G0Dg4LUIcqz1z5GsxrL+wJh6ajpmul
 MtZEYHRkOPbvaRoS/fnMALbTSQ2YYo60tO7i44RN0qwi1zq51N8g7EdmUWwtj/lwTNlp
 xm4v/U+yYI28/TbaDeMTI/fjIoF6pq2avETDY6FMkiDT41vjBKMuv9/aohUH/SMtcHiW
 sGuXwsImyESisTJgYa9FeEkjuu3URz7mbdg8xsl+TEEyQ9Z526zehaIbP+CWwqQPdxUM
 TqG9brq3QyTxFwJiQD9FbgzcdtA5ODVV7hWhNmW3u+vKIDPzKnHTCAZbb/pqgZB2sMf2
 Czmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK8TYGM5HMYn+z/FA03AYROCFfOiUAwQng17PyzNO4Dn9yntR9yBEMneDuG9800iF4LH1K4cDBMw==@nongnu.org
X-Gm-Message-State: AOJu0YxZGKfrrtBYe8rtKe1o54YAU8XX1bSfPgbbNBaApqDbJfj4CgP8
 2gSf3SOaR/nI7D1xoZ+NoOK8ik9QA4QLSufGgKth3XcczNYvKH4mhgNIfTTwXNF0VomkeYuy4vM
 WHku4dhmdBQvZMsMo33m7FUoFvzAb3dF8gHp1PoVg5Q==
X-Gm-Gg: AeBDiesucKKa64EQYARAcIEkTPUrYVc6WwreYD6+ZtIAD/sz6Q3ygEjPuVpBQ+xsxVy
 5HQ5detJ6f+Ce1E2ZJD5k2Y0bjxyGiFS5jmbUYlJFaHP9kF2+9zwD9zNIVNryRRKxFoHy7TpFpO
 esTFsemoMtQ4bG50ekLPqvsKWZyFmDQ1DnZvQNydRH1sQyAKcaQJcXGflB1eec8SSM8xRPPmrAx
 +ksNZiwTcZuFr3GRC6PdKpLSKuXVPFBdR8XdnNTz1dyTM3l5mAenH3Mn8O0l7R0mM8hSyyo5zpf
 TvZV+1CU1LIBmW6N0qf6txcJL6Z85EZW4SeZM1quXAjaS5pliq4knFrarjLuL33XRTU=
X-Received: by 2002:a05:690e:d4b:b0:650:88ff:d73d with SMTP id
 956f58d0204a3-6518719f379mr3224885d50.16.1775750158750; Thu, 09 Apr 2026
 08:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260401143456.79843-1-philmd@linaro.org>
In-Reply-To: <20260401143456.79843-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Apr 2026 16:55:46 +0100
X-Gm-Features: AQROBzCxCLHUW8TOGzGYfAPafHcKZQd36W7dBHN-zgV4NhGTMdpXAUbdirJIqQE
Message-ID: <CAFEAcA8yn9uAP4X=hh3Ch8JVhcO=byyTGZSLOWYU89iRUD5bAA@mail.gmail.com>
Subject: Re: [PATCH-for-11.1] target/arm: Replace target_ulong -> vaddr in
 guarded_page_br()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Wed, 1 Apr 2026 at 15:34, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Following commit 15500df3b3b ("target/arm/tcg/translate.h: replace
> target_ulong with vaddr") change, adapt guarded_page_br().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> I know this expands to uint64_t on Aarch64, but vaddr for $pc
> seems clearer, since this is the type used by callees, i.e.
> probe_access_full().
> ---
>  target/arm/tcg/helper-a64-defs.h | 2 +-
>  target/arm/tcg/helper-a64.c      | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)



Applied to target-arm.next for 11.1, thanks.

-- PMM

