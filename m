Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3159196wrt;
        Mon, 28 Jan 2019 03:21:00 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7ZwV2mBotGS0rPfdf4259YQrNQ0y0/Q63HV20fK1Iyt3DnJXiR2ueuAfwDP+ag0GbNsIph
X-Received: by 2002:adf:83e7:: with SMTP id 94mr21583436wre.278.1548674460661;
        Mon, 28 Jan 2019 03:21:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548674460; cv=none;
        d=google.com; s=arc-20160816;
        b=W/jFXZLk7uy7DNPg3ceRmiRsn4u9zzSYIbxZFUJBkqGOox+u0RcZWw9pcyYQMBWwSg
         c/Wi3Ky30sw/2oFBYCK61xcj0VUeECCGmCBM00Ri5g0gH3DGGaNGAXTBFfk7Cg4IHAR6
         wWCfeqAfNKkRe7QJZHH1n41B6osVNTzf3qSAugNV8qC3oFsCjciK+yzG9AukdVVaKO15
         Y0dML2A2hsV/Y7yLOzyhNPkOo9G6aiI1NWgLNTal2bv1/VdgLnRiZNdZjV5blSiIYo9x
         DVW3syNoL6X0ITTYgOuzdghuNw51IekkzPoH7X7pemDSFsS46E95wJR8g6/GVtIybFOd
         n9jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xwCawdEpxdArUBE07aGD3htoM63vtslcNAD9ymHnQnY=;
        b=R6AywcJmKV4q9b4iexm22mTF0CHnG5q6+kgRRecVl8uoC4tU2BZq5RbbcA4JeTveH7
         XdCcBx59PK9PI8Wcs+eRsSs2Q4RcpDHcAqtV/n9poxavdZy8k0mgbRWU/x1Bf8oGWzSi
         nwx9QXHROtyObZy+3bYMleqUHyhIGI3vonQyjL4Nq0hhrUMjFkTeOXlAoj83sMTtK+ss
         6Kso6aPTXzfaOuwKY5TiVlJ7hk+ONAEdWjdnkc10pjyYLhwmnM8nXSkH4nxF6k/7vbfV
         ZIuuilHXyx/6SjajlSqIpPghzYyVPBgELkuomi+umT9/UijGV3KK6fEqm1ZvGQpz7+Bu
         2ezA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E9ANv7Wi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d126si46710982wmf.158.2019.01.28.03.21.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 03:21:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E9ANv7Wi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go4yJ-0005iK-Ls
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 06:20:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go4y1-0005ee-FP
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:20:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go4xz-0001Qs-Eq
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:20:40 -0500
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141]:51266)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1go4xx-0001Ls-MR; Mon, 28 Jan 2019 06:20:39 -0500
Received: by mail-it1-x141.google.com with SMTP id w18so20060839ite.1;
	Mon, 28 Jan 2019 03:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xwCawdEpxdArUBE07aGD3htoM63vtslcNAD9ymHnQnY=;
	b=E9ANv7WiMNXs74oexgfjfFFUxQB80SApG6eSZPkEoSTqs3M7Muxf0QhiAtOhKpt6pO
	2KJB9uLpBwTOXCq8BD3zOsIqfamWR4VdjKnkJZZtaqtJDSMDTJedF8Ks0heLNjIwRFov
	0bfUaA7wO230QhezPNP0nWgXgmIpRqs0fULgTkBB2m/Ch1+mPaLHsH7NtJJTyiO9zfuo
	MdZta9AXR9d6FIwaPnqFN8buBN7LMJmoW3UFLs5D/Aeq1AQC8kZXiawCX0uLSt5KmfaX
	Vytx3xnQ9fNmkyDSRHZvitQo9mI9ImEEXUy74X5C1MoG9hAuZdEsDmVK8TlxegEY9yi9
	n6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xwCawdEpxdArUBE07aGD3htoM63vtslcNAD9ymHnQnY=;
	b=YcQvurVOgTAosljCYVNBS3D7RhW9IYh0ln75pHaTlLE6QnxiX5BVWiho342TcasUu+
	coaj+dcBvAZufUZIMp4yneQi/E5CIVUhf7cARDXkds1YMrZysdjmgxOdEsB+72d3MMu5
	QwzGonHYiNuxFFf5h79dpv8omRP6h4zbmDv0eg+vsqNINukbrST+WMR79Z+HsCIhFmM2
	PgGPxK9YdMEj9YiUNW4bOnuDo0ueMBaQB0oC4Zcn3twluEl1D2b8bcfR90RwOj8sSc5E
	8MIxOB3VcfC5R7IAKA/vWR/s6uZDMujhsFcxOzmyn9eEBGqLzPCVOyTCzkViGiWxdeSR
	QSBQ==
X-Gm-Message-State: AJcUukeGNciB5cGxTZB8gkk+w0mm6Iczq1If51Tco+Yb5tFXZJbi6P+j
	9WhtQFSpyHMQ9CHMj/9+o+47YBGzpok6mAsQUcw=
X-Received: by 2002:a05:660c:fd2:: with SMTP id
	m18mr10050391itn.1.1548674429109; 
	Mon, 28 Jan 2019 03:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20190125182626.9221-1-peter.maydell@linaro.org>
	<20190125182626.9221-8-peter.maydell@linaro.org>
In-Reply-To: <20190125182626.9221-8-peter.maydell@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 28 Jan 2019 12:20:38 +0100
Message-ID: <CABoDooN5JjtJKWA=5io=Ttycys1Nwe4FQjxj4N+_iMx0hW1qJQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::141
Subject: Re: [Qemu-arm] [PATCH 7/7] target/arm/translate-a64: Don't
 underdecode SDOT and UDOT
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
X-TUID: mfJHjk1HLrOb

On Fri, Jan 25, 2019 at 7:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the AdvSIMD scalar x indexed element and vector x indexed element
> encoding group, the SDOT and UDOT instructions are vector only,
> and their opcode is unallocated in the scalar group. Correctly
> UNDEF this unallocated encoding.
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
> index 474d9bfb5f0..30bc2412fc0 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -12641,7 +12641,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
>          break;
>      case 0x0e: /* SDOT */
>      case 0x1e: /* UDOT */
> -        if (size != MO_32 || !dc_isar_feature(aa64_dp, s)) {
> +        if (is_scalar || size != MO_32 || !dc_isar_feature(aa64_dp, s)) {
>              unallocated_encoding(s);
>              return;
>          }
> --
> 2.20.1
>
