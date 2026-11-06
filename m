Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BCC606A331
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oFjJQGtx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPLkI-0002tx-DN; Fri, 06 Nov 2026 10:20:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPLkH-0002tW-B9
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 10:20:49 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPLkF-00069T-L3
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 10:20:49 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-8b0db268bd8so5111717b3.1
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 07:20:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793978446; cv=none;
 d=google.com; s=arc-20260327;
 b=pJUyz9YH/0dKAiPsWvBkBQhT6k89kShLhCuSx/FDzgTuvnMcoCoqZEm7i9xPA1t1lA
 XB6oukwI1ce39eWhl52AIG8uke5yTALShiAaWWpHaJUn5pzz1Drx2+v8x4sDXEW5mslS
 i1eagqazXXh53OqrtW4mRNX8UdmZeWzARu/MAmjAh823/DvqMsbDf+42Txx83bWw9Gvd
 +1gsEtaxg8h7oXkPh/zSWUFSoAe+MH39r1s7LwfOGA9gPBTvur5X+hqkxD2pFeWmoyfo
 g4ZUATCpyyc1CDXPliqAMFyNTuaWg57cGhDjFL807yhGT2az+khXJcsRLM1aZoQ0+5UV
 S4Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=e2yrcesM43+alyjjO9G2ZtVdWb8XwcX6MmiCYk1DqX8=;
 fh=BiATJ/pJYE7YVRxaEgvTuAZaRcEnyz1KV7e6kfS+Mnc=;
 b=lWkIZ0Pz55BIZJWgB4OP7ESlPAjGDLtfclSpmffzWdpD1fH+TvYivr7WppXOCxzC0M
 c77qVMFqu/nK1sKkM1nsD1FP5G3mmUqvzioICQUFYyjTRFgsTXVulXzVxONr4ucAMHFZ
 QG6UOJH7SQK2j6RmJTWG9Ucp4wnQzNJ1nnUUGHAkjrcMJaVkNpiyJFG8A3bgA9/aDoE7
 /vBnc5L4hyO7z/Eyl4P9IizFblUG2W0vIf1JabuLESsaobA/fuAmsHBSDIGX269z9iSB
 gVswq35MNM+t5emWjkBJvnp+BNeYK1z88DxXvLBcdiZlkoQ08Ohzj+AYRCXB7yWgknFv
 U0Hg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793978446; x=1794583246; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=e2yrcesM43+alyjjO9G2ZtVdWb8XwcX6MmiCYk1DqX8=;
 b=oFjJQGtx11Z4kg8CM6e/JQVnaZfoPzu0Pay9di/NTWuVUAB2KRpQzRnZ9F7kC4StaZ
 R9L7SFOzYIYYI2Jq7OzdtQjK6Uha/TvEanboYaMUespjI7Lu9cbJ5BELX7OXRdEMOju+
 riinOFH4euVnCYKQMqHiGugOhBMnymE9a3l7Rg9Sew2cn5ZlyYS0OelKPjRWduitrKzZ
 hKTr76P7wK+NPVUo84tUCUcpnaXuZlLkAEu6SKfLYnkM+B4r3/nkNk6umE5EYw9AsDuB
 lMnIxPZ02xJ5K8dMH/4+Lt6Z7djE7LaEBhSX3JJcyZQu/yV5PPe/kqe2yQF+jAlSrzEB
 1UZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793978446; x=1794583246;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=e2yrcesM43+alyjjO9G2ZtVdWb8XwcX6MmiCYk1DqX8=;
 b=NJBThQ/mL1J0ag4xGVN8KaOigpZ8ZZwR8RCj5adWD7CA7o/0uVGrkrRHgXhqP0ckU7
 vC75zPjILRBZHlBV6agDbbqi4wi/zddelCRD+ERLNbvu3WvbH8acMhQ8nmu1nSAPNcSH
 +PTS/8sn5SsSYRCDUWIWzN15iE4X3rkJZVS81QtgZeaHcrZoLjFL1hx/+SZH8lDvt0na
 FSpoPEoSsHkaGVzBWI/XvoHOc/U+swG2YKTjDQ/H+MW4jN/rkbh6FxIoQuIl5z7RVEhd
 pWjACt9iD6IyL1GI8mf1EgiK3clN3p0uHRMmMwt6AVUj5bW0MIiERbdwQPH6W3ndUyT0
 7FKA==
X-Forwarded-Encrypted: i=1;
 AL+hErGCaDlf9HzSK5smiXSeVs42s5mIFHhsqelFsPM2T4d1qzBtE8VMmPt3Q3m2aGFEkoGQ6WbAHwK3pg==@nongnu.org
X-Gm-Message-State: APuU4Z8B/gibAKfWYgEgt9y3hkudL6fF1GKwaA6ck/XdZ2IoqDKRmozD
 6epTrH3lZ0DUc4x9CuMEhPz3u+otAb7KVnqIyVgbBQivvZjcOnMYPh6KYUAdA3gWy+BAbXb4sUz
 H+JV2SKAJnPKq5WL9rpnHsS/Jsb66Lk4O8zxwocH5Cg==
X-Gm-Gg: AYBFou2p2oPKkPAiNcLfdO9UnQubkbzpOPCO7KsjVt7zHKXlrwSp6HmNU7o/vYJsWjQ
 3CaBtV4OUVyq8m+uLQd7Kxm1tZ42MAFdz6pLoA1Nldet1qs6i2D9XUR+RIvlBHBr/3zwoskXTMa
 ZlQwJVbVWESE76CAvqjo/nyPUoiW8CBvWscCTpBDFrvfsEzgFrL6OgJkUFEYWulyRzRiXZ95gcU
 p2gu581jutUCM/ITwE+l1XukTkI8/+7c6cr5kHVTxRI13a29ALT1zm6a9L76mWBoIo1EmfaWrC6
 3vX1DzaYoOPufB/Q5H5uaBGwfsbBCB6Hc5Elda1XExq1zocgiNgUok79C1m4+51+g03DyXlmtdU
 kHYGXnsjPcGIJIw2QezWUBwwqpXfigiZc9n2BlNZUDhl+yWGmbFFc9mO4a9s20v7qiava91Avh4
 uPXKrjGxL0ULyYcHNI+Kkg
X-Received: by 2002:a05:690c:3482:b0:8b0:aae7:5c75 with SMTP id
 00721157ae682-8b341771fa2mr12933967b3.4.1793978446016; Fri, 06 Nov 2026
 07:20:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793613972.genet-ring-fixes-v1.git.lorandmarton.dev@gmail.com>
In-Reply-To: <cover.1793613972.genet-ring-fixes-v1.git.lorandmarton.dev@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2026 15:20:34 +0000
X-Gm-Features: AclHuK_WgvXj62U3kNxYsvQbWuiCMBp6qf_mWqKGqcA3udhnTu0ED4rdo3DmQDI
Message-ID: <CAFEAcA8DW5=W5cCVFfTkSH-=RE+SEpvhb986KDOsEMK3keNHrQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/net/bcm2838_genet: TX index wrap and full RX ring
To: Lorand Marton <lorandmarton.dev@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org, 
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com, 
 jasowangio@gmail.com, marcelomanzo@gmail.com, serg.oker@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 at 10:42, Lorand Marton <lorandmarton.dev@gmail.com> wrote:
>
> Based-on: <20261027143036.44973-1-marcelomanzo@gmail.com>
>
> Two fixes for the BCM2838 GENET model of "[PATCH v6 00/17]
> hw/arm/raspi4b: working PCIe and GENET (real networking)", which is in
> target-arm.next. They apply to target-arm.next; if that is simpler,
> they can also be folded into patch 12/17 (implement GENET TX path) and
> patch 13/17 (implement GENET RX path) of that series.
>
> - The TX consumer index counted past 16 bits, so the first transmit
>   across the wrap never ended: the device sent the ring's descriptors
>   forever with the BQL held, and the guest and the monitor hung. A
>   guest sending a sustained stream hung after about 65k descriptors.
> - The RX path wrote frames past the consumer index of a full ring and
>   overwrote frames the guest had not read. The fix keeps them queued
>   in the net layer until the guest frees descriptors, as e1000 does;
>   real GENET drops them and counts them in DISCARD_CNT.
>
> Patch 1 adds tests/qtest/bcm2838-genet-test.c. Each test fails with
> only its fix reverted (the TX test hangs).
>
> I found these bugs while running Raspberry Pi OS images on a model of
> the Compute Module 4: https://github.com/LorandMarton/boardtwin. Its
> QEMU changes are on the boardtwin-develop branch of
> https://github.com/LorandMarton/qemu. I intend to send the board model
> (raspicm4) after the 11.2 release.
>
> Checked: each patch builds and passes the test; the aarch64 qtests
> pass (33, 3 skipped: the slow cdrom test and the two swtpm tests).
>
> Lorand Marton (2):
>   hw/net/bcm2838_genet: wrap the TX consumer index at 16 bits
>   hw/net/bcm2838_genet: hold RX frames while the ring is full



Applied to target-arm.next, thanks.

-- PMM

