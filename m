Received: by 10.28.71.27 with SMTP id u27csp633236wma;
        Fri, 23 Feb 2018 06:07:15 -0800 (PST)
X-Google-Smtp-Source: AG47ELsTa3F/I0hgeqMR3HR1adOgUNnq72Q752dfc/b3jlj6MImZ33bJRlHl5vHjcptoBYnGnrl5
X-Received: by 2002:a25:6ec6:: with SMTP id j189-v6mr1057377ybc.505.1519394835461;
        Fri, 23 Feb 2018 06:07:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519394835; cv=none;
        d=google.com; s=arc-20160816;
        b=FOs7tMNADEfezqp2N++7MbazwasrTdHNwxkzTiNP37QuE3WarhkXFHXAcPd8HgXkLX
         eztpKG3bNEZQMQGgVYO9At51CCPnBsr2BCxIhKpJ08R5atErIH+MlKLXyDulYA3e6sXx
         PRAYtW34PRI97EhZYQhGM6kjtvE/7MS9UCXKIVALelL0LXfsqzKDMXk54rjGY4Fhaf8i
         FEwKSRbRHYrFikPfYmrw+57Wkq5jIa11H9GAqfCvnb9dQkf6lSi0vnWS8srr5d7uyyMj
         v/IR9L3I54+q9HBYUNSxRDU8IuGvJFOVTdQK3bs2I3eTEmjgcHsfZOpD/D6D43rgiIeM
         +rqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=B7EiK0oZcxenKvEJ/MObbKYS/Bq4JYigqb4IktWtD/E=;
        b=K9uxGHEL3RFcMMpCec0AcmdqGlTIRw6KwF+h94r4vntW7PM2M2Acp58/CUmpBbPaXA
         Xx8mM5opdlydzx2tU5IeqOj1bTQ6TuEYI/x65gpV6q+9Odz8W3imUoIW2MJGrXdYtpl1
         SdUULLoadfLRoNYq12Uw+UMpDPhVh47fEjuf6efPUaxj3VJtyq/niBVVH2rhFmNyvFZa
         81q7ZOSXjIZ0si2DlFQ/r9a5XgkwqMuUqkw05Y5Omi/XrEjWcc0wN03YTYBUGDO0kkJ3
         7KmiMoJes0FOvQNnK1MOhs/pWqKs22bkDPptPM8LZzzGhf3HLMbt3VCut3Au6IsLYTXj
         BN/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OFLvHOrZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t5-v6si419587ybi.251.2018.02.23.06.07.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 06:07:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OFLvHOrZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epE0I-00077w-Qc
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 09:07:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epE0B-00077h-1o
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 09:07:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epE07-0004Fc-82
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 09:07:07 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:37333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epE07-0004ET-0k
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 09:07:03 -0500
Received: by mail-pf0-x244.google.com with SMTP id s24so3556521pfm.4
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 06:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B7EiK0oZcxenKvEJ/MObbKYS/Bq4JYigqb4IktWtD/E=;
	b=OFLvHOrZ4JfC0rfiRng8fcjg8O5z+3SCq/upI+E4NZl4OUYPGIUkPxpZrS++ni9LCx
	+7Sw1yGMJe0+ras4JS2VqZ0kPEj1VHi4Ii2kHsu30Zmcog686VmdrAPOEXDeo8Sco005
	tb2Sa6fXDWxY7yb/UH3ezZh+1UZjAZgNY5bdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B7EiK0oZcxenKvEJ/MObbKYS/Bq4JYigqb4IktWtD/E=;
	b=qc2PRIbzak0MhDLNqi/fmddinZcbvjaJbqoe6+W94ftZo/1f1YgPMZ/oetDcuBCi/H
	Yz5tRYQzkerB8lOy4WFiPp33RW8bSQHY+qbSBJx2Cp2d5cICUU2qcmSM7qhRJjTn+ZTa
	Y/wvT8zqE4RDyPOfLMgTXuXBVEIGtk+kD+K8hFFqLK8W4QNnATSx2nvtNhOdRSLbQZKs
	z0dJQQY833dclmUoxiSCTPDpP8I2+iUBl64332xKYKSAQXLFoDQKHXDLcnvPOWts1L35
	R8xjkxBNJnBY2ezv+OW7cLVwRt4hFb7i4ippM7gS6MP0jJ/VIChI+MUHzlxc2lRFTUv8
	4CMQ==
X-Gm-Message-State: APf1xPBWz1tAJuRotP96cuvEvnBmMBYqyW56F+VSLxtfpEoW726H3DNv
	FRH9V1HNtCTYRlSrr5bYCE/gnwE8m0HlsES1K1wG6w==
X-Received: by 10.98.18.70 with SMTP id a67mr1894316pfj.213.1519394822031;
	Fri, 23 Feb 2018 06:07:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 06:06:41 -0800 (PST)
In-Reply-To: <20180217182323.25885-24-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 14:06:41 +0000
Message-ID: <CAFEAcA_Qwx55g-rkcw8M_CUCDjtkwH1iOscxEt9a78y5GckQUg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 23/67] target/arm: Implement
 SVE Element Count Group
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
X-TUID: dVt4mXOZrukH

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  11 ++
>  target/arm/sve_helper.c    | 136 ++++++++++++++++++++++
>  target/arm/translate-sve.c | 274 ++++++++++++++++++++++++++++++++++++++++++++-
>  target/arm/sve.decode      |  30 ++++-
>  4 files changed, 448 insertions(+), 3 deletions(-)
>

> @@ -127,7 +132,9 @@ static void do_vector3_z(DisasContext *s, GVecGen3Fn *gvec_fn,
>  /* Invoke a vector move on two Zregs.  */
>  static void do_mov_z(DisasContext *s, int rd, int rn)
>  {
> -    do_vector2_z(s, tcg_gen_gvec_mov, 0, rd, rn);
> +    if (rd != rn) {
> +        do_vector2_z(s, tcg_gen_gvec_mov, 0, rd, rn);
> +    }
>  }
>
>  /* Initialize a Zreg with replications of a 64-bit immediate.  */
> @@ -168,7 +175,9 @@ static void do_vecop4_p(DisasContext *s, const GVecGen4 *gvec_op,
>  /* Invoke a vector move on two Pregs.  */
>  static void do_mov_p(DisasContext *s, int rd, int rn)
>  {
> -    do_vector2_p(s, tcg_gen_gvec_mov, 0, rd, rn);
> +    if (rd != rn) {
> +        do_vector2_p(s, tcg_gen_gvec_mov, 0, rd, rn);
> +    }
>  }

These should probably be squashed into an earlier patch.


Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
