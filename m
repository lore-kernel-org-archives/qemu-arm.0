Received: by 10.28.71.27 with SMTP id u27csp663815wma;
        Fri, 23 Feb 2018 06:35:11 -0800 (PST)
X-Google-Smtp-Source: AH8x224mb0CVQF0SxC7PPW0rVkJ8ms2tPukCzkhtaEikeISEa0wxAUR75umonLcLGaVYseqtYclT
X-Received: by 10.129.46.148 with SMTP id u142mr1123726ywu.57.1519396511153;
        Fri, 23 Feb 2018 06:35:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519396511; cv=none;
        d=google.com; s=arc-20160816;
        b=LdJvSrsJ1Cg4RKlBQrHWEIYHPmFrmNQV5y/dglaL5HHlTlzAE1LfE2L79i/eHQ6TP0
         vug1ETGDpmBgrptxk47hw9FkAlB9+UIvNVPnLUdcPBEKuZj0ajx8taigOG1iAM697nd2
         3RJt21xJnK5U1WhA0/iQBFfGhA5WRxQLan7zHiOJWVgfZTTQ63klTHTjmjndVHIivtaH
         RCZFfJEgIfEL3QM6xLkU8ZNx7nWOCCD1g6hKmpqXlnDnoWAKgdJmI0jQT65y33h4U1l+
         uIHmT9YDSvEaAHkvb3g3YmNeOBkjuv8FbDtjNLwCmDxeo7DexzDwInh9pfp37JtvQxZ7
         rXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=39rjFRYyfi69K0UT8xjxMZJJAFs8iUFqFyxc0O/WvpE=;
        b=y7k3GpIsBYAyXmNt5+vBAV07Sw/515Pa7DQV2rz706M6vXjr6rdcVxBZoVpntUZJVl
         BMOPiTBTT+CA4FNwWqanxUaet9QeLf5k7U7Abe0LunerZSa97fol1RbhdFUFgAVJd0C0
         qH6XU2gjIp5kOcaqnbxTo0WnFS0WlhFBw3HVGwk+U89iW/9eny5dTMNwE/gJogjwHvB+
         wCMtgDfQTW40zUu9RAV74x6OPKjZEKK1L37hzBh53wL9Badc0psXvMmIQnO7KcRlNtrG
         txDTrY7dNbMMIAifr/g68uX6PCtK6Z5gU1n001rhc1To/E9bJurhYL0akmCFbgoHzKSo
         NLMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cuTleMdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c6si415559ywk.200.2018.02.23.06.35.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 06:35:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cuTleMdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44932 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epERK-0003QM-ID
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 09:35:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epER9-0003Nd-Oa
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 09:35:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epER8-0000a7-Nz
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 09:34:59 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:46076)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epER8-0000Zb-Ge
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 09:34:58 -0500
Received: by mail-pl0-x244.google.com with SMTP id v9-v6so2988432plp.12
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 06:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=39rjFRYyfi69K0UT8xjxMZJJAFs8iUFqFyxc0O/WvpE=;
	b=cuTleMdM6KW5MF6lUM6sE1bmx+tMncKgtWlzB6fKmX9kUlmq5je2wr2c0zOaWhxcWD
	spEIcngCQ/sNkTgQ74iGv0M7vfdxKOIAhUEWpdvXlr7jA34qI5RXWeF/nP5qO4K6f+Sc
	rdkSpWTDRM5r+x56Ed0mAbrdh9Hdu6h8kSsuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=39rjFRYyfi69K0UT8xjxMZJJAFs8iUFqFyxc0O/WvpE=;
	b=AXzAlDYzOTZu8N/ZJS2oCBO/SVmNWX+JN7YtGD7l75kbKGQA3VMbNnmAaJzZbxZSOI
	OVVrADVyxfrq8HGGpLYrtP5l8ftk0tE48hVjoKHj2o4ZxGTZVVNeUrmruVhja+SbYb++
	rYxbAxaq/2XgasB+4essT/IooL+SzHoGZuBNSDqjIPbKkY+11GXyOBHeyk4wJVjqClxd
	ZNr/jrM7wATLYkKwS4RXxoi+6+u6FnGdXjHZKD9mip863kMrWtlO2Ew85hRP0Na/JDFw
	P/h7LCNqGF/zTF0RJfglxqC9NRanNWmWOp94mjSNDlPuiB47R+JwvwFiuNJHHvvK5WL0
	9MEg==
X-Gm-Message-State: APf1xPBK3evuBT2iN3jAGXSOf5D94BHt7N9VqlKdF3tqI/32rbuCE61s
	SZQEbowJZDzjq2lRcYqA+jiv1zjzKMaGBtqblvEEng==
X-Received: by 2002:a17:902:a515:: with SMTP id
	s21-v6mr1905243plq.393.1519396497428; 
	Fri, 23 Feb 2018 06:34:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 06:34:36 -0800 (PST)
In-Reply-To: <20180217182323.25885-28-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 14:34:36 +0000
Message-ID: <CAFEAcA-TuO4F=QoU7WWVieX6OLDX2dEX-g-jz2Hjq4jGb3O9KA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 27/67] target/arm: Implement
 SVE Permute - Unpredicated Group
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
X-TUID: vgkYV3DdFQHC

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  23 +++++++++
>  target/arm/translate-a64.h |  14 +++---
>  target/arm/sve_helper.c    | 114 +++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 113 ++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  29 +++++++++++-
>  5 files changed, 285 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
> index e519aee314..328aa7fce1 100644
> --- a/target/arm/translate-a64.h
> +++ b/target/arm/translate-a64.h
> @@ -66,18 +66,18 @@ static inline void assert_fp_access_checked(DisasContext *s)
>  static inline int vec_reg_offset(DisasContext *s, int regno,
>                                   int element, TCGMemOp size)
>  {
> -    int offs = 0;
> +    int element_size = 1 << size;
> +    int offs = element * element_size;
>  #ifdef HOST_WORDS_BIGENDIAN
>      /* This is complicated slightly because vfp.zregs[n].d[0] is
>       * still the low half and vfp.zregs[n].d[1] the high half
>       * of the 128 bit vector, even on big endian systems.
> -     * Calculate the offset assuming a fully bigendian 128 bits,
> -     * then XOR to account for the order of the two 64 bit halves.
> +     * Calculate the offset assuming a fully little-endian 128 bits,
> +     * then XOR to account for the order of the 64 bit units.
>       */
> -    offs += (16 - ((element + 1) * (1 << size)));
> -    offs ^= 8;
> -#else
> -    offs += element * (1 << size);
> +    if (element_size < 8) {
> +        offs ^= 8 - element_size;
> +    }
>  #endif
>      offs += offsetof(CPUARMState, vfp.zregs[regno]);
>      assert_fp_access_checked(s);

This looks like it should have been in an earlier patch?

> @@ -85,7 +86,9 @@
>  @pd_pg_pn_pm_s ........ . s:1 .. rm:4 .. pg:4 . rn:4 . rd:4    &rprr_s
>
>  # Three operand, vector element size
> -@rd_rn_rm      ........ esz:2 . rm:5  ... ...  rn:5 rd:5       &rrr_esz
> +@rd_rn_rm      ........ esz:2 . rm:5 ... ... rn:5 rd:5         &rrr_esz

Another fragment that should be squashed.

> +@rdn_rm                ........ esz:2 ...... ...... rm:5 rd:5 \
> +               &rrr_esz rn=%reg_movprfx
>
>  # Three operand with "memory" size, aka immediate left shift
>  @rd_rn_msz_rm  ........ ... rm:5 .... imm:2 rn:5 rd:5          &rrri

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
