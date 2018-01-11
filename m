Received: by 10.28.173.206 with SMTP id w197csp874757wme;
        Thu, 11 Jan 2018 10:49:49 -0800 (PST)
X-Google-Smtp-Source: ACJfBou+2G2SepOEfxRYZ4ZTCJuTr3pNporSX1xLM7gvHA1rDqLiTpuxcZ7A5wdfZKmyZobYMg7+
X-Received: by 10.129.105.68 with SMTP id e65mr13003496ywc.375.1515696589021;
        Thu, 11 Jan 2018 10:49:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515696589; cv=none;
        d=google.com; s=arc-20160816;
        b=yJqxGJi7rku0p6fc5dHleQYWNW8pmLzbR0Hr8riolMjXg/O7kMUqZPsRB5dzN01ZEW
         HF+89lI9V6BYan7OLSBj/Lz9Ga01OaUwhjc5sIKEv04DvrrHkjU8L6Guo2J3fAGjQzKP
         E7YWSpTxhZ3D9xlwCjGLsXOtZiKkdKSvtfVdBmjXKb9d42HQKhCtrMuyxCfVdiTpDd/W
         nRwomV+VS9U58n4OGbLF45fIkGUOUHOp7G5RpCbVBwY7D7HmHsLJ8ScT1R1mahs3Hqss
         etHWUqcT0LKncFKSBPAivfoXB+Ecl9NN+xA3o1i1mZaXT0oLkk3srARwcp9pDlAJj4a4
         QJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=sV21TY3j9syqmvRQGefKONdFRRV1jeaBw1eoOrj3LGg=;
        b=E8+0xUU6vnc6o0jFXFTbo/Jjds8Qs17I5dkgsh/QdCJ3Rg6XDZtPLX1Sq5niLx66kU
         e1g+bBbe4psqA5RnM6xgPqdxm+nl/ad9sKioVv1Fk5WO1DJa6Iya72KZ178sODbdUK0c
         vUYH0lGtsEsyNoITvfgPfecse59vFOOtY3KE7ejBf6Dk+ps8S0/wS4Z9i2hPXmjcPPni
         uY0nICTG5FVZvYKhMbfw0oL04IooW8xsU9lNMRpzkuitaSEwDQaRvxaJVlqdmpa7GiP6
         l2sXy4aWr0KQtyeNSRBcD+TIkxqUjE3LDVF3f0eRjZgrUZXWOqIS4Z6+EQmozAWk0Kaj
         kwSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iX42txHp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k134si3202793ybf.507.2018.01.11.10.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 10:49:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iX42txHp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZhvA-0008Rg-CR
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 13:49:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhsI-0006Ra-A6
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 13:46:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhsH-0007qi-H2
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 13:46:50 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:44011)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZhsH-0007qL-DI
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 13:46:49 -0500
Received: by mail-ot0-x243.google.com with SMTP id t28so2947417oti.10
	for <qemu-devel@nongnu.org>; Thu, 11 Jan 2018 10:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sV21TY3j9syqmvRQGefKONdFRRV1jeaBw1eoOrj3LGg=;
	b=iX42txHpSgmC+D9iLwL+O9hYe3Wt++6eo0f882s1q8xOvAgk6gkW4FWEui0MTH9Hq/
	KPrKrTnjL+w9xfkjHngR5m580tqHWkYLF1hELdjv5c+l0q3RpmVAFS7p+NwVSu+LJzc1
	jOUreyA9M98wyQj75WKM7phk3Ob1FZxDRplik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sV21TY3j9syqmvRQGefKONdFRRV1jeaBw1eoOrj3LGg=;
	b=pmsqmQZId5N/lAS1mJ2nU3G/TTFsePCX0ljnpxCNOkdQwcHuArM0mrXHvLGOatvJtA
	VYQ6CALL8ZpZMDuNmBHIOoyA/tbkdqliZJ32lw5nOokvDvh5TKmZO9/J3R1iQGlTV+dm
	JqIXrmS0tXWM87sH8UYvktGNMmcy98bxjgm3OA5It657j1vF+zjvS3Zntku04xKDU3Un
	2/9pdW3PNEg4CUSFUb5x67RNtOC0L0LcvytpL6d3BTzbW8taekqGnF8K1B0ZoJJfD5Rj
	CW+Nch4WVGYi42LcbLw/qc0Z8KVCLBy7aFVs7seXu2SoBZjQ7M/DwX73oq99XCB1mCRz
	VOKQ==
X-Gm-Message-State: AKwxyteeyLQ3XykUKY2zpe1HfwY3itsMNhv6D3ikGhnIaimpzC/52oYx
	k5f3mNUW+94/E3dX/y+ihdqGe36GV0WSiELW8sE+Yg==
X-Received: by 10.157.2.175 with SMTP id 44mr12187142otl.335.1515696408765;
	Thu, 11 Jan 2018 10:46:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Thu, 11 Jan 2018 10:46:28 -0800 (PST)
In-Reply-To: <20171218173022.18418-5-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jan 2018 18:46:28 +0000
Message-ID: <CAFEAcA-qMT4Yf0eUsOOgGpNOtAnSdWU6+vMt9SxTPpyQxhUMuQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-devel] [PATCH 4/9] target/arm: Use pointers in neon tbl
 helper
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
X-TUID: xd4QljMB2+DN

On 18 December 2017 at 17:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Rather than passing a regno to the helper, pass pointers to the
> vector register directly.  This eliminates the need to pass in
> the environment pointer and reduces the number of places that
> directly access env->vfp.regs[].
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h    |  2 +-
>  target/arm/op_helper.c | 17 +++++++----------
>  target/arm/translate.c |  8 ++++----
>  3 files changed, 12 insertions(+), 15 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
