Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp590271ocg;
        Fri, 7 Oct 2022 09:25:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5AGwW/Nr/3U4ST1EFW1BbXoIysYXyjFtX5UEk0iePiBe0gu/THHhyPikaFoGQjxH/1fZW8
X-Received: by 2002:a05:620a:8085:b0:6ce:1edc:43fe with SMTP id ef5-20020a05620a808500b006ce1edc43femr4239808qkb.46.1665159939353;
        Fri, 07 Oct 2022 09:25:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665159939; cv=none;
        d=google.com; s=arc-20160816;
        b=ZwpvB53JT4mrRdD1QzOScq2V/lGMW9Mng56mNST5VrIc8iOX1/R4av0sqi3K3mqzCD
         C5N5w3Wto6qoq4N/0vHrg3zhKLhMNM7cAAaR6V2nkyZZopeBFfTY7iaCZsJ1onsRhcWQ
         AWiobNaSEruQGO3J/0JXTZwvbyJyYu/bZDMHSI0SPT3nVX38EMb7ygIGHgEqIIxFOGV4
         MGIYMamFU1MYEE9K5pBWJvCYtCcBth6xffAygU12Y6YWhHsuL4lVMYSftirYwkgpFCRt
         SjovRDVXabkp9dwIMhGALItztZee4Ncozfg9GNLbUgKveXggt0+iGhbbTFCwyVhQR071
         DoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bt7NkM+EMtiy3WCIZyEKf5tH+Uangx7p5pMQz++WuWI=;
        b=scC6ugfX7NaTt80l5KalRJfE2O2yJSdXSx8zP0QsqJ+e2HbEYuc+1GbvH9zmRndKY0
         RbB42c9N9UCLA+v3MkVrGaSNFxKeEImcnMUjfGRab5flaUVA2A8MvxwlBstMPBPSgJaZ
         qOroPk8jRc4oujwIMl2eg6UfOVs2Tz9d9eevqVTqJzP46yQf0buG0Z+x0TIYN6mXWzSg
         Ci8QYLqQAC/UEx+0uAwfaSvoIGe4BH5KOdyp+5ZJrQi8/s7oFxBpxMb9t+PI0xck3gVu
         zdfuY184UmJ1POL8oUwHm55t9NRFVa9279dQ1BAuD5LzaTExasAWOwMMvisRt3PcAxP8
         I55A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b="QsTL/XHB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s22-20020a05620a29d600b006d76d51f67dsi1042768qkp.661.2022.10.07.09.25.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 09:25:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b="QsTL/XHB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogqAM-0004YF-VZ
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 12:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ogpAa-0000x5-57
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 11:21:48 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:45637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ogpAX-0005jp-Ve
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 11:21:47 -0400
Received: by mail-io1-xd36.google.com with SMTP id l127so3848327iof.12
 for <qemu-arm@nongnu.org>; Fri, 07 Oct 2022 08:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bt7NkM+EMtiy3WCIZyEKf5tH+Uangx7p5pMQz++WuWI=;
 b=QsTL/XHBPfMcjsNywqce21l4p0C8vUT6gd3spMM3iiaBFmDEzJsMwyTAmsvBJBI9Q6
 +EIoz7BaFfkaHNiV5n11RnowvSbZ1vwih3BHWec7oU77oCJqgXH7kcysbCfqC2Vle8oA
 ktLIexmKcFyT0CHQIXtOYEKXK7a+t3aobskF4YiEe9IkCpC1JMeVwPf+IvDdluacumD5
 cSs14xK+YsFZ9mTpZ5+fWW9qDBkHXTssPO+g2OIUx6T+84X9zEQQ8PlYNIKAFVOqzuev
 lNrzvFqUuqBOEChetv1TcUdUNR0JB81nYXm2fOkD5alES0W+rv4OByZBGwIo3kcX8F02
 00Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bt7NkM+EMtiy3WCIZyEKf5tH+Uangx7p5pMQz++WuWI=;
 b=ViofcgZufW1JQug5lDZj/s1obBgWORSZPzzv9IMhxGzoFg5gxJSWYlGq2OjtAXoYcL
 pZaJ9GDnbN6SKlHbTH7H89Icc3e5g1gGLfKch8VVcdH334w4TT+gDQPMdEANumYDZ5nv
 wP57zC/P9FrSTA41pRFKRSFCpL9qWovGcpf5+kVCUpwIjzYnOnLawWFRy379m5iHKJej
 2BaV0F0NDuInZA+ym3mXV5tN1DnGU62Ava7ZKOeDGVGN80O/EKfQiMzliaJRUiPkjFNY
 Q30N77BxIybiyd0Pzw9MlUNvGXXTSmOK2osQQYyJOAEfTBe/xruBP3tPKlL84IIJ7loM
 T1xw==
X-Gm-Message-State: ACrzQf3526sC0b10FtPxPUVNL+B0+MNb2VEVkt0HlimCa8fJe5eLa/n7
 kkwBiHFVDHgdJmD3swn+J8Eoc8Eqfbd0nqiLPLvwVg==
X-Received: by 2002:a5d:9452:0:b0:6a3:4fab:d98e with SMTP id
 x18-20020a5d9452000000b006a34fabd98emr2484746ior.185.1665156103699; Fri, 07
 Oct 2022 08:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221007144553.79648-1-miguel.luis@oracle.com>
In-Reply-To: <20221007144553.79648-1-miguel.luis@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 7 Oct 2022 20:51:32 +0530
Message-ID: <CAARzgwxpjfioHSWq3iyzbOT2LgfX_93A5Sje0e1K1tiXtz0wLw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] fix for two ACPI GTDT physical addresses
To: miguel.luis@oracle.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com, 
 imammedo@redhat.com, shannon.zhaosl@gmail.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s8+ZINyFaTFU

On Fri, Oct 7, 2022 at 8:16 PM Miguel Luis <miguel.luis@oracle.com> wrote:
>
> The ACPI GTDT table contains two invalid 64-bit physical addresses according to
> the ACPI spec. 6.5 [1]. Those are the Counter Control Base physical address and
> the Counter Read Base physical address. Those fields of the GTDT table should be
> set to 0xFFFFFFFFFFFFFFFF if not provided, rather than 0x0.
>
> [1]: https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#gtdt-table-structure
>
> Changelog:
>
> v2:
>     Updated with collected tags from v1.

For future reference, there is no need to send out a new version with
just the tags added. The tooling make sure that the tags are collected
correctly from the last version.

>
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg02847.html
>
> Miguel Luis (3):
>   tests/acpi: virt: allow acpi GTDT changes
>   acpi: arm/virt: build_gtdt: fix invalid 64-bit physical addresses
>   tests/acpi: virt: update ACPI GTDT binaries
>
>  hw/arm/virt-acpi-build.c          |   5 ++---
>  tests/data/acpi/virt/GTDT         | Bin 96 -> 96 bytes
>  tests/data/acpi/virt/GTDT.memhp   | Bin 96 -> 96 bytes
>  tests/data/acpi/virt/GTDT.numamem | Bin 96 -> 96 bytes
>  4 files changed, 2 insertions(+), 3 deletions(-)
>
> --
> 2.37.3
>
