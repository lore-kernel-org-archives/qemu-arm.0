Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07330CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:47:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3kS-0007BO-1r; Thu, 21 May 2026 09:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wQ3kF-0006vG-At
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:47:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wQ3kE-0002g2-1C
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779371244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8TEJxnfV5vd+BoURyhPm3NVl9yBTSRiCIgEdiyBq0ug=;
 b=HLJOt5GzygEzsG3SDaE8GszQPhJaZcqJHJyyhiQ5vBfcgC7qX4ZigE/OGpBB9KilCVP/Mp
 F8ccddokQhS2iU7Rb0HLPEKtM0J83DzUn7j7MGsF7mf0R8ZOag0Z8vYfxBTE6gKvuprU2B
 yZGjkJOXocrrULPdicdpMUpzz+EWceE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-vnWXD76FNvCEh9VmHfj4rw-1; Thu, 21 May 2026 09:47:19 -0400
X-MC-Unique: vnWXD76FNvCEh9VmHfj4rw-1
X-Mimecast-MFC-AGG-ID: vnWXD76FNvCEh9VmHfj4rw_1779371239
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-45e2f74da10so6865508f8f.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779371238; x=1779976038;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8TEJxnfV5vd+BoURyhPm3NVl9yBTSRiCIgEdiyBq0ug=;
 b=FNcpdRlPIU3wmNU9Gw3/WyENnO/bOyX9O8sEreambHqQp+k6rbgBSzMvzghdeaHyCo
 wR8F9/BPUBEOMxP8YjGajuY0TCGd1jHri4YsOSYW6TG4AjJ4x41Jv0koJTm8ZVfPpcJY
 s3eBMKXSSh57DBQ3WtR9uRVwf78Fg1q6QGhS7y4GRR9BQMNgUVprAlCDyvWrd/KeVrVs
 cP2hbYfxSkEL5EWAEEejavcIstDAv+uKMsZI/UYU1eXtDtuD08NySTB+gxnA5r8J73t8
 65wU9nKZwvRS3Y0AUOWXQbSFq5pxYNMI8lya1xyYNWwQdfGjX3UpKlqdSiVc3Pyhnhx/
 SSNg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8pHm8V0faiM9U69ezDy3EUjlLa1CNa2askrZhEkQ6EW1+ml+R/9URA3t7gnV1lJfRmSirnELimCQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxcl6x2/7fLKiLqK2P8ou5MFySLTMzoGpBi1CevIQIWiaQ8v16r
 3etdxIMtXROGf+HORcH86nf8LtwUn6Geh93f8M6+6dy8rTP0ky/5FTiJBHTtN/th5NlKcl8JMQk
 XEJpC4a6t1KAUoxWiW2YIqIbdFAOhQcnp1a4KUwbLUzW9LRiL6X0uBQ==
X-Gm-Gg: Acq92OGo2zV51R1nMt81K7mkSgqAnbTCgGe3WyaMwFSE4TuO+MHtb4xMmybkhzsSj2m
 Sr9nQSM9xpS92xeaLDSk0UZbOLSO3/T7RyrgIb7TqIAk7dXELnHMp3m6aTDnWxjmi08SYAKxk2F
 Kp/Mh8/hiTYgspM+jxm+5AT7bEqYbO/NoZyXoYV1CVTWGmTMf9gDZNYZGD6PziUD8vRQEeIMGJE
 OdfCvg1cWhE6ZEubXbwMQfwmnJ86C5uKLqaPF6TayxEUkBlUYrYz/gQVADLKMaL1FfgSXlqF0r/
 ROCzTm6hrwQVEA1RlOBgM30vfq9RU+Ad6eAksWfT25OJM/ZPdeE0Vuui/LdUWQCN5V2rdm3ZB2r
 dCVhZwN6wM5Y3WBfNUmwdytTDI8+M6o3L5vOMTBFVVzMMlE6DY2RJFm0C3MnsV333XSNUSuk=
X-Received: by 2002:a5d:5f91:0:b0:45e:73b4:85cc with SMTP id
 ffacd0b85a97d-45ea40f36ddmr4620339f8f.35.1779371238647; 
 Thu, 21 May 2026 06:47:18 -0700 (PDT)
X-Received: by 2002:a5d:5f91:0:b0:45e:73b4:85cc with SMTP id
 ffacd0b85a97d-45ea40f36ddmr4620285f8f.35.1779371238237; 
 Thu, 21 May 2026 06:47:18 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa7cd815sm4410866f8f.6.2026.05.21.06.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:47:17 -0700 (PDT)
Date: Thu, 21 May 2026 15:47:16 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, 
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 yangjinqian1@huawei.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 skolothumtho@nvidia.com, philmd@linaro.org, maz@kernel.org, 
 oliver.upton@linux.dev, pbonzini@redhat.com, armbru@redhat.com, 
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Subject: Re: [PATCH v5 10/18] target/arm/cpu64: Retrieve writable ID reg map
 in aarch64_host_initfn()
In-Reply-To: <20260519132905.145643-11-eric.auger@redhat.com>
Message-ID: <23dd2f71-d5d8-952e-c32c-cfb3537f89c0@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-11-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yXznwM6e9Ci4hmKHkTbQEIWLWJ63D0MUGy80FW5LFLI_1779371239
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

On Tue, 19 May 2026, Eric Auger wrote:

> Store the writable_map array in the CPU state and populate it
> in aarch64_host_initfn(). In case the retrieval fails we simply
> free and null the pointer: this will indicate that the writable_map
> is not usable in subsequent patches.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


