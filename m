Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp945722lfc;
        Tue, 13 Jul 2021 13:48:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1Fsfj9IJLqoPloyyUaVqhy85WJZoDjoJwnQ2UP3SCLUqoIL8HjhSWfonACl+jlsPiaVdd
X-Received: by 2002:a02:c013:: with SMTP id y19mr5674001jai.36.1626209280631;
        Tue, 13 Jul 2021 13:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626209280; cv=none;
        d=google.com; s=arc-20160816;
        b=i319I3FnpDIWozVhmVqkP/um6En7NefxQ+Nvm6LpqNvEFhqzhKc5pCxHd1tgb6NJw2
         S3qSCg9jNd4Vh3V3juS02pQfWasxux+zNqkWKQa7TkTrxzX0EanAP81m8VkKng62yii5
         piGhQ2nQ1GLSGetc3MomtVqMCE76Tg883K/ONcgbu85ADKWRRzEDylgAMfOZQq4ZhSEl
         R59fX+HwTOuRvdgyf9eAhEXDJad2UxdvQ/PqhztzLGSxrcGThUJ3fdOuoZro8JOXevHC
         qKyBXJYrTdcKUxplHJZxtED8ToKZ3QMFc1NBw1wCs+5hqEH2bQyG5cT9V2waVAEUeJIL
         N9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=edgULd724qxW2wczl2lL2drDkUNp/TtLehg+wvSDn60=;
        b=maCgkp2oJ0Hzrg9lx9HlVty9b/0TJaEgj/zfAE+vJQ/PV1QSuhqpg8exxJrarTSJ9A
         qB4zs3EWC7L8nITS+OLCs9cyEE7iWqf/2XHH9n9dqWcg2ssB6kfqj7T65jtGRkT52gEy
         2VICVLo4cAtSiRF26ujNTi6rwGrKhVKmpcVB9iPV8Xql1ayrEM255g3EoGZxKKlnU76H
         Xy8SURT+qyUnUAUZP+xDmRfp7Uo5XZQ83y8kror8ZOgng6wJ2b0lx9o51ZMsmHBqYn6n
         MuWVNC8JScpUzNylE56lsm3Pub3OWGDm5sXMxUxEFZLc5AmUTfuRICKUX285z7wz56gK
         gTeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ar4ojXmG;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id n26si5542708jam.80.2021.07.13.13.48.00;
        Tue, 13 Jul 2021 13:48:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ar4ojXmG;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235423AbhGMUut (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 13 Jul 2021 16:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35510 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234172AbhGMUut (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 13 Jul 2021 16:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626209278;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=edgULd724qxW2wczl2lL2drDkUNp/TtLehg+wvSDn60=;
        b=Ar4ojXmG6Q2dkV0Jpk/t4opwXDoPvp8YcsUOXGwFqL68Ia0SroRRh/i8jGFvd7FuhXBdon
        VRIiR+q48SU5cZO4ukljvADEq1yYwykubo88VPUYqXOkyf/74Yc/fQY/PGSbm87wjUPCNx
        aNufL5LYJNU2YO4BnI4bzHiEluAQoy8=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-XhlHF-M0PPGNFtBWrIPYpg-1; Tue, 13 Jul 2021 16:47:57 -0400
X-MC-Unique: XhlHF-M0PPGNFtBWrIPYpg-1
Received: by mail-il1-f197.google.com with SMTP id h17-20020a056e021d91b02902004a17fb0aso15587397ila.3
        for <kvm@vger.kernel.org>; Tue, 13 Jul 2021 13:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=edgULd724qxW2wczl2lL2drDkUNp/TtLehg+wvSDn60=;
        b=I09LR9+tJOsAh8tAX6JtQU8bt8hrjUC/P4deFpMMuonUumBJSbtHCM0Vx95s0j2zlR
         4RTzvIsPfOJLUUS7vD3LB0pEyz3dkDrugqH3OcvqL0kvrVz0juhmn4S01Z7B1YtrTi9L
         DEQgukjFeaXSslTb5jnzf+oeMcFcpPekVMu1VnDcEnnyfUaOsmSed5BphZQE/yUUgJ50
         wc/8ITYBcnSHLSWXJMRhCXXOHQ1qWvmemXv2YQql06ZPc6hHs92biCSJ75EBJCcga9dC
         zfYGOBVhX8K9w/HM5Mb53rZvCJz1DBMRHFIpSzi0RDPI4fMdWzlnoGP+0IdBnBuecCFn
         WAdw==
X-Gm-Message-State: AOAM530XVNfldvjaNiQkCSQgjG7RRx4tzf5WVXXSLPWBILwMmh/dTduy
        0DrbhkBxnxdY0GuIzVJdwWmXwMVzHU1VtY4rTzh6q7OSipplZ0fHMV9iprkOwF37wcLNOR8Sujr
        8rWVkk2bEXqt8
X-Received: by 2002:a92:db4e:: with SMTP id w14mr4382867ilq.188.1626209277264;
        Tue, 13 Jul 2021 13:47:57 -0700 (PDT)
X-Received: by 2002:a92:db4e:: with SMTP id w14mr4382859ilq.188.1626209277118;
        Tue, 13 Jul 2021 13:47:57 -0700 (PDT)
Received: from gator ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id s6sm22547ilv.76.2021.07.13.13.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 13:47:56 -0700 (PDT)
Date:   Tue, 13 Jul 2021 22:47:54 +0200
From:   Andrew Jones <drjones@redhat.com>
To:     Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc:     kvm@vger.kernel.org, maz@kernel.org, shashi.mallela@linaro.org,
        qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
        linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com
Subject: Re: [kvm-unit-tests PATCH v2 2/4] scripts/arch-run: don't use
 deprecated server/nowait options
Message-ID: <20210713204754.xg3eawok4m6q7ulk@gator>
References: <20210525172628.2088-1-alex.bennee@linaro.org>
 <20210525172628.2088-3-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210525172628.2088-3-alex.bennee@linaro.org>
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: XomV4y+WdQjo

On Tue, May 25, 2021 at 06:26:26PM +0100, Alex Bennée wrote:
> The very fact that QEMU drops the deprecation warning while running is
> enough to confuse the its-migration test into failing. The boolean
> options server and wait have accepted the long form options for a long
> time.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  scripts/arch-run.bash | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 5997e38..70693f2 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -122,14 +122,14 @@ run_migration ()
>  	trap 'kill 0; exit 2' INT TERM
>  	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
>  
> -	eval "$@" -chardev socket,id=mon1,path=${qmp1},server,nowait \
> +	eval "$@" -chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
>  		-mon chardev=mon1,mode=control | tee ${migout1} &
>  
>  	# We have to use cat to open the named FIFO, because named FIFO's, unlike
>  	# pipes, will block on open() until the other end is also opened, and that
>  	# totally breaks QEMU...
>  	mkfifo ${fifo}
> -	eval "$@" -chardev socket,id=mon2,path=${qmp2},server,nowait \
> +	eval "$@" -chardev socket,id=mon2,path=${qmp2},server=on,wait=off \
>  		-mon chardev=mon2,mode=control -incoming unix:${migsock} < <(cat ${fifo}) &
>  	incoming_pid=`jobs -l %+ | awk '{print$2}'`
>  
> -- 
> 2.20.1
> 
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm

Applied to misc/queue

https://gitlab.com/rhdrjones/kvm-unit-tests/-/commits/misc/queue

Thanks,
drew
