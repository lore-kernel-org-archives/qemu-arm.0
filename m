Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6531CA5FFC
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 15:05:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDkG3-0007ZI-Bp; Mon, 05 Oct 2026 11:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDkFm-0007LA-Nc
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:05:25 -0400
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDkFl-0005ir-8q
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:05:22 -0400
Received: by mail-yx2-x0c.google.com with SMTP id
 00721157ae682-8a87fe69060so12264867b3.3
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 08:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791212720; cv=none;
 d=google.com; s=arc-20260327;
 b=BRfc5UopWv87NTvhltWAVZRaXHVL/XmcXxFw251zI9WQZ4Jt9PmGQJUSbtnNJLjoLI
 /9pMaPmPPO/CZx2wY0FvpDxOQnyJfMWid/FBluQFiv0hRdLn4ME2N9DGIDC6GFqnFoA7
 0kt3Ux1eRukJPeUkP/ye0U3QEqRpfVYlxK6CaRux1hkvzF3gfFXM8TYxqR0F7rWZF7/8
 GmSR8WYadwVe3Wf5TZV/Q5opRJqzkIK2IV18kkybs4RtajdP/0GVrA41B8sSvZb0SdiM
 xpmVn2snr4G8gIOxir7X7NfxSQUE3cmSiEp4+tQdkZR4yO8yLkSbR+DzM1hxhV0MpbrD
 OtxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4KcoWNhRKkBGA3tAv9e6pyRHghGbdQKqmQsVa9lTQvk=;
 fh=FhLX1LcIgTgCISdf8G+23cCy3OomUaN6C31VpehCepw=;
 b=UZPNhJr0i3CNuot0I7FDP42PjjCFRlnoYxscOK5autvTcRrqv6i3nPg2Qyjd8a/xcQ
 h7McUVd1pl0pKEtOgVlDncGflLRKh1Mfjt6orggbaQFbweGqWbscOxEMoKg4zR/oLrrQ
 Y1yzRM/bzYjfC7Qc9LH8tl7Yr5En8H6drB2dbvNiNdQFD3wbCxGB0k7zDB4gBFFzWgTu
 IAcfdFI2Qn/HU+UGg1VqU//NV5aCMQ0BVOAZ/K0mvVAYjuAnU8D+69cBSSYklIbrR8uw
 SSqu+Swln2JpavHsNjZgiVtQszalmMUU5qaVuWIgeSr1bFAdCTy0V/kQYHF0fX+OfxiX
 UMcg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791212720; x=1791817520; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=4KcoWNhRKkBGA3tAv9e6pyRHghGbdQKqmQsVa9lTQvk=;
 b=rt5htrV+aW6H72YNSBDwq504zXLZYo8Oa6Q5hroT7c8WGVguXG531UCtYLnhqwArW3
 FvXf1ngvNdEGTxPSELI7oma++7QLwTBi8t6HKIPgc7WEa5vyDn2BeRLzuWnLBDnSYRyE
 dCxKc7WpIfAOfl7XdbDpnTo6Tj/MTeyVgA5WUSNTo05PuY1/hgSR618PrBLq+cGaiIhX
 DNgvNWTgHF7ayWp7+q1uP8vTnFOEbU1WRkA7eJ1R0cwPwCdU73tKMrnjDPmVlvmHCziS
 3tMcazP4M+MGaoCQu727+UxzhrfFGlt0wEYAjo9zYwdJA6qaQkPiXTn6w3+l3060khga
 PYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791212720; x=1791817520;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4KcoWNhRKkBGA3tAv9e6pyRHghGbdQKqmQsVa9lTQvk=;
 b=OmcvDEunzCi2CYZGGRQF2DxSpKZBd4J57DF+uS/yjvF8huy4oLarCpU6hz6i0C0g8h
 GEGIzepRp5+Z5mJntDrwNgVDvxrjHGp17cjK3/viOqoBgX3WlnSI6Vyghuz/FltYn/jp
 WLXxuMuAfCwOkjQUsC+Lj+7MPs7Bv1HpxP8baBnNBaOiX1PI4B/8tGgAH12jcsGoYg08
 Wlv/fXjrqgpsmjwnsBXEfGiCEBLyAIMEx6TMVvJcc6bo4hjYEYcDsk3aMQ+cWaQG9SG1
 4qse/ZR+EbTv8/62GqhJqXFDPI43SETIg1lrKzKM5NDQuAAyNmyrZAmxl56CPGiXUUk2
 DyvQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxBl28Iasy3YjHAeoTaHLr/JUHx6/Iy4b+OCSoj6pQnxbTyZEWuJlO1ZFYApw3lzi4/JfRtCapFXw==@nongnu.org
X-Gm-Message-State: AFq9FYKotCaxigBjh4BUpMMKRcws2koq7VytFhUTgMF8vijkosPt9K+6
 Supo0UBNDdy58+nGVUvn2c78V6EMwiFKCSMwZmDONmDmZJICTfCp37h5Qwm+fbJGwiFThyikU6F
 6fIPW34NqmX1bJzJTsmxtu62f2wUnx0Q=
X-Gm-Gg: AYBFou2pnIv7Rcjt4x8V4LtsEkPgBiwRijMoERFSl+KuH0DQ2+1OqXP17krU69p0sKd
 1GrbbXO0PyJ574J/ZWBo1mFtHFGvQfmCHEMKk/wFZb7BhGr+/Vogqeand6kf0ziqda5XTg19/QL
 0pmhQMVwLf2bz5B+/oHtGvaapjNei8432TRNLFl9ZiNE7FMyccpiYiLBMv4C9EyKkyl5/WaMfYj
 7CxFfdsMpe+A81Rk/ICvjjiJCh5jdK51Da1lNoZ/aUAlTgAtnk4wTQ4Yk7LdIVxd7rodvFnPe4d
 FaZJ5qVXNtUofrdWFJm+lI6Y+fhguTd4JyYPQzQAZp07QcFkvQxCu8xVbNOy27RJ2t6e5DZdkR9
 XPVaVymXFeUesXpcxnYrRq9ALxg==
X-Received: by 2002:a05:690c:e3ef:b0:8a9:97ba:26b9 with SMTP id
 00721157ae682-8ae39bfdf0amr49927697b3.41.1791212719962; Mon, 05 Oct 2026
 08:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20261005101800.10821-1-shentey@gmail.com>
 <20261005101800.10821-12-shentey@gmail.com>
In-Reply-To: <20261005101800.10821-12-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 23:05:06 +0800
X-Gm-Features: AclHuK9bi0TYBNlCb_SKzXAJdc1S974UXVFyUjiee_wD455NwAjxXMeB-7ZPE9c
Message-ID: <CAEUhbmWSkX0Hj_X9+o8SY0+PB-ZXU7sD7P6rXHBtrGucugN59w@mail.gmail.com>
Subject: Re: [PATCH v3 11/31] tests/functional/arm: Add console test for
 `mcimx7d-sabre` machine
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
Received-SPF: pass client-ip=2607:f8b0:4864:41::c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Oct 5, 2026 at 6:24=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> The test currently exercises the Linux kernel and waits for the first
> daemons to be started. At this point, basic hardware is initialized and
> if the log message is reached, no driver ended up in an endless loop,
> thus the system should be usable.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  MAINTAINERS                                |  1 +
>  tests/functional/arm/meson.build           |  2 +
>  tests/functional/arm/test_mcimx7d_sabre.py | 46 ++++++++++++++++++++++
>  3 files changed, 49 insertions(+)
>  create mode 100755 tests/functional/arm/test_mcimx7d_sabre.py
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

