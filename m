Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4083267lfg;
        Tue, 4 May 2021 17:14:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypo/Yz24WpqcE5Of3ybluejI5am5iwdq4I0ESnrjWqM1As9qgEvY2VNZQRdt8so/h9mCRF
X-Received: by 2002:a02:cc:: with SMTP id 195mr27109877jaa.73.1620173650942;
        Tue, 04 May 2021 17:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620173650; cv=none;
        d=google.com; s=arc-20160816;
        b=SbKV0Kdpmffd+776lnt7NCTCq/mqh3x8zFn6094uSVsUeFP/UEMRRkyU8oPuc5GoUf
         obk/KWV10H9mjbbb9mob0Tx8b/9Vr4L8TsTZFJQg3naaPVRBUrp/7NBGhr0NHsASFVPb
         rc8PozJP/2vJ/Ku4byAz968Zw2WvTXEsIiPgbq/jEvMFaXx/9viTWuOMKHUXr9bGoY2U
         UBJdUOpycXNMvBEGtQUU8FbbQYnnR7N6D0phsK/I8f4gncCpRyGQCQYnZzWaxtke1Pfi
         cc3KuPy6IVEY8whfStWNQa9cWLJxBw0TEwXCRFibvo7CUjs/6Ri1EPVSmU9BjZ3gQuVU
         n+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mrhPGvHlIr/7Xl07KopUpg5Wy5+M8jpP25va8IasNzg=;
        b=grYkJeWqQ9HmdsMQjTUCtz9MG2TwW7AcNmR1TW9NAOzCShaX5vmNFvSr8jeyxEOy7j
         PSQ1dpHHpjshlmmzzhSnu900avHFv0or4sZJezMdu4rwPsBvcFN3hSHR7FvJPIjj2AuQ
         PCxOWqzsAdBcxqKpksYjRUUVCqyQshQsiqtQqivH/RGaME/8HUOM5TScfcWi8h1RH247
         o1fpGZQc/bteHH/oyWqD/ITO7UUG5UGc6gAuehAyQRe6tPnP4YG9RxPfTQFhgpz7k46W
         WpDImL8JM+/JIttaHVBa0XP4bxWtlYD+p5iM+7+T3OL+zX4DMdcGE0155Y9q6ukxoYfB
         cjrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@intel-com.20150623.gappssmtp.com header.s=20150623 header.b=ys+mX2vj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si4783138ioj.33.2021.05.04.17.14.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 May 2021 17:14:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@intel-com.20150623.gappssmtp.com header.s=20150623 header.b=ys+mX2vj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:40650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1le5B4-0002U6-As
	for alex.bennee@linaro.org; Tue, 04 May 2021 20:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1le59O-0001DJ-3X
 for qemu-devel@nongnu.org; Tue, 04 May 2021 20:12:26 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:42753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1le59J-0003Ji-8m
 for qemu-devel@nongnu.org; Tue, 04 May 2021 20:12:24 -0400
Received: by mail-ej1-x62a.google.com with SMTP id y7so114901ejj.9
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 17:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mrhPGvHlIr/7Xl07KopUpg5Wy5+M8jpP25va8IasNzg=;
 b=ys+mX2vjpVaHSm7uh4IF90K03qF8UO6+a+0ebX5KU1ZijOGMP4kfzLs1RFCxZyrgsP
 PnvWNqYQApCNMTQy31WzhCPH7jUamZ/bGcwJrJUnfMQY3wLMt/+S6T88WJDDOHfWfpo6
 EVfI3XUkaiUSsMd4pJ9dS5/ddHvJFAfAXnJpaB7W9UppuibzBN862gncviGxGSw32K6l
 PTCdTreJnYdWHAJIB4HVUchsIz4d2D72WXAMySFB4+I8cOve8BVey0bLrVThPx7LIoaK
 5mWvy3Dzl+FSUCPmf+vHyOiSicq+flEw6O+TRYIsfOJQYwIkdLQJlLIWsndp5KRNzg/P
 WBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mrhPGvHlIr/7Xl07KopUpg5Wy5+M8jpP25va8IasNzg=;
 b=QoMFlHFdLF1nhwcxGKYDwJlOyn/9hXUncxK5EZlQdQHd0csjsCidy4ikc3YlKHIj63
 GfeswD1OJ1KyXbWQVK9YZPVa5pjIQ3hBNpXIagsh5fxtZalJj/qBX42eb+47W0dcT8Xq
 lQyMaNLQAZu9gNqHR5lbEQy1ReCHwsP/k8Az5gHMiww7qlbFultGkzP+uymNAeUDwaol
 yxzDzgQuJGA7XUd5hpNBKLjij1mgNP7DNaSNBVcEJGZugin0l7SPg++5z6sexYXkZp1m
 njVrPhVsOtEaOkR7HnPlGMloAFjHYJhWzuvyX3Cs2Nq7k22rgwcJlPcfSklW8HGpQWFg
 RUtQ==
X-Gm-Message-State: AOAM532EYymtc6PChsDJY57cksrTx9tx8zWpClnyWLGjBpF5sgjsnXS2
 SrpEskNCauI8fKxLktDjNoCFBHndiKJeZw/+z72dLw==
X-Received: by 2002:a17:906:a20b:: with SMTP id
 r11mr24797391ejy.323.1620173537351; 
 Tue, 04 May 2021 17:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
 <CAPcyv4gwkyDBG7EZOth-kcZR8Fb+RgGXY=Y9vbuHXAz3PAnLVw@mail.gmail.com>
 <bca3512d-5437-e8e6-68ae-0c9b887115f9@linux.ibm.com>
 <CAPcyv4hAOC89JOXr-ZCps=n8gEKD5W0jmGU1Enfo8ECVMf3veQ@mail.gmail.com>
 <d21fcac6-6a54-35fd-3088-6c56b85fbf25@linux.ibm.com>
 <CAM9Jb+g8bKF0Z7za4sZpc2tZ01Sp4c4FEaV65He8w1+QOL3_yw@mail.gmail.com>
 <023e584a-6110-4d17-7fec-ca715226f869@linux.ibm.com>
In-Reply-To: <023e584a-6110-4d17-7fec-ca715226f869@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 4 May 2021 17:12:19 -0700
Message-ID: <CAPcyv4hEhZoma=t=EtDXGr9r-i5K0GP01NU=jyDOmdp1YHn2rw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] nvdimm: Enable sync-dax property for nvdimm
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=dan.j.williams@intel.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Markus Armbruster <armbru@redhat.com>, bharata@linux.vnet.ibm.com,
 Haozhong Zhang <haozhong.zhang@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, richard.henderson@linaro.org,
 Greg Kurz <groug@kaod.org>, kvm-ppc@vger.kernel.org, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kwangwoo.lee@sk.com, David Gibson <david@gibson.dropbear.id.au>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 shameerali.kolothum.thodi@huawei.com, shivaprasadbhat@gmail.com,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kd3MkGlFpXkG

On Tue, May 4, 2021 at 2:03 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 5/4/21 11:13 AM, Pankaj Gupta wrote:
> ....
>
> >>
> >> What this patch series did was to express that property via a device
> >> tree node and guest driver enables a hypercall based flush mechanism to
> >> ensure persistence.
> >
> > Would VIRTIO (entirely asynchronous, no trap at host side) based
> > mechanism is better
> > than hyper-call based? Registering memory can be done any way. We
> > implemented virtio-pmem
> > flush mechanisms with below considerations:
> >
> > - Proper semantic for guest flush requests.
> > - Efficient mechanism for performance pov.
> >
>
> sure, virio-pmem can be used as an alternative.
>
> > I am just asking myself if we have platform agnostic mechanism already
> > there, maybe
> > we can extend it to suit our needs? Maybe I am missing some points here.
> >
>
> What is being attempted in this series is to indicate to the guest OS
> that the backing device/file used for emulated nvdimm device cannot
> guarantee the persistence via cpu cache flush instructions.

Right, the detail I am arguing is that it should be a device
description, not a backend file property. In other words this proposal
is advocating this:

-object memory-backend-file,id=mem1,share,sync-dax=$sync-dax,mem-path=$path
-device nvdimm,memdev=mem1

...and I am advocating for reusing or duplicating the virtio-pmem
model like this:

-object memory-backend-file,id=mem1,share,mem-path=$path
-device spapr-hcall,memdev=mem1

...because the interface to the guest is the device, not the
memory-backend-file.
