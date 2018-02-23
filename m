Received: by 10.28.71.27 with SMTP id u27csp770146wma;
        Fri, 23 Feb 2018 08:11:39 -0800 (PST)
X-Google-Smtp-Source: AH8x227UfNtfEp11LoDhLIArUwzb/mr7Xxj/rCriUqL3YDaJRKEG4eyFOtqK70Hyd6GO6hFu/DDx
X-Received: by 10.129.57.134 with SMTP id g128mr1395185ywa.373.1519402299464;
        Fri, 23 Feb 2018 08:11:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519402299; cv=none;
        d=google.com; s=arc-20160816;
        b=QCIvYfzO+Q9Jp48t2svNRZbCSiwxuldU1qs066ktxXajxrBcj56wKeJ7DN8LPXoH54
         f1H8yIT7fOJWio65k5pYuB3vZPSoxz+VZ/PoDAXJvh12ll8oI6l9pMIPwqAROKvPXoNY
         2zNK7SAwJcgGjFYs834n4r3yCpHJhlxufNJSSBEdocNKu+lWp0amXQo6C7UhF405aL/d
         caJ7ADFc3zUoLwFbQCuB2gq0t/E7iYP+WUXFWdXNplBC0qm+AHyRR5HFV9V6FFmE2A1V
         WzhAqnykW3HnOrOc0g18bUs034s1lwobi/6yTbQQss1DN6LxNn9dYzIZIuqWN+fTYbi5
         zNlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=DNtSzN9BWniu4a18WtoWisHmnTxvg+vl1W/lBsKI1SA=;
        b=RHLbIiVgJ7ajIGCZZmi6YWFL41xIxvHFgVlmuRYTUUcKIZgj3uK1gVjZKZfajVGO68
         a7c86udvwfzTjLadCLAC/giW58rbGkFiY1W9cpBqYYxqCR/g2eknk9IlRghmkda/svDa
         CfpHqXC7FgaqR/QgsHob983G04/hy2o68XiolNvpWv5hvLDoJlF4Nj5d4hIlrfd+NQtV
         WmtHIJpZdR/uNISSkRBl8/pTNdfqSkFuJj57WdWWpnxvvCPt+Zz2uRFM5vn+r8eeXRfk
         L2nMGU920lMot4u0bAXRj8kIegvone4gDq/A2CTBB0HAXllfKjJmjuIhLIrVj7iUgQ4l
         yP8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ORrjpZ6y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t2-v6si146882ybj.57.2018.02.23.08.11.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 08:11:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ORrjpZ6y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epFwg-0000tW-4G
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 11:11:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epFXj-0003Dh-Rm
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 10:45:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epFXi-00074k-TB
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 10:45:51 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:43895)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epFXi-00072r-M9
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 10:45:50 -0500
Received: by mail-pg0-x243.google.com with SMTP id f6so3491824pgs.10
	for <qemu-devel@nongnu.org>; Fri, 23 Feb 2018 07:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DNtSzN9BWniu4a18WtoWisHmnTxvg+vl1W/lBsKI1SA=;
	b=ORrjpZ6yUHIRiMTcIvO5asH/k4s8qqJg1ZufgDBoXJk8DzVmN9MBzDEyZGA0IupI1T
	86jX+X/Fv2qUB86E0H6Csm1C8j3awBjfSvQ3Ov4lwOXwuwa/Zl0DDquMRuAwJp72AjbE
	uf2U+neUcPD6x7F5Vx78jsjgxfEQx+wITJrRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DNtSzN9BWniu4a18WtoWisHmnTxvg+vl1W/lBsKI1SA=;
	b=Dl12VVSu2VF6UpdGzJM8qcSW+OYECdEPOOUcywowZmN18fOfrFx8+KxhSs1UO9lhxD
	7CWBc63I/x5spDzL/MnvwpVgnnSPMOVmFSPjIBpOoEGAhOEvFCLrdNFtwgPXw/M2lRDs
	rJQT9XFqyKaD9JvQPM02J5NfcTZjDU0zyCIa592QtQoh8lR6BH9KrKPUIMHCcnw15jwk
	XPym6+++DjKh1dzu2+7xDPM8fQ8AXCbiHvmCso2c6N/wqJJJQ/dscbaKZqhW8nv3GtkL
	xxeGt14TcivuBdO5sEoDuNsCD3Rg+3whZqO51f54z0S+We8nVfHJYjHXIsgEEc2Lun/I
	7fMA==
X-Gm-Message-State: APf1xPDUZm3ZU2gSMOmbjCkdZ2OyVbuwp+egGysny+dtpb66Vc1m8QNh
	RB3Aaa4PUPJy9DCl1iRnKPg62v4rNTQRYKXR/3QBiGCL
X-Received: by 10.99.149.2 with SMTP id p2mr1793286pgd.122.1519400749823; Fri,
	23 Feb 2018 07:45:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 07:45:29 -0800 (PST)
In-Reply-To: <20180217182323.25885-33-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 15:45:29 +0000
Message-ID: <CAFEAcA_3o+xVj-fUS1vAYjMQzR6YSo1EVLutoVHCWtZZhpP6jw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 32/67] target/arm: Implement
 SVE copy to vector (predicated)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aY9f2J6G1zgi

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 13 +++++++++++++
>  target/arm/sve.decode      |  6 ++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 207a22a0bc..fc2a295ab7 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -2422,6 +2422,19 @@ static void trans_LASTB_r(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
>      do_last_general(s, a, true);
>  }
>
> +static void trans_CPY_m_r(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
> +{
> +    do_cpy_m(s, a->esz, a->rd, a->rd, a->pg, cpu_reg_sp(s, a->rn));
> +}
> +
> +static void trans_CPY_m_v(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
> +{
> +    int ofs = vec_reg_offset(s, a->rn, 0, a->esz);
> +    TCGv_i64 t = load_esz(cpu_env, ofs, a->esz);
> +    do_cpy_m(s, a->esz, a->rd, a->rd, a->pg, t);
> +    tcg_temp_free_i64(t);
> +}
> +
>  /*
>   *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
>   */
> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index 1370802c12..5e127de88c 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -451,6 +451,12 @@ LASTB_v            00000101 .. 10001 1 100 ... ..... .....         @rd_pg_rn
>  LASTA_r                00000101 .. 10000 0 101 ... ..... .....         @rd_pg_rn
>  LASTB_r                00000101 .. 10000 1 101 ... ..... .....         @rd_pg_rn
>
> +# SVE copy element from SIMD&FP scalar register
> +CPY_m_v                00000101 .. 100000 100 ... ..... .....          @rd_pg_rn
> +
> +# SVE copy element from general register to vector (predicated)
> +CPY_m_r                00000101 .. 101000 101 ... ..... .....          @rd_pg_rn
> +
>  ### SVE Predicate Logical Operations Group
>
>  # SVE predicate logical operations
> --
> 2.14.3

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(if only every patch in the series was this size...)

thanks
-- PMM
