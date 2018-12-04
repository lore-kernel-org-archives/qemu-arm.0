Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8473991wrt;
        Tue, 4 Dec 2018 11:45:50 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VXHmPZhg6kIyjLf3BDLlVXiVgjfQnahhjBNbuQ92FgKybuKU7UhoMUOWkGPabqj9pjPpeW
X-Received: by 2002:a0c:a3e2:: with SMTP id v89mr21197325qvv.226.1543952750492;
        Tue, 04 Dec 2018 11:45:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543952750; cv=none;
        d=google.com; s=arc-20160816;
        b=AtRpoZyiWjh/KytNE0rMofQ7VwbnnwmlVdce02aND7D4wbIMeVBTZr6B/CS68mMYv9
         W02nsep2T8u6tDK95kMZoWV0BMgxucnDR6+Yrq9wxwyFCzw4WotkqqyGE5a1tBx66uF7
         C9lVaWJoN7BCYNMFPVGavDRaJETfmlgXnaWod4VPREBj0rXtV4gDbJgDPG0hiS5nOqnr
         AbmEREc0QdC1RwDpDsBvdrGR45SasxkT0Nn8teaRpH7jmtEXOQKGSPg/Q9OAfNuG6bjh
         3hjoqUjkPGV4mbHmMhJK/wkuuJpG88Lh0x8TQMeNL0rDLP+YVIIz3Y9tivyq5pCxmDMB
         tlwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=iZLWluwqkp5jXiyQPWl7GuKweuY0863IVR35OG2C+so=;
        b=Yd6dLWr0KKswPCsfbeUQAlSj6AhxVScL/5PZigdZVtBE6buajEj1H03qiNcKJFgxtp
         T8spQzXWgnSrHlQV8bDMAWIrvpOs823J5DzXYykwhUzcrKBPymCQRBM3W/TIHdiF6s9O
         Pnx/6og/nnWTiwiAOIYtYh/j8/mp62dds6xkw8l1vjWU0e74t+JXKY07V4FyoHiz2hHz
         RQxq/hhyhKCOQrBbpODN/cZJQ9KbI8hNze5sWZSlEk5Vkh2R6jHhxhXYRrRH7juDOnr3
         QRmg7rw9CEIEVjCRqHReF99YczchDXjWLXURP3ofBecDy4JR7G39mmFVylKMIdbNIyYZ
         Lcog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b11si6412773qvo.206.2018.12.04.11.45.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 11:45:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUGdi-0004tY-3F
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 14:45:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUGda-0004sD-Fn
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 14:45:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUGdW-0001Tc-SI
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 14:45:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48038)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gUGdW-0001TO-Mz; Tue, 04 Dec 2018 14:45:38 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD9DE169747;
	Tue,  4 Dec 2018 19:45:37 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A86F46910B;
	Tue,  4 Dec 2018 19:45:33 +0000 (UTC)
Date: Tue, 4 Dec 2018 17:45:32 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181204194532.GJ18284@habkost.net>
References: <65d3a572-9a80-f332-1f88-69e43e8a3663@redhat.com>
	<20181126132731.GJ18284@habkost.net>
	<CAFEAcA8D7ZjO059Sgrx-4i0iT+V3gxT4f=DvdmUAJS7KomtyOg@mail.gmail.com>
	<b8e20686-e5d1-a844-48f7-a4ae471e3fd5@greensocs.com>
	<CAFEAcA8j4xTiS3_ktiA0hm2N4cu5RvxAtYqUHgvY-bUXgcwbjQ@mail.gmail.com>
	<50645862-a638-ad2a-bafe-1b46be42aec4@greensocs.com>
	<20181204180607.GB18284@habkost.net>
	<CAFEAcA9JXeRGfKzouYJQKxgXuw_Z-up0a1ijZX9hZvXbdkwiuA@mail.gmail.com>
	<20181204190548.GH18284@habkost.net>
	<CAFEAcA9M3akT7sF-kjCg41ucuUhv2PxKaCBmkN3eacvqvf_w9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9M3akT7sF-kjCg41ucuUhv2PxKaCBmkN3eacvqvf_w9Q@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 04 Dec 2018 19:45:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU
 clusters
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
Cc: Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A3Lsi854fKjK

On Tue, Dec 04, 2018 at 07:16:39PM +0000, Peter Maydell wrote:
> On Tue, 4 Dec 2018 at 19:05, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > On Tue, Dec 04, 2018 at 06:24:19PM +0000, Peter Maydell wrote:
> > > A cluster is a group of CPUs which are all identical and have
> > > the same view of the rest of the system.
> 
> > With that definition in mind, why can't QEMU cluster CPUs
> > automatically by looking at CPU models and address space objects?
> 
> That sounds like it is in theory feasible and in practice
> quite tricky. You would have to look not just at the CPU
> model name but also introspect all its properties for
> ones which change features of the CPU and are set differently
> on different CPUs (and I don't think there's any way to
> automatically tell which properties are ones which make
> the CPU different for which-cluster purposes and which aren't).
> And if we automatically checked whether address space objects
> were the same it would rule out implementing devices with
> per-cpu banked memory mapped registers by mapping different
> things into the AS for each CPU (though that's a hypothetical
> at the moment -- I've thought about implementing stuff that
> way but we tend to implement that sort of thing by looking
> at current_cpu->cpu_index at the moment).

I see.

Can't we at least do something to make sure the cluster objects
make sense?  e.g. by ensuring at least QOM CPU type is the same,
and that cpu->address_space somehow points to
cpu->cluster->address_space?

CCing Paolo, so he can correct me if this doesn't make sense.

-- 
Eduardo
