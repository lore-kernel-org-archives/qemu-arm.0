Received: by 10.28.173.206 with SMTP id w197csp4089757wme;
        Tue, 16 Jan 2018 07:37:31 -0800 (PST)
X-Google-Smtp-Source: ACJfBotNkYvcSReysGIeWLFwejBEsSODGkg/Om3FDTTGp0mUkb1gGKoCc+34+8rXragzAACulXZD
X-Received: by 10.129.89.136 with SMTP id n130mr18857108ywb.120.1516117051230;
        Tue, 16 Jan 2018 07:37:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516117051; cv=none;
        d=google.com; s=arc-20160816;
        b=RRngwb9z3MOvdbR5To3e9XvJhOx9DuNRCadJkQ5UJTHDLiaTWpg6H5GjeI8VWIirZ5
         9wBPyeNU2c7SOP7sVNoz2hP1CQdJ6Lb/0mWCS07t0O52vPpZDGQ4TkivdWrnq0jbBaZH
         PzERrqqhLVDUSEuQi7MSvEWja0hpGw5iKZvPenXfSQyERm7xOOy7xcvwSzPSslBlgATp
         g9FLXTh1w4POGdrJfuRGD27dRy5RtdKQ1vPDMgAHYczN8Mb64+llBPhH/suoRLIhMes5
         dD2vb0kqoGI90aiH5PxrLUn/Yy8ixrzSOo5mWJ8Cragj2CQmPk5v+QP56dnMZhXn22be
         1RYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=DTO2bLGHJ30J3etc8VqK/cNoBbQLFWIxqdmYLGbai2U=;
        b=QIgR2Bw6Vb+ffM5CyaqK5CgFtm5lo/f63jWbyWxcBohjDlNL6fz0XAexY5obz8keuM
         rdzFUAgpdGgcaM49ob2xfsmLEiioRbslhLel/kfCZATObzPPbfCTy5mfQp7ymjjPAMrk
         YaNteLkq5RVEv2LJMeglzRR8JeJW1YleMmC4nox8YYgonjeZG86Yq/glSmFa6UWbbTAo
         /X7LKVIGM2KaqrPX353BQktdNNOkriLdqyjskC084wQxsu293ZV49ut8SNTz0RPPjhH/
         X+dGDfJ7WxcnZLjULGi/3ekcZbQbJDUmvTfuoxV//nWtwvt6JaRvZ4l3Y/i2xqnPitEf
         dseQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SSoLkxXQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k190si579284ywg.126.2018.01.16.07.37.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 07:37:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SSoLkxXQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41925 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebTIo-0006zW-IU
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 10:37:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSG5-0005Zx-I8
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:30:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSG4-0002gk-Lz
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:30:37 -0500
Received: from mail-ot0-x230.google.com ([2607:f8b0:4003:c0f::230]:34038)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ebSG4-0002gV-Hj
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:30:36 -0500
Received: by mail-ot0-x230.google.com with SMTP id p16so13761401otf.1
	for <qemu-arm@nongnu.org>; Tue, 16 Jan 2018 06:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DTO2bLGHJ30J3etc8VqK/cNoBbQLFWIxqdmYLGbai2U=;
	b=SSoLkxXQvDMoaxyu+TfbBCqVzuxKB4oVux7ykBtvaQObFh3WPD9ck+IjYLr8p4A8rH
	30SWatIdPvpkQt6T+foyX/Ccz8PSxUA75VCSBOa0h/YjeiDvhqyTAl2HB+ppn5NHQRBq
	xmcbWZzZPu5OPo+KFF5Jv5F7G6EXtAirH6z1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DTO2bLGHJ30J3etc8VqK/cNoBbQLFWIxqdmYLGbai2U=;
	b=jZ7hWCOWD7umji844wgH++MgkZ6Aze135DvWE+ueZjcO8P6A4gyKlxmVSHOCbbuaaL
	D8KAF/h/Z4SvAGYEEAyosON9zb4/Oz+PtWibGjzTOMfhq1X/aFKJ5I0sd8dVGbJJ9GRy
	35dSLPTr9jiZ7UbqjbUsby8IKxj/nXvGleShOvJihLgoJqywAEBeoVHvhpkrNWTIg4vA
	5HRcjKtRqIjGfRbVTMkLIvmo8JOqgn20pCNatvWEkE2Xz+VQ4tAAZFVUvtwQMPm/dj4+
	S2yae0+qoASvgSIZezW6o5sZSUBIc8XAvUq5aXCMKtYIhZhJ45Sp4z/sjncpC9zlDfXJ
	WYDQ==
X-Gm-Message-State: AKwxytfYBDp1ehx2gPUQLQsDR6CMg8BKMHg6tv4AfpY6rgAb05pyUdGk
	G/NzhE7Fw6RsaqU/7LAyr8rFYB2qHfnDo9/mwJ7TVKMF
X-Received: by 10.157.52.215 with SMTP id t23mr14277183otd.54.1516113035969;
	Tue, 16 Jan 2018 06:30:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 16 Jan 2018 06:30:15 -0800 (PST)
In-Reply-To: <20180116013709.13830-9-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-9-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2018 14:30:15 +0000
Message-ID: <CAFEAcA-1t0aSBP4dx7+4yagQKL+-wGPgGFKmquFeXk32RAO1=w@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::230
Subject: Re: [Qemu-arm] [PATCH v4 08/14] i.MX: Add implementation of i.MX7
 GPR IP block
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
X-TUID: CHALYloK3bZg

On 16 January 2018 at 01:37, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Add minimal code needed to allow upstream Linux guest to boot.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
