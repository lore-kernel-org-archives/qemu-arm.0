Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4935934njc;
        Tue, 27 May 2025 09:29:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVx3oG86EPSMlAlCgBh/kBvD4bL16Jj+rQshjRgQa5X4RDQnZC9BIXe9mwxNcwos1b1oL09qrQteVEG0w==@linaro.org
X-Google-Smtp-Source: AGHT+IF7c356/1HCfmtrOgobTke4pSQHs+DynXl0JpXkjsF3qv+Rgzb66ydF/k2Nik+QJFZ+DBav
X-Received: by 2002:a05:6214:1d23:b0:6f8:c23c:5268 with SMTP id 6a1803df08f44-6fa9cff1043mr210334946d6.7.1748363357725;
        Tue, 27 May 2025 09:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748363357; cv=none;
        d=google.com; s=arc-20240605;
        b=iZk+Etok/yoQH8y2oc1lN1IxSTfmyubGejLH9E+seSfmwy7dE78QWdHtJSe9t71CiS
         YbSgfc2Xkt3XLN4dIHK++8p13ziHdNoTv2f39JuU66QRndTpxcwsJ7zd3evhkO45jjMh
         xPJf+VJGoZd9XKxx+8uCc0GKDkkWoujSYefAeFfc/HQYd4tbleaSFfxDUbSI4i8KuSf1
         +Wnsn06hPr/UTwV9iQyDteg5zyKgpL8YBjaBQBWe6Gfks3CZnnlL+mxaMte7gO078S38
         PFFVBLybqzE46mLOB3uc9egfXcmlFzUlfVMYMAgvxA3eaKUaxCequYuAYloFjzpddVWw
         ptug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=y6zEFavf5KeJqIG5w2LBj7BEM4jZx0skd7ID64678ug=;
        fh=jB4EPcoGdiUM4ZoSfUtHmHNKdmV0mpTZQN3bLMcLL0I=;
        b=kpV50PQeAnsjLMrUYKoLiqmxXA2xJWVAojWMkOhbNtkN6YrNPvOov+4op04oooZaP+
         65mN7H5P8CfSD7ckHl2vSs+wBbjGDBARpGNE4LGz9WJUG+AK9Vkpyirx7V30I9w4h/6D
         BDuJGmtu3ybJM7ZJJ8k/PtgWaKOmeybV9YTZxQ+HtInQsZ2d3YJT1wJnyYJZ2vLOSytA
         BrIXgFbjdtpYZe6MAZUfrz2J4MozmXpZjv620C3d8Szu2zoB/j8QcrbrOk36DHK96Czs
         bT7NwVvqwu0mmlvDqmQJ9iF7Fo6Rd8sgToZ/WsZ72jSDEOtx455fJpxScULmhGBM206i
         jPpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fa9c8c0ea4si88622736d6.443.2025.05.27.09.29.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 May 2025 09:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJxAl-0003bY-Kk; Tue, 27 May 2025 12:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uJxAj-0003ab-DE; Tue, 27 May 2025 12:29:01 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uJxAf-0001NF-4k; Tue, 27 May 2025 12:29:01 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b6HzZ1BNlz6L50R;
 Wed, 28 May 2025 00:25:14 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id EB14814050D;
 Wed, 28 May 2025 00:28:44 +0800 (CST)
Received: from localhost (10.122.19.247) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 May
 2025 18:28:44 +0200
Date: Tue, 27 May 2025 17:28:43 +0100
To: "Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Fan Ni
 <fan.ni@samsung.com>, Peter Maydell <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>, "linux-cxl@vger.kernel.org"
 <linux-cxl@vger.kernel.org>, "linuxarm@huawei.com" <linuxarm@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Yuquan Wang
 <wangyuquan1236@phytium.com.cn>, Itaru Kitayama <itaru.kitayama@linux.dev>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v13 3/5] hw/cxl-host: Allow split of establishing memory
 address and mmio setup.
Message-ID: <20250527172843.000065a9@huawei.com>
In-Reply-To: <c9afd4d7-d755-4e6b-b541-ce29da885a13@fujitsu.com>
References: <20250513111455.128266-1-Jonathan.Cameron@huawei.com>
 <20250513111455.128266-4-Jonathan.Cameron@huawei.com>
 <c9afd4d7-d755-4e6b-b541-ce29da885a13@fujitsu.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: K6ovSBDZHcR1

On Fri, 16 May 2025 05:50:59 +0000
"Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com> wrote:

> On 13/05/2025 19:14, Jonathan Cameron via wrote:
> >   
> > +hwaddr cxl_fmws_set_memmap(hwaddr base, hwaddr max_addr)
> > +{
> > +    GSList *cfmws_list, *iter;
> > +
> > +    struct cfmw_update_state cfmwss = {
> > +        .base = base,
> > +        .maxaddr = max_addr,
> > +        .update_mmio = false,
> > +    };
> > +    cfmws_list = cxl_fmws_get_all_sorted();
> > +    for (iter = cfmws_list; iter; iter = iter->next) {
> > +        cxl_fmws_update(iter->data, &cfmwss);
> > +    }
> > +    g_slist_free(cfmws_list);
> > +
> > +    return cfmwss.base;
> > +}
> > +
> >   hwaddr cxl_fmws_set_memmap_and_update_mmio(hwaddr base, hwaddr max_addr)
> >   {
> >       GSList *cfmws_list, *iter;
> > @@ -445,6 +466,7 @@ hwaddr cxl_fmws_set_memmap_and_update_mmio(hwaddr base, hwaddr max_addr)
> >       struct cfmw_update_state cfmwss = {
> >           .base = base,
> >           .maxaddr = max_addr,
> > +        .update_mmio = true,
> >       };
> >       cfmws_list = cxl_fmws_get_all_sorted();
> >       for (iter = cfmws_list; iter; iter = iter->next) {
> > @@ -455,6 +477,26 @@ hwaddr cxl_fmws_set_memmap_and_update_mmio(hwaddr base, hwaddr max_addr)
> >       return cfmwss.base;
> >   }
> >     
> 
> It seem we can share most of the code in cxl_fmws_set_memmap_and_update_mmio() and cxl_fmws_set_memmap()
> In addition, we can drop the cfmw_update_state::update_mmio if there is no other users. Just pass it
> to cxl_fmws_update() directly.
I'd like to keep the 'documentation' aspect of the function names, but
can reduce duplication with a do_cxl_fmws_set_mmemap_and_update_mmio() function that
has a shared implementation and takes the extra parameter as you suggestion.

Thanks

Jonathan

> 
> 
> Thanks
> Zhijian
