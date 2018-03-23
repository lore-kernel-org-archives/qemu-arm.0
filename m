Received: by 10.28.71.155 with SMTP id m27csp368581wmi;
        Fri, 23 Mar 2018 04:50:49 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtmFPyRTwTVeiTuzQaHUIlCtMT2FTmL8ZzCLPOYqyneeRlv1Nmp69FzbDcW8bmLiAZHa6VE
X-Received: by 10.55.89.7 with SMTP id n7mr40845022qkb.15.1521805849027;
        Fri, 23 Mar 2018 04:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521805849; cv=none;
        d=google.com; s=arc-20160816;
        b=nqNqp3pA8jJRNkqiSkuFuxV4yiLD5J56x2FEVzZJPp9iO8QqKVuNuJiD5i2g4mbdvD
         CMbRlcg9KikYEYzcECG5KvJY/28aQIRIjtBkImaAV5hz9o+UxNW/MZcTroFGoab+imk9
         BR+uoia50LhVdZ/c4DMRK5zzjbRruA5jLk2NDTW12vOIAxaIfb2nP1yVgLmCDjXJQ8MO
         w1qivlmCjOVNdKYw7lsrcRxvzZZpU8pQ10Dyouw0XmHJIVMB+Pm5Rvn4/ApEBxGq2hBa
         kQrZmb2pSr13mhiP6qZmpxQxlDVmY2l187xQR6v+0zSudQIlkgwT/v313hYQfug4+XTl
         7r2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5PZoWcIEtfKjOYLuE8ySmA+UwCfzdpXhnOFRyevyct0=;
        b=qM7B2brcG4fwRBKZtBDXVq4Xc/Kp6SrI2jeSxMITH7aH9OjyZR+TltndOFbP+CCG3G
         UWqdnYH+AUHfyVFjvoRP1b3BxStaJZbgCFSF701Z8TQcr9yvrW7RtyXHMUWE7YyJwhHQ
         udT0Mr0t8mW5xfR9wxJ5WyCiE6isEvdaj71sUoBdFBIYaEbF+l5lsYWsHB5UvbfDdthR
         Y4p4ZYG0OsUEDZGfSNQyRzZsLgOSanWIgyBETKi5ENaBVYC82+rqR+jhKADT2UDQ6maU
         Wwm5tX23078K2UAapYC+jP8WDMaYfZWHhrS8c7sLOIRyAJ0+x6bYUB9uRy2luZ5s3wme
         UGVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dQKwnXrH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q130si1354531qka.320.2018.03.23.04.50.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 04:50:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dQKwnXrH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezLDc-0003wy-Ht
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 07:50:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ezLDQ-0003wc-O9
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 07:50:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ezLDP-0008RY-Pv
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 07:50:36 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33514)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ezLDP-0008QQ-GK
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 07:50:35 -0400
Received: by mail-oi0-x242.google.com with SMTP id 126-v6so4085187oig.0
	for <qemu-arm@nongnu.org>; Fri, 23 Mar 2018 04:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5PZoWcIEtfKjOYLuE8ySmA+UwCfzdpXhnOFRyevyct0=;
	b=dQKwnXrHHF5vEE38104RoFRuUYMsRygdOAAoAYh0B3CTY4C6bfbkF9LXOT4ol1PAkD
	o73QSvngqp6nHtll5FjGhObQ9AH5XgbDzoYd/nmS8zzZAG5wEfXOjymtEPDIvz+urEBk
	SX0YpT7KkXmLAg8hjdF4ZGg6/tzQvdKkr5p+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5PZoWcIEtfKjOYLuE8ySmA+UwCfzdpXhnOFRyevyct0=;
	b=qhYaUxtlZzsxYMUzkDOGjMjGzPbPKBxd4W0MIoD5vmW+D0WRk4HES+ylRtskQsdRlE
	bNQBLlXiyqJ5N01Lqd8ROPrGMcRgCogjZzV8eWaMMNyDpnkNiDVCahU9kfYqSOrP0Pxh
	kUIwOwGtLVpS9NjO0LKYJscrcQrVeugdXyqbJMOIH/tmHRPuOUP4/ZqxR5UiCMl35c05
	ZRazvPWM1UYP0z5QCIHaQDW3edfTHrlfWzdc8YVgPDd248JjeYHaAMwiTlyS+M650C0R
	OiDYR35/aDPObV1fZRvJlWTWA19dOp8svxTQNg7UeSh4AuRqbrLAeNASWA/xXjjri0hu
	yhZQ==
X-Gm-Message-State: AElRT7HI8M54rNpbGJjRS4V5QBU95Q6nX6G4REOuwnDwsa9CmaMuOW4N
	ZqhOGFC72x8YMTbKj6pTU5qS6VTsB8D9kQ2bDCMe3A==
X-Received: by 10.202.97.87 with SMTP id v84mr16531686oib.12.1521805834541;
	Fri, 23 Mar 2018 04:50:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Fri, 23 Mar 2018 04:50:14
	-0700 (PDT)
In-Reply-To: <1521777509-22896-1-git-send-email-onursahin08@gmail.com>
References: <1521777509-22896-1-git-send-email-onursahin08@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Mar 2018 11:50:14 +0000
Message-ID: <CAFEAcA9G3xVjmjys2R4-NXRHiZwLVLRO7ZQDZ0AhNMHHFhHV8A@mail.gmail.com>
To: Onur Sahin <onursahin08@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH] target-arm: Check undefined opcodes for SWP
 in A32 decoder
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
X-TUID: Uxe2ukjsVnbL

On 23 March 2018 at 03:58, Onur Sahin <onursahin08@gmail.com> wrote:
> Hi all,
>
> I have noticed that the decoding part in ARM/A32 does not verify the
> opcodes for SWP instructions. The opcode field ([23:20]) for SWP
> instructions should be 0 or 4, and QEMU does not check against these
> values.
>
> Other opcode values less than 8 are Undefined within the encoding
> space of sychronization primitives (e.g., SWP, LDREX*). See section
> A5.2.10 of ARMv7-A manual for reference. Because of the missing opcode
> check, QEMU happily executes these Undefined cases as a SWP instruction.
>
> The following fix adds proper opcode checks before assuming a valid SWP.
>
> Best,
> Onur
>
> Signed-off-by: Onur Sahin <onursahin08@gmail.com>

Yes, we've been historically a bit lax with our arm decoding.
It's good to tighten it up, I think. Thanks for sending this patch;
I have some review comments below.

> ---
>  target-arm/translate.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index bd5d5cb..fb31c12 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -8831,7 +8831,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>                              }
>                          }
>                          tcg_temp_free_i32(addr);
> -                    } else {
> +                    } else if (!(insn & 0x00B00000)) {

I think we have already checked bit 23, so we don't need to check it again
(this is the else case of the "if (insn & (1 << 23))" condition).
I think we should also be checking bits [11:8] are zeroes. These are
"(0)" in the instruction description, which means that the instruction
is UNPREDICTABLE if those are not zero (see A5.1.2 "UNDEFINED and
UNPREDICTABLE instruction set space"). It's architecturally permitted
to not check those bits, but elsewhere in the decoder we generally
prefer to UNDEF on the UNPREDICTABLE cases.

So I would make this condition
    } else if ((insn & 0x00300f00) == 0) {

I have been adding comments to the decoder as I modify it which
indicate what bits have been decoded at various points. In this case
I think we should add
       /* 0bcccc_0001_0x00_xxxx_xxxx_0000_1001_xxxx
        *  - SWP, SWPB
        */

just inside this else if () { ...} block.

(and then you can delete the "SWP instruction" comment.)

>                          /* SWP instruction */

What version of QEMU did you make this patch against? The current
git master has some other lines between the '} else {' and this
comment. Generally patches should be against git master, as that's
where all our development happens.

>                          rm = (insn) & 0xf;
>
> @@ -8852,6 +8852,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>                          tcg_temp_free_i32(addr);
>                          store_reg(s, rd, tmp2);
>                      }
> +                    else {

Minor style nit: the "else {" should go on the same line as the
preceding "}".

> +                        goto illegal_op;
> +                    }
>                  }
>              } else {
>                  int address_offset;
> --
> 1.8.3.1

thanks
-- PMM
