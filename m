Received: by 10.25.208.211 with SMTP id h202csp1090318lfg;
        Wed, 16 Mar 2016 03:32:31 -0700 (PDT)
X-Received: by 10.55.72.67 with SMTP id v64mr3836980qka.101.1458124351343;
        Wed, 16 Mar 2016 03:32:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f11si2735511qgf.11.2016.03.16.03.32.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 03:32:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:54571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag8kg-0003kd-Sw
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 06:32:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag8kZ-0003bE-LY
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 06:32:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag8kY-0004y3-IO
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 06:32:23 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35886)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag8kY-0004xl-EA
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 06:32:22 -0400
Received: by mail-vk0-x22c.google.com with SMTP id c3so55837760vkb.3
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 03:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9ZogpoWVmeaFvFqVmDqR36Y8wXV5AjQqqJtIeenDktc=;
	b=a+xpnl93CLrrq9LQDSKe7SxNWAQwwzSHKBupZAoOAUDzIBlBz7NXXwk6DexO1DWRUt
	lJ/G7sI4GND8aeRMiA3U/8h9oNpl/tXOBU3ru03cpaF5w9rtiJEr6ieIbBWR9kt0CyDe
	73mWVu689thikieHbuYlLCpNknlhn7ep/GWv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9ZogpoWVmeaFvFqVmDqR36Y8wXV5AjQqqJtIeenDktc=;
	b=RGXuCeiMGnEgNfWMMbNpoZmXbV8mPckuwmjtOJ5Li1WTc090yP1F/uw2IJVPWZwvrQ
	7cDFRqbOedcnRMimgYoXyDCAr/2P87yHpXdhXiHsyoC9QIzj0Nvyz9JkTo0YaY47Cxhx
	wqtdlv+1G3llef+Xm7PAvt5t+QodKZuA9EUv0xLWXBLa9/G/IqPGjD5p/BLiX1gExaCF
	06Q2W13NE5m4MUt79Y9vsNagPlq/Jb6gIvVgy9Nlif5F9l1ttpcSpMMawh0QhIBPMf6x
	H+edX1TlnLczI7QyTzO0HRgd0OeOJTpDb011Ky9xPSV02eSO3rjukgbw3LPXeUp2Hq4o
	LFog==
X-Gm-Message-State: AD7BkJLr3KqmniMv/dj8eXoRTlS5k93R/9SEgOajg9hqZ40RyXWmS57lAqmVy+AaGFXwqsMiJ2uvsNks6IPUFEWv
X-Received: by 10.31.7.138 with SMTP id 132mr3370143vkh.92.1458124342080; Wed,
	16 Mar 2016 03:32:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 03:32:02 -0700 (PDT)
In-Reply-To: <1457422582-28799-1-git-send-email-peterx@redhat.com>
References: <1457422582-28799-1-git-send-email-peterx@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 10:32:02 +0000
Message-ID: <CAFEAcA9QnbcUZyY_=Moi3P+wS27d4Q16e62jKOvNMhO2L72S-Q@mail.gmail.com>
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v4 0/3] ARM: add query-gic-capabilities SMP
	command
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rZFb2z+xvePU

On 8 March 2016 at 07:36, Peter Xu <peterx@redhat.com> wrote:
> v4 changes:
> - all: rename query-gic-capability to query-gic-capabilities [Andrea]
> - patch 3: rename helper function to kvm_support_device, make it
>   inline and lighter. [Drew]
>
> v3 changes:
> - patch 2: remove func declaration, add qmp header [Drew]
> - patch 3: being able to detect KVM GIC capabilities even without
>   kvm enabled [Andrea]: this is a little bit hacky, need some more
>   review on this.
>
> v2 changes:
> - result layout change: use array and dict for the capability bits
>   rather than a single array of strings [Andrea/Markus]
> - spelling out what GIC is in doc [Eric]
>
> This patch is to add ARM-specific command "query-gic-capability".
>
> The new command can report which kind of GIC device the host/QEMU
> support. The returned result is in the form of array.

Hi. I've made some code review comments on the specifics of the
implementation, but really what I'd like to see is:
 * an ack from the libvirt folks that this API meets their
   requirements
 * an ack/review frem Eric or somebody else familiar with qmp
   that it's OK from a protocol perspective

since I'm not really able to judge those aspects.

thanks
-- PMM
