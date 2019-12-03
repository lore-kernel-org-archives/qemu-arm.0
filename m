Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1451482lfc;
        Tue, 3 Dec 2019 04:42:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqwKcHb0wVXhyYuStXtLsxBf7zYV9QgYy7tbTOXGOpw81XiyPUDvXGHtmTXiTb4JwRCcPzdV
X-Received: by 2002:a17:906:128f:: with SMTP id k15mr5866465ejb.253.1575376974734;
        Tue, 03 Dec 2019 04:42:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575376974; cv=none;
        d=google.com; s=arc-20160816;
        b=OAnTHGkdfoO4lJB2ThOm3guLdcJ1IfYYrIEJqqNah3XMLTkoberkHcHLEMscrlSP83
         +QvczhxCUBRSaskd2Y4fb+lyRwVEjezK9U1mq8gCU6CwXjPeJVl0T44MeCpsetptFvWO
         yYTMe9/xe+83G9q0aTOk8pjKCoz7R/ubKoDl0BDuDgVFiOGC8VYZLqXS7D0BlRrIn2WL
         yIQa1VjCtQOVJ63CC/3aaUhZDUVTJnLQxW5xBcHfjlDAaK9/KAmS6IzDzsTKQG6FMbvH
         h3ywiNWUkPvljhpYR+EJqUQN3R+KvToAGFHRLvY+vLIClG8/WJ7GrSdqflYbK6qJxEEo
         sq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MKJvOkEfZ34CAJyeSQEqqe+6O9N0i3jFJHmwP6kfvBg=;
        b=Y21yH1oKhH3/Fb+htp8kW49KCdPsrJdjnYJW1udILFX/zQJI4uJCzuLJUV05/roFEo
         VpDl1O5qsyhxJfNCAiW/+51UIkrBtYibp6nHJxzqDaXYyNlfZYjBNvTu3Vk2njzsRsSV
         BW8fMERGIbR2JGVxQtuO7YuDL/3O5gsCaoothDdkTwLYIalNUq7Oo5jHsydH3UdQX8mP
         IRBp6Nx/OzOx9dd8jJW3aObJZY+7AuWrEwdvuSdGRpdNEw/2E6unq4Z6BdMunIRj5ScU
         JwAznXh8WvX6GiW3RFx6T3MIOrLCHVpUSMfGoMu5mXaBAEAH/hSbQAEPpyCERLRCp2xg
         p/mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IWypII2U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h26si2100872ejb.268.2019.12.03.04.42.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 04:42:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IWypII2U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic7W1-0006Zv-Q2
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 07:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58365)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ic7ML-0001h2-Gu
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 07:32:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ic7MJ-0000sv-64
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 07:32:53 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46285)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ic7MF-0000pO-Ig
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 07:32:49 -0500
Received: by mail-ot1-x344.google.com with SMTP id g18so2675411otj.13
 for <qemu-devel@nongnu.org>; Tue, 03 Dec 2019 04:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MKJvOkEfZ34CAJyeSQEqqe+6O9N0i3jFJHmwP6kfvBg=;
 b=IWypII2UbWnMhJnLCifQJh4XtShBqP4bmZgHnOBgWOPzdxcrugEn+O5K8yeBh2UzvQ
 VaFm4i7+qa6q+hAKBsQ84MrljIHsDshd7N1YcAa4ui8wvwQNkRlUtx0WhhqP+M4RDUtf
 oUMsWBp7iIJu6O22P741p2wfot/jbuimG1Jj8j9aTVh0C7/cVz5x9wuqRCwE9Gw4VKmM
 7wj/vFdpTE+XihaYMORO2Qg6K4XLnzneksPdoXNIb2jv+QQVI9gRQCy+YS3luTTazVjJ
 1pEOZEOyOvtqtpkcJQNmKNmCKct1GfBFigsJi/6Y+hk8KFxXYYL39ZIc5ekiPd0I00kC
 sLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MKJvOkEfZ34CAJyeSQEqqe+6O9N0i3jFJHmwP6kfvBg=;
 b=twPG7Y4NVM+eKwhkgfGWtNVv0McL1L/bZoeZVGrDph+sLeLlK2YUIzLeQhaob0ZyC2
 7CFft8ItMDy2WRmXnvrU35ujBnmhGJUAv42Q1W6l8TrCW3G37t6354WxflFM8QibWyg/
 wAJC3bCr1RsMZRWXtXHVQrOP0d72gL8naBu/7Xy5Mx4Hnk+wjZvzaHG02KZb5nNrDFYO
 gFMkES9h3G48OB0YNWD0hpqG/JCzWYZIOuuIjqi220o7zNr8355BHeIGM+c5NAOnsLH1
 KvisIMSgCpc+1Z2BDZ7rvxTyKY1X8BbmHcUeg4w9xiSxcSz2Jh1kZ+Ijd1309u7dE0oN
 xpCw==
X-Gm-Message-State: APjAAAULV/WXvxM1wq5keO+iZkC3smpbgTEo4jFXm7qbhMiAyAxqThSz
 433acpy4gzMtBOAWjw7YENFPKpKji8dk8w6AGpBWYA==
X-Received: by 2002:a05:6830:2001:: with SMTP id
 e1mr2649782otp.97.1575376365356; 
 Tue, 03 Dec 2019 04:32:45 -0800 (PST)
MIME-Version: 1.0
References: <20191203122753.19792-1-zhengxiang9@huawei.com>
 <20191203122753.19792-5-zhengxiang9@huawei.com>
In-Reply-To: <20191203122753.19792-5-zhengxiang9@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Dec 2019 12:32:34 +0000
Message-ID: <CAFEAcA8ZRufe+6P1kj8iSc40EEWohjA_FMscxjmNLJrPPQyn-A@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/arm/virt: Add FW_CFG_RAM_SIZE and FW_CFG_MAX_CPUS
 into fw_cfg
To: Xiang Zheng <zhengxiang9@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UOaHWe0HOGfR

On Tue, 3 Dec 2019 at 12:29, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>
> I'm not sure whether it's neccesary to add FW_CFG_RAM_SIZE and
> FW_CFG_MAX_CPUS into fw_cfg on virt machine. This patch just makes
> the fw_cfg-test happy.
>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> ---
>  hw/arm/virt.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d4bedc2607..26a4183775 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1084,6 +1084,9 @@ static FWCfgState *create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
>      fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16, as);
>      fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)ms->smp.cpus);
>
> +    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)ms->smp.max_cpus);
> +
>      nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
>      qemu_fdt_add_subnode(vms->fdt, nodename);
>      qemu_fdt_setprop_string(vms->fdt, nodename,
> --

Is there a spec anywhere that defines the meaning of these
FW_CFG entries ? docs/specs/fw_cfg.txt defines the
device interface but not what the 'standard' keys mean.
I'd prefer not to add them to the virt board without knowing
what they mean and why we have them.

thanks
-- PMM
