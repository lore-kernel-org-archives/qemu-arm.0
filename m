Received: by 10.25.0.144 with SMTP id 138csp240313lfa;
        Wed, 26 Apr 2017 04:50:21 -0700 (PDT)
X-Received: by 10.55.162.84 with SMTP id l81mr25668336qke.275.1493207421591;
        Wed, 26 Apr 2017 04:50:21 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 201si25280131qko.98.2017.04.26.04.50.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Apr 2017 04:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3LSf-0004Va-2n
	for alex.bennee@linaro.org; Wed, 26 Apr 2017 07:50:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bjsprakash.linux@gmail.com>) id 1d3LHz-0003Jp-Ju
	for qemu-devel@nongnu.org; Wed, 26 Apr 2017 07:39:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bjsprakash.linux@gmail.com>) id 1d3LHy-0006GB-SP
	for qemu-devel@nongnu.org; Wed, 26 Apr 2017 07:39:19 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:33087)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bjsprakash.linux@gmail.com>)
	id 1d3LHw-0006FK-Te; Wed, 26 Apr 2017 07:39:17 -0400
Received: by mail-lf0-x243.google.com with SMTP id 88so24543622lfr.0;
	Wed, 26 Apr 2017 04:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J30XkscGMXwlvzgSi9scQnvYGjLpbhzigafO8N9GAds=;
	b=SgeTLx1DqTlRSVHUucQ+3U8ZImAI8m4NBtjPtzzECX4eY+8e8OFu9XG5JkJSIph1zC
	fGozgmVtrDvKCN6Z6+eVRHFL3pyu4UPgNCW5sI/pSBa3N/GdvcxFCM29i5kQAxIziEli
	fypvhoSsPWR4XtLokubl91YTgVb8GMCmqQr+qwW5TJIrO0/CPbNECKtH/odRozMgYJun
	nxiX+Na+1nqXcGIDb/NFUCPO0hPs8Adgvk/0SdLkFPMWxFqwANnYCBMwnxNtW6Um3Oip
	CIQqJXBcYmliuJ4tZZ545Vqn++CgCSjtzK6sDt6N1mRk6ANXb26fvHgE1I0jlCPD+3Li
	4MHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J30XkscGMXwlvzgSi9scQnvYGjLpbhzigafO8N9GAds=;
	b=Iqejil2fx4U9QrC64D6cWf/vLVKzxzqbJbaqXobEXjyjF+uAd5wcH282QdWsfSc5sQ
	f2IRUNt6QMdxiorgWthszqjxiX994Md6+U+ZPUOptZ7OgOJgOcn5XLYB2CDGjLGSFPBJ
	d1RAGJtBnbbBPv1BCA/QL3NhtLqvEe+LIvCMWkfb+risCVRvQFcE0OwE3QrLmFACtaj7
	PYFYb/EM4pRZoy+OJn8A4HAfSxFIvSlkx/+cssp/RQImP1aJC3FrGgdTeU8927phRc3w
	iPrQUDRNiR/7qhWLWGXzhoLoD22/X5AlSmsv3D+ECiBiiII7GeOjYxmcde3OKmhH7SAI
	yp4Q==
X-Gm-Message-State: AN3rC/4W46EamH3CKuZFgELbsHuxQJEhpN6PUXeswtfcPnkWjcC67TrY
	aIBZfL0eLOT78U56DmyChUGCHyfE1g==
X-Received: by 10.25.99.22 with SMTP id x22mr10767762lfb.59.1493206755508;
	Wed, 26 Apr 2017 04:39:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.80.1 with HTTP; Wed, 26 Apr 2017 04:39:15 -0700 (PDT)
In-Reply-To: <1492173995-14140-2-git-send-email-eric.auger@redhat.com>
References: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
	<1492173995-14140-2-git-send-email-eric.auger@redhat.com>
From: Prakash B <bjsprakash.linux@gmail.com>
Date: Wed, 26 Apr 2017 17:09:15 +0530
Message-ID: <CACJhumf5KVCMD7jkcYBz9bFJPypbcZXoTS-TPZWD-g9z9OhQ=g@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-devel] [RFC v5 1/4] linux-headers: Update for vITS
 save/restore
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
Cc: Peter Maydell <peter.maydell@linaro.org>, drjones@redhat.com,
	Vijay Kilari <vijay.kilari@gmail.com>, quintela@redhat.com,
	qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
	Vijaya.Kumar@cavium.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aVo5vh2b5IGP

On Fri, Apr 14, 2017 at 6:16 PM, Eric Auger <eric.auger@redhat.com> wrote:
> This is a linux header update against 4.11-rc6 plus the non
> upstreamed ITS migration series.
>
> https://github.com/eauger/linux/tree/v4.11-rc6-its-mig-v5
>
> It aims at enhancing the KVM user API with vITS save/restore
> capability. Those are new attributes supported in the
> ITS and GICv3 KVM device KVM_DEV_ARM_VGIC_GRP_CTRL groups.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Tested-by: Prakash, Brahmajyosyula <Brahmajyosyula.Prakash@cavium.com>
