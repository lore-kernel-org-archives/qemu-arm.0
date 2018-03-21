Received: by 10.28.91.67 with SMTP id p64csp5050696wmb;
        Wed, 21 Mar 2018 06:12:52 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuroYkU3Y/378XYS+NzdTJ9zfGPQKNjOwIBUSnKZRFCnGYCneT0+/0ujgmfY/9s0i0ApmOC
X-Received: by 10.55.131.1 with SMTP id f1mr28030799qkd.160.1521637971895;
        Wed, 21 Mar 2018 06:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521637971; cv=none;
        d=google.com; s=arc-20160816;
        b=EdCtK1knz4kA85zxxk32Lg4GKfUAJEsfIGNrnPItsqZzZ5HrWPK3AlGvQ6XYP8Gkqr
         J4eTS5OjTO633T9AQn5FGaESuTcrjTHfM/vUZzQsREy6vKBS0crkxNKJosupxlPCrOVl
         v2rSHbm7HOlvkIzF4P47K9K2Fz1MMbqp2h5d/+a1S2j4n0++q52T3jlBly7vKRYWJtAd
         LVXFEYXeDkhrsC2sVuJ8Aol0PfIsOf56Mh1Nj0olRBwqehKbYOdaWoX3PozN+L6pg/RY
         FiTf57/4cds1yLqH+63BlpbY7MvjGHfvM4y9l/tvkY+OcNl7531IbDGf/onpaP+MJij3
         dCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=N5+nbWZaQLhnpDrOPNUbPLCTzAG/HNlipR2N9L/DOyc=;
        b=d/YtUGsNfSpr4dtXjxWmnpZJs5T2km4thB2dp+fqZtx1jEcEw5f2w5ocYtbH5z66pN
         OLij0+zoL23P5butNIKtutRdpQbeQPQsfQPFjdwMeeClCz8qPB/FJlNXJzCy4nglRTpZ
         GwlujtqF0Hwa/CC/5EWZwlp4mo7wC7MCLaWz+miz7ZsLuBxbfVq+dBTdk50qIZ5iBkp3
         Kxcy3uxT72cA5hez90RjSpzzXABU0wXbrBbdRWm4ISHrA7xEMfiGd3VGA/Rk6BMM4s3I
         3Vwlciaebp1eKQrOr6ghWDX+LnMQD/+aqi/RP/MuagyQc3ErDLR5tUPSpqAcu8YhtuIC
         IsfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3si2269961qkm.283.2018.03.21.06.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 06:12:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54940 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eydXv-0001Gf-7i
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 09:12:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1eydXb-00016p-U9
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 09:12:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1eydXX-0006a2-T4
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 09:12:31 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:60492
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1eydXX-0006ZP-Mt; Wed, 21 Mar 2018 09:12:27 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 276831529;
	Wed, 21 Mar 2018 06:12:25 -0700 (PDT)
Received: from [10.1.211.47] (e106794-lin.cambridge.arm.com [10.1.211.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 728BE3F487;
	Wed, 21 Mar 2018 06:12:22 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
	<1518461904-5305-16-git-send-email-eric.auger@redhat.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <895f039a-ade7-cf1a-6c47-81fd093f75e9@arm.com>
Date: Wed, 21 Mar 2018 13:15:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1518461904-5305-16-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [RFC v6 15/22] virtio-iommu: Implement fault
 reporting
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
	Marc Zyngier <Marc.Zyngier@arm.com>, "tn@semihalf.com" <tn@semihalf.com>,
	Will Deacon <Will.Deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"peterx@redhat.com" <peterx@redhat.com>,
	"linuc.decode@gmail.com" <linuc.decode@gmail.com>,
	"bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C8FJ6MpelabZ

Hi Eric,

On 12/02/18 18:58, Eric Auger wrote:
[...]
> +    for (;;) {
> +        elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
> +
> +        if (!elem) {
> +            virtio_error(vdev,
> +                         "no buffer available in event queue to report event");
> +            return;
> +        }

When $user attempts something silly like trying VFIO without the VFIO
patches, this outputs thousands of messages per second... I guess it would
also happen if the driver isn't consuming error reports fast enough. Is
there a simple way of ratelimiting printfs so the context of the error
doesn't get washed away?

Thanks,
Jean
