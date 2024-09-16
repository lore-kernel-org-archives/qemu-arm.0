Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp1028348njl;
        Mon, 16 Sep 2024 05:16:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8Ypmc0rRcLt1P7zIH04EpwzMZFd3A5uxtMgS7fFxCXnwhhGw/a89DKxm9JCjEax85Q7aGXFQLWLagUg==@linaro.org
X-Google-Smtp-Source: AGHT+IEmsIRYamSgtc3GKYbc5oG82f4ZzKUAg9IGGa6UXnXOqBsoMjekRKm4p/WoEXvggtP01cOa
X-Received: by 2002:a05:6102:510b:b0:49b:fe6b:493e with SMTP id ada2fe7eead31-49d4f6ee970mr5963459137.24.1726488986475;
        Mon, 16 Sep 2024 05:16:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726488986; cv=none;
        d=google.com; s=arc-20240605;
        b=ROVNm1EFeJhKYGQlVcMd7y8U5moVmsSCYMtUbvZI1P1X7+U7NURVmZhYNf5qZaUVuX
         eYAqD/FRQfuAa2mkbHToirqW8U5UvMFSQncLbUMeJ0iSbRfSycCE2f2tk5SedBgYf4OH
         DfZddv98YrbvFcBFGvSN+m3jGuErMTqJzg2Xe1atF185mHXF/Ux3ZKqSiXZHxZmgItLE
         XaUYh7H0oqRQW8lee8HnV1QXawb/ekN1J6WD423HysXbJmd/HaadCK7OLOOzVBAbawOW
         vLUcN8fqnq23/kNJW+1WZAvaFvzDRkHjef6b6RWpM+/nFTm4NprvhI3pE9p+BWkhwm3l
         zWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7XHYgu+al8w35VZ43QPTcPnTcScVSz3NhYxZGUejxpQ=;
        fh=RX80NXBXnimQnsyH9+53wM0b8DwfZwrr3oBcfzIDLho=;
        b=T9b3NIBq6EPT5nBBcxR/7xuEW72MprzyJcjZI65itUM97BHs8u1HRlDKFv3yUZ6hSk
         5oadWPe3AGpwhYX6QKUlV57tjdDhs/mTwRIcd4S1Qb8ohrPmSQu/3OTLarqUNOyfpTkg
         fY+Jcyko2Ruh6vwvdzzRT0qL9qDcIuZxRdpO0o8EnN+zE6y9CFyDoBNQWNuL8CwCbLpT
         GcB45hIiCu9PeW5pulj70YLfaBXJy74yHDo/n8F8YnjVBpre7Bn2fIkS3d38RN+JLDeP
         0a70240MRb7VPexDLsX854j5xIGAQ11zoMQ/+gV4ggsgTCaq74YqdFJEuAf70/0O0wp3
         RNuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BVi+/tZL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-49e6b0fc727si859563137.98.2024.09.16.05.16.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2024 05:16:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BVi+/tZL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sqAeL-0005dd-MK; Mon, 16 Sep 2024 08:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1sqAeG-0005L1-Sl
 for qemu-arm@nongnu.org; Mon, 16 Sep 2024 08:16:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1sqAeB-0000UG-GQ
 for qemu-arm@nongnu.org; Mon, 16 Sep 2024 08:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726488962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XHYgu+al8w35VZ43QPTcPnTcScVSz3NhYxZGUejxpQ=;
 b=BVi+/tZLSUsD9DLijkvjZV1IpJWdnIF4UqRJTxC8nxxNPtf5OL6+0HxGFGmQN33F4ajiuG
 T9WuNv+r1jbTGpzM5AeHebCuILoog7vWnV0jMYaJCwcJ7Llnrn/Z0esoZa67+YgtE0C/zH
 +olV6VoOg5CnFsupxnQG/pg/KlblBuw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-XZO38Gk1NK6bKohkVRfDzg-1; Mon, 16 Sep 2024 08:14:25 -0400
X-MC-Unique: XZO38Gk1NK6bKohkVRfDzg-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a870f3a65a0so34068966b.0
 for <qemu-arm@nongnu.org>; Mon, 16 Sep 2024 05:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726488864; x=1727093664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7XHYgu+al8w35VZ43QPTcPnTcScVSz3NhYxZGUejxpQ=;
 b=BLUGNtBa8tdy92D107lzOsLoLdpS0O4d7vr8G5t6N1EjvJuhC0QpncQufARzfC72La
 aFvxEtd24GVwUoPZBoJp2b0FdjyMBveMbTyuYDOwQBw4Fx2xDW17p0Ogvq8MMPGSUKQE
 hIvaT0qArw42qhO9ff8YG5Y8nyEZ3q7RhsAOlqPk1NT50GcBsdTtSbZODoU13JTQVNBi
 lPAu94oUEA6zfPWecx9+zcPAuXgC9HD837HGU/AIXcAffrOBf1tI6S+yG6Aphf5f1G8V
 75WtwuhJqJyS+fLuJe4Hgd2l92ucoy9JH+9IktjklOSLqjQAJDe1WiJD1YTFYVBvZkQ/
 jlCg==
X-Gm-Message-State: AOJu0YzSu/9kXbC/m16Gu2oWXE0Zl3DtGpIP7YeSff2uYCi7C/d3HrrI
 No1EUc50gTl3wZsCzTNYciFTjxDE9v1NLQcCS2K+bX/btU4pi3wdnM6u74w/OCzj588yeQTxMkB
 gXk1I/AEbUNeCNYIBd/37M/sPa2ySw2HkQzguhn6maiJECU1OxIZM6uOuuDkpQ9gLJXx7Y/MN0q
 MW1kE+nMaEKALRcT4waJc3nj7F
X-Received: by 2002:a17:907:e662:b0:a8d:75ab:17aa with SMTP id
 a640c23a62f3a-a90294a4b21mr1478144966b.37.1726488864267; 
 Mon, 16 Sep 2024 05:14:24 -0700 (PDT)
X-Received: by 2002:a17:907:e662:b0:a8d:75ab:17aa with SMTP id
 a640c23a62f3a-a90294a4b21mr1478137066b.37.1726488863141; Mon, 16 Sep 2024
 05:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240915233117.478169-1-gshan@redhat.com>
In-Reply-To: <20240915233117.478169-1-gshan@redhat.com>
From: Zhenyu Zhang <zhenyzha@redhat.com>
Date: Mon, 16 Sep 2024 20:13:46 +0800
Message-ID: <CAJFLiBJLEqbf16Dt6UxfVeE6eC=fQ=eA0A7Y2r8LWgPbtf4tpQ@mail.gmail.com>
Subject: Re: [PATCH] hostmem: Apply merge property after the memory region is
 initialized
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, david@redhat.com, 
 imammedo@redhat.com, philmd@linaro.org, pbonzini@redhat.com, 
 peter.maydell@linaro.org, shan.gavin@gmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=zhenyzha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 1CHcn0n2KTaE

[PATCH] hostmem: Apply merge property after the memory region is initialize=
d

Test on 4k and 64k basic page size aarch64
The patches work well on my Ampere host.
The test results are as expected.

# /home/test/qemu.main/build/qemu-system-aarch64  \
   -accel kvm  -machine virt -cpu host                           \
   -object memory-backend-ram,id=3Dmem-memN0,size=3D4096M,merge=3Doff

Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>


On Mon, Sep 16, 2024 at 7:31=E2=80=AFAM Gavin Shan <gshan@redhat.com> wrote=
:
>
> The semantic change has been introduced by commit 5becdc0ab0 ("hostmem:
> simplify the code for merge and dump properties") even it clarifies that
> no senmatic change has been introduced. After the commit, the merge
> property can be applied even the corresponding memory region isn't
> initialized yet. This leads to crash dump by the following command
> lines.
>
>   # /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64  \
>     -accel kvm  -machine virt -cpu host                      \
>     -object memory-backend-ram,id=3Dmem-memN0,size=3D4096M,merge=3Doff
>     :
>     qemu-system-aarch64: ../system/memory.c:2419: memory_region_get_ram_p=
tr: \
>     Assertion `mr->ram_block' failed.
>
> Fix it by applying the merge property only when the memory region is
> initialized.
>
> Fixes: 5becdc0ab083 ("hostmem: simplify the code for merge and dump prope=
rties")
> Reported-by: Zhenyu Zhang <zhenyzha@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  backends/hostmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index 4e5576a4ad..181446626a 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -178,7 +178,7 @@ static void host_memory_backend_set_merge(Object *obj=
, bool value, Error **errp)
>          return;
>      }
>
> -    if (!host_memory_backend_mr_inited(backend) &&
> +    if (host_memory_backend_mr_inited(backend) &&
>          value !=3D backend->merge) {
>          void *ptr =3D memory_region_get_ram_ptr(&backend->mr);
>          uint64_t sz =3D memory_region_size(&backend->mr);
> --
> 2.45.2
>

