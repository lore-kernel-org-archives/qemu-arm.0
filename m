Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353A7C531F9
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 10:08:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woejW-00062e-Tv; Tue, 28 Jul 2026 06:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1woejU-000615-Sp
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 06:08:20 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1woejT-0002tx-0B
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 06:08:20 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-c966b9ee9cbso1871831a12.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 03:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785233297; cv=none;
 d=google.com; s=arc-20260327;
 b=fDMwkEI0YNXO6rRx0Wflw9k1I8uFIWJROiEsh0Tb7WDNaMufYK4W0DOSAUNDlQeSJs
 QRJDNS2qxcYqaeGvGDlpGaCejByDDib/lSQ3bjHDEgkaHTm3fF52SKo+P64QpcNSErPA
 mCnjOWAFAmijbBgLPVgHjS41bd89yuN7koVVJkw3vzi/t7bHf/nbJiZ9cG18YGY1FhvY
 /CPhSRJF9Rhyzj5VeUhOOWO/nJdqi6aJy9ZZ3SvdjnHxP46pAdKu++LiLVA13wuGnFSE
 wLAdhpxXcNIKnUIWS93q32dnzKQeIZPFVEa7e1pq7++axAbqG5SKltrOFFugwFmtCepu
 VI4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=JIgVzNEEgAxZnCC/6kCbzkUK93pDVNFQiloOlOUEUK4=;
 fh=PpZ1CCXoZMh/DRvZh+FxXhmYvb7cgaexUeWdx5nsuRU=;
 b=lTepXs4RsU3nmf45IgoGpmDToEEgXfSmjMYlesZoRRwwpy3DO2lSv9/uZgmXKXhwyl
 XRZqZmee5SGrXdsYtTa6rIgOzyrYpC31p82rHCGYZKXBNm96PM0YCnqSgAZU/v6DnATj
 yEKw04FFpkIx7HUSwrXBrwTVyMpNt7Bv7wPH5CaYvI33qLK8PwcpLuxkmxQUkZPUD4M7
 /1kGGufJLC8YjdrBYk7p8Cpik5o77iU/6XOBwYkuho8lyg1ghx2fwZo0ct7GdyL58jlj
 WN9uqhA7MQmB90r3LJnrtzw+e5SSB3Dy3/KGT7wlUAnEeVCrG6SJmkwrsdW7rLkjwkH5
 1KtA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785233297; x=1785838097; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=JIgVzNEEgAxZnCC/6kCbzkUK93pDVNFQiloOlOUEUK4=;
 b=CCdBrwGUocPztSKaNj+d/AjgOiYWLNkGqoq7B+i5sWuF8n+w/p63HDFspUdYluEdgF
 JyWfginpiEjbZ2+pGMJvQMHwN+pRpycO3m/B4oo9kSB1ZcYtNgmRMSONexZxbdt4LOKW
 lR9QKFUFP2DUKzUz36RrcPSgDatOrJ8vh4y62dMSnQky9DwcnD54vrCLOWlqwbPUSS3x
 jHQHoB8NxrEqeQyZA7fBdP1Yq3x+ZYrhCw6xfA8efvEERyF9GgvdeUEEJ4N5DuRDGE8r
 VNXR8CXmCpGs+/PGT6ULdO3GQF24W6+gnixRAqKMCUeHRHw0cTrcB+bB3hUowCy0ZeJN
 Wdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785233297; x=1785838097;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JIgVzNEEgAxZnCC/6kCbzkUK93pDVNFQiloOlOUEUK4=;
 b=nHKCoNGPxIbCZ6FbY+7KKHubKm7RejFAiFxRrXrzhKS1/9QCZoMKLITikzc1rdLDQF
 HK9WxNGfw3NY/CW6lEzIKZcPW85+egAwrE5+p5GSmAhH/C8MXIY3CN+5MvtzwALD1qdA
 cFsIW7MRVuRlmPd3SYMQaG8pRWFzynEfG0WsWtdJ9L3lnrdXzcVjWqT2GHYptfh0L/AU
 /55UwMa5KQTRXEWGnlv5gJY02Sg/US0IlSBedh4Ry1FTszy0Evm4xk2WdNMjKE/HD4SP
 ZB5HO/kaZblJ1MPWI1XddRlWSp58l3ZVl3glmkHMhBD4A008TC4b0eGSmqPznNxtVBwg
 hbOA==
X-Gm-Message-State: AOJu0YwFfRupgJUFtsWDTOS2YV5OBYd3nPTB9hdoA3oXlH064Uwt/2D3
 vYLAn+GrDFzpPIQ0Ig5iM6ZMKONdVVsmx6WzrpTFq2mffbCSJEk0dQb9f/yIVIjfz+4tKvjZyHz
 txvTnw1N8abFxgZOdk2oLk00dMfZtNME=
X-Gm-Gg: AR+sD13tLrVJg7i5PxYRjSiu8IKKe0eyzr0BoxhbMs2oW4jNuvBpPXh0qD3eeoRV5v7
 Ot0v0VoLkwEwLoa80yPXPl2SBRCnQS0N/j+lUXX9F5hpeIs7hFQqo6x0UDsO2MtIE3i73YcvepK
 AlX8/qRpfJ5oJyOGO3Hgc4tZtkV6GU3QHASaf/YSFdhksRCKsgJq7knvXaCLFSNoDFMccV8FtOA
 4KuPtOdsBOUL1raTLMmehVo/2jaWV1WBnQpJFnqzRiqYWFehB8eJlJNrAru5FAgCCrTIOuN7zrn
 kZFTHKfzfgE1cNSXgw==
X-Received: by 2002:a05:6300:4046:b0:3c0:b766:751b with SMTP id
 adf61e73a8af0-3c8aafa05famr2253524637.14.1785233297451; Tue, 28 Jul 2026
 03:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260706173324.804340-1-peter.maydell@linaro.org>
In-Reply-To: <20260706173324.804340-1-peter.maydell@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 28 Jul 2026 14:08:04 +0400
X-Gm-Features: AUfX_mxvftl6QLAhz1gMtiJlX23nbPjTYQIYnLQwNdW1378YWXTbNuI4jb4Sj00
Message-ID: <CAJ+F1C+TO_-ktDqJnbeXuaCdAsomQMTvWZ8aAFndn=JPF1+2sw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/display/exynos4210_find: Clamp windows to screen
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-pg1-x52c.google.com
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

On Mon, Jul 6, 2026 at 9:33=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org> wrote:
>
> The exynos4210_fimd device has a setup where the guest can program
> both the overall size of the LCD screen and also the corners of
> "windows" that define where the guest memory should appear on that
> screen. The current code assumes that the guest is sensible and
> puts the corners of windows inside the overall screen. If it doesn't
> then we will try to copy data to an address that is outside the
> interfal framebuffer memory that we allocate to be the size of the
> screen.
>
> This patchset clamps the window coordinates to be within the screen
> size. Patches 1 and 2 are simple refactorings to make the third
> patch easier to read.
>
> This fixes https://gitlab.com/qemu-project/qemu/-/work_items/3795

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

>
> thanks
> -- PMM
>
> Peter Maydell (3):
>   hw/display/exynos4210_fimd: Factor out finding screen width/height
>   hw/display/exynos4210_fimd: Pass width to draw_line functions
>   hw/display/exynos4210_fimd: Clamp windows to screen size
>
>  hw/display/exynos4210_fimd.c | 54 ++++++++++++++++++++++++++----------
>  1 file changed, 39 insertions(+), 15 deletions(-)
>
> --
> 2.43.0
>
>


--=20
Marc-Andr=C3=A9 Lureau

