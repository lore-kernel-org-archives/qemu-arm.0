Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2611457lfp;
        Fri, 8 Oct 2021 08:19:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/7vd2C8mXPkeNKwmjKSenhbrGh+u7aCMNED6eL+AZPbE60a2Sr9hkL1sDMnFrxMyHXz5A
X-Received: by 2002:aed:2791:: with SMTP id a17mr12304287qtd.34.1633706368659;
        Fri, 08 Oct 2021 08:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633706368; cv=none;
        d=google.com; s=arc-20160816;
        b=nqT0QNYg3r8s1LzugqvsTprMpTQaPDnKrPPY+DaoGY4z8bNceZuVFGOEOyw4RmEOKG
         FYykt5Wtxt00D2iqTQ7PmCfPWe42Xe/AAXZ45q58wVqOmE8WE2/XmDocaFFuTHgvr2CI
         esTBGNXR8xB58bg0og1GBjIFvE3ShLHTzqGhCSwD06VMXtYrof0JOcxQCv3+R7pl4P0q
         YSIoBMMO3KRV9hLjLNU3RIwY30M9Lj5s+bQgG9BxeS867J2yde3xVsWByLHp0rEACk+5
         HfWruIY1MceCPm4/QtqGLK5ATijVpH2+L/vOFQPpnG5fJHWDnmtYpL64cEunwUEakXIY
         c0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=UpvV80ndSdV8BQ5Q6N8QOlQvBkgQ1mtE3YFmLNfvWUg=;
        b=VId03zDagW912320wFOG8EBFwLLZnMl9d5CGUPREuW21BTlyajSFRif7DKNwhbuvO3
         tCucVbIyzTkqyzF8zTx69zDuPQjPXZhlLS4EtUt6qJ/qopeVTO71xc/LHorMv/KM2qZs
         oNDXBaRvr+2MCG99dzhyZID6FWyZ5yW0GgYxJUXzVdZPSEQGbXTV8G2imuL81Ap4vEwb
         97h+DOgwKrJerGvDtcfWiyxJ6R34Xix2acMgBg+X0DtOEW02Of/w62rCb82oEh921NHn
         dyy3PBC+fQSgdl4aML8mZNI1pbJXpXnvDbCw7OgLqXpbCff3EhL16VVuOhJPwtqDw0FH
         JxUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YPHvcZp1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6si2180770qtg.144.2021.10.08.08.19.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Oct 2021 08:19:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YPHvcZp1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYrei-0001Vz-3J
	for alex.bennee@linaro.org; Fri, 08 Oct 2021 11:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrdR-0008EL-BR
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:18:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrdL-0006o8-90
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:18:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u18so30940329wrg.5
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 08:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UpvV80ndSdV8BQ5Q6N8QOlQvBkgQ1mtE3YFmLNfvWUg=;
 b=YPHvcZp1FMIHW5m2JjiFZzHVAzpcmks2U9reXh6WbOgYpZGBlPFsBdKYesSytOU7Et
 lgN1lFajJpFBkV2ln7zc2fLr+xfABjPmYMg/3EtaA9vkqYEicMShqO85N6FPsNr88FzC
 RuDyqReGgdDkYvZ5lyeSI5UpAjcP289TdAN/+RfLAZKDIVSIaN4ht0Jh+pfai84NZKFP
 CvbG5OQ7M9cHTxIoQkRkKoXoU9g92OSDlBinzlauGU8TqKQs06Sab4FY6gVdLYyyt80y
 RwfTqDnpOtGZGuhenCL6P9rmc/5nTS7cprvbgDuhtwgOQPwwF7IIiJHppJSml6EMG0tE
 bviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UpvV80ndSdV8BQ5Q6N8QOlQvBkgQ1mtE3YFmLNfvWUg=;
 b=30JxSxQt81rpeoDfOII1KsLy95LPUfqe6Qr4AUQujNDItHbqW5IcKeM5wCuxbR0M22
 dvJG/SSxkbQdlVho/jHL+XeiM8vH2hoaaELddTYJYU/2m6ySmJi3A1R66X8NJANJVWRY
 VjpPqJS8+ah8lptLINf4Kh5NDpdNzwCUPjstDBbg67FBgbVh7RhMpKSZ0QS651lJTUaJ
 CVpChw3zybuSUdJkrAop6KNtY6MT004A66MnctyeNHqbO2x2RVP40n5hTZ4iDoekCC8t
 QaAbSpeDxzmKFiOgW38/4a1R/z2hbYRCj/SZRLk/dsLG+bF3UxHKaQJM2Bd1TTcc3UDt
 En+Q==
X-Gm-Message-State: AOAM533DiNXFe2TuGOFTIi84kpxKRPlwsmdZUziDT2mUPEirGiYtHr4P
 uzPPDfb6PvuPEC+09TuND4cPwQ==
X-Received: by 2002:a05:600c:3b88:: with SMTP id
 n8mr4055223wms.93.1633706280785; 
 Fri, 08 Oct 2021 08:18:00 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id r18sm2856379wrs.47.2021.10.08.08.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:18:00 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:17:37 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 00/11] virtio-iommu: Add ACPI support
Message-ID: <YWBhEQxM4wRyZWzs@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211005113719-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005113719-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qaCb+zE6leG3

On Tue, Oct 05, 2021 at 11:45:42AM -0400, Michael S. Tsirkin wrote:
> Looks like this can not be applied yet because the bypass bit
> isn't in yet. what's up with that?

The boot-bypass bit isn't a hard dependency for this series, but it will
be needed for full support eventually. It will be delayed by spec and
Linux header changes

In the meantime we can work around the problem by having the boot disks
bypass the IOMMU (virtio without iommu-platform, or iommu-bypass bus).

Thanks,
Jean
