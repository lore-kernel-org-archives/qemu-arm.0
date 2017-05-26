Received: by 10.25.0.6 with SMTP id 6csp254865lfa;
        Fri, 26 May 2017 04:21:27 -0700 (PDT)
X-Received: by 10.55.98.147 with SMTP id w141mr1371044qkb.90.1495797686890;
        Fri, 26 May 2017 04:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495797686; cv=none;
        d=google.com; s=arc-20160816;
        b=NYla5dWCBwgkP3pWc03EfOfuf6sanWoTdOSpL8WaUq9nqEdJKi1iBLx5wS65L2naJ7
         tWLqeyqneUz3Y1xM+wqvGmL3sS63JFCBeb8zitWsLbpW1aJ8LoEtMv4nTv7xyPL22Lkv
         Yms/CGezXgS9VT19AVFEtAh2CXUSJIBrQnCSQC3c9M2lgI2FBcGnqYKJxrCvadC/QjPm
         TWCwnW5Jp5dOhgTlL8CCl9C09VhdGUhtw6jUjPD9atHMVzEZZj4ilGMTbrkh8xuok1FB
         8eudjd5x6OkMOvOmhcFcPXPfnzSx1Yz23ywRejdLKe21ZsC8c2XH89bS1R4pxtWsmBYK
         oQVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=e7k2BMvAD0jGYhBKVP/GGTgoEDk5iifdvXTB0ru3y+k=;
        b=hvqPJWMJ28tfnvL6ZncFcn6MpKSJhSDRnw+Un2pOYm/eTp0pZ6jxl9xwl00Cohv32U
         HxBIO3KcAkoxSVUJqPlH598Itprx9ubQwYKI3DNAxTDLQuz1wbmk22QFndDSTNC1uKya
         IhA+x74hSZMkRwwyr4vLqd6aOwMaDS2GmU6nV2jt+8e73p9hCBhhtpwLExaAvZS3Sfv2
         VQOYi5MP6T7GeDVtKVVYiU1pGf+0EI/7GZrRFBKXNL5q2DBeP6Gk8DKitQc3HM6Dze7U
         iJLMv/2eRD6Wyb+vU+UQ+4MSP77sz5p4u4E0ZWKxGiggryeleI06PBr/V1V2i/RSaGvS
         DCMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z51si480952qta.165.2017.05.26.04.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 May 2017 04:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dEDJ8-00058N-98
	for alex.bennee@linaro.org; Fri, 26 May 2017 07:21:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dEDJ4-00058E-EP
	for qemu-arm@nongnu.org; Fri, 26 May 2017 07:21:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dEDJ1-00063M-A8
	for qemu-arm@nongnu.org; Fri, 26 May 2017 07:21:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54694)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dEDJ1-000638-4S; Fri, 26 May 2017 07:21:19 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B988380045;
	Fri, 26 May 2017 11:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B988380045
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B988380045
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60E5F7C74C;
	Fri, 26 May 2017 11:21:16 +0000 (UTC)
Date: Fri, 26 May 2017 13:21:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Li Zhang <zhlcindy@gmail.com>
Message-ID: <20170526132114.6edc006e@nial.brq.redhat.com>
In-Reply-To: <1495790468-23862-1-git-send-email-zhlcindy@gmail.com>
References: <1495790468-23862-1-git-send-email-zhlcindy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 26 May 2017 11:21:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/3] arm/virt: refine virt.c
 code and implement hot_add_cpu interface
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Li Zhang <li.zhang@hxt-semitech.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Y5o/H5S0Hkh

On Fri, 26 May 2017 17:21:05 +0800
Li Zhang <zhlcindy@gmail.com> wrote:

> From: Li Zhang <li.zhang@hxt-semitech.com>
> 
> virt machine doesn't support hot_add_cpu interface. This patchset is to implement
> hot_add_cpu interface. A CPU can be added by QMP command with QEMU monitor.
> 
> Here is command to add a CPU with QMP command.
> 
> * qemu-system-aarch64 -machine virt -cpu cortex-a15 -smp 1,maxcpus=4 \
>     -monitor telnet:127.0.0.1:4444,server,nowait -nographic
> * connect monitor:      telnet 127.0.0.1 4444
> * execute qmp command:  cpu-add 1
cpu-add command shouldn't be used for new cpu hotplug,
pls use generic device_add for that.

The last time I looked at it, virt machine needed quite a bit of
re-factoring of the way it creates/wires up CPUs.

Pls see usage of following callbacks for example on how to implement
device_add based cpu hotplug:

  get_hotplug_handler
  pc_cpu_pre_plug
  pc_cpu_plug
  pc_possible_cpu_arch_ids

and pc_cpus_init() for initial cpu creation with above callbacks in use

> 
> Currently, when KVM is enabled and add a CPU with QMP command, QEMU 
> reports error "kvm_init_vcpu failed: Device or resourc busy". KVM can't
> create a new CPU when vgic has been initialized and irqchip_in_kernel in
> function kvm_arch_vcpu_create. It needs to change KVM code in the future.
if KVM isn't capable do it yet, then qemu should refuse cpu hotplug if running
with KVM accelarator and allow it only in TCG mode.

> 
> Li Zhang (3):
>   arm/virt: Refine fdt_add_cpu_nodes code
>   arm/virt: Refine code of machvirt_init
>   arm/virt: Implement hot_add_cpu interface
> 
>  hw/arm/virt.c | 344 ++++++++++++++++++++++++++++++++++------------------------
>  1 file changed, 202 insertions(+), 142 deletions(-)
> 

