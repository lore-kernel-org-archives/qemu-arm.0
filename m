Received: by 10.25.159.131 with SMTP id i125csp817028lfe;
        Thu, 8 Dec 2016 04:03:32 -0800 (PST)
X-Received: by 10.200.54.4 with SMTP id m4mr62784839qtb.141.1481198612731;
        Thu, 08 Dec 2016 04:03:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id k42si17105092qtk.83.2016.12.08.04.03.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Dec 2016 04:03:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cExQC-0006W9-2h
	for alex.bennee@linaro.org; Thu, 08 Dec 2016 07:03:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cExQ4-0006VV-8h
	for qemu-arm@nongnu.org; Thu, 08 Dec 2016 07:03:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cExQ1-00081y-4C
	for qemu-arm@nongnu.org; Thu, 08 Dec 2016 07:03:24 -0500
Received: from mail-wj0-f195.google.com ([209.85.210.195]:34883)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cExQ0-00081H-Uw
	for qemu-arm@nongnu.org; Thu, 08 Dec 2016 07:03:21 -0500
Received: by mail-wj0-f195.google.com with SMTP id he10so39970429wjc.2
	for <qemu-arm@nongnu.org>; Thu, 08 Dec 2016 04:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ltJuVnQH9vt4ax/q6zVIc72bTFgleISsj9IP/eK44Yk=;
	b=0CTA+wd1s/mnhBCfM9plsMdu/EGl9aqZ24qBtvEXMLztnaRUCWkKIQeE43L3XWfwSD
	4cH++6XQ2FxYwufKkpzMGWjiFlud5nberukB4QFc/7na/aG4q2Wa1TFefh2SbvSmkADf
	IcskHhB/48Y/p2ORAkDpbXaht9UFfctkD/mNfP+K1JTYRD65855me6NE7aXSKJdu8HGG
	myVddH6AiW0AqBbQlmRNSluT1jMPVsmU/yhwz2kyzyQKHo5+dw1z8TmXG0kpeTLxp6Fh
	hU/VucgiArD75ItEThc1vbrfOyH3P1aXwoz/jMS+HujxeZU9MITxOB9QaS8E+acdG1kJ
	r79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ltJuVnQH9vt4ax/q6zVIc72bTFgleISsj9IP/eK44Yk=;
	b=KxZrB9wFfd9KixCpuYqmkShsIJPvGyarwCmQWQbkyAGQt8Oy+JxV8fVcfHnR0OOlKJ
	Lmu0F+ldbF7jn1X+NjF2veI6VirKULFFLjuIYbqEcvSSpH/pQQA1VKwbQpp8h2BYVb9R
	66Uq9BVZWX/fxjQlE0dP1ec84iHi3qMGaBNwF+FuHi3hPbebaAlkV50mZtYCtLBvDfpS
	Oa2jlRxJh+PcMKeUjTmrASYYtYHqVeNg9/4IO6QXT1hHa+cESrGlWfgOE+sUj4kPC5Nv
	hKs+9PFTzy6M/Ah+v3q044qVis68x0JJRJnbflZeRGAYR4VEr1uxbolwnTJ0I18ZXe+Y
	QnNQ==
X-Gm-Message-State: AKaTC01KNU2MiK+zx/pKvo8fqj8Ze+tZquCMpGFpNxTi62sfPW0CJ7Fe3D+cQloDBjoukg==
X-Received: by 10.25.228.155 with SMTP id x27mr25472499lfi.55.1481198539661;
	Thu, 08 Dec 2016 04:02:19 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	h129sm5587269lfh.7.2016.12.08.04.02.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Dec 2016 04:02:19 -0800 (PST)
Date: Thu, 8 Dec 2016 13:02:18 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161208120218.GI9606@toto>
References: <CAF++6AOJ_kiPyeCO3WO84d4UTrV9v=iK8CJx72ERJ5N_AKj64g@mail.gmail.com>
	<1dda2994-dc9d-d8f6-fb42-856f2b992484@redhat.com>
	<CAF++6APMs+eshFxV=wxV9N9zmyyLtU8Gz0v0CAgCWkOnC88dpg@mail.gmail.com>
	<CAFEAcA9guoF-ija--JO1E0pfUG2d4HNSB343GiY9ojO837TAXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9guoF-ija--JO1E0pfUG2d4HNSB343GiY9ojO837TAXQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.195
Subject: Re: [Qemu-arm] [Qemu-discuss] Custom board with DTS/DTB
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
Cc: James Hanley <jhanley@dgtlrift.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hQfQSTH9DcV4

On Wed, Dec 07, 2016 at 09:25:15AM +0000, Peter Maydell wrote:
> On 5 December 2016 at 17:51, James Hanley <jhanley@dgtlrift.com> wrote:
> > I'm moving my query to QEMU-Arm since it seems more applicable here.
> >    1) It seems that the -dtb option is not what I thought it was, but would
> > something like what I thought was the intent of the option be of value to
> > QEMU, that is to define the board support package for the system using DTC
> > to compile and pass into QEMU to define a generic board from the tree,
> > rather then defining the hardware within the code base of QEMU?  I
> > understand that there will always be some need for device support and
> > deginition from within the codebase, but this was more to allow the user to
> > define hardware board profiles without having to change source code.
> 
> The problem is that DTC is not designed for that job. It describes
> those aspects of the hardware that the kernel cares about, which
> overlaps with but isn't the same as the information that you would
> need to build a complete model of the hardware. So the idea has been
> suggested before but I think it would in practice be pretty unreliable
> (and for 99% of dtb files it would just not work anyway, because QEMU doesn't
> model the devices that the dtb describes).

Hi,

I mostly agree with what Peter says. Saying that, we (in the Xilinx tree) have
a system where we create a QEMU machine from a device-tree.
We've abandoned the idea of using a plain Linux DTS (with the Linux bindings)
for the reasons Peter mentions. Instead we use a set of extended bindings
+ we expose the QEMU device properties as they are.

So far we can describe everything we've needed, included complex memory
hierarchies with multiple address-spaces and memory translation/protection units
(IOMMUs, MPUs etc). Complex and multiple IRQ trees, power management structures
and signals to communicate between devices etc.

This is very useful to us but I'm not sure adding the current version of
our implementation makes sense to upstream.

A better option is perhaps to allow machine creation fully over QMP and
implement a DTS (could be XML or something else) parser outside of QEMU
that creates the machine over QMP. We could then support any kind of
format and a DTS/DTB instantiator could be written in python for example.

Best regards,
Edgar

> 
> >    2) Right now, I'm trying to run our embedded application (EmbOS RTOS with
> > DLib with our application support all targeted for Cortex-M4 MPU) and it
> > seems like QEMU (at least from variable names) wants to believe that under
> > boot.c and loader.c that the passed in application (using --kernel option)
> > is linux.
> 
> M-profile is different and doesn't generally use boot.c -- the board
> model code ends up calling armv7m_init() which treats kernel_filename
> as a random ELF file. (A profile --kernel will also treat an ELF
> file as an ELF file, it just has special casing to handle Linux kernels and
> assumes a raw binary is a kernel.)
> 
> If you're running one of the 2.8 rc candidates you can also use
> -device loader to load an arbitrary file (see docs/generic-loader.txt).
> 
> thanks
> -- PMM
> 
