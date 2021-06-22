Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp3114338lfg;
        Tue, 22 Jun 2021 07:16:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0ySXRxX3fjHb/HWwxXBvfJQDGwcPC5x6KWN/YYb+VrR1QAHRVVDwnq5Xrwc8S1j6/dEH5
X-Received: by 2002:aa7:ccd4:: with SMTP id y20mr5329975edt.151.1624371371040;
        Tue, 22 Jun 2021 07:16:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624371371; cv=none;
        d=google.com; s=arc-20160816;
        b=nrbr45s3Z+AZHz5hWi3tpRzU48oxcTi6QhUNFStTpRYDX7IjIpORc0BlP7RKgkRhTQ
         FagOlIjiyifmNT/RQB3hKB60SzAwTQgqPcL/8tmF2Icar8xvoGijPdib8MRKRMqbEm73
         DMHF1K86bboH8WDwekCnywubNRKBBe0MSi0SPwXqMDctE9wytu2jWJsmLgIjQxBbbTg8
         uzvVGmXzzzY+3vlaKILhlchfMPREAKcW3eKv6lozxqCS/bLbtVsZfQYxZwczTIn4kdek
         lCSRlHbT9o+EmFzrHlROOQOeHVUVw3nlonb2wmZsjJI/7zh3eSmh5EdQW/bak2wd2eHb
         S82Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BBDAQ95PzCigF/6scozDwCGoyusjEsB8XZAQ8m0yhYs=;
        b=eggTKTxV1MQSKk15b63fPirL6ATuDQuc+uXDJS1ce9PZzHj9+NACkKVH5APYapEIRn
         kZwIivyy5ERd2jgSpQ7tYLI3Fy//czJZrrMmK5SdiU8mkAM9ESKySM4osH5xd0hZQlQ3
         OR4JGwr0qTUdmA5jEG0bpOIjytOztm5Z8uVRiBLYY4kBPBL9dthPQfRePe7JKLqHDSr7
         wPvjPpSMotcHI7aQj+2CMEY5Do9PPscxKpVfeY5qnoGIu5bZDvZ4Wpai+r4oafD5Rlfu
         Xg7ZTA0Xf0cPxuH9kS4EzoGjSm6I88UbYoPGuG8JlDJa3ayV8+rG4VFsk4V2zOUp7e4T
         YoVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hvkshuIw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14si10990942edr.274.2021.06.22.07.16.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 07:16:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hvkshuIw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvhCE-0001In-6h
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 10:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvhC2-0001Hg-4L
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 10:15:58 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvhC0-0004tP-DB
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 10:15:57 -0400
Received: by mail-ed1-x529.google.com with SMTP id h17so13978480edw.11
 for <qemu-arm@nongnu.org>; Tue, 22 Jun 2021 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BBDAQ95PzCigF/6scozDwCGoyusjEsB8XZAQ8m0yhYs=;
 b=hvkshuIw2uch4Qh8deIWknWAWkFWTyMY8JgL9io731VD7cAbnP060wgMP1Rh4ETPim
 pFuKOu3KqXGcWkXgifxYW2DTXvXUSVyhQgcVqlA91Z/GrDEMRy97DVOwqo/ChGzQqed8
 QyNP4WcHhncdX6wCrSJMeG3JXxj3hpfqXDMJtsXjk+YwSXhS832Q9Bwvwdcmqh704t4p
 iDMiUXNdckhjT2Ql00HWIL/dzpRhgJydF/uAtp3yl6mPOMPFqsrnO8DGwFoS5rNId+gu
 gtiDDSI/ma9ODZC8s4BNBduAQGzawtOxmgRs8IXKTLVSsruN6taoza6IqZXq++erzJz9
 WtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BBDAQ95PzCigF/6scozDwCGoyusjEsB8XZAQ8m0yhYs=;
 b=npOiyN0mO5sHqYZbwHHfJ+GsbU7bfSXCgAlrYVxls09NpDaQz7FmkN6saKMYn4JVVC
 wh/Axlz2K9313x6p1J0k37k+x8g8xelafxqVjl62TNxgiz9TfAVM6zAm0+7xQeRwUZqy
 xPMtVMIinEVweJoIjyEJQMD7MnRCdjzwfNv+y241Dd5u/lRPJrb4hfxT0k4sllESJFuZ
 i+VPrLNpWcpuXhZtDVdW49JudFsC2+2WsRa42THbJ3zjn0czg7NQJOBhDKrlAOuEO9L3
 3N4KoFWFvv40Rc95wU+WSmutcU0WBZG9GL/uEmiw8bldaGKvFSlRamIIvSVD4Xslcq7C
 Q9ew==
X-Gm-Message-State: AOAM531vbMbz5qXNjKQKk7SrpPmq4lkjSI/41RPLCH2PpGWrA9e13AwX
 rho6p1Ix4UrJ/PhLffuLjpBjp+NUekpncfZHVH6oKg==
X-Received: by 2002:a05:6402:759:: with SMTP id
 p25mr5366536edy.146.1624371354481; 
 Tue, 22 Jun 2021 07:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210622093413.13360-1-wangyanan55@huawei.com>
 <YNG44c9KtaiNXT7b@redhat.com> <20210622114634.crjqusw6x6oj4j6v@gator>
 <bc47a66a-b1ff-939c-32a2-94c90efd0caf@huawei.com>
 <YNHalhuNZhMa665J@redhat.com>
 <7fcc5f2d-cc84-3464-15cc-3bebb07f8190@huawei.com>
 <YNHvcQAMLSpVcxaE@redhat.com>
In-Reply-To: <YNHvcQAMLSpVcxaE@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Jun 2021 15:15:18 +0100
Message-ID: <CAFEAcA9X9fYAFAux4h2n00kYpTgxkNcJg6Ako7s6ndU4KWTJyQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Barry Song <song.bao.hua@hisilicon.com>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 QEMU Developers <qemu-devel@nongnu.org>, yangyicong@huawei.com,
 "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3soLWIwrFF/u

On Tue, 22 Jun 2021 at 15:11, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> The QEMU man page says this explicitly
>
>                  For the PC target, the number of cores per die, the
>     number of threads per cores, the number of dies per packages and the
>     total number of sockets can be specified. Missing values will be
>     computed. If any on the three values is given, the total number of
>     CPUs n can be omitted.

Anybody feel like submitting a patch to fix the typo? Should read
"If any of"...

-- PMM
