Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7405370wrq;
        Thu, 28 Jun 2018 06:07:45 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeQIqD/46d5kyw6gyZGzmlN1bWcw3uS5Aa1BYEVMefho7kDnGwF+JvTiaJFZAfUnJjhcaGl
X-Received: by 2002:aed:3e82:: with SMTP id n2-v6mr9279435qtf.359.1530191265678;
        Thu, 28 Jun 2018 06:07:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530191265; cv=none;
        d=google.com; s=arc-20160816;
        b=j9x6+NpqtglpwG99wzhOmtu6USx/0azJcpprZ1S5a6zelbPmol/ga7HQviuayi4S/F
         Lc34k9Xb/QED+siZlYtETNXDj05akhRj6nqwF82ukdBCN6O1NB5urzi4IM1XpmXAwLyC
         DJcYj+ZFzfvUiiigJKZ0B8v6cajYv18d0/1RASh0fIXWu1B4C3K4yYe/FaWcXWswaZHz
         XrUtpHVM0kA8m1W84IyYVGBs2YIBuDNMnghDgUo7rr6hDET+A0hqPcwViqpmX2GnJwU7
         UAh4QLQzXVcgF5bUZ02dEwi3ryi+0hvlHGdbumsgsZQhv5AlqU7u4rzHQmu6ipnAA7T5
         08uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3JzRRbRmELMJtZfeN6A4ZU25bK0HL77T4Ju5FVKalCg=;
        b=k7D6M0NIaq7SXW9AhKX+FeaDT9eAm6BbX65t4HK7Uz3z31GHDVoYgjWV76mdTRgLlz
         msLRZnRMJUs5Gz5h8/5r9LnUmtydziUsIbMa8wH+N/GBJIyivl7p4ZD+hFYNw44bLjAC
         vXd3Bh7l+9qnA81mu300QcOXMwZf55rQeeQ6oCFCAt656Rbpudpiajtxz5I+yzJpma/g
         Xh9mUHuuyhe7nq0Tvgt+QwsuDCgbS4XhLsXGOUaPpIRf9P0mJc/vs+QKLdxpZraeZiyy
         rHqnsAVixTfMoWbag5MsFHWWSTzG5FjzVKlhQt4nwBqsI+2HFbIsep1zeJ5AZRg2ySEA
         QuGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JRELAu9U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 62-v6si3583035qtg.153.2018.06.28.06.07.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 06:07:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JRELAu9U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36583 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYWeH-0001ge-2r
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 09:07:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYWe2-0001eE-Cx
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 09:07:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYWe1-0004e2-EL
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 09:07:30 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:41316)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYWe1-0004dQ-0E
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 09:07:29 -0400
Received: by mail-oi0-x242.google.com with SMTP id 21-v6so5097654oip.8
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 06:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3JzRRbRmELMJtZfeN6A4ZU25bK0HL77T4Ju5FVKalCg=;
	b=JRELAu9UHzvIwWL4qr2sShQAJEu468xecHCTOuiJj7rB5tVrdSzzIC4YJsch5PpVuC
	Z2Vx88Wvjo9GPgwtIAafwsP2bzPjEcUXcSxtLbVcP4n0gUs7+FmdaJYelYT4sCGh1Mo9
	rHPHl/Z1B/pkP/lEDmp3cdhPqj0nh/IIrThEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3JzRRbRmELMJtZfeN6A4ZU25bK0HL77T4Ju5FVKalCg=;
	b=V8I/vHu54oMyLK8l5uU0WGbCb5KTbFN5yMr0k6x8/DwhbG1nqpAQNnfxAKpPX4NboH
	vTLN480xEzj5IYS8186GuP8XmUFbGgBu+vp6NDu78yilDQ0Jy1Zmcs5id5MLQjogCVI6
	LitEeE96CnlR0/FHG2v0xa2NnDNbZXdsyDklbt2RP5pU4sa7o/JcVH19GrGTxhCFA9+N
	n64P7vDNfAvQ1W8XXI0WpQnoKJjp8BlsN3d1LtML8yzqasG/F9HT/fBTNlGwHjOqWJ9K
	r/IF/ARHeupxLX7IA3Y9V+5xdOT1F6ngdZLbA6wBGCzRtRjKuKUEXKO8BVKpFD2ieU6n
	eCOg==
X-Gm-Message-State: APt69E13L7CxzT6SLR83895PzMAckx29xD7R2llJAVn/EsfwQ+0lEman
	RmF84Y9ASP+YX0k8ZfmG8ykY/zCVrWXbi3KcOSS65A==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr5280037oic.252.1530191248241; 
	Thu, 28 Jun 2018 06:07:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 06:07:07 -0700 (PDT)
In-Reply-To: <20180627043328.11531-34-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
	<20180627043328.11531-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 14:07:07 +0100
Message-ID: <CAFEAcA_ZfQ1y0=sWBqLGSbd5qoBvhSthUy_udDi-aE5U66DLLg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v6 33/35] target/arm: Implement SVE dot
 product (indexed)
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
X-TUID: 8JASUG41mZxT

On 27 June 2018 at 05:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> ---
> v6: Rearrange the loops.  The compiler does well with this form
>     and hopefully they are also easier to read.
> ---

Definitely easier to read, thanks.

> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index 35415bfb6c..e10b689454 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -726,7 +726,13 @@ UMIN_zzi        00100101 .. 101 011 110 ........ .....          @rdn_i8u
>  MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
>
>  # SVE integer dot product (unpredicated)
> -DOT_zzz         01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5
> +DOT_zzz         01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5      ra=%reg_movprfx

Shouldn't this have been in a different patch ?

> +
> +# SVE integer dot product (indexed)
> +DOT_zzx         01000100 101 index:2 rm:3 00000 u:1 rn:5 rd:5 \
> +                sz=0 ra=%reg_movprfx
> +DOT_zzx         01000100 111 index:1 rm:4 00000 u:1 rn:5 rd:5 \
> +                sz=1 ra=%reg_movprfx
>
>  # SVE floating-point complex add (predicated)
>  FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \
> --
> 2.17.1
>

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
