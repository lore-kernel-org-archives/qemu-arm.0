Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E2ECD98F2
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 14:39:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waDtK-0007Rs-RD; Thu, 18 Jun 2026 10:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1waDtI-0007RD-V0
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 10:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1waDtH-0001nx-7W
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 10:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781793526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q2yPqyWkhbfSXDTz9k5/9EE4gcZLN6Hs73Q5udSvqf0=;
 b=WqpuHQM8S9I/sLSDjv9t3mW5S5z3HnVRDqrS7ChA7ijYtix58OOYShaVrJriQfsdTywS/h
 Z7C4v1kviEUprO0UKOVwGeNZn2WcVMEmSZ8/mplhemYNOCsDx3GFdfvEvqWGiG4A4u2jME
 QnZDzBvdY5dwC7rbEHAV5EMAnzgADac=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-ZR_TIRLkNomxZ8Xuotv-Sw-1; Thu, 18 Jun 2026 10:38:42 -0400
X-MC-Unique: ZR_TIRLkNomxZ8Xuotv-Sw-1
X-Mimecast-MFC-AGG-ID: ZR_TIRLkNomxZ8Xuotv-Sw_1781793521
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-4639f122c38so907732f8f.1
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 07:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781793521; x=1782398321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q2yPqyWkhbfSXDTz9k5/9EE4gcZLN6Hs73Q5udSvqf0=;
 b=ZuSCnTm89MHrFc7ZwNOAj57oI3H4EIzoC3mvq3e7JfJadRlSnwyDQVMaMhIE/FYDy8
 8KEczJFzU6ApDrfbFF70L8sYqiAMOWhbkCMbzHvDw1a1EBM9WSOiwXvnP6y0a8PdutYP
 ppnXdlp5OsyK2QdfZu4YB4a5hqX9leg05Fa7b7JB6WS4OyOtgfSM3uiWBYRBPed46mmd
 N3/6Cjpa5KJ6xn/4ntaTjYJPMjSzM3TwPyl9JG+vX0AnsSnldzJe9ZOB2ShEFRA8h9ZH
 98DD3csl3e/HSqh0wALJwnUqtQwqP8lid5waBk6gln0kAnBnpaQuGYxInGMINtnfX3tF
 gv9g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8UPlfzl4uh0aOwD7G+WEZrlINBsKgS+vlpZb5QsU7mxXWQ58hAOlEjXzpsmQT4mY11cB/fN573xQ==@nongnu.org
X-Gm-Message-State: AOJu0YyRv8FQv95LOIk5fN9gJIUzOk1IocZyqb25OLEz7DzMQljytv1i
 kG645pQb9f03Sjz7EcAyw2jsg156QqoIuzg0E+dABlhJRDSiv8Cww0ZKac69n+JMlVpOGqUaAdA
 jaE6hmaMBKHUIW+ZBVhZWdYr8f6zTmaXFSbNZpmTbHJdy9iZ4jVq8Rg==
X-Gm-Gg: AfdE7ckUvL+ZGryYRiaInqsk3AtcZsQgG8k5uKhTcFcX5mtSztbFfqeD8gkxm4/glQ1
 /IyN966y9EwikQmfVAi6xzSf7AUd7hsWAila7BEOneyEjFvMeH+rE8w1RyE73jEu3m/HcvoxSjI
 y7SC81aVK3Cjl+T954/JwtMRw+EU6zWvm2SAJ+GXLJPh5Iix4yHXPgIVk9OvvWlL58noakQbGX1
 rQIoQtEI8UWKouEeqWGSeynzKHhPcFPFbUZexWL4MW1MG2i+ZhDwVHdcS3YR1P6RuWjXX+grTCf
 iq7JBcyNXBml+cuKrwt2BBABnPi54oJe3r3NJt3c8dpTG9Atg3YJAhf4qCB5m239veg0t5o=
X-Received: by 2002:a05:600c:1395:b0:490:e5c1:b8b9 with SMTP id
 5b1f17b1804b1-4923a8c402emr42325615e9.0.1781793521427; 
 Thu, 18 Jun 2026 07:38:41 -0700 (PDT)
X-Received: by 2002:a05:600c:1395:b0:490:e5c1:b8b9 with SMTP id
 5b1f17b1804b1-4923a8c402emr42324935e9.0.1781793520972; 
 Thu, 18 Jun 2026 07:38:40 -0700 (PDT)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923a1d3fcdsm46310425e9.1.2026.06.18.07.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 07:38:40 -0700 (PDT)
Date: Thu, 18 Jun 2026 16:38:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, anisinha@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, philmd@linaro.org,
 zhao1.liu@intel.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2 07/21] arm: sbsa_gwdt: fixup default "clock-frequency"
Message-ID: <20260618163838.5586e18d@imammedo>
In-Reply-To: <20260603021313-mutt-send-email-mst@kernel.org>
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-8-imammedo@redhat.com>
 <20260603021313-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RlOhVT24yCqeZ5ibGYZmKCIq5MFM578U9gaqcDAzRKg_1781793521
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Wed, 3 Jun 2026 02:15:01 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Mar 03, 2026 at 10:25:18AM +0100, Igor Mammedov wrote:
> > Comment about keeping legacy freq, is wrong to begin with
> > (should be 62.5MHz), but that value also doesn't make
> > sense anymore as the watchdog is used only by un-versioned
> > SBSA board and the later has hard-coded it to 1GHz.
> > 
> > Other potential user (arm/virt) also has system clock at 1GHz.
> > 
> > Drop misleading comment about legacy and set default to 1GHz
> > to match both boards.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> 
> if I take this in isolation then make check seems to fail
> on qemu:qtest-arm/aspeed_smc-test.

it works over here,

it must have been a glitch,
gwdt isn't used by this board,
the sole user of it is hw/arm/sbsa-ref.c at this point

> 
> follow up patches fix it, but I think it has to be reordered
> to avoid breaking bisect.
> 
> 
> 
> > ---
> >  hw/watchdog/sbsa_gwdt.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
> > index 7ade5c6f18..b739a3ce3c 100644
> > --- a/hw/watchdog/sbsa_gwdt.c
> > +++ b/hw/watchdog/sbsa_gwdt.c
> > @@ -264,11 +264,10 @@ static void wdt_sbsa_gwdt_realize(DeviceState *dev, Error **errp)
> >  static const Property wdt_sbsa_gwdt_props[] = {
> >      /*
> >       * Timer frequency in Hz. This must match the frequency used by
> > -     * the CPU's generic timer. Default 62.5Hz matches QEMU's legacy
> > -     * CPU timer frequency default.
> > +     * the CPU's generic timer.
> >       */
> >      DEFINE_PROP_UINT64("clock-frequency", struct SBSA_GWDTState, freq,
> > -                       62500000),
> > +                       1000000000),
> >  };
> >  
> >  static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, const void *data)
> > -- 
> > 2.47.3  
> 


