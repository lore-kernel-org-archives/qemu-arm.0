Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3152851wrt;
        Mon, 28 Jan 2019 03:14:01 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7oJxqorXDINsQvv2hrSt2OWvr4YVWbM8726/p5UQtZpdQ7rtE1lcSeGZAQA0OKJu2WPI/S
X-Received: by 2002:adf:afdc:: with SMTP id y28mr20706562wrd.275.1548674041515;
        Mon, 28 Jan 2019 03:14:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548674041; cv=none;
        d=google.com; s=arc-20160816;
        b=qZxho/kR/XaPSCyxuSBATHNXtE2i6qjBLAHEeUam4dy5ahl/09KIdIo3aMy13pLL+X
         bP2H9byPmgEmb/bJ1JnXyaD9+h0IyEvnhb/oGmId+7BnRW57qUGonqbEIq3i4p38jQGI
         k4+TgxX/osDynvkbjEu3QrhNgbNxvqlRrJixg94bVnmW/BCxoeBn8EznN04sU6Ky48OZ
         dRTWhmxhFzjHW1qddVLLuuhxIiG1R11ladnLaM6d3gVdBZ9KOcSc30nc13VElQbBJyuH
         b+t5+b5L2DnEZpULcDFM+L5cyt8no5Ka/XWJ462kU7m3NE764KH7731HHcJNVDMV3IpI
         +kVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fxtu5FLc8Auyskoc0iQC6b+XqgVWmca/AxJOJx1HdU4=;
        b=iNiLaYsAPR5BAMUTnNU73wmhJ3R8Dj6oe4ybbjjsZyReWdOUQdFweWzVx2YYPtbHGs
         UkFM/A6hA84WSkuQN1PKZD2HZ1bR5+4HzMAZ/NrWbm8gXfHxLR+ioR4yTNUkrqsR7e+D
         IFmxZScNzQz4L9j23+ZC8qgqcGCgy0cdmzJyK5VOwdBP65/TBkGWZZVtjt+ugbuH5vuW
         SPIHO301hZhlK22zpduXLQAKpEgx3n/ixyIjAzxx8N0claNvgY3j2ZtewRrsFMLyrKXo
         /hYAlgvgH754wzJxgOmCQSD/56ZBLsK25CTHn0BD/vqIjFZHKmwytt5gokm4A21alJ2L
         yhig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kT3fUDsB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si81773421wro.330.2019.01.28.03.14.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 03:14:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kT3fUDsB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go4rY-0000VS-K8
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 06:14:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go4pQ-0007jg-73
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 06:11:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go4pP-0006Hl-Ak
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 06:11:48 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:34805)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1go4pJ-0006B9-6B; Mon, 28 Jan 2019 06:11:42 -0500
Received: by mail-io1-xd42.google.com with SMTP id b16so13153142ior.1;
	Mon, 28 Jan 2019 03:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Fxtu5FLc8Auyskoc0iQC6b+XqgVWmca/AxJOJx1HdU4=;
	b=kT3fUDsBYVSaAyLrlE671QZJELUIKaSk5zqrx9Lr0BOiGzGvtsFJ2UYmG56Kaa3Xb+
	LUfqYT8p8q+o9tBfnbFD30eo7fetccxUzXYRsseXlqoezS+cX/u4ptxFu2W1HI+BB0gp
	803e8QG7DASDzPlBWnn/rMSB/SGx7FwfT1nAcrgUGXFXsgK63BY9hEMzkupQIooeMZRr
	mJt4IyQVIvXwY0UGebc8hSOsxWN2OlyUZG0fGc5Q2CHuCtV5oNlXXTN9efflyML2mutS
	/dakyE2r0UvvBLsr8K6+v8vlO5aoAYm+QeFQiM/VnT33z2B13dTClGlquPrlAP/8BlId
	kmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Fxtu5FLc8Auyskoc0iQC6b+XqgVWmca/AxJOJx1HdU4=;
	b=CJ+sOwtTlzjTrqsUP8Ob8Wt1hOYYf65Tl6PAq5N9vV3GuAgt2pftuae8FtmG8oIfkN
	72zQy45NC3bpgllcm0jgmiiV6EB+0vsI53P+7NgFBk9jXWQ0173ooa+H1XWZjnVtlKz/
	GFM5CbCa6v642ahWr30QisuHO76IXHvoOfKFMbyWQINB8WQjmjV/YOnLrOeqYZDn64Lc
	AvHwkzrtPK4nWwyog0n28uuOHUofCGgdTfZtq42E9TOZI3Gk7YKnzNvphVFoGVfcq9Ze
	PijhWqf7WfK3BweGkdhdVgr/qNW3gG00IpAPe0rK+9GkCrzvhpMuLfvymhcix5DiHilF
	Ms+A==
X-Gm-Message-State: AHQUAub3BBRCjMSPzjbknVSS8XlQDB+gStfysgjS2Itj1MMkBT7nZCkc
	H32a8ilARWaUIBaGKTQkFnZ+/Cs+WjcmvWXMXPQ=
X-Received: by 2002:a6b:c815:: with SMTP id y21mr11410571iof.98.1548673893869; 
	Mon, 28 Jan 2019 03:11:33 -0800 (PST)
MIME-Version: 1.0
References: <20190125182626.9221-1-peter.maydell@linaro.org>
	<20190125182626.9221-4-peter.maydell@linaro.org>
In-Reply-To: <20190125182626.9221-4-peter.maydell@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 28 Jan 2019 12:11:44 +0100
Message-ID: <CABoDooPjnoh86VMwmq6CcOs1e5-ddBCfSp7aCvQGkTY9AAQauA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d42
Subject: Re: [Qemu-devel] [PATCH 3/7] target/arm/translate-a64: Don't
 underdecode SIMD ld/st multiple
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Thu6sX5cxqMU

On Fri, Jan 25, 2019 at 7:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the AdvSIMD load/store multiple structures encodings,
> the non-post-indexed case should have zeroes in [20:16]
> (which is the Rm field for the post-indexed case).
> Correctly UNDEF the currently unallocated encodings which
> have non-zeroes in those bits.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  target/arm/translate-a64.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 8e081758e03..c1f0cad7691 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -3249,6 +3249,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
>  {
>      int rt = extract32(insn, 0, 5);
>      int rn = extract32(insn, 5, 5);
> +    int rm = extract32(insn, 16, 5);
>      int size = extract32(insn, 10, 2);
>      int opcode = extract32(insn, 12, 4);
>      bool is_store = !extract32(insn, 22, 1);
> @@ -3268,6 +3269,11 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
>          return;
>      }
>
> +    if (!is_postidx && rm != 0) {
> +        unallocated_encoding(s);
> +        return;
> +    }
> +
>      /* From the shared decode logic */
>      switch (opcode) {
>      case 0x0:
> @@ -3367,7 +3373,6 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
>      }
>
>      if (is_postidx) {
> -        int rm = extract32(insn, 16, 5);
>          if (rm == 31) {
>              tcg_gen_mov_i64(tcg_rn, tcg_addr);
>          } else {
> --
> 2.20.1
>
