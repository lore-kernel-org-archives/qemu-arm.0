Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1091249wrq;
        Thu, 12 Jul 2018 01:05:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc3i5MJH+RWQUa4QvxTtq8pDK2LrmfQGOQO6x6h6jOUUCEDCofci60ZGPcVdUBR74VI8amc
X-Received: by 2002:a37:1224:: with SMTP id c36-v6mr890399qkh.26.1531382705828;
        Thu, 12 Jul 2018 01:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531382705; cv=none;
        d=google.com; s=arc-20160816;
        b=rSfGkQ9580JTCbClEB7zxio+vxsGIskSEyr+CIL40hAZlhy6+e8E+ZfBezcgl1o3Rw
         LeCe25/VSoWyvJRe83Bnze8a+HWU+wzEC/hg3oJSwSfrczB9fY8pU4QP+ShXnzkHNcbz
         k3kDO3PFOKmKBVFt/qbvWnmdmeNKga55lrv7MhsbUfpqgx902lGsFMG21SpdFzSLfKwz
         E6Vg1v8Yhq6qbGKCviNvpsqS4OrrCWK4h3Hvd0j8rdjh9jVnnhPEJxByaJQ8PapHLvcV
         nGDOs/ZIPcjYMJTcEIOGCrD4pF5DRKpmPSE3gXqfCuqghXESrP8yd4AdiOWMo/G53/42
         Uflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=nDSx2d4fxlddgJ0Etw4IpKSzyBLSejGxTbPcKHraLS0=;
        b=x1qmTuQrcW16gHw1W5Chr8WT4miZJXPTTJkVQERyGQa5v6vZDprPW9Q/TnS1ViS6c3
         hsktmQMJEVJWn+1gSJdI6Gt7UH24GPNQB06YPj0VKWD+Hh3wRIjqAwP904CaeggvDh2w
         Risg0XOeKYfku3Iopu2jabGjp83HbZKdOVOMpHOwfQr0jHGVPXv9g6va9E5VMwBdNi/4
         6QM3WpZR8w50ZNLmH13x38CQq+IW8QrY9DK0PbbQWNi3b7jTgUM3WNQmvEB+hEF60qH1
         lHzL12At6GT3m+NFNdVbMzIxDINi2QGnLKgBylCLqxDlBob/4hmdSYqsJJrVSi9FStzc
         SzKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a125-v6si1485513qkb.47.2018.07.12.01.05.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 01:05:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57917 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdWb3-0003wQ-E1
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 04:05:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fdWaw-0003wH-AT
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 04:04:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fdWaq-0001kM-Hq
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 04:04:58 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38969)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1fdWaq-0001jy-B4
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 04:04:52 -0400
Received: by mail-wr1-f67.google.com with SMTP id h10-v6so20671756wre.6
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 01:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nDSx2d4fxlddgJ0Etw4IpKSzyBLSejGxTbPcKHraLS0=;
	b=i8FRhsWgsfJZsZk9nRjYMUYf3HPgdKtgYCltMyytA4GWUTKWMpp2tr3EdA1FA18a7H
	3xoErs0OcVm8Fffp6vXvtl4TcePKPjhfDKkXeSBQkLTejeZVb0oPHZgn0JOpleUI1XRj
	/rNmbKl0+T9G1KnUelVAaVQB9r3MP0kzGMTfREhCbhR+wZHe3+0xlhiy4v7A+1WEQ4Be
	nu+TYB3DO6cBMJaU0H2vJO4GRDYXFsKW86RJcXKOEgrNxR+A710SVnCJKPLs+uEHl9ez
	EZV5W8isVVROZDvw4l5ng13oxh0qXx7sUaxuyD9GIEHw/qPCphWISd/EvkXSN3s5wS03
	aH5g==
X-Gm-Message-State: AOUpUlGl88WmU3GcG+fmxylylPajDp1J0+xlmyUbCIB3HQH+sWKwBjYP
	/r5BVM4bduamYMKSfwU+rz24DA==
X-Received: by 2002:adf:9051:: with SMTP id h75-v6mr757573wrh.65.1531382691262;
	Thu, 12 Jul 2018 01:04:51 -0700 (PDT)
Received: from [192.168.10.150] (dynamic-adsl-78-12-151-35.clienti.tiscali.it.
	[78.12.151.35]) by smtp.gmail.com with ESMTPSA id
	s13-v6sm22151073wra.22.2018.07.12.01.04.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jul 2018 01:04:50 -0700 (PDT)
To: Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
	<5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com>
	<CAFEAcA9GspXJg2ioLrCknBgYHJ9f6qvM=n=y0dLeU12yv_5ETA@mail.gmail.com>
	<955f26d7-5a0b-28e0-bd0f-f663593afefe@redhat.com>
	<1be41104-d896-b03b-e0f3-47ea9c3b333f@redhat.com>
	<20180711195924.GC7451@localhost.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8275fafc-7f3b-616e-5702-7595ed1466be@redhat.com>
Date: Thu, 12 Jul 2018 10:04:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180711195924.GC7451@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/bcm283x: Fix crash with
 device_add bcm2837 on unsupported machines
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6lgCTNmij8zs

On 11/07/2018 21:59, Eduardo Habkost wrote:
> 
> What exactly guarantees there will be no other references to
> (e.g.) `&s->control` when `s` is freed?
> 
> We know the references added by object_initialize(),
> object_property_add_child() and qdev_set_parent_bus() will be
> dropped, but what about other code calling object_ref()?

That would be a bug.  This is in fact the reason why
memory_region_ref/unref exists---to take the reference on the "outer"
device object rather than the contained memory region object.  It's not
pretty though.

I've thought of generalizing the pattern to Object (object_ref adds a
reference to the container rather than the contained object, and
finalize takes care of finalizing the contained object too), but I'm a
bit wary of doing it since it would complicate things further and
(except for MemoryRegions) it hasn't been a problem in practice.

Paolo
