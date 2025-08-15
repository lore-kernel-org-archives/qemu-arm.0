Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F70CA0ED1
	for <qemu-arm@archiver.kernel.org>; Fri, 15 Aug 2025 14:57:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umvrh-0002q7-E4; Fri, 15 Aug 2025 10:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1umvrf-0002pR-Tq
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 10:57:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1umvrc-0006sI-RH
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 10:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755269822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dMS+/r6G1OK+DIb+PXwS+Y5EaHlj3WM58MrsjZEplNc=;
 b=MwWJ+d27/LkbOBaOhr3PBkEotoQL3sw4dZWqwtixZfyNoBjb/ogER6i1YVTTlXFov9eJiD
 k2aObCfzpDPuTPEamSBv9oFKpfbqCz2lV15CgphpN3JNxbc2KcSKsa3wmvQQ5FD+6VlqZd
 51axirBVi/LaV61H/CZQDwoL2/K01hQ=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-oX7Fi704OOGiZ9QJ6VuEPQ-1; Fri, 15 Aug 2025 10:57:01 -0400
X-MC-Unique: oX7Fi704OOGiZ9QJ6VuEPQ-1
X-Mimecast-MFC-AGG-ID: oX7Fi704OOGiZ9QJ6VuEPQ_1755269821
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-71e6eb64938so6708337b3.1
 for <qemu-arm@nongnu.org>; Fri, 15 Aug 2025 07:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755269821; x=1755874621;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMS+/r6G1OK+DIb+PXwS+Y5EaHlj3WM58MrsjZEplNc=;
 b=LqGxEuTUyskqT1Iqd7Icw804rop3s3e+pTPcSxQv9l/exJ25I2UNMtqSxEAC2YzosU
 27hGtWp5+MwZBQmPWFLuoTDpYKMWD8xCU52dWMC+CBeBI8dTLhhUXSQBh4bjSx+BQAqx
 yYrZZArpOiAhK+mtqMFbgcERA2ICL2gjIi5v19ye83ATlA5m+meaBrdQsWjebPaj87rz
 5CmpEaBXywttAvt276pxpFa2Sab8T5L1pOCq8vjLxNxXqC2b0w9kTKFKTgZdVovIZ+MP
 2Si6xjeTtxMZVrIl8w/jGTZMkqrO8jxz6taYuMdj08tlx+YXeqv+AZCPv9HtGwpETEbX
 w8MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+ismxH+961NkfzeLshDOecyTXO7ziAncmIoHXI1tWZ4vSMmtfz6bZ8T+nn+f/wTSvAySzGNCORw==@nongnu.org
X-Gm-Message-State: AOJu0YwdWw/d/mgtP+l0wkzyg5bzJWbaF732pzINcKg4R4fze+iSJPKF
 OpTjmFheZsKWvjLzRevQ6D2AC58+URKX4e4TNcy+pS9sMlfFhGlPdsauYkQu3s9vLbPfosmw/a7
 DPWzY6QJLCvkEfmRHObY16n2POYpNfmCHnmJu/0nAi7Hb3kXf4xN2fw==
X-Gm-Gg: ASbGncsK3duqi6Nzbjl70b1KyYBtWLCMJCaJjpm7Fymf4oqhcfmZXv3XY8h4i0uftYr
 klyXHplIfe06xZ7BFsw3D/at2TnOtEnsd5EEFWu7NGdii6PPBj/XoWsnNxYLmMS9dnyDt4ROsJ1
 3FINTS+yJTdOCcixA4M8YIEwghXI6kdNNErkL2YUBrQeY7roEfvdCB+Remis2LgobFB9KvFmqFf
 xfTvoM0ZjJ0bMz8Oiitbzjt53FQMk8z44hanQIJJO5JP9r/p8OgoqbI+2hatAgO2ZylkUXErRZQ
 DbABkYEv1pa2TmUC0VSmNpuTltWUKdEx
X-Received: by 2002:a05:690c:3501:b0:71c:149b:8686 with SMTP id
 00721157ae682-71e6db0bab8mr26998747b3.15.1755269820753; 
 Fri, 15 Aug 2025 07:57:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLOMpI+fUpegfy4jb2TNf2kvs8tNKiGB2F04m0oTK1QGH7Zb8jbw350pMhB0iZUZIqzQAeEg==
X-Received: by 2002:a05:690c:3501:b0:71c:149b:8686 with SMTP id
 00721157ae682-71e6db0bab8mr26998357b3.15.1755269820170; 
 Fri, 15 Aug 2025 07:57:00 -0700 (PDT)
Received: from x1.local ([174.89.135.121]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71e74ab12bbsm1231507b3.61.2025.08.15.07.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 07:56:59 -0700 (PDT)
Date: Fri, 15 Aug 2025 10:56:45 -0400
From: Peter Xu <peterx@redhat.com>
To: Arun Menon <armenon@redhat.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v10 20/27] migration: Return -1 on memory allocation
 failure in ram.c
Message-ID: <aJ9KrXdvEgeLWVNS@x1.local>
References: <20250808-propagate_tpm_error-v10-0-3e81a1d419b2@redhat.com>
 <20250808-propagate_tpm_error-v10-20-3e81a1d419b2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250808-propagate_tpm_error-v10-20-3e81a1d419b2@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kazNHyVXNX6lIJubEXNx5AqzrFzu4ipovUlDJyMStq0_1755269821
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On Fri, Aug 08, 2025 at 12:43:46PM +0530, Arun Menon wrote:
> The function colo_init_ram_cache() currently returns -errno if
> qemu_anon_ram_alloc() fails. However, the subsequent cleanup loop that
> calls qemu_anon_ram_free() could potentially alter the value of errno.
> This would cause the function to return a value that does not accurately
> represent the original allocation failure.
> 
> This commit changes the return value to -1 on memory allocation failure.
> This ensures that the return value is consistent and is not affected by
> any errno changes that may occur during the free process.
> 
> Signed-off-by: Arun Menon <armenon@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


