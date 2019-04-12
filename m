Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp733091wrx;
        Fri, 12 Apr 2019 09:05:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzbdGBm/tv1dBcM7jf4QGIJtGvr/uPcUObcXmmhWvbE5/sh2zQz2ugD/BNnh9RWTwYUzmhJ
X-Received: by 2002:adf:f80c:: with SMTP id s12mr29074247wrp.72.1555085120526;
        Fri, 12 Apr 2019 09:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555085120; cv=none;
        d=google.com; s=arc-20160816;
        b=SQmmNXvf+I70LD2hm9S0xTMy+a5qEh1sp959ifQKAnaJ1qZnfHuMYXZi7U4vL1xPJs
         CxPF74LWtKeettkVoQbRMMprDBQkGQwSYn8RbYYRz4V+j8ZO8NcQpw7QCoMTHz30H/K3
         ilZfkyfKe2w4FErd9qtNcEgc/GWxpln95SzJfIcr8J5ee6hhT/8xz8ucY+FIiRZHL3rk
         pl+Wgm1fJAkL0mGMnWZOCh5Mlwag4qUMSjiyXYZuYdEYWaUQKh1aQqFjIWxHZayJ8gkK
         XNmrQ7SZaQiMa96b095rr+81IAWbxaZ4xmuKI91kk0u/SvOncQy93xZ1sK5zI3jwrbpe
         9Vsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=payCiHsOuwB/s23xUuaFpesubHn3V5EZoSI/pitSNVU=;
        b=SJ5dCsW/wJFx+qGS/DzJU7tlHSO4trbaw3sPwr8CpIL5csgb+Kz+JH4FLgWMNKVGPw
         ArMQNSzIX0QKP0vQRoAqC3dAFLSOQJSOECVK4IduAsABtegVJpXSyUzvLih1XcU5n/FH
         rmCsRgkBl+n7Q4hrWBhjBaAG3Ifumf+9IhaWN6s2WtBniC2mGaGu6VTTYXbSpXzIHL+J
         uqcopvNkwVNHG8Kr/OnKcniO3lnyfmHA+Oh6VSxmzETjOTPPpWjJZSL+SQcF75ig1vnR
         egE43RvmQ7T9bA2Ap3mcnkgmTUdX8fqBVqmYeEwxi2u+QMRm830IRfak8XE0Awr03pu3
         facA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kLHNls8R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si26866033wrr.246.2019.04.12.09.05.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 09:05:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kLHNls8R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEyg3-000433-L2
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 12:05:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hEydl-00031F-6G
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 12:02:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hEydk-0000Ha-C5
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 12:02:57 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34790)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hEydk-0000HC-6g
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 12:02:56 -0400
Received: by mail-ot1-x344.google.com with SMTP id k21so8854334otf.1
	for <qemu-devel@nongnu.org>; Fri, 12 Apr 2019 09:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=payCiHsOuwB/s23xUuaFpesubHn3V5EZoSI/pitSNVU=;
	b=kLHNls8REg/zihx39ZXOTfpavzsTUM5fCdiNS9LRkphs3EjpJ/boxiS6BaVE3ADOsi
	7mQ2xqX3K4JQJX0SnY0TGpOC1Bbsi9PVTQtbyDUapk8bu3aDjQgmGdjHhkz+2sKAIA5Y
	dyI3/ZdkN2G7FvKwgmXyB93BZDA+zEAgbpf1JUsi2ZN0mT3SZUk9CAf5rHkbkfEkvmxn
	DqnQUsLsYmN003EyCnMKFo3akdl5+XtbcdQ/u3dA6DfpgCRMbwGeOjdQmRJg7rYvDlwP
	Wi3oU584ASayZG+UtIs0vBjGOkt38GDhlU+8tPilcIZ/yrgB47cWz+6f3ImIjayBnPWs
	mG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=payCiHsOuwB/s23xUuaFpesubHn3V5EZoSI/pitSNVU=;
	b=tmeCUNRPcoGJcPhUPDgv26kUEQMyA8+LNaBL3S9/+RituRgMVpvdAcm9JOnkYiDJVy
	/c5T+uv5WDVHGoDN767sMq86QXaiJSyDQxTJcddaVAMr0SaebiB/rY7LUYWUSk0maaye
	DE7lLS4h1V9fYN5PB6f7mtqXUqYyAd10G31BAy9Kf5BF78+to9qBNH7ahX8QnZnJhFVf
	5BavsPaAub/3oNt1m4gTJtdOhfoGIpyKTOSTyDjCGPVjFZrMUFL4ha/25iY+sPHf6TBl
	StUXyUwAWHMgJqXUbh7BKXlf2lVmvp7dsg9vlxDOxcACuJjcnUVyE+qY+8EqyeWGFM02
	FVyA==
X-Gm-Message-State: APjAAAUZiTz1W8wX+PtgwPxVHOEG2tVuYB2ia9V2/+vRRMD9Q205+aLh
	GtQJTqI+3YsqFUTisdyyvwFaiGOHNMDPOZC4wPnung==
X-Received: by 2002:a9d:3b44:: with SMTP id z62mr38722152otb.319.1555084974604;
	Fri, 12 Apr 2019 09:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190412152619.23542-1-thuth@redhat.com>
In-Reply-To: <20190412152619.23542-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Apr 2019 17:02:43 +0100
Message-ID: <CAFEAcA9kXdUH3vkGLfEe+CFuD=S9XFEaWGNETre7gYOx5epFpQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH for-4.1] hw/arm/nseries: Deprecate the n800
 and n810 machines
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
Cc: Libvirt <libvir-list@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gj9N3KXoYK1Z

On Fri, 12 Apr 2019 at 16:26, Thomas Huth <thuth@redhat.com> wrote:
>
> These machines depend on the deprecated bluetooth subsystem. In case we
> finally decide to remove the bluetooth subsystem, we likely need to
> remove the n800 and n810 machines, too, so mark them now as deprecated.

...we could just remove the bluetooth devices from the boards?

thanks
-- PMM
