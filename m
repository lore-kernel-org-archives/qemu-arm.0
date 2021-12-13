Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3919110lfk;
        Mon, 13 Dec 2021 01:29:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxedqQV91SHxL/PmFbAvn++AedJ/rChkumyc//I4UiMGR4PS4Kmw5gDU4Vl8RCbfogwTGdq
X-Received: by 2002:a05:620a:a50:: with SMTP id j16mr30919691qka.766.1639387770359;
        Mon, 13 Dec 2021 01:29:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639387770; cv=none;
        d=google.com; s=arc-20160816;
        b=AmO/5r/+cmUaLfh9I18GuhYXhQRh0M62Lg3/ZXNmNLKwt2v1KXC3OQb8u46UDXRGPT
         EF+OTfPiaBorjiLivpRfcb9/2+gqVVz1f8wiSleCaPku3pyuokeCFdGCP17nstWw+EZ2
         9u1uodnGAr580AYy9zVDb6gkOCajZsqznfEHdDvdhQv0sBdWI/nTNHYmzvMpSyUqmWF+
         D5JJQ+kqmVsyacqxs4pHM7dxRO7tgjosvWJWzU/Q/UZpRCfWsSs1xckv3p6J7Abj3xiD
         Y138Bk2WsQZ8DhfqQK9gipVM7E8fuLHELgC4YLKCP8BX6O8erls+pZegx0tsstLMGWAW
         J8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=TbRclA0JRK5WACnWqXlQkHSiMsRTyVH7r+/VtpofiJ8=;
        b=GepHW28VbPBpFDCBaZAYsyRIxfCEWkPoaDg88uV9kPNsAK1mHJLhzvFotdf7v9daZ6
         zF45tgtL+wQ0jAeeynGREr9pQhfVH71a8NYyjRfRN9NIaBWqqh2lxrC1wFJXVBYyeeKq
         MLjNpF7n9ZNQGEEDQa5wceiyvkH59cr0Lf0lPz3aSeQ6smGdCD0jqD98LUi34HJjG68G
         vkzWGOdqom6EwoBXWwwCEzRc5CGRPIgZeW4uQt3+ov9ULx5NTe6qWygNRFhf2tjgEi24
         nDRKTBTKSkh6aSZmEUVHrUUBKXHSYjlJ229tKViQ1Ae7apRP0j+HfrT5CkQhLwRLpmK3
         4Qfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SZUeUuwo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17si10614518qty.436.2021.12.13.01.29.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Dec 2021 01:29:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SZUeUuwo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mwheD-0000eW-Ol
	for alex.bennee@linaro.org; Mon, 13 Dec 2021 04:29:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mwhdd-0000eD-HQ
 for qemu-arm@nongnu.org; Mon, 13 Dec 2021 04:28:53 -0500
Received: from [2a00:1450:4864:20::336] (port=39788
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mwhdb-0002Zd-DE
 for qemu-arm@nongnu.org; Mon, 13 Dec 2021 04:28:52 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso13525495wmr.4
 for <qemu-arm@nongnu.org>; Mon, 13 Dec 2021 01:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TbRclA0JRK5WACnWqXlQkHSiMsRTyVH7r+/VtpofiJ8=;
 b=SZUeUuwosDn7kPJSeQ/FIMdHjbCAOrimUj4S29RlTrd2I0o7e4NCs0OjoHY75Km2dY
 n7pbs7pM47YISRa6eVolvWNTMir1MG5tf4QEpNv8t0AwIjIZ0nmAF9swoiuFx8sAZrjA
 z0x+vWX9pukSH+sbS2rO+hteQQ/BJlTZVKZGvNiugA3CObUIThqR+1N5fF4I5rtttmc8
 mYnOEEQZcbX7QkChaGZTA/TEUkKq5Bxlwjuozdljfh67hOW5CC2rLP9kSWFMMgmTjg5c
 DUrlfeFF8JS2ol9VtfbuHi4Bce8RWN+56H2DtsTy3gLNOjbgrF2GspmcbPPY4pT1tgRA
 u+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TbRclA0JRK5WACnWqXlQkHSiMsRTyVH7r+/VtpofiJ8=;
 b=7vtlyl3snPJa2PTiJW+u17SK7QkxK/pnT4svUZLvXLOEf19bColFrOzUGbbJpmjntb
 h637tU15OXVwsPp/HSDPHeLd5Opz0f7mOSHVvRbsWzjGTf0K6zYwFi//Szl1J/OhVhq/
 fqh7ijquws+L02YLrlrhXbyN1S3yRo3jF6Cj7DVe0da6Bu50fmlw17gPSVPjqC+jDT4d
 68o+4UKU/KF4rUxXsxH3iT30ZIif6HyJAP4fDKsnnwOx1TLaeOfP6KMghxJq1BKyFwpC
 9+E7kDBXuNo86iA20VuVmMQefSm00lVpB8H6bB2bPAMC6ZSSN+JStMKEfDP62i5jbVgV
 1aBg==
X-Gm-Message-State: AOAM532SYWWGwT0sDhvsdCDBPZPL5Mxz2pIJ334l7fjVl4VZEeJo4SJd
 30Ln3+uLe9oTSK9XNnu0ckTYpg==
X-Received: by 2002:a05:600c:1d0e:: with SMTP id
 l14mr35262827wms.64.1639387727452; 
 Mon, 13 Dec 2021 01:28:47 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id r11sm10267146wrw.5.2021.12.13.01.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 01:28:46 -0800 (PST)
Date: Mon, 13 Dec 2021 09:28:25 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v7 0/8] virtio-iommu: Add ACPI support (Arm part + tests)
Message-ID: <YbcSOcEy//0DSMtL@myrica>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
 <CAARzgwxxRfOPbVU+QcYOkGL_pemLWH5x9z9pnhMgKoKOkAgSxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwxxRfOPbVU+QcYOkGL_pemLWH5x9z9pnhMgKoKOkAgSxw@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A+aBe4q8A2wj

On Sun, Dec 12, 2021 at 10:19:47AM +0530, Ani Sinha wrote:
> On Fri, Dec 10, 2021 at 10:35 PM Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > Add ACPI support for virtio-iommu on the virt machine, by instantiating
> > a VIOT table. Also add the tests for the ACPI table.
> >
> > Since last posting [1], I rebased onto v6.2.0-rc4. Note that v6 of this
> > series [2] only contained the table and x86 support, which have been
> > merged. Everything has now been reviewed and should be good to go.
> >
> > * Patches 1-2 add the VIOT table for the virt machine
> > * Patches 3-4 are minor fixes
> > * Patches 5-8 add tests for the VIOT table. They contain the tests for
> >   q35 as well, which didn't make it last time because they depended on
> >   another fix that has now been merged.
> 
> I believe the entire patchset has been reviewed and you are re-sending
> it so that it gets pulled in after the release?

Yes

Thanks,
Jean

