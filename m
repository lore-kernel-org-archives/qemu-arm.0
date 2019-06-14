Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp954147wrg;
        Fri, 14 Jun 2019 06:23:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9ZysKqKmZWR2vncpdceAfoA/F/+NmGNMChmd+JL0zkDuN7Bsm4F1eZUPdBDWPkNmZMb/B
X-Received: by 2002:ac8:3221:: with SMTP id x30mr81822012qta.176.1560518623447;
        Fri, 14 Jun 2019 06:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560518623; cv=none;
        d=google.com; s=arc-20160816;
        b=AHw+cTQTjiwp7XvLs1mfz+ElcgF4vtGJ8yP65pgLYSSqf43kXNeYaT4HxeuDIKOPQu
         +6nhpjvyW9JgfPA01vb441QbhWLWtQHqsj0eDtJIXeD50tr6mYMVTqu9toOG30DyCm/k
         evQVu06zuTeoypqKuQvaxk5wAzvfDFsxyjBGR8Cmn+c29hlUz8psTk/JA4QEu9PSPvMm
         tMdnQO+2ryoXexPKfbPwDGPGn2tenN9Z2Mgff393lBONgkq2HRO2KXXTZP6g/7OCaxsE
         O7YV3NrWreRpbO3tiLtQAzINXzIGMYjtT8ndO17D0Pt72Li0goQAh0xlzUNg0k9mf0ym
         MSVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nJDunLpsvIlcVSIbOOPB2qcWugmuhPqWH2k8AZJxHOc=;
        b=uwRoqheSfv/ZVVvZhb7IB0qLOoj9mtLJ1uuDSAxAovbVD5rjx6aXgDxhluCklns59B
         n6JRlckZEksshufExjOeMqsM3vkTA2kWR9lBJdFRR6sO5hCA76fyIUjVuQ+arFRfoJfz
         5IF5eHkcXlCvS8Y76bYLqy/sZLeT9WDmCbyd2+QTZlODqH2nwvs005ijRNA7oVYtbbYz
         54UdZBGwk4PgPvDpvPtNNx/SikmrdZd5EmkczPzDGa6gcUk5kl1pbC1/CItPzB1xPE27
         ewbRRe81gcBEYZ67CjZazn+JgkkofPGHhc4Dsv1uDLnDZRWtTZNT/b53wRDG0kP4JSuK
         Q8tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ym8h1rvM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si1795621qkd.107.2019.06.14.06.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 06:23:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ym8h1rvM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbmBD-0004nz-1C
	for alex.bennee@linaro.org; Fri, 14 Jun 2019 09:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41270)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbmAm-0004jz-Qh
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 09:23:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbmAl-0002dw-Oz
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 09:23:16 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41974)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbmAl-0002bX-HF
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 09:23:15 -0400
Received: by mail-oi1-x244.google.com with SMTP id g7so1932513oia.8
 for <qemu-arm@nongnu.org>; Fri, 14 Jun 2019 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nJDunLpsvIlcVSIbOOPB2qcWugmuhPqWH2k8AZJxHOc=;
 b=ym8h1rvMNTnGYKTOqQvXJv8HT+z/+OSfPBYXOApJ3PEaZbuorifK5/mEzqzBQULkFL
 R8lcjZgBTsVioUQExfxbaxykRXZjaBu9/7noGID84ID66RfH2Fuq4dyLQDEthZKuQ68p
 VEoumyFJW+dnAYkJ6E/CaF7/0r4UfHHlCeubUVLY4L7mtzpWYK/My3EB09CJzOJvodDi
 IwK4LTsjdqMHzR9+tYcT61cuMMVDUswzE1r+8cG2gn3xqL3v8kw5Ucq1mV1oXur7a5JQ
 O1lbAmftW0wuvAuY7TC+kD0FzyClPBf98YB1H2mkt2QGeoqWc1JsteYDa6wJIx5egmRp
 toQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nJDunLpsvIlcVSIbOOPB2qcWugmuhPqWH2k8AZJxHOc=;
 b=SR7HahwJHjw4b+HhsXrHaGg30JJlW4dy/9KPQtiFjPr8z/4+tg4oG9UYZF/bEjghv/
 jCiMUEkXru4oQM/1Z2qy8HA83HFbbROxbr4AAq7Tnwmmtv17Mac2r0a4kPTNEnRMnObK
 /QWYiJdDEbuWh24FzCcHKqv6svV56Z5/aegMqSv5hEdP4/jw2GhHIDXN3mXUsUor1yFr
 QamKagCcasTWS4Yp2lUQ1MXQmX6+iSFn2xTag5lxNZB6cFB5NKVmlrRlBisGe9mgzmff
 QbBxPVYGSNEl+KhXZZyvj2qsK95zd+S0TitwYGhKwNCVOk7lzC4obyXzVeJD0FqZpiHg
 iV+w==
X-Gm-Message-State: APjAAAUZVhd0ErVzkYM+gxWwwNvWLYthT+ruAab8QluJqrzS0K9C7ENo
 FYdsmi4uILfDTcSESvmZK9XLz2jgdDDBnitR2trO7A==
X-Received: by 2002:aca:845:: with SMTP id 66mr1840159oii.163.1560518593672;
 Fri, 14 Jun 2019 06:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190611142821.3874-1-eric.auger@redhat.com>
 <20190611142821.3874-2-eric.auger@redhat.com>
In-Reply-To: <20190611142821.3874-2-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jun 2019 14:23:02 +0100
Message-ID: <CAFEAcA8N_uaq9kbS2MWDtdy1wz-j33OVo4wQbFZxvc-2uyMd0A@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/arm/smmuv3: Remove spurious error
 messages on IOVA invalidations
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UXm8rmhRU8sh

On Tue, 11 Jun 2019 at 15:29, Eric Auger <eric.auger@redhat.com> wrote:
>
> An IOVA/ASID invalidation is notified to all IOMMU Memory Regions
> through smmuv3_inv_notifiers_iova/smmuv3_notify_iova.
>
> When the notification occurs it is possible that some of the
> PCIe devices associated to the notified regions do not have a
> valid stream table entry. In that case we output a LOG_GUEST_ERROR
> message.
>
> invalid sid=<SID> (L1STD span=0)
> "smmuv3_notify_iova error decoding the configuration for iommu mr=<MR>
>
> This is unfortunate as the user gets the impression that there
> are some translation decoding errors whereas there are not.
>
> This patch adds a new field in SMMUEventInfo that tells whether
> the detction of an invalid STE msut lead to an error report.
> invalid_ste_allowed is set before doing the invalidations and
> kept unset on actual translation.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> I also experimented to pass Error handles to all the subfunctions
> and handle the Error at top level but that's intricate to sort
> out the various kinds of errors, whether they need to be logged,
> and if so if they match LOG_GUEST_ERRoR mask or unimplemented
> mask. So I think just passing this boolean has a lesser impact on
> the code base.
> ---
>  hw/arm/smmuv3-internal.h |  1 +
>  hw/arm/smmuv3.c          | 11 +++++------
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index b160289cd1..d190181ef1 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -381,6 +381,7 @@ typedef struct SMMUEventInfo {
>      uint32_t sid;
>      bool recorded;
>      bool record_trans_faults;
> +    bool inval_ste_allowed;
>      union {
>          struct {
>              uint32_t ssid;
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index fd8ec7860e..e2f07d2864 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -404,7 +404,7 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>
>          span = L1STD_SPAN(&l1std);
>
> -        if (!span) {
> +        if (!span && !event->inval_ste_allowed) {
>              /* l2ptr is not valid */
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "invalid sid=%d (L1STD span=0)\n", sid);

Why is this specific qemu_log_mask() the only one we need
to suppress ?

thanks
-- PMM
