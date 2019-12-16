Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4710116lff;
        Mon, 16 Dec 2019 07:42:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqzUhU3Ku2fUExg9JvzaSLdBIGdZcyQDWBrj3ipi/BFWu6HGBEDOskydrAp+X24HCjM5TFpq
X-Received: by 2002:a05:620a:10b2:: with SMTP id h18mr27481706qkk.185.1576510962034;
        Mon, 16 Dec 2019 07:42:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576510962; cv=none;
        d=google.com; s=arc-20160816;
        b=C/5mqXdqofLg7Gkg+bZw/fUkDy2wygNbPv+HXhg7UaBvm3FRx+1tTdaV8trQBg4Ylg
         x9bMkSHUCO2LYiUK4+8ua6uA5sJY8jBdwzeNeDq8Tj5RWcSdG/4SK0ocQO+f7sH1P7yN
         qn8RMSUmcJWPapyy0Z0owfPFNfWUD8pCrdlzIG4Q/YSykSwNlMBKbqnWWVXuNvkmd0Tk
         SZq87gNDO2AVOhIKT88yydW3AwYm9ZVN5XAi5SxW93bEvj/NxXrxwTSjaym2MyDtKBWd
         yuoNw31PXJpbYG+D1NNzi6mA70MIWBAAoGdD2pWAGGJzxw2baYuKCwYF1GFLGNnqVgIE
         LFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=57XV+rnHN3MQjm/YspqhKVtAQ2f35QZqw0JR2xiVzc8=;
        b=gUzWweygffcGJdCIy8Z46EkKc/Ha5ghn6nJSrzPag5DKUnznA5fFrBWO3oWI2yID8T
         Qzw5Ib49V7OGf73UrTZZm86ygkZAOVVqT3+r5ZLXCpOIYk96XvXwTMhWWN5obfGlWTqB
         lUPp3nYQobZ9pGsHHZGlfq5N5E4Wo3ocQq2bgi6SdKw65S5a9SgsUP2DYv8l5kMrsAoH
         JAFJ/sQEVsf/KqeYrZSONhWwmw6/Ym/ob4GsQZ+yiGd4nxdBMk5uopoiN37WV05QbwD3
         2fGaXHKAANUaENAtuL/w32eYPuG7xzEqO0wN5Vfx5AfRt5T+adTQEnx4eiEeEIMP0G3X
         DQsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NPeDDWY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g39si9216194qtk.388.2019.12.16.07.42.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 07:42:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NPeDDWY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igsW9-00078j-DJ
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 10:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33942)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1igsU1-0004Ls-TH
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:40:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1igsU0-0002UD-Mt
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:40:29 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44051)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1igsU0-0002TG-EM
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:40:28 -0500
Received: by mail-ot1-x343.google.com with SMTP id x3so9648983oto.11
 for <qemu-arm@nongnu.org>; Mon, 16 Dec 2019 07:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=57XV+rnHN3MQjm/YspqhKVtAQ2f35QZqw0JR2xiVzc8=;
 b=NPeDDWY8ko/vEj1cI6b65AeL6fJIrTh+dpSfrqqgmJJkUWQL+1nKgFjI/jQT3Ecz1c
 2mPBUUmMfANPMWKx3eifhA88NOBCSuJtvgR67NYP5m36O1oVUU9fHOPinnJvSa540aJK
 CPrprBWuJTqR8yp4W8A61dyMcC9Pz7DbTYQnl9X620DzAdqQ24woflvxohgzUi7ze+Qk
 5eTncjZV1ldp6swPiqTcSFdYcydeVXu1JnM3PzkA6CCvnyddUKftWTQbB3XH4yvLaFnd
 ZjTZ29i7HgqGpzTxQ+4PUY2GdT5hoYpipHBOzhg4dSiQaEKwqOCqeMs1y7cPswFSuT8r
 ys1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=57XV+rnHN3MQjm/YspqhKVtAQ2f35QZqw0JR2xiVzc8=;
 b=ug6+yDBOrVzpDnnMngd3+Pa5mBdAdjORKjkzS2BIl3hrL+VQw9o5Uaf3RLN/dmeXzI
 4p05V6Q+HTJSAyKq2YOUIqlwDAMCeTbZkdzRWca7c7h89E2b0NxhpYvPqm+9QfQWtHw0
 o9ObEJ4jKsM92w1WCT7oW3msea9QY0kDCbOmgqJZxjFkWYng8JTngdyVq+2VyXObtOkR
 FBIoXSK8Z2H0tKKGGch2QPA2SwVtiU6FgOsSZT1e1AjbawhKBTE6DnFMIdhWx1soTvHP
 wvbkndCKimdR267kW4lAVU/wGgz5+A7sZAdov+M7A7QdoMF0pZT3VbjKyI7tMGSBsUC5
 N+aw==
X-Gm-Message-State: APjAAAUnMmHNk57U0IFNTf0Bx0ZR0LcpJGRWyfgsn9KaNxK/YTM6TwkY
 F3Omj645Ki0vHAtD/xTchuNirdotxkXa440pR0iWLw==
X-Received: by 2002:a9d:6745:: with SMTP id w5mr30804462otm.221.1576510827498; 
 Mon, 16 Dec 2019 07:40:27 -0800 (PST)
MIME-Version: 1.0
References: <20191212173320.11610-1-drjones@redhat.com>
 <20191212173320.11610-4-drjones@redhat.com>
 <CAFEAcA_u94O8WYLgB8DF=pu-3V7LrNWpiQFV5mDYeeqLj1Ee2Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_u94O8WYLgB8DF=pu-3V7LrNWpiQFV5mDYeeqLj1Ee2Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Dec 2019 15:40:16 +0000
Message-ID: <CAFEAcA9ZoOZt6Jh42hi6q91=kRM9T9z436J99NF+Ns5KVKUYow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] target/arm/kvm: Implement virtual time
 adjustment
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: bijan.mottahedeh@oracle.com, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@huawei.com>, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HF/N/MYGcOFo

On Mon, 16 Dec 2019 at 15:14, Peter Maydell <peter.maydell@linaro.org> wrote:
> How does this interact with the usual register sync to/from
> KVM (ie kvm_arch_get_registers(), which I think will do a
> GET_ONE_REG read of the TIMER_CNT register the way it does
> any other sysreg, inside write_kvmstate_to_list(), plus
> kvm_arch_set_registers() which does the write back to the
> kernel in write_list_to_kvmstate()) ? Presumably we want this
> version to take precedence by the set_virtual_time call
> happening after the kvm_arch_set_registers, but is this
> guaranteed ?

...you might also want to look at the effects of simply
removing the KVM_REG_ARM_TIMER_CNT entry from the
'non_runtime_cpregs[]' array -- in commit 4b7a6bf402bd064
we explicitly stopped reading/writing this register's value
to/from the kernel except for inbound migration, and it
feels like this patchset is now rolling back that approach,
so maybe we should also be (configurably) rolling back some
of its implementation rather than just leaving it in place.

I note also that the commit message there had a remark
about inconsistencies between VCPUs -- is the right thing
to handle this per-VM rather than per-VCPU somehow?

thanks
-- PMM
