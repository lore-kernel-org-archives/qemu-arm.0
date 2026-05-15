Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99511CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 16:41:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNvbW-00055h-Ve; Fri, 15 May 2026 12:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wNvbO-000556-Bh
 for qemu-arm@nongnu.org; Fri, 15 May 2026 12:41:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wNvbM-0006Zu-Qe
 for qemu-arm@nongnu.org; Fri, 15 May 2026 12:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778863288;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bjBZPMHg7/xD5odH5O5oe5BuoaLaAXni0yjS+VAtUvM=;
 b=Kw6MYl4FkSiYnTptObfdMTYPaAVUSgwB29l7t600ZuCLY6Vhsd5PRDh0grrlsb0Icpa2pZ
 zRM9SOWkKQNDO1m6eSBOteJ1PLXsKOGKyj43pFsu6QOnbX68LR1tpXLPLr8n4N4rvbwe93
 ceg76docASVDTyE4vuUQv4MC+0a9BKo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-NMsWXVBINgKKmuUc8NqRUA-1; Fri, 15 May 2026 12:41:26 -0400
X-MC-Unique: NMsWXVBINgKKmuUc8NqRUA-1
X-Mimecast-MFC-AGG-ID: NMsWXVBINgKKmuUc8NqRUA_1778863285
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-44ffa15dc8cso5665023f8f.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 09:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778863285; x=1779468085;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bjBZPMHg7/xD5odH5O5oe5BuoaLaAXni0yjS+VAtUvM=;
 b=sOSkFhkg2ljR6JzzvSiQ8TGQT9S68Jk8agW48vusL19dOhmBA5m3eixwhoaIkyIGgc
 ZKDHHC38UBdPKP9ZxvinQznMhv4stub/XjuayP2eQvm4+dmKJJPgedPBQbAqeJWdXCQi
 djmP5HaZAa9nA3yOYd12aUsNP15fQqKXxS7q8KiKCWkW82EO3L31zZiUy+jzzEuTgAYG
 t80PEUOPmXWKev569ZUYjOiJrvUoL9teL/b8fezItgIaxECj42ZtKyz1q0g9cQc3XDfn
 LHrvtPaoVDbta2UR/ECHUsZPOl174Qj/wEOX7tMQ+z50BIw+vvd+DfjKBWu4+uH30jB4
 ag9A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8f6Ut8Yl+y/P01n97G3aTi2VahBxk1UqOS/U5yihNMY31iK9UBO5enaX/DVPn4QXMDBxf4yDp0VA==@nongnu.org
X-Gm-Message-State: AOJu0Yx6inCxPLA7zqN6t9yPBMYBsJ7ovwWek6zhps+L+WEuhMIVG78U
 M0Egt9IXEFuWxcZYd+k9TaVeVzB4Dw9Ak/rsplM3mdqXiB7vOLmDTQBY5N6FDcBI4OCnojjjmYC
 fwTI6TO19C9Qgnrckslqquk2TApKTpNAmDgnS/BbtMFtSBLRuxFt9Iw==
X-Gm-Gg: Acq92OHnN2ys6v7YYPFAYOofR6V76VvfbBnbet9sMKy1fXeKjQMv0H/qXZkAm4MBFLP
 kspxJP5pGEaHrajvW9+OKwU1ze4BujAkLNVb+0ydcc+HjJ/RIpb8++uK1TTzj5kJQ5HN2O0ms3g
 7UBIOe0GzYyc20VEnRmk36ghLitqVdNeFg5zZO0xY0n8GxCGGW/V00H2o+MVf5opplVOOnrTktb
 DIkONyRq8eIjgUAzKW10oojjktbM1YqE5tYm78SIG6pMZNTyA67DnwZFulnngoNx+4AC4TSDBTH
 TJat4Cb4Vh6i4GyRFoVvVSFLQwCKkVUpnAZviUJeD0VROR3HSLV0phPHQcVt2xhgTGvBq6SrLZd
 v6H69SvbPoAIlX+UTtjpK2mLkRHpEgozxrtqX35HCU/LYNmfnSSbtk8gL67oo3HH5Lsuw1A==
X-Received: by 2002:a5d:5f42:0:b0:44a:fa76:5193 with SMTP id
 ffacd0b85a97d-45e5c5af4f8mr7076708f8f.12.1778863284270; 
 Fri, 15 May 2026 09:41:24 -0700 (PDT)
X-Received: by 2002:a5d:5f42:0:b0:44a:fa76:5193 with SMTP id
 ffacd0b85a97d-45e5c5af4f8mr7076636f8f.12.1778863283546; 
 Fri, 15 May 2026 09:41:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a19c2dsm15815025f8f.21.2026.05.15.09.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 09:41:22 -0700 (PDT)
Message-ID: <ee91fb33-1a9f-46f7-985d-b84ba15ad0cc@redhat.com>
Date: Fri, 15 May 2026 18:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/17] kvm/arm: Introduce a customizable aarch64 KVM
 host model
To: Marc Zyngier <maz@kernel.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, richard.henderson@linaro.org, cohuck@redhat.com,
 sebott@redhat.com, skolothumtho@nvidia.com, philmd@linaro.org,
 oliver.upton@linux.dev, pbonzini@redhat.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
References: <20260503073541.790215-1-eric.auger@redhat.com>
 <CAFEAcA-TE-8cj6fGOYJaChRVB5GE7E8ys87cxPP4Yw1kgjh9Dg@mail.gmail.com>
 <87pl2x9h7g.wl-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87pl2x9h7g.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WB5-karJxuaBFzNC0DhoP5-hE87UmWsPw-z8QNyGNuI_1778863285
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Peter, Marc,

On 5/15/26 11:04 AM, Marc Zyngier wrote:
> On Fri, 15 May 2026 09:31:19 +0100,
> Peter Maydell <peter.maydell@linaro.org> wrote:
>> So if the user asks to set ID registers to an architecturally
>> invalid combination (e.g. one that reports FEAT_X but not
>> FEAT_Y even though FEAT_X is supposed to imply FEAT_Y, or
>> one where one ID register says we have FEAT_X but a different
>> ID register says we don't have FEAT_X), what happens ?
>> Do we catch and reject that? Does the kernel reject that?
>> Or do we just report to the guest what the user asked for,
>> and if they asked for something broken they can keep both
>> pieces ?
> I fully expect the latter. Neither the kernel nor QEMU can enforce
> this short of encoding all the various dependencies, which have the
> horrible habit of changing over time. The only thing we can
> realistically reason about is a single idreg at a time.

Effectively at the moment the series does not implement any consistency
check at qemu level (neither on the individual value nor any cross check
with other ID reg field values). For individual setting we fully rely on
KVM check.  

Thanks

Eric
>
> Thanks,
>
> 	M.
>


