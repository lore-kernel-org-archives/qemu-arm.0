Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B98D77897
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Jan 2026 17:28:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vjKx8-0000DL-OF; Fri, 23 Jan 2026 12:28:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vjKx6-0000CI-BX
 for qemu-arm@nongnu.org; Fri, 23 Jan 2026 12:28:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vjKx4-0007qV-IL
 for qemu-arm@nongnu.org; Fri, 23 Jan 2026 12:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769189285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lDN/eGC9r+QfWyzU3wF2348KbKILb8kCKmxzDjl4iDI=;
 b=K4eRA/fCmmhAtbZEygSKDrNj5uwfrpSJkooTlEaj6q/js5j7sghxcKD93hgU5EocvnNDW2
 r0kCwaDkdLDyEFvuPGnkAWYEqHuVQriIQPKszsox0aNIfxlFjAQOqTIHVoMFSksxqyspkj
 x0NIWVWM1rERWJzsuCID4vpncITgRGE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-BjZfy31RNriPOhBnxuZRFw-1; Fri, 23 Jan 2026 12:28:04 -0500
X-MC-Unique: BjZfy31RNriPOhBnxuZRFw-1
X-Mimecast-MFC-AGG-ID: BjZfy31RNriPOhBnxuZRFw_1769189283
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-430f5dcd4cdso351229f8f.2
 for <qemu-arm@nongnu.org>; Fri, 23 Jan 2026 09:28:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769189283; x=1769794083;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lDN/eGC9r+QfWyzU3wF2348KbKILb8kCKmxzDjl4iDI=;
 b=tLR/v+Y1HicoK0OJP+Cvrz2dx/MkgLSJ3SssGePxCShe2PD/5cU76hzBvXZBf2JcRL
 LN/RTwMPV449MF1C4fwAjIpXOpw6dZU7TDNCXulqpxDanN1uYY+wOMDZzx9F928Nx+6I
 8zQsBzw0dGv5ZqNuzpOxMW42ScAaw5xVvLSsJ3mGlUJHcCK3sRVjDGOeHZcaZwY1b1y7
 1mIsnT8N0XAQLbDTPmAuSPTFKui+ojnDaEk/sXDewJH93OtWtSdNPyns3Ykl89YQUOzT
 xndO2P3HCMeOVTifEvB2cQ7KYxQlAzi1OAPi4rbVOMEMQdgBMij7aK7ps6D3OReQltBZ
 KFcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEXY+MoRNgkSd1yPqJElxHz1M+pFQoKI7Qfx1oYvMt4nqda7K3rAUBJMg9FONwjCB6eknguCK7fw==@nongnu.org
X-Gm-Message-State: AOJu0YwTVpmpsx2U4qHnUizGa0VKwVo0AVPZLkjYJYdLqFhgcLT7/jWG
 6LsTB/IhZq0/Nn+GOeoP0xQL7YeK6uqtxOnxUut35yN9zcQu4rKTg06ICRrESYxIrsp6MOVzsN6
 gkITJmoaZhlxco0HTO2btMd+jcaUeUwLATAt4SzID1XfGQLk1RdjMmA==
X-Gm-Gg: AZuq6aLAn3YmhTmuM5kVhJfbMkefIfF0+8gtSX5T9xbzTYieMue/30QYdj6wTUyOMVq
 V30LnZioHFIZMOa24i587+Tov0HcLmfCZYcTovZu2IAjIsBLBKPuEAGKyHoOH8CmF9c9QTqOfos
 eHd/vmI2vm+ex0kgLrSHpjA2ucnOtyTQvWqEjwkBqFX3PXEL2inQ9DFqXnY2ODnaEJhqNuUzPD1
 QaxwyuUQG2lGKEusfkpKlzgHl1+YjcPfdZgauTbur8bY5DktJG0WMEQv71rTyV6XDw+RwTjLkq/
 GdkhR+3a/bybhsRUluosi9q3HanzleEfr9G5y9RndmslzTh7X4WlVDkBfsTvRPXAbWoFFq7/SCs
 5j9sdEMk506FUI2bqez5/eXVG1SC177l2jm5QEY7meE0X0xTVwdchaK8J3Rs=
X-Received: by 2002:a05:6000:178a:b0:432:c0e6:cfc0 with SMTP id
 ffacd0b85a97d-435b16270a9mr6428172f8f.57.1769189282684; 
 Fri, 23 Jan 2026 09:28:02 -0800 (PST)
X-Received: by 2002:a05:6000:178a:b0:432:c0e6:cfc0 with SMTP id
 ffacd0b85a97d-435b16270a9mr6428132f8f.57.1769189282247; 
 Fri, 23 Jan 2026 09:28:02 -0800 (PST)
Received: from rh (p200300f6af31d00062ddfb9151537832.dip0.t-ipconnect.de.
 [2003:f6:af31:d000:62dd:fb91:5153:7832])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c02c91sm8208594f8f.9.2026.01.23.09.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 09:28:01 -0800 (PST)
Date: Fri, 23 Jan 2026 18:28:00 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, cohuck@redhat.com, maz@kernel.org, 
 oliver.upton@linux.dev, gshan@redhat.com, ddutile@redhat.com, 
 peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v5 10/11] hw/arm/virt: Introduce framework to aggregate
 hidden-regs and safe-missing-regs
In-Reply-To: <20260121074834.1900677-11-eric.auger@redhat.com>
Message-ID: <1d622049-4b20-a12e-61d2-847c3a83869f@redhat.com>
References: <20260121074834.1900677-1-eric.auger@redhat.com>
 <20260121074834.1900677-11-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q3n5bQbfleqlxXulhpFH8TXEkk9Q708cT1Ge2cl1d3o_1769189283
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.079,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, 21 Jan 2026, Eric Auger wrote:
> Currently if a virt_machine_<n>_options() sets a TYPE_ARM_CPU
> x-mig-hidden-regs or x-mig-safe-missing-regs array property, another
> one cannot overwrite it or extend it. We end up with a core dump:
>
> qemu-system-aarch64: can't apply global arm-cpu.x-mig-safe-missing-regs=0x603000000013c103, 0x603000000013c512, 0x603000000013c513: array size property x-mig-safe-missing-regs may not be set more than once
> Aborted (core dumped)
>
> In practice we would like an easy way to register regs that belong
> to either of those categories and allow aggregation of those.
>
> We introduce arm_virt_compat_register_safe_missing_reg() and
> arm_virt_compat_register_hidden_reg() which populate GLists of
> int64_t. After all virt_machine_<n>_options have been called and
> have registered their regs, the GList are converted into the
> associated array property value and the GlobalProperties are set.
>
[...]
> +static char *get_prop_value_from_reg_qlist(QList *l)
> +{
> +    size_t size = qlist_size(l);
> +    GString *s = g_string_new("");
> +    QListEntry *item;
> +    int i = 0;
> +    QNum *qi;
> +
> +    if (!size) {
> +        return NULL;

Do we need to free s here (or allocate later) or is there some RAII magic
involed?

> +    }
> +    QLIST_FOREACH_ENTRY(l, item) {
> +        qi = qobject_to(QNum, qlist_entry_obj(item));
> +        int64_t regidx;
> +
> +        qnum_get_try_int(qi, &regidx);
> +        if (i++ > 0) {
> +            g_string_append(s, ", ");
> +        }
> +        g_string_append_printf(s, "%" G_GINT64_FORMAT, regidx);
> +    }
> +    return g_string_free(s, false);
> +}

Reviewed-by: Sebastian Ott <sebott@redhat.com>


