Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4041739lfk;
        Mon, 29 Nov 2021 11:16:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmYryfd5qPU399+6V7jcfnOHMZZ+DviAjV9oqtKVGKYVldk0kfje7yzMZF7wZurOMFHYrF
X-Received: by 2002:a5d:59ab:: with SMTP id p11mr36212737wrr.340.1638213416899;
        Mon, 29 Nov 2021 11:16:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638213416; cv=none;
        d=google.com; s=arc-20160816;
        b=iUwFSbnDoVNsjqEqhr9QPn+XmqC2UHDsSVpw7+tqjdxHeNlJXiszS/u0/Q6+QaceCf
         eLWp0CIxTLkRZSjyYDCp81yIBCtwKDFGKqQmFHL9/QjiG/RAz3ZOtkmopuBgqxG12ijd
         Z5gFEykCk7ev/WXhWeGfqzk0e+o7Gz3Z4/5LixV7q1ABVyfQMJPMXmzdG2Q8HHlXLAaO
         kZf1kO6xU348wITPMfIRzTAjSEi2jG2LEY+gZoWEjANZSuPkfHmV79x3g1SrSRJnSzas
         LfPduWcw2CyjVbffUoySz2M2JPGfPo+7vqAUmwS5axSbxYO/okU0PuHTyDEUjt/gwHkw
         xnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=VM06La+s5knpETvIftGngzAapB5VSNhHkJN6TLThw1w=;
        b=SU1z9Ho8y/rFO+6c8DKh8VGpH4FZZYZZhWS4dyOI7981h3EpThHFWY4oA0wndj/mL3
         Z4FuTAJxB74p40/s8BY5jzUp/xGgKr/hamw9DFiwYsqchrFbaFSVWXihhvHnDKfKQAQi
         MkrMTawNRfm1gQ8kABV4FuzXYju19LO/Qgl2a+AeaBf4yQhuK5wHvcvPr0pKffnFctBC
         yejLNtIFfuKQn0UdyhN1Wc/ydH1LEPTZPb5TgO+FGiymfzXLXsg0HgE9xrqbE50VVsO5
         5WYpXk3/53SiNJPMCrR0d09FreylgpSyNyw4//U8H5eGvhu3lcoo7JPIB++c71UCn3fb
         Mm2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZCguBFfg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si6486534wrf.849.2021.11.29.11.16.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Nov 2021 11:16:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZCguBFfg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mrm90-0008NJ-U5
	for alex.bennee@linaro.org; Mon, 29 Nov 2021 14:16:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mrm55-0005oc-Rz
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:12:51 -0500
Received: from [2a00:1450:4864:20::42d] (port=36480
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mrm54-0000nt-D2
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:12:51 -0500
Received: by mail-wr1-x42d.google.com with SMTP id s13so39158905wrb.3
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 11:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VM06La+s5knpETvIftGngzAapB5VSNhHkJN6TLThw1w=;
 b=ZCguBFfgjxj4Ot2JN3BDdhVA3HtjLDcEqk0rUrApwasHqX58CucS91bq7undOCtNEd
 f2gb+F4+rFV3kEPckVg4QoZWXr3XbxD51R9zmG+lYQU1YGhePKR7TQFhM0kIfUshN3eQ
 dQufpgsoPc5s2ystdGxtt2XwRd4wCSaRn/F/t2m0kqavY7135bFFuvNEjz2+x3u6eMqx
 G3nPDNKGFCkM2yZaqtCAfljeHn9rh1GPmgDzvR8EXPc9BnZU+vwZFc7SdX34axfk2xwM
 33RDmu40U4aDVxcJYJ6f7zZ/VRS2dAzAF8/tSpQ9QiAGvlAjC5zM11S7nSJveHI0Vw9D
 GQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VM06La+s5knpETvIftGngzAapB5VSNhHkJN6TLThw1w=;
 b=ff5WGNQBRXXHMA+LQsiTGifYMcSmoeivP3yYfeMuh9xkAImO1LbrT62WBx9gSVmPFR
 fDhwfx+fmz76/1s7PnEg/G9hof5tDBalygC8R+mRG05oPzhZ5rzthydz1w+aPPflcW8O
 CIcVJd0bpE9x7dTA6NH+nHDj4dTIU2JjMzdDaP7XKp6kJQup1ayd7sTJOxTe6plwN0B1
 Y9B8QPObZIFJEQB8FOeDPBsHXWu+lrYT5dDgFc5/JUPSxA5s7HkqRnp7OHQruG1Nfh8u
 F49Cvp9qKa/5AmHa3F8Vn3fMeBJYVAUW8SJ+9qN2nB0e41WqKaGMC8NyBsarMx7KiyZa
 5NnA==
X-Gm-Message-State: AOAM531HrWYiJvy2NS8xJvNCsVasDjh7LdNIxXvCt6cV7Rl+tTk+qucX
 vGjGh4Budb797zCFd3U7kA/v/A==
X-Received: by 2002:adf:f542:: with SMTP id j2mr35506201wrp.616.1638213169203; 
 Mon, 29 Nov 2021 11:12:49 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id s8sm14646788wro.19.2021.11.29.11.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 11:12:48 -0800 (PST)
Date: Mon, 29 Nov 2021 19:12:26 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v6 3/4] virtio-iommu: Fix the domain_range end
Message-ID: <YaUmGvfuOFbIDlUp@myrica>
References: <20211127072910.1261824-1-eric.auger@redhat.com>
 <20211127072910.1261824-4-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211127072910.1261824-4-eric.auger@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tQM7Ddl4pJE6

On Sat, Nov 27, 2021 at 08:29:09AM +0100, Eric Auger wrote:
> in old times the domain range was defined by a domain_bits le32.
> This was then converted into a domain_range struct. During the
> upgrade the original value of '32' (bits) has been kept while
> the end field now is the max value of the domain id (UINT32_MAX).
> Fix that and also use UINT64_MAX for the input_range.end.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  hw/virtio/virtio-iommu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 30ee09187b8..aa9c16a17b1 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -978,8 +978,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      s->event_vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE, NULL);
>  
>      s->config.page_size_mask = TARGET_PAGE_MASK;
> -    s->config.input_range.end = -1UL;
> -    s->config.domain_range.end = 32;
> +    s->config.input_range.end = UINT64_MAX;
> +    s->config.domain_range.end = UINT32_MAX;
>      s->config.probe_size = VIOMMU_PROBE_SIZE;
>  
>      virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
> -- 
> 2.26.3
> 
