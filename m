Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2719982ejt;
        Mon, 19 Jun 2023 02:58:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ529u3IhisnziB5lLQbsFC1v/xzVU5/znTbCyrmgReM66XU2cTnDFrlISpYu/4VJjU0vhEo
X-Received: by 2002:a05:620a:900a:b0:763:9e50:669a with SMTP id rk10-20020a05620a900a00b007639e50669amr1124585qkn.2.1687168732621;
        Mon, 19 Jun 2023 02:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687168732; cv=none;
        d=google.com; s=arc-20160816;
        b=oCGNmuQB6Mhatmy6fy3JomejMH2x3a4mzOlDDUyuUYDjm9wvik/hY3yV/JMlZ8pHZS
         jpb9y6qYCj5f8ZRoj3tq2+DZB8XStygF01NPY5NvkjfJaDnQer3hGWwyHNForxcky77G
         0Puu6x8TZC0M2itpsWC1kr73gSh7bD+jkeJYkeWGpHVmjQ8n6Tnex+fVZtK5sSLHv2Oa
         0H8wJbFFbkHx/9Y+F0bz86kRPxpdr1psM53vVw8scyivCa39Nln+3ViOVEGdMtPvvAQL
         jGQ5hIO+YMrJYUvammrxLZ1fmdT28pGZJ9z6ks6jqTHYJnbTwRWymgYAybTe9oh4SP7e
         CG4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=d6Cd33YmIWOPb5BlraLL1A/gsokAxnp93TpGHJGyiOw=;
        b=kvzsNuWVH2Z0ISBR4IimovhC9sRlqH7Jgzb5J8D9gg5aTSSI1YFPPZsOkly+hOj4Fd
         /8TY/kAaMcMXb2Qm9rjNgGwSYo5KqILf48MhxRy5L/YpG5lgFmIMkjYG9VHpXObwCd1X
         FPQTdGHnU7Zd5HJ8i3Plh6ePHKdlOTOcUrd9h1UvEZ0XjA712U6h88Q0ffwJyIXblc3n
         U4SKofvGO8C924BqWMXyNowqf5j/pf5cCei0ZNWGRhskVswn9UOo2r4tymY2pWAaOZD+
         Sf2EQmHCnidz6+emVYIAsgEw52qT00KtjGTekg0BeCbr59Nw8hWHNPCFVilf+9a8iZrK
         V5DA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a05620a000600b00760983ea377si7444322qki.8.2023.06.19.02.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 02:58:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBBeV-0003NA-2I; Mon, 19 Jun 2023 05:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qBBeT-0003Mb-Hr; Mon, 19 Jun 2023 05:58:25 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qBBeQ-0002Sq-Ms; Mon, 19 Jun 2023 05:58:24 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ql4rk75W6z67ZHW;
 Mon, 19 Jun 2023 17:55:34 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 19 Jun
 2023 10:58:10 +0100
Date: Mon, 19 Jun 2023 10:58:09 +0100
To: Gregory Price <gregory.price@memverge.com>
CC: Yuquan Wang <wangyuquan1236@phytium.com.cn>, qemu-arm
 <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: A confusion about CXL in arm virt machine
Message-ID: <20230619105809.000007b9@Huawei.com>
In-Reply-To: <ZIylkIt38MXaTytx@memverge.com>
References: <2023061615433049315231@phytium.com.cn>
 <ZIylkIt38MXaTytx@memverge.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T6xVhg2GN7Yq

On Fri, 16 Jun 2023 14:10:24 -0400
Gregory Price <gregory.price@memverge.com> wrote:

> On Fri, Jun 16, 2023 at 03:43:31PM +0800, Yuquan Wang wrote:
> > Hi, Gregory
> > 
> > There is one confusion about CXL in QEMU I hope to consult. 
> > If you have some time to look at this email, I would have better understanding of CXL 
> > emulation in QEMU.
> > 
> > On docs/system/devices/cxl.rst ,  Gregory wrote:
> > A very simple setup with just one directly attached CXL Type 3 Volatile Memory device::
> > qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
> > ......
> > 
> > As the current master branch of QEMU has not yet complemented the CXL option/expansion 
> > in arm virt machine, how this example command lines worked? Or here used another branch 
> > rather than master?
> > 
> > Many thanks
> > Yuquan  
> 
> As of today, the qemu/qemu.git master branch does have the required
> patch for volatile region support: adacc814f541af9281c922e750d8ba4b90c1a73e
> 
> however, the last time i tested it on x86, the master branch was
> incapable of enabling these regions with the latest kernel (6.3.x)
> despite that kernel having sufficient support to do so.  I have not dug
> into what the discrepency between master and johnathan's working branch
> are just yet.

Events support is missing so the upstream kernel drivers won't probe
successfully.  That's queued up for merge but hasn't happened quite yet.
*fingers crossed* it should go in soon.

> 
> Last I tested cxl-2023-05-25 branch of Johnathan's fork is working on x86: 
> 
> https://gitlab.com/jic23/qemu/-/tree/cxl-2023-05-25
> 
> I have not worked with the ARM machine, but Johnathan may be able to
> comment on the state of ARM support for this code.

ARM support is not yet upstream.  There are some precursor problems we still
have to solve because arm-virt should also support device tree bindings.
See talk I gave at Linaro connect that includes some of them:
https://resources.linaro.org/en/resource/hM986DSHfoTrZ98UjpvLg1

For now, I'm carrying the arm-virt + ACPI support on the tree above.
There are a lot of things we still need to provide support for in QEMU CXL
world so for now figuring out the path forward for upstreaming ARM support
isn't at the top of my list.  I'll get back to it at somepoint - probably
next month.

Jonathan


> 
> ~Gregory

