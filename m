Received: by 10.28.4.212 with SMTP id 203csp4216450wme;
        Tue, 8 May 2018 07:10:31 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoy5f31EpXloRBnmgz71xNdX6loPtIsaJ/EtsI9hb+DAadPfmi6duIAbqrjntaD6MSQ6tDi
X-Received: by 2002:a0c:d2d8:: with SMTP id x24-v6mr21560032qvh.224.1525788631067;
        Tue, 08 May 2018 07:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525788631; cv=none;
        d=google.com; s=arc-20160816;
        b=gdfQfWXdoS38Xr3WzvZAJeKDWu85wT6PombxfU3/J1lw21uBVVrETYTVp2HKJxFvyW
         ZsTpwrevCZxSyvM3hKKsZtNRGpqr6p/zWVeC1Sxv9Zlk4t1Ns7r6dGPnu4XYxPmszNvv
         n1C+gUvv92C8jHD2ZXJZJPzrgwio/UjzzRY6NwEVu5eTtX10KxQEco7bNLCsj/6SiEV4
         +mSIq0ZRgZ1yaBH19/N3RUIS+SecNoauG77+jT8FDqUSAdRMiFbAvuv00dJrnV/aialv
         dMA6YEigiDM1sH8p+KVPWxYR6eNDbgMJhcyd/2wsl2kBIqYsa9MdGQkvBQsK45syVoFu
         tp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=mq0Uc7HLJQTGPK1YfL/mvCMypOkcYS5YyWQJy4n/Xn8=;
        b=U23l0FGg0jMoxRTuQxKgIcnqXd1vmgKdU+9hforeDM3SFLuN7VtwORbU9VDMhnSpOX
         oDwXtGAACucTS5cwfm410dq5455af/+KERiWoT1X9hK2y0lN2Bu8s1g8sf6a/SgbzfI1
         1Z9+0i/xl+58mdVirBtHPDPW1o/5N9CcaHMdRbiCEyzXtkGN09CUDHO51k1UyFT+fMvg
         K7WtDBPOCrmDCgThdMvF8Lf0hWDzQviipDLBeY/+LDkDagNPlJPZ2JyeLSbqbqaeSqFB
         1+D+0aZi5gtfG7ovvwLodgby3kmt5k8OAeUXTrvyd2O6dPhZcefBOFECI+Wq34QBkPVN
         8JfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=geH1tCWN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h3si271150qke.361.2018.05.08.07.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 May 2018 07:10:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=geH1tCWN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51437 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fG3K2-0004Eh-JQ
	for alex.bennee@linaro.org; Tue, 08 May 2018 10:10:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fG3Jk-00047s-9u
	for qemu-arm@nongnu.org; Tue, 08 May 2018 10:10:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fG3Je-0006NM-4B
	for qemu-arm@nongnu.org; Tue, 08 May 2018 10:10:12 -0400
Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231]:42343)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fG3Jd-0006N6-UJ
	for qemu-arm@nongnu.org; Tue, 08 May 2018 10:10:06 -0400
Received: by mail-ot0-x231.google.com with SMTP id l13-v6so36215324otk.9
	for <qemu-arm@nongnu.org>; Tue, 08 May 2018 07:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mq0Uc7HLJQTGPK1YfL/mvCMypOkcYS5YyWQJy4n/Xn8=;
	b=geH1tCWNUbgk7OkRcQRFwZSJGy5FQcxVZee1Oj7oUZeiIR+l10Z7FNNXSCPltDA/2G
	Ehc1io4HC0NiLaB3nZpdeXtluHiA35sdB3BwK1NKbVHp/wgxdpqHGTHcvy1DqiscigRx
	mGh49ajJEDfB2xam5jR/zHxz/nOZdlegbdrQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mq0Uc7HLJQTGPK1YfL/mvCMypOkcYS5YyWQJy4n/Xn8=;
	b=RLu6L8I2Qqbe0XVY/4xFQwgLo7F55FPUqrQqa9v10zqnMVH0K/a3AlEg1KiwaNrV1l
	/i5H+z6TTTs2V2f3GpfrZ8NJiOXKqwcqquew5krYRjQ7JsMBSXt9eg00Q6ycCMImLuBz
	qqCahSbX4rD0QwAsq+I4DIgX4a+WGJK6hItwjRasPjGYqVstJOlvdXGDtSxV55eT2ap/
	HCmWFzUurAFncUOKoPm3TuZitBNZii2Anmpkma7ToavqIhOILMgT2/XIex0i2oVa8dy7
	k8+UgpJa/CIkF2V4L0zozCe2vvaoWGxcn/TMNGc4EFnHIdk+44RfUx5DyJQuz/Y5+1//
	ddig==
X-Gm-Message-State: ALQs6tC8BrppDMgI6TKIQSyzaBH3PgZgqGDeKftw3TIcNIMRdUWOxWH+
	Au9LAxGfQJx+Z+MjLJLbBx23wFprCry2LdCQS8Rvew==
X-Received: by 2002:a9d:255b:: with SMTP id
	j27-v6mr31710513otd.316.1525788605371; 
	Tue, 08 May 2018 07:10:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Tue, 8 May 2018 07:09:44 -0700 (PDT)
In-Reply-To: <20180504224521.7801-1-richard.henderson@linaro.org>
References: <20180504183021.19318-1-richard.henderson@linaro.org>
	<20180504224521.7801-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 May 2018 15:09:44 +0100
Message-ID: <CAFEAcA8U4sy2Kt+W4gcqiTePr5Po36SFww768nDDKhrtMB2Bhg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::231
Subject: Re: [Qemu-arm] [PATCH v3 08/10] target/arm: Fill in
 disas_ldst_atomic
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
X-TUID: rBTtvyDmTbsA

On 4 May 2018 at 23:45, Richard Henderson <richard.henderson@linaro.org> wrote:
> This implements all of the v8.1-Atomics instructions except
> for compare-and-swap, which is decoded elsewhere.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Do not zero-extend X[s] via the third parameter to read_cpu_reg.

Can you just resend the full series, please? Sending a single
patch rather than the whole thing means that 'patches' complains
about "series is either incomplete or improperly threaded",
and my eyeball for updated versions to add to my to-review
queue generally skips over patches which aren't cover letters
or single-patches...

thanks
-- PMM
