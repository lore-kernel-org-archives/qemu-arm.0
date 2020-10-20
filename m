Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4849222lfa;
        Tue, 20 Oct 2020 07:37:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkmatCKiWOoN/AdX/hnzcBn9zairIdROg+nTyA0nFKWXifpw0mXYy8ACCc/AgiXytIEzaQ
X-Received: by 2002:a25:8505:: with SMTP id w5mr4120461ybk.486.1603204634990;
        Tue, 20 Oct 2020 07:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603204634; cv=none;
        d=google.com; s=arc-20160816;
        b=eXFEFGrZrll9w4BDoJJPUHukRDBD645MPpU4bW/WUJD0yzAY9PWFEKW+r/m6t5oYkZ
         1fyjDIOrL/PbhMfgFyuAtWpL2cEfKSydnU9FH/8e0Fa8dv9dbJdmLD+967qBBAl7xyq/
         SKZX3Nsmm8ZmjxE0kDzQzNGlVaQqXNrjVHEXzm1T2MZu17VCtygu12AcbEbnSpM7N9jN
         AN8RArZtk9+QQTtmFlqGQwc/Y9SmTDJEs0OBQIqk7FtuCtFov95rnmVvbKqqKW3W8uLd
         OqCElhS6ah/MPtpOyCUYLNSTBuwTrfn8qPr7FUgzPLKtUr9GIFmJbm/EowczUbAlUuJ7
         Cmeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=keLStt28txwsn24/WObNtsu64O7sm+xQkX05Hs6JSfQ=;
        b=um4jsEP75Lxd4OYkXqiD0BSuTipsnXNX9OyOrt80+pC86E2SVYU0w5FHR4pXBJxzOm
         o44ms0WQmD9QwyGIKj4ul6GuVfjnW4HRGlwCK2WGDq6PKkIW6PRc0QZTHQw9ya2beC9b
         LTLOKdKEYv7Z/JC/hP7pxJ+4hYlLhy47nAzfq0ngWxgGPUrG3ocb7AWedOLuHZzV41DB
         kGl5b+vngh5nMhzggT2hRss38T433sz1R2yKQDA5rRlzoEc7jsYyIJW0zGJzYqFTuaFn
         zbxHR1OEYTqFpvLiY+K+BEjMCKAL0of+mQTb4NB+9WGoT3nWNdS2mJnx8qj6VE4ObsgI
         z1dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DvpMh6du;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si2162978ybk.84.2020.10.20.07.37.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 07:37:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DvpMh6du;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUslG-0001EM-C5
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 10:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUskk-0000GE-1R
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 10:36:42 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:37319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUski-0001QE-EH
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 10:36:41 -0400
Received: by mail-ed1-x542.google.com with SMTP id o18so2101299edq.4
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2020 07:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=keLStt28txwsn24/WObNtsu64O7sm+xQkX05Hs6JSfQ=;
 b=DvpMh6duhdCmBU1347TMe/fSCxQ9nhquOe5KgtAcyRxbI8i7d6TKifwYeHcFai5eMB
 /c6OF+dm2YKbBsUCU4jbYXTbPGvFJ2Mcy8L+cld4simiJqbfbyhg4QpNWHJRfscr0Twp
 CWwizN3Fs0HeUSdiPiE8are3UjWZfMU3DMRzDqCQaubbKmbYTwX1Glhw8oZB9ZsVXZnT
 imOeOx+yRdbLlR5qovv8onTzJJrEDYRzALT/FjjrvGtMrgG5eMPelkkxKLYStkYycpG0
 lwl4mi/BRqwQwimIK+Ok15OwihUYyvZ0uFN/HL8WMfB0U7Pog0xlCLrGJQgVPM+r+ZqG
 eQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=keLStt28txwsn24/WObNtsu64O7sm+xQkX05Hs6JSfQ=;
 b=JFK4gLl/211MQpUmYC8xCbnsb9IS2IRAjx9kUd/J9nFzwpz7BsbC4unGkBMU5X/Gdc
 r8GDCyCTofFOOcC7jYx9f6R+5CenRu/rdRbU3BbcpAj/im9rY4OGJ8OVphdqT/S/Moyy
 1TF9LD1n/7WpHtC0qMVj/jYqCfZbpco9Vd3S9AC6y+WTjIiwguNyD64QAY9uvMo+zZYs
 pDVVSdJl//K0M2yD7S1c9LJdhqyyrBxG1iTHfWbntj9I1BPHzQ4mEhgveW2V4sl06oWb
 823quVDBm2QnLyiYRxZK6n1WmOMA2Hk7v9vvBkDpf3LwvujA/KFdbLH/X21lMcL0M3fi
 VkBw==
X-Gm-Message-State: AOAM531ppO6NzCeeMSKUpNRJvkCin+F1X3GcOJTt+zsZe70rIH/y/lEI
 Y8NaoUrL5KaMylgUgjPm9+kI6KNvHODlUvgYIA1xaSrjwIs=
X-Received: by 2002:aa7:c683:: with SMTP id n3mr3065612edq.146.1603204598892; 
 Tue, 20 Oct 2020 07:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201019093401.2993833-1-liangpeng10@huawei.com>
In-Reply-To: <20201019093401.2993833-1-liangpeng10@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2020 15:36:27 +0100
Message-ID: <CAFEAcA9Kh3nhjRiXD-YBZLoT_o82ZEcRn4NtPmhUpvBSNZGB5Q@mail.gmail.com>
Subject: Re: [PATCH] microbit_i2c: Fix coredump when dump-vmstate
To: Peng Liang <liangpeng10@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Xiangyou Xie <xiexiangyou@huawei.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gTd5JUSuDCvR

On Mon, 19 Oct 2020 at 10:36, Peng Liang <liangpeng10@huawei.com> wrote:
>
> VMStateDescription.fields should be end with VMSTATE_END_OF_LIST().
> However, microbit_i2c_vmstate doesn't follow it.  Let's change it.
>
> Fixes: 9d68bf564e ("arm: Stub out NRF51 TWI magnetometer/accelerometer detection")
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
> ---



Applied to target-arm.next, thanks.

-- PMM
