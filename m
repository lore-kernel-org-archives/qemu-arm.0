Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp216009lfb;
        Tue, 5 May 2020 09:20:22 -0700 (PDT)
X-Google-Smtp-Source: APiQypL1M7aF/bHk9Es4YMYf2ahc78yHagZJyYDtxETgqkqBSxm8khaMTxHOQUdtnkFNhH7sbjch
X-Received: by 2002:a37:98d:: with SMTP id 135mr4073125qkj.377.1588695622297;
        Tue, 05 May 2020 09:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588695622; cv=none;
        d=google.com; s=arc-20160816;
        b=P9rxZFLEataSx2N7zjP9SjJ1QF6jb2RktQ1A43Vx7aNw4jlwFky6X96cmzTf/1/Ly6
         X+aGF6hvZzOLvh/zxqhLbCtl8mLG7MFgbb5VPDDPBd8AgRBgvWDJDFZeHrP3YXyLmGdA
         9oUcRUr2ji9engCtAGiQUeEnsCur5fpoJIeWtRPoTIJO0ksMkJGnqGhPWEtUGR7Kgfc2
         fH1rFSbWhL1e+U7150doTM6A/+mxEvXVcVSwjwg4obmBcxptU3gY/VxMmHECaYW+8J3B
         GE/+adGyczAOIQ6nKYfJ6bHbhgHyVEV/NlRZwrde7fT5cdCrqH64rK2iTF+mn0r/sYL+
         qqog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r6Bjjvzb6Ki8isabF5JpTLoDnvLql3rNKrGvEOuF64c=;
        b=Db3JkVZXXeqPD8rpbRn61nsP++TD+W8mdL8KFpJqLIQQeoQSImpVq0V0HMckV/CZPm
         RJKl8JuXTLFDg8mPiWn73DV0ZX6HPubyHfIHSo+W6ptYnN0ZPh7ouxg6p6JLg8zG7fN9
         J17i04Ue7buzH2iN1zB8R+scMtQvUoiLxQ7rDn/NzdN+N8v5V0Q3u1AGCbUdn+OZ5edh
         wwdEm/fZMEJ2ObvIjXKfYobXXB6rhb9ZWn36PPHbI4wXP35SQByeT/0Zwmj0Z6qApoOk
         29OWblFJNDsY4c5TwzXKOpCnMW6VNP+kFIWTW+j35Ct5uuqLNRHh9KetH8M0DtTIJfgV
         YkMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b=2tTYkSuR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id x7si1441305qkn.142.2020.05.05.09.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 May 2020 09:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b=2tTYkSuR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:33278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jW0Iv-0006pH-MG
	for alex.bennee@linaro.org; Tue, 05 May 2020 12:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1jW0Io-0006n7-2D; Tue, 05 May 2020 12:20:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:56082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1jW0Im-0004en-7n; Tue, 05 May 2020 12:20:12 -0400
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 117D320746;
 Tue,  5 May 2020 16:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588695608;
 bh=r6Bjjvzb6Ki8isabF5JpTLoDnvLql3rNKrGvEOuF64c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2tTYkSuRwZlGqBbU/w1inP0ExvS1mR7PTs06XVXMO0KXecK9pCnjT0kUqFkwNh+CK
 3pgmmg8XQQN/huH0lt6+cSmywJ7tMdF45vWT/No1n0Kfqy/oYA4WVUrsAQr+5IsKgu
 ucMYPcFG1Lsm+eW/BnBTzTpR+EXCojzLB7i3HzjI=
Received: by mail-il1-f171.google.com with SMTP id m5so2792846ilj.10;
 Tue, 05 May 2020 09:20:08 -0700 (PDT)
X-Gm-Message-State: AGi0PuZTFYsro0NbRxKJjoyTzdFZbUKV5vg4WdSIpOB6h73a+BJqohd4
 OKLOLrd+Espphl/4cpwx4Re/L5l3h2tGzyR36UM=
X-Received: by 2002:a92:aa0f:: with SMTP id j15mr4522559ili.211.1588695607461; 
 Tue, 05 May 2020 09:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200505144419.29174-1-eric.auger@redhat.com>
In-Reply-To: <20200505144419.29174-1-eric.auger@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 5 May 2020 18:19:56 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHKLg8ySP5guG+ZnDCrmzqKuJW_rs7n9vZqtTwEZmWMgw@mail.gmail.com>
Message-ID: <CAMj1kXHKLg8ySP5guG+ZnDCrmzqKuJW_rs7n9vZqtTwEZmWMgw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] vTPM/aarch64 ACPI support
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=198.145.29.99; envelope-from=ardb@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 12:20:08
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 gshan@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, marcandre.lureau@redhat.com,
 imammedo@redhat.com, eric.auger.pro@gmail.com,
 Laszlo Ersek <lersek@redhat.com>, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JoNR8bzL1Wwf

On Tue, 5 May 2020 at 16:44, Eric Auger <eric.auger@redhat.com> wrote:
>
> Those patches bring MMIO TPM TIS ACPI support in machvirt.
> The first patch moves the TPM2 ACPI table generation code
> in the generic code. Then the table is added if the TPM2
> sysbus device is dynamically instantiated in machvirt.
> Also the TPM2 device object is described in the DSDT.
>
> Many thanks to Ard for his support.
>
> Tested with LUKS partition automatic decryption.
>

Thanks Eric

Tested-by: Ard Biesheuvel <ardb@kernel.org>
