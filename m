Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1129588ejq;
        Fri, 10 Nov 2023 03:46:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8dqLjnTQpzJ3CjvkLOrwTquTSbRZC7SQ0zWwyy/jwUz3TDGe2OhTc4W4K/HOvI7x4ItAt
X-Received: by 2002:a05:6122:4686:b0:48f:8533:3cda with SMTP id di6-20020a056122468600b0048f85333cdamr5171510vkb.11.1699616765026;
        Fri, 10 Nov 2023 03:46:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699616765; cv=none;
        d=google.com; s=arc-20160816;
        b=BqeNOTbjBAPNx2Zr0f4VgKUL0loaNyVsKFD+LhMhK7LngPu/HyC5zoLYOZbBjQh4b6
         70y5AD+NKwprMxfGm1CBGbDv+v6Ohroa+xbIffqehLMFzEQK853V9LnYMfuzCMjjkjUg
         wb2zrlO/T4dBWBPHHDerZvJxzR9N+vlxlJaFP4PHyBQrr/xnn6FyEb5EYwaguJHrFX1N
         NdYHhA2LntYeVNapNDU0WoUZ5JoUe7HoPK3irmi2EjUw0Ib7w80ZoQZkHPRjlvAnf3fz
         Ht/NNPsawWBjjVj5C2Fb/ccTdt4M91l2ne194hxnODVddAp69BiC/VIZSoCwxQ+5qNbY
         u/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=3Gbd3Y4beKSsxt8KVdiM2nj2u3zU0sDZ5nWjVa/Eb8w=;
        fh=PpZ1CCXoZMh/DRvZh+FxXhmYvb7cgaexUeWdx5nsuRU=;
        b=PMJiuVUM0j/t8tKZgenZ2fjDvrmyoTAv3kBJo59cAvpF6bFUIFHdJMDn6pC6dLcIHs
         r0ah8EYEMpcWLGMzX9Bo/zi85ZC5mYoN4BHvzjTT7U3459bBUjdJA75hxrUVduZ1GpY6
         SdwHsjDrP5lcPOs2ZoKnNWTOcvt4NODwdVwEtXyrK0pCP0XhSKkPnnGilUUxTiuJkbhK
         G3Gc1y6Hv8s859lH+Ty8yu7O6y7sjE+KuZS3/hcbk8QZSJQF/hWOgwxFw5Z5IsqHucMv
         /iUc71zvXkLmqzVZMfYUdc/xSoQ2UO8+/Z2uQ/MmKNZCiNM9ONiy9iS5Jt0ueHzjVYUm
         n00A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jnbOdoPI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19-20020a05622a139300b0041cb481b946si4541897qtk.389.2023.11.10.03.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 03:46:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jnbOdoPI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1PxD-0001zm-KK; Fri, 10 Nov 2023 06:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1r1PxB-0001zT-9i
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 06:45:37 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1r1Px9-0001j4-C1
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 06:45:37 -0500
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c5056059e0so26582591fa.3
 for <qemu-arm@nongnu.org>; Fri, 10 Nov 2023 03:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699616732; x=1700221532; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3Gbd3Y4beKSsxt8KVdiM2nj2u3zU0sDZ5nWjVa/Eb8w=;
 b=jnbOdoPI33+GGfmz9ITVIHfwCErh36LoljjMD2gHHij7wCSd9vrHXv/hqe1jbLjDoF
 UZlIL2YJxXV3vZiAB4KnFtZKWVrhAd4+kD42ALUa2yv8PbMtBaFJWC5HcKjVngiV+DLm
 bn1aOY9FnheoelSt1tCKotHU/nm++lOfcpDOj2adqKShZ7j0Q05V125O/OQzge9swIxM
 Qo7D25JEvqZ2jKUazEds0aVURZPIKAQeEIFvzMTIfGEg+QoOithXsOJKROVYWFk1TQFO
 Ds1XSfp7rs0bhhZln+PCUQoGvNNhkScumRPz9tIY9q3h1zNTEPuBXIzURFzeGan3NOyO
 E6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699616732; x=1700221532;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Gbd3Y4beKSsxt8KVdiM2nj2u3zU0sDZ5nWjVa/Eb8w=;
 b=LtOTcGDTnliM8pUXErUHseTn8GbJPZfmis6T2YcEnK/4nzuQaireuP55IxNM+Q434B
 HGFYi0RkL34gp6Y5uwrBB3RZo8+TTZoTriQMis2+TuqIeyu5v+NzOB3l10p/vju3HVyx
 06YebTaLsDSB2FN/kvSg6Dp5iy0sz1v8R9RvPVsBRWCaaTz0eKf/qzrqq3ZR9XkY5oo2
 Ktq5ovlLTrWr+amLLtzX0jKj+dcVtxORlg10IV3QZvKf3kE9W+ZnsKlX+dlOWKTZPbXP
 wYglNmaUVk8Yx6aefAvw3aORixQDUpZyndE28bilnTd8IiT7gekCxebky+aYCw1GSOSz
 erEw==
X-Gm-Message-State: AOJu0YyT2CdbAhr6eeYei17jx4bS8VwNbEeGC84sN0Rl9+oOZFTydZym
 Q71TWigcV/SzdnDrhUe0dxc5Jg==
X-Received: by 2002:a2e:8e99:0:b0:2c5:2423:e225 with SMTP id
 z25-20020a2e8e99000000b002c52423e225mr6292637ljk.6.1699616731908; 
 Fri, 10 Nov 2023 03:45:31 -0800 (PST)
Received: from myrica ([2.221.137.100]) by smtp.gmail.com with ESMTPSA id
 gy15-20020a05600c880f00b004064741f855sm4830439wmb.47.2023.11.10.03.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 03:45:31 -0800 (PST)
Date: Fri, 10 Nov 2023 11:45:37 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/virt: fix GIC maintenance IRQ registration
Message-ID: <20231110114537.GA3358536@myrica>
References: <20231110090557.3219206-2-jean-philippe@linaro.org>
 <CAFEAcA_Jja7MT_cSiEJ2it+wG7LnUXfnuoo1vmoUf1-+KSgtAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_Jja7MT_cSiEJ2it+wG7LnUXfnuoo1vmoUf1-+KSgtAA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=jean-philippe@linaro.org; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ePPVmjf1a28b

On Fri, Nov 10, 2023 at 10:19:30AM +0000, Peter Maydell wrote:
> On Fri, 10 Nov 2023 at 09:07, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > Since commit 9036e917f8 ("{include/}hw/arm: refactor virt PPI logic"),
> > GIC maintenance IRQ registration fails on arm64:
> >
> > [    0.979743] kvm [1]: Cannot register interrupt 9
> >
> > That commit re-defined VIRTUAL_PMU_IRQ to be a INTID but missed a case
> > where the maintenance IRQ is actually referred by its PPI index. Just
> > like commit fa68ecb330db ("hw/arm/virt: fix PMU IRQ registration"), use
> > INITID_TO_PPI(). A search of "GIC_FDT_IRQ_TYPE_PPI" indicates that there
> > shouldn't be more similar issues.
> >
> > Fixes: 9036e917f8 ("{include/}hw/arm: refactor virt PPI logic")
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Isn't this already fixed by commit fa68ecb330dbd ?

No, that commit fixed the PMU interrupt (I copied most of its commit
message and referenced it), but the GIC maintenance interrupt still needed
to be fixed.

Thanks,
Jean
