Received: by 10.223.159.82 with SMTP id f18csp653970wrg;
        Wed, 22 Nov 2017 13:08:20 -0800 (PST)
X-Google-Smtp-Source: AGs4zMa0MJTpAh34qo6yId5KUYazIivNOgDR6dJfer/PtDe0uwSaT/pZeGGZ1jFPoXI9lxc9+Ma+
X-Received: by 10.37.11.133 with SMTP id 127mr13351296ybl.226.1511384900725;
        Wed, 22 Nov 2017 13:08:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511384900; cv=none;
        d=google.com; s=arc-20160816;
        b=we5qhqUxfo2fQIAX5fwGNz7O6xNf7fzcScCWcJMWvgcQv6mwJog68FtRhSAu27Lr0I
         FXQKSYqRsffKdN7A6UoKI88hACsnnEnfbAE7R+fCkBaXlggs9puCdKuywbz18Vm1frnX
         NuZ+wSosjLYID9HUeUB1GU9VKz3+1bs6ko3bVViO0gdmASd2348hIEy5M1JhzupZe0XZ
         axEey9n6x2lTZ0uuGaH0ts5ZOCqaeyF+ffwsZLI2X5RNF+8JkuJS530seYgUdHSYFBLK
         zLBa7vI26cjSO21+cB1JaUxZ/+FbBjDEgFccWbOf0cHSoLmPM0VhOgRPOr4hFdmS58v+
         St9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=2rZe494DcfMZ4WFY7dG3yjlwQsWo5HyWwTYAjSua5js=;
        b=v/IbbPX9hYHcmne2oVLy1pIruxJVUhYJBcS2g4n5Mvkmp84mzPlzcQNwWdv9z+dgsK
         oKVQDg5ag3mH6oQ7NHpmg6z8W961ONXb1OCx6tkpEgFruoPDtmgWya7LkNjIUtkMdSvo
         cLd0XAM07ya5kkQ90zIvPp4bkSiQkUqFKy+MN+ff3E2RcZ32ZMm3SdcdT+oBbN3TO0Ug
         JigHvcQ72JLZ3USbYlMQVBK2iC170QMNED7CE0hcI63Git11NnMshUxTnoUSE9639IoI
         5fjEYemf6H3ijfIz8pA2fjAZHrlZepJn5b+t5dVdnVUORAwJOkHopLmAS/zC1LyursDM
         6Vug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LspBkCsI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v124si987670ywf.39.2017.11.22.13.08.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Nov 2017 13:08:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LspBkCsI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHcFo-0007GJ-3e
	for alex.bennee@linaro.org; Wed, 22 Nov 2017 16:08:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHcFZ-0007EJ-Gl
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 16:08:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHcFY-0005gn-Lf
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 16:08:05 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:39985)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eHcFY-0005gg-Gt; Wed, 22 Nov 2017 16:08:04 -0500
Received: by mail-qt0-x244.google.com with SMTP id u42so25506276qte.7;
	Wed, 22 Nov 2017 13:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2rZe494DcfMZ4WFY7dG3yjlwQsWo5HyWwTYAjSua5js=;
	b=LspBkCsI1vNc8tuHbOzirJUhpa8fHyU89CzVwTJKCMYhbDoAhDPF/fp9vFQBjGCoGI
	mBnBhnbfFeKjYkLWxnugGizakiLzARP7fbbhdgA6kAIJzGPykYFHoTvhxSsMOvpcrSnT
	32Pa3waUMcxJE2IEjiHoAmcqANAtd2hIANEnaGmlGR2ujx97GWgFoQi/7IjqsOiHKAvm
	j9VIAJVGa1WeqC4WUqOfXhMplkusznCUiIGcSHYGJtdcE2VkSMA5X6KFXN4+2Q1ICbka
	nQVfdzHqasphWjGwyjPf9CRcAkBtnUqOt6NoVCylZSmoBYN+NqDR74H81K3R9gnioMc2
	l5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2rZe494DcfMZ4WFY7dG3yjlwQsWo5HyWwTYAjSua5js=;
	b=J1P1x8cpQKKCuRo4hn4Y7A6SfLlRbgezUieRCdtwdbKg08MvtvOmJxMCOcq+qLs03I
	If8Td+R6MgnUYunvL6k2tAPAHrMlMfuVUP7Cnqly5lB6tA1IhNWZZhChKgnSOwyrfR2g
	fpic0bS1qbPWT6zHY7sjPE44EqujQLfhHaIWiNy7/cr9XWgfv0Dg/Y5ZJOnsjN+/67BJ
	+w8QdWr1rTXsfoBOHX9k1Y68ds94JSEwBOI3lRDbg/Uu/6G/g+I8X7H26k+CQgOsjcOZ
	dpcaX0d6ZBE5rGPswZCaeCoaUwWXD9aKZGLpUAQQPQj/pzBOTzIXzeUzUbhHNpHM211p
	x45w==
X-Gm-Message-State: AJaThX7M7PiPaO2W0QyQecJB3yesUGLA0kX1HZ1y3nQFlg51Km43TbB1
	S9Auh3oDkmIasVFAUVocTLLBZf6DqEMrxjoly0g=
X-Received: by 10.200.54.176 with SMTP id a45mr33437876qtc.176.1511384883882; 
	Wed, 22 Nov 2017 13:08:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Wed, 22 Nov 2017 13:08:03 -0800 (PST)
In-Reply-To: <CAFEAcA_Ug=6cYD0VD93CorVt+rv_u4WWsa_Gk3k+c18G07bDRg@mail.gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-20-andrew.smirnov@gmail.com>
	<CAFEAcA_Ug=6cYD0VD93CorVt+rv_u4WWsa_Gk3k+c18G07bDRg@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 22 Nov 2017 13:08:03 -0800
Message-ID: <CAHQ1cqGxtN=hK51v+Gtq7wngp_HKxXJv4tdRin+bKYeEKv1NKw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH v3 19/30] i.MX: Add code to emulate SDMA IP
 block
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /m41PPGwC5Sm

On Tue, Nov 21, 2017 at 10:20 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 6 November 2017 at 15:48, Andrey Smirnov <andrew.smirnov@gmail.com> wr=
ote:
>> Add minimal code needed to allow upstream Linux guest to boot.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/dma/Makefile.objs      |  1 +
>>  hw/dma/imx_sdma.c         | 99 ++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  include/hw/dma/imx_sdma.h | 22 +++++++++++
>>  3 files changed, 122 insertions(+)
>>  create mode 100644 hw/dma/imx_sdma.c
>>  create mode 100644 include/hw/dma/imx_sdma.h
>>
>
> Does Linux really insist on reads-as-written behaviour?
> (ie can you get away with just using
> create_unimplemented_device() ?)
>

Not sure. I'll give it a try for v4.

Thanks,
Andrey Smirnov
