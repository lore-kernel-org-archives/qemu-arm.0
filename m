Received: by 10.25.208.137 with SMTP id h131csp247380lfg;
        Wed, 4 May 2016 09:02:55 -0700 (PDT)
X-Received: by 10.28.109.86 with SMTP id i83mr32633620wmc.75.1462377775625;
        Wed, 04 May 2016 09:02:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id wf4si5730408wjb.218.2016.05.04.09.02.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 09:02:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axzG2-0004My-GJ
	for alex.bennee@linaro.org; Wed, 04 May 2016 12:02:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axzFt-00048T-EO
	for qemu-arm@nongnu.org; Wed, 04 May 2016 12:02:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axzFh-0003rx-Dw
	for qemu-arm@nongnu.org; Wed, 04 May 2016 12:02:24 -0400
Received: from mail-yw0-x235.google.com ([2607:f8b0:4002:c05::235]:35885)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axzFg-0003m0-7s
	for qemu-arm@nongnu.org; Wed, 04 May 2016 12:02:17 -0400
Received: by mail-yw0-x235.google.com with SMTP id o66so101236663ywc.3
	for <qemu-arm@nongnu.org>; Wed, 04 May 2016 09:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Aob12iSCh1ZkScdWYVqMqJjRWZXhuFvKnUaxmHMRZlk=;
	b=Bsh3YbLujfavLeHKPwTYUTSVWdASv7/aI4mHJabndib0T8yLbI2xvteEFqjc4cvbll
	NJpwgB8JCC9j6IbKnku3CFjFREpaN/AfmDtrv4qyE1dG2Fqd7b/MsQMTCipL+5I8IwmJ
	bEtwreOV7i3BcAVObW1AVd27qCwtUNVUXO0bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Aob12iSCh1ZkScdWYVqMqJjRWZXhuFvKnUaxmHMRZlk=;
	b=DQ8PRKMtLE3K//INDClSPyrSgxqyG5EGFYa19HKhFv4eXOKzc6jRRznkidV0MEDoz+
	07i9L/ncSIhEh0FdouQVxEvNfQJ+l/osKw8eW1fJQ2YmtpjZeGvsIWFVEbKeJjMhtM9T
	84SYDRYU+Mvd1cIEK3HaMnyd2tjy+uGi84xrm9hZzDgx8oIWK8C3Q619lejhrZhbBXjn
	EmgOBqQRzch3doqMglFoMTXxf5tMhy6NNjC2AB6Nyyfi1ZN0cEB+QTpRaYNeARoJQh3/
	5t+yDZs1MNvlBrGgikQIeopbxe9GR8JR2SYhYJqH9IwL4vZQQaGB3yfy5Zu2PHpuBZhP
	mltQ==
X-Gm-Message-State: AOPr4FVzTDBBVj93N6Sl5/1LH28B8VxewR7PTxY9ZD5qliKxCubI448Vohr85eZJeM37/dGBQ12PxGbqNnVGmk2X
X-Received: by 10.176.68.162 with SMTP id n31mr6374579uan.26.1462377714165;
	Wed, 04 May 2016 09:01:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 4 May 2016 09:01:34 -0700 (PDT)
In-Reply-To: <1461089238-18314-3-git-send-email-afarallax@yandex.ru>
References: <1461089238-18314-1-git-send-email-afarallax@yandex.ru>
	<1461089238-18314-3-git-send-email-afarallax@yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2016 17:01:34 +0100
Message-ID: <CAFEAcA9FXJjMM4M5sbtZ2vtr6Tw+=cene0=vsbEfJQ1RUb2o-g@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::235
Subject: Re: [Qemu-arm] [PATCH 2/2] target-arm: Fix an exception return on
 AArch32 instruction ADDS
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
X-TUID: DJYJnQgTb6Au

On 19 April 2016 at 19:07, Sergey Sorokin <afarallax@yandex.ru> wrote:
> In AArch32 instruction ADDS r15, ... is used for exception return.
>
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
> ---
>  target-arm/translate.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 68671b7..3e64ba9 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -8512,12 +8512,21 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>              store_reg_bx(s, rd, tmp);
>              break;
>          case 0x04:
> -            if (set_cc) {
> +            if (set_cc && rd == 15) {
> +                /* ADDS r15, ... is used for exception return. */
> +                if (IS_USER(s)) {
> +                    goto illegal_op;
> +                }
>                  gen_add_CC(tmp, tmp, tmp2);
> +                gen_exception_return(s, tmp);
>              } else {
> -                tcg_gen_add_i32(tmp, tmp, tmp2);
> +                if (set_cc) {
> +                    gen_add_CC(tmp, tmp, tmp2);
> +                } else {
> +                    tcg_gen_add_i32(tmp, tmp, tmp2);
> +                }
> +                store_reg_bx(s, rd, tmp);
>              }
> -            store_reg_bx(s, rd, tmp);
>              break;
>          case 0x05:
>              if (set_cc) {

From my reading of the ARM ARM, this "if set_cc and rd == 15 then exception
return" behaviour should apply to more of these ops, not just 0x02 (SUB),
0x04 (ADD) and 0x0d (MOV). RSB, ADC, SBC, RSC, AND, BIC, EOR all have
exception return behaviour too. That suggests that perhaps we should be
handling the gen_exception_return() at a level further out than this
case statement. That would also allow us to do the IS_USER() check
before we emit any TCG ops, which avoids spurious complaints about TCG
temporary leaks.

thanks
-- PMM
