Received: by 10.28.71.27 with SMTP id u27csp4845625wma;
        Tue, 27 Feb 2018 05:53:27 -0800 (PST)
X-Google-Smtp-Source: AG47ELs2fE3zAXeBgVwHgn481a81sFXEwRSEaqD1Vnc8KEguN5+PH8c8/jrfY4xy2n7rUSyx5owT
X-Received: by 2002:a25:c514:: with SMTP id v20-v6mr9059963ybe.405.1519739607775;
        Tue, 27 Feb 2018 05:53:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519739607; cv=none;
        d=google.com; s=arc-20160816;
        b=ZGzw8JUoAR+6o1f1ZnMsmdmF7cike93xX8Dakrk/X1EWMQeJg7lfrY/CRoBATskDnx
         7C2jejbCsXPHOfhEXPDSN8lXrdQ8C41LE4L/FoLRrXrBt8q87rtnRCUGBlJU4yWpMCK5
         XAf3/kLHiSOOlTKqpYw6pEZo+oSHwIJ8H19je1GUmd8Hf9rBvc0xMbU6Kig+3ebaOsKQ
         TRjhpxKVLQTdlTcdpUtdkRBQ44ABPZHEYZw1WwlqGo6KyRwv10ffaIcwEPs7Du9//VyZ
         HyrGZPBTblescl1nLYxI0MgHtE2HZ2DthVhBw6NI0A7TxrycgccLXvR2sFjOaGGxtL//
         Vr1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=qc0Pv6ZENfZ5BmcEZRRxYcwfkXfXrBUK9RL8g6Ro+fA=;
        b=qCWzyxeiwYDzUYxqmcm/coYlNqPeQ+GYDZvvXLGHRguBMxhZ9Ux+o8U1NO9PpwH1Vr
         VZ2kSrwdJ2jjzq+qn/CsbizS/oe+DVj+VKNipCvjqNDTs0WfAn7ByjpYHF5nf82SVCRX
         NVUo+bzXejTx7k7dwv2e+kFiKSrDF23ykj+rIDBDHC5oWxYfX3u9uM1ZJi4Z3MGXBpsf
         jFNSVta9z/DvaznpIKDFiIvHChw2bSbaX70GsmMqdTHVXuJNVeM8eX7Sx8la3wgyb2Lh
         RFU3ecDLjePE537tiHfW7dD9+xt/ghnloCPf6+v06r2mBBIIh/2ZP1hHn5XIKPP3Lwsd
         PMdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bX2xBfHW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c79si1896179ywb.394.2018.02.27.05.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 05:53:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bX2xBfHW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37289 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqfh9-0006LC-8L
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 08:53:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqffV-0005GA-Sk
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 08:51:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqffV-0004RK-75
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 08:51:45 -0500
Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234]:40217)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqffV-0004Qd-2L
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 08:51:45 -0500
Received: by mail-oi0-x234.google.com with SMTP id c12so12895453oic.7
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 05:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qc0Pv6ZENfZ5BmcEZRRxYcwfkXfXrBUK9RL8g6Ro+fA=;
	b=bX2xBfHWqcmH9B4d0We3D438o3KERoqlJpSEsxH2/cjAP5oevP85ThD7RaJJy1V+Bf
	ANVi6O8iVb/Oz6mxfyLy7l9uTJAdT4FIy9fWnL0pZmLk8fPakFE4OZIYtz/c0znr5jum
	ztY8o5tJF2F6F4VWPF9VAgfIh66O7k8WWoQFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qc0Pv6ZENfZ5BmcEZRRxYcwfkXfXrBUK9RL8g6Ro+fA=;
	b=mE4fGzTyJHikFvFajhJhpAee6FLkk4SegoApEzL1gColYKNy+mqPFio82Zk/+6Tf0s
	k3xXLPbUnAQcpN3Xg6sHU0O3tAcoE7S4O0EzaJSTFV6cMjkXl76mphLS5jk1YMIPrBjw
	kWMx7sm5z3sCMQcCw25Xz5Uf/wxdszT8KjIQr7Czs0ybWu0epZlFfORYkrYFBXx9xkxm
	GbAOuxpp9VpjhDHYfX9xsSuiQK5qoDQ4EvicMHkkGE4307q8n3YlbKKgowQp/XtqnKbu
	arszhNkA0yCPDIBLGzimPYnGToI58rL4ltDx++/A6g5pQ2zIFB2DhfFnAqBJzsgBHHuX
	kF6Q==
X-Gm-Message-State: APf1xPAhBtMp1GWG+fA5AwAQO3pKf3S1CxYl2i1VFR1DWeLc+uBAWgyk
	32aNa6QkKuwXth99x5KkaytLFQ06xf3HRZMZzkR64qyr
X-Received: by 10.202.17.13 with SMTP id 13mr8562595oir.164.1519739504405;
	Tue, 27 Feb 2018 05:51:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 05:51:24 -0800 (PST)
In-Reply-To: <20180217182323.25885-48-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-48-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 13:51:24 +0000
Message-ID: <CAFEAcA8bW2W7acrwtS632ongJb0Ly1mcneNqn4XS+cj_n3=MyA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::234
Subject: Re: [Qemu-devel] [PATCH v2 47/67] target/arm: Implement SVE integer
 convert to floating-point
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
X-TUID: HCQOJm1i9Ks5

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> +/*
> + *** SVE Floating Point Unary Operations Prediated Group
> + */

Just noticed the typo: should be "Predicated".

thanks
-- PMM
