Received: by 10.223.159.82 with SMTP id f18csp4231671wrg;
        Wed, 29 Nov 2017 06:39:52 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbtXpGy/jerlE3gUfXo1vIlm/Wiqfv1H3lIb3TbDRXCRYAjmvjNms/RT88w0i+Qd6rn56SF
X-Received: by 10.37.134.3 with SMTP id y3mr1913755ybk.271.1511966392654;
        Wed, 29 Nov 2017 06:39:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511966392; cv=none;
        d=google.com; s=arc-20160816;
        b=b5y03W2ygq4xjSFyYdobt/hJuv8zD3MHh2zOLISBAmyvyIz2kxZQt9GPF7JZ3rrBo6
         EYLIGrIA4ieF5bJZeVISLj1j8CBckSiDbPEOoUtJ0VegYT2z4eqN6sKQTy20dQ0u3Xs3
         sv7Ctmx4ofAN98dEUH7tFc/OL8XxZWVf2Bz6lj1msR+3GG9bZGNNvSi0jFN/uPAegPeM
         /Jr8UW03604TSK0kCRoyKXyXS5S8b8g5H8HHNALRGbd2DXgManaIVeeVLkq8RY9dqjH1
         X/8WCHHbDjsQlo/R8fvilcuUVU1Pu2FVvMfvv7zEqMHJZod5G6O95u5HQ/cSD3cEW9JJ
         /9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rkumwgAF8e07IvSs7xV9mH4tXczq15/9mBJkha/CIVk=;
        b=Q76xHa7LkzkqLf8TkH1NGJkE5hSzKUpou/l5O20IJeDVLZePj0aXU4yOB1QylZ2rMI
         mqvfwmvdw7Ikxb5uV9wHu91LfJOSufdgP6ayGYE11eb4EgXRJ5ZjYhBrX+j7g1Opq/b9
         rbdzeaLDa6NCcscIME/datKa4Mwmj1xJSd6NcPAp0LLU5FTCTl+JMD2auq7u1J8CeNQr
         P5HSuKczu+uBJea0oSpDYNLUiKGFg8Gpa6lvq6AD/+x43k0yDRRzysOhDVjiD/hWIxTi
         A15DfVP7aPlmEgd7KUlMDL9WN/nBxhrgnhY69EloH/ykiGBPIchPa/CxKdbpHj8wEXAL
         Xcrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KssMSU/H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m64si327248yba.830.2017.11.29.06.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Nov 2017 06:39:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KssMSU/H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43421 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eK3Wi-0000YF-2r
	for alex.bennee@linaro.org; Wed, 29 Nov 2017 09:39:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eK3WU-0000Va-4z
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 09:39:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eK3WT-0000Mz-Fz
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 09:39:38 -0500
Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234]:43508)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eK3WT-0000Mj-Ab
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 09:39:37 -0500
Received: by mail-oi0-x234.google.com with SMTP id f69so2504560oig.10
	for <qemu-arm@nongnu.org>; Wed, 29 Nov 2017 06:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rkumwgAF8e07IvSs7xV9mH4tXczq15/9mBJkha/CIVk=;
	b=KssMSU/HuCkpRwcT5vLkWxIZXF2a2qx9Kj4bmO0eFC/6DC+QEB6sBtvoYA1tOUMd6Z
	djm5Fx/oI4yrNcUONVImC/7t0oHOFS+AUjaD5jSbmZL35Va7+qUm7XPziyAgaxXDb242
	M8d5NYCze2IHla5b0yThrECzUIhnfCoIvdnCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rkumwgAF8e07IvSs7xV9mH4tXczq15/9mBJkha/CIVk=;
	b=d+ejTa9JvPLau/n5dmjPpMTmcnc6Kfuqo0waRK/lxLAf2xxFPsatV7d0jvCEGNdVqd
	JM0Ligk6FMtIsdfiG16kEDDcC9ABL7mJ6+gZM5dWxTuJt/DJ6i9+dThCMI7af6SaJjj3
	Op1/BRkZGIOT+YP99osnOWk65RIupZZDiANBzWFpS7cGjOXoTkkUCn5BKAP9lnT66sa5
	CKUnPkpW6hGVOrDX1/SKmtvAgRFUqaDcWGmM2W4HsDckfxJKzgjzHxB4ugQUEobWnNj5
	KYxGGXqJczNDL5W45CmNpyFSuQl52Uz6liplUFONnIpK5uUWLftT/TAoDZsakZ1A8YoC
	L23g==
X-Gm-Message-State: AJaThX6PI1C9B/jr/WlKVAgyx+ZkOR02jzqHGalNgUQabSJkZIDJtcMb
	5aUJugN/WHHzSy/64JVxk4j0n/ttqLzU5BdzIW7DFA==
X-Received: by 10.202.114.22 with SMTP id p22mr2149628oic.327.1511966376476;
	Wed, 29 Nov 2017 06:39:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Wed, 29 Nov 2017 06:39:16 -0800 (PST)
In-Reply-To: <1511883692-11511-1-git-send-email-eric.auger@redhat.com>
References: <1511883692-11511-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Nov 2017 14:39:16 +0000
Message-ID: <CAFEAcA-Mr548a7uu5-hxHMOEC9OenTPMRX35fxG_vYZtw2naqg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::234
Subject: Re: [Qemu-arm] [PATCH v6 0/4] vITS Reset
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /UIOmahqlzpZ

On 28 November 2017 at 15:41, Eric Auger <eric.auger@redhat.com> wrote:
> At the moment the ITS is not properly reset. On System reset or
> reboot, previous ITS register values and caches are left
> unchanged. Some of the registers might point to some guest RAM
> tables which are not valid anymore. This leads to state
> inconsistencies that are detected by the kernel save/restore
> code. And eventually this may cause qemu abort.
>
> This series adds vITS reset modality:
> - the 2 first patches bring a minimalist reset through individual
>   register writes. However, with kernel versions < 4.15, this reset
>   is not complete (vITS caches are not voided).
> - With kernel versions >= 4.15 we can rely on a new ITS KVM device
>   reset IOTCL. The last 2 patches introduce the full reset.
>
> Tested with 4.11, 4.14 and 4.15 host kernels.

Applied v6 to target-arm.next for 2.12; thanks.

-- PMM
