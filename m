Received: by 10.25.205.13 with SMTP id d13csp64609lfg;
        Mon, 16 Jan 2017 07:06:39 -0800 (PST)
X-Received: by 10.55.43.74 with SMTP id r71mr29577253qkh.306.1484579199650;
        Mon, 16 Jan 2017 07:06:39 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b38si14409890qte.185.2017.01.16.07.06.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jan 2017 07:06:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cT8rl-0005yn-85
	for alex.bennee@linaro.org; Mon, 16 Jan 2017 10:06:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cT8mZ-0002Xk-2q
	for qemu-devel@nongnu.org; Mon, 16 Jan 2017 10:01:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cT8mY-0003k2-FE
	for qemu-devel@nongnu.org; Mon, 16 Jan 2017 10:01:15 -0500
Received: from mail-ua0-x236.google.com ([2607:f8b0:400c:c08::236]:33924)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cT8mY-0003ji-BG
	for qemu-devel@nongnu.org; Mon, 16 Jan 2017 10:01:14 -0500
Received: by mail-ua0-x236.google.com with SMTP id 35so82933634uak.1
	for <qemu-devel@nongnu.org>; Mon, 16 Jan 2017 07:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mtueghhgDEZ6FoVIgp+Ab4bzVc9WYy69M/iuGekvCAg=;
	b=SFEemF9hWtTblyjXFKGJCehmO1KKynCHA56uUbqiM9s5Lr82GMNwKptMnrKT3IdkdS
	8zlEHVE2U1tyqZq3f4lDwRUTb5cz1G41tv/P9ZUiiFS4jfWWPvbLtnjYJn8ZrX4uhtzj
	heNkOeeuqwEivnp1Hzx/iZW0tBmq7nLHsVjEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mtueghhgDEZ6FoVIgp+Ab4bzVc9WYy69M/iuGekvCAg=;
	b=QJirCIpEJEu0MAbr1AQxs1xuPMuR7/SdPtYmvMY/aO6JImW9P1Nhl1LoyOrCbVuDFz
	GjawP4CbAX9D5bi+mLq+nFrtYosAIxflXGPPtE5VnorveiC70QOxScuQW0GuNfe0gyHX
	ZLwf8QaZP6VLnYz7dVOXSVj6ye6QmnsWOPGvq6eDb91CK/RHrNZzIvrhMo0E2WRdWA95
	oIS2vVKKIG9x2WhVe3rGu3eY6yIx/ysV0yFzE3Hpcm8zqtRM2txm+kyTH7u+aYJedL+X
	ALr/zW7BmqyTb+OI1nmdxRhpAIgPCzG5NsoIcZoQITZPmlMErwaP9Fr0yRWHMFeDVLgr
	xtpw==
X-Gm-Message-State: AIkVDXLSsSAhnIQs4tnr+KNpgHp4Wwl2RGIs0OOyz9b8LzWpFMf++NpkAJsHooluU8TXWCRzapcO6FdGqx0bZYtk
X-Received: by 10.176.3.196 with SMTP id 62mr15442116uau.120.1484578873645;
	Mon, 16 Jan 2017 07:01:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Mon, 16 Jan 2017 07:00:53 -0800 (PST)
In-Reply-To: <20170105043430.3176-5-alastair@au1.ibm.com>
References: <20170105043430.3176-1-alastair@au1.ibm.com>
	<20170105043430.3176-5-alastair@au1.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2017 15:00:53 +0000
Message-ID: <CAFEAcA-M27cxOkJd8VJubAtjRwjsT0Lnt3Ybh+3Raw8eh2jdpA@mail.gmail.com>
To: "Alastair D'Silva" <alastair@au1.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::236
Subject: Re: [Qemu-devel] [PATCH v5 4/7] qtest: Fix whitespace
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D+7Sx8l3BA9A

On 5 January 2017 at 04:34, Alastair D'Silva <alastair@au1.ibm.com> wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
>
> Fix 2 cases of incorrect indentation
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  qtest.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qtest.c b/qtest.c
> index a947892..143077e 100644
> --- a/qtest.c
> +++ b/qtest.c
> @@ -309,7 +309,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>          if (!dev) {
>              qtest_send_prefix(chr);
>              qtest_send(chr, "FAIL Unknown device\n");
> -           return;
> +            return;
>          }
>
>          if (irq_intercept_dev) {
> @@ -319,7 +319,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>              } else {
>                  qtest_send(chr, "OK\n");
>              }
> -           return;
> +            return;
>          }
>
>          QLIST_FOREACH(ngl, &dev->gpios, node) {

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
