Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4549536wrt;
        Tue, 29 Jan 2019 06:59:11 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6zY0V72n1saU2tMTwk9+3NB6cr4dWE4wDjWd5vHuXkDmdgvqV0JcKH3EmF3CfTALC8d4Ob
X-Received: by 2002:a63:295:: with SMTP id 143mr23339927pgc.362.1548773951111;
        Tue, 29 Jan 2019 06:59:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548773951; cv=none;
        d=google.com; s=arc-20160816;
        b=SX7kDOAbvRtJ7hRqaJG08uwIYPM2hW8G29skHyG1V8755qLywmetBaz4zpbED97qMS
         RaVIb10QKTyLEP5qVvrM8CONFTVE4XFq8/3buXsuEDx8Vf3Vs6OtCwhuBSHZer8ZUAHo
         kDmnry2CELNchh98ETpWfz8lkozgIn+GPEh0xzp8zBn7ridwBfVDtEu4+lnVYYk9jPVq
         CiM6PCydcu66Zi3NILENwlfCWvwyQjcSPdzfa2kTf2FXvF9uAYW7JXR/KERRDQdKsVfF
         xubRtzoNfbiEx898+1A8WZ0irwwMatOnM7bgyeS3LwWuD64d2930t4i/EtDEmdWWMB7R
         MsEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bRtwUuaKVAiu9sqlGPX7er1hX7R0UlZiJQXDeeWF5AA=;
        b=Md98IKfxSHeoEAefHjorDuCczaJBtAAN/RrhSRId7AqS0VV0aFDHAY8rfa5egD6Rdg
         WXtPoDKY71WSQBec/rJGBc9Xp+L75GWMqaeHXAq8ej8wKb4obIcHAJ07v+acDUlE6egL
         SAzUO0VmVcL9Z491rom50zzuPgGkXRF/o+sbZauV9Fq+4U17HESrKSsFJCNf5e99DqwP
         P8D+7XgU3c3cQF9I2u4HHkpXksQI7qGhqvzeWSK182RHPY94cqWzSIDsVEY9lZAF/w4F
         heYOvExUL0yTH6ee40rBOuQVV8D/JzsNhLl+02Fd1SVEgcCjaehY1R4toqkTLrkkEbnC
         HWcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iZRx7qS+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12si12989408plq.190.2019.01.29.06.59.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 06:59:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iZRx7qS+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:50603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goUqo-0006SI-4T
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 09:58:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1goUqD-0005rz-4Q
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 09:58:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1goUYu-0000CX-OW
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 09:40:36 -0500
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144]:39164)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1goUY0-0008GM-2w; Tue, 29 Jan 2019 09:40:26 -0500
Received: by mail-it1-x144.google.com with SMTP id a6so4798603itl.4;
	Tue, 29 Jan 2019 06:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bRtwUuaKVAiu9sqlGPX7er1hX7R0UlZiJQXDeeWF5AA=;
	b=iZRx7qS+EBusy3UoWPJY0/Puicm+xMMR/Cg3EFuuqYi6M+3o4DhV+QOZKuI/jIH/Ii
	XuaSNXrZqO46+F00MopuuSMpRpNSKE6r3M1/icazqTdPx9i/hoUwm/UHq6CpuudJTCD/
	0PqMLOMCUEk/gfdcUui8+GKXzIAriu3+bBsM2OyT1UOZlAmF/lEBzOKXnx5FI1thG6I+
	aSvg4k0/aU/7MBTdNRGhZ9W5k42sLcjPTcfNDX6T+mIBeMIeG/peNN3araGLhfXiH4z+
	GMx3zHTrrl2OhwCcdyBJDi57B8bVOvBlCDt9/2gk6GyGUvxLWc6EShHLANBIOuzWDvYB
	5e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bRtwUuaKVAiu9sqlGPX7er1hX7R0UlZiJQXDeeWF5AA=;
	b=XISb8QlRXOfMYqeFGr0xR10OZFTbS8bTLoTDtch7u0gbQpj6inwCyoGgVUoDhR+Vfn
	YsXbST0jii3B4wkZIBxsqFYel3Int5vPdL2n6StsqNgRLgOV2xzvMcufah5X6TRKepgs
	yfNhV+irx/MaPcYfhHLNBEHjU27BfjB/uuoiT9bQDx0JwyqXD/gI6bXrKJwd6t+b8saz
	fF2y2nr3uVvm5rZSrhvwpnkQRP9lRUqfd4Fwo2MswWNTp3EmPQ8gFuCuTx0Mgg911En+
	nNuwTmpaLh9zg+N8uwBbKJW80UJknU5Wj/Bgty651mM+Ti55ffbfFXL/I62EzdEr2J0c
	9LtA==
X-Gm-Message-State: AJcUukdbM9P6Ryye8ag7DUTmA3dRDRv+2M4wiSm2Zsiq7LEAGFpBzFh9
	/GkQfTYeZdc8aseMhz9fHgOCs+WmEQmqK+SskIo=
X-Received: by 2002:a02:12c5:: with SMTP id 66mr16770556jap.54.1548771887947; 
	Tue, 29 Jan 2019 06:24:47 -0800 (PST)
MIME-Version: 1.0
References: <20190129140411.682-1-peter.maydell@linaro.org>
	<20190129140411.682-2-peter.maydell@linaro.org>
In-Reply-To: <20190129140411.682-2-peter.maydell@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Tue, 29 Jan 2019 15:24:58 +0100
Message-ID: <CABoDooNSoV5JyXg9aLTARU1A9exhM+BhFsc48E8ArPq7538AMA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::144
Subject: Re: [Qemu-arm] [PATCH 1/2] target/arm/translate-a64: Fix FCMLA
 decoding error
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
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7vLyTZer8CJk

On Tue, Jan 29, 2019 at 3:04 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The FCMLA (by element) instruction exists in the
> "vector x indexed element" encoding group, but not in
> the "scalar x indexed element" group. Correctly UNDEF
> the unallocated encodings.
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
> index 30bc2412fc0..a7b999d2b5a 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -12650,7 +12650,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
>      case 0x13: /* FCMLA #90 */
>      case 0x15: /* FCMLA #180 */
>      case 0x17: /* FCMLA #270 */
> -        if (!dc_isar_feature(aa64_fcma, s)) {
> +        if (is_scalar || !dc_isar_feature(aa64_fcma, s)) {
>              unallocated_encoding(s);
>              return;
>          }
> --
> 2.20.1
>
