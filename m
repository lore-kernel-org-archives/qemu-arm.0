Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2842138njn;
        Tue, 14 Jan 2025 20:13:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV0MAN5U47Smh1zx63bD5ShIOR9Jvje4o2hD+wJItYH7bh1W3z3xbvEtGgvN3HtqhZBHCi3t380/D05RQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE99aNOKoSCJhqUwxiM2y/qYrSaNdZy5G8emWboOysEU+YDeRTP1u/mPM5lfgwEM7BFpCu3
X-Received: by 2002:ac8:57c9:0:b0:467:73f3:887d with SMTP id d75a77b69052e-46c710467c9mr433519141cf.33.1736914425246;
        Tue, 14 Jan 2025 20:13:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736914425; cv=none;
        d=google.com; s=arc-20240605;
        b=WOpzyZMkGuT8ckFGt5HCUyo1VqgyYGPX120Rh2clbW4hL6yxAXEPWzdnjxn1//ok8F
         H3IGdl29hiRK1dTR5QWNlrCO1sd2N3ai+Qwwi3fQQOUBQ9/QPChXIc2vwSK1c4O4IfrC
         67WU8Y+arXUaisS5dpDpfS5PvBhw0+UICWcnp4fx+TzLyovrlpqOzHUynrShT7/Huag0
         Dphh7F1a/gSKS6+zRb6pCwXKpkZGE8m9OAVHG5kBrCbcqyLtq1NOTQ8CSuuY5IyE02C7
         t9BoconK3/E2nHNkM5Jw863C2MROKFs9m07Jd6iUcMZB2bvTgdbJ+JdYYaxyXEgU3Lg3
         AFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=4Jh4nNGqE2jO0tG/eZ7uF+qlMu8yWGMYVwlm1sZ5j8c=;
        fh=K0nR72IyFYZADReMJceu1RXSyx7wI9gP3Q5miWV1kl8=;
        b=ALPHJdezPCLLgn9EVJDNbdrZ47h4gYnEFrmrmMOGub4s9SsPcc5Vb9oxDGYCtp/+EJ
         l2A5S2S29ks9NcEK9vnS1KnhfYSjrbnhESstSt4Hs2+h6ptO6D4z2VsRWvME5pLWr8mD
         DaZ6hcgN/cM9tpr6FEIORoZCnktqCUaWSk66ZgMwMQ7zgTfTvAhTU8D1xCDdgoyIJh/7
         2hnf/tgXlaDzUxyRyZa4QAlPPFMooWEWXb6CQeH2nLIZ1Kytxa9uER7ewtv2C6t+Rt41
         ltMO0uaiqarbIA+OVqXxaNZzZCR9mu77CtwLcT9WgYBmWJBhKarwxEZjRPFYOI2PPNJD
         027w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bM5wmSlA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c8741465asi129515041cf.530.2025.01.14.20.13.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 20:13:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bM5wmSlA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tXumG-0000zN-Mp; Tue, 14 Jan 2025 23:13:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1tXumB-0000z7-ED
 for qemu-arm@nongnu.org; Tue, 14 Jan 2025 23:13:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1tXum8-0007XL-TQ
 for qemu-arm@nongnu.org; Tue, 14 Jan 2025 23:13:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736914383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Jh4nNGqE2jO0tG/eZ7uF+qlMu8yWGMYVwlm1sZ5j8c=;
 b=bM5wmSlAms2v2Xbl+SlwBLZcGT5P+Wo6EGG6HbktcY9oKMoveCRaqh5c8AsEwvE5/8gDkz
 H5HJkLO1SThN/h0yP+OHj4MsyzUH9TSP9gNXjH8Wm5vKxRL3YRVdTRk0SA1AnNfemNMyAD
 +oCeysExjFHujMEnUrv84jRFYW+y3Dg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-zrDs4TEvOEChh2sfuvfgdA-1; Tue, 14 Jan 2025 23:13:00 -0500
X-MC-Unique: zrDs4TEvOEChh2sfuvfgdA-1
X-Mimecast-MFC-AGG-ID: zrDs4TEvOEChh2sfuvfgdA
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-aabf8e856e2so300073166b.0
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2025 20:13:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736914379; x=1737519179;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Jh4nNGqE2jO0tG/eZ7uF+qlMu8yWGMYVwlm1sZ5j8c=;
 b=If/KYb1byLvb3PJtgHkClb4TIiXj5VwVxgE6pVezxT6lWqEWSWrch7wZgE2d68FZ7h
 2WQxG1Qg93tD+S9EHe2U+L9iwpZW2bRYL+s3C2EKwpUD4YCNyeRa7XqKHQ/yZn7mpRe7
 BjlNLDgtbbROpI7QOJqHsfGGrDYIG/2mK/5Jaqh7zZAI+LqbXFExKbI7CwZwkuWadB1K
 QIISwLtZncuwloWTogCWUHwBg0ec4P6bLSF8wNQUCE5d868tDihS7VqSXdVaQmMLzTcs
 k/0ANTT6734/Q7k1kRH+1nFCC/IdGlwln7H04z+QwmuVhsYFSrRoQ53e8nWis57Q74Sg
 j4hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/slDYSKgzv+8GBWXhtfwnKiwMSly64x3YX3f1jqrlssv4fxgUB4bVps6pcfSdUWZxhNNlJCJfHg==@nongnu.org
X-Gm-Message-State: AOJu0YznXVsDXEUxzJpojtHEoFeEotX5OwjNRM0XbqwRlG7L3iUJA8N6
 ojNHa/dun2w9/8QUND/W8+Vpv50GlMV4QMK0nXVWtLBg+GHNdmi0KX9JXHm++QbzE3he4/8fu+R
 j9z2bXZ51Zz116hBlZE5SIig1cCASKHjyiJJJ7CMLoEVo8rOK0BBey1wOnQ8Z7JiTKdF2dpwWyR
 0jk2/xw0WnXxeKBpLa2PfLBfpJ
X-Gm-Gg: ASbGncu2t1GqjZOrvSWGwQUjaDkKwLAUxNJa4gvxz0LgFdgRTt/479u6oUtS4kzUmTW
 AC3rkOjRZjgvOdxW87rWqruRwkoyNcb+8CZXczPhP
X-Received: by 2002:a17:907:8690:b0:aac:742:28e2 with SMTP id
 a640c23a62f3a-ab2ab6a8df6mr2540682766b.6.1736914379575; 
 Tue, 14 Jan 2025 20:12:59 -0800 (PST)
X-Received: by 2002:a17:907:8690:b0:aac:742:28e2 with SMTP id
 a640c23a62f3a-ab2ab6a8df6mr2540678566b.6.1736914379124; Tue, 14 Jan 2025
 20:12:59 -0800 (PST)
MIME-Version: 1.0
References: <20250114174601.23-1-alireza.sanaee@huawei.com>
 <20250114174601.23-2-alireza.sanaee@huawei.com>
In-Reply-To: <20250114174601.23-2-alireza.sanaee@huawei.com>
From: Ani Sinha <anisinha@redhat.com>
Date: Wed, 15 Jan 2025 09:42:48 +0530
X-Gm-Features: AbW1kvYy_9ehAskdg2VTDfwbUiK-lKc7kN0ipOAvbddABNi3TweGyFWj9AMw8hI
Message-ID: <CAK3XEhO9GjdMnZTSY7vohbtkf21PRPAE0UhsqbrkDo=Pbp29-w@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] tests: virt: Update expected ACPI tables for virt
 test
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, zhao1.liu@intel.com, 
 zhenyu.z.wang@intel.com, dapeng1.mi@linux.intel.com, armbru@redhat.com, 
 farman@linux.ibm.com, peter.maydell@linaro.org, mst@redhat.com, 
 shannon.zhaosl@gmail.com, imammedo@redhat.com, mtosatti@redhat.com, 
 berrange@redhat.com, richard.henderson@linaro.org, linuxarm@huawei.com, 
 shameerali.kolothum.thodi@huawei.com, Jonathan.Cameron@huawei.com, 
 jiangkunkun@huawei.com, yangyicong@hisilicon.com, sarsanaee@gmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h8QKQ1kK3gpYT5LPPYavqNRlCffZ2gBZDuTkuQtwfZ8_1736914380
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.063,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.794,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: 7TcQfcXR/Y/k

On Tue, Jan 14, 2025 at 11:16=E2=80=AFPM Alireza Sanaee
<alireza.sanaee@huawei.com> wrote:
>
> From: Yicong Yang <yangyicong@hisilicon.com>
>
> Update the ACPI tables according to the acpi aml_build change, also
> empty bios-tables-test-allowed-diff.h.

Where is this part? That is the part where you empty
bios-tables-test-allowed-diff.h.?
You are supposed to send a patch that first adds the tables that you
are changing into bios-tables-test-allowed-diff.h.
Then you are supposed to add the code change patch that makes changes
to the tables.
Then the patch that updates the tables (which also clears
bios-tables-test-allowed-diff.h.).

>
> The disassembled differences between actual and expected PPTT shows
> below. Only about the root node adding and identification flag set
> as expected.
>   /*
>     * Intel ACPI Component Architecture
>     * AML/ASL+ Disassembler version 20210604 (64-bit version)
>     * Copyright (c) 2000 - 2021 Intel Corporation
>     *
>   - * Disassembly of tests/data/acpi/aarch64/virt/PPTT, Thu Sep 26 08:54:=
39 2024
>   + * Disassembly of /tmp/aml-QNEIU2, Thu Sep 26 08:54:39 2024
>     *
>     * ACPI Data Table [PPTT]
>     *
>     * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValu=
e
>     */
>
>    [000h 0000   4]                    Signature : "PPTT"    [Processor Pr=
operties Topology Table]
>   -[004h 0004   4]                 Table Length : 0000004C
>   -[008h 0008   1]                     Revision : 02
>   -[009h 0009   1]                     Checksum : A8
>   +[004h 0004   4]                 Table Length : 00000060
>   +[008h 0008   1]                     Revision : 03
>   +[009h 0009   1]                     Checksum : 26
>    [00Ah 0010   6]                       Oem ID : "BOCHS "
>    [010h 0016   8]                 Oem Table ID : "BXPC    "
>    [018h 0024   4]                 Oem Revision : 00000001
>    [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>    [020h 0032   4]        Asl Compiler Revision : 00000001
>
>    [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy=
 Node]
>    [025h 0037   1]                       Length : 14
>    [026h 0038   2]                     Reserved : 0000
>   -[028h 0040   4]        Flags (decoded below) : 00000001
>   +[028h 0040   4]        Flags (decoded below) : 00000011
>                                Physical package : 1
>                         ACPI Processor ID valid : 0
>                           Processor is a thread : 0
>                                  Node is a leaf : 0
>   -                    Identical Implementation : 0
>   +                    Identical Implementation : 1
>    [02Ch 0044   4]                       Parent : 00000000
>    [030h 0048   4]            ACPI Processor ID : 00000000
>    [034h 0052   4]      Private Resource Number : 00000000
>
>    [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy=
 Node]
>    [039h 0057   1]                       Length : 14
>    [03Ah 0058   2]                     Reserved : 0000
>   -[03Ch 0060   4]        Flags (decoded below) : 0000000A
>   +[03Ch 0060   4]        Flags (decoded below) : 00000011
>   +                            Physical package : 1
>   +                     ACPI Processor ID valid : 0
>   +                       Processor is a thread : 0
>   +                              Node is a leaf : 0
>   +                    Identical Implementation : 1
>   +[040h 0064   4]                       Parent : 00000024
>   +[044h 0068   4]            ACPI Processor ID : 00000000
>   +[048h 0072   4]      Private Resource Number : 00000000
>   +
>   +[04Ch 0076   1]                Subtable Type : 00 [Processor Hierarchy=
 Node]
>   +[04Dh 0077   1]                       Length : 14
>   +[04Eh 0078   2]                     Reserved : 0000
>   +[050h 0080   4]        Flags (decoded below) : 0000000A
>                                Physical package : 0
>                         ACPI Processor ID valid : 1
>                           Processor is a thread : 0
>                                  Node is a leaf : 1
>                        Identical Implementation : 0
>   -[040h 0064   4]                       Parent : 00000024
>   -[044h 0068   4]            ACPI Processor ID : 00000000
>   -[048h 0072   4]      Private Resource Number : 00000000
>   +[054h 0084   4]                       Parent : 00000038
>   +[058h 0088   4]            ACPI Processor ID : 00000000
>   +[05Ch 0092   4]      Private Resource Number : 00000000
>
>   -Raw Table Data: Length 76 (0x4C)
>   +Raw Table Data: Length 96 (0x60)
>
>   -    0000: 50 50 54 54 4C 00 00 00 02 A8 42 4F 43 48 53 20  // PPTTL...=
..BOCHS
>   +    0000: 50 50 54 54 60 00 00 00 03 26 42 4F 43 48 53 20  // PPTT`...=
.&BOCHS
>        0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    =
....BXPC
>   -    0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ........=
........
>   -    0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ........=
........
>   -    0040: 24 00 00 00 00 00 00 00 00 00 00 00              // $.......=
....
>   +    0020: 01 00 00 00 00 14 00 00 11 00 00 00 00 00 00 00  // ........=
........
>   +    0030: 00 00 00 00 00 00 00 00 00 14 00 00 11 00 00 00  // ........=
........
>   +    0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // $.......=
........
>   +    0050: 0A 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  // ....8...=
........
>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  tests/data/acpi/aarch64/virt/PPTT              | Bin 76 -> 96 bytes
>  tests/data/acpi/aarch64/virt/PPTT.acpihmatvirt | Bin 156 -> 176 bytes
>  tests/data/acpi/aarch64/virt/PPTT.topology     | Bin 336 -> 356 bytes
>  3 files changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/tests/data/acpi/aarch64/virt/PPTT b/tests/data/acpi/aarch64/=
virt/PPTT
> index 7a1258ecf123555b24462c98ccbb76b4ac1d0c2b..cafd4ee23cb4579234b36bc1b=
06d1380ac8fafea 100644
> GIT binary patch
> literal 96
> zcmWFt2nk7GU|?WYbMklg2v%^42yj*a0!E-1hz+6{L>L$ZK{PUeim9N9aRK=3DjNMZmJ
> Cw+8_L
>
> delta 38
> kcmYfB;R*-{3GrcIU|?D?kxP!15y)bg=3DqSvi0%AY`0D`Lo$p8QV
>
> diff --git a/tests/data/acpi/aarch64/virt/PPTT.acpihmatvirt b/tests/data/=
acpi/aarch64/virt/PPTT.acpihmatvirt
> index 4eef303a5b6168c6bc3795c2e2c53f65b4c4cfd4..8d560405bc7c557867efa32fe=
f5b579f5709d729 100644
> GIT binary patch
> literal 176
> zcmWFt2npH1z`(%F<K*w`5v<@85#X!<1dKp25F11@h%hh+f@ov_6;nYI;{x(6aEO7;
> b0?8riMHU0;EdgRCkQxvGs)LC!Lqr$=3Dth)&T
>
> literal 156
> zcmWFt2nm_Pz`(%t&&l7}BUr&HBEVSz2pEB4AU23*5Mf{d(;zks0L8d~Y!w(EL?em8
> b)g$Re76a)`0AeN}1_P+x1R#eQBEkRwWK9VH
>
> diff --git a/tests/data/acpi/aarch64/virt/PPTT.topology b/tests/data/acpi=
/aarch64/virt/PPTT.topology
> index 3fbcae5ff08aaf16fedf4da45e941661d79c1174..d0e5e11e90f33cbbbc231f9ad=
0bd48419e0fea65 100644
> GIT binary patch
> literal 356
> zcmWFt2nk7HWME*P=3DH&0}5v<@85#X!<1VAAM5F11@h%hh+f@ov_6;nYI69Dopu!#Af
> ziSYsX2{^>Sc7o)9c7V(S=3D|vU;>74__Oh60<Ky@%NW+X9~TafjF#BRXUfM}@RH$Wx}
> cOdLs!6-f-H7uh_Jy&6CPHY9a0F?OgJ00?*x0RR91
>
> literal 336
> zcmWFt2nh*bWME*baq@Te2v%^42yj*a0-z8Bhz+6{L>L&rG>8oYKrs+dflv?<DrSKu
> z#s}p4;1GkGi=3D-D>45YUMh?!vef$Csl%t&G&Cde(wdO>1GKm-gx_1*yTS+Iz)B8h>R
> aAic=3Duf$S9l3b27BK>%tVNQ@mK!T<mOd=3D3Es
>
> --
> 2.34.1
>

