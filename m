Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1238CCD98D2
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 04:50:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZLkf-0006My-5d; Tue, 16 Jun 2026 00:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZLkX-0006Id-G3
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 00:50:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZLkU-0000sP-IN
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 00:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781585403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t59E2aouq/3QjefgJDM5lIaSX+On9iGlsZVXPZNqm54=;
 b=UE6DpPWSKcXE0fqiWeivrfBlhMIQa+2UiwWqBhtdVnDn+BB8NI09TqMMHJ5KnzTAa8RQb3
 gFTH71xuarjDCTIdUpGUF7TZkiiCvZKLvGkNUsaWH/Rb7u/dhfWYrSx8zcSw0St5Yh5EFh
 45jLw5Y0NHhVF5MC+3ox+k0ISNhfhVU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-FcP5uM1OMz2FbpBT3Jd3vA-1; Tue, 16 Jun 2026 00:50:02 -0400
X-MC-Unique: FcP5uM1OMz2FbpBT3Jd3vA-1
X-Mimecast-MFC-AGG-ID: FcP5uM1OMz2FbpBT3Jd3vA_1781585402
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-4600c8cb13aso2927159f8f.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 21:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781585401; x=1782190201;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t59E2aouq/3QjefgJDM5lIaSX+On9iGlsZVXPZNqm54=;
 b=WrvjT2GOxhePIwmjFPHAHDiYASIKro7wF+ucQv/1TaV5HLiQZVDCOjaJ71s8oSdIwh
 Q56keaPlOCtSETwg5O8lbCvtzlxLnCZ56KZ8Dnr/CyMIZYEB5j4pAfy+4QG4x8hGtuSt
 62jx8sa00c9xc8uWBBE/vjNLAAEOAUBDl8IOZacjeEHnDCCH+6BA91yfhJboqBxqfhKB
 5tNFIMsfR3yxxfWajpHtp5jR2IBgO7y7lXNliPWoILKxiPjBuQvSeK9c4JFxZr+IjYdW
 JMbe3I/pfDSKrvgvtRkkUXdpX6rgvY1Ma6p7IbdrXLx2PBZJqkiSsULm2Gr/NfoUBnue
 qxew==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Dm6m4yQYes+C0CpsikhzJ2SBL94oLyLDQ9zZWedLm6eKxmRTrQ5r7Ze6LNp32l65bCeYtg//Vrw==@nongnu.org
X-Gm-Message-State: AOJu0YzJsAoJv95cUMxJM70k825/4M0A97L8ERtA+v1CuSY/IPCjnIbJ
 VwytTix3P793v9fdkU7tsN9nQdTMGQ2P/E1qXcmGcPXq1vidlSv5UiQFOxAGvT0DnUo9NIiQZMB
 r3tcsCxzrKG6HC1eY9lZmgT0c+qxPa0oJQyJA6vdfF1u2XWHy5YoyDg==
X-Gm-Gg: Acq92OEjnKhx7CVdkizKox7VOQ4jimm2m7ksysPyzo27wkZjoNpHk3FNYTNMV/kvFi0
 orkjtoeYwlnMYohJ0ytPXMsF/+djeDB+09ttfgkjCuaOctkh6fe5b52SjAF4/wFrIlDNWWnYlGn
 2kLJogL/AdyLN5AaHVSbvX3s0MNyLorAKemUpHkP0qHnknEHRO7Q4UNbiOUaqE1GcgWyhStjExg
 kUapegoZJX9dhvZ9P2D1SRxsQmpTuq4ZNrGrhYfxz5qHlJz1+YKZ3irjcSfx+9Hgxa6CaAUNK77
 tlpKVloXfjkLSGjbQwAcCoAz+Pbj2UjgAUq53g6wAhgwwE3dQVT64w7GwnbpU4aDjyIksAIJg2x
 0Dx/+UxXJkbDRMgm11NaE7jvM3fDxryxDMJDT8luK0v8=
X-Received: by 2002:a05:600c:3144:b0:48f:e3e7:3d39 with SMTP id
 5b1f17b1804b1-490ec4d523dmr231372415e9.11.1781585401422; 
 Mon, 15 Jun 2026 21:50:01 -0700 (PDT)
X-Received: by 2002:a05:600c:3144:b0:48f:e3e7:3d39 with SMTP id
 5b1f17b1804b1-490ec4d523dmr231372005e9.11.1781585401026; 
 Mon, 15 Jun 2026 21:50:01 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f263923sm41116604f8f.2.2026.06.15.21.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 21:50:00 -0700 (PDT)
Date: Tue, 16 Jun 2026 00:49:56 -0400
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
Message-ID: <20260616004924-mutt-send-email-mst@kernel.org>
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
X-Mimecast-MFC-PROC-ID: Pr0YytMIEC0GNVYG7-RzbtxXSHIBC4bgPmIuC5q0JHw_1781585402
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

as in, same byte?  could you share the details pls?


