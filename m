Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF5CCD4F3C
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 13:07:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPgeB-00048I-5v; Wed, 20 May 2026 09:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wPge9-0003zZ-9e
 for qemu-arm@nongnu.org; Wed, 20 May 2026 09:07:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wPge7-0000qY-VJ
 for qemu-arm@nongnu.org; Wed, 20 May 2026 09:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779282455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M0qONi2b5od3B1XF03QbJSVKbR3gZRZzbNR/k9BVOeY=;
 b=Tfdwvm9iV2GxjfNX8VgxGAtNTJWKv/6TmXF5Bo6uuXxwKL547D0fT++nMPryHJ22XI3T/B
 ervNlc9VZ8pn6tRUxqoSGU9hmplEurt5tmmctzOto8JIbcPbpybat46pWVRTEYlNFFLCsi
 aVasx0N3bR+Zj1VUOVuuzEW7SJwijwc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-pvF5Ny8vO_OtQo3s2tYUkw-1; Wed, 20 May 2026 09:07:31 -0400
X-MC-Unique: pvF5Ny8vO_OtQo3s2tYUkw-1
X-Mimecast-MFC-AGG-ID: pvF5Ny8vO_OtQo3s2tYUkw_1779282450
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48fd2b502e2so42772815e9.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 06:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779282450; x=1779887250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M0qONi2b5od3B1XF03QbJSVKbR3gZRZzbNR/k9BVOeY=;
 b=P5rS4Pw/MomKSjt5mCXEv9xcHLoebbGSK9FA8X1on4YBn/Zjg0UjzFjLPMJpqkXmOC
 GjbG+60za69mTy+ZEJMH6+hT8EHCSQdmtdsNSMhUQFoa5dotqMV7Y9r0Hpq2zmi5CbMv
 5SvvGjJd85udbjM5aE62TDZVJfmgK7WyY/iVM4reUpOaaVgu5JBpf5kmFCAFXLjrdfoE
 d1YhuqEuwr95LKBBfhj/v/iiORcYO6UDsaTtCalb1a8e6gzSi1y2VtA1qJVaV9koEWqR
 kAmmuhQ+vsSRounk2yGvrfiL+DWTFabO4KHjV2qYAN7owIFPrsQE9DH1IqSm2w/r1CZy
 IsDA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/0hrpbnyvjtBB6txIM5Elu3xoSJj8DQ5s9NdwoJM4KH2/K/gj4B44LoCltpFVGecfAc4v2rPlkWA==@nongnu.org
X-Gm-Message-State: AOJu0YzSrTPSQ1xIusir8uV2E2WayKYsJnx7Oy5GqanciZDYqah6IlT7
 JtEtpmK4M/ih/5tl8TINQNswrvlMuwDzDDAsDrB4HjzYkVm5Esy1R/EyZGMT7pqFNgl98p8zsPP
 N9J+aEDS6apVE9NKN7hftGzJsTbya+U5HzSMhBvgZ6a7AVdhB0+wNLw==
X-Gm-Gg: Acq92OHzm+k875QmuBqfopVSzsEFUNrOt71KwLA5CI4n95DW7OZbcWKzOqzZ29d9ACi
 x58oOT+NYxdZnmk94nNqMLqfyoP2E3KZtPRP4lnW+QIK3WIDcd14bhis1DcXHQMO8moySaUMMmc
 auz60fT9r0A2iGEZoNbhapw4HCTdCy9HqEh/5YOGQUyEmZeeya+sXNES2Og4Pm4EPDqT+i4Hz72
 aVKjEzmViIZa/HqCg28OiPz0iz7h44j9mlxoUZa81JwYI+wjE9P6fe4bG2axviFg+hX06PzEPvC
 TcrfezX9PmTfsZwsV0G4I+OAupkarbNJYnTSAjxoJYJmpBVMIg/Oez3gPT4fFnYtx4uYRURaM05
 JrcxbYg==
X-Received: by 2002:a05:600c:a406:b0:48a:97b6:7420 with SMTP id
 5b1f17b1804b1-48fe6329938mr291551585e9.24.1779282450433; 
 Wed, 20 May 2026 06:07:30 -0700 (PDT)
X-Received: by 2002:a05:600c:a406:b0:48a:97b6:7420 with SMTP id
 5b1f17b1804b1-48fe6329938mr291551215e9.24.1779282450077; 
 Wed, 20 May 2026 06:07:30 -0700 (PDT)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a562dsm54912010f8f.33.2026.05.20.06.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 06:07:29 -0700 (PDT)
Date: Wed, 20 May 2026 15:07:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>, Andrew Jones
 <ajones@ventanamicro.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 2/4] test/acpi: aarch64/virt: Allow DSDT and MCFG
 changes
Message-ID: <20260520150728.1ed47623@imammedo>
In-Reply-To: <20260520-virt-v6-2-d96180454fdf@rsg.ci.i.u-tokyo.ac.jp>
References: <20260520-virt-v6-0-d96180454fdf@rsg.ci.i.u-tokyo.ac.jp>
 <20260520-virt-v6-2-d96180454fdf@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7hTf9OvR6QnUPyuA7dGWZeuAKEKOiR1ChS7LhKIaH2U_1779282450
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

On Wed, 20 May 2026 18:56:31 +0900
Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:

> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8bf4..efb00724d09f 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,12 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/DSDT",
> +"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
> +"tests/data/acpi/aarch64/virt/DSDT.acpipcihp",
> +"tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex",
> +"tests/data/acpi/aarch64/virt/DSDT.memhp",
> +"tests/data/acpi/aarch64/virt/DSDT.pxb",
> +"tests/data/acpi/aarch64/virt/DSDT.smmuv3-dev",
> +"tests/data/acpi/aarch64/virt/DSDT.smmuv3-legacy",
> +"tests/data/acpi/aarch64/virt/DSDT.topology",
> +"tests/data/acpi/aarch64/virt/DSDT.viot",
> +"tests/data/acpi/aarch64/virt/MCFG",
> 


