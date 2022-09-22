Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp230531ejy;
        Thu, 22 Sep 2022 05:00:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM58wiuu9KZ8+kU8Eos6fcjEsSposY+V7G1eiMWk9rJj7Ocsxf0Y6dNYNnmpmFET776kfvbq
X-Received: by 2002:a05:622a:15cd:b0:35c:c425:bcd7 with SMTP id d13-20020a05622a15cd00b0035cc425bcd7mr2375231qty.156.1663848049493;
        Thu, 22 Sep 2022 05:00:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663848049; cv=none;
        d=google.com; s=arc-20160816;
        b=qTQ+DohJ7nCNI2qHDMxYpnIFxyMo+BVt4QTJDOUq+tTLhXchWcLNgt6DfaHzNOvdo3
         nG3eJ9jrsw5koYEW5RoYuAmUAraLulgsf/NGVp9QYSBMMODxzQoSh8FGT+oaDLS5EnNj
         vlMgF10011WNGy8u+jThSy/toMvZ6x8v3sRl6+v1y2k2WaWwEgdWJYkUQ7Ky2cPDEbHN
         TbyRaJarBHGIXTizLOyjtIJvT6TN8qvCvxs+kxZO1V4hlnoC4E32Hn/fwnlmxgIzQBsW
         XUiBxDLbLPBrbz3v2Iy77ovlGLBnbeNHseMYuCtVyAcDEk2gYfhx86cHmpHujDDo3RI6
         4QZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=fo1pguXh35GJwhNNLgr8GCOVMf6DDqTSk5GZgvqY2vc=;
        b=w6OikM6PPvCpXpx7YbpDDJibBJImbj7V/p3AC7wU0glBGygb4Lc0s0zHJZxn3Wmd1l
         LEZLTv+3QMEbPcf4DZoPyi5XsSzqjUXNpWYmKEMgXsVU1Xgmd4YB2bUx9pW+BpAF1fqZ
         acvZfRGuDZqjVa5w5mVuZ1FBjyKWQ0YxUygdTgsuVh9nQ7XSHL+1NdfvE0fwnmKm3M84
         6hxZ5Nnv7Bx7m2ovjnxcvIneiGIDDK1B5KgFME6bjtFV8LuZ19W5ZKgjFEIQyI7fWSJN
         Q4h0QvLkvJIh71yMSCGoriOagDL+2FKZyKZew5j0P0smJdG57c6IL5TspdczSlv73+0z
         92sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=b+lpv+RJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk34-20020a05620a1a2200b006ce1c482c6dsi3052854qkb.758.2022.09.22.05.00.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Sep 2022 05:00:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=b+lpv+RJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1obKsq-0006xk-TU
	for alex.bennee@linaro.org; Thu, 22 Sep 2022 08:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1obKOK-0004sl-S8
 for qemu-arm@nongnu.org; Thu, 22 Sep 2022 07:29:16 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1obKOH-0005ro-AB
 for qemu-arm@nongnu.org; Thu, 22 Sep 2022 07:29:15 -0400
Received: by mail-pg1-x531.google.com with SMTP id t190so8831347pgd.9
 for <qemu-arm@nongnu.org>; Thu, 22 Sep 2022 04:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=fo1pguXh35GJwhNNLgr8GCOVMf6DDqTSk5GZgvqY2vc=;
 b=b+lpv+RJFA2TNM1Oen1FGhdlyeRW3Be8+C1Mw0KR6DmzfXoVUyHWPcBwYmQhlNZ+ys
 ZQCp5HbsN4Tg5wu97qvSVdXWmPnJEa0vAW8yoWedbkr3W8pB7H73DMvB4MP+mKQKLGfV
 hI0AEC2ATJJPRmIC8voa3Uh4As2XwCsetjY7GAUZQe5TI+sl0pocTWxRJn+Zaujt3dEI
 wyWAPavI8HJTEo5L/wXQeMLr/iDvXwSINraRBpHkuNy/ISU8GLUawxd2MaxJC3Y4tMaG
 xUqrTMyE3/5/ktGPjfmyxJ3Vjz32qJlMhxv/32eQcKOzufMxDbqykr59nHqEKoUhMhQM
 nr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=fo1pguXh35GJwhNNLgr8GCOVMf6DDqTSk5GZgvqY2vc=;
 b=qsHaWQ3Sv8zbAWnDxXt7/laq/pP7oEyFw2sdL6ccMS7Pmetqi/XpsvctNLhPml62Op
 1R9WmYwFZ9BTRyAaPDfYrcnMeZDUNfSBc6zxe9XVOP9jK3MC38i9qmpCdSKzPYaizFhK
 IwVBUgfmqvo6YBqNjTr2Ej8SP8H5NlHO6ADGVtYGi4ireTyG9qo9HOpid3515S/mxGpE
 zXftMbwUxovNOJ7s0mwbHHCGVvKRvta4UqcW6vti3ax4eVlrEnUyfa76SWWtiW6h1B1g
 kFs+PHiPqmZCH8TMDLKQxybIjX2n3rjp6ZjzWnKK0Y6TfeEJDg9TaxN+m5MbevZoXP1s
 E0gA==
X-Gm-Message-State: ACrzQf2D/K2RzSBECVReHqqLJfrEGQ5armTU+zctjwtLnknEHIwwsR0P
 5KGLzDuU3EFPI/zZ5Yvr4rHHPA==
X-Received: by 2002:a63:88c8:0:b0:439:494d:fd10 with SMTP id
 l191-20020a6388c8000000b00439494dfd10mr2596274pgd.201.1663846143666; 
 Thu, 22 Sep 2022 04:29:03 -0700 (PDT)
Received: from sunil-laptop ([49.206.11.215]) by smtp.gmail.com with ESMTPSA id
 k18-20020aa79732000000b00545832dd969sm4213443pfg.145.2022.09.22.04.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 04:29:03 -0700 (PDT)
Date: Thu, 22 Sep 2022 16:58:54 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: gaosong <gaosong@loongson.cn>, Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH V4 1/3] hw/arm, loongarch: Move load_image_to_fw_cfg() to
 common location
Message-ID: <YyxG9qmImWgcT0tI@sunil-laptop>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
 <20220906090219.412517-2-sunilvl@ventanamicro.com>
 <CAKmqyKOZSaE9CYGmYSKOEnkQkGDUkchut+i2mQjcZLSVx-qWag@mail.gmail.com>
 <YyMTpMuQ0UP9Mqaz@sunil-laptop>
 <2ecd4eff-d0a4-a140-5dd5-b4de89040189@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ecd4eff-d0a4-a140-5dd5-b4de89040189@loongson.cn>
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: mLiKfIIBZELW

On Thu, Sep 15, 2022 at 08:56:01PM +0800, gaosong wrote:
> 
> 在 2022/9/15 下午7:59, Sunil V L 写道:
> > Hi,
> > 
> > Could maintainers of hw/arm and hw/loongarch to take a look at this? I
> > have addressed Peter's earlier comment.
> > 
> > Thanks
> > Sunil
> > 
> > On Thu, Sep 08, 2022 at 11:17:52AM +0200, Alistair Francis wrote:
> > > On Tue, Sep 6, 2022 at 11:38 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > > load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
> > > > function will be required by riscv too. So, it's time to refactor and
> > > > move this function to a common path.
> > > > 
> > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > 
> > > Alistair
> Reviewed-by: Song Gao <gaosong@loongson.cn>
> 
> Thanks
> Song Gao
Thanks Song Gao.

Hi Peter,

Could you please provide RB or ACK if things are fine with this patch?

Thanks
Sunil
