Received: by 10.25.21.156 with SMTP id 28csp1555551lfv;
        Mon, 15 Aug 2016 11:07:15 -0700 (PDT)
X-Received: by 10.55.21.105 with SMTP id f102mr35202521qkh.269.1471284435622;
        Mon, 15 Aug 2016 11:07:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l3si14506219qtb.64.2016.08.15.11.07.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Aug 2016 11:07:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZMI7-0006fP-1v
	for alex.bennee@linaro.org; Mon, 15 Aug 2016 14:07:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZMI2-0006d0-Lq
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 14:07:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZMHu-0000gA-KT
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 14:07:09 -0400
Received: from mail-ua0-x22d.google.com ([2607:f8b0:400c:c08::22d]:35397)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZMHu-0000g3-Fe
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 14:07:02 -0400
Received: by mail-ua0-x22d.google.com with SMTP id n59so84906027uan.2
	for <qemu-arm@nongnu.org>; Mon, 15 Aug 2016 11:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bNYsYMXer4kq4HuSGb8eOWpAYAb1tf63GxHZvTxhH2Q=;
	b=SBLBd/EpJHcY3XV0wNl4nmtPsoldcURs+W8Wi7+6Gp1zz6lqJudFICsdvh4uYWomWw
	yRnA7p1OdnT8IZLU/jS7rFFk9IrGHDsSHKpMGD34PB2HdNbN4v7/VRky0ZYqZripsNfu
	gwAZiyISUcjBkfinSyYaFl00J/uXQuTi0h0+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bNYsYMXer4kq4HuSGb8eOWpAYAb1tf63GxHZvTxhH2Q=;
	b=RRFAr/VPQIitqTHyKN9daakOJhvEENMvGRT+AC8rYR2PuuAI9TEj/j2K78nA5X6DDw
	yy+wOI3R29b0Vd+aIZjcnEY2t2DDTs55RXjAgyD0nGqQK7XssmM/aAGK9M2SGhxSac/5
	N6TLid2RFd7oGHshKYZS00L6hjJlfU4gR01xEizpoQj+Kmi05yB5KY+wzJnpkGWDjTZo
	qqE48O0zVvykSIoim2Q9yJEffgkDr3dmGJ02TjOuBZNFm84ME++op51Y6G37QUwG84vv
	HhbPEbmv8gLHRX8+0rzrtHjTAPaijyI3Gf8mlzrxYNLgwexayc1rvxrJBIwXi9urNG78
	0GZQ==
X-Gm-Message-State: AEkoouvBkUhEOpZeFQ6z5+spoGhLDKdcIgouaRBeqYOmDX6LMex2pJ4UmL4jpdjPvnskvwq5QdNIWx9E93f3FWbM
X-Received: by 10.31.89.134 with SMTP id n128mr3021917vkb.83.1471284422060;
	Mon, 15 Aug 2016 11:07:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Mon, 15 Aug 2016 11:06:41 -0700 (PDT)
In-Reply-To: <1471283293-169850-1-git-send-email-afarallax@yandex.ru>
References: <1471283293-169850-1-git-send-email-afarallax@yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Aug 2016 19:06:41 +0100
Message-ID: <CAFEAcA-gE4TYZf4dO7wN4Lwbrg_=u7UsLJ0R+XR7qSDN2X0Amw@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22d
Subject: Re: [Qemu-arm] [PATCH] target-arm: Fix lpae bit in FSR on an
 alignment fault
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QHvBe2sO6Xzf

On 15 August 2016 at 18:48, Sergey Sorokin <afarallax@yandex.ru> wrote:
> If an alignment fault occurred and target EL is using AArch32,
> then DFSR/IFSR bit LPAE[9] must be set correctly.
>
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
> ---
>  target-arm/op_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 3e8588e..be27b21 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -194,7 +194,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>       * the LPAE long descriptor format, or the short descriptor format
>       */
>      if (arm_s1_regime_using_lpae_format(env, cpu_mmu_index(env, false))) {
> -        env->exception.fsr = 0x21;
> +        env->exception.fsr = (1 << 9) | 0x21;
>      } else {
>          env->exception.fsr = 0x1;
>      }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I've applied this to the set of target-arm patches I'm collecting for 2.8.

thanks
-- PMM
