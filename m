Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2903827lfk;
        Sat, 11 Dec 2021 20:50:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmoqi3iuPmu2rK4dKL1tDYTqtkknziOnhET7J0GhrWyR7E4yCcqfl4/e9Yylo7zIKCtQCu
X-Received: by 2002:a5b:590:: with SMTP id l16mr23667725ybp.629.1639284615641;
        Sat, 11 Dec 2021 20:50:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639284615; cv=none;
        d=google.com; s=arc-20160816;
        b=XiUfnBQZyfzH3W7Ff6T29F98pHCTR1RBMK9uY1gVgSTJRM5pK0J1k1MdNeZqbpxzWN
         1PIBj0MXTjzPnaZBPDTQ8qdZG62jlBwOokEbnuC0JnZuRDe8DzX50AsbWqHKbw2ETg2j
         4G1YRlvfhUjN4KhnXdLz9+6iCuWSDeuCDvluR/ZwexBACu9Xyf4GgKaP2kAJhvSXix8+
         xC73iEm/m2h4RepKrjxtkymJC0RaBqTE6f7eylCntBXx85Og9Kmhm7DLOoC0GEzEP38a
         4aoKfhwXum5nn+ZrvNygp83z6c9hxr6vhpnt2s1opJYL0AsgTX9NTuMyprxssasrt9cd
         A8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4q/JZX4adOweN2yqxHfBs8GHQX8eN4in6QlNJojcZoA=;
        b=cmeznM/3i0hM2sIC6XG17d+69INP+fkQ5LdUdPf9LzAnrfUy4MvmXkS8rG2tk5RKqR
         23yKs8lzi4Lt6Gt4Yp74a3KSzlU31M+3RC1bquMvXvMv1NLVrPleaiBE6slbjixqrypj
         8oOqKcGHD96Sys12SsGEDsOSffDmmKWfHCIwT4Y+vYmXbwIepLCgIblMwtHuT5G9C20G
         9wmZIFZECKSLtT6H/TteD0uBs4eoySV4aWuF9aljU/JmyP6TcQWGp4gT8bF+blvVD3bb
         M5aA2f+QqU+g6xa9GMqPJWjscCCBdXi6a0xvs3fo16+Jh7FFjyb6YVyaoGa0UZqzoJBA
         sPgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=s6rLx+Wd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si10822878ybg.333.2021.12.11.20.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Dec 2021 20:50:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=s6rLx+Wd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mwGoR-0006AE-2Z
	for alex.bennee@linaro.org; Sat, 11 Dec 2021 23:50:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mwGoG-0006A5-1Z
 for qemu-arm@nongnu.org; Sat, 11 Dec 2021 23:50:04 -0500
Received: from [2a00:1450:4864:20::52a] (port=41836
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mwGoD-0008MM-1G
 for qemu-arm@nongnu.org; Sat, 11 Dec 2021 23:50:03 -0500
Received: by mail-ed1-x52a.google.com with SMTP id g14so41185849edb.8
 for <qemu-arm@nongnu.org>; Sat, 11 Dec 2021 20:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4q/JZX4adOweN2yqxHfBs8GHQX8eN4in6QlNJojcZoA=;
 b=s6rLx+Wdcv3dHGuf/0mFcMuaEmN50nHsdvkCzD/zsPCmsJDm3Sz2nqeAb6Y8dil2g/
 8OwACW2lWuac7PgOFW8tCC2jjQ5xZmS8Dy3EOb7NRwUBZszM2RAQsC+9GH9mm3AwWZiD
 o/4M9jO+hjqLZPjnMg4HhA9dG2c4sMSbraisl0BGTOr8dVdSPkrdoqQNleNfnjNIzkpN
 gz8kpdtf+bA4Cu/YjBpiqDuGwTfJX2ZmyECMmDiouWBzl8adeaPzQsn8QMaQRR77FQkh
 MaKBkaDNR0K138/lDYzGnOWT7K70nvovbHWDinNWRRaBRTFqafVMfaEpYgqGhLjMund+
 j6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4q/JZX4adOweN2yqxHfBs8GHQX8eN4in6QlNJojcZoA=;
 b=TJAPu8czw1TvIQJwwxdEdMOs6z3xBvshZeoCKzfCtMFrutCJim7EsLJthtp5rsbdwY
 krg2lPe+6NkSIVqm8C6IkuUNpgU+pRaeDOHfW0xaodmkPvwPXSpUTkMpLpAf9HjDoJRF
 ye3iy9RhBOuzbsnpzX2/6nvet22YZ1gaM6AqDLwA/xdIaEztRfhXtWTR7khlanM6Cv8S
 Qmo2YY8P6a1x/licBBAfzLK439e0x1DGYb5JwHgJ1ow4oJLzz+b01cPjnu/AI0bo76Zu
 Qj9LRnWufZf6EM194EFM6RJumJtgehaLIrsVxsb5aa9a+1k552DTE1NNNFkZ60e0lYtU
 kuQQ==
X-Gm-Message-State: AOAM533Owkn3pKf6AiaU5w/+4APOnFkgFIpR8nc+bDJ9MPde7z5B6IS7
 7I3RQBgNQyYHEWJfJZWwesNDtWGa8tz+FOgok6nB/g==
X-Received: by 2002:aa7:de86:: with SMTP id j6mr52622601edv.1.1639284598266;
 Sat, 11 Dec 2021 20:49:58 -0800 (PST)
MIME-Version: 1.0
References: <20211210170415.583179-1-jean-philippe@linaro.org>
In-Reply-To: <20211210170415.583179-1-jean-philippe@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Sun, 12 Dec 2021 10:19:47 +0530
Message-ID: <CAARzgwxxRfOPbVU+QcYOkGL_pemLWH5x9z9pnhMgKoKOkAgSxw@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] virtio-iommu: Add ACPI support (Arm part + tests)
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZeVQXWDD8qF5

On Fri, Dec 10, 2021 at 10:35 PM Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Add ACPI support for virtio-iommu on the virt machine, by instantiating
> a VIOT table. Also add the tests for the ACPI table.
>
> Since last posting [1], I rebased onto v6.2.0-rc4. Note that v6 of this
> series [2] only contained the table and x86 support, which have been
> merged. Everything has now been reviewed and should be good to go.
>
> * Patches 1-2 add the VIOT table for the virt machine
> * Patches 3-4 are minor fixes
> * Patches 5-8 add tests for the VIOT table. They contain the tests for
>   q35 as well, which didn't make it last time because they depended on
>   another fix that has now been merged.

I believe the entire patchset has been reviewed and you are re-sending
it so that it gets pulled in after the release?

>
> [1] https://lore.kernel.org/qemu-devel/20211020172745.620101-1-jean-philippe@linaro.org/
> [2] https://lore.kernel.org/qemu-devel/20211026182024.2642038-1-jean-philippe@linaro.org/
>
> Jean-Philippe Brucker (8):
>   hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
>   hw/arm/virt: Remove device tree restriction for virtio-iommu
>   hw/arm/virt: Reject instantiation of multiple IOMMUs
>   hw/arm/virt: Use object_property_set instead of qdev_prop_set
>   tests/acpi: allow updates of VIOT expected data files
>   tests/acpi: add test case for VIOT
>   tests/acpi: add expected blobs for VIOT test on q35 machine
>   tests/acpi: add expected blob for VIOT test on virt machine
>
>  hw/arm/virt-acpi-build.c       |   7 ++++++
>  hw/arm/virt.c                  |  20 ++++++++---------
>  hw/virtio/virtio-iommu-pci.c   |  12 ++---------
>  tests/qtest/bios-tables-test.c |  38 +++++++++++++++++++++++++++++++++
>  hw/arm/Kconfig                 |   1 +
>  tests/data/acpi/q35/DSDT.viot  | Bin 0 -> 9398 bytes
>  tests/data/acpi/q35/VIOT.viot  | Bin 0 -> 112 bytes
>  tests/data/acpi/virt/VIOT      | Bin 0 -> 88 bytes
>  8 files changed, 58 insertions(+), 20 deletions(-)
>  create mode 100644 tests/data/acpi/q35/DSDT.viot
>  create mode 100644 tests/data/acpi/q35/VIOT.viot
>  create mode 100644 tests/data/acpi/virt/VIOT
>
> --
> 2.34.1
>
