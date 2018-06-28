Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7259206wrq;
        Thu, 28 Jun 2018 03:40:12 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf2ktgM7T4ZPlT+zz9LiMQzalFkDSPbu3pDHRDkfMXNg8xnQUVWZtO8vVBzPFxFAIvnpLud
X-Received: by 2002:a0c:ae63:: with SMTP id z32-v6mr8539351qvc.108.1530182412483;
        Thu, 28 Jun 2018 03:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530182412; cv=none;
        d=google.com; s=arc-20160816;
        b=lf2lQ5cfjfi7uNBdHxCIhFZFoeEtwusVKlsOVxwXPxELIN4OkH7bRBwnpwbJDJ1MbG
         i1g++bsfRjwMq+XvjJv+qqD1rIrdR83nc/AaodtpxifZnx5diva+5nC+PDr3WPFOAOiD
         FLvtgjZqho8msjB3jTTf5tDmexm3xdmylhyICOptZFQv7Jeo6Gq1ldmjQLZx7as0flpx
         67tGC4Ph8tjlQFVA0ZCicbpqEY26j8S2dfhYR30nvBbMZNiaqMhDpUlgoXey9RTsgWE+
         ZL8MyXzCFHaaDnA4hn/QEmtZ7DICQdGat20Rl3lFScQLynkB34XPRkW2ZalyS0MTEpMF
         dsqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Y9ny1OHRd9DbAnNXueodw0k42aAa4aoS5sAOYP5GVRY=;
        b=O/+7fgV7BQKbdJPRxEc4onuIWmCJ4K9ySr6K4g2uzwc0cqD/QlCqmCARcLGNhS7fs7
         fwfBheh5ZOjVzsDNai439X/+2VX6vLYXGX0ERXTPRAbd+9Yni6kRgtlA2RBcLql1h/uk
         Ks4zlQEANO6GPy5+lEQFd5IExV2JYXwKZj57MRTBBCikO3b+Jnp307UJ4rOPjKp+2Mte
         U7Z+4rBjV4wr16HOT9j/86cQbQGbhONVzVm0qiZUpVCgI714GjW/OikS+Zo7SJaZxsjl
         APopehRbU2sPkUsq/1S292Jj8hhJ1i1Ou/csnbuO45Xip8mNdiDS6HpFwEj29J9KYFR2
         oRbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jjm0ZQmV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f63-v6si3543503qkd.330.2018.06.28.03.40.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 03:40:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jjm0ZQmV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYULS-00021C-Bb
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 06:40:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYUJb-0001Ee-Th
	for qemu-devel@nongnu.org; Thu, 28 Jun 2018 06:38:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYUJb-0000gW-2w
	for qemu-devel@nongnu.org; Thu, 28 Jun 2018 06:38:15 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:36126)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYUJa-0000em-SE
	for qemu-devel@nongnu.org; Thu, 28 Jun 2018 06:38:14 -0400
Received: by mail-oi0-x241.google.com with SMTP id r16-v6so4206142oie.3
	for <qemu-devel@nongnu.org>; Thu, 28 Jun 2018 03:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y9ny1OHRd9DbAnNXueodw0k42aAa4aoS5sAOYP5GVRY=;
	b=Jjm0ZQmVqjklU5slfcQTmFGIJlXIBjEXusCC0KhRgJy2LJUooiVyqScOWg0Ot2x0Xn
	aW8TAs/CRAdil03Uc6IZtCp9OE2YH74Ud84YL0LIWLHyVeQxYrKO0a89LBvvrqV6z1PN
	oDpYGYNvAo2Kl8i6KGW2P+VtNNwmYR9pu/Cks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y9ny1OHRd9DbAnNXueodw0k42aAa4aoS5sAOYP5GVRY=;
	b=De7GueO/pBXxdUhc0l7Ef/NoY7L7zzXN/DUxlcRb9WSZJQxA9dsMqE5CJTESKRBi+q
	f432nDfRkb1GTleM6h7dWx4+j8nt59A7rEWiX1KctGLrxCP8+Ks8Tsihah7rYqMVB1BB
	5V7A2X46SsAms9YCEnWSLr5f9yOkn41ZU8LwNrpP8USgUwL5SD+ow2BedXaZSXYOBDIv
	sgOGO3g12nZzfdjyymxO8x3RDffJU4yjyYSnhw1loBPHVetwCaCOuZfucnhcNIZIvp0T
	fG0C6vIxcvzUAeWJVg8sGLYDll/C1ax1KNGzoZcls+/8AIXOQan7BYpB7rs+lGqmmVY+
	ttGg==
X-Gm-Message-State: APt69E37PsRpf2f+0ayb0RgJl2ohiS+WAcdhXw3wG+YEBJjpavkVbf+t
	j27FB5KQXf+WRQ3RlqkDo3CVsqg9MtHfs6K6HG0A7g==
X-Received: by 2002:aca:a846:: with SMTP id
	r67-v6mr5539566oie.12.1530182294049; 
	Thu, 28 Jun 2018 03:38:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 03:37:53 -0700 (PDT)
In-Reply-To: <20180627043328.11531-14-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
	<20180627043328.11531-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 11:37:53 +0100
Message-ID: <CAFEAcA8Yfarg8juu_MJmDruYmsCsb6Y8fAxFS-wtw6dcDypteA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH v6 13/35] target/arm: Implement SVE gather
 loads
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
X-TUID: ShXBcT1FGVL2

On 27 June 2018 at 05:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> ---
> v6:
>   * Finish esz == msz && u==1 decode in sve.decode.
>   * Remove duplicate decode in trans_ST1_zprz.
>   * Add xs=2 comment.
>   * Reformat tables to leave room for ff helpers.
> ---
>  target/arm/helper-sve.h    |  67 +++++++++++++++++++++++++
>  target/arm/sve_helper.c    |  77 ++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 100 +++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  57 +++++++++++++++++++++
>  4 files changed, 301 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
