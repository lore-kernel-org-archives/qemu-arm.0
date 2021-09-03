Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1632873lfb;
        Fri, 3 Sep 2021 13:16:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9YLOiFo4c/2seCFZUzrikbsXt2yD6gsnrVyzFLVsRiDFyhcxB7vN8Obkv/qLEZ+AFAOXT
X-Received: by 2002:a05:6e02:144:: with SMTP id j4mr506527ilr.75.1630700204774;
        Fri, 03 Sep 2021 13:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630700204; cv=none;
        d=google.com; s=arc-20160816;
        b=NyCqUgQ+1zk9x/deqgHGp/wS8uV2w4M2ii42pZvAnOM9SSMnIxjIw8iSjSLfMKrSfF
         NO5o/KzvhIjyBEA7YYD1kUHaHCRwHcYrpCb7WC4UxkHowmYpfk3IUX70tzwBtrzX25iS
         h2hZnF7EQvqOkq4TegOXMTk8QC7swFn01BEeqwJtzHbUtCOV2OUCJCIwVUpswMigPFAB
         4aZyeqWm0q5+Gz4W1oKpsgWma5BCvbC7uP3KlGH3U2i34HZIussnDEA6FpiPe74nYHf/
         B57qlIpquvYRAEuJ3etUc9O7wzooFb0g217xLhDwpnAH80FdsAKyTW9xCiy5kgFocNzn
         HF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=ksvR3vXBtwALfl0I6bUYOq6zF1YdgeJMV8dFDRL1P+g=;
        b=m+pKF7Os/V87AN1kknIZTIzQN4QWm5eU71fJ1ot2hf7BeDxfHrc/FFjVEKZCWY+DMF
         48DdJa6WEMQMittY+PBTy6bVvo61DYMgr3VJImerxo87YuLCX/hy9+HvBNNBl/bqV02i
         s+fop/JHUfpgZXqXNIjPjISyB6KVqhq8Zk8XbqoNlHQpmtWGN+mUFvANoPuKtadQ3Om2
         VTCtWFhoPauA9EVdrhx1lgAfKqIl+4pxEQxJO1GMzbilo1l00s3xruMCE/Zw0hkhVsL9
         +MnJ/GRMJ2H9xIIpJehHQoanyG1FSN36AdBD+3CYRI+4bZNyPbTZ9k8yzXRZ+RNmQhHw
         qVEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F+LmEPrS;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id h14si267554ile.129.2021.09.03.13.16.44;
        Fri, 03 Sep 2021 13:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F+LmEPrS;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350030AbhICURo (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 3 Sep 2021 16:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234379AbhICURn (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Sep 2021 16:17:43 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB08C061575
        for <kvm@vger.kernel.org>; Fri,  3 Sep 2021 13:16:42 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id u16so316739wrn.5
        for <kvm@vger.kernel.org>; Fri, 03 Sep 2021 13:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ksvR3vXBtwALfl0I6bUYOq6zF1YdgeJMV8dFDRL1P+g=;
        b=F+LmEPrSCssgf1eqjM+WBloAvOVq2tL7NMyM6LZCHirhU39DXiDO2uLD9ug3iNaHCK
         qAQxo2bwgbel/l5ZzJa4uPRl/EqjN0sQA7XIe3XklYehe60QyUJs5qg1vnpnfs/LYzJ8
         F50mpECSrD9JTS8cWWsDSVPn2dEFp7h2GfA9zAOn6e5EfN/aiCylKqANnhUX+0GyzxMA
         5YbCx/uH9oIK3BVZImpikPWK6g5wC7VESYux9bpW/knmD2hNngQDnsSLtz91Hsh54IH+
         4JT7IufJEjtYH/tbJ32xqBZvfx5N5H001O4TnBoFg7L9NuRj3KiL2d3ZfaMPEXO0z6EN
         fEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ksvR3vXBtwALfl0I6bUYOq6zF1YdgeJMV8dFDRL1P+g=;
        b=YKKwS/feDNeNuPIM26PlmrSKLu6enkiq8zXTjflLAV1TmPZe4HYvSUX7AKJpCWrzHa
         pshEW8vmWWGkBSVsk4Nd7cYU01InM2zFA5Q+RQNR1zRW5HTHxpUpYWtQOoEdlQp8Es7J
         7VBzGMYUwJTLyysaVhdc/YcIJm3sQGTfud1uMt2KkVk1zZuRfEoVyXAe1fxGETN1+AZp
         KYhQFoGuE/KNrj3rYFbk9SEsKi4kbk4BOzL25BHuhIbN/6L2hXQ0mxHr5qsCUXXg/DAF
         VNAZA9JI0W9jbfo9I1XzDbxA3iIe4KaM3K8XD3j2u68p9CIu9C1vzn509IhZzU9R5C+r
         ZKTg==
X-Gm-Message-State: AOAM5324/EuLuEH3xivds+6Dsw+M/MH4z+6FOEo0npWPkt32IKv7WNQY
        j07TcYsmO3rL9OMex+bXQuVz8nDCF2eU4Qa7hLE=
X-Received: by 2002:adf:eb4a:: with SMTP id u10mr794817wrn.11.1630700201045;
        Fri, 03 Sep 2021 13:16:41 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net. [2.142.216.190])
        by smtp.gmail.com with ESMTPSA id b18sm201319wrr.89.2021.09.03.13.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 13:16:40 -0700 (PDT)
Subject: Re: [PATCH v3 06/30] accel/whpx: Implement AccelOpsClass::has_work()
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
 <20210902161543.417092-7-f4bug@amsat.org>
From:   Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7d58bfa-20f7-502b-f307-9ed8f9f4def6@linaro.org>
Date:   Fri, 3 Sep 2021 22:16:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Ko9kKtbkDiMi

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Implement WHPX has_work() handler in AccelOpsClass and
> remove it from cpu_thread_is_idle() since cpu_has_work()
> is already called.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   softmmu/cpus.c                    | 4 +---
>   target/i386/whpx/whpx-accel-ops.c | 6 ++++++
>   2 files changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
