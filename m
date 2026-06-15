Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF43CD98DA
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 16:36:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZAIA-0006eU-ON; Mon, 15 Jun 2026 12:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZAI9-0006ds-V3
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 12:36:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZAI8-0002Kt-Hn
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 12:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781541363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qEyy+zLspp68V/bV3Lx3JmL20jBo4NCfsOvahpmGszU=;
 b=PbQ9nZrSRzXMRvY9HwgLHp40+s2ZEB6ikOyRVFWpSAvRjkYrBC34w8us/UQjYSzlZPl3Nd
 D/XRE4xOoF7a5echNhfDhTmMuKjvbQ4Qeoah4F8NK1O7RGhbf869XdoD+3Mgz558eydfn6
 urFGY5D3x5USV5pA+6j3Hvhj/dQSb9w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-b5wnbY8DOE-ufd-hiP86wA-1; Mon, 15 Jun 2026 12:36:02 -0400
X-MC-Unique: b5wnbY8DOE-ufd-hiP86wA-1
X-Mimecast-MFC-AGG-ID: b5wnbY8DOE-ufd-hiP86wA_1781541361
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-45ef616db45so2722221f8f.2
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 09:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781541361; x=1782146161;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qEyy+zLspp68V/bV3Lx3JmL20jBo4NCfsOvahpmGszU=;
 b=T7HNsMcrB4rwpLUnZ0ed1+qfPHrmsQGV0hWGaTyzFnnew7L7OEo3y6cWOZrtInQnaB
 lIueFvN2yjVcLyqopvISg/jSIv8QXPTHAQhVQ0pxwWTpcyh5eb6t4yZiyJ4dXCcN/OGY
 22AxLop+V2rNqeRCoB06N2xu6Ijhvzvf99dYmCwA2QzxKFs+5n7Tm4ryEdiniU02riK5
 R6U2dMx8Nm73o8f3nxVSqPtTfG+xuLr9CGbnnpgpRsc56A5elmmtuJYAiqGzIkxVmopL
 J8l0qbRs5E3JkULywIFuM3IUmgS1asoyy8nktrbwzDaKtDIfIEwGBtWgNQtRF4t7mbj9
 QFHQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/gBkJHS5CNQ49fWjChkCNhDqC+Wx3SDceMutU08G7vn5EKUExPas6TwPvedIwKNa7jrNkxV7zjcA==@nongnu.org
X-Gm-Message-State: AOJu0Ywf53T28X/ZqLOwMy70l53Qx4T1Ah4iz14/ttsNU1orIzXYvmXu
 2s1TnepLemarBra/1cdCKZMn0F6Pkhla/IJU1VdN5vuhN5aYUCTuXJq5aK9gdVX1pfyi5s3fkkY
 QH8y860ju0OQbpkayNZsBJ6FvPe+ADkMfy3vU3gWRgfRViIA7G3HP+Q==
X-Gm-Gg: Acq92OHdQxDFPwP3MdFNJxexOZmDjgYCklrpGLJmjiKeDMfuDm0lGwrlRREVejmTPgq
 O/sLasWIlEZPBsnxFXC1MlOXjqc10KfcT7cKRWA1P16u2WlYXI3faRgQ1w1wbrumwuHvCXDRqDi
 iAM/9Wj1R//juPFMGh7KMz/js07HryBE+nFjCkBhYV43bCh6au6CQ66m9fgqEwIq8XBG/HhCczc
 ghY/je7z/13acYd/d/AbSYOs5JxTLQxhd7RuHT/ssGCZeZk7TVBhTzyZ7/s75ujsgpFogXooQeT
 lu1qoXxBCJmXC4PUeJpnwdetb4rCnxsJfd/TbSsVXvpkId6GZcakgwU8dYmgcYnFuCBSQmmnZKF
 jN6Fm0ichxBIYChieI8BH4W73eQOqIJT09XbVpMKnitY=
X-Received: by 2002:a5d:59ad:0:b0:460:3234:77d5 with SMTP id
 ffacd0b85a97d-46074b946d4mr15994342f8f.43.1781541360703; 
 Mon, 15 Jun 2026 09:36:00 -0700 (PDT)
X-Received: by 2002:a5d:59ad:0:b0:460:3234:77d5 with SMTP id
 ffacd0b85a97d-46074b946d4mr15994293f8f.43.1781541360131; 
 Mon, 15 Jun 2026 09:36:00 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c4240sm33039078f8f.27.2026.06.15.09.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 09:35:59 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:35:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, alex@shazbot.org,
 peter.maydell@linaro.org, berrange@redhat.com,
 philmd@oss.qualcomm.com, philmd@mailo.com, david@kernel.org,
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <20260615123354-mutt-send-email-mst@kernel.org>
References: <20260615100200.266968-1-gshan@redhat.com>
 <20260615100200.266968-2-gshan@redhat.com>
 <93fb3b41-1543-4e3b-922b-043b774f57bf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <93fb3b41-1543-4e3b-922b-043b774f57bf@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pdszvws3VdFVJXWp4HDnbTwXmaGWuWynVsXZkMYeNGo_1781541361
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

On Mon, Jun 15, 2026 at 08:17:14AM -0700, Richard Henderson wrote:
> On 6/15/26 03:01, Gavin Shan wrote:
> > +void qemu_ram_copy(void *dest, const void *src, size_t n)
> > +{
> > +    if (HOST_UNALIGNED_MMIO_OK) {
> > +        switch (n) {
> > +        case 1:
> > +            __builtin_memcpy(dest, src, 1);
> > +            break;
> > +        case 2:
> > +            __builtin_memcpy(dest, src, 2);
> > +            break;
> > +        case 4:
> > +            __builtin_memcpy(dest, src, 4);
> > +            break;
> > +        case 8:
> > +            __builtin_memcpy(dest, src, 8);
> > +            break;
> > +        default:
> > +            memcpy(dest, src, n);
> > +        }
> > +    } else {
> > +        uintptr_t test, lsb;
> > +
> > +        do {
> > +            test = (uintptr_t)dest | n;
> > +            lsb = test & -test;
> > +            switch (lsb) {
> 
> Either assert n != 0 to start, or use while not do/while.
> Because the body of the loop won't handle n == 0 correctly.
> 
> > +            case 1:
> > +                *(uint8_t *)dest = *(uint8_t *)src;
> > +                src += 1;
> > +                dest += 1;
> > +                n -= 1;
> > +                break;
> > +            case 2:
> > +                *(uint16_t *)dest = *(uint16_t *)src;
> > +                src += 2;
> > +                dest += 2;
> > +                n -= 2;
> > +                break;
> > +            case 4:
> > +                *(uint32_t *)dest = *(uint32_t *)src;
> > +                src += 4;
> > +                dest += 4;
> > +                n -= 4;
> > +                break;
> > +            default:
> > +                *(uint64_t *)dest = *(uint64_t *)src;
> > +                src += 8;
> > +                dest += 8;
> > +                n -= 8;
> 
> Use qatomic_set for the stores.


Won't this do things like locked on x86?



> 
> src is not aligned, so except for case 1, you need ld{uw,l,q}_he_p.

These just map back to memcpy. What is the point?

> > +void qemu_ram_move(void *dest, const void *src, size_t n)
> > +{
> > +    if (HOST_UNALIGNED_MMIO_OK) {
> > +        switch (n) {
> > +        case 1:
> > +            __builtin_memmove(dest, src, 1);
> > +            break;
> > +        case 2:
> > +            __builtin_memmove(dest, src, 2);
> > +            break;
> > +        case 4:
> > +            __builtin_memmove(dest, src, 4);
> > +            break;
> > +        case 8:
> > +            __builtin_memmove(dest, src, 8);
> > +            break;
> > +        default:
> > +            memmove(dest, src, n);
> > +        }
> > +    } else {
> > +        qemu_ram_copy(dest, src, n);
> > +    }
> > +}
> 
> The qemu_ram_copy implementation above does not work with overlapping blocks.

IIUC copy is not supposed to. this is what move is for.

> 
> r~


