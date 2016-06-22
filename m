Received: by 10.25.21.96 with SMTP id l93csp2429987lfi;
        Wed, 22 Jun 2016 05:02:31 -0700 (PDT)
X-Received: by 10.55.165.69 with SMTP id o66mr36989881qke.153.1466596951381;
        Wed, 22 Jun 2016 05:02:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n24si5834876qki.131.2016.06.22.05.02.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 05:02:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57663 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFgrW-0008Rd-Uu
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 08:02:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFgrS-0008Pb-Oz
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 08:02:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFgrR-0005Cx-SP
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 08:02:26 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:33830)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFgrQ-0005C6-Kl
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 08:02:25 -0400
Received: by mail-vk0-x22c.google.com with SMTP id c2so28399430vkg.1
	for <qemu-arm@nongnu.org>; Wed, 22 Jun 2016 05:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LS0iQ5LFTfvx7KeFdZZj3qijIlv9P8Vm+J3a8+DjybQ=;
	b=IhAniNoHbDa5NiyrFyhGZYiJW0ld6ePLcDITqP0Kne5DH1FsQntcm0yny52wKVdBYi
	1wfZ/eIl1DAp/hfWPGmxlqUNcvt3Yyo6/3od9Vo4rQoPl1DGCXCnC7Z00ei+Klt94iMe
	x4R6iI/SusXo6zN5DVIi0EejWzFXHfMPySyvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LS0iQ5LFTfvx7KeFdZZj3qijIlv9P8Vm+J3a8+DjybQ=;
	b=NVRJSFYu1sYJWprL0k0wuDC74jzykB4ZXrwVaLapEnFHS8nYAMebUFyS4DWNF41xRz
	BM4474N/jcor37FV3UPMFhp2Lr7CWQDEp3xFwAvuAC4jqhtsyxZcxL4x0rPDnBz5ttXe
	B1EfjMSd02O0QFFa9TGTY5osc6YPoCYE9h9lYGJCeyo2M8ljk3gz5u+GdUHbr1l0ZKqh
	vjc8dX3lruPEvY618jmbBEinUKgqZnQDWMA/5pZf2+u05W8k+eVczJZ5mac1gP7O9gY6
	oS88AM/PA2d1gY8onqXPIBJGpI58YPpfqn2oY8TQkHPRxxRh4CPY9aFasf8aUIvbxyA+
	4/kA==
X-Gm-Message-State: ALyK8tLfF6QvpGiW7YbxKHrTKtUYbeM9VJ+ETkwmSbYjvqIdrl873LFFL2eULgC4ws0Vs9wppI6DBa/f8uim6Irk
X-Received: by 10.31.72.135 with SMTP id v129mr12421811vka.120.1466596944081; 
	Wed, 22 Jun 2016 05:02:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Wed, 22 Jun 2016 05:02:04 -0700 (PDT)
In-Reply-To: <20160622115432.GA6604@work-vm>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<1466528974-12183-7-git-send-email-peter.maydell@linaro.org>
	<20160621184552.p7trf4zpqnrmwruu@hawk.localdomain>
	<CAFEAcA_AnYGV0jy9HAUevHPB=FY3NP25-7BUpdbySZS-QPeGrg@mail.gmail.com>
	<20160622080234.f57jjn43tcwmvmcd@hawk.localdomain>
	<20160622113558.GF2274@work-vm>
	<CAFEAcA9tRnKuc4Dqj4_7vKwmg2Y00ifNQHA1rUirEy5viWsG3A@mail.gmail.com>
	<20160622115432.GA6604@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Jun 2016 13:02:04 +0100
Message-ID: <CAFEAcA9xEx_hJJDuUmyrb_DMyoUarHVZQ_tJ5cjR-MLyVsqDdg@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 6/6] hw/arm/virt: Set
 minimum_page_bits to 12
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
Cc: Andrew Jones <drjones@redhat.com>, Patch Tracking <patches@linaro.org>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LkmqdDMY1gVW

On 22 June 2016 at 12:54, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> On 22 June 2016 at 12:35, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
>> > Yes, my hope is that any versioned machine type should migrate to
>> > a newer qemu with the same machine type set.
>> >
>> > There are really two separate things that we state with the machine
>> > versioning:
>> >   a) that the guest view is the same
>> >   b) that the migration format is the same
>>
>> Well, this is true for PC.
>
> PC, ppc/spapr, and I think s390.
>
>> But my impression when we started
>> applying versioned machine types to ARM virt was that it was
>> signing up to (a) but not (yet) (b)...
>
> So that would make ARM special; the problem is we have no way
> to communicate to the user that it's special.

Is anybody testing that migration between versions for
virt works?

thanks
-- PMM
