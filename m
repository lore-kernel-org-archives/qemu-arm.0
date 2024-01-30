Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp961609ejk;
        Tue, 30 Jan 2024 09:12:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6hWCf2krkhRhU2DRLwCleGr8dq+K9ScWvEG7NzYlhqjNsLBENCzn3CQW7SyZw6gNXXG89
X-Received: by 2002:a05:622a:28b:b0:42a:b1a8:6277 with SMTP id z11-20020a05622a028b00b0042ab1a86277mr2685916qtw.53.1706634727727;
        Tue, 30 Jan 2024 09:12:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706634727; cv=none;
        d=google.com; s=arc-20160816;
        b=D1aTQJq7fcKzV1FWeNWXBwLPR7MmVJzrxsT4zfrt36ZECZ0IuftsTQfbTQJB6VNvb/
         1BIeflrmvngGYHLoBcD53Wzjbl01ENtOltL15RqGQZtn+VOarvCsmaTuOjKSI4ArubFq
         ZMkE02Lpc2pLnxaAMr2PsKlqZsAAbC2jg91cMW9cNDlvBHSfX3edZShLBgJcsUeYfiuS
         U47xrRyQ9HQ7AJA/Xm+/3HC12EXVuSHDFczaTE0Qb2459GpZx0bphTIxPfNLQvN0v2ET
         jVLNgPRyS8iLRHslBTekzia/0Fhd/twvSBR7iiT8TSm86Y7QXKUYjChk37NfLihhQJUJ
         TX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=3JbeLxGKYbzZ3XQl3u1s+TzD+mbxwvgqFTKzHuWqOso=;
        fh=cZcfwQooAypZMR8S+YDeIdQ645V1fWGYrDcAd2zT4cQ=;
        b=UfGDUoNgRzTQ+1vSp96a2Nb2606hykwPuiOxqLW/b6djKBMUhMJN/cBMLXtal/JYBe
         p180PCZyWjk5IoTvpOX8cqPUWiSYwkdQbjOdV9eRtw2gNSU1relPXsKwkks3t3GAprNR
         yM6srkgSnqK9+xl2iXv93VkqSugFB42/IFeJGo3OSl5q7U7MT5AcTZO6SpR7SDTI1dLi
         XmxvM2nef5RUMgcSVswYCw3jZVVORKV2Cg1RSM+0d19XCZwdgmGJOs4qEs+VTMTR1YnZ
         VR4Vq4RmgTWmCbbWxPt/7CuVnW3X3THJ88ddqIVR93wNmH1pVXc3VaXOOUDQ9fik+I4Z
         cvFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RCAZfbpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020ac85742000000b0042ab41a8e8fsi2234393qtx.99.2024.01.30.09.12.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 09:12:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RCAZfbpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUreT-00045V-J1; Tue, 30 Jan 2024 12:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUreS-00041n-Jt
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 12:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUreQ-0003f3-Uj
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 12:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706634717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3JbeLxGKYbzZ3XQl3u1s+TzD+mbxwvgqFTKzHuWqOso=;
 b=RCAZfbpEDnN2WJK0CbwouYK/aa/znHa6TY1jhiS87FKry/6Vai7VQyB7lsddMFw64MOx56
 H8w88fgREbXUc139dBvr/HIxAPColRyvsUvpsEQ2KohwGtAE4oNaCwrW0mhvV9IdQR4dME
 jYNMjs1gKk6UbVcdr9If5ZVg8nqYgBk=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-8mRnfpVUPyG7fLRPUuoLyQ-1; Tue, 30 Jan 2024 12:11:56 -0500
X-MC-Unique: 8mRnfpVUPyG7fLRPUuoLyQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-6dde3743f0bso2642014b3a.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 09:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706634715; x=1707239515;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R06aqEIOEXWCLhaarYTxa85WehQ4KktiwtrZ5hjYt9I=;
 b=indfEfDNhfZ7FllxXir0oacSAXxWw4Ye9i5snFOmPG7RvYFLeSY0SiSpHVa7H1EoMw
 TPMyWoZSBiffQzfj9bj6OuWuF+D7bFC+5bvi0QU8HnuL7W206mJtshfLL0eEaJMzQqIL
 Incc9znnhOM1aiIPHPhiH2P+HgeqQWcr4F9b1kRfecJ8XjVYWMGEKrcI/sUjCCPR7Xw/
 PX8aGO63jF4Wq2F3BtAy9+Zc4hCuXLurH+c1mwLntBkg+KN4fFmvZBzyh+uhOF6c4vVh
 Jbo6f0S/u6YEz0guKI5ed1xE4A6h5iuwN0a1ABff7UuFLYd0gbbi6dak/J6n5/ZtpLds
 VYLw==
X-Gm-Message-State: AOJu0YyM4K1nUoF91M3/QBJ9j4w0yMYR3YVhvgZltv+u/TIlYJEjx2B4
 jv9BCWeIHaDpZOIOZainxUsxShkqKA60G5vLL5ECqgivm5sAZabo1ScdGcac3FqZqs8T6s26yQu
 wXoIZhcU1U0Uz0G+dnl1mcdmnkMLCT92rn01IhX4jW0rnlNTtLA==
X-Received: by 2002:a05:6a00:4503:b0:6db:605c:b9e4 with SMTP id
 cw3-20020a056a00450300b006db605cb9e4mr6316426pfb.31.1706634714934; 
 Tue, 30 Jan 2024 09:11:54 -0800 (PST)
X-Received: by 2002:a05:6a00:4503:b0:6db:605c:b9e4 with SMTP id
 cw3-20020a056a00450300b006db605cb9e4mr6316408pfb.31.1706634714604; 
 Tue, 30 Jan 2024 09:11:54 -0800 (PST)
Received: from smtpclient.apple ([115.96.128.50])
 by smtp.gmail.com with ESMTPSA id
 d2-20020aa78682000000b006ddc5d8ecd7sm8002030pfo.32.2024.01.30.09.11.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jan 2024 09:11:54 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2 2/3] hw/loongarch: Add `\n` to hint message
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240130163741.145925-3-groug@kaod.org>
Date: Tue, 30 Jan 2024 22:41:39 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Message-Id: <65A9DB8A-66E8-4F60-AE26-2CD73DDA440B@redhat.com>
References: <20240130163741.145925-1-groug@kaod.org>
 <20240130163741.145925-3-groug@kaod.org>
To: Greg Kurz <groug@kaod.org>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
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
X-TUID: lewfQM9Dn4HR



> On 30-Jan-2024, at 22:07, Greg Kurz <groug@kaod.org> wrote:
>=20
> error_printf() doesn't add newlines.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> hw/loongarch/acpi-build.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
> index 730bc4a748c4..a1c419874123 100644
> --- a/hw/loongarch/acpi-build.c
> +++ b/hw/loongarch/acpi-build.c
> @@ -509,7 +509,7 @@ static void acpi_build(AcpiBuildTables *tables, Machi=
neState *machine)
>                     " migration may not work",
>                     tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
>         error_printf("Try removing CPUs, NUMA nodes, memory slots"
> -                     " or PCI bridges.");
> +                     " or PCI bridges.\n");
>     }
>=20
>     acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_ALIGN_SIZE);
> --=20
> 2.43.0
>=20

