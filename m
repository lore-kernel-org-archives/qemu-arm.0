Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp329013lfc;
        Mon, 2 Dec 2019 10:24:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/3HvMPK+pMyaSwye8GCZ6l5HE/pMjPZtOQAB8WE3xUzMKWBuqoC3gFpMSjD/qTznr/ZV7
X-Received: by 2002:a17:906:2893:: with SMTP id o19mr637254ejd.32.1575311050556;
        Mon, 02 Dec 2019 10:24:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575311050; cv=none;
        d=google.com; s=arc-20160816;
        b=wjv7I9de29KTSyeNffHq+cpKhar3iqxyvtibVTLU6bgMoGe/92T5inb5NuOkZZxsCM
         udxa69Rl7hw+MnI/iSRc13ogBt/1rQYJ0CH87ZWtKDqkqaxN8ysfTnNc+UUB7d8NUVgf
         7uujRa1jZm74pBV5ufWUiJYIuF1sFqqxapl5+tUE/TmI4yHjrSNdPRG6MzVuMOe6qpHK
         ISD61dZBfKuH5s7tPF1x3OedsEPAZowetmGplQcTAJLlgGKHiO4nCR2AUu0N16JVHi1f
         hByWFXGllJl/7MPbM+3/HACdYqclDUMN39XAGDqfzlzy5SixHtUFSM1lEynP8odHchWE
         2smw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N6tE3Gl+YL/gnN9cI/JoRh0/ptDCZUGoGmUrLUqtfPA=;
        b=SjeUUZ3kVRfjCV69+s64SWzef62besWcnJ0qZUKt55FV1NfPccULbuz69vLoxBIQrU
         nT6D38kBYELQUo+byrXC7rEd5QgVrlOb/WCHw9+ziUaRkuTfJ4PEGYoZy0igPLuPT7CY
         BcUkoX2aTL+Qclich0LRXq4WzNk6tRNFlOztibgaihnoXr3+0cscjQx8WJ2sN7Q5tgz4
         KE48Hq0X6Z+7dqx9DN0AHTR6P+RKnF+2aGWdaELyz5itlvkAPu15/CVD85pRybZ5dd1p
         tTpVSItQZWiXe1rcICjwi2LgktrI/hYrZGndmXRpDaiikDK4rrtni1rtCXaglB0tN/24
         E9ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIoVwB+g;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id n19si243806ejh.172.2019.12.02.10.24.10;
        Mon, 02 Dec 2019 10:24:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIoVwB+g;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbfLBSYI (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 2 Dec 2019 13:24:08 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37338 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727644AbfLBSYI (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 2 Dec 2019 13:24:08 -0500
Received: by mail-oi1-f196.google.com with SMTP id x195so578774oix.4
        for <kvm@vger.kernel.org>; Mon, 02 Dec 2019 10:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N6tE3Gl+YL/gnN9cI/JoRh0/ptDCZUGoGmUrLUqtfPA=;
        b=KIoVwB+g2xZRTRyivQl3lHKbHqDW7+fKT8JSbn9ycCIo5oC/NPXK98bIBiUDDtDmza
         CoLmCMwYaDlZMdg9wSmfCPNXy7UgAG4OUuggUlpiFbj3DZ689stO+gTD5I4pj4xea15t
         AB0ilFOUVV9UKBw/o5jiyrMKzPHp2W8Y4OHxM6j1dm3uFVJd14rpbrTsVetvVhOb7RVJ
         qN3E8lvvNc6DTa1LaUWkIpjx5iafhUyPevmaZIC8pTOg5dhlEMB0WHXW6WrQwDwlr6eE
         yD6/71+fz9AjiqA1MIVaqWd06m2BPuScvbh5hggXw+ia9dQCg/4q84kAX4Ov+hHkvmKp
         GR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N6tE3Gl+YL/gnN9cI/JoRh0/ptDCZUGoGmUrLUqtfPA=;
        b=r57HFfJhHU9rtOkWjkCR1IfgdrxnQj/v7HE5uSS0mnnh7AASEpA6ENnTc4YHO9+qLN
         2O5Hg7oQgLgBOk88xtba7H+nR6nJkq/R+1DkqG4w1VqAsXGNdHsYer+PCKveYdYF6bJq
         mSlQHvq4Y3l782IdWulJbHF/nT6qQplhTcBKqwMr2bLgICVD3EkuB3VrYauuflLZvmAh
         /mhnVGjDl8qB35PvwiO2r7WmfpORgukp3LunWlKi/RvUDb8CEixOtR6EeIZ0a4wJn1my
         A+zh+27oWaIM8JNQ6BRVAYQ0U5oI7KImRAiYDQW22/tbotP5LrX26uUdD1fCXaSqk1hX
         vuIw==
X-Gm-Message-State: APjAAAUeWKzdyrnUvnC/YVk1n+E1hFQfZufQVN+iBta8nXjRahbLUROD
        cALxvqSM9dHjM4jZZbRa2WGCxgiX1EkEY6+PsRMVTQ==
X-Received: by 2002:aca:f484:: with SMTP id s126mr349470oih.48.1575311046960;
 Mon, 02 Dec 2019 10:24:06 -0800 (PST)
MIME-Version: 1.0
References: <20191111014048.21296-1-zhengxiang9@huawei.com> <20191111014048.21296-5-zhengxiang9@huawei.com>
In-Reply-To: <20191111014048.21296-5-zhengxiang9@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Mon, 2 Dec 2019 18:23:56 +0000
Message-ID: <CAFEAcA8Bve1TF0VdDJExx9AoWbhNPivSYzg=CVba_EbdRoaECQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v21 4/6] KVM: Move hwpoison page related functions
 into kvm-all.c
To:     Xiang Zheng <zhengxiang9@huawei.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Laszlo Ersek <lersek@redhat.com>,
        James Morse <james.morse@arm.com>,
        gengdongjiu <gengdongjiu@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        "xuwei (O)" <xuwei5@huawei.com>, kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, Linuxarm <linuxarm@huawei.com>,
        wanghaibin.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: f10BOV6IpNl3

On Mon, 11 Nov 2019 at 01:44, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>
> From: Dongjiu Geng <gengdongjiu@huawei.com>
>
> kvm_hwpoison_page_add() and kvm_unpoison_all() will both be used by X86
> and ARM platforms, so moving them into "accel/kvm/kvm-all.c" to avoid
> duplicate code.
>
> For architectures that don't use the poison-list functionality the
> reset handler will harmlessly do nothing, so let's register the
> kvm_unpoison_all() function in the generic kvm_init() function.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
