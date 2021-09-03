Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1632354lfb;
        Fri, 3 Sep 2021 13:15:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxspNtMMxP79fZjX+lBZRrV0TlkC+aHlAuxhL1DBL+JLJRnPfFCdJLONdOLC22r0r3oUo6p
X-Received: by 2002:a92:c56c:: with SMTP id b12mr501948ilj.7.1630700156605;
        Fri, 03 Sep 2021 13:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630700156; cv=none;
        d=google.com; s=arc-20160816;
        b=ODUNpPSvXiL0AEZ5fAdDW0/M0zRt0fDny6A6a/hFs12nTUt+oUJLDx/sdv7bXRxBnx
         gLp7JTakKrB3uhOHWs0CEs8XzlHocO2zxCU1GUgHxLrt8P/jCXf+lz8EjeFJprSeNh2Y
         m6YhK4+Tst9mNSSPUyNYq5AU3heWWR/i0X7uXVRm5dorHrbbK8Fyo0BIQUXqWGD2kW3z
         mgEzYZkg//9ZrnkBvPOnuvBhLtgDCABcGr868qLsjvNdOTeeifWKkuw/D4JjuWuOqS+m
         idAgOYP9jsj3BgCN749dbwDy/Kkw/RR5AMcjg2AFwmJxkASm7t8ebJHX7k5yieKO8OKa
         URlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=OIdER+ntU5pnE+dAq/LvT2j6xOcRVpXDcpqShg7WpU0=;
        b=bEuW6smizaaCSRcvBF3H8knpn8quQn4clscjIXjALPRVlgB2jIGVz/2GxMDaUR4Akz
         a/4IpvVmzYr5jmlRCFEbHyA+lvEpNLSF2DTV30WhRWwgfcvWjXM26DzZIXSVLUfdTarO
         S2tUqwCM3LLp2qpPmIbtfAFd6PoNIqyb1ttuHzWSDiCTMEYVyu4z91GzgfkJ95JX0EZA
         AbWzQBZC96gn0pHXagExy8kDhaYqD2k9u6bNFjBWeoF8oBzCSwvCQZgEUY9koF5vX73n
         X3JXbXj5+eaemDIyD4bovi0lIaUAKigs21xCptsaNiyMXk9Rl+7IkigiFg+AgYhGcVgd
         tz7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uxvnHzNv;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id h14si267554ile.129.2021.09.03.13.15.56;
        Fri, 03 Sep 2021 13:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uxvnHzNv;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350443AbhICUQz (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 3 Sep 2021 16:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350304AbhICUQx (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Sep 2021 16:16:53 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F074FC061575
        for <kvm@vger.kernel.org>; Fri,  3 Sep 2021 13:15:52 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id m2so97023wmm.0
        for <kvm@vger.kernel.org>; Fri, 03 Sep 2021 13:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OIdER+ntU5pnE+dAq/LvT2j6xOcRVpXDcpqShg7WpU0=;
        b=uxvnHzNv132fzgkc218/R0lqQKuK+t8JtxKc9v7MGrkKPRxDYU93G8sAz5OB0Qa73S
         HE9cI2H2Z0CH+z6tU7HILrt73xJLER1ScmOcHWVCSynT7na5DZ8aQUWZ73RzZS1vzDMQ
         vqeZlVUhDraI2JH+QdE7CnrbM86ihr8OahFggiYzaiiPqr9S9Cooveeavxo3806rUBCc
         wAmH4n70qiWJfcK+7NmYB575D8ru3ANLV2HDRDh0a+ujAxTAi2JXNetHl39JI8em8dQt
         /MjpEL+5e1BeWhbg4mKgjTybiTcJ5pJVRqEATLrqAPvRDkDzcFl9morqxai4fdjaAREV
         wsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OIdER+ntU5pnE+dAq/LvT2j6xOcRVpXDcpqShg7WpU0=;
        b=qQPJ3P0TaBdgeeMZL39l/61mp+9P484fUBcSSe/JhcRzOr8YCW3qibEkYI9Ah9/zV0
         OQGXfSC/BSaJhHO1ouGhDYELEoE1iQPSEEBrUYM4kSTIKriGnyh5NIhaJhMdE5XinNyS
         ooYgrExAfjYZMcsiHk26+pvyXkrZkn02geJAZ0DiL8QcB+mEdUZSoLsddmUqKzrrOKgw
         3TduhELxSa1YNtO5EE4t8qhj8qpTHvqbMDnaTQw3rtPU8bg/mG7E/VK5ZhdeyEYdTn8o
         UbxhISDEtqmtkWpYyfPappsVSyfG2aXOFHAPETs26BtIC/pawz1OkVJ5dcpnuUtiDACH
         6E4A==
X-Gm-Message-State: AOAM530WadDaaprIs2ThepMNMVcjRA++Rvj8SfjRJ271ocHDj8KP/c6+
        f5mMZf4o8dhllDxIe1dEHawtJ7nhKdw4VISjeiY=
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr461323wmh.99.1630700151552;
        Fri, 03 Sep 2021 13:15:51 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net. [2.142.216.190])
        by smtp.gmail.com with ESMTPSA id m4sm353497wml.28.2021.09.03.13.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 13:15:51 -0700 (PDT)
Subject: Re: [PATCH v3 05/30] accel/kvm: Implement AccelOpsClass::has_work()
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        qemu-devel@nongnu.org
Cc:     Bin Meng <bin.meng@windriver.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
        Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
        Anthony Perard <anthony.perard@citrix.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Huth <thuth@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Chris Wulff <crwulff@gmail.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Cameron Esfahani <dirty@apple.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Taylor Simpson <tsimpson@quicinc.com>, qemu-s390x@nongnu.org,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Paul Durrant <paul@xen.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Alistair Francis <alistair.francis@wdc.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
        Wenchao Wang <wenchao.wang@intel.com>,
        xen-devel@lists.xenproject.org, Marek Vasut <marex@denx.de>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Colin Xu <colin.xu@intel.com>,
        Claudio Fontana <cfontana@suse.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Stafford Horne <shorne@gmail.com>,
        Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-6-f4bug@amsat.org>
From:   Richard Henderson <richard.henderson@linaro.org>
Message-ID: <27a1a7f4-10f3-e089-6f37-4eed9542a6c6@linaro.org>
Date:   Fri, 3 Sep 2021 22:15:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: JVL5a/Xo2Q0+

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Implement KVM has_work() handler in AccelOpsClass and
> remove it from cpu_thread_is_idle() since cpu_has_work()
> is already called.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/kvm/kvm-accel-ops.c | 6 ++++++
>   softmmu/cpus.c            | 2 +-
>   2 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
