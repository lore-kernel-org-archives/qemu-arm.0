Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4484948lff;
        Mon, 13 Jan 2020 10:41:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqwdL3QPQRK++ro8gy1pTlxlq01O4WMWJ81blajFDtvkuFLkCdjqraGXCL+zbT+hcZZLXfHg
X-Received: by 2002:ac8:4616:: with SMTP id p22mr11626729qtn.368.1578940871778;
        Mon, 13 Jan 2020 10:41:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578940871; cv=none;
        d=google.com; s=arc-20160816;
        b=jR2Ug4/1Nn7vifQHiaGOW3RznME8/WbbXbDAZTedpyfuAUoRDZnmgIXCoh8cb5gFNm
         GwX+2pBiCeMrLc1vcqGI5aG8cOnGbhez0jF7NQbxyF9bJpR2R59hTix2kRt5/iTY+eZw
         T7j8EOIaahcccozc2Y+Ub2gqkeJNfKN6AGG03ingcPbV36pVWW75HmnaVJT5o3XKhxM8
         RQrgMr4ZOxbYL3fBqDXNTdzS/CkozyfCcKrXkKrZeOORCMjCKahWdxdyOwrXuAsNnwnR
         nMGW+RtQvbxvEzhKQCfVY/youWCu8Oeix0/FU11K6objpSGCKOSuaQ7UkkfFK87eEj7k
         +XIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=7pt2gDakXnLxH77dxzgxCxxsGtgT1eBq7tGrDPm8jzQ=;
        b=sKHVYABF1gGjmiAJCe7X2KheOG/vLpOhcZuvw2Q8sb7KGAqlUPE4Vis6AA07vvJmf/
         1qpg5hcgyQ9dR47fuUB8Eq5eQf01VZrXNTxjtdaquSxSSYGTuy3/5OeiFzM2AyqnQfT5
         EmLJ7BzZn25A4r2MZXszztZPmNyyhX0H0DyfK/cwdzV9zG7sAgConyvGjZO/txA/Z4ka
         tYQqwTevpNVzPZkHjYSQxHoQHMNOKnwsN7jbFfgmCF88gxCZKm7X/T3HbPI9HKb+UEaf
         ElqIOr1imoXHMzkIHc7NC9veeFKxUR0gfYFkGs0FWodEiJFXEU0vTjCEAgBWZBv4xloF
         WohQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=d6kdelts;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id g55si7067874qte.240.2020.01.13.10.41.11;
        Mon, 13 Jan 2020 10:41:11 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=d6kdelts;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 23BBA4AE94;
	Mon, 13 Jan 2020 13:41:11 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K+ONv9QOAxjL; Mon, 13 Jan 2020 13:41:10 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 151DD4AEE1;
	Mon, 13 Jan 2020 13:41:10 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 6CEEB4AE94
 for <kvmarm@lists.cs.columbia.edu>; Mon, 13 Jan 2020 13:41:09 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SzlU4t-t0iXm for <kvmarm@lists.cs.columbia.edu>;
 Mon, 13 Jan 2020 13:41:08 -0500 (EST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 5D7314ACF4
 for <kvmarm@lists.cs.columbia.edu>; Mon, 13 Jan 2020 13:41:08 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578940868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lzsvSn3vm+wBgNMJ8PeCKY2Pk4Acog14y15igrOXvYo=;
 b=d6kdeltsXvLjomuQzyokg6k14UrxjQmgfnPK3L7BjHh4UYhnM5F6UPbURpyodEqmL+dr9L
 bcJE2OsbLDjWeSCLmlt7COnyDdPtWw90kuHtLaSB8O3XcGGExteL5PbYkUObYhybHIUTT5
 ky1UxweChrNp+5V2Zz7Su/EQOTCvq+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-5paUai2PN46VI-a3bWSjqw-1; Mon, 13 Jan 2020 13:41:05 -0500
X-MC-Unique: 5paUai2PN46VI-a3bWSjqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E10E9907607;
 Mon, 13 Jan 2020 18:41:02 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3302A19C5B;
 Mon, 13 Jan 2020 18:40:57 +0000 (UTC)
Date: Mon, 13 Jan 2020 19:40:55 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v2 14/16] arm/run: Allow Migration tests
Message-ID: <20200113184055.tu3qqpsc72xqfw6t@kamzik.brq.redhat.com>
References: <20200110145412.14937-1-eric.auger@redhat.com>
 <20200110145412.14937-15-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110145412.14937-15-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: thuth@redhat.com, kvm@vger.kernel.org, maz@kernel.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
 kvmarm@lists.cs.columbia.edu, eric.auger.pro@gmail.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: b1gZJqIvTVPi

On Fri, Jan 10, 2020 at 03:54:10PM +0100, Eric Auger wrote:
> Let's link getchar.o to use puts and getchar from the
> tests.
> 
> Then allow tests belonging to the migration group to
> trigger the migration from the test code by putting
> "migrate" into the uart. Then the code can wait for the
> migration completion by using getchar().
> 
> The __getchar implement is minimalist as it just reads the
> data register. It is just meant to read the single character
> emitted at the end of the migration by the runner script.
> 
> It is not meant to read more data (FIFOs are not enabled).
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  arm/Makefile.common |  2 +-
>  arm/run             |  2 +-
>  lib/arm/io.c        | 13 +++++++++++++
>  3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index 7cc0f04..327f112 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -32,7 +32,7 @@ CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib
>  asm-offsets = lib/$(ARCH)/asm-offsets.h
>  include $(SRCDIR)/scripts/asm-offsets.mak
>  
> -cflatobjs += lib/util.o
> +cflatobjs += lib/util.o lib/getchar.o
>  cflatobjs += lib/alloc_phys.o
>  cflatobjs += lib/alloc_page.o
>  cflatobjs += lib/vmalloc.o
> diff --git a/arm/run b/arm/run
> index 277db9b..a390ca5 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -61,6 +61,6 @@ fi
>  M+=",accel=$ACCEL"
>  command="$qemu -nodefaults $M -cpu $processor $chr_testdev $pci_testdev"
>  command+=" -display none -serial stdio -kernel"
> -command="$(timeout_cmd) $command"
> +command="$(migration_cmd) $(timeout_cmd) $command"
>  
>  run_qemu $command "$@"
> diff --git a/lib/arm/io.c b/lib/arm/io.c
> index 99fd315..ed89e19 100644
> --- a/lib/arm/io.c
> +++ b/lib/arm/io.c
> @@ -87,6 +87,19 @@ void puts(const char *s)
>  	spin_unlock(&uart_lock);
>  }
>  
> +/*
> + * Minimalist implementation for migration completion detection.
> + * Needs to be improved for more advanced Rx cases

Please add that QEMU supports reading a maximum of 16 characters in
this minimal mode. We could even add a counter and then assert if
we try to read 16 or more.

> + */
> +int __getchar(void)
> +{
> +	int ret;
> +
> +	ret = readb(uart0_base);
> +	if (!ret)
> +		return -1;
> +	return ret;
> +}

What about taking the lock?

>  
>  /*
>   * Defining halt to take 'code' as an argument guarantees that it will
> -- 
> 2.20.1
> 

What do you think of the __getchar below?

Thanks,
drew


diff --git a/lib/arm/io.c b/lib/arm/io.c
index 99fd31560084..77beb331d6b2 100644
--- a/lib/arm/io.c
+++ b/lib/arm/io.c
@@ -79,6 +79,31 @@ void io_init(void)
 	chr_testdev_init();
 }
 
+static int ____getchar(void)
+{
+	int c;
+
+	spin_lock(&uart_lock);
+	c = readb(uart0_base);
+	spin_unlock(&uart_lock);
+
+	return c ?: -1;
+}
+
+int __getchar(void)
+{
+	static int count;
+	int c;
+
+	if ((c = ____getchar()) != -1)
+		++count;
+
+	/* Without special UART initialization we can only read 16 characters. */
+	assert(count < 16);
+
+	return c;
+}
+
 void puts(const char *s)
 {
 	spin_lock(&uart_lock);

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
