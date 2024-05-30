Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp226792ejk;
        Thu, 30 May 2024 06:31:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOKUQpzK6iDWvtbatDh2BaOlfdyILLS5qTnHeCDHxMs2tu/nbmiO1M7HcxBnHm/SS02rNEuJ0JW6aII/0akbsmm76Mm1VR
X-Google-Smtp-Source: AGHT+IHPZeJ5ygVuIrfG1JzonENwUDiThJ3oek/6yPqIoN1t1g7cncQ62Hrs1DnI1rgjoK7UbS+3
X-Received: by 2002:a05:6358:c122:b0:183:a0ac:b5c2 with SMTP id e5c5f4694b2df-199b0bf52c4mr176627255d.11.1717075909528;
        Thu, 30 May 2024 06:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717075909; cv=none;
        d=google.com; s=arc-20160816;
        b=pEyeHh5WuIi4JA2HZaPkIeVCFXL5IHGcRUZhpekwaBnE3MWZDiGlw+qkilFrGbIkEs
         uMIh3oERmGJcoxc9PmGSEFH+Wt681ZoSSahpwDjlbrwmUAZ69/4iwTVSfowLv/GujhuW
         H61/83aWh16X/J+Cl2zZCy5jeg/MQJSAFPX++wo5b0285rrPXbIcZt0JFpISZVG28C3d
         FB7tMXHY/qO12EhBT2o6soSJ5myuM4lRpVdHBhi/q6PNv8Po4wVxHwK1D/vGp70UkmVV
         7FW9tc0epZ++E/FtmPo4VcXRm87Ff6tb9JBiG/CMzvNPFHvMOimPRJc+auD69NU3ArUZ
         zY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:cc:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JfS4yySerTFEASVa3xnzBxXSq9l7E03E5ymkL7bNaLk=;
        fh=NTfb7qrTnBbeFDkZ7mZnsz3efB7X4YK9LQOshd+dr8M=;
        b=zMTjQlSJyFkM/L6Gsm4A3bkByv0KqjFPpxo+gdHpB2sOumcpeFjd/rud5LPqPXMFb9
         q/wPPBYf8xY9kFsI/o/VJNLwcNN98Vg+vJqv3aTuI+TBZzsP222aoqlKH74GGkDKpS/M
         2ZvbLl9uCwpD6QIkzo1EjW3Qyearzb7IGcrhCFM7EqYHwAwwz3W5uvy4uZILXiXoPE3q
         jhHq8+gWmbqDKlAKfbK6E7GdJmP0JQleoMUOeBlw6ZJQOex3XbatifKehy0K4N5ydGQf
         e5hp46NYRVi0v7wxqocgaBFYxVISC0Xt/eV2Jph50GLFbB/OnBxNodeLnBMueMEKIs8a
         tWkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hDaX46LA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ad75c6750esi122548306d6.0.2024.05.30.06.31.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 06:31:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hDaX46LA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCfry-0003Ci-5e; Thu, 30 May 2024 09:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sCfrw-0003Bl-N5
 for qemu-arm@nongnu.org; Thu, 30 May 2024 09:31:00 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sCfru-0002Cy-Uj
 for qemu-arm@nongnu.org; Thu, 30 May 2024 09:31:00 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42120e3911eso9202365e9.0
 for <qemu-arm@nongnu.org>; Thu, 30 May 2024 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717075857; x=1717680657; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JfS4yySerTFEASVa3xnzBxXSq9l7E03E5ymkL7bNaLk=;
 b=hDaX46LAmYT9yhD3gdv3VtxdljQF2ouwIRFDAJZC1asFEe44CaB1TdpacuL2W2D03z
 jadF5ycUbcS7CYYXxvQUGqnM+kXCD7xIxp8UppkFjow9AuF572frHKEVUrJqnGwlIqDt
 dP5CtWohOowZn8YJnPQgYLvLo1hXGvS/dc+P6D6FSqWylkxqlMDsUiQtr5XOQ+T3Z13e
 UYB0Wllgkab9eJ3sW/+92puIoxGM19VjBwE+LzNpEuU7o8beznuPbmWE1s3fcVY6wTu8
 wXsHm+CRiTxosfZLS3wX1euLolJQbfePqmkeoAHtUKuHfyBYI4gMVe5IPv87+b6124aR
 Xb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717075857; x=1717680657;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JfS4yySerTFEASVa3xnzBxXSq9l7E03E5ymkL7bNaLk=;
 b=OUWlTsv4C4ElOGoCNVPDpJYOrrs+UF5fdvfPL38ikMBu0wT2AuX4cnlhvkx2zqVaub
 k/7PW5+uWmw7iOg+BgN2OFoE6DAc/vmA4K8z+bb0bgjg7VB1B9adQbHnbElR/Jfw0GsS
 +n5BjY5ba5lmAK0IuvaVZ0aB1Y6sxL4aUzvFTgpHQYVprAvDtD8Sn1BPBt/f9gMwxODg
 7nIG1VcWQxwQPPkXRuZEXOvP0akwPXuyPXHxm/+V/fJeV27BQZWlZMCwh+rMkxsXYIEd
 f1cZrVIFU9mq4y4Z+qQH/Ompzz+OtCHHutnUKYZc77yu4GvGaj7z0RhJSAP2Qk4Nu3Vo
 EBCA==
X-Gm-Message-State: AOJu0YzeQoFnRfg/SaTw7k2rFcC0CI7iITjCV2RbT2lMBj2Lg6KgdL2V
 HrmLB27R5euSDZDAHTjbG/BVC0kUV/j9y9e0AAtFV7xcxPwWMaLmfxTuJXpd+9A=
X-Received: by 2002:a05:600c:15cb:b0:421:21d2:abf5 with SMTP id
 5b1f17b1804b1-42127925c30mr26180745e9.31.1717075857215; 
 Thu, 30 May 2024 06:30:57 -0700 (PDT)
Received: from [192.168.69.100] (xbn44-h02-176-184-35-50.dsl.sta.abo.bbox.fr.
 [176.184.35.50]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35579d7db23sm17877598f8f.23.2024.05.30.06.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 06:30:56 -0700 (PDT)
Message-ID: <4e7aa598-1a5d-47e1-aaa3-78af05947eeb@linaro.org>
Date: Thu, 30 May 2024 15:30:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unexpected error in rme_configure_one() at
 ../target/arm/kvm-rme.c:159
To: Itaru Kitayama <itaru.kitayama@linux.dev>, qemu-devel@nongnu.org
References: <0C6F517A-5686-4BCE-8D08-1CED02CB470E@linux.dev>
Content-Language: en-US
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <0C6F517A-5686-4BCE-8D08-1CED02CB470E@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +N2bEYNJyJMp

Cc'ing more developers

On 30/5/24 06:30, Itaru Kitayama wrote:
> Hi,
> 
> When I see a Realm VM creation fails with:
> 
> Unexpected error in rme_configure_one() at ../target/arm/kvm-rme.c:159:
> qemu-system-aarch64: RME: failed to configure SVE: Invalid argument
> test.sh: line 8:  2502 Aborted                 qemu-system-aarch64 -M 'virt,acpi=off,gic-version=3' -cpu host -enable-kvm -smp 2 -m 512M -overcommit 'mem-lock=on' -M 'confidential-guest-support=rme0' -object 'rme-guest,id=rme0,measurement-algo=sha512,num-pmu-counters=6,sve-vector-length=256' -kernel Image -initrd rootfs.cpio -append 'earycon console=ttyAMA0 rdinit=/sbin/init' -nographic -net none
> 
> do I need to suspect first the VMM, QEMU, or the Image? The kernel is built with LLVM, does it matter?
> 
> Thanks,
> Itaru.

