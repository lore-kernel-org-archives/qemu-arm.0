Received: by 10.25.27.66 with SMTP id b63csp2050756lfb;
        Tue, 31 May 2016 06:14:57 -0700 (PDT)
X-Received: by 10.140.18.197 with SMTP id 63mr29714933qgf.18.1464700497360;
        Tue, 31 May 2016 06:14:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c65si30984167qhd.2.2016.05.31.06.14.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 May 2016 06:14:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b7jVY-0001dH-Kl
	for alex.bennee@linaro.org; Tue, 31 May 2016 09:14:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b7jVK-0001UV-Hs
	for qemu-arm@nongnu.org; Tue, 31 May 2016 09:14:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b7jVD-0005JP-Uj
	for qemu-arm@nongnu.org; Tue, 31 May 2016 09:14:41 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:34569)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b7jVD-0005JE-J6
	for qemu-arm@nongnu.org; Tue, 31 May 2016 09:14:35 -0400
Received: by mail-vk0-x235.google.com with SMTP id c189so258761685vkb.1
	for <qemu-arm@nongnu.org>; Tue, 31 May 2016 06:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=04PuMauqbixGq2/RuPFar8dDpEeGZAhOqPq+08wlzHE=;
	b=MhS/2GitbwJ3MYVE6WAYTA/HCjhlMVC0S5wu4HX6iy13dQSVi7BvRkkMwxvhKizBtt
	PG/LH62B2M4desvCf3dVL1H1Wvtdll/S7dzW4YmAADx654YRL2Dx+VGkQQIJOkja1KHJ
	7QkkZbJ09SEgwtE88JVjyHdwfyHg6gNiui3VU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=04PuMauqbixGq2/RuPFar8dDpEeGZAhOqPq+08wlzHE=;
	b=lall2em9/BzWHQSejfaiBTwtQ1WOcvYDwUa6bma+KCEDFt8tAsi36hkAxyU6K35nxE
	Tk8X5I5rCkfRPnBz/R3sMP810KBQG3ZQFCV/9y76PJ8wYWrNmbdTk5lkEAWvXPNFeRAe
	Ya7Q7m/RWg/ks/QlAXaMkIrS1jQYarYuz3PTJ0SiRbp6lyZMG0uUnYOy09Q5a/pSSMT9
	XhdsLAy/ZfFficA+wT2N0HxEyCqRo78QUv4zPAMHlLkZl1HA080cC80JocPsIyBtWXlO
	nBQ28wjsn+fMWRZbTcIKRIxlPHJYQnAvdn96kfxI4krs/gcdK6B8O9SAN6Qxy8g5N6k1
	Y8nA==
X-Gm-Message-State: ALyK8tKcCxMmsHXfPjXOPprTL1BnJJOZKFAv5Aj24gavo1QlPNd/S5wCtCVpAqetYUwW6K8Ql+g0y7w6tJKLy0LK
X-Received: by 10.31.81.199 with SMTP id f190mr14252129vkb.139.1464700475120; 
	Tue, 31 May 2016 06:14:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Tue, 31 May 2016 06:14:15 -0700 (PDT)
In-Reply-To: <20160531151029.605aebb1@bahia.lab.toulouse-stg.fr.ibm.com>
References: <146468219419.25446.8053365248306938869.stgit@bahia.huguette.org>
	<81bca811-db78-ffd2-dbfc-67e14ae88ce2@redhat.com>
	<20160531151029.605aebb1@bahia.lab.toulouse-stg.fr.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2016 14:14:15 +0100
Message-ID: <CAFEAcA_rsy6D25Yx4Ov+579bQOz35yYKmg9bMSewypBWYA+eYg@mail.gmail.com>
To: Greg Kurz <gkurz@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-arm] [PATCH] virtio: move bi-endian target support to a
 single location
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pio8FyDtJt88

On 31 May 2016 at 14:10, Greg Kurz <gkurz@linux.vnet.ibm.com> wrote:
> Hence my tentative to put all the details in one place... would it
> be ok if I include "config-target.h" to ensure we have the TARGET macros ?

No, config-target.h is one of the headers that should never be
included by any file except osdep.h (and scripts/clean-includes
will check for this). You're guaranteed that it's always included
for you.

thanks
-- PMM
