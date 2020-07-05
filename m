Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4020520lfm;
        Sun, 5 Jul 2020 04:48:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxETnTpYZC5UmaAeFjNgBQaqor3z8rW7x8+czKMicrdq7hXuK4ARou+nVZAeXUpbLDY49lk
X-Received: by 2002:a5b:a91:: with SMTP id h17mr326705ybq.148.1593949713928;
        Sun, 05 Jul 2020 04:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593949713; cv=none;
        d=google.com; s=arc-20160816;
        b=1CeDv+FppcbcqPmDcmkjiZj/15QtTbvSctkeXx5sSw3ezhCsjsTQVVtxIE799GOJw3
         j4uDyyAqrGQezbRRK3RV/i/Bd/J5QP0wgPO8jcTckukuJLR7L8G5qjpx/I/frrFLrm9n
         GKbxgYU1FDbcYeVnQJ+LJV4mc1gQQM4YXzj6tpCs69VZ8Nv7nb37YMgTxgzVcxOJvgdV
         yoVvMQUnCfTfh/u/YehMHYKesS7sblHPcjJqFAicDr3Q/20WSITsUnxOng0aYQWxjxLR
         aiEkth9xxxyQa55KBaNR8CUROKkp1fWokYrxuF2eLRKHyvKDdcxQKa0gIGMLJcsg9/uz
         NvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=lZKE5ibmmhD5CoUCw8ft6VuFKZl2+IRVJsKFBAgOpXg=;
        b=w1S28IgBTFPxdFL1G0JUDTC5ryIynvy+ahnT/4jh4diA4Crf75gv5dXE/2vdHpS6bj
         ESZv7TZbUbjQIt3/BdcYskOikdn7czFKv8/lPkPR6PJkX3S9/rM4WCiMLl4/lJTc8v4k
         XoniIMVlfTpCXnS0vZYf5Yk16OVnsFGzGFWBVylB6ESh1KMmH8fw6ySFPbrjrk38BMnD
         0G600E/nav1xeQHWEUZ+bTFxAEMfudvZCjXTLMbMLopVBd1cJwpN2O/w3IMUJTg2Aotg
         /ODRoqfxE35/Q9ByaUNbw/mkmWLqe/AMY+llogqwE68f4Rv9bA6fTVkzjvBHn9lovz8W
         M0mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V6AvlJbO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r16si2094270ybk.393.2020.07.05.04.48.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 04:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V6AvlJbO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1js38L-0002GO-Bq
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 07:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1js38E-0002GI-Lq
 for qemu-arm@nongnu.org; Sun, 05 Jul 2020 07:48:26 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60613
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1js38D-0008Dw-9b
 for qemu-arm@nongnu.org; Sun, 05 Jul 2020 07:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593949704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lZKE5ibmmhD5CoUCw8ft6VuFKZl2+IRVJsKFBAgOpXg=;
 b=V6AvlJbOKVSXRIErQc5riW8hxq2CFNE14ZGbFuTAUuv24uusysNg2hBS5YbSECoynkT/CX
 KrzNzGfG/JuBkoGxUGTTc9pnKsXmfPZWz3LbxCh2QyRSo/ZBFTF+XGR4Uvumc0lKyHaIqc
 PtmrvDbw+tSFlCxpAwb2N1I17vpTaRQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-8dDD7IKRMcqVd4TBFasqlA-1; Sun, 05 Jul 2020 07:48:20 -0400
X-MC-Unique: 8dDD7IKRMcqVd4TBFasqlA-1
Received: by mail-wr1-f70.google.com with SMTP id b8so23837070wro.19
 for <qemu-arm@nongnu.org>; Sun, 05 Jul 2020 04:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lZKE5ibmmhD5CoUCw8ft6VuFKZl2+IRVJsKFBAgOpXg=;
 b=mCkEBi5I3PwYBbktwfsRAXujWw+KA511sEghhfSc4jiuLNmq+oXz4pkwTq3NM8UvPF
 XwxjRSQ/W9fvOLOepS7k/2VhBgV0vub4449UUgYaVkH3Y3mbcMU8+KWPibephkjWdB5G
 beyMNjCXA7L470ud+kD2tJBi4j8ln9i41ed8fj9fCsOBP0xfzoTbznyPvP9utjT5x9Dm
 eeohi735/ueldcPAwAFuPLZ68+xFM5lwJFvsJ4giOrojc2EMx9ThiHf4guqUiBQSG9yI
 pCQ9FMRxmerpt4EobUylCCeLHNr3iYLRPJgPgUYCzbd+g13FwuGfpx2G7lQxbhXO5CGe
 XCFg==
X-Gm-Message-State: AOAM531uDCsm6z4U53aeRunCSNKJEchUGcGeKf6sDVXjyaWwsH3/7E3q
 qrSCqjVFi/mnEVw8T1IaKcOIpfuo+Be6KM6NVaF3/B+T9Y1VzaTglQ2s97fVS+lOuHRVjNpYbe5
 L+4yXBvAuERyY
X-Received: by 2002:adf:f3cd:: with SMTP id g13mr42135500wrp.45.1593949699398; 
 Sun, 05 Jul 2020 04:48:19 -0700 (PDT)
X-Received: by 2002:adf:f3cd:: with SMTP id g13mr42135475wrp.45.1593949698782; 
 Sun, 05 Jul 2020 04:48:18 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 t16sm21374048wru.9.2020.07.05.04.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 04:48:17 -0700 (PDT)
Date: Sun, 5 Jul 2020 07:48:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 08/21] microvm/acpi: add minimal acpi support
Message-ID: <20200704053018-mutt-send-email-mst@kernel.org>
References: <20200702204859.9876-1-kraxel@redhat.com>
 <20200702204859.9876-9-kraxel@redhat.com>
 <20200703084039-mutt-send-email-mst@kernel.org>
 <20200703192510.laaeku6kvudcs4g2@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20200703192510.laaeku6kvudcs4g2@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/05 05:57:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NGT7HsWcLN1M

On Fri, Jul 03, 2020 at 09:25:10PM +0200, Gerd Hoffmann wrote:
> On Fri, Jul 03, 2020 at 09:09:43AM -0400, Michael S. Tsirkin wrote:
> > On Thu, Jul 02, 2020 at 10:48:46PM +0200, Gerd Hoffmann wrote:
> > > +    /* copy AML table into ACPI tables blob and patch header there */
> > > +    g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
> > > +    build_header(linker, table_data,
> > > +        (void *)(table_data->data + table_data->len - dsdt->buf->len),
> > > +        "DSDT", dsdt->buf->len, 5, NULL, NULL);
> > 
> > Why 5? Just curious ...
> 
> IIRC because the hw reduced hardware profile needs acpi 5+ ...
> 
> take care,
>   Gerd

Well ACPI spec 5 says revision value is 2.


Let's use standard practice in ACPI code, and add comments near each
value documenting earliest spec revision where this appeared, chapter
where they came from and some verbatim text that both explains and can
be searched for in later spec revisions.

In fact, same applies to a bunch of other code in this patchset
which just uses macros which does not help all that much
as they don't appear in spec as is. Can you pls go over it
and add such comments where appropriate?

-- 
MST

