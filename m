Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5878361lfk;
        Mon, 15 Nov 2021 05:41:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWBPVRfCGa7jv1Odzf4tk1dldRlLtCvHiflWBGblX+cxNb4oBL10ImPz8Ogx+RiIHFzPUI
X-Received: by 2002:a67:db0b:: with SMTP id z11mr43027832vsj.59.1636983675538;
        Mon, 15 Nov 2021 05:41:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636983675; cv=none;
        d=google.com; s=arc-20160816;
        b=PP3hyWvMQIJ+mziHpAUw6NS6zVUnJIhzGQD1IN1s+a+bvWNXG4x614O0BcYtxo5coy
         G8RshudncSAPQ20pO6Jhl5ATa9sVmVpa05rL5m/d30klq1vZQp5oEwcy9oMU0UOGtN0c
         C2Sh+l1eO7aI1uirC2Ljgv7MKf8/qs9Vv/WuAUP2vHosTzawMqtfBsAmGxQsBw0CEnCR
         w1Tz5U/Wwus/eTah4uYxKSVxFtJ5Zwnh9VErHhLg5FrRBqDi9YwHVkjVrw8sN9kFdX6F
         QBaAM8igd4VYPoj43Y5m43bzYbT611GBiB7FuKnZR7Y5UwS33bDUyNT3GkI8TQTet9yr
         L/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QvRVK5lj+6pdoso32NupYmtgW6boEgcwejPFuAqqqMc=;
        b=VG3zf47qmiMtLO5Y6tw6eAcvN0KegrBtdPtYnHwOoU1N6GL0sinW93Kmm5E4cNRubI
         vW/P90sqODWziYJZupF3YBxhTS2NRdoj7iZfblgN/U1/rnGcd8YxXn9GAr7JwOZAHyHE
         so2tNcDx6ST34Xh/w8sew/SxQLWx9We1QFXb7gF1jpMbspkjDiFer5ad2M28CTt0NdVX
         2HdF0szf/apbJK9ih2HsEJp8TBTvIYfRgNUljjcHVibC7XoIAJZHAC9nFZVGkvi9Gq2d
         5saDq+14BGwsmJAIml3VVsfkHNQqLAWYZQpWYDEg+FSl5KfS8OjNMltcHrNghA/B62yx
         6mLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lT7owlu9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si27790675vsj.136.2021.11.15.05.41.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Nov 2021 05:41:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lT7owlu9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mmcEU-0004tB-Tn
	for alex.bennee@linaro.org; Mon, 15 Nov 2021 08:41:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmcE7-0004ZM-DJ
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 08:40:51 -0500
Received: from [2a00:1450:4864:20::435] (port=39721
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmcE4-0004aP-Ln
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 08:40:51 -0500
Received: by mail-wr1-x435.google.com with SMTP id d27so30814580wrb.6
 for <qemu-arm@nongnu.org>; Mon, 15 Nov 2021 05:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QvRVK5lj+6pdoso32NupYmtgW6boEgcwejPFuAqqqMc=;
 b=lT7owlu9kJkl1DLiwDtaWf0BfcwxScHS1nkQk3oSy0mThst9XyTf9WnvWCVk0eQ8xi
 +7Wuug0OFye3gA7Gyv776v7uJV6hP3ZHE/ZBVKl5ZLtZm4D7H6lu8GeYJuK8xJmlIR1k
 3v6j0LFRLzCzvECJdozDQTMy7Byh2unTGJYz7AuziTpMOG0fyRLzQemoPCZAhgUAw2XX
 hOyoTO40pqzlPylb6kjNJvkg7rvBBxOy9nV8wyL7iSNPVO3t4OX6oEpSc+pHaJRCfdSb
 54ZtA3cXJ8MYWv78R1muAXVUoQuvmtBGKx3IaBVqEfxEYNsjIX3t4eyzdJsX2ZAjykoo
 fkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QvRVK5lj+6pdoso32NupYmtgW6boEgcwejPFuAqqqMc=;
 b=IFSvSZHe7nCli+GwSb6dOlQDVqZw1WRme3Q22Xhd+dZxVwB9mVi6f6KhVjDP5knB3O
 85mRfKaU0fOLczzXyNWRGSnOsmuai3vUudjmeuzlz10fETh6t3hhQ+fUwDm5NeA7E8uk
 pjAizqnUmevVASF/IfEKthzp7xmUe7/LylwT7ibMKc8qph85GGoK3DyvPRaX1I5evV/+
 ZXgDswcxbh+HoycPS7aKTj4tMrqr4EqQv+AzoTecmxJDOv12MlvnKXjH3pwc2SxHZBr7
 zcVWLxkavw/mtsPtSTklxKEfgtPiEpNQED0kaI/JMPbNUvukBvorem6JQVsR8ln8vKhp
 pFgg==
X-Gm-Message-State: AOAM530RDMpYe9+UOk/+TzxOT1vb5QX7MHa5LnQqCKsarrfl2Cf7MGMm
 Hg3VAbdG6Pu6skTcG/NQQG7beAWiuyZbahYocANIqw==
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr47959699wrf.302.1636983647148; 
 Mon, 15 Nov 2021 05:40:47 -0800 (PST)
MIME-Version: 1.0
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-2-armbru@redhat.com>
In-Reply-To: <20211115125536.3341681-2-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 13:40:36 +0000
Message-ID: <CAFEAcA94NzZq6fnvvF6aRJtHV29Wnrtudz4QKSoADo6=-QF5JA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] hw/sd/ssi-sd: Do not create SD card within
 controller's realize
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, sundeep.lkml@gmail.com, qemu-block@nongnu.org,
 andrew.smirnov@gmail.com, hskinnemoen@google.com, joel@jms.id.au,
 atar4qemu@gmail.com, alistair@alistair23.me, b.galvani@gmail.com,
 nieklinnenbank@gmail.com, qemu-arm@nongnu.org, clg@kaod.org, kwolf@redhat.com,
 qemu-riscv@nongnu.org, andrew@aj.id.au, f4bug@amsat.org,
 Andrew.Baumann@microsoft.com, jcd@tribudubois.net, kfting@nuvoton.com,
 hreitz@redhat.com, palmer@dabbelt.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IWk5+wl8iof7

On Mon, 15 Nov 2021 at 12:56, Markus Armbruster <armbru@redhat.com> wrote:
>
> ssi_sd_realize() creates an "sd-card" device.  This is inappropriate,
> and marked FIXME.
>
> Move it to the boards that create these devices.  Prior art: commit
> eb4f566bbb for device "generic-sdhci", and commit 26c607b86b for
> device "pl181".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

> @@ -670,7 +672,7 @@ static void sifive_u_machine_init(MachineState *machine)
>
>      /* Connect an SPI flash to SPI0 */
>      flash_dev = qdev_new("is25wp256");
> -    dinfo = drive_get_next(IF_MTD);
> +    dinfo = drive_get(IF_MTD, 0, 0);
>      if (dinfo) {
>          qdev_prop_set_drive_err(flash_dev, "drive",
>                                  blk_by_legacy_dinfo(dinfo),


This part looks like it should have been in the other patch.

-- PMM
