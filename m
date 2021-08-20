Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1343704lfg;
        Fri, 20 Aug 2021 07:10:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyveoE3MX3comp0s49iQN9lsjstN+R6F7BYfV8sVvY4rs/EjmhZyOAbETVLvlivGL4rJgTH
X-Received: by 2002:a17:906:1c05:: with SMTP id k5mr22398144ejg.36.1629468638656;
        Fri, 20 Aug 2021 07:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629468638; cv=none;
        d=google.com; s=arc-20160816;
        b=bbsedpxiTBuO2deauYHctHTufYtoucjbUytSJFJbLcSWNEFYCcH/by/uNbuu2oBvzR
         B11a6H3daqHJtzGVpjsp6i0hyIZKPEReHDp1jkhZtxO0SG/ZRLDKgkd9yAcSpRgrVgSP
         AICDDlOFw+4NNzd9f9Lf/VgE/KI6yPegcHhf1Tf1M75yTxVUoeA8b6AqPMuVTLrZ0o97
         hHvxePC9ETAlwYR3n+mHg+z9rP3e6WLh9L6Nn+T3dVO2VR0iOQXVzCGAR4VLZEv1eXDH
         8QC8QYGzSA2O1OarBVSLaVaGuUYVSjH1lU7jPj60RYjwxvrGb9j6v+jYqoFtwJvDwFSx
         UrOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gQT9ONiHLk7yAa0p4Nj0sMa/6pcEWW5lpPdVTij6UtQ=;
        b=o2N93OUcnFIgyf4e/lyXCZmUXK4eDnbq1rayIOfepdQcBNwOuwA3LfBVAA1DZM5jvd
         EX2Ca6QQcV6zjmqIAQG7QClUy7YyXtAZJNkSsEBu0I+l/rpaME8oPU+KffP/QJ3hCRqt
         owyaTJG92HT6gySh9WU7uVGFfnT4bAKil1idM0IgS5ypzpgao74Ad0D16ByJfXYxYClF
         hKy5XOSRP2kcQy88vBkS1SZwO+adLMmm2gK+tpLWhUou/Ddm25vsG0v6CCPT9saCzKr8
         mRkxde8KnJgKbTKUbccyOX1ZxI3iXY8UqiXv58CqH0oHiMWI7liY0E2MH4ZkVT98n4GB
         URVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DPyGw3Kn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z23si6807234edx.139.2021.08.20.07.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 07:10:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DPyGw3Kn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mH5ED-0006Hx-Pa
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 10:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH5Df-0006GK-Qb
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 10:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH5De-0003uu-8a
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 10:10:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629468601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQT9ONiHLk7yAa0p4Nj0sMa/6pcEWW5lpPdVTij6UtQ=;
 b=DPyGw3Knshlau6I9+Bdj1oHlfWCGhr25tm+tghLZiGhm0hCmGQnDX4s/b+Z0+GP14vN62H
 SoZYhWRcJ1F8+/uNEo7cwuxshHRhGUjl4l4LDsuhX0SwEaCjwkv1xy6QjQI0m2eI+bPaO3
 PZW6CsOGyivGvXagMEpVkF8Do+m8lns=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-o_nwaNaOOC-IisyhD6omew-1; Fri, 20 Aug 2021 10:10:00 -0400
X-MC-Unique: o_nwaNaOOC-IisyhD6omew-1
Received: by mail-wm1-f69.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so1887333wma.4
 for <qemu-arm@nongnu.org>; Fri, 20 Aug 2021 07:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gQT9ONiHLk7yAa0p4Nj0sMa/6pcEWW5lpPdVTij6UtQ=;
 b=AL/t9FzuNe7QUnEDkDcS5VbvmmMWUve/O0wz8msVBuYzHeLsUyrcprjkJcBQ4jo1dd
 AMoDeCCzZs/V+aGLhcx545QGTSlL29YdWmyrHKocX6ZGmfXtxL7Kg+j1eIrTRVY2h+5k
 Kcy/j3JcpJwkDIYYJW1MXGDKzuks49ixy/3iQoUL0NtatG9gNWO2cuubE9DRLwWWguIW
 jupOP9F0CERSNwyy4yYNGvDwEmUBNUc3nAqLl76hbx7vR8NcaSbliKCha1QZXIMMTLMb
 08D3yhoT5Mq2rZuna4zUFKRiAp8M+IT1GxlI+ePgfVyixupPAuj2wGjfkCXez4rWnCZo
 LznA==
X-Gm-Message-State: AOAM530WeOtQAJ96emO2aN3qiUKUCVe5cBQ8JyQ4yxfXtpnZk6vFBaq8
 a4MCk+GPOOIbHgfXBSecs+YpL5xsVv9hnYAoWkWYG4XeTw8rNTKTH/dU9GGTRpEjb0rLVkF01vD
 SpMZvIZ3PxmLb8v+8rL1UzpBhalpN4P8JIkxNBNAj3iV4RofjPLEGMRge7OzJYw==
X-Received: by 2002:a1c:7904:: with SMTP id l4mr4240450wme.42.1629468598128;
 Fri, 20 Aug 2021 07:09:58 -0700 (PDT)
X-Received: by 2002:a1c:7904:: with SMTP id l4mr4240413wme.42.1629468597800;
 Fri, 20 Aug 2021 07:09:57 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w14sm5951136wrt.23.2021.08.20.07.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 07:09:57 -0700 (PDT)
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
To: Bin Meng <bmeng.cn@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 David Hildenbrand <david@redhat.com>, "Richard W.M. Jones"
 <rjones@redhat.com>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
Date: Fri, 20 Aug 2021 16:09:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d8yMlLgilmHi

Hi Bin,

On 8/20/21 4:04 PM, Bin Meng wrote:
> Hi,
> 
> The following command used to work on QEMU 4.2.0, but is now broken
> with QEMU head.
> 
> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
> -nographic -serial /dev/null -serial mon:stdio -monitor null -device
> loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
> allocate memory
> 
> Any ideas?

Richard hit that recently too.

Can you provide:

cat /proc/sys/vm/overcommit_kbytes
cat /proc/sys/vm/overcommit_memory
cat /proc/sys/vm/overcommit_ratio

and

cat /proc/meminfo

(CommitLimit, Committed_AS)

and OOM messages.

Per David, 'you can trick QEMU in trying to work around
that issue, specifying a memory-backend-ram with "reserve=off"
as guest RAM.'

