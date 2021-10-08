Received: by 2002:a0c:90cc:0:0:0:0:0 with SMTP id p70csp1805295qvp;
        Fri, 8 Oct 2021 08:28:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiNxbhajGH10Pb8tnFsTGXWu3vNNKhqy/YMv/u1LnVDuOASc3tTUAmcEmziSN/U0gJl75I
X-Received: by 2002:a05:6214:506:: with SMTP id v6mr10071437qvw.52.1633706923565;
        Fri, 08 Oct 2021 08:28:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633706923; cv=none;
        d=google.com; s=arc-20160816;
        b=k7sPVW2mMMgmvaJVdkNCcMn+UlgiBRfI+z2ZpPosztE+pucXKF0ri0YdDvxIJiFeuo
         HCfydA1PzxNP10eO6FdVUAIzFnRT7eCHSlUVmObSEUSPG5j62GCx4I8+JzFyglXJH/ja
         l2gSaoIZlvyG3EQOcx5lsXNa7adjIKDV/rvBceQiXlQNVSrpx8lXnbz3BMYenFf5pgMi
         5MRURdAw27f2KXSfO7ZxRjX2lZ8tcw8rfY23vnQh4JGnVwnNu5O2UQbpfaosTH8X8zVu
         qmwd6dbRvjJXItXy32tgVCmfbugxW56y9t6oPSS0PzqMOH9qxr58bjCcf+F+OlwunF7x
         0rXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=XM92KNyY8ssiKhgafzShXuuJk+BtFgYt61/l12lThvs=;
        b=p51jC7JAkClqdTw4SuCTAhlcWTeXKH5/zuA5abS/0Ciju0OfcJua46YFnivkazZnN1
         edB7poHUWcu4IBAzGB6UhCszlDnhsMek3nzMp3Vd9ObBEDqQPO8lAmb9qezUudf9LPnA
         ZA3oAOzaWjJrik+McqAK8DmDjpeHvbBgyXcOi3hcB7GIpm9isRQpcVe2y0lRU+HXc0QA
         qnbKDlocqQUQdRlqu4r4AIKKnY04T/z4NaXgeGwlfjLLEjtgHtSvrula6tq5PiMGQvDL
         h1PE6WVWzp/GoturBHQyCzQHzuXJMe/100/pe/uAFiON9XKGKaySCseqpP5cKmBkQBuT
         FdWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eskSE94d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15si1931234qvb.69.2021.10.08.08.28.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Oct 2021 08:28:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eskSE94d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYrnf-0003H7-4b
	for alex.bennee@linaro.org; Fri, 08 Oct 2021 11:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrmZ-00011z-E8
 for qemu-arm@nongnu.org; Fri, 08 Oct 2021 11:27:36 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrmX-00079N-B3
 for qemu-arm@nongnu.org; Fri, 08 Oct 2021 11:27:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m22so31078401wrb.0
 for <qemu-arm@nongnu.org>; Fri, 08 Oct 2021 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XM92KNyY8ssiKhgafzShXuuJk+BtFgYt61/l12lThvs=;
 b=eskSE94d3+G8To9qWjp6BEBZ3NGhaaKC/cULyYhcej8RdQd3CG4ZVbUnkSiKO3vyR6
 jO8VhBeUTBUZuis/f2RU8Ai1ZRZnYozOiTkQEeNdDyPSh54IOXBF23847gglz/CcrmsJ
 x3/1LzQm3BnDgd3t6EL8S0HnTVnT0vkSWewz7w0E3LC3BB/5DhtFx3SqTEri5MP21F61
 y9D4/hZKz+fhDp3p78B6qBrguKAYbgzoQFyD9JJ/DpbnwbOGUzH40f8gXXcUKpTf9eK7
 IOCmoojdnETNf2/tXed844zhXiDhvsBx5XC6PtJMcKmoYIlO5VLF1j4EIGLNP088ABzM
 zUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XM92KNyY8ssiKhgafzShXuuJk+BtFgYt61/l12lThvs=;
 b=eSgQf3tdJ1rrSS3DgpEOEoC4XGLEWfrJKwKApbd/8k0R5nqiyJpx9Kcb+Em1uYhDeG
 XXm6ja51+PWjBkTKCglKqnhTa+c6CY39cQyyjOLaa8vtSj9qSU8pBT5xfqTNjhmS6hgu
 /Wz2oE33XBbaYxXenPtdUJ+NyId9rrZeUN6hT6QTn9ZJnrlUidiOc5PmGb7NnZruNrdR
 RafjcgAj9QfpADrp56/QfAxAaHgjXBdxr9J234vv1YNQbUFBIMaVOoEnyLwcJ9XgAqaF
 HLPJNcI1NsIBgsuZquGjaGMK6Lpbzzbni/GNtfrbVi+cM149Ak9p467oruoKqLC0fEYv
 /g2w==
X-Gm-Message-State: AOAM532XLZ0yB4DGtC9CD8uzoLGzH0SF0Uy0dthrrjhFyiFcdgIoh8Gs
 rudfZsgZtOwbMa0GQ2oFrjsq0g==
X-Received: by 2002:a1c:e901:: with SMTP id q1mr4047378wmc.185.1633706850928; 
 Fri, 08 Oct 2021 08:27:30 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id l124sm12193068wml.8.2021.10.08.08.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:27:30 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:27:08 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v4 09/11] tests/acpi: add test cases for VIOT
Message-ID: <YWBjTODTiGc/vTTU@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-10-jean-philippe@linaro.org>
 <alpine.DEB.2.22.394.2110051556270.820442@anisinha-lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2110051556270.820442@anisinha-lenovo>
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Df5NzaOVH1NW

On Tue, Oct 05, 2021 at 03:57:17PM +0530, Ani Sinha wrote:
> 
> 
> On Fri, 1 Oct 2021, Jean-Philippe Brucker wrote:
> 
> > Add two test cases for VIOT, one on the q35 machine and the other on
> > virt. To test complex topologies the q35 test has two PCIe buses that
> > bypass the IOMMU (and are therefore not described by VIOT), and two
> > buses that are translated by virtio-iommu.
> >
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> This might be a stupid question but what about virtio-mmio and single mmio
> cases? I see none of your tables has nodes for those and here too you do
> not add test cases for it.

No it's a good question, there is no support for either at the moment.
virtio-mmio based virtio-iommu is relatively easy to implement, just
requires a little more machine support. QEMU doesn't support putting MMIO
endpoints behind an IOMMU at the moment, and implementing that is more
complicated.

To test the Linux VIOT driver I did both prototypes, but I don't have a
compelling reason or time to upstream them at the moment
https://jpbrucker.net/git/qemu/log/?h=virtio-iommu/acpi-2021-06-02

Thanks,
Jean

