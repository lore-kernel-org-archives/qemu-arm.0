Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2091058wru;
        Thu, 16 Aug 2018 10:16:29 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwe1lpUZqk6wgArWfZHprrrxdjVb7728BKQsRbktXSoT4xRi3cUhUkR3YLqQEImhGXme/qi
X-Received: by 2002:ac8:6647:: with SMTP id j7-v6mr30266315qtp.231.1534439789568;
        Thu, 16 Aug 2018 10:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534439789; cv=none;
        d=google.com; s=arc-20160816;
        b=Gt1/Hs98Rt68oJAjzLW3PXepNcLjHm44krbgsSrIFn0KUa/kVek2J8OlMroaOIvWmt
         4aFtldjuwinM2atr+YR87MxRog25H36E9vXnV90Lq8Fbgf0mrx7+79Fbdhhoxw4XLQ2p
         DGSE5x5JIxCuTVvfldSV8AmptMnpfIAzcoxkqjMAdWfx6VM8+59NTsUl6QCqS994VoEz
         k4/8xwYWosbLZOKoEqCb5gerN/vrA+N/CRAgK6gGl5S10C+5xLBx0Xq9mqbA8aafIM8q
         TrL/IKoVnhkwfDQgHYjlqhGxqCWotfEGe9toH6j1Ifauv58uOz8XYcAz4HYJrs6LNZ+C
         4LLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=PnI9txiMRu1rEk6+oFDWTuZV2ivMrsxbQlPPN1POO64=;
        b=viUQWi5mzeM9dybml1K+1f8LWksdKmj4+ZrpgYKC+1A1vRiNP5Hg06rVI4nUaGi0Ey
         mZhPAbHj8GivedXur8K2R0fxzaGGBVBSDJaeZ/1Qw4Z2lcVmy7yNLZ80Z/TnKWC4ob7h
         Aj5VJtBLbxXpnm/GNV7X5FbpckSYWS8tO7CT9R3JbdEuJ8ehKE5Jhmfcx+j81C9h0TAN
         Tk+Tk/aewdsuHIOM++reqCbzjPPW50DwG/9GfABfkE1zXWmEwFlXSGsansN7dsq05ygP
         rtOqVoCXmzqxxZM2ri4pLbDqjNp1PeHwYDtDE7PH3RQnYG7Q8+sdXlPM4N0e6N9S5Mfh
         8ESg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i1+AZpy3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t186-v6si302110qkb.383.2018.08.16.10.16.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 10:16:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i1+AZpy3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57243 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqLsr-0001hI-3C
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 13:16:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqLI4-0001wp-Bd
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 12:38:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqLI2-0006vS-5k
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 12:38:28 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:33992)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqLI1-0006tj-Vb
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 12:38:26 -0400
Received: by mail-oi0-x244.google.com with SMTP id 13-v6so9149281ois.1
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 09:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PnI9txiMRu1rEk6+oFDWTuZV2ivMrsxbQlPPN1POO64=;
	b=i1+AZpy3Q9Lyaa2Vt5zEd0EN7ZPOVisYDNaYshaqRRmKlTKVo3z2v2mAMLJ6Zqwx3u
	7solgMRLjcd4miS/vAGDhQRgw0QA/SWynhjjGPMCkpgqTbxFiQfT7gWZf0JsUepsHsnu
	37TM3SV1tfrNpUHMEJH92ByGHLgO7gWHFRF7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PnI9txiMRu1rEk6+oFDWTuZV2ivMrsxbQlPPN1POO64=;
	b=bTjAm6AoQsDY5imu6vn0zt8l2zncCPldbLBD8HOu6vdcMfntt6cCvVXh4g/s2ZKR5L
	WifUM2kwWSedyocSS2MB2FFlO8k4+KgSk8ekZ8pUYo/Uqd+e934AY6onu1hgVpqu/r4y
	cRb26+RdYXdM2MRfzEXgExvGGphuGLymM/UQn8Fo2RCE7vRNqfqsaahyQHmwekL/b5hR
	24J1Tur25dBBJMtCHN0xg3RbT/y+WwkTVdgHxTA2CsYfTB5d3gZykJ/LFfJeDbxvA6v1
	jGEdNWcAPAoOmortKRrF2J3cwklnAFhvQmHjg0IZZ6lXNqpjnbFfApKkbygNEYqIHaTV
	JuWw==
X-Gm-Message-State: AOUpUlEf959tHpv8pPYZGgQ2pdwkr29bTMO/5mubuC1bYA4eAtiOyPd7
	w5TnRGREkkX3AXeNA8NFt02H73A1vKD1Eqj6wv8w7Q==
X-Received: by 2002:aca:401:: with SMTP id 1-v6mr34688595oie.28.1534437504812; 
	Thu, 16 Aug 2018 09:38:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 09:38:04
	-0700 (PDT)
In-Reply-To: <20180816120533.6587-1-rka@sysgo.com>
References: <20180816120533.6587-1-rka@sysgo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 17:38:04 +0100
Message-ID: <CAFEAcA8W_Vf_G_0TKUHUWuckFN7ruj1UjWud=QP6xUpvW5XTPA@mail.gmail.com>
To: Roman Kapl <rka@sysgo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v2] target/arm: crash on conditional instr in
 it block
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
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rJhaLVW6f9wK

On 16 August 2018 at 13:05, Roman Kapl <rka@sysgo.com> wrote:
> If an instruction is conditional (like CBZ) and it is executed conditiona=
lly
> (using the ITx instruction), a jump to undefined label is generated.
> CBZ in IT block is an unpredictable behavior, and honouring the condition=
 code
> is allowed by the spec in this case (constrained unpredictable, ARMv8, se=
ction
> K1.1.7).
>
> Fix the 'skip on condtion' code to create a new label only if it does not
> already exist. Previously multiple labels were created, but only the last=
 one of
> them was set.
>
> Signed-off-by: Roman Kapl <rka@sysgo.com>
> ---
> v1 -> v2
>  Split arm_conditional_skip into arm_gen_condlabel and arm_skip_unless to
>  a) cover all usages
>  b) do not force callers to ^1 the condition
>
>  Add note about CBZ in IT block to the commit message.
>
>  target/arm/translate.c | 35 +++++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index f845da7c63..e54e0ca2ba 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -8480,6 +8480,22 @@ static void gen_srs(DisasContext *s,
>      s->base.is_jmp =3D DISAS_UPDATE;
>  }
>
> +/* Generate a labe used for skipping this instruction */

"label"

> +static void arm_gen_condlabel(DisasContext *s)
> +{
> +    if (!s->condjmp) {
> +        s->condlabel =3D gen_new_label();
> +        s->condjmp =3D 1;
> +    }
> +}
> +
> +/* Skip this instruction if the ARM condition is false */
> +static void arm_skip_unless(DisasContext *s, uint32_t cond)
> +{
> +    arm_gen_condlabel(s);
> +    arm_gen_test_cc(cond, s->condlabel ^ 1);

This has applied the ^ 1 to the wrong argument. This causes
a compile error (at least if you're building with debug):

/home/petmay01/linaro/qemu-from-laptop/qemu/target/arm/translate.c: In
function =E2=80=98arm_skip_unless=E2=80=99:
/home/petmay01/linaro/qemu-from-laptop/qemu/target/arm/translate.c:8496:40:
error: invalid operands to binary ^ (have =E2=80=98TCGLabel * {aka struct
TCGLabel *}=E2=80=99 and =E2=80=98int=E2=80=99)
     arm_gen_test_cc(cond, s->condlabel ^ 1);
                                        ^

Rather than make you resend the patch, I'll just fix this up locally.

thanks
-- PMM
