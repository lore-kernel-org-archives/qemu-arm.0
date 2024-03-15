Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp1033280eju;
        Fri, 15 Mar 2024 07:15:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXeJHRoU67DH/U954aPkPmxULMgbaNyYP8XXTCIjJ4XpqL5+K3rp4zHkKzpqoq3DsyEx5ctgXx0J8lKMDpKPAk4BJfcKxyh
X-Google-Smtp-Source: AGHT+IEahxgOT6tx+43gp1PJ/GGVPwO8Y8itm+0nxonlx57oPlSXM0221pYY9Si7p8Rr0OvpK3lX
X-Received: by 2002:a05:6214:1bcd:b0:690:84d5:cfc3 with SMTP id m13-20020a0562141bcd00b0069084d5cfc3mr10345042qvc.1.1710512137503;
        Fri, 15 Mar 2024 07:15:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710512137; cv=none;
        d=google.com; s=arc-20160816;
        b=Bt4lPMNKFEAqLC1XgFsrKQBuNmotZiSnbLWtzmTyGA21XhB4c9U1yPfwvKyoU2zIDg
         2yCgAVVwjBmWrqpXMfMcoM8syzu8QYL330qnCNETr+XZAtPaUdBx+sUx3GyAKoveyXwj
         alzlmxuz37eNK7ijorwdMLleY0DBvr4B2hO9PBdGHfbVyPcH66+YMvMfBp1wMMYPvpm8
         KprMPYxMNOcMN6KdwlA2YFU4NDBYpnYbZlcLBYzTBK51Uuz68hEQ52Cs0gJigfZlDELD
         qeDHzGxO6Ff/UAKHysSjP0JBje0RQO9PNNrEWA/lDDlk2i97xFIzJvRT2x6taJNOB1mD
         3H6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=w1364j2VhZB6bZhx3dW4KI7A3t7vXn+5+aieG8tbcDE=;
        fh=Baw0egHTUW2YOB9xUl68znQ+5cwxFOSKFgakOp+S9Es=;
        b=iwzeiUGTde97ZPmfNeCXSQaheRXTv/CCHiJTz65tyw3VbYrPpig0xHpfNAztBBz2/o
         nzETV8QmRd7rdtue1+AZsgT8E2IF6qidmkMQYC9p/A/VLI82ciCgAladKTNQhrLoyUtF
         5gQZthnjrvSxzPDvNnnO38gbCrFsxVgMH/myofAYSsg7QzJDv4+BWWjvDTBBfg0FgR7/
         4cv5vWU7pCo3NiiOvAAjZUzuuW3g9JPiqeae8FkfZCgKnyGnEjOiVd5tPwGja6wMKo+G
         MSf776EKZpfOZWQHNvzRnvFbE9ZL80fhetL9wVRkokwmfEEL+8M436E8CsoNoVM30FF1
         104g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ADFjfUIs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn3-20020ad45d63000000b0068fea245ae7si3020835qvb.23.2024.03.15.07.15.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Mar 2024 07:15:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ADFjfUIs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rl8L3-000209-Lu; Fri, 15 Mar 2024 10:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1rl8L2-0001ze-B4
 for qemu-arm@nongnu.org; Fri, 15 Mar 2024 10:15:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1rl8Kt-0005bW-Qg
 for qemu-arm@nongnu.org; Fri, 15 Mar 2024 10:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710512101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w1364j2VhZB6bZhx3dW4KI7A3t7vXn+5+aieG8tbcDE=;
 b=ADFjfUIsOu9s8+INl2Mh4JV1pdDxSXf2K5EAfnBBqxkt+ByhdrEMKCvfBifogwCz28Bl4X
 cQXsWNunKIx22QQnd55iD72o/u2I4lDWfuaa/DJpjVboCcFVN56QRxanGbNm5K+xcFoVX5
 3ybUq7DqZ8XRIpmUjw0qSZiQhfsdACc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-Z4j6xV0fN9K2mE4iAZV98A-1; Fri, 15 Mar 2024 10:14:58 -0400
X-MC-Unique: Z4j6xV0fN9K2mE4iAZV98A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B89A2185A781;
 Fri, 15 Mar 2024 14:14:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E923200AFA5;
 Fri, 15 Mar 2024 14:14:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E90FA1800DD4; Fri, 15 Mar 2024 15:14:55 +0100 (CET)
Date: Fri, 15 Mar 2024 15:14:55 +0100
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
Subject: Re: [PATCH 02/12] uefi-test-tools/UefiTestToolsPkg: Add RISC-V support
Message-ID: <f6wp7r5e6covd5bjubvqcvwvhgur25yjxcqxg54ivlfhwencme@gtyxkxji3ear>
References: <20240315130519.2378765-1-sunilvl@ventanamicro.com>
 <20240315130519.2378765-3-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315130519.2378765-3-sunilvl@ventanamicro.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 4hQmxRNrqAQu

On Fri, Mar 15, 2024 at 06:35:09PM +0530, Sunil V L wrote:
> Enable building the test application for RISC-V with appropriate
> dependencies updated.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  tests/uefi-test-tools/UefiTestToolsPkg/UefiTestToolsPkg.dsc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

