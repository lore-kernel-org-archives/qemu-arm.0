Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp961457wrq;
        Tue, 3 Jul 2018 05:47:37 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf/wlJWyvco3raEre3oAyWPJUmmaVAneSAO4Cj1DtC+3AGOVSyocq6F3v3AsCcGlGTIMWTj
X-Received: by 2002:ac8:1779:: with SMTP id u54-v6mr26937979qtk.285.1530622057606;
        Tue, 03 Jul 2018 05:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530622057; cv=none;
        d=google.com; s=arc-20160816;
        b=J9rJEv/NDPyRWHqVxTa2OO6gW8y/rDdBmO4/ZC1e2fsImIh+D/2AJC8e8yq12jYocj
         B4lFNkDA3sr0h+xibK7IWGiWNtSbp7b9naERPCA0bi8ApWU990aCfA3K6Ts5sHmcpLBM
         dGQs2SD+t8FxlCxvY6E3aXf87VreCZlkAnEh7VfQ3BcInFJnOz0dZKQtFMCaKZC2Ven5
         4xCxCouJZOjz7jWGdSXfvosT8CKAUNyFEldg+gRlbJy9rMyTkiVDCJA/MDj/wk3NXq90
         GKJZ8idZgqOEIqlB2DgaLs7r8mtngUHkWV48QwG9XgnkRTw+TRKe2T+Mv8Zh1a1WqdPU
         ae6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=wQqp7n6rAdNLAq1Nz4yWbBlpd1sGLbhzbpRfBMS33ZU=;
        b=c3MZFrNfex/TJIW2+YjHCVoblyEBcHDTd01UFXiFoHX0ISaIEpWhNNZqVKCZp265bx
         /NhTSfi7kVZ3SO7YH9GZRfG3SJY4Os1Hwkk/1uGSyuO0hAfVGdLGuX223t6a/R67ewzX
         l8ZZfW1RHo7b1lhYHvrQx22aW/9SE3p/6RLqYw6CvzzSL6OTeGw5Rleg7bKZ7jHn5L0v
         gAk3o1vMu6XW5z14xvL2WHSgGfuv0ujLclNMCcYEdSpo/3sSZfDvO4QO6VXqd4nxtcJx
         ucmMvJmzjtxlaaRS3yWs6X6RjuTkUXJUXToDLMuR9SkU7jZhF489JkxKrzP3AEBnyiJw
         MnQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w6-v6si1036824qvb.198.2018.07.03.05.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 05:47:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faKiX-0000WZ-4l
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 08:47:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1faKiH-0000US-PR
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 08:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1faKiD-00065L-QN
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 08:47:21 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57928 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1faKiD-000652-J4; Tue, 03 Jul 2018 08:47:17 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA933402346D;
	Tue,  3 Jul 2018 12:47:16 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 516661C5B3;
	Tue,  3 Jul 2018 12:47:11 +0000 (UTC)
Date: Tue, 3 Jul 2018 14:47:09 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20180703124709.sqt5rmjsadnqag2c@kamzik.brq.redhat.com>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
	<1529500053-21704-6-git-send-email-eric.auger@redhat.com>
	<20180703115507.nqmyo7c5q5lrevgt@kamzik.brq.redhat.com>
	<31c24e33-8fe8-a3c0-0430-d2f503f10932@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31c24e33-8fe8-a3c0-0430-d2f503f10932@redhat.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 03 Jul 2018 12:47:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 03 Jul 2018 12:47:16 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 5/6] hw/arm/virt: support kvm_type
 property
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
Cc: peter.maydell@linaro.org, suzuki.poulose@arm.com, agraf@suse.de,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	eric.auger.pro@gmail.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vyDWvePCbOB/

On Tue, Jul 03, 2018 at 02:31:02PM +0200, Auger Eric wrote:
> Hi Drew,
> 
> On 07/03/2018 01:55 PM, Andrew Jones wrote:
> > On Wed, Jun 20, 2018 at 03:07:32PM +0200, Eric Auger wrote:
> >> The kvm-type property currently is used to pass
> >> a user parameter to KVM_CREATE_VM. This matches
> >> the way KVM/ARM expects to pass the max_vm_phys_shift
> >> parameter.
> >>
> >> This patch adds the support or the kvm-type property in
> >> machvirt and also implements the machine class kvm_type()
> >> callback so that it either returns the kvm-type value
> >> provided by the user or returns the max_vm_phys_shift
> >> exposed by KVM.
> >>
> >> for instance, the usespace can use the following option to
> >> instantiate a 42b IPA guest: -machine kvm-type=42
> > 
> > 'kvm-type' is a very generic name. It looks like you're creating a KVM
> > VM of type 42 (which I assume is the ultimate KVM VM that answers the
> > meaning to Life, the Universe, and Everything), but it's not obvious
> > how it relates to physical address bits. Why not call this property
> > something like 'min_vm_phys_shift'? Notice the 'min' in the name,
> > because this is where the user is stating what the minimum number of
> > physical address bits required for the VM is. IIUC, if KVM supports
> > more, then it shouldn't be a problem.
> 
> Well I agree with you that using kvm-type=42 is not very nice.
> 
> On the other hand the current kernel API to pass the VM GPA address size
> is though the KVM_CREATE_VM kvm_type argument.
> 
> in accel/kvm/kvm-all.c there is all the infrastructure to fetch the
> generic machine kvm-type machine option and decode it into type, which
> is passed to KVM_CREATE_VM.
> 
> "
>     kvm_type = qemu_opt_get(qemu_get_machine_opts(), "kvm-type");
>     if (mc->kvm_type) {
>         type = mc->kvm_type(ms, kvm_type);
>     } else if (kvm_type) {
>         ret = -EINVAL;
>         fprintf(stderr, "Invalid argument kvm-type=%s\n", kvm_type);
>         goto err;
>     }
> 
>     do {
>         ret = kvm_ioctl(s, KVM_CREATE_VM, type);
>     } while (ret == -EINTR);
> "
> 
> This infrastructure already is used in hw/ppc/spapr.c
> 
> Whould it be better if we would pass something like kvm-type=48bGPA?
> Otherwise I can decode another virt machine option (min_vm_phys_shift)
> in kvm_type callback.

Yes, this is what I'm thinking. I don't believe we have to expose the
details of the KVM API to the user through the QEMU command line. The
details are actually more complicated anyway, as the phys-shift is
only the lower 8-bits of KVM type[*], not the whole value.

Thanks,
drew

[*] Looks like Suzuki's series is missing the Documentation/virtual/kvm/api.txt
    update needed to specify that.

> 
> Thanks
> 
> Eric
> 
> 
> > 
> > Thanks,
> > drew
> > 
> 
