Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D190FCA5FEF
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:23:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDOze-0007g3-HE; Sun, 04 Oct 2026 12:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOzd-0007fY-3N
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:23:17 -0400
Received: from mail-yx2-x2a.google.com ([2607:f8b0:4864:41::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOzb-0001t6-D4
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:23:16 -0400
Received: by mail-yx2-x2a.google.com with SMTP id
 956f58d0204a3-6768033d654so727398d50.0
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791130994; cv=none;
 d=google.com; s=arc-20260327;
 b=HcKMgHfoGgqAzsbSp1dWCXhuyjTIqWhOUY18D1+o0NmY2ufF25rYymS/vygmN0lZx+
 p+qHsmZJPr/LZhTOWMCX9SALlwNh0jW37WGAV31kiBCaDoyau5gISTo7N5iaB556EaB4
 ed+7PHwkTxsT3y7GFdsQsL1IdbEV3HJQc4LmS+FjqOR9VYXymfSs60KF16ff6KseCDPH
 ZQNbqIHq7f1flEAXSwjSoe+qCl426joXJxX+EQ4TaA+B9QXb4AMt5U03Cvih2pSzrwPW
 G9g2oFE5tL1l3sY99Dc7/Bze4UbxdZw0WVhOmiaredg6T2Jtdmded/+g3gmA8Cvo+Q0W
 xxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=0uWBLkvdDSFceOzyC8rYMyTgibfU19qKHDtqHeejCOw=;
 fh=+KXqlG1J7/UhFjrEbg3OzFhxUfRYPC7IWevmqk4ei2E=;
 b=eR1l9xlORMGDMYcJdsOBqUXb4Zgl9bA+8CIXhg8zEpjcMzG8flTJHUHmY5Sgu7O3pb
 4yErBYYGWBz8erJtrG/+8fI4IU0Fl7TVn4DdGfotip/8Z6r76vMhIfN37d6q48y1hs7s
 M0HM3PPxbRRz2ollIy9ik66qOvygWqc/4t8Tpa5twxDq6ZH/BdMf3EdjYCZ0mfoWPLhb
 MVJjeq5mrZm/2AJqiqGEXVbJxjVT6L4yehymIqOgspPbxXLLJT/Fa5/c/xPgOteeicvt
 mrhjZIzJSp91S4ZexH/UPipCNX6tcR80JVkpx1aFjYfFJ6RWmpKk5BGMDwCXEAzeB+PE
 WfVQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791130994; x=1791735794; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0uWBLkvdDSFceOzyC8rYMyTgibfU19qKHDtqHeejCOw=;
 b=fo8zKmx7SRep6DfpCuyY7VXSODFtYf0mj4nPdwpjSUpmyC+HNB5c0JsKhlrLS/uYDt
 xTMEkuv8OZDDBUYNc6UFJpt2nkCTGAh78mM5LMZu5CFHMZWJz9yzUeVwMQfwJn9wrTeO
 emwBLYq5xINA1inYXQcTZPtSQUGr1+4INK8Wc1StN3xGmcW8/rIPItpnnzhwzTcZrP3W
 PO5Xun/+dNraw9jIJNksRqiNOmv91dojfj3HZ/RC3dMOpw5+H6TwiXEysAV5EFv5PQuX
 fgf2oXOguTDMWJCD5ZXzsZWTIbI/XoFkTTbm/pLtWjlU4evWSziQ92uWModcluWq23ox
 L9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791130994; x=1791735794;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0uWBLkvdDSFceOzyC8rYMyTgibfU19qKHDtqHeejCOw=;
 b=qVwY2HJhOeZRpDD+UZGabb9eQbz+XIDRu1b9goLTx6a09fdnku5jkT47FRkvnJXa6w
 F27oJkO+98grcHB1Y/HVGsq2rpg1+wEg+2WDODb5aIqGFJft8511K7pUXURh+LFaKsbc
 10UZSGHAdaUo+EmxnEOE2pXTELBZzQa3HSJNg0pRzthXYu/VAHFcaVakT93GFg24oPbI
 qzgY66fowL19F896eZHQUsT4e8jYX/6JbL2M39VJqUVSqUsPS6HNedCr1avpmqhjm0Rc
 xYo7jGuNKWLuG+6cfo7lscYtY0i+Z3UBnpEGk+RF3hthycPM4+bPB5KX0TSoXtS8xehK
 q/rg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz6ELB097YdgGG/uVrXRTjK0fxAaZJ9K1lf7whQMR0Je+SeqQjHjzqzia06839gUutq1t27yHjlpw==@nongnu.org
X-Gm-Message-State: AFq9FYKEPIUGYvT+2XaLUCHcay+fnhDWTDQdV2yc6o+FGxwhJdUFOi4p
 U3AQuCXJuNDtvc6qFwMyVJiiqS+W50QSwcemSvleHRpoJh9H9FpkwTK8jOKyD10PKmeKoCcKqWd
 r67zf97tqKayS9vq2gDnUKSc4rvrRRVU=
X-Gm-Gg: AYBFou1xpGd5v3rEGoDDFWcIUrvVE6RlYvsbZuLPIRC/n/DrzAuoGoxdCDbecCaQeVr
 yjFLgDiyinMLClWF76SKrDZVyvScqHi0R625iqMSWGtaFGastv3f/1LWOsJUhrJqkKZUjHkR0wr
 FEofbaLyrebN+WKawVfZZkeLmbvhJFzmCOfpjrXlkkFxlZMzRiJcsTnO6l7B/TH0p/TPa9/2lBI
 JcqCx6+MBohCM1BjfAOEKIZZaklzgbopvijLNQfDo4FqQei0N9Q8CVL1SBczUDDlhqf+Gt7liwB
 5uUGhJjgOaQNj18A+X6JGH53M+rpdTwo9sil6bq/jes7oHDmsiVlh4umbpljgg6Mtf0s+2fg1zd
 AX+O5FhYll67QHFU=
X-Received: by 2002:a05:690e:b47:b0:672:bfb4:5f4c with SMTP id
 956f58d0204a3-677ac1dce4amr3501287d50.101.1791130994268; Sun, 04 Oct 2026
 09:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-25-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-25-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:23:02 +0800
X-Gm-Features: AclHuK_WFrgaXVnhRvm6p4dc3G9NQEYGWbXKAEa1ayUH6DDGMpX1j7g2IZayK7U
Message-ID: <CAEUhbmXf-o+m7_L3EHJYXZmGb_SXzksFb13MY4EwScuK3M1HLg@mail.gmail.com>
Subject: Re: [PATCH v2 24/30] Kconfig: Extract config IMX_GPT from config IMX
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x2a.google.com
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

On Sun, Oct 4, 2026 at 8:32=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config IMX_GPT to eventually eliminate config IMX.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/Kconfig       | 7 +++++++
>  hw/timer/Kconfig     | 5 +++++
>  hw/timer/meson.build | 2 +-
>  3 files changed, 13 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

