Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1074799wrq;
        Fri, 15 Jun 2018 09:56:19 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKItPRBYrP8qB3GKDXg9WmMLGguDTyO2B+Ark9u57oZxklN1u6rHppEPyrIK/58tqparrJxW
X-Received: by 2002:ac8:21a7:: with SMTP id 36-v6mr2247123qty.252.1529081779614;
        Fri, 15 Jun 2018 09:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529081779; cv=none;
        d=google.com; s=arc-20160816;
        b=zyrJSsD1m8ZV44y6tpi59gtokfyMGTI8xzyvBy3Tv8irHPIEusgy6sHTjEk7Jq9E+N
         agMakalBmh0fpm7fJUUMVeBXS1IfODcYkASziPr1lectsuwor47JYOXtR5G/UXOumCVI
         jtTW5JPZ9PiakWBMgDCuZZolUwtBHs1Hw65653H5/sZTC9O4XhLupcRjpFSkJ+PaJ1C3
         z9AtNPdYEzEGQLQJZikyBpR+csW7BpmuaGkcpGt8YmzhcOuwqStiTYEhtxnQs56UkePt
         azBEWVaruV5gqqlehPhJIXMp0miswetxEZaXOPstx0tZM88e0816RAGvMYtbcbAaT7C0
         cQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=rB7u2XQBM3jfgEuZEp0ZBp60LoxFC0bubPJSUU8ckSk=;
        b=lBz68d4p6aAJIsvtjXXgwACGr6Jnd7AB/WtPBFwiaZFJdhzczbpUWT298rKzPO9ghp
         PHrvNsPPJfNXcZOhr2ULJSAnBaMy+U7Nt+z4/EcTy0acMT5TFxaEMH35ytWdH5LhY03P
         D8kbg3RfhBY2ELiB4ah4G8NU57Tc5YWK1A/4jgayfoHObbi5QFtjSuLMZtlEw354Zn4w
         YxCT9Ew8j1Hep0paMIWsNK/V+tUPZd3FPdjdHQz0r+EX80IDKJnsOD2nVQASwPZUyeXu
         TN6ff0GUK9HfnP9/Vv8eqGwgNpc+btfAtQV2A7R9yoNq38O8R+SO3hbiA+GCPFch34dN
         pcPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2-v6si3757987qto.125.2018.06.15.09.56.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 09:56:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTs1L-0003iJ-58
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 12:56:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fTrrj-0004Gr-4K
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 12:46:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fTrrf-0004ug-V4
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 12:46:23 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46074 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fTrrf-0004rP-Ox; Fri, 15 Jun 2018 12:46:19 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EFF7402312B;
	Fri, 15 Jun 2018 16:46:13 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-39.rdu2.redhat.com
	[10.10.120.39])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58B521102E22;
	Fri, 15 Jun 2018 16:46:05 +0000 (UTC)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20180613122948.18149-1-kraxel@redhat.com>
	<20180613122948.18149-2-kraxel@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <2ba29a71-5d92-cb66-6893-a4b9d017ed0b@redhat.com>
Date: Fri, 15 Jun 2018 18:45:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180613122948.18149-2-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 15 Jun 2018 16:46:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 15 Jun 2018 16:46:13 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 1/4] hw/display: add ramfb,
 a simple boot framebuffer living in guest ram
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PZIg7pygjx5j

On 06/13/18 14:29, Gerd Hoffmann wrote:
> The boot framebuffer is expected to be configured by the firmware, so it
> uses fw_cfg as interface.  Initialization goes as follows:
> 
>   (1) Check whenever etc/ramfb is present.
>   (2) Allocate framebuffer from RAM.
>   (3) Fill struct RAMFBCfg, write it to etc/ramfb.
> 
> Done.  You can write stuff to the framebuffer now, and it should appear
> automagically on the screen.
> 
> Note that this isn't very efficient because it does a full display
> update on each refresh.  No dirty tracking.  Dirty tracking would have
> to be active for the whole ram slot, so that wouldn't be very efficient
> either.  For a boot display which is active for a short time only this
> isn't a big deal.  As permanent guest display something better should be
> used (if possible).
> 
> This is the ramfb core code.  Some windup is needed for display devices
> which want have a ramfb boot display.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/display/ramfb.h |  9 +++++
>  hw/display/ramfb.c         | 95 ++++++++++++++++++++++++++++++++++++++++++++++
>  hw/display/Makefile.objs   |  2 +
>  3 files changed, 106 insertions(+)
>  create mode 100644 include/hw/display/ramfb.h
>  create mode 100644 hw/display/ramfb.c

I tested this on KVM, built from Gerd's sirius/ramfb branch @ 778450b87275. Works fine with Gerd's corresponding edk2 QemuRamfbDxe driver (already merged):

  [edk2] [PATCH v3 0/4] Add QemuRamfbDxe driver
  http://mid.mail-archive.com/20180613072936.12480-1-kraxel@redhat.com

It also works fine with Ard's efifb patches:

  [PATCH 0/2] efi: add support for cacheable efifb mappings
  http://mid.mail-archive.com/20180615104818.23013-1-ard.biesheuvel@linaro.org

So, for this patch (not the series):

Tested-by: Laszlo Ersek <lersek@redhat.com>

Thanks!
Laszlo
