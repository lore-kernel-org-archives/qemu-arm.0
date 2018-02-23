Received: by 10.28.71.27 with SMTP id u27csp789406wma;
        Fri, 23 Feb 2018 08:29:52 -0800 (PST)
X-Google-Smtp-Source: AG47ELuv/e8D13OSJRcl+aBFdP1HGD6POlRY3RghxeblsdZXFRAr+pHUSQ2HP6OwuZzUk2ENmVVS
X-Received: by 10.129.93.137 with SMTP id r131mr1476301ywb.56.1519403392854;
        Fri, 23 Feb 2018 08:29:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519403392; cv=none;
        d=google.com; s=arc-20160816;
        b=NWG/R92xzmcLpxRV0rXVahBkwlTaIAdOQDAiLfqHFJ1XEtPOSutPf/vaMHGOkDdtI+
         44/AMmscuSqV/LLrUgDALu7CrUHxvhMeTa9B70q/aJ+0cI3mVEcCy/0fBjimiv5vizlQ
         XpDNNjb0k+nPcNQqlvUV2/oHEUITW/5aCPJ70Ol3UfKJWP4KrocRrt9FK8acbgBExyI0
         dDWZX4i+/ezeJ+glLVIlh1PyP2Rvjdk8L/R0X2evjYGzXJ8qyJ3aWVRtjieg50OpeTs/
         olS3zf6R/Jbyl+M49TWtnleP9+MimHciC9MPLoI+7s4qHl861bc5GtqguCkF5o+j0ZXV
         lNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=KCyni//B5DqrUZPzDmiH7uViKKG9NKovVfBfELMcFyg=;
        b=FIcOTn7xizRQc8H1A/9b88inYGDYLVWo7TbxOz58WPc728b9ngF8AUuyRRXrLUcDJU
         Z03PE++kT2BHRtLhvEBlgvYsZ7lBCZQsjXt6tZIvb7szKxszyDLJDVwlNNI6P2syZAi+
         B+5CgM6JBusnlC9l4h9fOFVQb3LHbvepmg17w76hxPguhKMfKkwVfzpbQ9JWx/D+BMXj
         OmYe14EubnmI/+fGN9ilqzZcfFPzvU4CyelJKYqQBxCGELZZpdvSqYHjWW51qprNLja0
         8JKezxTGSY7ydPqDV5LnnKq5xm2xTb8Sv3wOZsEy42wtockrqzGL6coemyFC02+frQlS
         QxZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eAqcbiaN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x203-v6si463535ybx.751.2018.02.23.08.29.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 08:29:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eAqcbiaN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epGEK-0000HJ-2D
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 11:29:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epG67-0001Xo-Ut
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 11:21:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epG67-0005Jk-6e
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 11:21:23 -0500
Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231]:34839)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epG66-0005JU-WE
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 11:21:23 -0500
Received: by mail-pf0-x231.google.com with SMTP id y186so3020397pfb.2
	for <qemu-devel@nongnu.org>; Fri, 23 Feb 2018 08:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KCyni//B5DqrUZPzDmiH7uViKKG9NKovVfBfELMcFyg=;
	b=eAqcbiaNYMSe2LClgO8rVTsoQo9+5ISZviBNrm45OUQpWFgvUhpHgrSc+pFZCF2xW/
	PcDODhsiciQQ3T8D9BIMa28k1gx8VbJwuJzvC2LWUSmY65ruc+gu1VJ/AQusIzZvKkph
	GnWo4A7lrdgc3iNuChcfF7JmoFNc/C67+UbRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KCyni//B5DqrUZPzDmiH7uViKKG9NKovVfBfELMcFyg=;
	b=nkvBPoz2xy+VLcACFDilDgZNtRmbRrkpVPsql7jdYsKImxkzKTBNmtWsGBPmzLVFDw
	BmGFLQseGYnA+QMl2+ys9fVCp6d9w0PhgtCYYL1AXUWaokCGuYR1Ia31MIvSNJ8cQQXD
	OaBYKRw2RNFrd4QgrFOxFCvrO0oDRsaECMHPX4aNtH7idg3T98pmA1WrmsURPwuDEOsZ
	cunamdW52AFbzCfl4iYwYAIV0yG6z/rzoJg/OLireucm4P7STWv/h8LqvgwnjKlPDK0a
	XnnNYtwRgy8EZ5YzOAc01nBO0l7SHR2Zy/RQ+dVgru8wZ2qNoXVEI7is7J6yWPPj8Ibh
	PliQ==
X-Gm-Message-State: APf1xPB/x8CP0W1xbPNBll0a8Hd7E9AUUubFAveqbqfFDCq8Xu8hqs4K
	8Vkr0MxMrjmSy+oLqwRbiHvZZyV91olSTXaxN7BXDw==
X-Received: by 10.99.182.12 with SMTP id j12mr1900772pgf.113.1519402882015;
	Fri, 23 Feb 2018 08:21:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 08:21:01 -0800 (PST)
In-Reply-To: <20180217182323.25885-36-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 16:21:01 +0000
Message-ID: <CAFEAcA8H6s-cVcq9aontUuV5E0xuB0StuPOa70skZ1N7W64RTA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::231
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 35/67] target/arm: Implement
 SVE Select Vectors Group
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
X-TUID: 6INKTSp3/+Y/

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  9 ++++++++
>  target/arm/sve_helper.c    | 55 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  2 ++
>  target/arm/sve.decode      |  6 +++++
>  4 files changed, 72 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
