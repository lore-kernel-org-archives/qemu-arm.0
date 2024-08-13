Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp301495njf;
        Tue, 13 Aug 2024 16:29:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWj9kGg/k40V9He8WF6hAk96acdf0t8g5OBIcgRHFxZSF8u8b2LwsPdHMkufdifZGQ3CF2qJsiKL//K4BAW9iIvj6mWG++K
X-Google-Smtp-Source: AGHT+IFNVBayViubWHXvzIKs4IBuyofv+xoSjDucYhAlb9c7YicOXO6QZ9tX8KkS3/oVQ85N8/xr
X-Received: by 2002:a05:620a:2906:b0:79f:178f:99ee with SMTP id af79cd13be357-7a4ee31eda5mr154755185a.3.1723591794925;
        Tue, 13 Aug 2024 16:29:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723591794; cv=none;
        d=google.com; s=arc-20160816;
        b=Zsz/G+lQZNMgp+ZzGqSRccF3rV9bFjVoEqGjPQJZhO0+5uz8FMsVRCLCon/upcHb9H
         Y73cvVOskYbS9OJbNlamlGp7hota0/3YMlU3M3zL+LlSBmffJ+YsAumxrVXrGg+CpLi5
         +EIqVpku5KvylHHa4ghrLW7B5YaQQ2z43qxgvVRcohvK83h03OSxb3Gvu8otr8djwmTj
         0Q456q2Hyma/HOQK3AxgVQ7uv3QJUh1DJFilJjbkZlhB2pWt+LmvCu3NmOeSaFPJAwFt
         pJyQJLkHTgL9BQjWRxB3z31knC/e5xMSQjkmN+jPcUl92t/YfiEtcJpKGRJzS1QnV3bM
         zs+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=5m2bf8ezJUIqmQJIqt6VWBffio6gFBPk9foZ7VELNQ4=;
        fh=+IyJvDrUfDVmn0IV+7IVWEwHzfuGfrMp3g4qI5RXuho=;
        b=kem3KomRJRgJCqSomcTWm2x0H5Mcq+dzLOy3JAcrW+30eq7zHBslJKoCpOnHquQAYk
         jKJ8mEL5O5yeeuWCtqtjYktlpjaJOXAq6pRcGt3PGEh8BUh9Sp6F5o+o+r0edsT/pTtL
         swDdH+WDGAra6Ema1y4lGB0jpCHvrRz2W7B/hYIGQOUZWHej0vZAPbQVyOzYqekuDV8A
         8trJDICSBUTZvTZFwJY+Dyep2YPSeGXeBNb+KGhLr4yIfJIdt6Q1iH6Difsgs98FrQVk
         5jtvD23VQPgzbqh/RZ6egUcCpvc13tkebOMmOcTDEg0dWQQk3kIoicFhbGjbnMMVgqB+
         hh+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=QK8pV5uG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a4c7e16862si927978185a.575.2024.08.13.16.29.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2024 16:29:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=QK8pV5uG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1se0xS-0002Cg-33; Tue, 13 Aug 2024 19:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1se0xQ-00024Q-AE; Tue, 13 Aug 2024 19:29:40 -0400
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1se0xO-0007PO-EQ; Tue, 13 Aug 2024 19:29:40 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5E5F5CE17E3;
 Tue, 13 Aug 2024 23:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A2CC32782;
 Tue, 13 Aug 2024 23:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723591774;
 bh=MztplHyL+pZPuymFc0voh9Nuxrk0Y/b6mJ5Y2Bu27Yw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QK8pV5uG5mQGpTMH923Q+lMDVTUXeDOO2zAvfJKsTknDnQMY5cy/7c/JR+7FXbwrc
 a/FAYGX1FaCNFg++4zaQeCSC8HrsHF44Imteaij/+XrvwSjfy3QFLIBjEX0c4qB8Dj
 jFQAfEKxGbuNwp5u4VfjnWuXKWdCrsg5pDZuJBy0y1a+CRNBZ73dQshzLQ2XKVge8B
 sDouCSanm+BRGcSjDWjtmguHtMSzqu4+Uo8+PJ1Hn2sRhIfqyOMI9DijSRNTO5k52m
 AD8VyjSJMKTIFxMu6QhaEQf0JE6k7wQC0jeF9BJ40zi9LHKo059FvKgf8PO9tkB9cQ
 lXW/NL1TXG6ng==
Date: Wed, 14 Aug 2024 01:29:29 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 00/10] Add ACPI CPER firmware first error injection
 on ARM emulation
Message-ID: <20240814012929.59be7ef0@foz.lan>
In-Reply-To: <20240812141835.50749f0e@imammedo.users.ipa.redhat.com>
References: <cover.1723119423.git.mchehab+huawei@kernel.org>
 <20240808145735.70f81f76@foz.lan>
 <20240812141835.50749f0e@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=mchehab+huawei@kernel.org; helo=sin.source.kernel.org
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DruQL7D/fiCj

Em Mon, 12 Aug 2024 14:18:35 +0200
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Thu, 8 Aug 2024 14:57:35 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Em Thu,  8 Aug 2024 14:26:26 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> >   
> > > v6:
> > > - PNP0C33 device creation moved to aml-build.c;
> > > - acpi_ghes record functions now use ACPI notify parameter,
> > >   instead of source ID;
> > > - the number of source IDs is now automatically calculated;
> > > - some code cleanups and function/var renames;
> > > - some fixes and cleanups at the error injection script;
> > > - ghes cper stub now produces an error if cper JSON is not compiled;
> > > - Offset calculation logic for GHES was refactored;
> > > - Updated documentation to reflect the GHES allocated size;
> > > - Added a x-mpidr object for QOM usage;
> > > - Added a patch making usage of x-mpidr field at ARM injection
> > >   script;  
> 
> stopping review at 5/10 and expecting a version with
> GHES source to error status block mapping fetched from
> HEST in guest RAM, instead of pre-calculated offsets
> in source code  (as in this series) to avoid migration
> issues and keeping compat plumbing manageable down the road.

Done. Sent a version 7 addressing it, and the other received
feedbacks. On this version, there are just two offsets used
during error injection:

1) the ack offset: represented relative to HEST table;
2) the CPER data offset: relative to /etc/hardware_errors table.

Thanks,
Mauro
