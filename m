Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8099780wrt;
        Tue, 4 Dec 2018 06:01:08 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UNJ09J23mOYbQYDgOpJob36JVKcxLPjNOkKn1L03Vrv7dzGND9Ek1kz67nBf6JhaDyN/Pp
X-Received: by 2002:a0c:f787:: with SMTP id s7mr19923240qvn.167.1543932068768;
        Tue, 04 Dec 2018 06:01:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543932068; cv=none;
        d=google.com; s=arc-20160816;
        b=Q8arfqQAnrGTIwZ7s5ODDmaqwWWCiIf6sH/gNH64j6pWs0/pPOSfw8Bc3+RbRQ84zT
         KcNc04XViXltRmPnNcw781G/upt+SUMkqjy0LuMcz14nkwG9P/siPMfsN2ziEeY+Wom4
         cQ8EbM1wn74/L2JsDLpoYjls9hpejw64kPIQH1ocSIXcVX/FZl7ilvqNJigfJzbrxvtt
         HYd8YcZGWr2AamMLQujzYTTmWNzPQL+QrccJsdIvoZPBEnzwFM3bMnm9PUQLQTVyWQ8P
         u8zsAibhy5bV3cA/vnOKooBoc2hBcYNq1Ty/8fjjMTJuuv1F6NMKsFGQNYrVSFKfavKK
         Xfmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Ee5VVtjfMk3Np124zPiGS4ikBEa3eNOp4k2RuXwwt7c=;
        b=yLcUSJ32xdvNmWGA46QaLXwBF8jVaDb15T76O5JPeYlVUtfyEb5rEJjvKMdYFOnzv3
         Xe0ykok9YuNa8ISypvc6k8n6I2J6xXpm66X2mkx5bkAfr/jvUkVG8VJmkKm2HX/LWnyL
         qsM/fI2hdWHtvn/dXIWTUe4DCWumNoAjHBGtIIGMTOdYRy29OSiNgk+sn8z/yR/RV/nZ
         qyHPrsgDB+y8o3KzKvx+CMFOB7/wykNLfVO4QBCMdUd/2MkkRq15DEdw5fOQPpD1WDJt
         6obCfNOAueWGu72u1yxU9UUZiBcbgRCistkFlIlYik1GDiKmQIHF/cZy3T+6jGcMWZG4
         E4Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OKfmpMUn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i17si1850450qte.298.2018.12.04.06.01.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 06:01:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OKfmpMUn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56962 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUBG8-00016J-BI
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 09:01:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gUBFo-00013C-5w
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:00:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gUBFg-0002VE-BM
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:00:46 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45275)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gUBFf-0002Sx-3I
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:00:39 -0500
Received: by mail-ot1-x344.google.com with SMTP id 32so15188360ota.12
	for <qemu-arm@nongnu.org>; Tue, 04 Dec 2018 06:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Ee5VVtjfMk3Np124zPiGS4ikBEa3eNOp4k2RuXwwt7c=;
	b=OKfmpMUnlPAxLAM7/fez7wrbfctWKc82NE7NlV4Ed8mFAxlUi1kGGYz4ffCWJnJvkO
	Gl/YbG1WmkVEPrgGo1/FoU0CA/ejcmUHVwps/feeX1/xo/06xEgk3PxjLUy9rLcpH4I2
	CsSl0gSIXd/+CS+FsEOLfeOF+RG7WKSVPYTy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Ee5VVtjfMk3Np124zPiGS4ikBEa3eNOp4k2RuXwwt7c=;
	b=Kb2FLeUJ8+ni9pjXzCBArpgEfZ76Fyt/oGiG/ckBMUMq5zU1V55CQdG4ujwaNfXs8F
	Wfjob9uF9LIGz7LAakq/YyAmDwVDznYAsrCSeuDbXjWS+4m93xbzUxSOM+Au9hQFg+Ww
	Enk+KRepE78vZ6SwB9OT4/11Q4Tf0CwKpCgFNynh4IZkaabCB+gPAp7i+EREsakOE1Vw
	jMttiWUgc6OLgeg1TB7IIeTBu+fR4czd/0jXrei73O9hClyq2tE8xOhmQFJJpAK+j92w
	QNfR/GwD8LvvgeK2NRjx+fJPV7bAWNu0r/rxt0DCxb0Jqb/JJJopP81b2mU6w2O7UKFB
	mkPw==
X-Gm-Message-State: AA+aEWar9L4fb6cPNpQn925uduH1GtanQLrlEKHwEWkFiabg5Ak/lME4
	UCE5JpBkDXv7JD+0VSHHRA2QMA==
X-Received: by 2002:a9d:e8c:: with SMTP id 12mr13213819otj.297.1543932035667; 
	Tue, 04 Dec 2018 06:00:35 -0800 (PST)
Received: from cloudburst.twiddle.net (172.189-204-159.bestel.com.mx.
	[189.204.159.172]) by smtp.gmail.com with ESMTPSA id
	p203sm16240587oic.49.2018.12.04.06.00.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 06:00:34 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181204132952.2601-1-peter.maydell@linaro.org>
	<20181204132952.2601-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cea0d044-7fd6-e186-78c5-e95536c8e72e@linaro.org>
Date: Tue, 4 Dec 2018 08:00:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181204132952.2601-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/5] tests/test-arm-mptimer:
 Don't leak string memory
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NM2kqedb0EO3

On 12/4/18 7:29 AM, Peter Maydell wrote:
> The test-arm-mptimer setup creates a lot of test names using
> g_strdup_printf() and never frees them. This is entirely
> harmless since it's one-shot test code, but it clutters
> up the output from clang's LeakSanitizer. Refactor to
> use a helper function so we can free the memory.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/test-arm-mptimer.c | 153 ++++++++++++++++++---------------------
>  1 file changed, 69 insertions(+), 84 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
