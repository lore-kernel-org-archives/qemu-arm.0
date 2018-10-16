Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5942698wrt;
        Tue, 16 Oct 2018 06:56:55 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62fbwx/Lesi5H55iuYidCriZdLu0ddpWjpLjXL2v3tdH2m5S5f5/RijgKRqhEuh3DZPUq3o
X-Received: by 2002:ac8:3e91:: with SMTP id y17-v6mr20100131qtf.314.1539698215093;
        Tue, 16 Oct 2018 06:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539698215; cv=none;
        d=google.com; s=arc-20160816;
        b=OtHZoM/DxCx+SVgJIkSi/ahuNYbs9EcbT+polT7ZaYzHnt5jHi+gog4ZPD0txvLxFX
         uR+YSX/UsumxN9DcICYo34BQj0Owdyipyq3AdGbLBgnTdKuDctdU3wb7p0YeznZAW3G9
         kEccLaucM4VXKtka0kNCR+e7AQ6BpqylhcaXUl3h1Qt9Bvd+19CWGaMygiP7xRk1TKtI
         gPKChuvtmeB0lQBoM/f8nZ1CPSrzYddW6q3b0K3PHUfr39PT7oGLVw7ZZiZ9T15TdU1s
         iB6tBoo5nfv79WQCLvOz3axXsyxE2XAEky7ikeb6TC/EoU3R7qxtv5vJ9VGugJ4RbcTL
         kn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=Kmchx1PVaKaElKggH2J8DGPIsaWQ0WnJe+CTaviFnfs=;
        b=ZKDF3iRpd2ojG4Nha3iwvzlsemUcjksmiudn2d4hZYfb1dh5FVUPjxNLS0jjfDJMD0
         zHFbpG6vZ3p1dpJNLR0eJIIJ14u+O9jEBIPyAtyaxf6GGF8kYVg5Pkwoum/Xbx9LxLum
         kKZkRKbB3f0FWoTGm3atuCYI988rmIwt1LzPrIL7spKRnuaceGv/ee8ZXzEz4ugvmtmW
         cy56ZBNzCao5yQ7S3sl2zZgMhGbxegjNKAkjlz1qJSVZOlNC6wT9J3uOD7pM4AImh3KN
         5aXTUpPBo/ujLC5kjXSXWnI6Yf4T+jJK1ndxpjcPsXD+uaLjZnhmwTYitqEl/Vb11Bzq
         pqpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gT+L35Ax;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n26si1256320qvd.166.2018.10.16.06.56.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 06:56:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gT+L35Ax;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCPqA-0002AQ-KC
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 09:56:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gCPp0-0001pA-F9
	for qemu-devel@nongnu.org; Tue, 16 Oct 2018 09:55:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gCPou-0000CV-M0
	for qemu-devel@nongnu.org; Tue, 16 Oct 2018 09:55:38 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:33237)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gCPok-0008Lx-Ru; Tue, 16 Oct 2018 09:55:30 -0400
Received: by mail-qt1-x842.google.com with SMTP id q40-v6so25760032qte.0;
	Tue, 16 Oct 2018 06:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Kmchx1PVaKaElKggH2J8DGPIsaWQ0WnJe+CTaviFnfs=;
	b=gT+L35AxeXcE+8CLCdMYdPECIAtElJxRDWJi+PXrP3BDk/1PTTlSTCQYOePYzc0Xin
	ovYIwm3fJSB7HqYbrhMhm9PHZPIKPuSEDn0dwa9e+r/Q364MXPwU93rcQcoGkAf2bK/Q
	vhAE8RqsyeEboL4tdYQETNdO5JfczZJob4VBvn5VR8blRWs84uSKyPHh5iRktpOVic1V
	M/a6gQ4kP9zl3oTlAgw8HM6+E3eL3XfpwZbREuClfuJIuQsEtIgb9iWU3NC+eAsXY5zV
	Buk3f+FguOsJMjFKK6LYhTgdw9cvl6weUeaWHdwxjSw+7hjY8qCOqjhawKEmrj7o5Q/Q
	CWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Kmchx1PVaKaElKggH2J8DGPIsaWQ0WnJe+CTaviFnfs=;
	b=CTlMlNocAX3vPgm9jaVhmfN36+vbZr840FRxV4LyYF1aeCsXSXXNX1JZ908Yh49nA5
	y5zOft2aNa9MlcwLei9u7nzTj/dZ3HPX6vl6cI9l411wTIcLlX0RbMOHH5ALKixYAKBh
	BI4gXWGUneNn+eKfzuOLMllTgakKGcQ6xQ3GNyUDERGDgaNpt2zA4Cx1/zK5kxkLAoeL
	Do8Pf0jvOm2pyrRMRAh96SwnTfOmSwP7WJRN1u1v7qU6Vr9m68CGbrbIWOXfp17R6qQ1
	PB890A4xkFx3wuVf8bKjjKycQslsVvZ7wtYSlEI5GorTi6WTBHEWjuPezDQdBJGyEDND
	0RHQ==
X-Gm-Message-State: ABuFfog5VfNSDeECTusxVvndqBNyjx7EaC9Ig2BqAMcogedvgQknZVKu
	UaRAA4lIYIAbnBR7QjnXlZS0IXcK
X-Received: by 2002:ac8:2a79:: with SMTP id
	l54-v6mr19907339qtl.95.1539698118790; 
	Tue, 16 Oct 2018 06:55:18 -0700 (PDT)
Received: from okra.localdomain ([2600:3c03::f03c:91ff:febb:cdda])
	by smtp.gmail.com with ESMTPSA id
	c34-v6sm10615620qkh.40.2018.10.16.06.55.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 Oct 2018 06:55:18 -0700 (PDT)
Date: Tue, 16 Oct 2018 09:55:17 -0400
From: Aaron Lindsay <aclindsa@gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20181016135517.GO3671@okra.localdomain>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-4-aclindsa@gmail.com>
	<3a964ae2-a5d0-5960-9e15-7ede929a8294@linaro.org>
	<20181016082117.GB2426@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181016082117.GB2426@work-vm>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::842
Subject: Re: [Qemu-devel] [PATCH v6 03/14] migration: Add post_save function
 to VMStateDescription
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
Cc: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f87tbuCoQOoV

On Oct 16 09:21, Dr. David Alan Gilbert wrote:
> * Richard Henderson (richard.henderson@linaro.org) wrote:
> > On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> > > In some cases it may be helpful to modify state before saving it for
> > > migration, and then modify the state back after it has been saved. The
> > > existing pre_save function provides half of this functionality. This
> > > patch adds a post_save function to provide the second half.
> > > 
> > > Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
> > > ---
> > >  docs/devel/migration.rst    |  9 +++++++--
> > >  include/migration/vmstate.h |  1 +
> > >  migration/vmstate.c         | 10 +++++++++-
> > >  3 files changed, 17 insertions(+), 3 deletions(-)
> > 
> > Hmm, maybe.  I believe the common practice is for pre_save to copy state into a
> > separate member on the side, so that conversion back isn't necessary.
> > 
> > Ccing in the migration maintainers for a second opinion.
> 
> It is common to copy stuff into a separate member; however we do
> occasionally think that post_save would be a useful addition; so I think
> we should take it (if nothing else it actually makes stuff symmetric!).
> 
> Please make it return 'int' in the same way that pre_save/pre_load
> does, so that it can fail and stop the migration.

This patch calls post_save *even if the save operation fails*. My
reasoning was that I didn't want a failed migration to leave a
still-running original QEMU instance in an invalid state. Was this
misguided?

If it was not, which error do you prefer to be returned from
vmstate_save_state_v() in the case that both the save operation itself
and the post_save call returned errors?

-Aaron
