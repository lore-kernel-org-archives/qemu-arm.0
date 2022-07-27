Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp269163lfg;
        Wed, 27 Jul 2022 06:21:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1x+rxrziZm4t0f+JQfMRBEFCpWKbFtIS+YLE1yGT3ri3CD3lIYmnSN4u4uGTQr/f1ZAOd
X-Received: by 2002:a05:6214:20e3:b0:474:23eb:2d41 with SMTP id 3-20020a05621420e300b0047423eb2d41mr19003735qvk.67.1658928071412;
        Wed, 27 Jul 2022 06:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658928071; cv=none;
        d=google.com; s=arc-20160816;
        b=Bf7/YTjAeBWBLiv4U/ImsLtay6ad9dqWq4l5EAUoh4OoMEEBu4bpi/4N1ZsfhBy+G8
         1rcwVyHVPYzKKpnawzAcIzjW3tjAzUEWdxLv4ik/U2oMojZ5vOm62Ooprb6Hs3HJNPuQ
         BdfHbI3r3EsB08AzxbEUUzuAizz724LEdSKQK7HYfTIM64A8OwTH2AHhdrV+cDZhknqM
         6D8cXAXH6PKMH6m0j9wkCfw9J59wxTvJhBiobJ5WqrH3Yw3lduyeOMuMegpmOYCGDQzf
         bWDy1HUCU0pIVkRJyehLfDoZHgTUE8lpRmVM3/h3DGEM5VWpcu9vrjYoEzNJgffCmPPt
         1Pkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JD1sH0NGj0wk13AbYSgGRSj+YM0W5HkviGSowRW6rn0=;
        b=Bh07EEgddwaCbAdW3KyoqxdcJWerfqcQmTccw9IyXRvBOPPRSXLjVzq5WiYN/JHlFw
         jKMFYGRrV7nEHZULaBRrRhoCNq4GAb/Hf0NpRlHyNSgE7H8lexL72bdH2zpba0+Uf6Av
         sSvSZNAfyHy+xZM9Eoq+c8tk1yQxcC8ok3EjZOezh7bMOdXNPAz7pOxe0g5vsL3xIOea
         JvES6Gwr2Y2Wl52nk4MvnFNjA9vlBrXxjNCsYCVR80gojQ1Xh4yciigSG/Hsp5PMjZ/3
         lly6Fw5U/vlGKBhRCMTdCqHerzmcpLZhA7CvzEn2Uw5onpYvwhs0FhmbvG8bID0YJY+J
         Jtug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=mSLZAZl6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c29-20020a05620a201d00b006b5c89a2774si9555064qka.198.2022.07.27.06.21.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jul 2022 06:21:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=mSLZAZl6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGgyM-0005VM-Pt
	for alex.bennee@linaro.org; Wed, 27 Jul 2022 09:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oGgxt-0005Tn-LP
 for qemu-arm@nongnu.org; Wed, 27 Jul 2022 09:20:41 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:42890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oGgxq-0000lL-W2
 for qemu-arm@nongnu.org; Wed, 27 Jul 2022 09:20:40 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 8-20020a05600c024800b003a2fe343db1so1001930wmj.1
 for <qemu-arm@nongnu.org>; Wed, 27 Jul 2022 06:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JD1sH0NGj0wk13AbYSgGRSj+YM0W5HkviGSowRW6rn0=;
 b=mSLZAZl6skbwtcdMxfRiDi6CX06jLcP+VNiF6/n2lN3bqtRRR5UJPShacJadpWNAQS
 tlbne8HFK1CB+TTVYJgsH54OyAy4chIVMVnjcDoBEu0yHw0igt5njKriZn/MHtn+Z5Ou
 d+gMxcvaJHKQmLPMSh2IbOCPSI7lZWT8+j1OMVjzpoOhxSHOhbk9hvnzyXjzSvoJbcnw
 IvwFLDtduhAPMpG9TqFlSD6YDLqL1y9VjDFYRq+cbCrQW2KDDDgO8o/oKXyxt5GIjoGE
 Qn1QS/Ljybcl2eS+mgjHSk+1bceoPgyheKa3EuRTMJ3b28k/gg7k8EmtqsxjBUB4OMv4
 +J3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JD1sH0NGj0wk13AbYSgGRSj+YM0W5HkviGSowRW6rn0=;
 b=ayYcPEkDA6swciyxXYO3U/4p8imVmgMc8Sr+KCu8x0+cyXHxFfaO/U0kEB3U+ol76l
 3XrStW/4b2iptBD/JUAlA6oN4bi/fl6Vd9ZDJYNd0A/NVSS7uOmtRL4b3KEg1ywKOnGi
 Yiax8fO/GsyHR6IYc2vKAhmeMEEl9UTAYTnz8Gbq4FqtBYWQ086mqaqq30ylbxRgI3kU
 kHHQfzdzamR9m4XK/V5tnP0/UTmAV7J03WWT7TLHSUorGEN7GYE7hxs5ksHKTriYAEIm
 nJMgKztFWakwAcohPFKZyYWXt0KomvZvv/nBARUlNmVqXEvfzh1Y8b008/Ev46pFPlt0
 9Tkg==
X-Gm-Message-State: AJIora/O+tXBiaGFTJaWn7l554S3AB3NVztlpRLCzH4PAJoKVisXN6LM
 FEJXAhSXIR/icBcH436yyQvArw==
X-Received: by 2002:a05:600c:154c:b0:3a3:4383:e13f with SMTP id
 f12-20020a05600c154c00b003a34383e13fmr2985779wmg.16.1658928036820; 
 Wed, 27 Jul 2022 06:20:36 -0700 (PDT)
Received: from [192.168.0.17]
 (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net. [86.15.83.122])
 by smtp.gmail.com with ESMTPSA id
 bn1-20020a056000060100b0021e71894692sm12074938wrb.91.2022.07.27.06.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 06:20:36 -0700 (PDT)
Message-ID: <f4e36935-d6b6-54a7-3500-3b54f6ab551e@sifive.com>
Date: Wed, 27 Jul 2022 14:20:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: updates for designware pci-host
Content-Language: en-GB
To: Peter Maydell <peter.maydell@linaro.org>, Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>
References: <20220713165449.37433-1-ben.dooks@sifive.com>
 <20220727111320.5b7qobwx5bbwh65d@hetzy.fluff.org>
 <CAFEAcA_aw002ZP6a=M5VyjVSs9Ln-Pv3ED0-eTtJj4bFM+KcJw@mail.gmail.com>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <CAFEAcA_aw002ZP6a=M5VyjVSs9Ln-Pv3ED0-eTtJj4bFM+KcJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=ben.dooks@sifive.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U7u95OpNig0c

On 27/07/2022 13:56, Peter Maydell wrote:
> On Wed, 27 Jul 2022 at 12:15, Ben Dooks <qemu@ben.fluff.org> wrote:
>>
>> On Wed, Jul 13, 2022 at 05:54:42PM +0100, Ben Dooks wrote:
>>> As part of a project we have been looking at using the DesignWare
>>> PCIe host. We found a few issues of missing features or small bugs
>>> when using this with a recent Linux kernel (v5.17.x)
>>>
>>> Whilst doing this we also made a start on some tracing events.
>>
>> Hi, has anyone had a chance to review these. If so can this series
>> get applied? If not should anyone else be added to the review list?
>>
>> If it would be easier I can try and find a git tree to publish this
>> branch on if a pull request would be easier.
> 
> Is there a public spec for the hardware? There isn't anything
> listed in the source file in the tree. Without the h/w specs
> it's pretty difficult to review changes.

Some of this I did against the Linux driver from the v5.17 kernel
which didn't work until these fixes were added (not sure when the
Linux kernel got the ATU size autodetection in, etc).

I think everything described in this set was from Linux, but I
do have access to the Synopsys v5 PCIe core documentation so have
not gone to see if there is anything publicly available.

-- 
Ben

