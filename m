Received: by 10.28.4.212 with SMTP id 203csp1886838wme;
        Thu, 3 May 2018 06:11:00 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpRVstoH73hJKEuLSq/BwIVZhylV20db8LZ0mbv4xxKQ2zB62SXBW+ED/fXHsLD92yt057y
X-Received: by 2002:ac8:2627:: with SMTP id u36-v6mr20573228qtu.189.1525353060160;
        Thu, 03 May 2018 06:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525353060; cv=none;
        d=google.com; s=arc-20160816;
        b=avxYldzcbFI+q/KHHcXWBb4hX7ZEAsNsLuyCGl06eDZ44XzOb1cT5uqIjpZCKKjr47
         PWXBbR0q0WDcbiJJ3UnzLip9Sen+TMxp4SVWo9ogkFcP3bCYsEkJ6RZzhr7qXW5vMjka
         DT8hELIkBQZD/IZzLQSQPjZonFDUsTCjHfuaA+DpEU+1njxwBqnvQqQ/tP6t9F8zUeol
         spuby/JEnZ+KWajbF9O5q8DtC1t4wsPmWUn2fGQWW1ktCYfI/cnpaGoZOgY4p/Dm1onE
         Q/fTwlivgeL22iPuId8f2z21xyjz+JQ4FH8eeZRiHLp1NRf/Sy7c5aEoW3uP5w57qSFa
         scpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=1PZ8uCAoxieqlcC2E9FIBCy4SqltydnWfRazKUHhvDE=;
        b=PzzcbizGQmIP6GePhrgo2WkaXsWQ2o/32xwI65NlJTBy8ECoRTQGPwy8OFynb4p8n2
         fXPXx2JqrN0Np/ztSuX14dMr/a9ceL8KrvKID3rqUSxAvIhoRNJRNZcbOQX20cIpGvIH
         f1Xi05ArmlPcWa4wB6ML0n9MhyKePhOr0o5HPhCSed6MFrnlZNxTupua8gRndQTGuDpa
         QUWdawuBrsSGtmtrDGvcqjXJMDB9iiRrKcm6LDxVfXs+K6eMJQVMYyeutoYBBHjQgPx9
         gEP790gP4UbGWvRfnm3/NCSCYemlJmIbqEejbbYWj3E89WoJeLXIgwEnzqVtmVr91GRc
         yn+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HarRDPe9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t4si858261qkh.207.2018.05.03.06.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 06:11:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HarRDPe9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEE0h-0004RR-Hu
	for alex.bennee@linaro.org; Thu, 03 May 2018 09:10:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEE0U-0004Pq-Ej
	for qemu-arm@nongnu.org; Thu, 03 May 2018 09:10:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEE0T-0000wz-O0
	for qemu-arm@nongnu.org; Thu, 03 May 2018 09:10:46 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:41308)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEE0T-0000wk-H5
	for qemu-arm@nongnu.org; Thu, 03 May 2018 09:10:45 -0400
Received: by mail-ot0-x242.google.com with SMTP id t1-v6so20532231oth.8
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 06:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1PZ8uCAoxieqlcC2E9FIBCy4SqltydnWfRazKUHhvDE=;
	b=HarRDPe9u4BDA04dWsOQd7+hTUG5eN/TlkHrmbIulVdVE4T9cgq9H0tYuQVRp7BTJ9
	t/WeirXAua7rk0E08NkNq51JdBq3NKjn82cNkXdtM5XquhjAEAZfiHwxoivObeWObqwy
	FdKsvbvVRutwfYVD6Tgvr7OvmqViE7uW7+bbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1PZ8uCAoxieqlcC2E9FIBCy4SqltydnWfRazKUHhvDE=;
	b=snwIxE9xRSX5VzVe3hzJ1I9Ov5yBSPzaXd8Fh+Jp3pZKw+62kzVnHFE8fworfIF6xM
	krCjNfYOCD34r9hQg2kHgBCIk1axftJiw1wr5Usy0phsdv9uoXNcFSQ6rAh2MAq0PfyG
	4Ht9X6PsfyY3j6i9zcSYFsHmDsAevqQ/T0HSEMy6e8svyxUWDsXQOBTQEk/vq+QXnptZ
	CMaeObU7thXfchkLwtSXVuBEFeHw2ZhVDZMMCflBZ75iOlTuYrnqz/8F51VXkcDMtHDz
	WfyRceC2pE46sO3W3jv1TemBbiJmxhIhh51+wjs2vmOyLHTzZVuo2rN/+8+9z48Jci6W
	lYeQ==
X-Gm-Message-State: ALQs6tD9JEVOrrfbYnWhi5tQ87z6+zE9bF3K6zZQJylXTL8gFcHgJAMy
	WQRot7MzeVoRDWihNf8JUYrXLZUxm8swdhgegLAwjg==
X-Received: by 2002:a9d:429c:: with SMTP id
	r28-v6mr15636209ote.126.1525353044847; 
	Thu, 03 May 2018 06:10:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 06:10:24 -0700 (PDT)
In-Reply-To: <20180427002651.28356-2-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 14:10:24 +0100
Message-ID: <CAFEAcA8H9pXsCfOwQx+tkbQbOfdmqrv4maNo7-_voyQjighxPg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH 1/9] tcg: Introduce helpers for integer
 min/max
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
X-TUID: NbHrS5bhTiBF

On 27 April 2018 at 01:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
> These operations are re-invented by several targets so far.
> Several supported hosts have insns for these, so place the
> expanders out-of-line for a future introduction of tcg opcodes.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg-op.h | 16 ++++++++++++++++
>  tcg/tcg-op.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)

I think these new operations ought to be documented somewhere,
but they fall into the awkward gap between what we document
(the TCG opcodes) and what the frontends actually use (the
tcg_gen_* functions)...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
