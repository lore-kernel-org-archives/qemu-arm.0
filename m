Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp505723lfk;
        Thu, 18 Nov 2021 03:41:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyU49C0lq2b5sNXsm0nwrVpWrXIGJJrRpnIXTibzVF/1ZgkZQmSsOKs3N1zj5KiTp7ZbBMZ
X-Received: by 2002:a67:6ac6:: with SMTP id f189mr79825271vsc.44.1637235712801;
        Thu, 18 Nov 2021 03:41:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637235712; cv=none;
        d=google.com; s=arc-20160816;
        b=FuP0aPQKyQDZWrOctBD106F65w8v663dSvqcqT4SyJEApAVMBhJ0NMItpDdVc4YYdp
         T5E5o1NGs/UHdewO+9b49MEsT6lk7PASdSyJBmz04zY4I/AXZ8LA02zEfo1LF50ZTKem
         iz/ncid0p16jzev6DhQqnO4f065UbH2kRcC+IhBfQUqkHY/cuMHkPz4nasNqNkmlqOIM
         aNL3G9WWLOegk7yDecihIxA+7n9LJcx5AkplDLGcbmb9u32sbXj+lmI0AsANQAFWGczM
         Tu2ldkd6nsaCjBLhd0UdruuON8L54//feYNSHAuBEn8g9HXa0Zy3gK1QJMSHu/cNQeB6
         lucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hmmD3UwbI5jKQ6/Gw3BaWFQnhDNOduWpBzKFaxdQ3Kc=;
        b=cHPyPZypUSesT9loDlgwKYGXIVVDUuXBFtPNlU4tCrvl+WH69X9eEFVNt/S/21CKlU
         ZKBeDtsgU+1DwghmnP1Xv7po8XiuklGX64WRAeDApP2VDX1BA/qKMLCh6MMR85RX1EaG
         bX/SyaVyDmj/wKgSycxZcIVhRrFDu+3cNpfSzwN6Q98fphQ/f8aSBmE1m5uxrAJTTdl+
         hnfSqd5DS8kjgV7EzcVHa7ouAN8eNCS5MrQhy0ytjcYJ0PE7xqxmvo7VFKCstP+Wxk0J
         JNzMB7y4TQoO2BX+h8CDuyxVo0CPzS8sp2m0nfgmsJXmvVJItHx5yVZgDH+SeRfm18wJ
         RwzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g6XGaY0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si8510370vsc.112.2021.11.18.03.41.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Nov 2021 03:41:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g6XGaY0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnfnc-0003QR-7c
	for alex.bennee@linaro.org; Thu, 18 Nov 2021 06:41:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mnfnF-0003Q0-4G
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 06:41:29 -0500
Received: from [2a00:1450:4864:20::330] (port=37522
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mnfnD-0007h0-Jk
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 06:41:28 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso7350701wms.2
 for <qemu-arm@nongnu.org>; Thu, 18 Nov 2021 03:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hmmD3UwbI5jKQ6/Gw3BaWFQnhDNOduWpBzKFaxdQ3Kc=;
 b=g6XGaY0G9wu577NYaYwma8UMgzXSxArdgEkCgY96cKsVH8luNYfOsIHPXg9NhOZS8n
 dIMH4/nc4sihgRL1OHT4x9qB3Vk2F4RdEYpsmIAUpfbKroZOSFZzKz8sosX/xI2jDuZe
 9kFCiqMQauWp7MDCzDTu2Lj/G0Pqh1lHyPuF6jq/BXc63gqElrfI85oQL35AFo8H8WHz
 iSeL6++Xl1lZ5yBfcz2bpGjYaTqqYCzhUwk6P0VUWfZYE14r3tf3fS1JtE74Rt67LPE6
 8eTaTYXChgaUYybSlBBAoynImqmqmRrAD+H2JW1NDqoPxQyi0oReY+mXepgHjCepFbDA
 ibWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hmmD3UwbI5jKQ6/Gw3BaWFQnhDNOduWpBzKFaxdQ3Kc=;
 b=2R0WRXGJMY9CRXI6eyIBJ9GnEXqwM3IOpcDpX/9cP0BruZUzdrV2kpRHPTM8fTIC69
 O1FZKTEWveDdmj5JtYAHP/1e8HXEDajqJ8njVV9455AXbU4T5RpXhaiTdEEvhbYWJQrO
 b6giL6O6ZEQRDwTAymkvERRO1CLMjDT8m0nXPxx2DqI7InDSNYLSd8uFgCWBhbzODh8L
 +5iT0RiMRSpP6Xam5j3J/inIRB6wpc3KVOdoGMjHEnLTRctLDkSSBt6wo1mYns3u+ky/
 tgzVEoOi7n5lU9rFkZueP48YvkEiPJMD83DOGi7yIsfuxSGVKQ3x1xgmWSYYJJnxeyom
 vxdg==
X-Gm-Message-State: AOAM5331z9KKw5Bmv9cJBmzVmrZjoSVdkjMmDUP8ipREFWSil+OuV1ZC
 gXUwozu5iMJT4OFMfJ9M/yhR48kxeZHja8RAEQ3OBQ==
X-Received: by 2002:a1c:96:: with SMTP id 144mr9277287wma.126.1637235685548;
 Thu, 18 Nov 2021 03:41:25 -0800 (PST)
MIME-Version: 1.0
References: <CAE=NcrYJfjF-pEiX-tY7NfiTbDfXtcxnk5AnBVwc2AX4cpeCrg@mail.gmail.com>
In-Reply-To: <CAE=NcrYJfjF-pEiX-tY7NfiTbDfXtcxnk5AnBVwc2AX4cpeCrg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Nov 2021 11:41:14 +0000
Message-ID: <CAFEAcA-CKqZPF8A+WsXE7gLgOPPYncteomvMSOcAuLEkB9F-Ew@mail.gmail.com>
Subject: Re: softmmu 'at' instruction support
To: Janne Karhunen <janne.karhunen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5YSox5eGJj0p

On Thu, 18 Nov 2021 at 09:09, Janne Karhunen <janne.karhunen@gmail.com> wrote:
> This looks like a bug to me, please comment if I'm wrong:

Bit hard to say without a reproduce case... You also don't
say what QEMU version you're using.

> 0x0000000100004a3c <at_s12e1r+8>: 80 78 0c d5 at s12e1r, x0
> 0x0000000100004a40 <at_s12e1r+12>: 01 74 38 d5 mrs x1, par_el1
>
> (gdb) info registers x0 x1
> x0             0x0                 0
> x1             0x809               2057
>
> So that would be translation fault level 0, stage 1 if I'm not mistaken.

If you want to walk through what QEMU does and why it
returns the fault indication, you can run QEMU under
a debugger and put a breakpoint at ats_write64().
That will do the page table walk (in get_phys_addr())
and you can see where and why we decide that it should
report a fault to the PAR_EL1.

-- PMM
