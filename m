Received: by 10.28.71.27 with SMTP id u27csp2302143wma;
        Thu, 22 Feb 2018 10:55:56 -0800 (PST)
X-Google-Smtp-Source: AH8x226/OJJh3DxfUOE1RHtgVZ6b5DalUumJfFVLEsnapC+hQxAUbkgWv4v2cBOCtPfCiGAMJj36
X-Received: by 2002:a25:7244:: with SMTP id n65-v6mr5592272ybc.76.1519325756841;
        Thu, 22 Feb 2018 10:55:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519325756; cv=none;
        d=google.com; s=arc-20160816;
        b=Be/RyhmZV4a33AZBS7IEfbZtf1VrEfLDZ/yby+mto0K7EcJ8OM0RV2Roo4MioEN2Yq
         5v16KcbHZjT+IAS/agOGStTQRc4kJ+0lpvhX6SfrqPgG++2WJDeXPzrRA5ZhMQzK2Yu0
         jK2uydLb8vq08OzvumLaHRxiR3aET25oCxgCYjksWJja/uJIaFF3Z8NpK/SdGzL3mA4r
         K5kKCZAyd26hfx5XtA2GX2vID5K2JE05lQzngU8Esnyfrg32Q4WnvcJtyuF8E86j8N1e
         SJV/WMzWPeSJSQZjEK6peMetgX+V11oFAeHVr5CP2wVpMMpDtT+XLOC1yt0+nDH6wVSG
         tLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=NQfJsTXMV0cwJQt+MYNyZjz2Wm6oh1+u/y6GrPjBYHg=;
        b=tpEiMNbVXOijixrmMDmMYvSsM81mxFCWsAiItv2usexdFMLm6TIXtdFTPyRve8oGji
         1j7+oMK12q2wL36YkjIVfj3F58aNJFU0HySi43hzbD7M0hkzDx7x+h/hcTfXvbNrvTCk
         9+PUWVhLQRc4nbHpoFy+ChNf0HeDfOjQ4+k+d3drmO4MSaHb13RBKh9wfjo0k9nZ8sWH
         P5E/uxuY6pPoxHlT4xwN9Z63RuvWDz7lNQQJuYg08Zm+AG5sqKGGDwq+nEuGKH3JyLMq
         2g8WpavY+E3dHIJ110SgqkD/MHK9CqHcZM8KQQieQ9Wqa848iR06nRIplZ4uoGQ5bJX/
         K0gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AigkHtWs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r66-v6si110382yba.359.2018.02.22.10.55.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 10:55:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AigkHtWs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eow28-0004kh-Ba
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 13:55:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eow1t-0004jf-Ti
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 13:55:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eow1t-0003In-1H
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 13:55:41 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:41310)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eow1s-0003IU-R3
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 13:55:40 -0500
Received: by mail-oi0-x242.google.com with SMTP id e10so4466857oiy.8
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 10:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NQfJsTXMV0cwJQt+MYNyZjz2Wm6oh1+u/y6GrPjBYHg=;
	b=AigkHtWsletkchvu2PGn/ohWducweUGW58m0WY6dLsbagShrjj4mFNsGSco5ItaIeE
	mEEKHkxKLzMhx+79i8yc74x+DxSS/XCrXoc/pXMQOCIl1g+4E+x7QqXeyls3770ekCfs
	Jys//hZvYEhv3MlqCaJ+qZD2/tgHgCfVrOTsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NQfJsTXMV0cwJQt+MYNyZjz2Wm6oh1+u/y6GrPjBYHg=;
	b=i5ilZdJJM90Uomanv01HZUXbgIfB6eFgYv8GI4TNRaEiEgwaRVSFR6QiEMyfEqfwkX
	tFr5XH5MQICq2pOtTLCI9gM1v0MM2ysUdCdkPNgaXTRe0ulYy06QKY24zoReTqYj+hAd
	MGOwBuZLGs4W71wyEKiRReW426CDDI0+PbbjR1c83BjTA/l/o4CH/AUX45N+i2EVJO7i
	sfew8sMGz4S6JkJOu1RErMEiywKEqR+ahHKA+97reg5J1E+alY2+zUFCk7HNi8QnEd00
	2xPkn+RDRVhigihPTjqk7cxcIyPY/wc0SnDnGAT6xh60SwhyelQGBKbFaxbjrP2XvaFu
	ml5A==
X-Gm-Message-State: APf1xPA+kRVqkvz4yw0Uj2VpyAK1S9l4Nkg4xI0l06F76Fx4vudFSnLs
	f2YbUtn7pDoI5VYnac20ci+GrGDaC/2oehmD1ynjSA==
X-Received: by 10.202.191.196 with SMTP id p187mr5435734oif.12.1519325739883; 
	Thu, 22 Feb 2018 10:55:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 22 Feb 2018 10:55:19 -0800 (PST)
In-Reply-To: <20180217182323.25885-8-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2018 18:55:19 +0000
Message-ID: <CAFEAcA-PzKt-gZe2FjvqZuJqFmgoziNKaDLyen9o+hToMboQWw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v2 07/67] target/arm: Implement SVE Predicate
 Logical Operations Group
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
X-TUID: rCTE3d1FD2WU

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> -void trans_PTEST(DisasContext *s, arg_PTEST *a, uint32_t insn)
> +static void trans_PTEST(DisasContext *s, arg_PTEST *a, uint32_t insn)
>  {

Should this be in a previous patch?

>      int nofs = pred_full_reg_offset(s, a->rn);
>      int gofs = pred_full_reg_offset(s, a->pg);
> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index 7efaa8fe8e..d92886127a 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -31,6 +31,7 @@
>
>  &rri           rd rn imm
>  &rrr_esz       rd rn rm esz
> +&rprr_s                rd pg rn rm s
>
>  ###########################################################################
>  # Named instruction formats.  These are generally used to
> @@ -39,6 +40,9 @@
>  # Three operand with unused vector element size
>  @rd_rn_rm_e0   ........ ... rm:5 ... ... rn:5 rd:5             &rrr_esz esz=0
>
> +# Three prediate operand, with governing predicate, flag setting

Three what?

> +@pd_pg_pn_pm_s ........ . s:1 .. rm:4 .. pg:4 . rn:4 . rd:4    &rprr_s
> +
>  # Basic Load/Store with 9-bit immediate offset
>  @pd_rn_i9      ........ ........ ...... rn:5 . rd:4    \
>                 &rri imm=%imm9_16_10
> @@ -56,6 +60,18 @@ ORR_zzz              00000100 01 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
>  EOR_zzz                00000100 10 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
>  BIC_zzz                00000100 11 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
>
> +### SVE Predicate Logical Operations Group
> +
> +# SVE predicate logical operations
> +AND_pppp       00100101 0. 00 .... 01 .... 0 .... 0 ....       @pd_pg_pn_pm_s
> +BIC_pppp       00100101 0. 00 .... 01 .... 0 .... 1 ....       @pd_pg_pn_pm_s
> +EOR_pppp       00100101 0. 00 .... 01 .... 1 .... 0 ....       @pd_pg_pn_pm_s
> +SEL_pppp       00100101 0. 00 .... 01 .... 1 .... 1 ....       @pd_pg_pn_pm_s
> +ORR_pppp       00100101 1. 00 .... 01 .... 0 .... 0 ....       @pd_pg_pn_pm_s
> +ORN_pppp       00100101 1. 00 .... 01 .... 0 .... 1 ....       @pd_pg_pn_pm_s
> +NOR_pppp       00100101 1. 00 .... 01 .... 1 .... 0 ....       @pd_pg_pn_pm_s
> +NAND_pppp      00100101 1. 00 .... 01 .... 1 .... 1 ....       @pd_pg_pn_pm_s
> +
>  ### SVE Predicate Misc Group

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
