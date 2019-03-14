Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp744531wro;
        Thu, 14 Mar 2019 04:53:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRkg21zOx/2a3d3FZq37u8pQIKDQHjgYYp0e6CYRCvcQAArFQonimBAFhQxAe+zO6UyB0F
X-Received: by 2002:a81:110e:: with SMTP id 14mr36792570ywr.193.1552564380434;
        Thu, 14 Mar 2019 04:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552564380; cv=none;
        d=google.com; s=arc-20160816;
        b=JMVAB41Ad9vNx2HOkhDt4fIcT+AFU3gt+Zdtrb+OZKnxd7DnDx/ok4HtH0lekVrgBR
         p0GahouFBoGJEx43bTbNONwQ8eXvifSIcCfjXP/P5h9g5DOwjKgIMFn4kXgCABLkYWjb
         zvnn0LNuiHgB3HF2DKcv7rYuzdFMhdXyH5cIR0RgdM8QadDCyP6VXPFc91n9lk2CikR0
         iubZox3VOcNajGpGn+WK126HWcUwpgBPt9xCp2fY9w3YvJ1XVmhLUveneJKPT8jtH4PN
         XNWP7LfjxnTpJgYR77wRKkZ8uQ6iIftU/uIL70LC1uoGWBqUIB5aEqCTBJA2paZzFxIq
         y6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vP5+bryiSCqkvHDKOGaabMOlXDGL0KD31DMWWN6dSkE=;
        b=LZju/WYLNUAjIGQONryqhnayVQ9DpGIG0XrX45DehJ/TsdkTJQ9OzhM2HIg02NGDKX
         LKGqt+McJXI65RP+0Wi5iGBEnlF8MMjbECzznC1dNVBEQTYmC7QQuIGNd1dJUauq/Mv8
         sl8SrRlQ0qXS6eaIg7Bi/Ud1bQEgkzBCvVsJzQCmTt8ka8de0FTuO+/T0/8Ivo0auN5q
         HJbLZJ4ZSMEzaNUhsi6h3kRZcjTKxV05vsr9PwTDHUXK9BLc9tEkZhSSd/nyqzxvNZZi
         1EcTuJzBdZ4Nu04WLXkIe4HAwmPsooy0wY1GWoAauv3XGwYN4aPXo97BB5iHtbZ/tleV
         5M/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fFTGR6wc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q190si8716738ybq.278.2019.03.14.04.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 04:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fFTGR6wc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4Oux-0004yH-Uq
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 07:52:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4Ouc-0004po-0q
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 07:52:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4Oub-00058o-9u
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 07:52:37 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:35510)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h4Oua-00057c-TX
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 07:52:37 -0400
Received: by mail-io1-xd2e.google.com with SMTP id x4so4792873ion.2
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 04:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vP5+bryiSCqkvHDKOGaabMOlXDGL0KD31DMWWN6dSkE=;
	b=fFTGR6wcX+GAmhFNOmGdJtxJw3KcM167BstU+7XQWNnGBBLFjBpZs99par+u081HN1
	VeGSwdE3V0UKvxgTgSdyO6AuBZTk3Gka9OwcWHFYaJkf63UpnF/I9uJi0FrQVEVZK4Qn
	anGKsLynwnKPLT2X1jNcZGhSt8fxjsSplt+IlPOu9eg5XhAjykMkD28EPcXO4JVrnu6F
	kBvDcYG4Zt3TwSOt3iqMj9lLuXjZJy6PhIyhfsyYsVG0BhoAF8OD7WKG5YX2jF4a7OGa
	8QxvfVjRLCr4ra/p1m0SyGHLWj5PE6FYfxWAnoEx1cIRdIz1PFKWKOGKgAIEKeOKUWab
	0G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vP5+bryiSCqkvHDKOGaabMOlXDGL0KD31DMWWN6dSkE=;
	b=tO5xdpSl3oND45+Sg8O4WJ1BrjIwxtwepz5dCmruZuSKGLzirl/JYA6LvPngSY3bZG
	0nrtZCKLBCB0gu57j253WrmhtNfQwSJHZCaQFESbWjvM5H4EXUsULk94YXyeuoFZRZmy
	WQKtJBCVo6ih9oWk9DVrmECv+T/sO1itSHRsg/i6/uZdOdbfVe4aUq35DbAlYj1DxIml
	PLi1QcgQ/A4UVODIKCxxvSX45sr5BLS5rOnGjCIrkvRQt5G7cNnddVrvCVntH5pA0YsG
	Kpkh3BXKwBTvUP6kfNBez18CPsDHkip03q7W5enPXUH/CO+FiFouN6RMTr22XreU3I5A
	2lzw==
X-Gm-Message-State: APjAAAWXUaOUmJHtbDyPIvd6qY6VHTVgoFKc6m8UUkN80vHd4XZ+rSfz
	8Oc5Rz4A57Hp5gWG/QtCZbIFgcEGY3Hm0xjnj/GTdQ==
X-Received: by 2002:a6b:7202:: with SMTP id n2mr12841350ioc.82.1552564354991; 
	Thu, 14 Mar 2019 04:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <93dc7574-cfef-e556-6349-f6976c4bd914@huawei.com>
In-Reply-To: <93dc7574-cfef-e556-6349-f6976c4bd914@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 11:52:24 +0000
Message-ID: <CAFEAcA-4=qJ93095DW097LRqg-G_dJAUFu1drwEhN+W4g-YNnw@mail.gmail.com>
To: gengdongjiu <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d2e
Subject: Re: [Qemu-arm] About Revert this patch: arm: Allow system registers
 for KVM guests to be changed by QEMU code
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FQGWunWc52Hn

On Thu, 14 Mar 2019 at 11:31, gengdongjiu <gengdongjiu@huawei.com> wrote:
>
>  Hi   Peter/Eric,
>    I think we should fix the regression issue instead of revert this patch,  I think the reason of
>    this issue is that QEMU modified some unexpected resisters, we should find out.

Yes, I agree that we need to actually fix the underlying bug.
But I committed the revert as an interim fix because it's
taking me some time to identify what is going wrong.

thanks
-- PMM
