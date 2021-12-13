Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3982724lfk;
        Mon, 13 Dec 2021 02:58:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMb5ZG7A3M3j8AonDPAaLcscEw/6Lb6JYWCWh2eRNpE5BOgd6XdMS1juljuZECTghtwWls
X-Received: by 2002:a05:6214:8c2:: with SMTP id da2mr41411753qvb.23.1639393093693;
        Mon, 13 Dec 2021 02:58:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639393093; cv=none;
        d=google.com; s=arc-20160816;
        b=K5WaxL1m8MSGDumGeUA03YmEsauMENO7DouN0UAQfI7it2sl+D2GodLlcM/bEjnQnx
         HSq0Zv93AdHAmTdUegOEb3rnEIFljDlc7UnjxLQfcIncB3PpfQitQGuY2N4OYVYAkKkj
         gL0OSIiUCa1czdZJckVHxZq3OaqvN8ShoSN+BIxsMmHOT4cqOD8jFs75TAD9nWYiBx6V
         r7n+UZdBAXh1/HiEx128f9ImBY4eghvtIXoBXUay+z8+6v6W0WWe4dmMUjMw/gErfna0
         f0C4z3TrJasx4Y8yxszt7mrbBbvV8hMMiFjSl2jlNObwsecE1rtGev5o1b8dCcDAxSZl
         drfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=5z8i8oPl77F0qfGMJykN+D6j0nC3oyyBp5MOIUHSBU0=;
        b=kFY5JqqcLbJSuaAh0BSmLazunVagooIETIpEx36R2bJRB7XOtIkL9NWeIHKp61rnO6
         AGV/Qb7UnWx5klPxj4qllU+AOKNBbySgGy75ZGaj8ouIAhLPMY6PmZuHUAL5qz4NjYc3
         iTlCycuvLXepld3yY9AV8YxSO00XJBT17aTpboZ/xWdl2y8oqYxNu28U+xbGS//OlFnt
         saKffSwIzKxSe94xqCSSkEf14UPC3NCtzV86uf3gTOAs0ku6B2tydN4nUAfZaMFkmFKX
         i9lbPMsCBaeWy09bxlFRms2/MSWOSfdvxgfTgR2ObscERGbDNBiAiwgAO6CgwEqQM1wB
         W56g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="G1/q/ldH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9si6548148qkk.749.2021.12.13.02.58.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Dec 2021 02:58:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="G1/q/ldH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mwj25-0004KS-3c
	for alex.bennee@linaro.org; Mon, 13 Dec 2021 05:58:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mwj0T-0002A7-1g
 for qemu-arm@nongnu.org; Mon, 13 Dec 2021 05:56:34 -0500
Received: from [2a00:1450:4864:20::32b] (port=56148
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mwj0R-0002op-74
 for qemu-arm@nongnu.org; Mon, 13 Dec 2021 05:56:32 -0500
Received: by mail-wm1-x32b.google.com with SMTP id p18so11561837wmq.5
 for <qemu-arm@nongnu.org>; Mon, 13 Dec 2021 02:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5z8i8oPl77F0qfGMJykN+D6j0nC3oyyBp5MOIUHSBU0=;
 b=G1/q/ldHLw+Qu8e4nQ8IpQQ+K0T7JQC1i4TwfhPnixYWkp4CeZlB566BIbavqq44At
 Tm020fE+GyaNU56uUrhAvBsrXm77STYXMS0rYNFU1vTknEleoRT2vgWUZAbCbdtxatjy
 MvY+KFStNQRDo1IBzXFvDb/T8c01VIBsXivJnMLDz4GNYhRY2IaU6V4ynDl+GEB5YSww
 dAVe+Wpu1qsOc/oJdntul2ayqqEoJQ5BCj5/GNX7QuNAKEheu+5k+YevT8aKVXzIcXpK
 /kc7RChHcoumsXHckJIDx8/AtG9yOtAGyawdmiv2/a/WNiCdVdcR0FAOh5PEMXevJtfJ
 VVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5z8i8oPl77F0qfGMJykN+D6j0nC3oyyBp5MOIUHSBU0=;
 b=CbgHeOmJrLl5GasL2RL4lTcmBer/tHjqc1i8xqin71O3I53b6FTlu0gfZqFg+yVlGr
 0R4ElgABUNo0gtgTCQKMlz4GrXw3rCMoz+saWhDvX6yHlF9fH0kC/U5k4vus+GwY7lJV
 kOMGrv7SciI4QcwJ+hIS08FQls6TUbQpzlHHlcnZr+a6esWmWsw7M4eoeg6hQqV+GifM
 6o+mR81FzSpLNqBEFZrFYjoINUnMiKCEJ0GXQBUzQjoN67EtjdS2v5FvjTG9G36j5VEu
 f08L8FRApY7AWTT6duUMGBvn7GBNvujyMKWKGLxoBCf2EvB2RN+FwjK5ppT2puaLN+f9
 JxxQ==
X-Gm-Message-State: AOAM532V3ItqcGZmBlnuPRteH4E23PQRmulnuonEfezw/n6IPcjc/Qo4
 zEtYtCgJA5FCx/wOXVPntdfQVA==
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr36566942wmb.1.1639392989835;
 Mon, 13 Dec 2021 02:56:29 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id m17sm10220322wrz.22.2021.12.13.02.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 02:56:29 -0800 (PST)
Date: Mon, 13 Dec 2021 10:56:07 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v7 0/8] virtio-iommu: Add ACPI support (Arm part + tests)
Message-ID: <Ybcmx/TK8F7ayt+X@myrica>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
 <CAARzgwxxRfOPbVU+QcYOkGL_pemLWH5x9z9pnhMgKoKOkAgSxw@mail.gmail.com>
 <YbcSOcEy//0DSMtL@myrica>
 <CAFEAcA9Cxi+mucFOv_=beJUkNtcCZRyURO16pB57-MrBeC2YNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9Cxi+mucFOv_=beJUkNtcCZRyURO16pB57-MrBeC2YNQ@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: eric.auger@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UZ66DtAvZvFZ

On Mon, Dec 13, 2021 at 10:04:57AM +0000, Peter Maydell wrote:
> On Mon, 13 Dec 2021 at 09:28, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > On Sun, Dec 12, 2021 at 10:19:47AM +0530, Ani Sinha wrote:
> > > On Fri, Dec 10, 2021 at 10:35 PM Jean-Philippe Brucker
> > > <jean-philippe@linaro.org> wrote:
> > > >
> > > > Add ACPI support for virtio-iommu on the virt machine, by instantiating
> > > > a VIOT table. Also add the tests for the ACPI table.
> > > >
> > > > Since last posting [1], I rebased onto v6.2.0-rc4. Note that v6 of this
> > > > series [2] only contained the table and x86 support, which have been
> > > > merged. Everything has now been reviewed and should be good to go.
> > > >
> > > > * Patches 1-2 add the VIOT table for the virt machine
> > > > * Patches 3-4 are minor fixes
> > > > * Patches 5-8 add tests for the VIOT table. They contain the tests for
> > > >   q35 as well, which didn't make it last time because they depended on
> > > >   another fix that has now been merged.
> > >
> > > I believe the entire patchset has been reviewed and you are re-sending
> > > it so that it gets pulled in after the release?
> >
> > Yes
> 
> To be clear, do you mean:
> (1) The patchset has been reviewed, and I plan to resend it (ie a v8)
> to be pulled in after 6.2 releases
> or
> (2) The patchset has been reviewed already as v6, and this (v7) was just
> a resend to be pulled in after 6.2 releases

I meant (2), v6 had already been reviewed and I'm resending v7 to be
pulled after 6.2 releases, sorry about the confusion.  Just for my
understanding, should I have resent this after the 6.2 release, or is this
OK and I should just state the intention for a patchset more clearly?

Thanks,
Jean
