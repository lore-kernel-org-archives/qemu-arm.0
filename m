Received: by 10.28.173.206 with SMTP id w197csp4104736wme;
        Tue, 16 Jan 2018 07:51:53 -0800 (PST)
X-Google-Smtp-Source: ACJfBosoTUwwPLR++prTleyoNN2IoeNwc/WKNFDRm80x8aiiSfTbGa+qAVcEBAVM87uzW9Vm5B6G
X-Received: by 10.129.82.213 with SMTP id g204mr25542426ywb.379.1516117913047;
        Tue, 16 Jan 2018 07:51:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516117913; cv=none;
        d=google.com; s=arc-20160816;
        b=0xOygvuEdQxo7ly5XIL/mH8rRGaUkZ6hR36kgGd8YFA0FVhbJBvL38BwsD+VDDvNXz
         2mONR3iMd2nLFfTaPtOCP58dmP0ik0WjPQ43OUTUbF08OIsj8oQODuix0ltCAmxOBp4V
         ecO579r3w95RWGh3P7DbahBjstM8mmBM09MXrkh36hsdWS7PvcuYp0FcwoZslj94Tx8Y
         DC5VlU9g4prf9alXdU4HfN3LLs9BgQ1DZ7yqddQCblKAOpI+gG+EtHqVTbBDhrOkpMAy
         J9DjYkqBilN9TWc3oEVl3bMVXe9IRw3J0+DqbDyjkg+t4HH/Jb4TIOc5Rd3yypWpBTZe
         LN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Vie7pu7Ue7dU2sQE31QQKYlTP/uenqnZUWIFXLr2QSI=;
        b=x5VCUCicKFF5jbVIWN0f9XjsTQx7zGHwwSviFmD/iEXL+thMUDFHuyJ1oC8tgFusEd
         az2IyLFjEtSEfT8yRBasLzGRYKPb5wBkBFUCDmnEATJ9ITYq8m1UqwBjSLwleGZClbr3
         LLl5QiW3QQw+E9CXqGM1jfEpo03EfHhHH41hSPw5qom57dTmWzsn9rwzEGMzSsQK/7Bt
         CYEoAFA/5ShJW9tsBVw+kQElsd+Op0XNH2LfnhuiThDjGtlt6RxbaURfe82+XlfdwOde
         +gTwySfcv0ewfQtbxWEQa6eJ2mAmDh1fyNs03kUfTicfwXiIDbYodcji0E/QwbSimu/v
         sdCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XHnFNfZ2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z4si58436ybj.58.2018.01.16.07.51.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 07:51:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XHnFNfZ2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebTWi-0002BI-Dn
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 10:51:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSbx-0006q8-BK
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 09:53:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSbw-0006g2-BS
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 09:53:13 -0500
Received: from mail-ot0-x233.google.com ([2607:f8b0:4003:c0f::233]:34154)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ebSbw-0006fh-5d
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 09:53:12 -0500
Received: by mail-ot0-x233.google.com with SMTP id p16so13826471otf.1
	for <qemu-devel@nongnu.org>; Tue, 16 Jan 2018 06:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Vie7pu7Ue7dU2sQE31QQKYlTP/uenqnZUWIFXLr2QSI=;
	b=XHnFNfZ2zkoQfj5E3hnlK4TP/3teRHrA3BccP65leaWS+z7d8ZnuH+gzgV6OH5bdpb
	jhebpFdXRh8qPnRYIgPrRhvNRv4kjGGBnCsiAomF6iKu3QpAlVSVVaFf8nUnFb9gjSXa
	Da94BVKNJpZObf4hiD0iuvPHuYK011VE9EUDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Vie7pu7Ue7dU2sQE31QQKYlTP/uenqnZUWIFXLr2QSI=;
	b=hxO5cj+gbo405jS1i7sJQxw6hkgp0bHrZyDK9z7LkxfUfaDwvckv2hi1nr6B7lCX/+
	CPBgeA60Nb08/u202evpGU+uCKM243IZ+plaH2eoFknJWsZA0FZ4E6Sva3metf8bJLq7
	0uLqCVz5CvIIu9oddAL3zD6IWoFW+5gwfq4kDvddBskHr4yvq2Pr8SaqdVK8NKmPkGjs
	IWub+z6RMPUk7CnS4rUCL31qXRf5K+LCag9p+rnA0+KTN9q+BffQOlYSpK8QxIu2Yj5a
	iETHoPrHyWOZhVlRyn9vpkY0LYnu7UZsvjlknYuHIHme3lqwxE/cx98YYYVUoOk1la19
	+8JA==
X-Gm-Message-State: AKwxytc1fvvXFEnNpYQ9tZfj2A04bLoS1yeN5ZDANhzNGUzkNHAwYKMp
	c4cmQnYZ4zZ/c6CL0+uOE03093Jgup2sqIhY+iuAQA==
X-Received: by 10.157.52.215 with SMTP id t23mr14320196otd.54.1516114391416;
	Tue, 16 Jan 2018 06:53:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 16 Jan 2018 06:52:51 -0800 (PST)
In-Reply-To: <20180116013709.13830-15-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-15-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2018 14:52:51 +0000
Message-ID: <CAFEAcA8O7G-Psw55tOUUv3h6WWJNWxSmmBcz_HHQ7Ui2DqBs0Q@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::233
Subject: Re: [Qemu-devel] [PATCH v4 14/14] Implement support for i.MX7 Sabre
 board
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rcVO629CxwoB

On 16 January 2018 at 01:37, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Implement code needed to set up emulation of MCIMX7SABRE board from
> NXP. For more info about the HW see:
>
> https://www.nxp.com/support/developer-resources/hardware-development-tool=
s/sabre-development-system/sabre-board-for-smart-devices-based-on-the-i.mx-=
7dual-applications-processors:MCIMX7SABRE
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
