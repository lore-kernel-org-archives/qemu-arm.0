Received: by 10.25.208.211 with SMTP id h202csp2793343lfg;
        Thu, 25 Feb 2016 04:59:23 -0800 (PST)
X-Received: by 10.140.234.11 with SMTP id f11mr9944447qhc.51.1456405163785;
        Thu, 25 Feb 2016 04:59:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w82si7913381qhw.108.2016.02.25.04.59.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 04:59:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:42953 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYvVr-00030y-BQ
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 07:59:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYvVo-00030O-So
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 07:59:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYvVo-00087G-5w
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 07:59:20 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:32974)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYvVo-00086z-2Z
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 07:59:20 -0500
Received: by mail-vk0-x233.google.com with SMTP id k196so46864887vka.0
	for <qemu-arm@nongnu.org>; Thu, 25 Feb 2016 04:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ZecNscYYqrfXsY8d3MCVKzq2qyi3uk+r/YwwpmST2bM=;
	b=FRphLEOij00VYZnCb8DA4rQCqzzrjDmPzZyF1fsVEtoB3S+5zX2sj96B0wWw0OnTUp
	p8bPOWw+ywKOH6V3i2LQguSPiSbkwbSL5s+L5af3OHCDMp69UTwXntwVTGD571BZjSD4
	NTxlBSm17+s5dtCKgWnaMCgtksEKjmJ0CBPVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZecNscYYqrfXsY8d3MCVKzq2qyi3uk+r/YwwpmST2bM=;
	b=gRFlSYpbZ4pzwNXvzwW8Euo/dre5WQl+8sFrw0166ORdj91rElTAJxPCu6Nhy9VE3s
	qdP98uYN+ik30Nh9FZxmCflHoqLxo/peXnZynYfFiUdL7RcmxgdeG574/C4ClXPvIWf/
	sD/jt3ETZ7lGIoq9XsTIRxQVenTQoz3MaY+odFzFiwzXi6P6488QK0JCfUJ8vqKUhYgl
	NEjajel+y68Do0ts2v4cOQkK8VjJ1b+PBPfput3NEqgcOHVavWYc3i/bozYHJ+3YTJ8N
	+VYuliFWxcP/pLxg9B2QWDA7kNNbZbebp9qaPsym5F6l2Gvq+v+Xl+2XY8ctScqllO5B
	0IAw==
X-Gm-Message-State: AG10YOSBSmylAxbt7Q7/Jrjda/eZX8iJXTx3e/aDB4OBb7/idbnP5O8CxkPqXaZmBg2KoUEScxwNM7b1SCfPn685
X-Received: by 10.31.107.194 with SMTP id k63mr32794541vki.27.1456405159613;
	Thu, 25 Feb 2016 04:59:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 04:59:00 -0800 (PST)
In-Reply-To: <1455814580-17699-1-git-send-email-wei@redhat.com>
References: <1455814580-17699-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 12:59:00 +0000
Message-ID: <CAFEAcA__Y0mxn8BBSrw4zhvRbQjoeSpicOxUiKOGXYrmvbtobQ@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 1/1] ARM: PL061: Checking register r/w
 accesses to reserved area
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
X-TUID: ap5AFHdjVlEZ

On 18 February 2016 at 16:56, Wei Huang <wei@redhat.com> wrote:
> pl061.c emulates two GPIO devices, ARM PL061 and TI Stellaris, which
> share the same read/write functions (pl061_read and pl061_write).
> However PL061 and Stellaris have different GPIO register definitions
> and pl061_read()/pl061_write() doesn't check it. This patch enforces
> checking on offset, preventing R/W into the reserved memory area.
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/gpio/pl061.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)

Applied to target-arm.next, thanks.

-- PMM
