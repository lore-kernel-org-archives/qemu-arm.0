Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp487568lfl;
        Tue, 15 Feb 2022 10:02:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzWsx3SpehzJ+1/b8KDV+6lC37QrFn5EVDRkaGKdWoPoWgqWINcv9CAg9t+YKev2Rsu7QM
X-Received: by 2002:a05:622a:1a84:: with SMTP id s4mr180715qtc.593.1644948121184;
        Tue, 15 Feb 2022 10:02:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644948121; cv=none;
        d=google.com; s=arc-20160816;
        b=vPXBbtf2FLbmVc/fdIoD95MFUp9uBoWULH6pFWpac5GE4GE4i8O2RpIVBTJ8yfKFix
         EGrkSGIQuPv9s59qt/unxsh++WZXqomoYMPJcBDRafLG5D6jlvifs1UkJWVJm2kqnuBv
         9VVcN9acQXu123ljRGxEh3ABCZJsuqVnWplGhMAj2/SKASiY71cKntMnlAK1RksI/wzc
         I9/jA8x4guK0aShZC2UI1rRiOpOIlVA3WvnTI8BNNE7ah09dYeG8Ak0LALY6tXs6Qhoi
         xkArPMsy4wkCHALPgprnEYjUHm0B12n4DINEyIGRzExMpY8o5BqmDxCWIsDnPhTf41T1
         AV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=QdTYeDZ6DuyxcJzqQqQeAlebg7soHWD2SDdKzIc3ngc=;
        b=KULkf5sj3Ty7D9JZH4CHoSj7QU0wwRgmndTgbxv1FKKlZHO3NHtNf6AgrmDMcwJki7
         7dYbsjxe/X469NoN8hJ7WcRlRQi0c4MU2liJWFnGAyT+RxdULtzzStwIsz4pZRIyTZGL
         I6RnEGXFKz7TkEjeWvdXwW0lFLY9k04mPiGBSYE3t4PglVdANRPkpuXkEX6L+bjxNRmg
         NYKLWb5/m3K/7mVdv3VBV6Iymzw7a+i0r2CPZNK/PNhHtHBGagchNygFnfYZW5VaULsC
         S+i+kddfqv3LmZWVG6j1OqlQpflDcOe4Adh9sKCVj6joSrNDYMn6HdEeojfnzvP1yWlh
         USdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EmQJ4LLs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3si4748723qkm.380.2022.02.15.10.02.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Feb 2022 10:02:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EmQJ4LLs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nK29I-0007uv-9Q
	for alex.bennee@linaro.org; Tue, 15 Feb 2022 13:02:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK27G-0007ND-5L
 for qemu-arm@nongnu.org; Tue, 15 Feb 2022 12:59:54 -0500
Received: from [2a00:1450:4864:20::42e] (port=44567
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK27B-0000Jk-Ln
 for qemu-arm@nongnu.org; Tue, 15 Feb 2022 12:59:50 -0500
Received: by mail-wr1-x42e.google.com with SMTP id u1so19720135wrg.11
 for <qemu-arm@nongnu.org>; Tue, 15 Feb 2022 09:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QdTYeDZ6DuyxcJzqQqQeAlebg7soHWD2SDdKzIc3ngc=;
 b=EmQJ4LLsVe+xo8TqlRzqYn/4foZm9EGERCwhen0aay6C13kQ2IicCZHyxMjfzxnYho
 Mwusi3z6wYmefO9y254H1ZRqY+VqZfiJ2VpdYCYne1l4xNihmgE73d+IeE0GMiDtwrOn
 CQuyhM4V/bEa9G8QI/LQ2hGTQJVVTksFuHVXpSZkNiDQhgqXJ913FNEZUfqh9ZWfOpuu
 evcUni9NzaV1lqcZuFkK97ltWYycbUK74yfsSmj5lSLU0zAnlTFYJmcxVUowxvXJrABV
 mJgdcQyvxwPzxlPns7p0hda0csQNnSDJVZ8/vnrRfjctCY8yrpDKLUVvxYmXwPhyEjjx
 sAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QdTYeDZ6DuyxcJzqQqQeAlebg7soHWD2SDdKzIc3ngc=;
 b=bidPl1YpaCzaDBWdhy8xHb+0o9Pk74OKlsiJ0iKw38o2/32o0+hhWo2t92jQ9PTl/r
 5bBG3E8ybwWGd9L1IKozxCF5uDyP8GOTVNsGI/tbT+k5SDsaUmouFeVJmTIyjSAXwDAK
 tTfBRue7PnNeN3gXxujggRe3GRON/Xwddjx40JJ1h3B5ZaYH3G1ZssdSqCS+endu6Jmx
 gsMilCfwEnEJw0MIntTBByBVfsMKktLYMyCdH0BjLnlCbd/+5ZaAebVUEX3oWGFm+5J8
 UD9DyCPNBWsWdXJ1PdWbFoqNqjA3TBz0km9WAL6yDWDQDQPFIGjDdxWHIKMk+PzsgiGY
 1t0w==
X-Gm-Message-State: AOAM533kEh6YYYfIXpN9qwvkKox/lHSZiwvp2D0Lub9qZagkGbEnZr+a
 L+9TZFrXPFNjNdRqOctKuZP+Ki0R9nENYF1GmCorng==
X-Received: by 2002:a5d:498d:: with SMTP id r13mr146141wrq.172.1644947988424; 
 Tue, 15 Feb 2022 09:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20220127150548.20595-1-quintela@redhat.com>
 <20220127150548.20595-19-quintela@redhat.com>
 <CAFEAcA8+ri-ndQv0b10yfUjSJZwH5Ec08S10_-2k5C8_OMYYDg@mail.gmail.com>
 <7e091698-d5db-689c-4c19-b5a7eede51f3@kaod.org>
In-Reply-To: <7e091698-d5db-689c-4c19-b5a7eede51f3@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 17:59:37 +0000
Message-ID: <CAFEAcA8ENTOMS2xzEeMr6hq-j_WE9musmq5mhQmSBAfHUt-M0Q@mail.gmail.com>
Subject: Re: [PULL 18/38] Remove unnecessary minimum_version_id_old fields
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <Laurent@vivier.eu>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m5kQncNHIjKS

On Tue, 15 Feb 2022 at 17:34, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 2/15/22 18:13, Peter Maydell wrote:
> > No, as the commit message notes, it deliberately did not change
> > that one vmstate, because at the time of writing the patch
> > that was the one vmstate that really was still using
> > load_state_old. As it happens commit 8f91aca7ff0044b hit
> > master first, removing that use of load_state_old (but
> > forgetting to remove the minimum_version_id_old field along
> > with it),
>
> If I remember well, at the time of this patch, we were both working
> on the same part and I thought that removing all minimum_version_id_old
> in one go was better.

I would tend to disagree, but we got to the right place anyway,
so it doesn't matter. I've just posted the patch that removes
the load_state_old and minimum_version_id_old fields from
the struct definition entirely; it's nice to be able to
finally drop that little bit of legacy support.

-- PMM
