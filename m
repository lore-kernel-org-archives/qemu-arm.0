Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp335079ejb;
        Thu, 1 Feb 2024 08:07:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYVdyay0kmSYQc4obs/Sb6f5lHo0BsD81UpIma6FjfjlwAu3pN0o/d9CVN4D2+ImQz8OPS
X-Received: by 2002:a05:620a:2006:b0:785:469c:3fd7 with SMTP id c6-20020a05620a200600b00785469c3fd7mr2390933qka.28.1706803642234;
        Thu, 01 Feb 2024 08:07:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706803642; cv=none;
        d=google.com; s=arc-20160816;
        b=I9aDOQcf6N+0mw7AeFnOrr1VHzOCIhVxi0Xjeu6Bk0+r0EfqXrOcPlv+4yspK7jxk9
         NZIEaL8vpqAGG1v2bJp0Sz3qzb9OU9zejMYCRo61LAd3wrfwF1XJZqHEOba1PKZN0XsA
         k3Dmb3+k9H0wpuRlg+sX5t59Jmr6y8gyacQdU07e+3Fb0aE6LiNQdBs+VaooJsWjm1y7
         9Uh1igfm7sWxP44jR9SaLsTPoeDokGu5IRYCTRXQpM8Fm8hE4nzAtK7KLOSSFoLJ8IDr
         4IRTOBcU0kqZLoyUsrJ07yg3txZPkanPBAW7zV0tRvSZop8wG3iUlWmSWgy6XqDBc42r
         fcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7m4biepq+wdTrTMcPIx64LKzglwVFghTFI7I3P3BXkA=;
        fh=Ek6zgi+MzMP3HfZ6u1KT9TaFP8+kEkHbzaGw7mkp/j4=;
        b=KtuGnXDbaVXZ9PwB8O+pSH3SIoIRaOx9YO61TYKNUB/Ug+Vep99RSPI86gyEr7KCiI
         JEBtJ94lzkOmm0x8yVb50bkK/ym2t16Y04GoAiQ50Q2iIHACQIpGWv6FIK0UJa+iInfr
         7VgkNTaGQf9BcPqtspIhxGpFCgSqmnUecjCFvWJemit5eN5Fg+uhSNLwzV4WVdq0ZGkn
         9Q76dMsJdKwPfgEO2B3eC/uk60obu9A7X8icdeJnTUc/00MgJ4ROOCwKoDxyXpc1MCA1
         vqJQAUGCjC6hHm4/uollA0BYKPFs6zPtJruaZ3wI+YLWFnmZJZUoiD3dEtxmju6U5FO8
         3TlQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iCnzWQJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCU7gBYL6XUt3zkG3WA2Y3fzX2agBpKQDsa24a4yO+m4HUukD0sq+kWSmVNeCnfaFivltVg75REX0xslmON6XKhKi8ZWGyOj
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020a05620a146200b007840a525515si6031324qkl.203.2024.02.01.08.07.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 08:07:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iCnzWQJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVZat-0005kJ-SC; Thu, 01 Feb 2024 11:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVZaq-0005df-TW
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 11:07:13 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVZam-0008IA-DK
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 11:07:11 -0500
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cf1fd1cc5bso14840421fa.3
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 08:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706803626; x=1707408426; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7m4biepq+wdTrTMcPIx64LKzglwVFghTFI7I3P3BXkA=;
 b=iCnzWQJMgNuhQm26xq9BWNeWTAT4mv4YzOXe8VQeOnaVY0TtovA6KdPTfA6lnNoFQN
 QC9ESTyx04SkquGgEs2lqW5JuTCBdRYfoOwMfYqVd3bSuB5bFdbMJa/cfJe4PM/G5f1N
 yGUXvJLHTTxmyVSGSiBNBUGIM1iospPxlKBjKHt+sM+HTgYpwQMIXoTB3lRDvXIRazrl
 BgUh/pZvvcd7bceXzzV4E9VbXmXX7BLMaXgXIAFco5Ww9sirhn/W1SLCYto61fZk2G70
 tHXmZ3xLtJysHUvq61AMIBTDx9+wtn3OKLswTJXIQjUaQBWNRgRb/O22Q67o5FvDrChj
 dtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706803626; x=1707408426;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7m4biepq+wdTrTMcPIx64LKzglwVFghTFI7I3P3BXkA=;
 b=B7xxcMGVu6B54ugYkHZI8VMOg0p/WNusiEAh0xTwss/0yPjSKxeC37baPXeFA19adN
 i5PryYuTA7qydFJZj6ltzUFWOyQjnxYRec/oRWscJVDn2RCNjASe8t6+wz7caESyz4Kf
 bBJ6Nat6Xfz3BIF4fAxnCy5DZWNnuUwjfBUyGiNsE2z+UjVRWzqU8bnNr1EyL9hQudaB
 Z4/rmayHJWi1+WlXYOitB2+IdQloVpDdOpIVPFFh+8nvqEk8vA4HyZFugKkxFSm/cPEm
 Y7eNNtTp6SZgpnFCj9SlFH+yUFXEOOxTDAOakSRas6mlitgbLhrIIyFQbcIziL7LsVfx
 kBuQ==
X-Gm-Message-State: AOJu0YxSdUrHHE/cgYXmfBGNmfN8qfoXW1qeRdHQUPlz0kt88XET14hK
 N9IEKWnhA8MrFzYwK3kDaQLnYSMRp9v4DcpZ9kpUTx6vkRUbo0fJBGDGWCOugf5QTUQSkmBS99w
 35UPvmAJXniJ7PDoXxo4Imk7ZXhN3UE0tX/0+BA==
X-Received: by 2002:a2e:994c:0:b0:2d0:6a10:e57e with SMTP id
 r12-20020a2e994c000000b002d06a10e57emr4091165ljj.18.1706803626278; Thu, 01
 Feb 2024 08:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20240129081423.116615-1-jeeheng.sia@starfivetech.com>
 <20240129081423.116615-4-jeeheng.sia@starfivetech.com>
 <20240129110823.000076df@Huawei.com>
In-Reply-To: <20240129110823.000076df@Huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2024 16:06:55 +0000
Message-ID: <CAFEAcA80VjwM=uKEXfwtg9SVzX947of1Go2c0ph-r0DeyKbpMA@mail.gmail.com>
Subject: Re: [RFC v1 3/3] hw/arm/virt-acpi-build.c: Enable CPU cache topology
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, mst@redhat.com, 
 imammedo@redhat.com, anisinha@redhat.com, shannon.zhaosl@gmail.com, 
 sunilvl@ventanamicro.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: my7cIZn5B00y

On Mon, 29 Jan 2024 at 11:08, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Mon, 29 Jan 2024 00:14:23 -0800
> Sia Jee Heng <jeeheng.sia@starfivetech.com> wrote:
>
> > Introduced a 3-layer cache for the ARM virtual machine.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
>
> There are a bunch of CPU registers that also need updating to reflect the
> described cache.
> https://lore.kernel.org/qemu-devel/20230808115713.2613-3-Jonathan.Cameron@huawei.com/
> It's called HACK for a reason ;)
> But there is some discussion about this issue in the thread.
>
> The l1 etc also needs to reflect the CPU model.  This stuff needs to match.
> Wrong information being passed to a VM is probably worse than no information.

Yes. The ACPI table information, if we provide it, should be
being generated from the CPU cache ID registers.

But I'm a bit confused about why the ACPI table has the cache
topology in it -- can't the guest read the cache ID registers
and figure it out for itself?

thanks
-- PMM
