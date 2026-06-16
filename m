Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3CDCD98CE
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 05:00:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZLuH-0008Hl-MG; Tue, 16 Jun 2026 01:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZLu2-00087w-Sm
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:00:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZLu0-00039N-LU
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 00:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781585996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1ScDbw7m6rHm2N0a/Pk/kh5dtgpYHjB8pJAzSKeJUSo=;
 b=cUUHCQQEs+R6uIZeFLTPJb7QK7r6icQZVvVSmOXTE/4HCq+AWFZvKs8lcXuySOY8HpXmwQ
 rE7S+KlPTlwLGFhVedF7gcW0BrUc7MDVk4fWrmxx+vp0vuYKEAzPxZq6z/vcR3BFWk5lUm
 IlgwVyHewhnTEDoYlCXMnfwDoSJzero=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-nxeQYCTVOMWk3h38ruYpKA-1; Tue, 16 Jun 2026 00:59:53 -0400
X-MC-Unique: nxeQYCTVOMWk3h38ruYpKA-1
X-Mimecast-MFC-AGG-ID: nxeQYCTVOMWk3h38ruYpKA_1781585993
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-49221de4ed4so18510935e9.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 21:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781585992; x=1782190792;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ScDbw7m6rHm2N0a/Pk/kh5dtgpYHjB8pJAzSKeJUSo=;
 b=RrVViSIyOxiiIcd9HtTytayO4/ruOZJQvTzMIasfxm7jMuwXF2EOZYo1Ysre7L5IbH
 /0F7EIpTxbNiyTbitDzssfQZ+Cbi89pOLpajG/twX3aqqEK7hsJbphWHfcDVbBNCizyp
 1ykWvShV9PKRvs2xLFfWI6ES7ereZFUXxyqu7nHLHMUCJ7OyBeNVdFJ86WyFdWXB8ote
 I9uCW7+eJgKNVZydPnmC3fIErij6o3E/n/bWTlDobuSxg2V74qgwy2UogE36UWPGSxru
 9OhK8LPv65WESJSoQ31k+GOcj65NpECSZz6qrvt8sXAYiuTuqlj5MW8KnPe/BRPl1Pg6
 0d6A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8M9CoouExtXtVWGwwE5k60YRexJu4pNcUlnO2hgX2d+byNe5N0XG/4LRibzzuZxvIiHM4q/P7EMw==@nongnu.org
X-Gm-Message-State: AOJu0YwWV6tWESlWztOjrVaVWur5JnB/Wmy8m4fFtGfshAN6niXFp21f
 TE/npfM52xI0+ImvRXAT3ZeCxYl0ZVMeSUxBpKWQkIIFUgkDK/nck3BjSmbrDeUDOg0YJQSmL2e
 mkDcV3wqsK8eggN5tpzh8MLt4i/PSwAVIunSi9ae2xWFGRfVCYrN+1A==
X-Gm-Gg: Acq92OGTxLwbbPvY5QvMeAjSVQsOy0HwNoGbtMv+IQrjDJ93nTBaWM59qJyEex8EDvt
 z8nnjvtkXNVOB146Mt7bLYmWy1RpC1Y/vwIO/k5BrKtHjje5tBbHo5G+/+DGkSbw9gpXQOmYfuW
 yVh/OXHVqIV82fKwz89d01yt2k/stIWekv0oPu2bK1I9NSnLYvtnM3ik1lrbxohOeuU9H0GtdjX
 jUeKOcC7krd7HqDhxPNMh3xVzpw2H8RdksDU5lMrMXqnVJ9NOvsCMP+/EgfGUKTNgsNfNbhgGEG
 TEVLuPHkDFDJyGGDfnUFTNqJsOylkrxQz2gdc8+7SLVb+vyGeYE0+jddrLdHrovPZrG1oi6TDUA
 L58eew8lWcqxOSflZPAcqvIdWoN2Kh4Mj9kZiP+wZ5jc=
X-Received: by 2002:a05:600c:6288:b0:48e:6db3:ff33 with SMTP id
 5b1f17b1804b1-4922ff98d35mr25783665e9.14.1781585992392; 
 Mon, 15 Jun 2026 21:59:52 -0700 (PDT)
X-Received: by 2002:a05:600c:6288:b0:48e:6db3:ff33 with SMTP id
 5b1f17b1804b1-4922ff98d35mr25783325e9.14.1781585991927; 
 Mon, 15 Jun 2026 21:59:51 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f264333sm41829798f8f.4.2026.06.15.21.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 21:59:50 -0700 (PDT)
Date: Tue, 16 Jun 2026 00:59:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 alex@shazbot.org, berrange@redhat.com, philmd@oss.qualcomm.com,
 philmd@mailo.com, david@kernel.org, clg@redhat.com,
 pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <20260616005429-mutt-send-email-mst@kernel.org>
References: <20260615100200.266968-1-gshan@redhat.com>
 <20260615100200.266968-2-gshan@redhat.com>
 <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
 <20260615105556-mutt-send-email-mst@kernel.org>
 <CAFEAcA9Gi43qNZoZcGtq8ioffGwOc_XuhoFAjGx7-bt4U8qfxw@mail.gmail.com>
 <e399ceb9-bc4a-4ba6-8efd-ed2742d0853b@redhat.com>
 <20260615154054-mutt-send-email-mst@kernel.org>
 <22d55870-b521-4002-add7-791bce8ea96a@redhat.com>
 <20260615224658-mutt-send-email-mst@kernel.org>
 <0038f601-7647-4547-a67a-c6a17fae26ca@linaro.org>
MIME-Version: 1.0
In-Reply-To: <0038f601-7647-4547-a67a-c6a17fae26ca@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QQ9z4o8gemDl9-BP4Hgr15rwEJ29xlWFZBvYCXuMYlU_1781585993
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Jun 15, 2026 at 09:48:00PM -0700, Richard Henderson wrote:
> On 6/15/26 21:23, Michael S. Tsirkin wrote:
> > B. Also on x86, I do not see why we should not use memcpy for large
> > accesses if we can. Better perf.
> 
> We have an example where memcpy writes to the same location 3 times.
> This is not appropriate for any host.
> 
> 
> r~

Ah, checked libc and sure enough, it does it. E.g. it uses 2 overlapping SSE
stores to do a 17 byte write. Not sure how we get 3 but whatevs.


But just to clarify, I am talking about DMA accesses, that are not
initiated by the VCPU.  I am not so sure we care about multiple stores
in this instance? Do we? We do care about speed, for sure.


-- 
MST


