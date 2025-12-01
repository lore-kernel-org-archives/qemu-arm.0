Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96106D116F1
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Dec 2025 09:31:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQ0Fu-0006eo-C3; Mon, 01 Dec 2025 04:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vQ0Fo-0006bs-AG
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 04:31:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vQ0Fm-0006iY-6S
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 04:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764581488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2LKeAYfETFbC7/6TgYjVAonRRiDR9BymVeVFN92O/pA=;
 b=DYoRymdpGX1/sREH3gT/XgbpS+BSQlRP90Th4GNuvbnoEkFdcK8SpQ0JNFCCQ0skY7J8Nw
 ijl7KA93peUtuhwgmZIvkqp7ltGEhDfi2m62wLSEUZlUBGI9CXs7yHRc1WH/hjK4h/YBjT
 BAcl1n3j6LJ1t911EHYhEi65hknIIDM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-3n3KGvGIMhe96vbmwN_yPQ-1; Mon, 01 Dec 2025 04:31:27 -0500
X-MC-Unique: 3n3KGvGIMhe96vbmwN_yPQ-1
X-Mimecast-MFC-AGG-ID: 3n3KGvGIMhe96vbmwN_yPQ_1764581486
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4779da35d27so49178495e9.3
 for <qemu-arm@nongnu.org>; Mon, 01 Dec 2025 01:31:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764581486; x=1765186286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2LKeAYfETFbC7/6TgYjVAonRRiDR9BymVeVFN92O/pA=;
 b=Kj5ngyrEVb8J4KEwqli4uFVQvXhKYRgg+FbV82XOMyonJZMEzbmKVx3yoN8kZv06+x
 yZsXw4w1iBoAnECAb+lGBrWF5jxLdJnkluMSlery+U73kJGyaJ1hGiwAfXUuahsCqEnX
 M+6CSzVcVmh6qshGlwaoUUjbFbqzGlJMTcQotY68S5z1KAL2YmfWWkLTdw9yTb94w1qo
 Wr69xwJF1p2vP4xwyiTFl6KyfmBVvEIwgn020s8+Eovwfkkvrhs6FkC8cWuFPa/Y9E+I
 JdZZJKeMRAXJRKg6TagwNtL5NDKU9HzAhzHVyo7YoBY9FTK+UIzyVTZCtZqEJp2CtgoW
 a3Yg==
X-Gm-Message-State: AOJu0YyjTf7RztERU6E1sEftE37oPPgdfh89L6CEhlr7pK/c/asjJ+ab
 7LXJig+KK0sc9SMr4npDr3OWtv55FDgsxNTPXxRu4jySkJMnNLCVx2/B1c8pYEzsL1jchqBG5vU
 tUttXzUZW8biN+fedlXK6/9sjth0890Jgr3UbM7lpybhqO6QSYhMgBQ==
X-Gm-Gg: ASbGncsv+qHdyC5aKRaND4R768GHfslZEjMO0K3yUsGokruJasb8/+y/T23R4EKbGjN
 P2qngwoVpKgaOSCsXkKoTjzhYmptq7blDBaUQvBPKh4WUeijjy6a5LMRWn9k9b87ajoQgvYL1c5
 AjH8zCW08Tnpe7FIZLCcSF5kqhRPGwzLQQMVNH0yoBIv89JCShh8Lpnrh3Rbt167FwCDmXikq7v
 D668jGqgm11l2FW+MsabWVMiBl59HKkWeNqtPiP02DQWGvCOb58AEfnlXbrxCmahb3p5/k6JBGa
 R8/9WFHlyNuQpM5znR+qOMQsef0nZDRs/aFabmRqvtUFucykbpB42McE5XLjUQctzuOE6A==
X-Received: by 2002:a05:600c:68c7:b0:479:1b0f:dfff with SMTP id
 5b1f17b1804b1-4792095f3b5mr25845615e9.10.1764581485905; 
 Mon, 01 Dec 2025 01:31:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjzndHATg1+1FFpXTHP2mf1XB+umhMBDLRW85OSAkS9EzrFkW85Ln41dPdm5B09o3aDfeTiw==
X-Received: by 2002:a05:600c:68c7:b0:479:1b0f:dfff with SMTP id
 5b1f17b1804b1-4792095f3b5mr25845275e9.10.1764581485496; 
 Mon, 01 Dec 2025 01:31:25 -0800 (PST)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790add608bsm295686465e9.5.2025.12.01.01.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 01:31:25 -0800 (PST)
Date: Mon, 1 Dec 2025 10:31:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mchehab+huawei@kernel.org,
 jonathan.cameron@huawei.com, armbru@redhat.com, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 0/5] acpi/ghes: Error object handling improvement
Message-ID: <20251201103123.6b934668@imammedo>
In-Reply-To: <53c3c2c4-b8e3-4ca1-a0dd-88148520ad82@redhat.com>
References: <20251127004435.2098335-1-gshan@redhat.com>
 <20251128150926.78bebacb@imammedo>
 <53c3c2c4-b8e3-4ca1-a0dd-88148520ad82@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4myl7e_WLA5D-ssS9j0azGhsQqzyl-eF7rlp3wWRtd0_1764581486
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sat, 29 Nov 2025 11:21:55 +1000
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
> 
> On 11/29/25 12:09 AM, Igor Mammedov wrote:
> > On Thu, 27 Nov 2025 10:44:30 +1000
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
> >> This series is curved from that for memory error handling improvement  
> >                   ^^^ confusing
> > based on above I'm not sure if it depends on [1] and shoul be applied on top
> > or it can be merged on its own
> >   
> 
> The current series is a standalone series and expected to be merged by its own.
> 
> For (v4) series of memory error improvement [1], Jonathan wants to extend
> the handlers in the guest kernel so that the granularity in CPER record
> will be used to isolate the corresponding memory address range. With this,
> the patches in the (v4) series to send 16x continuous errors become useless.
> However, those patches in (v4) series to improve the Error (object) hanlding
> are still useful. So I pulled those patches for the Error (object) hanlding
> improvement from (v4) series to form this series.

ok, then I'll review this series and skip v4 for now

> 
> >> [1] based on the received comments, to improve the error object handling
> >> in various aspects.
> >>
> >> [1] https://lists.nongnu.org/archive/html/qemu-arm/2025-11/msg00534.html
> >>  
> 
> Thanks,
> Gavin
> 
> >> Gavin Shan (5):
> >>    acpi/ghes: Automate data block cleanup in acpi_ghes_memory_errors()
> >>    acpi/ghes: Abort in acpi_ghes_memory_errors() if necessary
> >>    target/arm/kvm: Exit on error from acpi_ghes_memory_errors()
> >>    acpi/ghes: Bail early on error from get_ghes_source_offsets()
> >>    acpi/ghes: Use error_fatal in acpi_ghes_memory_errors()
> >>
> >>   hw/acpi/ghes-stub.c    |  6 +++---
> >>   hw/acpi/ghes.c         | 45 ++++++++++++++++++------------------------
> >>   include/hw/acpi/ghes.h |  6 +++---
> >>   target/arm/kvm.c       | 10 +++-------
> >>   4 files changed, 28 insertions(+), 39 deletions(-)
> >>  
> >   
> 


