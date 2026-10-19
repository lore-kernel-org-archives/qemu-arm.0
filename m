Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B18CCCF2D6
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 12:28:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xImTt-0000Ca-Hx; Mon, 19 Oct 2026 08:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xImTW-0008GT-PE
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 08:28:23 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xImTV-0000Mr-4g
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 08:28:22 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8ab432273c5so14837247b3.3
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 05:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792412895; cv=none;
 d=google.com; s=arc-20260327;
 b=EmDh9+9/Rl1ZqSSByB2ctfv9F9wy+IlPJnmR1IPNL2IjDCWt3rki/DbqvBqqANW7pN
 yzS7uLVTrUa8ZwXI39jVTpjkk7KkFMPWS535bwKCDTdJQi5NGTGhYzZdBXBouk8Z4ofw
 hYqeHV0t3QHheVqXM5Jh5YT0ugz4L+ab/kdQjjoU+ZVfynHZ+W1VSBBlxdLS1dGBNUxM
 wz+vW9GXM0kcFf5mQhIhEJSsCwpYlh9AwjQzMK1CxwNLKuhr8L3Cf1hfmUq+KYvyK7c5
 GNsBwfKaVU+Ep2+Zzxh90xbdnLZoYVh65VK8AywUrojGBWZaqNmWs+jZhHuTABgRcoxX
 anag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=34RLzC1wwpQpXbpSrIIoSB+wn/VWBsthmUohL+T38AE=;
 fh=GSxmoCD8MT1qd0j7lba3n8gzWqTibO3vnBCWqPBgYvs=;
 b=mtdHSp4c27ZyRjzLrqNn6GED6nR6YZjtDz3yFuZxMGIoYOZjHPn91Dg5Bj3CM8XR/y
 90pSdWRJlZxkOPuV/nXgjLf5j4tJh3glQjyFGsCEMFCXAY/b19TWJh4LsDVPh8z6Y6FS
 BeVQVrax39vu0d7koOmZMSKVpa8wfrPSAz3feIEduhGM+YZ/8zX/w2hhOOPtsOu+W6fK
 lxjDBgqnXpK7fVjaCZHSWel6WYAZodPyx6+jM8UpDqd3xLJOkttgOUBdYuld3ixcUm6B
 9mgVnzKgyUXbNP8lUPhEhfLrNqdsG2+pKj9aJmYdCSC3qRZqATUhHkPcRbRj6G2HS1nL
 92Og==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792412895; x=1793017695; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=34RLzC1wwpQpXbpSrIIoSB+wn/VWBsthmUohL+T38AE=;
 b=RfUAqB1RN/ecjr4kXv4z//pTVie80l7mg+yqf41qsBXDlNnd7xcJOMkE5StjCNUKeu
 eDPTJtEpVUI0mg/0JxyDbMXkdHH8eMsLCZp4BdquItWsvCQ7HbpdJC4DPLLe3KxA7Bhe
 X6ch/IUxJg8PliFyjbT/m4TcqA1VCPOIc636Igp48bKD3njZrQtAs6gYSIpJC75W0g79
 HF18wnvGxMi3lcK5+2iD5ctcQj3FH2yGH8AgVPOnNacNI2KYk2O2KBirya/mv8Mzkc0i
 UIRGir7qjC05X4GFhb/dViap9B50/UHQEBLEPtuIadcb7H98zLiFzFKvTow4RAde/Cqy
 qK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792412895; x=1793017695;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=34RLzC1wwpQpXbpSrIIoSB+wn/VWBsthmUohL+T38AE=;
 b=IIxURghQtjOR7WcSfC9SHlj5HEb6TjOQ8F4Ty7ER2acU037/fQ96pEjmEqIEKLizAk
 Oh0GhctzZt4TT2b6xyUdrHSaKI/3KeXy3+hbU06xchbF62FWggvJo2ZiwbZ0qXYiHRBK
 /Cyw5tDgClbxbV+VNs2KDv3PHImpj/Bl8jUzP86eYHZERmO9I2hRGEfuJFI26ypRtKlr
 ee+ANtO2D5yHqB8qFowprWIMthGs6+BNBN7Ieya6fGyd80IGAjKjA6MSPFMo++jVFMDP
 N3BzWsUOTMPD/ekIwmbiHVh81sTAZUo8ZcKfYfP738rBYfuHm4lerqE6AxhWXu255U9q
 GmaA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzuLOGY1XmZag7Qw8LNpKayia3Le2BL1Fv8l92nyhNt3yK5u+aeSgsfn8mKEs7/5xuS6z9OJT+uug==@nongnu.org
X-Gm-Message-State: AFq9FYI4ZxgNai8tBzYVL9b7W4VEJmqEPwcCC2JL+Q+SEWfdPynmqVl/
 GkCxj1yp/OsVaGTLDxiN4PjZ02jC2aDkGrguo21b74Mm7VrEB+cSm/0YSglekI6huUhLBzoFRqw
 WkEh2BpPUARzlFbyuvy+UGOkn+4YyJkYkBmZaTyG+8Q==
X-Gm-Gg: AYBFou3WQR5fbkldDDxfhNpgNzwRGqb481NHX5vMEZR8joBxtTNqoYyqXPm/IYxsZ6p
 aTIzuu7vGLd06zbtC91hXqTsPTvFQSEqpVkebY7u081651EHULrSRVORtpSKCvrr89ZttQkWV3h
 OGf8Gt5cv6UsUQ/msWKkyrL+fjL00R5nd7G708ElSU5B3JrLD63vNdGsgWwOOxzscN+e0VQ3LwM
 Zngw+1QRt6AjB5AlzkwnXsFh54n2jCxZHFHCn2cIaC2W9an9gOanNSz0J6ekGfX64LiCLYoh87v
 P3IyT9OfaQnWyGKoRkEZnEF1xBdZGK5kJtdUfOuZMLu9sRrjG5eNfYAe3wR/iLB4awOR8ZswQWx
 ZIRcEAPfuaPLHtdfoituHK9zNezRyblRkCIwCJiA=
X-Received: by 2002:a05:690c:c68b:b0:8b0:6d14:23fe with SMTP id
 00721157ae682-8b0f2202eb1mr17282667b3.52.1792412895483; Mon, 19 Oct 2026
 05:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_22E95650AA60C6E59860452C0D61A21F1105@qq.com>
 <CAFEAcA8MyrqWC7=A5Bw0G5G-2J64iTLmfY33dNDLm0jvmRb+Eg@mail.gmail.com>
 <27040691-e4b6-44f3-b588-cbbbee13cde2@huawei.com>
 <CAFEAcA_4xb3CBL9TTAdKMOG_ijWpt9wsveCp0R602VoFaWUH1Q@mail.gmail.com>
 <tencent_82895B2529E419B263EC95C8349389114407@qq.com>
 <CAFEAcA-amrQOM8+qnaxgWLyGNM=vp-vKV=OqqU7Qp17PRiH_KA@mail.gmail.com>
 <501bf5cc-cee1-4593-943d-505003541d41@huawei.com>
In-Reply-To: <501bf5cc-cee1-4593-943d-505003541d41@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2026 13:28:03 +0100
X-Gm-Features: AclHuK8AlgJedZqd6BbTphQbtwDFjtnseZ0HCECBuB6w6tYGBjx3P18DkS2-zjo
Message-ID: <CAFEAcA8ffgrbh_gUK7wcZW5E8p=ZC+CC=3U23ah+nWHxOGpjrg@mail.gmail.com>
Subject: Re: [PATCH 00/37] Add Arm MPAM emulation
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Jinjie Ruan <2118537295@qq.com>, anisinha@redhat.com, armbru@redhat.com, 
 eblake@redhat.com, imammedo@redhat.com, michael.roth@amd.com,
 mst@redhat.com, 
 pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 19 Oct 2026 at 13:19, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
>
>
> =E5=9C=A8 2026/10/19 20:01, Peter Maydell =E5=86=99=E9=81=93:
> > On Mon, 19 Oct 2026 at 12:46, Jinjie Ruan <2118537295@qq.com> wrote:
> >> One honest caveat
> >
> > Please don't send LLM output to qemu-devel.
>
> Sorry. Here is my understanding:
>
> As mpam_csu_value() and mpam_mbwu_value() below done, the monitor code
> scales the base value based on the software-configured PBM
> (Partition-Based Monitoring) or MB MAX values, rather than just
> returning zeroes.

Thanks. So we report "you're using the full amount the system
is configured to let you use". That seems reasonable.

> And most of the code are to expose the many MPAM registers, constructing
> the ACPI tables, and building the hardware topology of the memory
> controllers and caches to correctly expose the MSC (Memory System
> Controller) components.

OK, that makes sense too -- I guess there's just a lot of pieces
of hardware in there.

thanks
-- PMM

