Received: by 10.223.173.107 with SMTP id p98csp58448wrc;
        Wed, 27 Sep 2017 16:49:12 -0700 (PDT)
X-Received: by 10.55.217.155 with SMTP id q27mr4567558qkl.323.1506556152273;
        Wed, 27 Sep 2017 16:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506556152; cv=none;
        d=google.com; s=arc-20160816;
        b=0zmhUzlqRzc1oP+C2qKx1/B0e1yrr65k8EUbzxADTeiJyyh4JJPyDW5G8MHppTfp72
         uJB+M55h2WrwajIC0JSgJ01uXz5RkpYJv5nCQfAIAK2sZBukl69VPLmjZa9Mn23IkhZJ
         3kedHQdVdOzgrWpP2oOpfy0CRG2fMpBj5e8RUe/78jTlURBPB1tVrcpmJcf1fQCw+BDH
         lQpoH2154tjlH5ET8tfWxVN5T8i8qUT7sAqIZN6DCHd+BPhvpFx97YyHG5SjiZpZyB77
         a9N5xZpEugsI7fs7e/GfqOsjjQhRcoLD4Qcuo1c3sNWrlhX0amPnnaBISM6PFPfVSd64
         p+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=JfFruNdqjcXQwJE5IXQQ0w79xVVSGc5e46fhDbdcIQY=;
        b=HJFKBda6H2Sk8wim1CLsvw1XuBS9V50VbJRSNt7NCYuYq7KU6lyrIqeLk9W4DcQ/30
         61Lz8gTIgjPFk95yvFawyJQWDUIOpfsh1tF6oPpTSw+JRbTLr0+ZR1ZlgWlAzZNnAeSN
         Y7Dr3yJa1OWORT4mw0iUsIr+M7Wuj8iRidrEo1OF+n1iRLOqalDp/3bxzFr7QJMqGVQx
         DUgx/cN9Q/d5jCPlen6snp1pBWggJiyQkAcI0OdNEzWJOqiAkEpvs6TDTg90ZTnRVE+S
         1yqZzjA/DhyEeh865wCoVxw/ILQXUzhwN/7ofBAJ3E5Kw8tU0bAfA0O3Kwlt+LzpPYVV
         FnHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g0Hok6CJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j68si185153qte.231.2017.09.27.16.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 16:49:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g0Hok6CJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxM4k-0000xs-39
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 19:49:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dxM3i-0000Zq-Bn
	for qemu-devel@nongnu.org; Wed, 27 Sep 2017 19:48:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dxM3g-00033g-Gw
	for qemu-devel@nongnu.org; Wed, 27 Sep 2017 19:48:05 -0400
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b]:43512)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dxM3g-000333-8Y
	for qemu-devel@nongnu.org; Wed, 27 Sep 2017 19:48:04 -0400
Received: by mail-wr0-x22b.google.com with SMTP id a43so19127695wrc.0
	for <qemu-devel@nongnu.org>; Wed, 27 Sep 2017 16:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JfFruNdqjcXQwJE5IXQQ0w79xVVSGc5e46fhDbdcIQY=;
	b=g0Hok6CJHDJ+GLy/s+Hud8kdflUBcoqO9yFurtuumTiHdZ2VvbkB9zvwByy9kNfi/+
	MsHaKkzxUzC/YWsb04NjZkpIboYCvUVF60OfHLSs2y8HqNsda2iSE86lPVZlb0BlZNvS
	BusF4cSVWOzTSshNpoXEkZgDRXGD+oyUdWoxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JfFruNdqjcXQwJE5IXQQ0w79xVVSGc5e46fhDbdcIQY=;
	b=ZNm3Xd+GDim1vM5j3PxiuKwd7ZejACkgZo1VHRQgv8gDAa7f9f5SwAGtltDiFFh5av
	xFIN7A4baC57yrZNRdiRWPClwDQk/fZhE0Ob8Bh6J9uLtRQDLeWNJVSYQ4AWFMhA6YZu
	xFgwlQ9qP29QpVYz58lAC8S8/RSiG2ODUpo17Dlpmr+wgXnkFD0WL0z0cydR6NQnc1L0
	MWdrTsryr26aEp4Ne/3OXZ+eSYSLoY2g/ip3n0QaeUkpIEJKF4l9te2IVY2Ua1mbDyGT
	706uMgMBm2XekxAh1RRW/8ZnKXBYXaf3UxJDfpKRhq8L/c18ITkSWqUNA+tJXxcRxQIY
	Ztag==
X-Gm-Message-State: AHPjjUiRNeH6wR4MIxZhjVBQWtCAY3QYSOKBnrXjweHL7nBMqdB2yLQp
	Q5Hrz1fdyJV6UFwSZASGeTYnk/Q+94dhQdpqQtkgVg==
X-Google-Smtp-Source: AOwi7QDQoeo8MNBry+M5XHN/YJYZsvihDK4ddFnOkOyhzVq57xIrUOTeHKmY8TjmBDjuK8wWdc9LflhrKFGjnwJVGxI=
X-Received: by 10.223.175.100 with SMTP id z91mr3139468wrc.177.1506556082912; 
	Wed, 27 Sep 2017 16:48:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Wed, 27 Sep 2017 16:47:42 -0700 (PDT)
In-Reply-To: <1788278d-9437-34a0-4a17-d7914d459f77@redhat.com>
References: <cover.1506384414.git.alistair.francis@xilinx.com>
	<e9eb34b7a508fbe3b89bb8b8aa8141f018871081.1506384414.git.alistair.francis@xilinx.com>
	<1788278d-9437-34a0-4a17-d7914d459f77@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Sep 2017 16:47:42 -0700
Message-ID: <CAFEAcA_G8Md3k6EAqoN1=GCcXoCq_8vAUZ_qjOZp5GbnnfmcrA@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22b
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v1 1/8] Replace all occurances
 of __FUNCTION__ with __func__
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <famz@redhat.com>,
	Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Yongbok Kim <yongbok.kim@imgtec.com>, qemu-arm <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Alistair Francis <alistair23@gmail.com>, John Snow <jsnow@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g4dNaSXk85Cg

On 26 September 2017 at 06:32, Eric Blake <eblake@redhat.com> wrote:
> On 09/25/2017 07:08 PM, Alistair Francis wrote:
>> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
>> index 58005b6619..32687afced 100644
>> --- a/hw/arm/nseries.c
>> +++ b/hw/arm/nseries.c
>> @@ -463,7 +463,7 @@ static uint32_t mipid_txrx(void *opaque, uint32_t cmd, int len)
>>      uint8_t ret;
>>
>>      if (len > 9) {
>> -        hw_error("%s: FIXME: bad SPI word width %i\n", __FUNCTION__, len);
>> +        hw_error("%s: FIXME: bad SPI word width %i\n", __func__, len);
>
> Not this patch's problem, but it would probably be simpler if hw_error()
> were a macro that automatically prefixed __func__, rather than making
> every caller have to supply it themselves.

I'm not sure there's a great deal of benefit to that change, because
use of hw_error() in new code is rarely correct (it does an abort()
so it should never be used for guest-triggered conditions, which is
about the only time that you might be interested in a guest register
dump rather than just asserting). Most of its existing uses are in
crufty old device models.

thanks
-- PMM
