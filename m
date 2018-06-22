Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp753021wrq;
        Fri, 22 Jun 2018 05:07:31 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ9VtXV+HbsLlQlYrF+Qcv6NNeAGIiwNW9Sr3bwzA2eRjHMuumTwxBGWXO53NV07RosDFOj
X-Received: by 2002:a37:9c02:: with SMTP id f2-v6mr1006054qke.65.1529669251236;
        Fri, 22 Jun 2018 05:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529669251; cv=none;
        d=google.com; s=arc-20160816;
        b=avJmbvMtRNKYJVzJBRTBRCM0c8TQM0LB/4WVM6pyPFB5nBsY9RwRfXn+2DZbVm9IKU
         xDs0DpYK3fOWWaRY1K0uzkZSBlPNkI41PsCR06YfiNgJ84EjqpVjeAl+eCmubVaRzDp7
         saM3d/0j1i+a0gpgvPo45rh8ytMLcCviz+7oSF2GeDjYwdqEvErIyQMKP+IocKne2+gK
         gSxvADFvvNhqhmoOQ9OBdcEChO/CpauIlhNbgXIeJQWd66+JBJRg9IvOxfBYD8JRFkYl
         LB9aMeIgTnDReor1nhNTAx7Kc2S1nCwcYugogYVmRkC81VGSXLreaI56DCSm1aPxddCQ
         2LYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5apmK3w7zvKn1rnhm/jT21vdICxlyTrxDj0jO/tRsSE=;
        b=FVCOteP6jl2Raw6FsllwElC9o6EojABlao9sDP+GtZWIhyMBJ8wrnIE11yKsJuDSlZ
         PGvaoHo8LbLYJH6kglgodV9OjyYGfGNkikhNS1GBeew/bVUr5icozRONGYONZdY1NJkC
         c25XQxCA4vGVth+ar383ywChaIRNGmhrsOxhqZxeIXmPEcVhQPkcIWsOq/ZGWccm77yc
         1m4dGjxBPPcrr7X3l8an9yjfEobP3eZd00A+RmRoCm5uX6XduK0RFrCOcg6cl4k4t36a
         +wjbypuPxd7XzSX10QQ5/iRq/Ag0LEku93OnLPDFYWC2da2/F5YaBkGWwdjfNNXiUSyL
         xLhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HiY92wWa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n25-v6si959008qtl.343.2018.06.22.05.07.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 05:07:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HiY92wWa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWKqg-000143-P3
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 08:07:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fWKqY-0000x8-1Y
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 08:07:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fWKqW-0002gZ-To
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 08:07:21 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:38122)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fWKqW-0002gL-OV
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 08:07:20 -0400
Received: by mail-ot0-x242.google.com with SMTP id p95-v6so7243591ota.5
	for <qemu-arm@nongnu.org>; Fri, 22 Jun 2018 05:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5apmK3w7zvKn1rnhm/jT21vdICxlyTrxDj0jO/tRsSE=;
	b=HiY92wWaEdmfJD1sRrscH7raXdnZ/0jMaWph++g45lEoWTZD4hMmYTXr8tFEBRLHaG
	srs0dBJyTg9lXep4y0L+rR3xHTR/GMS6CcICm7prXVeKF6XwnbMwOlS3yk54j7d6zgdG
	4fbJwHZAJ86xoq/2RbEKqHu2DCiWw8GnQc7Cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5apmK3w7zvKn1rnhm/jT21vdICxlyTrxDj0jO/tRsSE=;
	b=C4GM8yoy40YJf7tK5waP3AuugEGlIxur1aI/Eefuv0yv83jj+Q7wTJ8Vn+FRjIEfUy
	2cDNRHLf/EcXMnkVxAe1b+LSGYO2FqxDZ/cUa2gWRcV4nkNzyrAfqTRKtGmqBpxBSWzj
	IWPTGdd+xnrHm/xXH6KAlVXbw0KwbpNbaqKFFwRcJzZkAbZhUAWV42DLPUTXWv10hmin
	HW7rqxGf7J9IllWGXD1nQqM2SmEZxlicm6iDHvs8NzEqq0pdSHZ6207KUEfXE5zFtA0b
	OOV3hll7eK4sD2wvMQ5nT6woY+eDZKThyWR+3jWCOG+/3Qi6/ta5JgbWo5YOY+zkuIQ/
	7KEw==
X-Gm-Message-State: APt69E1wdb5pJAHktR/2OI53QjiTUTGndYvF6XvkLVYp8Jveybh65iMZ
	5doqknDNPLrjqncxboT5ipWUhnugCeDGhmNPX0/VXg==
X-Received: by 2002:a9d:2909:: with SMTP id d9-v6mr713801otb.258.1529669239815;
	Fri, 22 Jun 2018 05:07:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 22 Jun 2018 05:06:59
	-0700 (PDT)
In-Reply-To: <7de18b27-f711-3084-a073-0f9b490b8fbf@redhat.com>
References: <152966590354.870.11455841719190291898@d39dc562802a>
	<7de18b27-f711-3084-a073-0f9b490b8fbf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jun 2018 13:06:59 +0100
Message-ID: <CAFEAcA9xkxCBWp_RwOcs4p6eB-fVsjUEyewGCE6CdEAsAA8U3Q@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 0/4] ARM SMMUv3: IOTLB
 Emulation and VHOST Support
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
Cc: Fam Zheng <famz@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	jia.he@hxt-semitech.com, qemu-arm <qemu-arm@nongnu.org>,
	Jia He <hejianet@gmail.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z5lUy788oIeB

On 22 June 2018 at 12:33, Auger Eric <eric.auger@redhat.com> wrote:

>> /tmp/qemu-test/src/nbd/server.c: In function 'nbd_trip':
>> /tmp/qemu-test/src/nbd/server.c:1980:19: error: 'end' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>      *length = end - offset;
>>                ~~~~^~~~~~~~
>> /tmp/qemu-test/src/nbd/server.c:1940:30: note: 'end' was declared here
>>      uint64_t begin = offset, end;
>
> Looks this does not relate to my series or do I miss something?

Yeah; a change in the nbd pullreq slipped through that confuses
the elderly gcc in this patchew config.

-- PMM
