Received: by 10.28.173.206 with SMTP id w197csp827235wme;
        Thu, 11 Jan 2018 10:06:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBovp+bws+alr5NQbwq3SOZ3CcNHex24j06AtEkmNl31Tdf59+pseHU4DV2Q3oZ7SNml6pWxh
X-Received: by 10.13.219.22 with SMTP id d22mr13711117ywe.93.1515694016448;
        Thu, 11 Jan 2018 10:06:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515694016; cv=none;
        d=google.com; s=arc-20160816;
        b=Rlja510J8JTcsCSCjkfLdseBz+RTG9ovG4jli6Cj0UTKFxAPquditbZl6x3RXTrFE9
         VbjJIFOqwMD1HmtMELFQYbOWDib6TmnzYzPIk5fWpCb+2OwxmEly7FmDlJNA1gh2HDRl
         yPyX4sIca/M51vNycBj+oRM8S+VNasG3S7MeAIpvu6W0ZBqMG08YSmOlj8yHY0H3i3Is
         zNuG/9XTWRo3SElM1X215/2rlsADuOjSsXD25vFtc0VwEgIWxYN17yDO0YaM5Dc68Svv
         xt96HlvSRifbsLszoVIgJ7jRBTgUIyqcnIk4SiNKOi+ofzfDMddrhTcXNV+l7Ozp3i1o
         ZgRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=lGyN20NOCtgqwnvgyNSxvRIQmGl8vnRw93kX/icS/L4=;
        b=dtQZg7S9q/CKzgcSkoL2V5+qoD5dTd6Z+4nU6at0A1ksNxBM4//2pGh5XdqDLLWXoM
         LRwPYmLGf3aXbmVb4sM/DGkTlwsI4pTXIWFDoB7/zCCEdKhyghMaMyrJ5PBW/LbTPC3O
         02LV8UHpuH6fsdsJlwnjrvmk/HszkHyUyfvNMzTX0zSfMyQ8SjW8VE7+he5p/gkHfU52
         3MkDCaD5Xg4Rc1xNRBTY1nInGGGrvN2CCPx+611YH+zvqtkpa5PKRbiAIJIoK7Wpr0wb
         hGCPyahBS3Qdsh3Yp4V4BKB4jxlYtqxf1swvm/EGsIPL4GxdgyglZa4ULp/5xsif7aF6
         7f+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IHs15t1Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t32si1440343ybd.776.2018.01.11.10.06.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 10:06:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IHs15t1Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59785 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZhFf-0001wj-Sd
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 13:06:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhFT-0001uF-IX
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:06:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhFS-0001Xk-Mo
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:06:43 -0500
Received: from mail-ot0-x232.google.com ([2607:f8b0:4003:c0f::232]:47011)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZhFS-0001XN-HM
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:06:42 -0500
Received: by mail-ot0-x232.google.com with SMTP id f6so2819655oti.13
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 10:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lGyN20NOCtgqwnvgyNSxvRIQmGl8vnRw93kX/icS/L4=;
	b=IHs15t1Za2runkVODIAlwmhlLb3n7CwTZQ4UsDDKWvW1FLXvJjx26osWclYjtEXMh3
	Hi1nIuf9MgQRum5U1nylQNccsgQ8uqKUVSODrBDzIOX4RqrAtjWr3U9NDJVi2EtPZRTE
	pSdQjQIPf7+93JWMGQ/9mzLA7ZviDnjgU4X+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lGyN20NOCtgqwnvgyNSxvRIQmGl8vnRw93kX/icS/L4=;
	b=pgtuzPHIYlTSz5T2fzGhBEFJhczTh9v45oEfjQePGBq2HQSXXfN3fBXasRzfj51gIm
	p5CGtQzWDtU8PoMQkG3CQFUz4YLSb7FDQQBtaT4W+lkR7Rt9yr0g9ETxGEN1Y7eN6NOW
	BDR40eVtdwU/cIhWwum6BqGc7x6ICm/e+IFS3OuA/G71gM/AIMFSCSEjkrXwV41+ebQp
	WvogjjIEfF+kmyUKTSdypnN9KJuvpwcVn6EXAMcN1Rm1KG/bfv1EHXNObBqjs5Y2x4Yh
	6BvspYPgaGTVCobI3GRDZBwYcWjlPkbjosKjYqdDo6HAQ9sytCfDkWddH2Av4ra3i707
	p71A==
X-Gm-Message-State: AKwxytcCu9qfJLXFjwvJ/ANHZFyBCmlF5t+VqStEYE4v1C4+WxHljRt7
	NoVT+oJwpVuXRi0+fEHvB4pXQhl+v/TDn7VMVo9UTA==
X-Received: by 10.157.29.233 with SMTP id w38mr12047910otw.24.1515694001727;
	Thu, 11 Jan 2018 10:06:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Thu, 11 Jan 2018 10:06:21 -0800 (PST)
In-Reply-To: <20171218174552.18871-2-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
	<20171218174552.18871-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jan 2018 18:06:21 +0000
Message-ID: <CAFEAcA_zoqWwAhg5PhuUG=xkRuC3uwT0MF7D3NOvEFg0Z3yKMQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::232
Subject: Re: [Qemu-arm] [PATCH 01/23] scripts: Add decodetree.py
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
X-TUID: loWexeml7JpZ

On 18 December 2017 at 17:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
> To be used to decode ARM SVE, but could be used for any 32-bit RISC.
> It would need additional work to extend to insn sizes other than 32-bit.

I guess we could make that extension without requiring all
existing pattern files to be updated, right?

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  scripts/decodetree.py | 984 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 984 insertions(+)
>  create mode 100755 scripts/decodetree.py

This is rather large for a single patch...

> +# Pattern examples:
> +#
> +#   addl_r   010000 ..... ..... .... 0000000 ..... @opr
> +#   addl_i   010000 ..... ..... .... 0000000 ..... @opi
> +#

I think we should insist that a pattern defines all the
bits (either as constant values or as fields that get
passed to the decode function). That will help prevent
accidental under-decoding.

thanks
-- PMM
