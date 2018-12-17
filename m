Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2622911wrt;
        Mon, 17 Dec 2018 07:26:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Uub/1Znrr84hLp7NHtWKo8clVY1Lsu6t8Hhdfgi3iaFLBRb17frjacit/r2FfvKzw+bEuB
X-Received: by 2002:a0c:c348:: with SMTP id j8mr13610407qvi.201.1545060372718;
        Mon, 17 Dec 2018 07:26:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545060372; cv=none;
        d=google.com; s=arc-20160816;
        b=EQOXLPChNVPdy1eVmK3vBS3Iib0Kp5W8KXlPTsI1BggCuo4oT5UPTM1Hzsu/iihm0S
         D0/zI8w1EEMcViqUdAz5pEWKF1Yn+dE0GTXkNoL/7r8pfHcnH4sFPJ87oAIPVIO7u79E
         f9TQ1Ej7egYYF3rtL65mMBC2GioERZz5pEJYlkbwKVl9/eNToL6m+bjw2+bbfSyr07Or
         +aesGpIOK1/gzOVOuUf1aIvikxLBcFldVCONOA9HIG1Z/TNo3fDWhfDlQU9s30bIB0qg
         o7GhATKd1nok2i0HetZ9Yanmb0fR/MSc59pZ5MGUc/Ty3puV7i9EkAhMeUPVJhJPA+wv
         hnJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=y5kQbBxJQQ0I/UXGsO7g71LmCMVyvvAf2s5mJVxrips=;
        b=BRoqjs//BKULOGOUHDqouw2sMLod+hMBD1jn3k2sIfMxVrpHRCDNM7VmJvArKojHpe
         2mZxW8tRLDuO+GwDphO6j9b8D46Kf0x5CdD6M6zoEZOhg4E2hnBU14NChjZmnzERBKdm
         txKcuE1mvjhoNBbGaUjlwdv38T3+Flno2AeDtgH2ixU7wqYc2kvmwNlyfVP2W46hwM9j
         V5w9Dz3ZkZ9wkCp5fHGah94dPSKvjoEn0NayBZWHmTLXsJA1+XzjDs70iXSNNrm+J6KU
         aiHmsNn6HLwYgNuByvLfXZ7f/twUdXz2vEONQckLpSMEbR6A4Gh28pd623H8gTRTPepS
         5bBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p42si830266qtc.174.2018.12.17.07.26.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 07:26:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47393 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYuma-0006up-77
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 10:26:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gYumQ-0006uS-Fv
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 10:26:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gYumM-0005a7-Hx
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 10:26:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60680)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gYumI-0005Vi-Np; Mon, 17 Dec 2018 10:25:56 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A812CC070E37;
	Mon, 17 Dec 2018 15:25:53 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-32.ams2.redhat.com
	[10.36.112.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C4461001F50;
	Mon, 17 Dec 2018 15:25:49 +0000 (UTC)
Date: Mon, 17 Dec 2018 16:25:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181217162547.696ce9de@Igors-MacBook-Pro.local>
In-Reply-To: <20181217140611.GC4456@caravaggio>
References: <20181217104838.18957-1-sameo@linux.intel.com>
	<20181217104838.18957-8-sameo@linux.intel.com>
	<20181217140611.GC4456@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 17 Dec 2018 15:25:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 7/8] hw: acpi: Export and
 share the ARM RSDP build
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Miedfabde3+R

On Mon, 17 Dec 2018 15:06:11 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> 
> From: Samuel Ortiz <sameo@linux.intel.com>

Subject should be
  [Qemu-devel] [PATCH v5 7/8] hw: acpi: Export and share the ARM RSDP build
                      ^^^
and without "Re: "

> 
> Now that build_rsdp() supports building both legacy and current RSDP
> tables, we can move it to a generic folder (hw/acpi) and have the i386
> ACPI code reuse it in order to reduce code duplication.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
> 
> V4 -> V5:
>   * Fixed the 16 bytes padding comment.
> 
> ---
[...]
