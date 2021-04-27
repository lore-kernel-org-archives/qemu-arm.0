Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4861800lfb;
        Tue, 27 Apr 2021 07:59:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEKqFwBuqVYpl29xQtcybewSD7Nvmd+RKIEgIUc9A3rovF8LTyf8iRGB0txzMvP6HTXZ4F
X-Received: by 2002:a02:938c:: with SMTP id z12mr22062521jah.70.1619535562010;
        Tue, 27 Apr 2021 07:59:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619535562; cv=none;
        d=google.com; s=arc-20160816;
        b=UBZQAFPnoVtJjF24H5QMZF/m8Tcm8zSppfg4bJtZq9rY/Htv+gmse2VDZlWZzme8Py
         jo/8p1HTU/xDHYqDMH/etvTZCv9VahWENdlxqeu4q0lt0wrg31R3HBKb/srJwsOZ4eof
         k5LYwAmPcCq9c1cTl2xUfM3udK+huvyouaVdZqfwtK/Yil8cNdLhuX3Pkrvl6YnDkwDq
         lcTB09eoKMD98zSCTfkr6e6PhVBffSlelVcn6jgLfUATFRnQFXfWsFC68C13KaYGHv66
         BDUal/NTcEVcmaDB3D7VDlmMDnkmY7gUKeYPWwO1gnk4cSHBOoWW/FDDG0cRMsM8Sr22
         XgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=EhUkYjt0LtSFMJINx2E4g+oaWJ6/xMmr7jMwwUmpL1Q=;
        b=QMcqRnXpG7YJPE8ZKh7a3Y5JoJWyYdK1pBNU+Ir6VdMGe4SDPcc3PuJm+g9ebcM1e5
         SZL5W0E8K7Em5Oe1w6clKt/K1qHoaBwJH3UdpkDAIRBroBUF8VvM+hhWQc9mV4SvZzkk
         5JTTW2kfwftLcyXUoDMcwSMijbyVg4nIvicupNrDwxJUyWS4tuY9ug/dQkWjBOfRkEed
         zwjTJonnr7p6FZtkCenCGJe7ri1/dtDpW9e2xtu7XPm65HaGDlcIOVAP6lxyBFnePW1e
         J/q4RDmXS0wdWE+XXsuMgWS/oEh69Bs97j9x3vg78L264m4LVcUYuoRJpl8ZITTgKmjv
         weng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IEyA6OA+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si3456799jad.71.2021.04.27.07.59.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 07:59:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IEyA6OA+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbPBJ-0003b3-9z
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 10:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbPB8-0003ZI-KX
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 10:59:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbPB7-00050Y-48
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 10:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619535548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EhUkYjt0LtSFMJINx2E4g+oaWJ6/xMmr7jMwwUmpL1Q=;
 b=IEyA6OA+LOrOldyhp0Ucn3iXsJHmKs7GT29mTs31MkSlopi1lv9ak9s24Dgryuv7UWkm6C
 tmwXoHcrRfH5GadIsD+meYP2pIFzg12mroyeUyzzmpx8m6g2Qgo4nqqlOL3Y2aOE2FHSMX
 5apMwxhwHe2GvFJCBKl/vaBzej1QpF0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-voAsF1psNDup6r-ni_uRTw-1; Tue, 27 Apr 2021 10:59:05 -0400
X-MC-Unique: voAsF1psNDup6r-ni_uRTw-1
Received: by mail-ej1-f69.google.com with SMTP id
 ji8-20020a1709079808b029037c921a9ea0so11324294ejc.9
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 07:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EhUkYjt0LtSFMJINx2E4g+oaWJ6/xMmr7jMwwUmpL1Q=;
 b=WSh79IVMWsGGPy8v5wO7otZIOTupMEYCgxnnzNd8+0U8V3uWrA+hE33mjHmqm5Epmj
 fjG4y2AKicCZR/gdjt887cNuFamYUwa8g0QrOzlF+/48IzvmmN4k+zAnYCqsxf62HIxs
 X5WrSrrnyj6CCqV7c9P7lCA7sR9R3z9cBzisWlIDdWE2pvCgckLy9sUla8UfMmFfaGLk
 t804alRGj1uBALxZRfp9cKWrPAE3j8uOj9V0KTvHqO3vXlmUBLpFFvv5j8ga1sb6jAm0
 4JXF0KKRMsSKWJlvGLc5OFexkolD1iAah8xuxTdpJmvAkV1TUA531nUWga1/ENNQwWsa
 YmZg==
X-Gm-Message-State: AOAM531tAsfVhBz/rBtBbhFI6gGL5O5Xm+boNGO/pmdqJ/OQTmNxjR5s
 SxCPXnnNKH7Ar4JIbNXhacraE1HgtbJSYFPX6apJYMORDRqDzwVu4VN7D2pudKDmNilwHiIo8uZ
 ENzV32uuO9VpI
X-Received: by 2002:a17:907:2623:: with SMTP id
 aq3mr15394207ejc.262.1619535544087; 
 Tue, 27 Apr 2021 07:59:04 -0700 (PDT)
X-Received: by 2002:a17:907:2623:: with SMTP id
 aq3mr15394178ejc.262.1619535543794; 
 Tue, 27 Apr 2021 07:59:03 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id u1sm2515691edv.90.2021.04.27.07.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 07:59:03 -0700 (PDT)
Date: Tue, 27 Apr 2021 16:58:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 6/6] hw/arm/virt: Replace smp_parse with one that
 prefers cores
Message-ID: <20210427145856.5qaetgzdl6ovnoni@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-7-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413080745.33004-7-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MjDvLviHtfmD

On Tue, Apr 13, 2021 at 04:07:45PM +0800, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>
> 
> The virt machine type has never used the CPU topology parameters, other
> than number of online CPUs and max CPUs. When choosing how to allocate
> those CPUs the default has been to assume cores. In preparation for
> using the other CPU topology parameters let's use an smp_parse that
> prefers cores over sockets. We can also enforce the topology matches
> max_cpus check because we have no legacy to preserve.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)

Thanks, this patch matches [1]. Of course, I've always considered this
patch to be something of an RFC, though. Is there any harm in defaulting
to sockets over cores? If not, I wonder if we shouldn't just leave the
default as it is to avoid a mach-virt specific smp parser. The "no
topology" compat variable will keep existing machine types from switching
from cores to sockets, so we don't need to worry about that.

[1] https://github.com/rhdrjones/qemu/commit/c0670b1bccb4d08c7cf7c6957cc8878a2af131dd

Thanks,
drew

