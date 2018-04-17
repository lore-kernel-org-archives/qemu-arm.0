Received: by 10.28.4.212 with SMTP id 203csp3707016wme;
        Tue, 17 Apr 2018 04:36:23 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+7NdrF/GVknhi49ihzYGZ6csJOFNedF9TtsZeKPJYQsNUkZw/Sj+SK4H8/vKnqNwcXrEJ8
X-Received: by 10.200.54.83 with SMTP id n19mr1942113qtb.271.1523964983072;
        Tue, 17 Apr 2018 04:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523964983; cv=none;
        d=google.com; s=arc-20160816;
        b=yLI4aRuzgvhF5PD0s0ZSGnXzAvKPFRHg7czzblfJdTMdT+ppI0Vt/1s9vzn0DoHbRJ
         +oGp5FuwWpKNNzJp6ZEJ011RBQoS27UrcoHYnnsxXx8cFGohTP5VPiGoYRpKsG+I/26q
         pEgNeXA/QVTyqVuOmsW1K0Ra+Gj0tuGOhaWgiI68J9x6yPgx6AFY/qPhG84YMAuuCDL1
         5l1AakZ6r1BDDC+l2gAuOTTvXBWqc/QbJqYEfm7AgOJfYCm73U6oCloUZmmm6IXuWuqY
         sJBos774Fg6nvqdY0AVwJlmOTWXGuhnA7rhjRFTgCO6mMQa6AFmodMJzlwLeVvdwdLfN
         xYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=S3bQyDixBmfTgEInyGOqa9hxX0btjmjVZkyrw49S2Qs=;
        b=OudLakEyxy+6n/tnhhGEjAYC7apEe9QRdceK/n5boMDSfPqdBElQfY/aY0HqrKB3jJ
         +WPDaqDipqGDB5minIxxtiiib6vDK1TFwKkw7RnKudoQ7lcDPnXgVt7xTvTvpqv7/B8H
         b60v8Vo/A0YPro923m+CkjAHw+2uLnCN2vm6XQk9Rvugk7frIbxwERl03pv7CmgmpHLp
         VQKP7XhUfrYCuVDOnjPb8MSCZkReRy0SaMbJQ5F9EbKtGopojWNqPLKK/3sJdvC6m7pQ
         TGPBQ6OlaMbMgVrFv46QrjL3C/NmoZEyisLI5oM1iW94Mu9AQGnHlzShZU5A/Qwn2Jm9
         x6sw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f63si638677qtb.192.2018.04.17.04.36.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 04:36:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32822 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8OuM-00039O-Jk
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 07:36:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f8OuB-00038M-0B
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 07:36:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f8Ou7-0004y3-0s
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 07:36:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45360 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1f8Ou6-0004u5-F5; Tue, 17 Apr 2018 07:36:06 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1175406E8B9;
	Tue, 17 Apr 2018 11:35:54 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E67C7C26;
	Tue, 17 Apr 2018 11:35:45 +0000 (UTC)
Date: Tue, 17 Apr 2018 13:35:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180417133544.0102ef0b@redhat.com>
In-Reply-To: <CAFEAcA_nM4VanwwPKB3bpL6=wvk=u-bh1b+O3ahNFMpRnchcsg@mail.gmail.com>
References: <1523551221-11612-1-git-send-email-imammedo@redhat.com>
	<1523551221-11612-4-git-send-email-imammedo@redhat.com>
	<CAFEAcA-AVuHMao5kQUrfEYWpGL0y-CwbuqCA_8ZSZrVbqz9nCg@mail.gmail.com>
	<CAFEAcA_nM4VanwwPKB3bpL6=wvk=u-bh1b+O3ahNFMpRnchcsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 17 Apr 2018 11:35:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 17 Apr 2018 11:35:54 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH for-2.13 3/4] arm: always start from
 first_cpu when registering loader cpu reset callback
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 04L/kOXzj90S

On Mon, 16 Apr 2018 18:17:51 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 12 April 2018 at 19:29, Peter Maydell <peter.maydell@linaro.org> wrote:
> > On 12 April 2018 at 17:40, Igor Mammedov <imammedo@redhat.com> wrote:  
> >> if arm_load_kernel() were passed non first_cpu, QEMU would end up
> >> with partially set do_cpu_reset() callback leaving some CPUs without it.
> >>
> >> Make sure that do_cpu_reset() is registered for all CPUs by enumerating
> >> CPUs from first_cpu.
> >>
> >> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >> ---
> >>  hw/arm/boot.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> >> index 2f464ca..2591fee 100644
> >> --- a/hw/arm/boot.c
> >> +++ b/hw/arm/boot.c
> >> @@ -1188,7 +1188,7 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
> >>       * actually loading a kernel, the handler is also responsible for
> >>       * arranging that we start it correctly.
> >>       */
> >> -    for (cs = CPU(cpu); cs; cs = CPU_NEXT(cs)) {
> >> +    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
> >>          qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
> >>      }
> >>  }  
> >
> > Definitely a bug fix, so:
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > I think though that in at least some cases we'll still mishandle
> > being passed anything other than first_cpu as the CPU pointer,
> > because in do_cpu_reset() we do some checks for "do this if
> > cs == first_cpu", on the assumption that first_cpu is the
> > primary CPU that we're booting. We should instead I suppose
> > be checking against the CPU pointer we're given as the
> > arm_load_kernel() argument (which I think do_cpu_reset() can
> > get at via info->load_kernel_notifier.cpu).
> >
> > We should probably analyse which boards actually pass anything
> > other than first_cpu -- I suspect it will end up just being
> > the xilinx board which has both A and R profile cores...  
> 
> I did the check, and in fact all of our boards always pass the
> first CPU as the boot CPU. Xilinx comes the closest, in that
> the SoC object has a boot-cpu property to pick a boot CPU, but
> since none of our boards set that it defaults to the first CPU.
> 
> Since this patch isn't very related to the rest of the series
> I've just applied it to target-arm.next ready for 2.13 (with
> a note in the commit message that in practice it isn't a behaviour
> change). Let me know if that's awkward for you and you'd prefer
> to keep it in this series, in which case I'll drop it.
That's fine, I'll just rebase v2 on top of it.

> 
> thanks
> -- PMM

