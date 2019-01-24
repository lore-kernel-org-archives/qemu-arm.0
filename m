Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2337131wrt;
        Thu, 24 Jan 2019 12:06:40 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7McXf4r020WpqWp7Jlwlv54oLKRmq2XAuej6H5BzTCROtskKkq5GUKJqyImIChdoVA0RGD
X-Received: by 2002:a1c:4c0c:: with SMTP id z12mr3844615wmf.17.1548360400200;
        Thu, 24 Jan 2019 12:06:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548360400; cv=none;
        d=google.com; s=arc-20160816;
        b=SyfjL0ZtgNzWC0qnSRYli+ewZjxQK4+LSXxbEzihv3rZHT6TXiDQtbrBAUi4hjar03
         xVEzITuwu6VV626duolIC3aNq+K/ss5e1kmcqE1qatvwhedc2YLaeAHGdWBKkQ9E9s5V
         zHkvY1dImQVvYazLn0/y3hWu3/KUu6WfsZ8Pxba82MW8U2sal5xfT3R8J7ySGd46DJZi
         itBKT6RXZwDhbBsdualq2bDXqNQMd8lzysS1IUY+XXpW7nXNoZZ8KMRRbCdg6RBvge/t
         xhTJ6ll4gYc6VhWUtdYRN6JhjtZtkRG2rpm+WlIPILTd8pgGNm35ohTROfk7OkMNIfHI
         vcVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=DVg6ZIPCqvBkjYqh1mS1wc+pY7/yP5fj5HkRc1fv5V4=;
        b=Wb3benaLN+nTgJLc94Uyd22gpdH0o7M0TqUBWTUF5Q28yW836OHCnO6GHYLgIe/R10
         J/hQxtVR/kyCK5GDUjgQrrBlORxIH1Dx9+UMDxwaV9IUWGOSzVqIo6udVNMICqLSRTRE
         1HrG/L6AzQG1BgU3TMrYeInifGom3nxY8XeKyT3FC3Gf4x59lb3tO3XmV0ZRHL/pd0p7
         +KkcTzcAM18zrNCpz9TYFldygHq5G9HxCBkzVpHpKQdVdJoRv+gwgYRS7J05ar7YEQf7
         w3fRHl3U4TgOabbmpZ74OD0NTMAepzr0rcZweQNnwpVFT/jG9QSHh0UtZfi0i9iYQP1Y
         QKfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=SR2W1WoQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n25si79149919wra.167.2019.01.24.12.06.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 12:06:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=SR2W1WoQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:60261 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmlGp-0003Wd-BM
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 15:06:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1gmlGJ-0003WG-00
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 15:06:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1gmlGF-0005pX-O4
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 15:06:06 -0500
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:36213)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1gmlG9-0005jA-1W; Thu, 24 Jan 2019 15:05:57 -0500
Received: by mail-qt1-x844.google.com with SMTP id t13so8184797qtn.3;
	Thu, 24 Jan 2019 12:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DVg6ZIPCqvBkjYqh1mS1wc+pY7/yP5fj5HkRc1fv5V4=;
	b=SR2W1WoQnLtkdcyZvvPili93OrdbKNiUmWTxYm7GvNBX6X5rblYo0/FaZSgDSGU+Bt
	k5nj8w47YhuF9K7r3zheUercqY7KayT2ML+c4gwll/QyTa18yfbRiBciGixxUGCifTq4
	HQlT9he7gttSLgbaGLAfm4BPspFS+7T4DR5fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DVg6ZIPCqvBkjYqh1mS1wc+pY7/yP5fj5HkRc1fv5V4=;
	b=kefE/18AYzTo9lteA4cBkegRgOLPxZv3oF9CWZxLQuo6+jmHkzXRfxuEKzHM8VqnS5
	tgnK0JkYXS8LFEcCHIpiN/HmItYXTVMI+EPjaKaHvOLi+7ruBEEzxL2Ghdi1nlA/1Hr9
	X2Q/TQAIyg/DDBrJpDYx2FBGXMr5EbydCnE2rRWZ+DZpqhDKXKQ1qy+hgTHzEVEoV4N7
	GaZqwBNNAy/pqCu/A8Gk0sAPMKdUJNUAYc4Tlx+sG0Yg5/Jw6vbWJBZ/0UB60rISTlrZ
	n5Vyak2VE2GHZisj6sZgKnGrv9l5jc9/gbpdrqrMkKTNLoKXEbbG+54SP3+B5RfVGizM
	2zrw==
X-Gm-Message-State: AJcUuketcy7yH+4d1aZRqZkahXBrJO3gy4mHwsn9ovg5A91LzwMCA7PK
	ZUdiCCA6g0qGmlwr49uyvx9zdzBbxtWfYT7Utgc=
X-Received: by 2002:ac8:748:: with SMTP id k8mr8182340qth.235.1548360353029;
	Thu, 24 Jan 2019 12:05:53 -0800 (PST)
MIME-Version: 1.0
References: <20190124140519.13838-1-clg@kaod.org>
	<20190124140519.13838-2-clg@kaod.org>
In-Reply-To: <20190124140519.13838-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 25 Jan 2019 07:05:40 +1100
Message-ID: <CACPK8Xdu=DNJQNjTskzJfq7NXnmSvfR-3mBk2O=6o=TKfr9pvA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::844
Subject: Re: [Qemu-devel] [PATCH 1/4] aspeed/smc: fix default read value
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4P5yzNqMCK/c

On Fri, 25 Jan 2019 at 01:08, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> 0xFFFFFFFF should be returned for non implemented registers.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
