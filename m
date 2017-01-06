Received: by 10.25.205.13 with SMTP id d13csp10396426lfg;
        Fri, 6 Jan 2017 09:05:57 -0800 (PST)
X-Received: by 10.200.34.73 with SMTP id p9mr81847946qtp.25.1483722357393;
        Fri, 06 Jan 2017 09:05:57 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n14si91691qtf.236.2017.01.06.09.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 09:05:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPXxi-0002Ky-Qh
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 12:05:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPXeS-00016L-Ey
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 11:46:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPXeR-0003qt-HI
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 11:46:00 -0500
Received: from mail-ua0-x22e.google.com ([2607:f8b0:400c:c08::22e]:36856)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cPXeR-0003qk-D2
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 11:45:59 -0500
Received: by mail-ua0-x22e.google.com with SMTP id 88so405386744uaq.3
	for <qemu-devel@nongnu.org>; Fri, 06 Jan 2017 08:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=19DfcC1XwtvP8hLB/Yu19AQNrcbA5pHwzww/aC/Qjvk=;
	b=hxR3DAApaPhs7iE9FbdDRZieFlKQ3+VA3Vp82y2vbGW9jOzoR4O+5Hr32OWRMBlR32
	FZmQV7f0Lhe2wa6IT/Co7cgkWJxm5hG1udAe1vUdXHgt0cYKKzQc913rOxz7KZi93Eve
	ItmI6rFSdCH6Nj6G+jfX0HTLwqXMCMnc4RIKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=19DfcC1XwtvP8hLB/Yu19AQNrcbA5pHwzww/aC/Qjvk=;
	b=GvKEQ4+RvEsJPVJeqPglM/BPIgeusxLdfLIL5bCkrbbBFoelJ/W+LtVYEwalKc7FEk
	40wZ6x2RYOAAW+DrherkzsfzH7BE05SuEu3ZDV0Wdp+hdPjho2j3emnKaF6YLdjNCCaS
	n0na+w6G56suD10DlN7qixvIuQ2LxHw9FcC3YTUWwmmfYZIzEcJRvNTxVMkJRdBraLLg
	9LTe5h2gAXAKSFPVf4+9RR1rs06/r+eFE3pGZC0piSJHdClLxmG1Ze6j5r700UBY4jt/
	irMQhRuy0d+I6U/HTfPf5IpMz9OuE39bVDT9GudDT7++EOaMiY57ONEvcpH/+Ky0HVSs
	ckpw==
X-Gm-Message-State: AIkVDXIm3e8xg/+JpkjZCphWP+RB4JFnuYknfePYTskKRWYxwRLuilNJcBds0Vd1U6knm+ByysTQoZg2maF+sjMN
X-Received: by 10.176.91.222 with SMTP id z30mr58962479uae.140.1483721158605; 
	Fri, 06 Jan 2017 08:45:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 6 Jan 2017 08:45:38 -0800 (PST)
In-Reply-To: <20170102200153.28864-1-drjones@redhat.com>
References: <20170102200153.28864-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2017 16:45:38 +0000
Message-ID: <CAFEAcA_Qu=DU0HT=8FqZscKPp6Z3t6nRX7TfvLyXj-8ToLx10A@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22e
Subject: Re: [Qemu-devel] [PATCH v2 00/16] Remove VirtGuestInfo
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W1YR6/D/chZW

On 2 January 2017 at 20:01, Andrew Jones <drjones@redhat.com> wrote:
> v2:
>  - all Igor's suggestions
>  - added four mach-virt acpi cleanup patches
>  - added the remaining two acpi patches needed to bring equivalence
>    to Peter's DT changes
>
> This series is based on Peter's qemu-arm gicv3-virt branch. It's
> main goal (patches 07-13), which was suggested by Eduardo, is to
> remove an unnecessary structure, VirtGuestInfo, which is a
> maintenance burden, as it requires duplicating Virt machine state.
> Additionally patches 05-06 do some mach-virt cleanups and patches
> 14-16 add the ACPI equivalents of the DT patches in Peter's
> gicv3-virt branch. The first four patches are cleanups to mach-virt's
> acpi code.
>
> Patches available here
> https://github.com/rhdrjones/qemu/commits/virt/remove-guest-info-v2

Thanks. Apart from the last 2 patches which depend on the gicv3-virt
changes, I think this is all OK to go in now.

Since the gicv3-virt code still needs a respin (I haven't looked at
the failure to boot smp secondaries into EL2 yet), I have taken the
first 3 patches from gicv3-virt and put them into target-arm.next:
 hw/arm/virt: Merge VirtBoardInfo and VirtMachineState
 hw/arm/virt: Rename 'vbi' variables to 'vms'
 hw/arm/virt: Don't incorrectly claim architectural timer to be edge-triggered

and then rebased patches 1-14 from this series on top of that, and
applied all that to target-arm.next.

I'll put patches 15 and 16 into my gicv3-virt branch for when I
send out v2 of that.

thanks
-- PMM
