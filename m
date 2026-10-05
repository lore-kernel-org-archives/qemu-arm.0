Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61486CA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 14:35:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDjmf-0003c6-TA; Mon, 05 Oct 2026 10:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDjme-0003bO-1O
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 10:35:16 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDjmc-0002wt-Fe
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 10:35:15 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8a83d2706fdso14385547b3.0
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 07:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791210912; cv=none;
 d=google.com; s=arc-20260327;
 b=VG4PON2pg4iQewlBsSkjpV1+Bgp70d/RkonnKBqZos6bbIv8nS5DU67ibpMB4Gqi9z
 f8xtiFphek+NsfvtIOyeeWod7ci4r8bJwU7YA3RCtFbdil2JATKkAhHHR73Hw9v8DVlS
 TwNv5dOlz1N8PtyGoWoy5YYu8BojwLoYAogBitrEILGZi+31Xjd1SCJxBeUjvrqTiY8H
 TPuWtoJAkNVA7HPQoJUG2dLnppnxeJxiylAzDJ8jRlVnYB7UPC8lHp5gU1aJQjA3WqKu
 M4Niuy/gQrEUHo3jGNALp1Znat5uhv9P5hkI7eAZamC4QJis1aWkd/w2EQit930qK2xF
 WBGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jQpfOH1sU91g0An23pRVa4/U1ZxQ/WMkIzNgKV6yJy8=;
 fh=anIme9p5m0kkPLDvDtU7AuqPRaN8J/nKZSmLa0eJJYM=;
 b=cchYegZpvaopcgEk9NGTBHfVaxej/J3Uv6Qob0U571+MR1RMMUriRXY+JsWmUDg1MJ
 2n3CD3yZPGTeoae/+GBR1gcC0ySJhzeiFUZY4KCvNZilp0YYaF387NAVn2fMcYSBRYLr
 C88kQA5MertlPXxIb5gfwyzs2Kh0O2Gz6EevPLcrXxMyJh3V5CAp5FybLQCY+18oZR44
 AiBpq9KdgsC58Myx5HcbQqGxL5QqlZ8p98ZyPjVn680ea3sVkUNYUJ17nhOcxr6t7ZJE
 kfliUZAJByqILxl91/6PuoO5Ki4rRTD+0IExbry0mPZAb4EoomPZhS7AvtPlzvDXg6Yn
 lDSQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791210912; x=1791815712; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jQpfOH1sU91g0An23pRVa4/U1ZxQ/WMkIzNgKV6yJy8=;
 b=cR+BMq2qotVMcAtJ7chvykq0zvw6y1T5Qj2yMOMFtRpcTNErnwR8Tm/+Ema/D5jHJx
 UeAEkHYcg1AHn+r+EZ0aegEkTIZ9+6HcCwWO+6AntLFTga61fo/Gt9v8Z2DYcNfQvwTZ
 VbH7Zrgb42rTsqFJzwkKrwoflUyjG0BsXFb1Fvr3P2OexTexeCMr5PaC+16IMviTe9Ng
 bOFApFOZiAWkHA+6G3JtuwROA7efq1r9WWabKi21hUukqFt53eftUjSEZCGGy1Frl+kh
 seTaFFv6WJYyzeba7XB1mWeficx0lS9AjzLpZTRXSopfreKdO0ez5ejqJj4ODseDNF60
 JXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791210912; x=1791815712;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jQpfOH1sU91g0An23pRVa4/U1ZxQ/WMkIzNgKV6yJy8=;
 b=SOnB9BnpNe9gUJxZVFO2FKyykSnY9cwhX+eHOpR29diKwmdfbmIYw3JXU+G5qz3zfQ
 KjzV9r1LlljK4FNAPicnepGTpYD8GfYIx9MZFdTXraQNHv7kw7yuWrbTH28c9EtZ8bAj
 m2ufnCZOMmTWaZD6OXnLgjOQrxta0IndhCoHJtu7ZTi5sL7jfVH0APxg1vH13KxImqeP
 opZGfYutqXkzpKOG8fAsOpvKH5djt6ly006f6k4tRioJG7AbRZRTbvXSoFKz/JQc/RRw
 4zZa7RDqkQSHvAqJjakhBzTj/P7TTbZs0GHfCLaCCl9s1qMOQwr/hWQRFQURKekOv7S5
 sq5g==
X-Forwarded-Encrypted: i=1;
 AKwUvBwqXrJUWRsy90AHFpfUcxEDjiEjtIWhe6vSq5uvWfryVZalZclfZdXESv0o8/UEmREQhK12AVgrFw==@nongnu.org
X-Gm-Message-State: AFq9FYJjz/qLr9OmNDV5B49gcUqaQdPEUdqIqZJvsY3yHP6f81XKeaUD
 ot4VevpUyf60B/SHHNUlz4pNUZG231w1pB4dI9TAidaklq9gSmrtxT5OK+Obv4K1/gD8d+89OVp
 wDaAnDNHcoZEUbEAvOK/fztKF0KzxiMA=
X-Gm-Gg: AYBFou2vK0IGaRaPsfgRbdXHfqrhbSegFXimjvWbMI7PEqyX03TARP81VwglqE0H1Eb
 2bJkyVgDi1WD+zRBQYlzNV218YUQcMY8RilSAG8xyYtI5EGr0ClbhbKprtvnxR+uNHzInfsbETQ
 EnykT8tQXfjZcF2CemuZCBgLGTL/VYpa+voeD+z4m7yqWbcJQZPaFLGRW4VHSFIdRgG5ZC3y8IL
 fulfaIn3g+YrTGTS1iZqZGZSr6CvXdRXO5XhSyW6dDa16OcHMGcUJucRSUKZR9sgNyqDWLpmbfD
 j1BH1CV7as1smPtES3FyJb+Nj7NOX6QMQfC0BLQrnfOuas9JuW0knhVDaeQiQ3q4IYiKw0TVD4L
 /wPYuBavjE12rn+QH
X-Received: by 2002:a05:690c:e3ef:b0:8a8:8456:a973 with SMTP id
 00721157ae682-8ae94ce79d6mr22117047b3.41.1791210912392; Mon, 05 Oct 2026
 07:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20261005101800.10821-1-shentey@gmail.com>
 <20261005101800.10821-2-shentey@gmail.com>
In-Reply-To: <20261005101800.10821-2-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 22:35:00 +0800
X-Gm-Features: AclHuK_3cBUj5Xdn82d_2FAhKy5DX38VsAkUgNGtXZjhCc6loHBK7N79CD7ApYY
Message-ID: <CAEUhbmUg7PJiPzLSspj_ha8_KKRiyhEyWk4J93sXjge_Jk-d+Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/31] hw/watchdog/wdt_imx2: Preserve own locked bits
 in WCR
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Oct 5, 2026 at 6:21=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Apparently there is a typo in the WCR locked bits handling: The locked
> values for s->wcr must come from itself rather than from s->wicr, so fix
> that. Without it, guests such as u-boot may experience inadvertent
> reboots when configuring the WCR register.
>
> Fixes: daca13d495a1 ("hw/watchdog: Implement full i.MX watchdog
> support")
> cc: qemu-stable
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/watchdog/wdt_imx2.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

