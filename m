Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1664267lfc;
        Fri, 22 Oct 2021 08:41:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww3yrHPn7fsrl3aPZ6kU/UtDK6siIlgNT2mH3jcQf3cvCA8TZrSga17A57VihWKNMSBtJ5
X-Received: by 2002:a05:6808:1a05:: with SMTP id bk5mr10869200oib.108.1634917314529;
        Fri, 22 Oct 2021 08:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634917314; cv=none;
        d=google.com; s=arc-20160816;
        b=mLAH9cdKHGL1EesAir1TJvINLZ3mGD1+arxho4Gy/YxxsZcFRVvOuXL4Hdh1J/staQ
         IA3mI4ND/tWueWkIb6AFTy4xzF74OIQiKJrZuYy2WDkFGHvvn0/AMG2PesFignXEpBJh
         ORmUn6IywEaQWY5IKTBmATJi29/bq4kzGDs13lPmxUVUoIk8c+2Em+kuflSZkRmxxGZG
         Zs3CbDgyPogouQbjwo9TDH12hejZ9wvPfZCS6AWaAWUSNaixtQ+cNEIb5RibaWW/Rqsa
         ecVznHtuEmdf+dHQo/5tDbrRQJ+aimFi1a6XsZmzgUwF1CX8ZjFln4et3dqHeCr7zIGB
         T8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=1PZdL8GMTNxlY/SAqXEHFEtcGavyS8A598IJOB1TNRM=;
        b=ptL4FByKwcwDxmP2zA/Uql8p1ATCGGvI1x0JYXFw1EL6UxNiW31btZ6zMZO4yjaIhx
         qOUG6k6qYBE5EunRud3L+4CYcSOGv93SBNifZJMCqRjl36TYhxWWEbWQZ0aAJ73aLugS
         QFQGjjPAouxqAFr/XmE2pt/z8v5x2v+r4EMqCup8C9vwin4rX8O4CvPd8YBSSWSdBxxO
         YZGBnNP3hqa7F3BnnuE+oeSbmSRz+6CZq+XpP0y14H4JDr2LuDsMISdvERGvAtgc5xMX
         3s/Dwhb+7HJFeoUz8041jjbAPKsV+B8PD4ExkCHH6UAdQ5L+bmpuGz4WP1GAsR8+u+xa
         PAKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xCtsgVNz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c26si11176912otu.6.2021.10.22.08.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Oct 2021 08:41:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xCtsgVNz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdwg5-0001eX-PA
	for alex.bennee@linaro.org; Fri, 22 Oct 2021 11:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdwfg-0001YQ-MI
 for qemu-arm@nongnu.org; Fri, 22 Oct 2021 11:41:30 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdwff-00026y-2F
 for qemu-arm@nongnu.org; Fri, 22 Oct 2021 11:41:28 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 y22-20020a1c7d16000000b003231ea3d705so3815751wmc.4
 for <qemu-arm@nongnu.org>; Fri, 22 Oct 2021 08:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1PZdL8GMTNxlY/SAqXEHFEtcGavyS8A598IJOB1TNRM=;
 b=xCtsgVNz3bT/9k3yOzDuCAnUmuCTYx+Om6Plm7erUmd1MRkfLPeL8zNtT54/RDGhmV
 hzUhFIe3czUEVCCD2Mcoi6I15FTvBrgQis3U28tHpzGvU+lMaoICMe/Gd+rn8uVjqlgm
 JoghaWL6+WYBLuz+zWP+maurxxUFJ3q9ydJwUKpVk3T6RLaBw2W+RGlc0LFDwbjEmBCL
 U8dZPyuYGJLY2Q56WnlwiP1AP7Ttiwxf+ja3mgPI3UQHaHz0FVtwPxzFW79mvWpYWrVX
 V27aFw+BwZxE3p6iqNS4QSuW0fK3KZrUB2+1ApX2Recy78PeTgTSprh/deeXgXwDoGqw
 nL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1PZdL8GMTNxlY/SAqXEHFEtcGavyS8A598IJOB1TNRM=;
 b=noDvcnE8uMjy1JiLK3ZP1j0rsclw9KI9dwo8JmDlV2O6Cl37+K/TKg33VGN6iaGrEF
 HDF5m09KTnfqpq48XsVx2oYv5yPvzNQF84vxdlFMd/kbdVcMGxV3pSq4We7lmDkFAQfJ
 YK2rQWC4bxiAvMbeIn0l48zt9VfgOahBNmjeiihiTqpXcs3+aCPLpJzp3r3IMl/VirRK
 jgSc9jO/6pvKES3WE+Au8QVDrIIrn4usoJxG5eVJggBJpPty2ThZv4nVTxTWtSEzgW8R
 ROekbAvCs0ayEtUKQnA/nQ/QfQf2tB4IEhy6GmYBldroOSHmiO1rWXy+n4T4DdtITaII
 jorw==
X-Gm-Message-State: AOAM530N/3oy0k3iF311aXPyyqTvxttpH/D7QX6QTAcPQCOrZVQ+Z18Z
 fF1GzdZGALQqTTOIk6RqyiY2ow==
X-Received: by 2002:a05:600c:19d3:: with SMTP id
 u19mr28839754wmq.164.1634917284745; 
 Fri, 22 Oct 2021 08:41:24 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id o194sm901237wme.40.2021.10.22.08.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 08:41:24 -0700 (PDT)
Date: Fri, 22 Oct 2021 16:41:02 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4] tests: qtest: Add virtio-iommu test
Message-ID: <YXLbjh9S6jmkQK97@myrica>
References: <20211019063755.917506-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019063755.917506-1-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ciIChuUPdp6c

On Tue, Oct 19, 2021 at 08:37:55AM +0200, Eric Auger wrote:
> +static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
> +{
> +    QVirtioIOMMU *v_iommu = obj;
> +    QVirtioDevice *dev = v_iommu->vdev;
> +    uint64_t input_range_start = qvirtio_config_readq(dev, 8);
> +    uint64_t input_range_end = qvirtio_config_readq(dev, 16);
> +    uint32_t domain_range_start = qvirtio_config_readl(dev, 24);
> +    uint32_t domain_range_end = qvirtio_config_readl(dev, 28);
> +    printf("%s  domain_range_end = %d\n", __func__, domain_range_end);

Looks like a debug leftover

> +
> +    g_assert_cmpint(input_range_start, ==, 0);
> +    g_assert_cmphex(input_range_end, ==, UINT64_MAX);
> +    g_assert_cmpint(domain_range_start, ==, 0);
> +    g_assert_cmpint(domain_range_end, ==, 32);
> +}

[...]
> +/* Test unmap scenari documented in the spec v0.12 */

Comment seems in the wrong place (also v0.12 was just to keep track during
development)

Apart from that it looks good to me. The mappings should normally be
aligned on the page granule, but as the device doesn't do alignment checks
the tests are not incorrect. I'll update them when adding the alignment
checks.

With the printf removed:

Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
