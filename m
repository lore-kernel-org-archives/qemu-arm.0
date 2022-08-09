Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3232189ejf;
        Tue, 9 Aug 2022 09:27:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6RmFobTu50umsW14mCSTRrvGtV5udbIU54afCA8WIHRRzshgrSy04OsvvM5OtNQ7geWCTT
X-Received: by 2002:a05:622a:44:b0:31e:d448:8746 with SMTP id y4-20020a05622a004400b0031ed4488746mr20740684qtw.664.1660062460298;
        Tue, 09 Aug 2022 09:27:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660062460; cv=none;
        d=google.com; s=arc-20160816;
        b=VcIA8GN9Ytn0/FYaQBVjz1vFcvf7wpFBrwMM2QyEK4TcVEvveO7NL9cfKvEsEDpQCr
         b6sVL7MIpBqls39vgi3gKOCuU7Z+RrGuGC2dY5al1g3JXOZdA4CnsTEbTY0+6N8TCErE
         f8p+piLDQb0OZhEM9GmnDGGEcsyoDMk0sHrj+YGhmtPYT/VNVpoTMPe3hAFmL3yFCHmq
         iCmoPR6YiwtU5BoaSA8JEnJJX35owo463LQpU5sOXJO9JRGHKEF+103zv2NAq4qZoF/E
         n6GHVFWVhbrbq+GdvFj9lw6dZjU0dJd4tZXB1WNi15m1tKVXyZVztyqfrg1mlc6xaYOU
         Djgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=iW8cwznzCWOE+04b4ohIcFns0A3hF4rEQqgP0uA/sbk=;
        b=JKqB1hNePVt9oKE2rD07gAS1EnnIZIQr0GCD2Ys5f9ACgt5Zmjs4t2IwteP6h2RYB6
         RUJQyl7N2ivigKovJ5nBmktJ/QuFftbpdtLJr7QihYC172Nl4RTQbVbSXyHSH85wN6rN
         uVGomCO7+DYUNSvjpDi325goCBwxskr2GTSXeSlXMz1b9NSg2DN0p+fkYy2vGV7/QiS3
         D3pO2ZY0CyyZRyZjV5UUv+5psX9KkU24Mx5LRsdnMTNn6tpxnjPdJ4Bps7rP/tH0Aies
         etpwB5X8DVFeAblgUrPTpAl5vsgLKHsoj0iZBLfbyRNT+onp/LOsz+V+iVHaCcJgQc1w
         8u8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s134-20020a37a98c000000b006b5c5138141si2072243qke.709.2022.08.09.09.27.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Aug 2022 09:27:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLS4x-0000dA-Nv
	for alex.bennee@linaro.org; Tue, 09 Aug 2022 12:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oLRme-0007ii-T3; Tue, 09 Aug 2022 12:08:45 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oLRmb-0000br-FM; Tue, 09 Aug 2022 12:08:43 -0400
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M2Hwm10Sdz685PJ;
 Wed, 10 Aug 2022 00:05:44 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Tue, 9 Aug 2022 18:08:26 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 9 Aug
 2022 17:08:26 +0100
Date: Tue, 9 Aug 2022 17:08:25 +0100
To: Bobo WL <lmw.bobo@gmail.com>
CC: <linux-cxl@vger.kernel.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: Re: [BUG] cxl can not create region
Message-ID: <20220809170825.00001b61@huawei.com>
In-Reply-To: <CAGr_yG36GSO8esyO9nn6OeOEN5zPSosEmBHbfYGwqNGiYOh9vw@mail.gmail.com>
References: <CAGr_yG0UrfJAMWta3EkR1F0JZ4j--sig74p6vKL3K6TZDx9YGA@mail.gmail.com>
 <20220808133727.00001171@huawei.com>
 <CAGr_yG36GSO8esyO9nn6OeOEN5zPSosEmBHbfYGwqNGiYOh9vw@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
X-TUID: R8LStKOeJOSK

On Tue, 9 Aug 2022 21:07:06 +0800
Bobo WL <lmw.bobo@gmail.com> wrote:

> Hi Jonathan
> 
> Thanks for your reply!
> 
> On Mon, Aug 8, 2022 at 8:37 PM Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > Probably not related to your problem, but there is a disconnect in QEMU /
> > kernel assumptionsaround the presence of an HDM decoder when a HB only
> > has a single root port. Spec allows it to be provided or not as an implementation choice.
> > Kernel assumes it isn't provide. Qemu assumes it is.
> >
> > The temporary solution is to throw in a second root port on the HB and not
> > connect anything to it.  Longer term I may special case this so that the particular
> > decoder defaults to pass through settings in QEMU if there is only one root port.
> >  
> 
> You are right! After adding an extra HB in qemu, I can create a x1
> region successfully.
> But have some errors in Nvdimm:
> 
> [   74.925838] Unknown online node for memory at 0x10000000000, assuming node 0
> [   74.925846] Unknown target node for memory at 0x10000000000, assuming node 0
> [   74.927470] nd_region region0: nmem0: is disabled, failing probe

Ah. I've seen this one, but not chased it down yet.  Was on my todo list to chase
down. Once I reach this state I can verify the HDM Decode is correct which is what
I've been using to test (Which wasn't true until earlier this week). 
I'm currently testing via devmem, more for historical reasons than because it makes
that much sense anymore.  

> 
> And x4 region still failed with same errors, using latest cxl/preview
> branch don't work.
> I have picked "Two CXL emulation fixes" patches in qemu, still not working.
> 
> Bob
