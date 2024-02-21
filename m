Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1984364ejb;
        Wed, 21 Feb 2024 07:19:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUoexyR/eQws/tmNR4MOYAcg4g1n362LZJhuHXfU4DLnvPKHmxViCAIiqn2ILg2NKAty/RuPg4BV5TIK3P8x5ZMUiWu3GvA
X-Google-Smtp-Source: AGHT+IF7+ibXjFnXZS5Ma0bFPsyCsx1XA0IWgkyHohwX0hXkAc9sdcT285Xc72ggcw8w5SrqdmgQ
X-Received: by 2002:a05:690c:ed6:b0:608:2b27:9e6d with SMTP id cs22-20020a05690c0ed600b006082b279e6dmr9255936ywb.28.1708528787489;
        Wed, 21 Feb 2024 07:19:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708528787; cv=none;
        d=google.com; s=arc-20160816;
        b=IRwmyznGWS/EeqqeDND/lmsErdXBknZ2LzqznOB0JH3CCwBMx1ovW3S/RuzCD7T1zs
         4KZ0ibp/tetZybMgnj4RuS044qK/XWYbSY0sAnznF7z+5Jm8X92LPNyFuywNvcta9Y3R
         TfA4w6G2Jw0yNUso9MtGjzoqbT8Xaq+aL0JHVP/EVZWXkBGuGAN7vzyG3pU4eYYAUZRI
         7CitT2mrujYsEtZwuZxSkELvb3zReYSZJVRGBnyhasPKP6rvsu9eTxeQ1riVgmeuCTb6
         U8EAiG1VS2lZBYH351140lctStIQUcV/+shEIExUIxLwTyuw1S34pidGonhQtnhj8NGU
         tN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:lines:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :resent-message-id:resent-date:resent-from:resent-to:dkim-signature;
        bh=yom5qVcNfraWQaHI7ahibAxGsXgPAW0YgsRkhiRCSlc=;
        fh=1RNoIdQyD5R61BslZul+TrPHEL1og0EE4iqFdst43XY=;
        b=wPcnYm2+TqeRMfuh/jJeHgzUG8AWvQJ1Fchrfo5Xb/lrNov2tbmIg83zLHjttngop6
         2djyPmCR1MEwbAH5APTOMQhIxnEGqSnb6XDtMxzDuiJPvDr4Q5mnqTWEcxr5A7FCk5W3
         oFOoLzS9PcOXtwc9uqIbJvwlMn8+Hs+KE8MPDbGUOZdZY6p5IuQS+6ISQzNYdhHkCpyu
         a3un2r1xAZwqypsTMKVetuAv7wRiAVRIIe91mqxH6AT2TE/KYGXlaQsuExJ2LNHCT6zF
         PEzbCdFrR7r3WJ8m67Ec3b6b0p4wAxkfZTcZSktA5SsKuVRksqPpkm6/BfVuIoF87yEs
         lWDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="SC8GlQ/T";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020ac85043000000b0042c77c183b0si10214896qtm.590.2024.02.21.07.19.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:19:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="SC8GlQ/T";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcoJi-000120-1a; Wed, 21 Feb 2024 10:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rcoJO-0000nB-6o
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 10:15:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rcmtx-0002bw-U4
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 08:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708523084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 resent-to:resent-from:resent-message-id:in-reply-to:in-reply-to:
 references:references; bh=yom5qVcNfraWQaHI7ahibAxGsXgPAW0YgsRkhiRCSlc=;
 b=SC8GlQ/Tlbv8UjICoNPwn9LqmWI04hhdyprcd04r1hVjSxYqMprJmdrPPE90kP6YrxOSEV
 g42rf2O6x0CBMzPHCI1HLgjk0J+B+RWdqCHDy4tJRSDzHWNI/712SXyyiE0kifv6uHCPNT
 o/5QjDFlbzLDBWJil7Nt4DVVv7cEj9c=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-20-CukR6-3kPBaPeB6KchUj_g-1; Wed,
 21 Feb 2024 08:44:39 -0500
X-MC-Unique: CukR6-3kPBaPeB6KchUj_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC6CE3C2B607;
 Wed, 21 Feb 2024 13:44:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4AB82166B32;
 Wed, 21 Feb 2024 13:44:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 906F021E66D5; Wed, 21 Feb 2024 14:44:35 +0100 (CET)
Resent-To: alistair@alistair23.me, edgar.iglesias@gmail.com,
 marcel.apfelbaum@gmail.com, jonathan.cameron@huawei.com,
 zhao1.liu@intel.com, peter.maydell@linaro.org, philmd@linaro.org,
 zhao1.liu@linux.intel.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, fan.ni@samsung.com, laurent@vivier.eu
Resent-From: Markus Armbruster <armbru@redhat.com>
Resent-Date: Wed, 21 Feb 2024 14:44:35 +0100
Resent-Message-ID: <87v86i2apo.fsf@pond.sub.org>
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,  Fan Ni
 <fan.ni@samsung.com>,  Laurent Vivier <laurent@vivier.eu>,  Alistair
 Francis <alistair@alistair23.me>,  "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>,  Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Alex Williamson
 <alex.williamson@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,  qemu-trivial@nongnu.org,  Zhao Liu
 <zhao1.liu@intel.com>
Subject: Re: [PATCH 3/6] hw/mem/cxl_type3: Fix missing ERRP_GUARD() in
 ct3_realize()
In-Reply-To: <20240221094317.994454-4-zhao1.liu@linux.intel.com> (Zhao Liu's
 message of "Wed, 21 Feb 2024 17:43:14 +0800")
References: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
 <20240221094317.994454-4-zhao1.liu@linux.intel.com>
Date: Wed, 21 Feb 2024 12:35:47 +0100
Message-ID: <87zfvuuk18.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IMru0TsVqA1o

Zhao Liu <zhao1.liu@linux.intel.com> writes:

> From: Zhao Liu <zhao1.liu@intel.com>
>
> As the comment in qapi/error, dereferencing @errp requires
> ERRP_GUARD():
>
> * = Why, when and how to use ERRP_GUARD() =
> *
> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> * - It must not be dereferenced, because it may be null.
> * - It should not be passed to error_prepend() or
> *   error_append_hint(), because that doesn't work with &error_fatal.
> * ERRP_GUARD() lifts these restrictions.
> *
> * To use ERRP_GUARD(), add it right at the beginning of the function.
> * @errp can then be used without worrying about the argument being
> * NULL or &error_fatal.
> *
> * Using it when it's not needed is safe, but please avoid cluttering
> * the source with useless code.
>
> Currently, since ct3_realize() - as a PCIDeviceClass.realize() method -
> doesn't get the NULL errp parameter, it doesn't trigger the dereference
> issue.
>
> To follow the requirement of errp, add missing ERRP_GUARD() in
> ct3_realize().
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Suggested by credit:
>  Markus: Referred his explanation about ERRP_GUARD().
> ---
>  hw/mem/cxl_type3.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index e8801805b90f..a3b0761f843b 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -645,6 +645,7 @@ static DOEProtocol doe_cdat_prot[] = {
>  
>  static void ct3_realize(PCIDevice *pci_dev, Error **errp)
>  {
> +    ERRP_GUARD();
>      CXLType3Dev *ct3d = CXL_TYPE3(pci_dev);
>      CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
>      ComponentRegisters *regs = &cxl_cstate->crb;

The dereference is

       cxl_doe_cdat_init(cxl_cstate, errp);
       if (*errp) {
           goto err_free_special_ops;
       }

We check *errp, because cxl_doe_cdat_init() returns void.  Could be
improved to return bool, along with its callees ct3_load_cdat() and
ct3_build_cdat(), but that's a slightly more ambitious cleanup, so

Reviewed-by: Markus Armbruster <armbru@redhat.com>

