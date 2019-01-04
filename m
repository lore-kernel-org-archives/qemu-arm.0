Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp710530wrt;
        Fri, 4 Jan 2019 07:18:56 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7XAd39ULAte+Xws3KHC1fowjn3N8kD2tndQfftwgvLhovOPu4xdB26rWFpmS9k6URxGLDL
X-Received: by 2002:ac8:203:: with SMTP id k3mr51846689qtg.64.1546615136826;
        Fri, 04 Jan 2019 07:18:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546615136; cv=none;
        d=google.com; s=arc-20160816;
        b=zWedXTblD+mIWkQZFvrYsi94o3oHiwCGCpK3VYVuRd3HlU+hqocZqnXlQi45Khl92d
         8QMD9xb1qmcnU4YlkdEgHVPbb0rMn8z3CUSv0fFHHa7cdv2cju1ITx9jl6k8Uy6kCOuj
         iDNDnJr7nMnT5v4qA3G+oNDc4prmANm8aDyfhowUWPoYjVc24x/QzRDcr7fqmL+SEcYM
         X1eu3mrybW0O9JaQ7uh7vgGb5mIGNQKe134bOFLB5T5v3XX/J2QsE26b4ZNbBZ/TzDjf
         ziCnSy98Sc35DQYGx+RBEiXUAnd4Ia0UVDPqu/WoApVukA99/W/4aJ+9IgzVrzqTs3RH
         niug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5KTu8SFhxZMz5Co7q6D6uEgERt2TLQ9/knmUzKKiL+c=;
        b=S2gIC29rcMNzmBgf2fjtyk/rZGnzlstitNH+RoHTvvVdiSLo1Tn5a1PMLi7s9p3tZ9
         2Z2F/9Kifyjz58IZTWf6e9S893SnVe0/TpCVs1725fs0JELNcuiyPECM5fig3/r2WYV+
         T8IPXSeQ60xx8zO/8vJ35iPXdC1wRKKmMyTdYqENd+clsr9ZDN8ANGoIJICFd990Szew
         YGiRChC/BXbZcne7qV1kxIilrrd6Py367v4AKgDHp6+9B1Z4QJy3nfjKZ8KXPrUFgwOF
         NAyMlHXb7wIDyRXke6dxCOmbYMJDIiDIswKfFCbKK80ZiwBTOVg/iorj+28cOaQf2eJC
         P4+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aTfA7kQr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r65si6055387qkf.244.2019.01.04.07.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 07:18:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aTfA7kQr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfRFQ-0007ID-4Q
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 10:18:56 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gfREw-0007FA-93
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 10:18:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gfREv-0008ER-M5
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 10:18:26 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35425)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gfREv-0008Bl-H0
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 10:18:25 -0500
Received: by mail-oi1-x241.google.com with SMTP id v6so30586909oif.2
	for <qemu-devel@nongnu.org>; Fri, 04 Jan 2019 07:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5KTu8SFhxZMz5Co7q6D6uEgERt2TLQ9/knmUzKKiL+c=;
	b=aTfA7kQr/3QQOiI6YnCwr5pQrMFkJazbZ+PQDsjNfU+AHnpRYqvLT65n8K+atwNgEu
	rz9e0Q1cau7CKD5QlPj/EZSd4SvIa51LrZvEFVMPJPYh4LSFg/Mzji6Dg3850Gk1/T4Q
	tzHOd7vQhd6WZ6UkJ9gOf8fl2al1zDy4GPQuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5KTu8SFhxZMz5Co7q6D6uEgERt2TLQ9/knmUzKKiL+c=;
	b=L472xgV6bqKHx9Q6svicJjiMfyzzF88Xu2xSgkTxsWoag6nyqb9Fwi+dCfc6iCB42K
	8ab6HjVJWc9BBKROeb4hWQ1fd64CWR5eFwLNdKAukIJBdhmBW5Zo8c87dQZYaTWcAp3T
	HQPV9R9GTXxOjaRUUK6J+/dlS5iTOA9mC8EYJHnSif7dnNFUnR5LsXVx8dp+gJ//hyU6
	YjjkfrAbiSBGv7cE4cOyrFyIJwiK8gWuaWGvitfW2983qYWkDRP5WXaUPyhWk3sr2qFc
	QdvYFSjq6yInSdQBf2Crl3EjcLznp3EGGc3Eqx3lbcfyAg6DQc4OKRrI1nUTa1nRfRv2
	jqZg==
X-Gm-Message-State: AJcUukcSC6Q0ZwpWQ0ls4ej18IdOtylNXz5DgafRVwaBuWhgTaWmpFzh
	YPYxgY46Lzrgq/zDwupQo64/lTKrclPP7lTS2ky29Q==
X-Received: by 2002:aca:c501:: with SMTP id v1mr1258558oif.48.1546615104927;
	Fri, 04 Jan 2019 07:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20190104104749.5314-1-edgar.iglesias@gmail.com>
In-Reply-To: <20190104104749.5314-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jan 2019 15:18:14 +0000
Message-ID: <CAFEAcA-y3X2wv=pDw4ufAFRnhdFmGRDHc8KAT9B9p1F20V1hqg@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v1 0/1] hw/arm: versal: Fix memory leaks
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bK5G48NqKdao

On Fri, 4 Jan 2019 at 10:47, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> This series fixes the memory leaks in versal board creation
> reported by Peter Maydell.
>
> Best regards,
> Edgar
>
> Edgar E. Iglesias (1):
>   hw/arm: versal: Plug memory leaks
>

Applied to target-arm.next, thanks (with a Fixes: line added)

-- PMM
