Received: by 10.28.71.27 with SMTP id u27csp652833wma;
        Fri, 23 Feb 2018 06:25:26 -0800 (PST)
X-Google-Smtp-Source: AG47ELvUJQ69z8yFo50uwdBu+Pxgt1vjC0bwwJuI0DnIcg5Y4X5e8UeiycWpbMiTAOXGAH7VV0nq
X-Received: by 2002:a25:3106:: with SMTP id x6-v6mr1175380ybx.446.1519395926437;
        Fri, 23 Feb 2018 06:25:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519395926; cv=none;
        d=google.com; s=arc-20160816;
        b=N8vmffUHhVMSp+L68CcJ9u3FnRuCYs/Iwkfj9wYg35680ZsFsfgKdgRxP4uKuEXOsX
         gPPUHQ/GIlLNJ7rToQVPSVR4WQ9xFFo0yJvk/ZmDeqmYdvkilwPO0gmJWE8NvEI+7jDW
         II+Q0zB47m8oK/0GMi65XxI5NAkbh9g9tEaZfMFVe+jk9k7ei5NCO1S9Z7IT4OEWVReh
         eOhrm28uY0F2W+tb9IGSpE5KffcD3t9w2DlZ0MBQiPdEC53qtfTVw9kgPEHCUMAZp7gQ
         jay3LOWtrd0SstjuxlRuhw+zwA87uqCynyJt8k+bGQ6Iiuhv2e6eUMRD822MjL5EJY9t
         GdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=aGpCbIhalTS47znf6c2Yf3VPR/b1oaluaHSPQGTWRds=;
        b=vltEUqzH7QOCkS0ol1OfONp1Qm7mEg0NiOLlKa+1DGtj9XTxqb4uYLhagMhBa14ro/
         Gt0bbGeCSr4FCb1gdbLYrGXc2Bw93UKEpJfO+TMzp4sP6EXPjRBEPjolBHBloykNMW5A
         VMxVWvOYsI9KSYkO90zU+OFv+wEOvvz783TufqaPLotaxcLOSbOBXQ9VXYtYyEPxd2Gk
         M0TbAYem4q1gQd4ovu2W1yyiu8PTuX2gzRjFfwvRQl7e2/XttnM98aYS/klhJNoFHu/v
         6Fpnx9qS37HwdKUMGyXME0SUFTpK1Qjcudw5Uo1elqkYs4e0fRYx+hNE8tTcn9qbiAuU
         XekA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=foB7FKQ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n125-v6si417784ybg.479.2018.02.23.06.25.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 06:25:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=foB7FKQ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epEHt-0008Gs-SI
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 09:25:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epEHU-000828-2a
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 09:25:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epEHS-0002rN-VV
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 09:25:00 -0500
Received: from mail-pg0-x22a.google.com ([2607:f8b0:400e:c05::22a]:36116)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epEHS-0002pu-QC
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 09:24:58 -0500
Received: by mail-pg0-x22a.google.com with SMTP id j9so3417040pgv.3
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 06:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aGpCbIhalTS47znf6c2Yf3VPR/b1oaluaHSPQGTWRds=;
	b=foB7FKQ2rbbBlotV8vJ1AmC789DijMGkhV+EZyYnkHksyAngonzxah+iZq9Z11hdQG
	IKtu138oL17W/Wk0VMvlyr9LYOk/0Ysbkn0WYEcpe1Z2yfLhNTAG+isijS9K2tQ8S4A8
	g+B6olm5I0PDO3rVwX+0e/BDlDt9Gjan6lTFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aGpCbIhalTS47znf6c2Yf3VPR/b1oaluaHSPQGTWRds=;
	b=QdBLLhGihKsc3yYk8KVcH7fdKeP5nmqTIggPGeB3R1xT7mrM2Xti0kMfn0hJ/rFejj
	vdqbM9uJ/Uqqhg2n+KJZ5LlTWXc3It82lMtPsnB059pigrC83arFImfCxPReVDneFtva
	N0rsYH3CtqhTSzqB8CAFV77kKQb7SVKCBBLhY7zomJDtl2D8zjxWLVYG6iYbT6ZZBeUd
	TnZiqWGdhCEAvAuFE3rlO8G6i+blYNAKK4XUhtYF4bRF/FWdmFyZjaEIzovnfCwEydpd
	p61wOy5pGNQfaKcNY3kYlgIvVD/2cPTY5L80wBCvCBw6c02x7a9dDY3BHcwdys2Vp24i
	frqA==
X-Gm-Message-State: APf1xPBQqDqCmIsEO+5js/SHrcCbaj60rWKh5CZtOxwWf70KojF/FHq2
	FuCo/0i+Kx1UeUVobduVk21Y7q4097HbuaXJTWTSUA==
X-Received: by 10.98.98.194 with SMTP id w185mr1970888pfb.9.1519395897979;
	Fri, 23 Feb 2018 06:24:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 06:24:37 -0800 (PST)
In-Reply-To: <20180217182323.25885-27-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 14:24:37 +0000
Message-ID: <CAFEAcA8UWBemOXvu7-Dt5CMv7VHSTNp4fGSKPnnHT2UfNryOHw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22a
Subject: Re: [Qemu-arm] [PATCH v2 26/67] target/arm: Implement SVE Permute -
 Extract Group
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
X-TUID: EDZWlUVhlqJb

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  2 ++
>  target/arm/sve_helper.c    | 81 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 29 +++++++++++++++++
>  target/arm/sve.decode      |  9 +++++-
>  4 files changed, 120 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
> index 79493ab647..94f4356ce9 100644
> --- a/target/arm/helper-sve.h
> +++ b/target/arm/helper-sve.h
> @@ -414,6 +414,8 @@ DEF_HELPER_FLAGS_4(sve_cpy_z_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
>  DEF_HELPER_FLAGS_4(sve_cpy_z_s, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
>  DEF_HELPER_FLAGS_4(sve_cpy_z_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
>
> +DEF_HELPER_FLAGS_4(sve_ext, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +
>  DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 6a95d1ec48..fb3f54300b 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -1469,3 +1469,84 @@ void HELPER(sve_cpy_z_d)(void *vd, void *vg, uint64_t val, uint32_t desc)
>          d[i] = (pg[H1(i)] & 1 ? val : 0);
>      }
>  }
> +
> +/* Big-endian hosts need to frob the byte indicies.  If the copy
> + * happens to be 8-byte aligned, then no frobbing necessary.
> + */

Have you run risu tests with a big endian host?

>  ###########################################################################
>  # Named fields.  These are primarily for disjoint fields.
>
> -%imm4_16_p1             16:4 !function=plus1
> +%imm4_16_p1    16:4 !function=plus1

Another bit that should be squashed into an earlier patch.

>  %imm6_22_5     22:1 5:5
> +%imm8_16_10    16:5 10:3
>  %imm9_16_10    16:s6 10:3
>  %preg4_5       5:4
>
> @@ -363,6 +364,12 @@ FCPY               00000101 .. 01 .... 110 imm:8 .....             @rdn_pg4
>  CPY_m_i                00000101 .. 01 .... 01 . ........ .....   @rdn_pg4 imm=%sh8_i8s
>  CPY_z_i                00000101 .. 01 .... 00 . ........ .....   @rdn_pg4 imm=%sh8_i8s
>
> +### SVE Permute - Extract Group
> +
> +# SVE extract vector (immediate offset)
> +EXT            00000101 001 ..... 000 ... rm:5 rd:5 \
> +               &rrri rn=%reg_movprfx imm=%imm8_16_10
> +
>  ### SVE Predicate Logical Operations Group
>
>  # SVE predicate logical operations
> --

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
