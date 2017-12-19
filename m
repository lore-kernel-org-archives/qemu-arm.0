Received: by 10.223.159.74 with SMTP id f10csp3317921wrg;
        Mon, 18 Dec 2017 17:19:24 -0800 (PST)
X-Google-Smtp-Source: ACJfBot1s5Z9HLHx0ihWrLoZhBLCEVpfiZNQnoAEn2SOIO+iV4m7dU7viPQcOs2ESDw+pJeivkzl
X-Received: by 10.13.232.17 with SMTP id r17mr1289262ywe.396.1513646364524;
        Mon, 18 Dec 2017 17:19:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513646364; cv=none;
        d=google.com; s=arc-20160816;
        b=Z/BlBhNMoVIJVQLwTlbP+uHeqjrNSetXYCRJvebeEIvuO8IF6KU7yDtQ8M5YMWKauc
         4tHlJ7vERVxaBzA9MntudayPGUECWh6mrZUlQ+hX7kqfFHIE623TvztnE/pftXdRQFR7
         PgUOA2bJGHBWAL/5UryCzPeFfIH/GMxtTYUiXh/dUCH5nA3O+NpmvBMzCLTSfHGq5PQ/
         jCEh16pyuwDhIwRRGrGLEwRRI7PB/MSo1Ub7+q17SDeTKJUpDmZIYJnHI+4ywPcsjO5Q
         9AvPMdSABrZERM1CH1IkT3MEPtKxRLSTDnuROStj7+UO2zmka9VPsxRoJ88MDYYiffAv
         VIug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=ftZb6wjjxBefWYr1WDrSujS8sOa0u7IxIzK7MTuJ8SQ=;
        b=fhY0jhmNObciAo+QKInV3Vhx78cTh4JPY9lVGD4XR9HoLeQRTBPiGQSnCt0vYHeuJ8
         otiepKXUPfJ3UGT77bJRTcProB9k0sCYLNaHgOze+y0RxlW0NR/BH6Nk+wLVcThqIEBq
         lqxbsQyn0orw8k83HN6fjs6Jx7vhZizzDwse4l3+KG+aRqNZeligZhYftnAGEyNxmW5F
         LU2EUQMTf9GVdjBrgNo1g6qnHhT6+eMlIcm8nqoO1DZ7x2hQyiV22/1DSzWrEPrEmiPR
         NqsoUAjLsoXRxL5/Gfm0iQPEpeEAWnqq1Fq3Ken9EUGsJUssiuPxbno6TZqmOa/9YCMD
         /buA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MyKruNgx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u4si2657911ybb.2.2017.12.18.17.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 17:19:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MyKruNgx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR6Z2-0001N3-0E
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 20:19:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eR6YK-0000v4-W3
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 20:18:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eR6YK-0001US-7k
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 20:18:40 -0500
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:40482)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eR6YG-0001Sc-BJ; Mon, 18 Dec 2017 20:18:36 -0500
Received: by mail-wr0-x241.google.com with SMTP id q9so16258657wre.7;
	Mon, 18 Dec 2017 17:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=ftZb6wjjxBefWYr1WDrSujS8sOa0u7IxIzK7MTuJ8SQ=;
	b=MyKruNgxsvB36/QHnigWlb11phXnETPWjSx1Z12KCqIe/Ma4JPuuXr7voPN06qAKkN
	Y+nBfRP3D8zUnNfU6dov/ZQcC7K4BZ8/EDxfa/Wxu1GRvC9ZfPru9nAxyorTAaOefDIS
	3fJ6WSYVO+WbtEQwzeVkT8RAvjNMK2BOaBQ2hu0imXZiEQMIyqz8kILTGrktvEqzM6Hm
	1MTCMq7Kl1JKGBQE//FjU8AFa7mxsUx/Tva7yiAmWKficZ/+BfQpLQU4NWCLoCHe4Fli
	/ZTqBhVGhniZP0UcBSmVHQsrjb8RmE/iEG5gj6DCEyzkbTgf2MNJwKBHLunTxRThOaNv
	P9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=ftZb6wjjxBefWYr1WDrSujS8sOa0u7IxIzK7MTuJ8SQ=;
	b=KvLRauYPveUN96ca8/guJkM+CF1C9qaKEAKTf+hzNChgx/KxlwcRr9xxK1Azgy6q0V
	GCVCCdn6OP2g9jKSe681dzAWWMa5jxtVZyBgHPtolGktm4ZXE4h5VJgTGOcwQ31I9UIJ
	sl2FGwEL9f+t2NJjRiA4WT+s0cSBjBNLZsbxe7f9l2RDJHd8dZft7bPNnkUHtNvkvE+d
	VXM25bFRvIInZFnTgeSJtfmG9UbLJaNHkQT1Uoe888oxrZCS5Ui3CxBvSVJKWFMnFbSa
	AjvI55+c1tUskgiKeYhAAfYFnaUAKSjJBjPwzKGJUXu519Slfidg6oxGwH0hxjG0tl9g
	8gpg==
X-Gm-Message-State: AKGB3mJunQdn8o5KP2NZ8pI70jdxiSdnEHuRcTjuvCCeCI+v9dCBPCAG
	EQluZYJxBUhF2HFdQf5Tn3MqxuuL1jLybLeBlXQ=
X-Received: by 10.223.161.158 with SMTP id u30mr2456801wru.96.1513646315425;
	Mon, 18 Dec 2017 17:18:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Mon, 18 Dec 2017 17:18:04 -0800 (PST)
In-Reply-To: <20171215031547.31006-14-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
	<20171215031547.31006-14-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 18 Dec 2017 17:18:04 -0800
X-Google-Sender-Auth: DtJZ-8wmaoVvmi7KKwI7-doMN30
Message-ID: <CAKmqyKOSHhEsgA_a5SE2Q2NwJO2UCxYJ=HRT=FMKBNhiH5AN8w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 13/20] sdhci: Implement write
 method of ACMD12ERRSTS register
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JfEG5VsHpzHB

On Thu, Dec 14, 2017 at 7:15 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> From: Andrey Smirnov <andrew.smirnov@gmail.com>
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/sd/sdhci.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 9c1b28d9dd..64a9b26e0d 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1124,6 +1124,9 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t v=
al, unsigned size)
>      case SDHC_ADMASYSADDR + 4:
>          s->admasysaddr =3D deposit64(s->admasysaddr, 32, 32, value);
>          break;
> +    case SDHC_ACMD12ERRSTS:
> +        MASKED_WRITE(s->acmd12errsts, mask, value);
> +        break;
>      case SDHC_FEAER:
>          s->acmd12errsts |=3D value;
>          s->errintsts |=3D (value >> 16) & s->errintstsen;
> --
> 2.15.1
>
>
