Received: by 10.28.71.27 with SMTP id u27csp717564wma;
        Fri, 23 Feb 2018 07:23:19 -0800 (PST)
X-Google-Smtp-Source: AH8x224UQwJE6xfZOkrSZm/fUD1kgEs/VStgWdG8cgNt0njRnYq81y57B8oZn9404doZQPdN+Zjr
X-Received: by 10.13.219.22 with SMTP id d22mr1246768ywe.315.1519399399277;
        Fri, 23 Feb 2018 07:23:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519399399; cv=none;
        d=google.com; s=arc-20160816;
        b=XfI35ffSnWaZ6OL94wIa5KisvK8uOj+CBdBWHsoYAv7xzYbpU4eGpaVJoBsuuu78yl
         qLbhbeSqzBqE1zzu215ZVQ8EjHQmW5btQfCxxQV71gUtiPcWEWLQNDgMKKa8w+63WL06
         2qNiZKHltg7/wUSHxoNcQpI5nOOJWan917gR/P6UF1k67+5P0oZCmmA/E49MO9+UeRPb
         CqWW5qKbR3ymIt4JZvPas/KVeb1G7dHcgVtl4oHg1lL08qYeHpMyqkgijVuEbc58Mij/
         g1IMJ1+NV4Od2UZeCKqHn7asbPkMAGvSz4PBXdV2kZu4ENQeOQFmgaMI0W7W/c+a0nCe
         OsdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=V6/cTtmfa3L7FecLLSD+xD4m6B3lsulJYG6chTNoBww=;
        b=D5Z4vzjSJ61NZLxwJfVTGO0DK4yED8x8GSIMaNoDnf2U1TxOzIxxTOCz2P1ZRFbkm2
         uC13pCvWUV4KlO7AiFTVj+qurFAHIoGEStxTVTAD/b6dDFdIL4pITIOP98caki58p1Xg
         H3Oc42p2Ff6xtgnGk+7hXRmDu6gyZyEZ362V416vDtid7DCRg+5D4EmXhIjwA/vtlN8g
         A9GFq3ZPG/NdI1Or2xtQpEjfravfJgar3kwZwuWu5Mp4rn/j44c8k9zTOadVxRAvCrd8
         nA28prVZ8/sMRvByU+67oG4SRQg5q7dNoM9puHsEdtY6Qm9k8il3wL+uFXHKreLxcHfr
         9FKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jhZu7gYe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p9-v6si291159ybg.312.2018.02.23.07.23.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 07:23:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jhZu7gYe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45148 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epFBu-0002fH-Lm
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 10:23:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epFBl-0002eX-Rk
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 10:23:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epFBl-0002kV-6J
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 10:23:09 -0500
Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b]:39912)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epFBk-0002kA-W5
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 10:23:09 -0500
Received: by mail-pf0-x22b.google.com with SMTP id c143so3636993pfb.6
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 07:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V6/cTtmfa3L7FecLLSD+xD4m6B3lsulJYG6chTNoBww=;
	b=jhZu7gYem9zI87PTOuExS3lwtce2Bp3oAGhqyWTSYqnYly8+BwydlcwFKJndP/QGK3
	vZXmjF9J08EQLQVOk17wDczN53sdERSBIMzxqyT3b2d2bfiY3EhaCvxymJQOefEsz+E4
	e33H1P25mfyJJEP9vKfyQ6sRPU8AE6ri5fqLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V6/cTtmfa3L7FecLLSD+xD4m6B3lsulJYG6chTNoBww=;
	b=RpvJLJrBhvv7QGY0vEt36/TkMWRHwJ+x36E5ublA5Y+aJGBpqq0jJAiBEYw4impYf4
	gCHnM2iKgRDNuZaTxyIrWOvcjRA8gs9V7GuUmLPvljFN5Cgd5EG3x5Isce8Lm7EWOuci
	b6UaLpmX+367kqho3gLSQWLuOTPE3UyrRWndtSlLknf0H9k8nt6ZjNfzhIH2GBJ+OulW
	4/DIS2l37Ye22TCAqIZu7bPDKppHnBbUe2ezx3GwZzFtdX4hZU3NHzz6DK8hq/CGRMwD
	MkF7DYsDtAh65FV9u4Dal9UrY45IgQyGLHeXgncaLRbrjyHJSJup7AfxeBGyncm5Hmp1
	KBaA==
X-Gm-Message-State: APf1xPALi3cQ+4Y2a2a0yNcXAQiztNKs+E+hi1XsLqYCyUyQ+11HJvcw
	MA4FgS7HoCCZKiHf5hGawSr259K4ZzCzQHUx2fMtbg==
X-Received: by 10.98.107.130 with SMTP id g124mr2095865pfc.225.1519399387941; 
	Fri, 23 Feb 2018 07:23:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 07:22:47 -0800 (PST)
In-Reply-To: <20180217182323.25885-30-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 15:22:47 +0000
Message-ID: <CAFEAcA93H77dHU8fEc0=O=6hyF-sLkv_Vw0=9uhjYBBgpv7sZQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22b
Subject: Re: [Qemu-arm] [PATCH v2 29/67] target/arm: Implement SVE Permute -
 Interleaving Group
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
X-TUID: 58A4RezEB3kP

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 15 ++++++++++
>  target/arm/sve_helper.c    | 72 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 69 ++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 10 +++++++
>  4 files changed, 166 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
