Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp808306lff;
        Fri, 6 Aug 2021 18:55:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCUnEfk1gZsI1uFe/DMk70YmZthlvvq/ne5/ZWkRoSlSONByIYLRzsvJV1b52sn5liSVeJ
X-Received: by 2002:ae9:f504:: with SMTP id o4mr13296125qkg.17.1628301332455;
        Fri, 06 Aug 2021 18:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628301332; cv=none;
        d=google.com; s=arc-20160816;
        b=QqPN3Wk2blXbF1L+6GM3theMuT3NXAWi07WHoJ4HFoSSgwSG0cvZZstYRb1NtAOgXI
         Ki8i5JhTVxAXZQXoFeFjeA6iyX739QC5bzGmgkT3/sbuvQwDMKdDPL8FjdESv4jgd2OI
         FwbDRSVKTllWGphJggirexQ55yr4vZZj11Dw+gaowKwXWtpg2Ds8UlMPbPRcONWldpmW
         63Q4CPI1guI1w+I0J7XYdwCuLuOlXcJb1mT57QWGzUEoG0lFb5Q61z/AzO4qfzryiQof
         NCcwUCdKRb9F6XtO0j3EJ2tDffatM1a7csTwVfaGfVORx/sqx1HCNrLoiymNL+Z6Vo6m
         wl3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=4cXqB+FTxI5aRyhujQz2ebQvHuahgfa7ioOP30DeqwU=;
        b=NY82IW+Ht/cMCSbdhuNcc+VFGJYmspIMEFHF+ES5kJVNWs4PyVohPzkeGHvSvp7tHB
         yadx1s1AQLTaEMjQPfQHY0AQH9AIQy5S390IGJWVXsOVXPQimGx7FTHFQDJFrwYy5+23
         mbZBSV6oqYAeoSHBB91fmljpVrXv0+0pOYTSXiEbc3hSm5PBhIfEbFSFV855ywCW4tDz
         /1yRgTSPNnkdEwftw4uY0lWc6ARqK9jRHDMdjGcjTx2x1cMv78dld2gJu9UswQ/hU2GI
         H4VrE+UOcKM8SwWXAlL7uZDxFdSrQ1r7lTRXAOEWkQm6lXs2wfd/w+zqNYLpd1g2zVbE
         jSQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=WcyU2x+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si8308012qtm.374.2021.08.06.18.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Aug 2021 18:55:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=WcyU2x+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mCBYh-0000fd-LA
	for alex.bennee@linaro.org; Fri, 06 Aug 2021 21:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1mCBYR-0000fA-I0
 for qemu-arm@nongnu.org; Fri, 06 Aug 2021 21:55:15 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:42825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1mCBYN-00065R-Qf
 for qemu-arm@nongnu.org; Fri, 06 Aug 2021 21:55:14 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 d10-20020a9d4f0a0000b02904f51c5004e3so6652352otl.9
 for <qemu-arm@nongnu.org>; Fri, 06 Aug 2021 18:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=4cXqB+FTxI5aRyhujQz2ebQvHuahgfa7ioOP30DeqwU=;
 b=WcyU2x+Ku4mDuuHInrWlXMpkp9mYBxHIgqPZSRe+sQhG4xpFuGt2hgiqoFtkER70fO
 fzJ3eEoDjnq33rQH8jL+dhyBMYWC9wq7aPcpYZdb8P/yL063exTvlfzi0aNGnVIV0ccW
 6jPmZiC8dm19wxEDr7pjO6dZ16j8T/yE+pc7ACuVPCShBYm78or+zHQZfMgXhckZfkLK
 uxCYnd9X/Hu8nJqH3HQea+VhpBOJd2ev9ptJkv/HFucabaIXu0T8X05nKhv/MJHRF9M6
 LIapqeMyHK8VWpVyUs+7VYQVjbN6BnWkBO5zFcxXXTuJ0eMZXKLseZl/fGByW77LNUPZ
 GrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=4cXqB+FTxI5aRyhujQz2ebQvHuahgfa7ioOP30DeqwU=;
 b=m/ZsExAS9CmbNUqmjpWGA2+EDwuR+JHlLBFRmAXHWEXnZg5+ENAgCWMX+Kc+oC4ZZ3
 Hmj1baY1+NwLLuU+UIV+XgNAP4v1r+87msj2lFuhA/rIoSB3w4D6WNOPf4K/VTDnqASN
 xhd/j2Jnsvc+ZBpQtXZilohw2zXxHK3ELEusk0vckjAI5f4l4vV+cG6eD4gMAt/qifyr
 pjvoDYLe0fsOyNmTv96GXW61s6eFx9c66q6DRuqbi+l0IlseWDcefzp+ZuF4+IVM59wJ
 MWhDYf51nm+hA1R/ZNFQpx+T1vXQmT34fidgMCbK/vrVORpofPLd628DS0ZJO73lYX35
 86Eg==
X-Gm-Message-State: AOAM533pMznJYHY1ATjyJVcQD27TQuQqFk8h/Kk2CMIETTJxLC4dSPp/
 kElsw9prWjAilENWYJVi6IHl5A==
X-Received: by 2002:a05:6830:1dd0:: with SMTP id
 a16mr9271770otj.22.1628301309614; 
 Fri, 06 Aug 2021 18:55:09 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:54cf:2a6b:50cd:9862])
 by smtp.gmail.com with ESMTPSA id s7sm360548ooj.45.2021.08.06.18.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 18:55:09 -0700 (PDT)
Date: Fri, 6 Aug 2021 20:55:07 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Shengtan Mao <stmao@google.com>
Subject: Re: [PATCH v4 0/2] Add remote I2C device to support external I2C
 device
Message-ID: <20210807015507.GE3431@minyard.net>
References: <20210806234918.122457-1-stmao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210806234918.122457-1-stmao@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=cminyard@mvista.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: cminyard@mvista.com
Cc: venture@google.com, qemu-devel@nongnu.org, wuhaotsh@google.com,
 qemu-arm@nongnu.org, maoshengtan2011@gmail.com, crauer@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +gzyndfK4LXm

On Fri, Aug 06, 2021 at 11:49:16PM +0000, Shengtan Mao wrote:
> This patch implements the remote I2C device.  The remote I2C device allows an
> external I2C device to communicate with the I2C controller in QEMU through the
> remote I2C protocol.  Users no longer have to directly modify QEMU to add new
> I2C devices and can instead implement the emulated device externally and
> connect it to the remote I2C device.

I got to spend some time on this today, and I like the concept, but
there is one major issue.  When you do a read, you are blocking the
entire qemu I/O system until the read returns, which may result in
issues.  At least that's may understanding of how the qemu I/O system
works, which may be dated or wrong.

If you look at the IPMI code, it as an external BMC that can handle
async I/O from the chardev.  But the IPMI subsystem is designed to
handle this sort of thing.

Unfortunately, the I2C code really isn't set up to handle async
operations.  I'm not sure how hard it would be to modify the I2C core to
handle this, but it doesn't look trivial.  Well, the changes to the core
wouldn't be terrible, but all the host devices are set up for
synchronous operation.  You could add a separate asynchronous interface,
and only host devices that were modified could use it, and your device
would only work on those host devices.

Another issue is that you aren't handling errors from the chr read/write
calls.  If the remote connection dies, this isn't going to be good.  You
have to do error handling.

There is also no way for the remote end to return a NACK.  That's pretty
important, I think.  It will, unfortunately, complicate your nice simple
protocol.

Sorry to be the bearer of bad news.  Maybe I'm wrong about the blocking
thing, I'd be happy to be wrong.

-corey

> 
> Previous work by Wolfram Sang
> (https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=i2c-passthrough)
> was referenced.  It shares the similar idea of redirecting the actual I2C device
> functionalities, but Sang focuses on physical devices, and we focus on emulated devices.
> The work by Sang mainly utilizes file descriptors while ours utilizes character
> devices, which offers better support for emulated devices. The work by Sang is
> not meant to offer full I2C device support; it only implements the receive
> functionality.  Our work implements full support for I2C devices: send, recv,
> and event (match_and_add is not applicable for external devices).
> 
> v1 -> v2
>     fixed terminology errors in the description comments.
> v2 -> v3
>     corrected patch set emailing errors.
> v3 -> v4
>     added remote I2C protocol description in docs/specs
> 
> Shengtan Mao (2):
>   hw/i2c: add remote I2C device
>   docs/specs: add remote i2c docs
> 
>  docs/specs/index.rst          |   1 +
>  docs/specs/remote-i2c.rst     |  51 ++++++++
>  hw/arm/Kconfig                |   1 +
>  hw/i2c/Kconfig                |   4 +
>  hw/i2c/meson.build            |   1 +
>  hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
>  tests/qtest/meson.build       |   1 +
>  tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
>  8 files changed, 392 insertions(+)
>  create mode 100644 docs/specs/remote-i2c.rst
>  create mode 100644 hw/i2c/remote-i2c.c
>  create mode 100644 tests/qtest/remote-i2c-test.c
> 
> -- 
> 2.32.0.605.g8dce9f2422-goog
> 
