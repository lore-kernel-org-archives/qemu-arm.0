Received: by 10.25.208.211 with SMTP id h202csp594705lfg;
        Thu, 18 Feb 2016 05:02:45 -0800 (PST)
X-Received: by 10.140.250.138 with SMTP id v132mr9255735qhc.0.1455800565865;
        Thu, 18 Feb 2016 05:02:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d50si16502146qge.116.2016.02.18.05.02.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 05:02:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:41092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWOEH-0006Al-DH
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 08:02:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWOEF-00068g-0T
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 08:02:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWOEE-00012J-4z
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 08:02:42 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:36419)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWOEE-00011h-1A
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 08:02:42 -0500
Received: by mail-vk0-x234.google.com with SMTP id c3so43220666vkb.3
	for <qemu-arm@nongnu.org>; Thu, 18 Feb 2016 05:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=SnQ/+V88bolRLsGEI0B9UrJ8vShIMz3/bUf3ifECohU=;
	b=aiiu4o5MisO/RCnJQjZvFPbBqQFJQgWk+4meCRK0akPLBfAjesDCspM8K9+PAwSUVn
	HDRlzccPFmglfLPH3zvl95sXfpEdfxO8MCFPgZQ9FfcznBuhwRpfiDLSIDPkZeJSDQYk
	HP94TNd7qgifIYwkfynKHaeNRnnqXDcaX86to=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SnQ/+V88bolRLsGEI0B9UrJ8vShIMz3/bUf3ifECohU=;
	b=Bc/umdhLmraaxXDoCIYz+iDCss579tmb6ZkvnTaBN0m5KPaiSihsdsc1RgVkvxF/sN
	Z5ZQJbk0dUXiDemIHYES0YxLGGzZxlv9QPDYPA9RBlm7pyW+5PhAnQITYixq47lFV14e
	wrYRDHmWGb2k2FtCmnCss4n20nTfBGxhR+KrVHmGU/Glv9Uboch6rh9+ECjRy15/ZBbn
	6YOyqO+FoYDUhHnxRD1cdczfH+byyocqs6r7AOr+ZaFEwpKk3KcT98tX4x7l0lD0DVRk
	Zz9S1fFYjkVtkfQrRfZGG0Z0sHkgWbRvEYVWcaQm/JHttQYtHUZg5caiRP4XLWqqdKpm
	dNJA==
X-Gm-Message-State: AG10YOStLLx+sqFcBXfZI8RF9MTzQYxpHNPe4vMJmY4zvk8djQy4UjGw9tE3+HYQQo3NYhh08bWidlXQezoDGn80
X-Received: by 10.31.107.194 with SMTP id k63mr5290794vki.27.1455800560330;
	Thu, 18 Feb 2016 05:02:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 18 Feb 2016 05:02:20 -0800 (PST)
In-Reply-To: <1455621027-13927-3-git-send-email-zxq_yx_007@163.com>
References: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
	<1455621027-13927-3-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Feb 2016 13:02:20 +0000
Message-ID: <CAFEAcA8PSnrnu3o9dJWK3RwrSiq64qjFOqw3gz0Vr_YEXM3Oyg@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: Evgeny Voevodin <e.voevodin@samsung.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH v3 12/16] hw/timer: QOM'ify pl031
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bKV3vsr5lGKH

On 16 February 2016 at 11:10, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> assign pl031_init to pl031_info.instance_init and drop the
> SysBusDeviceClass::init
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>

I didn't review this patch! Please be more careful
about only applying reviewed-by: tags to the correct
patches when you're sending out new versions. (You seem
to have got this wrong for some of the others in this
series too.)

thanks
-- PMM
