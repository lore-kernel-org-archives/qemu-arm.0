Received: by 10.103.86.15 with SMTP id k15csp1444151vsb;
        Fri, 16 Dec 2016 08:49:27 -0800 (PST)
X-Received: by 10.237.36.208 with SMTP id u16mr3504100qtc.213.1481906967861;
        Fri, 16 Dec 2016 08:49:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q35si3588954qtc.150.2016.12.16.08.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 08:49:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33176 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHvhF-00033A-8C
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 11:49:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHvh9-0002wF-Cc
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 11:49:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHvh8-0000H2-JP
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 11:49:19 -0500
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:34453)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cHvh8-0000Gm-DZ
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 11:49:18 -0500
Received: by mail-ua0-x230.google.com with SMTP id 51so43518588uai.1
	for <qemu-arm@nongnu.org>; Fri, 16 Dec 2016 08:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xTr73S13Ys/7CSyu7igsif3/UtrpNgqzcv63sOyHLcM=;
	b=YwPXu4kRiWHtesHJvMFDzqPkfklxkAlaZLhkdm92kD4+KpDsfnPiMzuKz7FCCDF0S/
	QBP9hlkOTKO6Uq/T3ZMg4/l/N4Hxc/N/Hm7q8wBwx5U8EEqDz9qVrY8BJajTZMRowXGy
	+XpimaGdjO1rPwupGWmuP4DG7mgu4dQ3gzgU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xTr73S13Ys/7CSyu7igsif3/UtrpNgqzcv63sOyHLcM=;
	b=RuelsqygYSaBBK2MwAyOYtjk86BF85vexgovi1RgoXy1YC8I1GCme79pXUgO35/SLS
	ex3XuAVXYaWv9AlLuVIASiIy3J3kbeR67t3iCrmyy+0ds/d2ZqQM/hXtscd8of2WYQPQ
	mZVF4kDkNY/0G8VkBKurps3ka7RubirLloXJ2OkZxhCBZj0ph90NDHBaZvWfE5ZTZrLE
	DXOoR7vGn3wMzeSx5aYaDVqOTMofuXoCgGqsr3MpLcAaErqrihh04ObCVvHQizfmMVOo
	YOAEZX0qX/NR7PnkEZuki/GJS5VlD35QwRn629EtlwNSqRx50Q+jflLcIEYQxjaD0b05
	/ldA==
X-Gm-Message-State: AKaTC00kg+6gRf0XHWgmu/u3UCBMUOVZ9V0J6DyMj9/hUuhdhSYcHEoaE7a7RiJk+dT8KH1msXsrtG9JUtL4xZoc
X-Received: by 10.159.48.215 with SMTP id k23mr3340065uab.42.1481906957674;
	Fri, 16 Dec 2016 08:49:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 16 Dec 2016 08:48:57 -0800 (PST)
In-Reply-To: <1480441323-31417-1-git-send-email-clg@kaod.org>
References: <1480441323-31417-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2016 16:48:57 +0000
Message-ID: <CAFEAcA9SVh-pUS+mnPWBYgWR9is49ysh9O_y35K-x2iyDwhfNg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-arm] [RFC PATCH 0/4] FTGMAC100 model for the Aspeed SoCs
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
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Dmitry Fleytman <dmitry@daynix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TcSSshfsRf1d

On 29 November 2016 at 17:41, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The Aspeed SoCs AST2400 and AST2500 have two FTGMAC100 ethernet
> controllers. This serie proposes a model for this device and a way to
> customize the bit definitions which are slightly different from the
> Faraday definitions.
>
> The last patch adds a fake NC-SI (Network Controller Sideband
> Interface) backend to pretend a NIC is being managed.

Could you explain in a bit more detail why the patchset is
marked "RFC" and what parts you want comments on? (An RFC
patchset that doesn't say this kind of thing in the cover letter
is dangerously close to being a "please ignore me" request :-))

thanks
-- PMM
