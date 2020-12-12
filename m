Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1014592lfq;
        Sat, 12 Dec 2020 06:02:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzb7rWOKBuIIkln/LN8wCi4pZs/uit5/xKm8Y/o0zJgS0RQjwIZEgRsPgfyGU5C4kZ2UMD/
X-Received: by 2002:a05:6602:2211:: with SMTP id n17mr21506514ion.107.1607781759784;
        Sat, 12 Dec 2020 06:02:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607781759; cv=none;
        d=google.com; s=arc-20160816;
        b=qT5ebaKGep21DnJJgSEF04/4xsmNiGHUZ2M+N1HYm4vsVws+wsIjKNXFNjfqjTYd9K
         CiVUoowuNLEdU58x1fj6IEPsiu1wx07TLt1yfP01Qd3/mBygnKxoIj1hpjq1OP0XM45F
         tkoEbIUpgSxr6Zh3tTY8IDb/LwwhX6PiAq3nwiE9CbLTnY9LZrdI6bBi8iIWGJS7P+BU
         9QA3/xPE13umTM5eUzHuX1ExRG+jMbmm6bbf4QRcTldahTpXSdlNn5YIPypEo+PP57+N
         ibBoDAFApvICJoMgsSow5bHWQgOveqZXsIfFENkRIufxA6fp2AE9cIiUGm/GHkqKPxa1
         loZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature:sender
         :precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=tzUsb1oAOgAwkhpFJliDtvmjm9NTDD2Shb+dSAyDTts=;
        b=DYyKyo+E0YrovUrxtywTKmbd1p7VW13FodAJZW+xILPl34M18TzzXwtIuwD6zITdol
         km0+nT6S0hkJb/oBdBSCS7wkoFJYhct9aQy1Ee2HoesGTnn0yIx/fKB82BSvmSp4ApAW
         cx8GRdYe68gQIafpTbEaNTjUZIirxxKmBX/50Ac7GiT9asinKRoOXacJysTuize5eGne
         DhcmOcz4ycDr0sFJRyGCr9V1jJP1CCEq7DUkZ2V+5ps0F/wqb2qRhd7+Maz2/zNfTyuq
         MyiRjegGYRb3obRMAxZU3Nx3u08RErE4mysJ92H+7ZOKrqMxtHNF5PTRzfAnNjRCBIQ6
         MAWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n9AuUX2U;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id 8si373270iln.91.2020.12.12.06.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 06:02:39 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n9AuUX2U;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from list by lists.xenproject.org with outflank-mailman.51179.90091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ko5SE-0002uE-58; Sat, 12 Dec 2020 14:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51179.90091; Sat, 12 Dec 2020 14:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ko5SE-0002u7-27; Sat, 12 Dec 2020 14:00:58 +0000
Received: by outflank-mailman (input) for mailman id 51179;
 Sat, 12 Dec 2020 14:00:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=twOw=FQ=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1ko5SC-0002u2-4A
 for xen-devel@lists.xenproject.org; Sat, 12 Dec 2020 14:00:56 +0000
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fb17729-8f50-472c-bd9f-3f358ec2a00c;
 Sat, 12 Dec 2020 14:00:55 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id h16so12382703edt.7
 for <xen-devel@lists.xenproject.org>; Sat, 12 Dec 2020 06:00:54 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2fb17729-8f50-472c-bd9f-3f358ec2a00c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tzUsb1oAOgAwkhpFJliDtvmjm9NTDD2Shb+dSAyDTts=;
        b=n9AuUX2UaXmUg0AQdVSCooAu338lwKCj9TI2vXMFYlfT+MrTniTIB3Ov4IeJJ5EASR
         fbuhpAaxcZ3RGcMtOTpL0vuS7vQfIonVhunxKGjpdkHffC8pDVeLM+InDVDm6o6XpkbL
         P6mG/3LV2OG3XF25pE3QaRjGvYuLBCnnBACJy2Dm+Y04ZS8ugdVDQSP+lDYK/HgVSMgZ
         29A4LIoUdyE3oh2fqxw4yUP5njhz0KUSLA5tl6Um9hjkmo+W55NmseDlfeyJ7sFCzJt1
         CnKA/jTtQxx8LpkVLOx9uTfZIrZeUYOjPn0FxC1TP9zqMDzGn71l0mcZNCBuVxM6ZVxE
         Tk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tzUsb1oAOgAwkhpFJliDtvmjm9NTDD2Shb+dSAyDTts=;
        b=CVgijQYcVm2B710/mz9IMa+dgqbd8TXMjtrQahJzSZj/Lwv+tMy+IgB5xn6CsGYuzQ
         o/2Y3FIUSC1fLqwUu2R56KcV0Vyo34F5qW+ROevxnFgffSpoN2E5CdzFciFLpjfdBjOu
         JTt11XTBCJVSI2BqnQ8E1O2ziZfFCvjgbdrCEneTfzEtgA3aRAXe6qgste9hCMuHGyub
         b3fKMK5Crj52uH5yR/qToIqwpbX7r5kB0CNByZ5GHrvXSXzzmtL/a0cgYWFEzHK3KNO3
         2Qru1SrDqNkPa/Fpl5Oyr6K0Bj1fe78t7tV0TaaSoqcvoQAhHpVCT04omRqKSsTUOOIK
         llPQ==
X-Gm-Message-State: AOAM531al2L2Jqd9IVT1DPInztyj75aDjQggnANf8F1PjmtYfcPMs/vt
	h3hTXWpfd6wN+D8aymV/0WYF1WrcV5unwHS/YoNGJw==
X-Received: by 2002:aa7:c388:: with SMTP id k8mr16509651edq.36.1607781654038;
 Sat, 12 Dec 2020 06:00:54 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com> <20201210134752.780923-12-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-12-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Dec 2020 14:00:42 +0000
Message-ID: <CAFEAcA_3eSKuAZj=pwV33csLdbVnsAhkm4ZNehinn7YYUkJ44A@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] compiler: remove GNUC check
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Laurent Vivier <laurent@vivier.eu>, 
	Paul Durrant <paul@xen.org>, "open list:X86" <xen-devel@lists.xenproject.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 7QD4IMM1bj/b

On Thu, 10 Dec 2020 at 13:50, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> QEMU requires Clang or GCC, that define and support __GNUC__ extensions.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
