Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1050832wrq;
        Fri, 15 Jun 2018 09:31:45 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLIQeKmhuE9fqom2FQQ5MPjrmHZnYD1XLal4GFb6RjP06v0y/bz2OIWptrS1vIOeM1zSL/F
X-Received: by 2002:ac8:3fb2:: with SMTP id d47-v6mr2038247qtk.401.1529080305749;
        Fri, 15 Jun 2018 09:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529080305; cv=none;
        d=google.com; s=arc-20160816;
        b=TyrHVd0g/qhHm+ux4QrNAxzvRXiJHzKTUiexZgHij52ljvblIJWoRshKC9ogbKVGFp
         wHzMlraLwMnIPUuuxGUELeucMVecidtHp7J/6uNS9IfwfYnIbWOClY0MvZ70oNj+6EiM
         TLNIxEG0U96ZueA/64+D8C4emhSCMZgU+oDjgiZkjZbmXHEAtq+6i6hVR3zPUyDk9oFn
         HRuCIcQioHYCt274bGSQH+k9SoYbwiom95ySw7R6cOBATnbEyiKM29alaYuYd5C95VH+
         GMbYff5mm0SNDvcXcyFP85M1bexRj5ODrqC1kwBpZw1+lz7HoB/+xuVLIaj5ZAUaHRV7
         jB0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=UxJqR0QEXBmjYZysbEjt7gAkvRAkxb4KkqAG9Z72StE=;
        b=RwKB0OkB9hr1sMrpe+a+6qH7KMrjuzjqhgVfnPRSbqHDVmLrhF9MXG2mLknTNksMy5
         la+7iF5S8u/csTKxD4iloGKEpaosvQGrN1o4BzrAI50sKUDlk0kbotZk57f5nzL5Vsoy
         Oe5og0vho22tOKGxuiSwKSNP/SLIQkEHeVVKnKX6vagDiTv4S0axkHOxTksjQjvIlZKF
         69UO7SuNipxuNsIe63WfCDn/apPhHRzXIbh+cy7U83V8KaJjAEiRAQmK/jR641kGHVYU
         A3nZUO/cgtBkYTXUif3zwdWFdTgkxayK16OjTHrMlZF/AouFAOMVXmIFIgWy27qgzjdV
         +YxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jZ8cOnqH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u20-v6si8207730qth.247.2018.06.15.09.31.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 09:31:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jZ8cOnqH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTrdZ-00005w-6t
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 12:31:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTr3Y-0002f6-QQ
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 11:54:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTr3X-000088-Oy
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 11:54:32 -0400
Received: from mail-ot0-x234.google.com ([2607:f8b0:4003:c0f::234]:45986)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fTr3X-00007p-IX
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 11:54:31 -0400
Received: by mail-ot0-x234.google.com with SMTP id a5-v6so11492262otf.12
	for <qemu-arm@nongnu.org>; Fri, 15 Jun 2018 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UxJqR0QEXBmjYZysbEjt7gAkvRAkxb4KkqAG9Z72StE=;
	b=jZ8cOnqHj6fwaCYeFjaO2qs2YVQx4RRJhxA6bccWhioyynGouxGzVAbf5FZ7G3sEkF
	B/384COyRrM6/Xx9E91cVjtqRWkw4+pNBUb2bPTzVcJQbf3ozdZ54FoRHkjbA7nVI2Bh
	q/GodQqLfmCBthPdTSh7aTNhmF+jcuWTZ/8XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UxJqR0QEXBmjYZysbEjt7gAkvRAkxb4KkqAG9Z72StE=;
	b=JDKkkysw9sJHN5MqaAZ26w3gEDTm50VdRNMIqCo1r89XE9xAiIAGosEbnqoO6TjBd4
	L+jra2MgBUwdyrjFAOb0oxPxCklSUEyIMcagp9oFcpJVxyLhCSNowTuFrtX70d8XTX4X
	Rtk+sDOQ1FsPPxh/teFjoCit8Cjx294jMrjWm7Dy8nehwMaMMboTFU4OyeB8Ezoq54Ix
	2rQiDHQHNqoRHmq7a5rPHaW999fNzUunJa6RtkiEZeI4NBXXvwWLv8d6m86JLzF1rjeg
	L9B8HIa57th3mtUwZrqdMLt9eIBbQUBqk8SMiK1HYm4cTkZjD4ZIyRovjC99G7S429M+
	ZJqw==
X-Gm-Message-State: APt69E3mc63M0AOgwOxzKIxRoXFOji7wnr4mEVhmQVpn0pqcb6dZhPPc
	eYOFfuWweUJkkDgmVCDS6UyLxyIbQgdh7a+68fRpoQ==
X-Received: by 2002:a9d:3d76:: with SMTP id
	a109-v6mr1435310otc.294.1529078070727; 
	Fri, 15 Jun 2018 08:54:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 08:54:10
	-0700 (PDT)
In-Reply-To: <20180615154441.4rr5mtcnran5cf3s@kamzik.brq.redhat.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-7-shameerali.kolothum.thodi@huawei.com>
	<bd67ed40-81d6-58dc-ccaf-efd8a40ca96f@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8386F6E04@FRAEML521-MBX.china.huawei.com>
	<20180615154441.4rr5mtcnran5cf3s@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 16:54:10 +0100
Message-ID: <CAFEAcA-nG4Xv=PmxzW3tzs-TStziMDHMFxYi6_teSe1GhLH=hw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::234
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 6/6] hw/arm: Populate
 non-contiguous memory regions
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
Cc: Zhaoshenglong <zhaoshenglong@huawei.com>, Linuxarm <linuxarm@huawei.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WlKOqKzmAAiW

On 15 June 2018 at 16:44, Andrew Jones <drjones@redhat.com> wrote:
> If 0x40000000 falls into a reserved address region on some host, then
> I'm afraid the mach-virt model won't work with those devices unless the
> guest doesn't use UEFI and Peter is open to providing a machine property
> that one can enable in order to move the base address of memory.

Why should the VM ever care about where the address regions in the
host happen to be when it comes to where it's putting its RAM
in the VM's address layout? I feel like I'm missing something here...

thanks
-- PMM
