Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2639425wrt;
        Thu, 11 Oct 2018 08:14:48 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63go3p2ezHY6Oq8mlXAGHvtJ3SWt3BcmhCoZCaBmis513Nica+bkfymHma9Jqm/bC82HrV4
X-Received: by 2002:ac8:3509:: with SMTP id y9-v6mr1920992qtb.241.1539270888129;
        Thu, 11 Oct 2018 08:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539270888; cv=none;
        d=google.com; s=arc-20160816;
        b=Y3ZCmdmedAznNsZ61UnOBdV95R/bHe2GoddjGs5VLwN+yi+9F+eFLXCpcO5aLXPL2q
         o89eLnVPELgYEEqKVQZ17My0MNZI9urHg/Q6Mj0vgePXr5ZDoomBzEekIQPLngLY/SLV
         qqoMEW+MD5d8UlfGaD3GZ/s2k3Qktb/Uo/LvO9O4z8M6zZzeG2WZ9Jf1Fx5Cg/sPUsV6
         2uu22AVhP3qFdVEypm0QbqPQqK4IeLnYiHFqIojwex69Ut93+I/pL0r914DUn4Msn9ca
         Bf/oT2FZC1QNlPg9UhN+FxkjjUKSxPQb0duxut6azk5MRKpxIg65oarwpwt+blIXUN+8
         ulxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=EqKyZVX316w6NQCz+iWUe8Dt8F4HovOd50nad98FM1M=;
        b=Q5MgL2SXgGofT67vpJlVUMqCjvJNTJQZstz/isn+I+yOJBCyaNGiXeik534kKGW0/D
         FKoQgven7jpySceeJZIMzYeaiEETHsaOKpdQjH6jX/jUHUILoKievxqX0WJ4vBLVEGkP
         IJxuP92r0M61XlzibgtdRtG7fsUYzilkwV3xuRqKQ88clAlYom3tbGNfDrAecpjOEt3T
         oTq+UiTWX6XubBzahAlXjDGzVCt595BHCcIsA6tWZHhjNkyZtptRA/lDkMaR7rAuv9LP
         +CUagd4ZnhFsI8crx9YS4Q4aEo6igPxUva/FMYnGRm4Cszqg7hgKCUumy8Qz1p+DFMqm
         3r1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j14-v6si587584qtn.320.2018.10.11.08.14.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Oct 2018 08:14:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAcfn-0005im-It
	for alex.bennee@linaro.org; Thu, 11 Oct 2018 11:14:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gAcfZ-0005iP-UV
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 11:14:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gAcfO-0005Vq-Rg
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 11:14:26 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54908)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1gAcfK-0005Tp-La
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 11:14:19 -0400
Received: by mail-wm1-f67.google.com with SMTP id r63-v6so9397835wma.4
	for <qemu-arm@nongnu.org>; Thu, 11 Oct 2018 08:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EqKyZVX316w6NQCz+iWUe8Dt8F4HovOd50nad98FM1M=;
	b=CfEbzzU4Tg8LBJ8KHN7Lo49l21TmhgoDvLcvIaM+5IfPZC5cXuvlg9bvXVu7YPwnvn
	yJ0XeFYnfMWFpdcfPOXISgUfuR1vo872eYuL99yTXMJD11M06WzLrd09odF6ZXxptypd
	XpsbfI9ZV6Jb0TByP5VPsRosGNYkCbH1NLCZnNBYYRcXIUEFFTCxQo8eeL3aDLOFXTHh
	X8B+WztpGRN97+jfFUlOF+v6DaOj91XzqluMUEdH7HVct0Xbba6ffTSjynFil47hGp64
	Sbd/PD2zxSRyTs0/2P7ANHFq8Hg0htHoKFJniwqhYKLOYBy6xWkgZjI8EPJaut9ls+Ot
	TlIw==
X-Gm-Message-State: ABuFfojJpuyQx9PjlqAbEyPRaJVWfEZQ7/viQYXezyXBVlJJUhhIIJ/o
	szvYHmsZuyH/KJlnHPd4VlYbhg==
X-Received: by 2002:a1c:e08a:: with SMTP id
	x132-v6mr2205674wmg.60.1539270855097; 
	Thu, 11 Oct 2018 08:14:15 -0700 (PDT)
Received: from [10.32.181.140] (nat-pool-mxp-t.redhat.com. [149.6.153.186])
	by smtp.gmail.com with ESMTPSA id
	j128-v6sm18047062wmb.43.2018.10.11.08.14.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 08:14:14 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Prasad J Pandit <ppandit@redhat.com>
References: <20181011131413.22208-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7762db82-6044-df69-a1b7-c05100a0e938@redhat.com>
Date: Thu, 11 Oct 2018 17:14:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181011131413.22208-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] chardev: Convert IOReadHandler
 to read an unsigned number of bytes
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	Jason Wang <jasowang@redhat.com>,
	Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Clark <mjc@sifive.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Markus Armbruster <armbru@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	"open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
	"open list:PXA2XX" <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>, Zhang Chen <zhangckid@gmail.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
	Michael Walle <michael@walle.cc>, "open list:sPAPR" <qemu-ppc@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J9vk3JTxeAob

On 11/10/2018 15:14, Philippe Mathieu-Daudé wrote:
> The number of bytes can not be negative nor zero.
> 
> Fixed 2 format string:
> - hw/char/spapr_vty.c
> - hw/usb/ccid-card-passthru.c
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> See: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02212.html

Not that easy; you need to adjust qemu_chr_be_can_write,
qemu_chr_be_write_impl, qemu_chr_be_write (which is where the callbacks
are invoked).

On the other hand, fd_chr_read_poll is not an IOCanReadHandler, and this
patch therefore probably doesn't compile?

Paolo
