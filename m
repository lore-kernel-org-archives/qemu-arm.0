Received: by 2002:a17:906:5814:b0:a6f:8e2c:4d9d with SMTP id m20csp50837ejq;
        Thu, 20 Jun 2024 12:05:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU7iVo9TkI/GIhJ+xa0ZYCzSZTgRhhhrAGpMmCVi8hc6eQ8KaKeKUarRYJpTUgpKPPxs5YUqoamYONFtda9zgaxRacOlNHM
X-Google-Smtp-Source: AGHT+IFhUlFPEuVZV/iGeBpFj7G74xRZ8mM08fY4yOtGLTs6734GOL8YWrjUJSx4vSNBW95jq1//
X-Received: by 2002:a05:622a:758c:b0:444:b180:df87 with SMTP id d75a77b69052e-444b180e225mr47509031cf.52.1718910326377;
        Thu, 20 Jun 2024 12:05:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718910326; cv=none;
        d=google.com; s=arc-20160816;
        b=hvHIokJGAIyp/ZavSRMPdoR+3gM5wW0zYvSMh11lbXd/3D7YJzqmAUVZzoPXe1mi/v
         9GE4qElfDFhz4yEwPsKQX4pMxqOf9nr4MqjVwOYXWFGHUeNQGvLWtoZPcoXE2cjJ9DAk
         3Xc+UEYbetNN3VjmtBnvIXDDHQFgwr1CH9GzjLbmUgfk7teMiYrPIDq3/dZ41qf4OQ7R
         DlngffI0/XjP0s+cOuxRbuJlssZqiCe40BD77VCyOGT97UROumW0eFKEr5JOZsUihgbq
         5uvYTuLw9IPs0Ou/TkujdFQ/+x6e9MemdZwq/gT3tgEpomgxt1KsYDi8hLA9FHbwiK6+
         CiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=y0sYh65T6bPyB151APvra6MHPCYMv7NBuOxLgl0Uso4=;
        fh=0rWnfr1AqSNGwRtm52MDp8oV5XC2qCqkj1kRLCPxoXk=;
        b=UgoG8Z0tNfXHJC0CtvY8Re1BgDrrt8bpJY3E+b5fgTcGbuQMV8JIBAvEEz9ySkhSB7
         LJMX29Aln9XqGfaJfAB2Mi+M8kHSDO57UgoP4Blkw0SKd/XGjixGClkolJnoUn3IRprL
         QQ7VL523z9xt01AeDI5TLUceavHPwzxPGqhQA2WZrU0dD46u1XpYvePA+F7jFD5G0udI
         D7ZqJjz14uUkTUKddRttgl96kVCeqJ9bbwVU9hwaMtEbgJulCO2thXHxWnjAWqeOjSZv
         SAzhO6l8JBluwNxdgj1MBbshJnl9j9jAup4/otfRwTDVphl9l9SoUS2/nYhpd9YXDDny
         yO3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RaOAozkW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441f2fba108si171886771cf.393.2024.06.20.12.05.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 12:05:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RaOAozkW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKN5x-0005yf-Vi; Thu, 20 Jun 2024 15:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKN5x-0005yN-AU
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 15:05:17 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKN5v-0000pv-Do
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 15:05:16 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57cb9efd8d1so3862092a12.0
 for <qemu-arm@nongnu.org>; Thu, 20 Jun 2024 12:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718910314; x=1719515114; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y0sYh65T6bPyB151APvra6MHPCYMv7NBuOxLgl0Uso4=;
 b=RaOAozkWGMUzUEyXW5R7eOJzFpn++EbcJ2US5HXxqNq9mARrOj3/BAMMirMxcxYtF/
 XWdr2r0rLlv9lXQ1yvG29zscjl2sln6aqaIJHKfSeU3d3axL/VheZef8sBmnuiQ6pMpg
 nj+b1ISidlEOQeBZptzl9zv4TSzTsdWcfDWt6yfsOY6IGZEIKJlQSJJweS+cTuAScTWK
 BHPPfQmrIf9BYLH+OCvNJHvRv+OolenVN+WD4LdPJOdJmoafMnsYKXlv4AtvX0reRHYX
 n88b1q96jWW9z8SZ4U6I7FyqigQ3nbWhZsEtTCEAD17xKKz30dPO0T5Gh1/lu0XEptEx
 iv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718910314; x=1719515114;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y0sYh65T6bPyB151APvra6MHPCYMv7NBuOxLgl0Uso4=;
 b=f8Le+R/x/XU79b83FXW2bt5UM06K6XNEysufSOJZtLKp+EjbFjZ5KzHkRWiB64N4si
 uZBIAXJT0AqNUGh7eUAMLLmo87cwTtr7niOazpeG2SY9EVoV/CQzaL7r9esgOtpkKzZy
 e29PNkvVfzhgJHzNl3alKHwtIhMTZ8EML2KYvS275KDbZVHFSSRhFehmx+Ik+pU8FnG1
 +brTGh+f1hQ4jjunkJZB6VSICH0ZqX5ERat3NqKSL8cPW7WHDwWzy8aZACmI9wsGZtYn
 5MzP7zvDA53nWG5/e4yh7XnGttAbEFWP19iQFnGKiFQk9BSVXY5PoMWjRKJ9PtBHAjxz
 iOsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMfGD9vVZK9gw1F3SUAqdphF5T9bSGaJhq6Tf2gWYLJ1G7W5M5deQnpoNaQTjUF+Iem8P7pFzFhmVhq1Ljgaz+sdPH
X-Gm-Message-State: AOJu0YwYyjdb7oA3G9ZpnsB5YOAap91OYg5Xw5rdYl8lMgr53SVnqOTq
 JldxouKRsXojPlcMDY8idtUZFpHSBkwxnDfVq/DbvKN0nBy4EuJ8uRzD2hg2id2iysaZ8ZEs/wC
 t21OG+mqnf9pXvyaI7jmtTxPuXAiOA9jPK99YUMlAasAxaw/w
X-Received: by 2002:aa7:d1c3:0:b0:57d:3df:ba2d with SMTP id
 4fb4d7f45d1cf-57d03dfbc1emr5212756a12.2.1718910313669; Thu, 20 Jun 2024
 12:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <CADueUgQh-=vmoO9kqL589Xeuf_LOM_K2Rr-rBxwe8iArdNdzsA@mail.gmail.com>
 <6b1daa9c-6f37-4edb-86d4-782941f1bcca@redhat.com>
In-Reply-To: <6b1daa9c-6f37-4edb-86d4-782941f1bcca@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jun 2024 20:05:02 +0100
Message-ID: <CAFEAcA-Yda=XXspi49Z+-7bmBP-DzL2kFMg_XfNxMviHuAX18w@mail.gmail.com>
Subject: Re: How to use designware-root-port and designware-root-host devices ?
To: Thomas Huth <thuth@redhat.com>
Cc: Arthur Tumanyan <arthurtumanyan@gmail.com>, qemu-devel@nongnu.org, 
 qemu-arm <qemu-arm@nongnu.org>, Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EwKynmJY+IoQ

On Thu, 20 Jun 2024 at 18:34, Thomas Huth <thuth@redhat.com> wrote:
>
> On 20/06/2024 10.28, Arthur Tumanyan wrote:
> >  From the other hand the device is declared as non pluggable:
> > dc->user_creatable = false;
>
> Well, that means that you cannot use those with "-device". They can only be
> instantiated via the code that creates the machine.
>
> > Can you please help me to use designware-root-host/port devices ?
>
> It seems like the i.MX7 SABRE machine is using this device, so instead of
> "-M virt", you could have a try with "-M mcimx7d-sabre" (and a kernel that
> supports this machine) instead.

Right -- these devices are the PCIe controller that's used on the i.MX7
and i.MX6 SoCs, and they're automatically created when you use a machine
type that uses one of those SoCs. The "virt" board doesn't use that
PCIe controller, it uses the "generic PCIe bridge" TYPE_GPEX_HOST
(and you automatically get a PCIe controller when you use the virt board).
You can't change the PCIe controller type of a QEMU machine from
the command line, you have to configure the guest to use the controller
the machine type provides.

thanks
-- PMM
