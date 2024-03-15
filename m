Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp1032213eju;
        Fri, 15 Mar 2024 07:14:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgb5WDn7/V0fL0eYdjwGBoYBfap8xWVxRZqU+5PQ4yvy6jj4A2/3c4arM8/rqC3Gt0QZKjNsegno6DX0+uJDpJoIVPBkWB
X-Google-Smtp-Source: AGHT+IEb9Cxj89mj3vE73Me5x8LGyquIWenuz5a0TwtpqLQ6bG+KZhaefQw17wu/r/Li3ji1PJhB
X-Received: by 2002:a05:620a:22d6:b0:789:e3ee:532c with SMTP id o22-20020a05620a22d600b00789e3ee532cmr2051357qki.26.1710512046239;
        Fri, 15 Mar 2024 07:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710512046; cv=none;
        d=google.com; s=arc-20160816;
        b=qJeu0yRDqSHWlvHmdmWQ+bfyww1I/AtqyJHFP1syIXeLbv8MOFCWNGu6OKAzfhqmkj
         Cr6ICrFTgrxT3Z1hbPZ4hKdcR4EzRGx2wJc/8cZinQrSnSUGt/HN2Toa3qfAKyOTBuu5
         mt8SoRVHvGHwEWQFC0D6SAQhOb4uMFRJ3Kqhx8vERjeUtZCiMWE3i9C0lwUT5oLHrT6l
         k1/KPFW4blkDq7TY1xlGex7lnsOdQzHXV7ArUIzNvRLz0ZDOXpgl49BZ569aABFWIrKr
         Mel4XBKbI8DQcUSDZh5e1schIYZtGIPv3HMB0tZ+9n8FMjIaN5kYpcNig96giDl4AJ6T
         vSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=vgbIZ7eAaKGwPhksi48uy+7XiuUk0+9oJ7imPcTFphw=;
        fh=Baw0egHTUW2YOB9xUl68znQ+5cwxFOSKFgakOp+S9Es=;
        b=B/tqwTTIjvDNVv42ryicDEucI59DgU2gLVzXJn5xTZqG0sHoUMCp7ZjiQ930DaNxXs
         Y5WuYaHNkWTfeXGF2qI98Jol87WVaSBU+09dioehhnVhsrfnk1uNz8dJZUufVRSWL4EC
         2r8veV8uLbdU5OHZIIb86WwNx7aTyzXS26zx/G6RnFuhJLMOiTLTPptf8HaTxE9HLyVE
         qTpEtJ3/qoFoznaKwrAB1U66993E8EsdAb0/v/vEfGELwntYdm/WCMoI94a3M3pVWStS
         el/H9dtpapHeidiONU9cNJapL3Sb0zpUJd5sfnFill8htfR4U7FXRgTDy5EMdmaJvZVT
         Lz0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=co4+ZKeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de30-20020a05620a371e00b007881c518e32si4160423qkb.76.2024.03.15.07.14.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Mar 2024 07:14:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=co4+ZKeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rl8Jn-0001Qg-8y; Fri, 15 Mar 2024 10:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1rl8Jl-0001QT-E2
 for qemu-arm@nongnu.org; Fri, 15 Mar 2024 10:13:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1rl8Ji-0005Ox-TT
 for qemu-arm@nongnu.org; Fri, 15 Mar 2024 10:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710512029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vgbIZ7eAaKGwPhksi48uy+7XiuUk0+9oJ7imPcTFphw=;
 b=co4+ZKePgeH400RWrey+baKOmVcahL8knZkubWnt3qigqQKRn8Nu7VeJySmmwdUM+6Juwp
 6ySms0Vmi/DByxwMvlWehhOKapO16drR1ridQXsvVxf/0fvtM0ogVaXFQihkDnEUCKZt4A
 3qMXKEpX5KpqZuKusUnEpjeqNkT3NjI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-pLlFt1PNOKOXfed6VGxjEg-1; Fri, 15 Mar 2024 10:13:47 -0400
X-MC-Unique: pLlFt1PNOKOXfed6VGxjEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D19F585A58B;
 Fri, 15 Mar 2024 14:13:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 247B040C6CB1;
 Fri, 15 Mar 2024 14:13:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E45E01800DD4; Fri, 15 Mar 2024 15:13:44 +0100 (CET)
Date: Fri, 15 Mar 2024 15:13:44 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, 
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Alistair Francis <alistair23@gmail.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Haibo1 Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH 01/12] roms/edk2-build.py: Add --module support
Message-ID: <nvi45kbmhbzrlapysvpy7srgdzw62we5ijhxgrxpfp4m27ji67@6eftbkcku4fq>
References: <20240315130519.2378765-1-sunilvl@ventanamicro.com>
 <20240315130519.2378765-2-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315130519.2378765-2-sunilvl@ventanamicro.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.933,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mZlgtZ806Uqd

On Fri, Mar 15, 2024 at 06:35:08PM +0530, Sunil V L wrote:
> UefiTestToolsPkg which should use edk2-build.py needs --module parameter
> support. Add this optional parameter handling.

I don't think this is needed.  By default everything listed in
[Components] should be built, which is just that one module we
have ;)

take care,
  Gerd

