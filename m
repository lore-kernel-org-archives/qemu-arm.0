Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp250475ejb;
        Tue, 31 Jan 2023 21:44:06 -0800 (PST)
X-Google-Smtp-Source: AK7set8nR/KsKaKQ4yP9jwOX27/aKfnDJtB6yLKHbGVFfSjJ1ttio5eCB2JdxqBrt7McW4nxjpcj
X-Received: by 2002:ad4:5ecc:0:b0:535:2730:c922 with SMTP id jm12-20020ad45ecc000000b005352730c922mr3038906qvb.42.1675230246316;
        Tue, 31 Jan 2023 21:44:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675230246; cv=none;
        d=google.com; s=arc-20160816;
        b=iDp9LUz3MLaSQEOevWubEAfK69kxPP3I8Gp3DI0v+MMSDPiShdvjM4yaqaaW0zBs/F
         ulpsLXCRo/LMZHw0RiReTNiq+kn/gK2+2+zkWNO6fRz4KP31GGXXghWk1KZGbe7KpVSJ
         NOTz7q+OTIhrnS5no3B6Fp1GqUy1GZ7UeDMnmaYWNYMtbuTAOjntbld1FwMLh8Ag7NnL
         HPpOkG1dCFhCj40yR+oVwqgRZs2upcZA4/waWKuvoJ2kjwGQuO0HKBYwwu1WYKTjzvH3
         tZnBnmfjIgFN9KTLCVUS0QbnoZCb3ww62li5ZV/p4Z7d0rrk1lSSTH42sa9l3gJtfZm2
         VEIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Z++FwVCX1y6cwYeVork6fJLitawyqNqAGw7pufJM6W8=;
        b=VMSOt0UXPXF5OW3KtiD5p7AIvA/g314/a6fHnvOo1gOmHXeswkpiVxNz664iocMYri
         kNGnvZbYLxwYAM49ieWw00d8qWIqwIRJopkAJdXTmOqHPMwT8Ik+OkrNinb7jS+zjzLb
         sEs8wWXtuMMLRjUSHQYy14FmqvZKtDoJu/Tcdj2okayXrfjr3ZKtMUntZ0FXL3HMjBb6
         aFvB4r6vx8xhnTX1rS1sJkmlHyFPyFqNb6L50WQBOXRtSL7F6GBO5raB9jlrUn25U9t2
         TtrYJZFudUHmoNLwxLjhfkJA2sigDm05glkWlXnHq8tq1nxTojcoUZ58Yj+Mf0DCl84f
         qMtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=VKP9GAZa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15-20020ad45c6f000000b004c6d681587asi10193298qvh.15.2023.01.31.21.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Jan 2023 21:44:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=VKP9GAZa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pN5tX-000217-EQ; Wed, 01 Feb 2023 00:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN5tV-00020t-IY; Wed, 01 Feb 2023 00:42:53 -0500
Received: from mail-ej1-f48.google.com ([209.85.218.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN5tK-00063S-DD; Wed, 01 Feb 2023 00:42:53 -0500
Received: by mail-ej1-f48.google.com with SMTP id qw12so32190799ejc.2;
 Tue, 31 Jan 2023 21:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z++FwVCX1y6cwYeVork6fJLitawyqNqAGw7pufJM6W8=;
 b=VKP9GAZazE2vCAM1kK+Jy9kHGS/dX4ody9QqzBKtXw5aA0dlnYLOj5Vnuaigp9nTVT
 4+8nMMATL/WRssCWNQ/zfpbWCy/gPEwQhlkEPCPT/YE9ZGfPT5f9ncpo4PKNdTr9s5ZS
 0fjbzortI6SSQoORkjYt2r9K8A6rG1EGd0pNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z++FwVCX1y6cwYeVork6fJLitawyqNqAGw7pufJM6W8=;
 b=chFz1CG8ftYWnk0/zPUaQgDmc1e61nGJU3cC2R3Xjc3WczpaXh5aeACpY1sawSrjSk
 TTRP5cW/4sSR66vWeScLy1FvENzMIRSCV3X0BT9FOTRFsZwNuFGVIOuwm9cQERCMGebw
 3HkHK4jSgfpQyXzcCNqAYfapJGTTh104Cw1PVYI+l6b8pKrIiLWwWyybwAIE6QSqJVZu
 d2+AryNFp22D+dTSwOpsmGTiJ+VCmUh/W7mfKA4wL6lOuV0iDylcJEgn5+m3D8TKuSyO
 IEF1Qmkc7kaZ4ekkgMYExYJ0IsN/c2llhL3gkJBbDYvILRTP9dLzOnqrrn57e/tpW7ml
 znJA==
X-Gm-Message-State: AO0yUKUZKEj2lyYqMvbo9EQ3sFq2wb4i+FjBxo/W25YQWAvC17aL4cSF
 d//9PiaVSt1/3mKsKbjuKo2ZBMZqLyFVDroUkAU=
X-Received: by 2002:a17:907:204c:b0:885:2313:c8b5 with SMTP id
 pg12-20020a170907204c00b008852313c8b5mr282697ejb.201.1675230109996; Tue, 31
 Jan 2023 21:41:49 -0800 (PST)
MIME-Version: 1.0
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-4-clg@kaod.org>
In-Reply-To: <20230119123449.531826-4-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Feb 2023 05:41:37 +0000
Message-ID: <CACPK8Xc7S4nbTWtJ+Txdyo639FWOKA7ptxaYUvmoSZKgv4qk1w@mail.gmail.com>
Subject: Re: [PATCH 03/25] hw/net: Fix read of uninitialized memory in
 ftgmac100
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Stephen Longfield <slongfield@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.218.48; envelope-from=joel.stan@gmail.com;
 helo=mail-ej1-f48.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bsqVFP4jd4G9

On Thu, 19 Jan 2023 at 12:39, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Stephen Longfield <slongfield@google.com>
>
> With the `size +=3D 4` before the call to `crc32`, the CRC calculation
> would overrun the buffer. Size is used in the while loop starting on
> line 1009 to determine how much data to write back, with the last
> four bytes coming from `crc_ptr`, so do need to increase it, but should
> do this after the computation.
>
> I'm unsure why this use of uninitialized memory in the CRC doesn't
> result in CRC errors, but it seems clear to me that it should not be
> included in the calculation.

Does this affect the error counters observed under Linux?

>
> Signed-off-by: Stephen Longfield <slongfield@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Message-Id: <20221220221437.3303721-1-slongfield@google.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/net/ftgmac100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 83ef0a783e..d3bf14be53 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -980,9 +980,9 @@ static ssize_t ftgmac100_receive(NetClientState *nc, =
const uint8_t *buf,
>          return size;
>      }
>
> -    /* 4 bytes for the CRC.  */
> -    size +=3D 4;
>      crc =3D cpu_to_be32(crc32(~0, buf, size));
> +    /* Increase size by 4, loop below reads the last 4 bytes from crc_pt=
r. */
> +    size +=3D 4;
>      crc_ptr =3D (uint8_t *) &crc;
>
>      /* Huge frames are truncated.  */
> --
> 2.39.0
>
>
