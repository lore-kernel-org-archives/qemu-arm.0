Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp494414njc;
        Thu, 8 Aug 2024 05:58:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEZQ8Xgi9s3I5BFQEBrYlNodxMrHCMx/JTCGtHr3+Seh51WX2vuxvsEcqz9vh0swi31kiZtFITeeKZbpHieAhtIRYR0fA6
X-Google-Smtp-Source: AGHT+IF7OLTDkGpjMLu6nzVujQq5VKjeehy7S1lybYTEYdKsOSKHFEdJLNpL5aT/j2V3YK5cQtVp
X-Received: by 2002:a05:6902:1023:b0:e0b:a34f:9793 with SMTP id 3f1490d57ef6-e0e9daafe76mr2043302276.21.1723121881793;
        Thu, 08 Aug 2024 05:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723121881; cv=none;
        d=google.com; s=arc-20160816;
        b=lyVZ1W0alaYgnrtPL2d8nUwqVWhpL5b9odY2LsXf9MKT+X1dRTPk92McymHbzGLnVF
         cdoErCft9uRW+vm7Tn6SFwHonzRTER2ApfSdHQasaYL1m4XORAOmnBB/EF2dUGhjeFeg
         USlBXi0ml2g88T25IejvIP6MKpPCrAPEhKZV/73HbDi/HGO7rPqfnMMyRz721CkfzkjG
         7SaIc73E96BTRUZx+FZb/tHyugeSktH23zeDQNCBtMbjHNUF3yJCfTPNlnJVckzjYow0
         ll2ERDFjQGlFidBnpPcy2tOauBSfMRvW/YN0YMSEf3CDmp/Eovg9RukyeIiYVmsxiRB5
         HmwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:from:date
         :dkim-signature;
        bh=n0dg4VZfsfwi1vaB6XtEii1EzfQUDvruZlW3sNjRZDg=;
        fh=FztTI5qMvVbE0NQvwTnwFqXh2/iK6kULt8SaRfQ01v8=;
        b=hlTXXigsyd7xbDu0pmdcpVfs1H4EgEZjL6WFjaXjcD/qPKxrdrOsh5yTrH0zlEGWxf
         4GXvIm5whCPx7blfyijIHFaGnms4TvJCrjNNLIaxYY7oVQXa9Q+YFuF7H7qlkmU9lUPh
         tx8zb0rOdKOyWRfWDO9U/wWEkRw2R41K+D1chW70O9ybly/L1gkUpA7S9lyhTlK8N6Wd
         JuGxEdG+LlPzAqxTAYdYbLK51wdgt5fEu6X7E1Svhp6P9bsOMYmNz/xQ6KG24AFyvR2U
         20ioUMcgLz/CNwLoo5n2K0S56ceEgMQVD//Wqm4LzY2hzrG4s51NffVL7co6NB6L0gMR
         2z5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jL7xCT1B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a3785f8d5asi414210685a.55.2024.08.08.05.58.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 05:58:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jL7xCT1B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sc2iD-0006FO-U7; Thu, 08 Aug 2024 08:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1sc2i8-0006Dk-KS; Thu, 08 Aug 2024 08:57:45 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1sc2i6-0001qj-PP; Thu, 08 Aug 2024 08:57:44 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 68DA861653;
 Thu,  8 Aug 2024 12:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EBF9C32782;
 Thu,  8 Aug 2024 12:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723121860;
 bh=Iktp01tK2DrO7g0ygEnpzyl+ejX/bXOo+4ZZZfl+E4k=;
 h=Date:From:Cc:Subject:In-Reply-To:References:From;
 b=jL7xCT1B8q7RbQQW3OONnhAcTRkSRqvyC5YB5ObWzYkYd6L5XR5GengkzYhIpRhaJ
 FdCQE0jfyjnGZ2AFjZ2UFaz7zHJbOlRB41xl9BgqvMwD3AwQx8ssplaGmpsY48GISB
 dmj17vxv8evvsvoCGbho72fb9+dZU7e9vmKevXD0vX4oMrvk939pk1APCwCAn2oRX0
 ELWffz5j60nuvSZQ+Oh6FBSOXF+FTW57YqbwdX90mtSQMQr9CAk8wzFtUo3L0ll6jt
 BJO7SwWcin1nUVjzRyedOm5SahZzpx/SIlNaObVG5C8j3y6NebrT5dzyC/MOvVTNpd
 A9N8g5hx1h6xw==
Date: Thu, 8 Aug 2024 14:57:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 00/10] Add ACPI CPER firmware first error injection
 on ARM emulation
Message-ID: <20240808145735.70f81f76@foz.lan>
In-Reply-To: <cover.1723119423.git.mchehab+huawei@kernel.org>
References: <cover.1723119423.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: j42R8cscFc5n

Em Thu,  8 Aug 2024 14:26:26 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> v6:
> - PNP0C33 device creation moved to aml-build.c;
> - acpi_ghes record functions now use ACPI notify parameter,
>   instead of source ID;
> - the number of source IDs is now automatically calculated;
> - some code cleanups and function/var renames;
> - some fixes and cleanups at the error injection script;
> - ghes cper stub now produces an error if cper JSON is not compiled;
> - Offset calculation logic for GHES was refactored;
> - Updated documentation to reflect the GHES allocated size;
> - Added a x-mpidr object for QOM usage;
> - Added a patch making usage of x-mpidr field at ARM injection
>   script;

Forgot to mention: I dropped the PIN cleanup from this series, submitting 
it in separate - and it is not related anymore with this changeset:

https://lore.kernel.org/qemu-devel/ef0e7f5fca6cd94eda415ecee670c3028c671b74.1723121692.git.mchehab+huawei@kernel.org/T/#u

Thanks,
Mauro
