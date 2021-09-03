Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1633385lfb;
        Fri, 3 Sep 2021 13:17:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHWUzZ2xHAqTXsAPvXpVn5+IAJPU952cvGbhAONk+Z8VfHknawNau+dyoAln3t8vqGpU1p
X-Received: by 2002:a05:6e02:1353:: with SMTP id k19mr497268ilr.157.1630700247556;
        Fri, 03 Sep 2021 13:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630700247; cv=none;
        d=google.com; s=arc-20160816;
        b=X6YeRJoPWk8WxcapYcdV1HmPWrYr4ypDA8uWEIyfZzq7WedaMUNfjuPZhRLeuOwQUZ
         KqXdHFcT8VfjttS/ZK4TGORiUS7LllSIjdaRbQb2a9CUydIJurCMFNb4NrqPnIuTDEJu
         Dpy9CBi3tFZfKgca/ngtLSVeZZy9Ykhd2xm63ZLjdfxNGycMof5ogaIZ1QQHGEa5Lbcb
         esEacuKwymrUH1YlqhTy/UIPm14gFwyCDCmGdoia0pIi4AvlOo4XI2BsaUlfWfLjjsJF
         bjSAwr0ou4/F+vVLTDv75rS76JzaZbMtBzGV3GoY+JwVqbqVTsEX8Knl6TuMMglO72/h
         XNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=Q8RRtCMhTGBNat58ZoO2h/0Fc8GkNe0Oprx1Qcmt+DQ=;
        b=rhmXxuEEhS7bdnWg+0+gqNcjjvIWySn8YmpFkenn3V5HRP2GCCw1sSI0YVYZqgthre
         N8OPIK+wqAC22mxEDkKpZfVZJkmu3QDw76WzLwmQC5D35zSLRtXC8Ygi9YWuTAI5ha4k
         slWy0/rX7bLbI6MB+L12zXsZvMmdclwtB7I6OTAYw5q46bfW6k0wkvRgp4LfxJZd+b9x
         FsPhisjcERau4lYZ3DivIxQwwZKLov0m0JtZrR+VD54gO+4EIIi6DeZWrahOrtPhw1r2
         y9pCuk1OhbioclMAXpMAN+IdwsrE+12C9dbkMIg6vFLu/XFyhgCrHXu8gC6inS+l96ow
         6xKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dwmv1KqM;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id h14si267554ile.129.2021.09.03.13.17.27;
        Fri, 03 Sep 2021 13:17:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dwmv1KqM;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350167AbhICUS0 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 3 Sep 2021 16:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234379AbhICUSZ (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Sep 2021 16:18:25 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1E9C061575
        for <kvm@vger.kernel.org>; Fri,  3 Sep 2021 13:17:25 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id b10so369331wru.0
        for <kvm@vger.kernel.org>; Fri, 03 Sep 2021 13:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q8RRtCMhTGBNat58ZoO2h/0Fc8GkNe0Oprx1Qcmt+DQ=;
        b=dwmv1KqM52aR7rH3nFosWXsm4FD08tdhGNndv5xGMzStvCDMhzyZVE8JBIwPUqwq2F
         bCLRGHMXtpcQxrFHLNsfcJ75PuxEZqI9fgeJ+R64/zxYVNYGjwzAkdzQcnV1G0aiGJeW
         LTJZC1LjtZnsolxgQDMU0UUFNoUHXBPLt2RyL3DgdCqDzCR5fV8RIduiPWvrI4huqI2x
         14xoPIKRj+tYSoQLnz+qpU2iP9/qF7o+j2jiFMjWkvX25zBXsZzxhgUCz6Znrep8fiq8
         IBBZaGnjNh2PebWfRMYGVTv6N4GT+lZ2aNLKT+f0rlGZl04V61ntDZBBZCMp6HS8v9vZ
         WEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q8RRtCMhTGBNat58ZoO2h/0Fc8GkNe0Oprx1Qcmt+DQ=;
        b=BxmngpsCUf9GXjREevtRg6ebqu09r1I90opIJzVH3alJ+gy16nqgDIg7XUj24WTyP5
         eMr65GxoLTBdf0/URYitAkq6qkrPDh3BNqWfP0iFbyL8JUGwOqH/4nS/lXUBGorYaU5+
         lUGKxmbXUOGEz1gJznFLsvQr+SnDDdE1/ETr9Njdl81WkaIQWSLTq00UVjGtqVrb0ftF
         pAN++1qtEyTRkSSdX69Bn3rXR5ZPIVmUm9p8pXxy7Loz3uQuJMgJOk0+ux9KIKqAD49w
         KwJ3MsmwF1cezxhmcjJYY7O/nOZJgmmBUfDApATJVZdUrpIk+yuMm6lNBAu/a1+ldJJm
         iMuA==
X-Gm-Message-State: AOAM530nQZjw1CQzFngw3cYoxy2dmpfosA6x9dRD5MBpPRaTERAVRp4q
        tz47/j5g8DJYSp84B6zt7NGtaVYf6up/TnnimHE=
X-Received: by 2002:a5d:53c1:: with SMTP id a1mr784175wrw.209.1630700243751;
        Fri, 03 Sep 2021 13:17:23 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net. [2.142.216.190])
        by smtp.gmail.com with ESMTPSA id n4sm212131wri.78.2021.09.03.13.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 13:17:23 -0700 (PDT)
Subject: Re: [PATCH v3 07/30] accel/tcg: Implement AccelOpsClass::has_work()
 as stub
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
 <20210902161543.417092-8-f4bug@amsat.org>
From:   Richard Henderson <richard.henderson@linaro.org>
Message-ID: <618da04b-c9e4-bd22-d527-412c3fd31386@linaro.org>
Date:   Fri, 3 Sep 2021 22:17:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: y3moIaWc2feB

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Add TCG target-specific has_work() handler in TCGCPUOps,
> and add tcg_cpu_has_work() as AccelOpsClass has_work()
> implementation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/core/tcg-cpu-ops.h |  4 ++++
>   accel/tcg/tcg-accel-ops.c     | 12 ++++++++++++
>   2 files changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
