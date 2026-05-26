Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4B3CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 14:42:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRsz6-0004R8-38; Tue, 26 May 2026 10:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wRsz4-0004Qc-4f
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:42:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wRsz2-0007R2-JN
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:42:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779806534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fZDdsIz6mWe2PYk4uTEblQ6F35azGLkwHQC1mtzNnlk=;
 b=LKC8yVobj2LUZbt54+Z2vTSXiONZPEBdBvyfHOBEODtgAzzgfcuUxSuVlYLTJbJE3sAIAz
 NhYZbsRwv28gwZ5MhWjEjx3N8IzdPO0k6qJjadH05i8+XuzSMJ6eqNIiR8nPSl/92Fe6ac
 +O2P+HdOEXdkalgQj4Ykb2fgWKBYdak=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-o97L0gqiOaCQIq9Q9DULAQ-1; Tue, 26 May 2026 10:42:10 -0400
X-MC-Unique: o97L0gqiOaCQIq9Q9DULAQ-1
X-Mimecast-MFC-AGG-ID: o97L0gqiOaCQIq9Q9DULAQ_1779806529
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-44696b11265so13165002f8f.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 07:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779806529; x=1780411329;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fZDdsIz6mWe2PYk4uTEblQ6F35azGLkwHQC1mtzNnlk=;
 b=McFKuimFLE6eIZj75sRxT37gCYr8vGZpbVqAHe+Ie0nIz5VICCsnns2S4jcuBPMGeL
 3L4ossEdccZ7uhwukLxlOeqBHd6PC35OP59B1+F3SkyA5xLELBPU+fYPBkn6rAHl1h5I
 kOsUl0y7Idd9TWqR9a2KTNRqHjcjf7ma5EDpc/73AKmHsNVWqDYdjh63IHNyNY0I05bA
 kngMQFMrN+dYu3DUpyDe8Wz5KOWOfsGBdp6a3fGoL14K1MbRk3HfvrWOeEtKORxxlEPO
 BRVg5ru4lddQlCHeTpowVEN8+uGQrhAXowi+5MmM5tl/Xuf4h5UoJ2D0+sdyxzCTPlk9
 9c+A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9qm7zJy0RVL072OdtoFdNJC7rlbi9GyrAHBuPc0pnLTK/bMVQ8G8ZIlxwviW8YvcMsW0NSgM/EEg==@nongnu.org
X-Gm-Message-State: AOJu0YwPOM3osckT427QGslDwZoOOxvxJ4Qj3swKDxRDC7Lhq94+yyJx
 4VwOCPhFsa/qKCCUsYwlQ3Rw54YkwkOyBV1l9hePJNQJTH1YNnlE5ZMRyOcinVUX0kaHL2UVsxB
 170+a5p2d61j3AAomMurCZRhQ1pcaPNWVLFcY39rqhtDIQc1TkMyCDA==
X-Gm-Gg: Acq92OHu9ilrOPFxK7FstvhpqD3eRrCm3fa0P6o879pTAJv1kgnznvNxi08Ut8gGS3K
 Pu/RffD4sVceZVLPSErpFFosHIqk+oHoPmtOZ+p+TqRU9s21Vkc9gMIGreweX6moHZo5oW7TkHj
 m2pVFyd7Ij5neRQrCFN/8+nbIR+PqKL0n2EQJoz7+Mfgz2ISj9NaTPa+WKi+A4yp3uY5ogi+SPM
 mnKGNnmzpwx6oewHKGxvL5e3X+OSMn/lfykCzFxRN6IQHKqzBXNpu4py8JLCW/azcbMUNHxGEco
 AIrw19ym5b+0uvrAFbK/WyT26ybUpR2wvHRLTckhNgUklhf1eoqfOD1bsJhTkoPf+pOJqBh6dZG
 EEetRiOcZjhcT8K+zH2Agi6yluAT0LUjZsINJs7TEI3U3GTOUoJUdeDAsebLyX3Pud9uSBiQ=
X-Received: by 2002:a5d:64c2:0:b0:45e:b2b9:705a with SMTP id
 ffacd0b85a97d-45eb38baf74mr29795849f8f.23.1779806528939; 
 Tue, 26 May 2026 07:42:08 -0700 (PDT)
X-Received: by 2002:a5d:64c2:0:b0:45e:b2b9:705a with SMTP id
 ffacd0b85a97d-45eb38baf74mr29795768f8f.23.1779806528242; 
 Tue, 26 May 2026 07:42:08 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6c9b980sm33049781f8f.3.2026.05.26.07.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 07:42:07 -0700 (PDT)
Date: Tue, 26 May 2026 16:42:06 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, 
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 yangjinqian1@huawei.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 skolothumtho@nvidia.com, philmd@linaro.org, maz@kernel.org, 
 oliver.upton@linux.dev, pbonzini@redhat.com, armbru@redhat.com, 
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Subject: Re: [PATCH v5 13/18] target/arm/kvm: Introduce
 kvm_arm_expose_idreg_properties
In-Reply-To: <20260519132905.145643-14-eric.auger@redhat.com>
Message-ID: <0d3a2287-e94f-3eb1-018d-b4dd74275ab2@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-14-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ahk3MOchmYtPgvfc3TOelrr6eMNo6tfiOmQNxJi7Y3g_1779806529
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, 19 May 2026, Eric Auger wrote:
> This helper decode the ID reg writable mask, matches it against
> ID reg fields defined in target/arm/cpu-idregs.h.inc and
> for each writable named field, generates a uint64 property.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
[...]
> +static int
> +decode_idreg_writemap(Object *obj, int index, uint64_t map, ARM64SysReg *reg)
> +{
> +    int i = ctz64(map);
> +    int nb_sysreg_props = 0;
> +
> +    while (map) {
> +        ARM64SysRegField *field = get_field(i, reg);
> +        int lower, upper;
> +        char *prop_name;
> +        uint64_t mask;
> +
> +        if (!field) {
> +            warn_report("%s bit %d of %s is writable but no named field "
> +                        "in target/arm/cpu-idregs.h.inc",
> +                        __func__, i, reg->name);
> +            warn_report("%s is target/arm/cpu-idregs.h.inc?", __func__);
 							^
 							up-to-date?

Reviewed-by: Sebastian Ott <sebott@redhat.com>


