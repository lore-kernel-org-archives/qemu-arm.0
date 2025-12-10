Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A92D3C53F
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 12:53:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTJgy-0007YU-B5; Wed, 10 Dec 2025 07:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vTJgx-0007Y6-Ao
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 07:53:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vTJgv-0004qy-AY
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 07:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765371190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KSQ/0b5ZS1zhjjfKyGz5j7uGa36FBDvcEwSGC9RfcTY=;
 b=eGFz0kIR/3rVZ55atTWNnZQxIQzeW3DK4HgRXfA1+uzmN0PPzqYkaDK470tLbk7svT//A/
 Xo3uu45Bu9QyI6LvLpzwxUOw95BjrzR2XbkTSkTuUydaatxNkeRAMtaP0rsyfZSShlxhy1
 q3ffYeb+YB/lPm9i7UM+p6BKUu9qn3o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-q7-fCWA-M3KFNJK4iUQWnw-1; Wed, 10 Dec 2025 07:53:07 -0500
X-MC-Unique: q7-fCWA-M3KFNJK4iUQWnw-1
X-Mimecast-MFC-AGG-ID: q7-fCWA-M3KFNJK4iUQWnw_1765371186
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-42b2fb13b79so3397348f8f.3
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 04:53:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765371186; x=1765975986;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSQ/0b5ZS1zhjjfKyGz5j7uGa36FBDvcEwSGC9RfcTY=;
 b=Z1s7IZL4ozV8pN7YF8hhotOStVSlY63C0cplAsUGXUikfx95ATl073fwh35T9E0LZP
 gnKibd+usX5+bOQu8oXVfQ8Koy1XL5qDw0p+ww32mZmVZ5ACPPtzRA9zyhr62O43NcSk
 R6FGAg3T6c6AwwigUqZf5764qZo686T6+DaUOAZcssf88KG3XTIw79lmywqNVlMlJN/x
 nsgKEwej4bBJuwwpUpirvUyxhr2ao/mtFEpSjT6Hn9UHwLAutkH8ylUP+sTXq3TQz2Rp
 m7MFvXJ7F5v3tJwbBijphHmQZH88uGaOxIi821/kmWkMuqRKBy2Cfg/hsmlFdA1iKBSK
 hKJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSScEh43MRbhEZOO5H+POVbjGbVG8wGHNXKC1O4sPZVpdG/RUpf68r62ohiqpTU7JMLXT9bklqOA==@nongnu.org
X-Gm-Message-State: AOJu0YwFCk4WG8/ge7ALiay0hN8i95DmJYCd4zCSntvc7f/QOLjEglPo
 tm5Ys+vjNr1JxORBG7SmY+92IMYQz/qdLRdPI/TV61hptLifTqOEXbFdJA5c4COtS0LbSAyIOqu
 orRW2mDFTjYTSyQr/1KbKN96ZuYWKTlkR8quzxe5O70U0q2gqQSD+Zw==
X-Gm-Gg: AY/fxX409SlyOmdNBhq6L1TgDXLjyOuvq0F4CXgZxMfTKdKEYQdn0kzIUKE26EEvPs9
 HrqBGV0eaOcWbruIC1lAX7Zs+ILgWj2ziBjNIotJuDLWALMN1gbMVKnjCxaLIKof7wF5pMqLAVT
 RFkNsfTqP6AENYUFRcukLnX9IGq8OL3u9bYexLlp1yiTemNuEef5TaVTUKRt9f9cI1S+zYQRcd1
 hsppr7BlPZvQ841xW7LvefyxT0hqmOJoz9HonRUQj0/EBVIp/8mFgNsKs2sWAkr/3q5xxjxNSXr
 NJaOqBoRKZkhsCKunW0UQDwMpDapTlS8YG3dS7R9Ljk1mjRV5qsa89j/DLSpv5TMjj8AKmmzwGb
 P
X-Received: by 2002:a05:6000:2512:b0:429:c54d:8bd3 with SMTP id
 ffacd0b85a97d-42fa3b189ddmr2522293f8f.53.1765371185961; 
 Wed, 10 Dec 2025 04:53:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoslSpUrWPldH2vzLSwkzmvWv47ASfAbfYEB/LsBE9VmJTl8lwEjZaMBd5sdaiYRZWPpz8yw==
X-Received: by 2002:a05:6000:2512:b0:429:c54d:8bd3 with SMTP id
 ffacd0b85a97d-42fa3b189ddmr2522237f8f.53.1765371185456; 
 Wed, 10 Dec 2025 04:53:05 -0800 (PST)
Received: from redhat.com ([31.187.78.138]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d353f75sm37887639f8f.42.2025.12.10.04.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 04:53:04 -0800 (PST)
Date: Wed, 10 Dec 2025 07:53:01 -0500
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
Message-ID: <20251210075237-mutt-send-email-mst@kernel.org>
References: <20250528105404.457729-1-me@linux.beauty>
 <20250528105404.457729-5-me@linux.beauty>
 <20250714144303-mutt-send-email-mst@kernel.org>
 <1981309e2fa.31709fd32611761.5900055972026140740@linux.beauty>
 <20250716074207-mutt-send-email-mst@kernel.org>
 <198131a686b.18fb34702623779.7633947002456257034@linux.beauty>
 <1995f320053.73c58bde124269.3373604835167896043@linux.beauty>
 <19b0837500d.2713ffb3821327.2786629512090065997@linux.beauty>
MIME-Version: 1.0
In-Reply-To: <19b0837500d.2713ffb3821327.2786629512090065997@linux.beauty>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sgLeTR0OMzg_V7yhJK43aM25MqEN2LAHrVR270zz8I0_1765371186
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Dec 10, 2025 at 08:23:21PM +0800, Li Chen wrote:
> Hi Michael,
> 
>  ---- On Fri, 19 Sep 2025 07:38:56 +0800  Li Chen <me@linux.beauty> wrote --- 
>  > Hi Michael,
>  > 
>  >  ---- On Wed, 16 Jul 2025 19:59:14 +0800  Li Chen <me@linux.beauty> wrote --- 
>  >  > Hi Michael,
>  >  > 
>  >  >  ---- On Wed, 16 Jul 2025 19:42:42 +0800  Michael S. Tsirkin <mst@redhat.com> wrote --- 
>  >  >  > On Wed, Jul 16, 2025 at 07:41:11PM +0800, Li Chen wrote:
>  >  >  > > Hi Michael,
>  >  >  > > 
>  >  >  > > Thanks for your kind review! All issues below have been fixed in v5:
>  >  >  > > https://lore.kernel.org/qemu-devel/20250716111959.404917-5-me@linux.beauty/T/#m696cee9a95646add1b74b866c3d6761aa4c5c762
>  >  >  > 
>  >  >  > Past soft freeze now: I tagged this but pls remind me after the release
>  >  >  > to help make sure it's not lost.
>  >  
>  > Gentle reminder: This patch is still missing from the latest master branch, but can apply without
>  > any conflict. Can it be included in 10.2?
>  > 
>  > Regards,
>  > Li.
>  > 
>  > 
> 
> Sorry for bothering again. But I'm still unable to find this patch in the latest master branch, though it applies without conflicts now. 
> 
> Could it be merged now?
> 
> Regards,
> Li​

you still need to update loongarch, I think. otherwise these tests will
fail.

-- 
MST


