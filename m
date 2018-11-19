Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp781147wrt;
        Mon, 19 Nov 2018 04:28:33 -0800 (PST)
X-Google-Smtp-Source: AJdET5d9KuqdBKXh0nTOCUUWcbL/EzqTyJ8kX4MuIOdm89ymwnLyO9BvFQ3mbrc7dV2rCzx6er7a
X-Received: by 2002:a81:4a42:: with SMTP id x63-v6mr20939710ywa.3.1542630513514;
        Mon, 19 Nov 2018 04:28:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542630513; cv=none;
        d=google.com; s=arc-20160816;
        b=CDSUnobh0EHczBUG+XEDHGQyL0TRJmEzfG4VyD2qM6xC3o4V+VaeqsUfF62fs/5b+U
         Bv07kpdJFJ3iRWH/1lxGrLgqpSrCmyEohg3WZsxkugIgoPE6Ye3vxfIhptAWbJyKCrYr
         QidMEUg9M94jBTJk3BSdnUsiB5sXwZ7F+e3aCReHLh2MWbT5eSiMhWM5dUdMWMcTjVqs
         aWh41DNQBYexIv6ANzY7ZI3SUxIwfVqGxq64qkvzsR32xLlsAk2owLXw3a5qIGoeYtYa
         l7dLLKd1R1YEPz+G77DhLvZ1NtoMogaHKyvbh3/gX7GL95mcsUd9gSwnl+vz+LTduxnw
         IDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=GMBaGk7/c5RgE5W4sOc7ZIvOBM6+KpDFts1EBqchGzc=;
        b=hb92/y89j/lKgZLZZxik8SRndX8xb7Xt/N9Sw/lNJnliOFyQZtyFMOR26/Ct/rFuY9
         BQJq2UlGJpr/RR8SiXKOlTdlSMnkLm8IYeZLiUkMWYoha+qV0L98EvZiqLuam+IVWIBf
         WxGIy8SHybNvuU9mZPEtYqVSemAbVnz5hjI+7VlpJHKl/IjhPxy6V+f/22JfG8XRKlnx
         JQ6WwBcr1lmpesrCQ2HL2LBdXczxAgPisjJiPR45fJqWTVmS/7sfRXHnXsu2IDhKLpK9
         73t/2DRRBQeDGItNhYNDMyv0j1S474A0P8GfGLdw9n0wtb72LN8cP1sKGVrlNq00bVdv
         AfbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t185-v6si6725525ywd.214.2018.11.19.04.28.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Nov 2018 04:28:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55683 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gOifI-00022p-T3
	for alex.bennee@linaro.org; Mon, 19 Nov 2018 07:28:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1gOif6-00021E-Hd
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 07:28:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1gOif3-0001p8-Bi
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 07:28:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1gOif3-0001ok-3a; Mon, 19 Nov 2018 07:28:17 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0232F307D842;
	Mon, 19 Nov 2018 12:28:16 +0000 (UTC)
Received: from gondolin (ovpn-116-165.ams2.redhat.com [10.36.116.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41C07614C2;
	Mon, 19 Nov 2018 12:27:44 +0000 (UTC)
Date: Mon, 19 Nov 2018 13:27:40 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Message-ID: <20181119132740.2e948b4a.cohuck@redhat.com>
In-Reply-To: <20181119120820.29878-1-maozhongyi@cmss.chinamobile.com>
References: <20181119120820.29878-1-maozhongyi@cmss.chinamobile.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 19 Nov 2018 12:28:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 00/22] QOM'ify SysBusDeviceClass->init
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
Cc: peter.maydell@linaro.org, david@redhat.com, qemu-devel@nongnu.org,
	alistair.francis@wdc.com, kraxel@redhat.com, gxt@mprc.pku.edu.cn,
	sstabellini@kernel.org, qemu-block@nongnu.org, mst@redhat.com,
	armbru@redhat.com, borntraeger@de.ibm.com,
	marcel.apfelbaum@gmail.com, anthony.perard@citrix.com,
	marcandre.lureau@redhat.com, rth@twiddle.net, thuth@redhat.com,
	ehabkost@redhat.com, richard.henderson@linaro.org,
	chouteau@adacore.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	jan.kiszka@web.de, xen-devel@lists.xenproject.org,
	david@gibson.dropbear.id.au, kwolf@redhat.com, f4bug@amsat.org,
	mreitz@redhat.com, michael@walle.cc, qemu-ppc@nongnu.org,
	pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eYy+Gdn36DKr

On Mon, 19 Nov 2018 20:07:58 +0800
Mao Zhongyi <maozhongyi@cmss.chinamobile.com> wrote:

> The SysBusDeviceClass::init() interface is considered
> as a legacy interface and there are currently some
> efforts going on to get rid of it. Thus convert 
> SysBusDeviceClass::init to DeviceClass::realize.

In case my comment to the s390 change comes off as negative: I like
getting rid of the legacy interface :)
