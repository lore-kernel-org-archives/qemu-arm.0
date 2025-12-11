Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C2DD3E79C
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Dec 2025 07:44:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTbLC-0007oV-V5; Thu, 11 Dec 2025 02:43:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vTbLA-0007n6-Td
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 02:43:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vTbL7-0003IQ-Rn
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 02:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765439032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdHwfIMOSqmJi4voReMm4CLdhu943VbCVD6b1qLqf6w=;
 b=E0cJ8oP+527y0L1OXz4L/hYA+13V5YewWczGQOeDygcJispMZZJyA4uAUEEWd9Dfyks43R
 AfJYDW5/23W1TYyY1qrFfHYKRdzlwUMt9SLM0Xm4SqaiwxVrF3RB6OpP6y2UtsvGwsvkxV
 CzuMCDbFt3kBYnSMA9ePLejQsiVTSFE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477--ibSNP1UOg69sM1qo9M6PQ-1; Thu, 11 Dec 2025 02:43:50 -0500
X-MC-Unique: -ibSNP1UOg69sM1qo9M6PQ-1
X-Mimecast-MFC-AGG-ID: -ibSNP1UOg69sM1qo9M6PQ_1765439030
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4779981523fso4608735e9.2
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 23:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765439029; x=1766043829;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hdHwfIMOSqmJi4voReMm4CLdhu943VbCVD6b1qLqf6w=;
 b=uTSUgeZ7sF5o3VUsAyMpwdfOhmiPREgu+fMuzMhrl4c361Wpg55uZQMlEfCiZ3nT8N
 jiECwHpieT28nqrXqjHEz+HYT0gElatGbxK/BQxzVC9o0RnBCKI1CewTyXhrfab6jAX4
 s/fAZTeUPIy3v8Y6Q79mXPPrXt58mi1Se33KVs2ueBzisN1B9tO6z6fmxp2pxCRH2ZXl
 AU5crPg4ihe83Xe2O8msxO3PWCVJchTs3MnbvS4YbVmFhURRpV0mrbMIZbXTPUHQBEf5
 1tlUqSnAjsZLrVwykOTslS4Y+D4SZwUfAcuidPOlZNcfPC1QNHl5vwRy2WrwdvAIWjZc
 EcSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX2WvJEMtGiXBPKGxJPu2JYv//sZcfY+m7w0Y3WaX1sU2gv6/VDW0YJifvNWT6w0MkCr1TccyIkQ==@nongnu.org
X-Gm-Message-State: AOJu0YxeTySMGAquQfiM52WZzny7Z18qiN3NLzoe+h3lJ+UYham12S6E
 eBlWU205gA8JXuiWACVsISmqtKEBQU4GVC3STnPWy9gtZhNQfKFUg3tWU2Vxmm4WhOwnM9nXXx9
 28kkY/7Xe802jpv53s/TtFcTD4x+m6leK9BNZvwWbeQOS9hPg2MK6pQ==
X-Gm-Gg: AY/fxX5o/Y3gq4DsAS4N3fNuLfcqmdLy8knff5h956BfnLkvngi8R5nx31MNnvpjGlm
 IABTr55c/LBCmztjyAYh1g2lFuQxqWI54grxufiemdhM9yerCliJR1WsdpXuiaMSXtV7Hr6oG50
 aH1nofCDeXveiVZOsDDuPNaTr2lwBksXCu5IM5VZP58euHZx1GwRmkfDgH+RYYGHqhkSjtMAyZe
 4ZRzP8pAoyfDJr/Ccr5Gl+sd4KzH0fjW+hBlF/lN8U0jFg8hGZA70AbQuWNoseLKrkc5Zsqky71
 oXPnwD8QRZ4EqnJZ4EsV+bk1O3F3c698PTrdcALWE5874Yxq1ZR7qwHUGc9ppce4tB0KO3zFfpX
 0Hj/HvJkVlyKiFCWjzxTQuUalir4Q07k=
X-Received: by 2002:a05:600c:1e88:b0:479:2a3c:f31a with SMTP id
 5b1f17b1804b1-47a8374dd66mr48442165e9.1.1765439029631; 
 Wed, 10 Dec 2025 23:43:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSn7+CKyaFRKexfHtYHCS5b5BMpJEKHtn1k2D/fxiPlRSJfU8jhdIXzOpsHVW9HFB77JekLw==
X-Received: by 2002:a05:600c:1e88:b0:479:2a3c:f31a with SMTP id
 5b1f17b1804b1-47a8374dd66mr48441925e9.1.1765439029188; 
 Wed, 10 Dec 2025 23:43:49 -0800 (PST)
Received: from redhat.com (IGLD-80-230-32-59.inter.net.il. [80.230.32.59])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a70440sm3969094f8f.16.2025.12.10.23.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 23:43:48 -0800 (PST)
Date: Thu, 11 Dec 2025 02:43:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Li Chen <me@linux.beauty>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?=22Philippe_Mathieu-Daud=E9=22?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <gaosong@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-riscv <qemu-riscv@nongnu.org>
Subject: Re: [PATCH REPOST v4 4/4] acpi/virt: suppress UART device & SPCR
 when guest has no serial hardware
Message-ID: <20251211024304-mutt-send-email-mst@kernel.org>
References: <20250528105404.457729-1-me@linux.beauty>
 <20250528105404.457729-5-me@linux.beauty>
 <20250714144303-mutt-send-email-mst@kernel.org>
 <1981309e2fa.31709fd32611761.5900055972026140740@linux.beauty>
 <20250716074207-mutt-send-email-mst@kernel.org>
 <198131a686b.18fb34702623779.7633947002456257034@linux.beauty>
 <1995f320053.73c58bde124269.3373604835167896043@linux.beauty>
 <19b0837500d.2713ffb3821327.2786629512090065997@linux.beauty>
 <20251210075237-mutt-send-email-mst@kernel.org>
 <19b0ab7f203.43fecb3b140213.6490567972995015069@linux.beauty>
MIME-Version: 1.0
In-Reply-To: <19b0ab7f203.43fecb3b140213.6490567972995015069@linux.beauty>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JxorWQ7AT7-hSZczKJRq6tPcoV7RTDeAPtHElS7r7n0_1765439030
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On Thu, Dec 11, 2025 at 08:03:05AM +0800, Li Chen wrote:
> Hi Tsirkin,
> 
>  ---- On Wed, 10 Dec 2025 20:53:01 +0800  Michael S. Tsirkin <mst@redhat.com> wrote --- 
>  > On Wed, Dec 10, 2025 at 08:23:21PM +0800, Li Chen wrote:
>  > > Hi Michael,
>  > > 
>  > >  ---- On Fri, 19 Sep 2025 07:38:56 +0800  Li Chen <me@linux.beauty> wrote --- 
>  > >  > Hi Michael,
>  > >  > 
>  > >  >  ---- On Wed, 16 Jul 2025 19:59:14 +0800  Li Chen <me@linux.beauty> wrote --- 
>  > >  >  > Hi Michael,
>  > >  >  > 
>  > >  >  >  ---- On Wed, 16 Jul 2025 19:42:42 +0800  Michael S. Tsirkin <mst@redhat.com> wrote --- 
>  > >  >  >  > On Wed, Jul 16, 2025 at 07:41:11PM +0800, Li Chen wrote:
>  > >  >  >  > > Hi Michael,
>  > >  >  >  > > 
>  > >  >  >  > > Thanks for your kind review! All issues below have been fixed in v5:
>  > >  >  >  > > https://lore.kernel.org/qemu-devel/20250716111959.404917-5-me@linux.beauty/T/#m696cee9a95646add1b74b866c3d6761aa4c5c762
>  > >  >  >  > 
>  > >  >  >  > Past soft freeze now: I tagged this but pls remind me after the release
>  > >  >  >  > to help make sure it's not lost.
>  > >  >  
>  > >  > Gentle reminder: This patch is still missing from the latest master branch, but can apply without
>  > >  > any conflict. Can it be included in 10.2?
>  > >  > 
>  > >  > Regards,
>  > >  > Li.
>  > >  > 
>  > >  > 
>  > > 
>  > > Sorry for bothering again. But I'm still unable to find this patch in the latest master branch, though it applies without conflicts now. 
>  > > 
>  > > Could it be merged now?
>  > > 
>  > > Regards,
>  > > Li​
>  > 
>  > you still need to update loongarch, I think. otherwise these tests will
>  > fail.
> 
> Yes, it seems that tap stdout is polluted by serial stdio.
> 
> I'll address the stdout pollution from -serial stdio by redirecting serial output to /dev/null using -serial null in the next version. 
> This will still create the serial device but prevent it from writing to the console.
> 
> Regards,
> 
> Li​

I don't know about that, what I meant is that loongaarch also has SPCR
so it's expected tables have to be updated.

-- 
MST


