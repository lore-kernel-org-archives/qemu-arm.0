Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3150378wrt;
        Mon, 28 Jan 2019 03:11:21 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5Cf/lyeqcNj8Nt5reUxHxptvAhYS3hG0MlcMpRQp4mJAY+smcicset5YtMrxta9qqlUXla
X-Received: by 2002:a5d:4d11:: with SMTP id z17mr20265408wrt.209.1548673881070;
        Mon, 28 Jan 2019 03:11:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548673881; cv=none;
        d=google.com; s=arc-20160816;
        b=c4wcLF9//g18Fuz7cvbeLBKhE8yKAymmgJSauDKk/KapBzOeuIHhpQ1ktMjMLPswnQ
         rNVvtmapjJa5vU1AX+pm8We/cBxSBfNHyxBZ6lxZ0AiNsVOwHLNYJuCfYMeJCgZ5ZwMm
         wartpyshzuTbGbk6Z3X0wO+hLDdmU/xXy4NfwIV00ypXWaBiVZcwQakaZnE+cgoiv+/8
         EDqRIVFFgaKskQ9MvRNjhocFLuYDT3UNAXKpwdnh7gkYjdOZ5MSmfx4P313/ZkeKPlDL
         ar4fQYHEKaWwaeWhZLujvlp8GElQ+Dr9g3F3jM78nwIf1Vn7AxbCHt9hppQCO8JSoyjb
         Gbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sLZhZCCGL2T8Tx1XQAwwJ7F9vpz1u2pl9di1M7u40ec=;
        b=lLZadXRCc6bjsBkp0NaAyh+BIV51bHA5ztNFlPwJnmYJZMdNcnJ/uHQIwHQyDM52O6
         hj2mAQ+lWy3l0ViRRwJjN8UrpsE6GE9E60XKv9bCXdU+IaHUxMaPvMC7hg8DIy5I5pgs
         /5a6YQgWJUEq+h5V0is4hiRF+L5XZOFDeINy6KjdlB3l2RcYZt1rvkkbYFJv5J+c/tR/
         ALr5OjYZWNs82KAHQNI/bJ/yHs9ET1CkCTwE07JvhK2TI1gmGOvEqK8RP6UMC5zMLOmN
         f3sGaj/4NTSknsHd5dsDMz6R/wsEHnCE1k8bNKS8RA0AUQ9fiZ1UpaL9oZ5e8mjDmpCw
         ReTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pCiABXDV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si77153382wrl.284.2019.01.28.03.11.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 03:11:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pCiABXDV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:57999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go4oy-0007B4-3R
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 06:11:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go4ny-0006WU-GM
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:10:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go4nx-0005kM-NA
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:10:18 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:46565)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1go4nx-0005k5-Io; Mon, 28 Jan 2019 06:10:17 -0500
Received: by mail-io1-xd44.google.com with SMTP id s8so13070350iob.13;
	Mon, 28 Jan 2019 03:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sLZhZCCGL2T8Tx1XQAwwJ7F9vpz1u2pl9di1M7u40ec=;
	b=pCiABXDVBzfrLHbJlk3UUinOATCHXZ0iNp+85c6ylKcd9TRGj9jECznsBpauj1GOAz
	yFP4ra1dfqRXcWVMpvu3fvH5EikEp9H7KCXTaUzwlFlqbq9hVGM7tj1RkF0awahxFv/F
	L+T5XzaykMrDx8sWpz/CkmqIvEmCwl3/FSkzXj6LBDy+XPYP1isVWIZgdWKSKvo6YIxi
	1hp/F3uTfTXQtjmTsQb9NAFYk+Qlr+/QYeYaLlJifCqyirmZNMrp9w9o4e5FD7/VLerF
	k5JYpO+waKL4E55ZVjJBQV+MXge1/UMzB9rjDGwA3Dgv4Ry6TbJ9OncAENUTMPRIGOuw
	QuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sLZhZCCGL2T8Tx1XQAwwJ7F9vpz1u2pl9di1M7u40ec=;
	b=Y1ixvQF7UnDnQwMGg7MIEMAJH68hIRJUsIhDjKfBgP31gGOVpmW0iRzSHC9mUFSFco
	2TeJ8ndM8ybdcNIQmf4veJp1/8znWXb6bqhOt70G6URwIhssACE08WA2E5LVU+XyQDtt
	ZJmSm5OncblQ5Q7p2TNf6eP3q2N9Uj20e13bniXSeEdduGdYZTVOm/ZQ2hfHwXDdPvZb
	ihBIOJolXR7tiOkMvhsDHh8b4wQLq0cR51OwuUJ0iV4VccaDkAl6a2sNr1BPc/R7PcOT
	UPwhaOfe2SetO7MfKocDSf3c6oRYHQUdnE8eoPWGnSyQwtpB+Mq8k5LKoASjJYOuDRZT
	53Xg==
X-Gm-Message-State: AHQUAub7H9WI2EU5ehgFwn47xZ0zvhbDA+uvpnHr6r7V/6BC817VeHNX
	J09a83CyR5Cm0MN7zw8Jy2CqeBIPe/la9XyEudg=
X-Received: by 2002:a5d:9456:: with SMTP id x22mr10405437ior.282.1548673816660;
	Mon, 28 Jan 2019 03:10:16 -0800 (PST)
MIME-Version: 1.0
References: <20190125182626.9221-1-peter.maydell@linaro.org>
	<20190125182626.9221-3-peter.maydell@linaro.org>
In-Reply-To: <20190125182626.9221-3-peter.maydell@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 28 Jan 2019 12:10:27 +0100
Message-ID: <CABoDooM4=pTLvdVB9=uOz8n93qMGfR0poq==SfbfvYMfvWGy8Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d44
Subject: Re: [Qemu-arm] [PATCH 2/7] target/arm/translate-a64: Don't
 underdecode PRFM
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: InI7U9rQle7Y

On Fri, Jan 25, 2019 at 7:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The PRFM prefetch insn in the load/store with imm9 encodings
> requires idx field 0b00; we were underdecoding this by
> only checking !is_unpriv (which is equivalent to idx != 2).
> Correctly UNDEF the unallocated encodings where idx == 0b01
> and 0b11 as well as 0b10.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  target/arm/translate-a64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index e6df303e321..8e081758e03 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -2803,7 +2803,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
>      } else {
>          if (size == 3 && opc == 2) {
>              /* PRFM - prefetch */
> -            if (is_unpriv) {
> +            if (idx != 0) {
>                  unallocated_encoding(s);
>                  return;
>              }
> --
> 2.20.1
>
