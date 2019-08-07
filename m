Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6754097wrv;
        Wed, 7 Aug 2019 09:24:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzIOMRQGhsSugK9e7LEz10A0IWhBRQ81BodWP6n3EIvpC8zRdakcrH2tx91u69WC3jsmaLF
X-Received: by 2002:aa7:c3c4:: with SMTP id l4mr10849215edr.32.1565195084671;
        Wed, 07 Aug 2019 09:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565195084; cv=none;
        d=google.com; s=arc-20160816;
        b=MFgYLeC9dWAj64St8tSxHeMEep2cGA/WRvGy11gxLToXX1ittdGpXz9ueBWtwT3E/y
         2xM0hE4eti8Ml5mV0/qKC2H8VBoh5/KfV2nFSmNcHpNVH0uK11xpevEZx68BULmM8vJa
         Vom8KPnkrXuw5t+aK3PXSANxWVs+qPurC03h1KHXhJ/XYUFIWQIkVghmyvlVFJweH0iC
         ouYiGHEfpZLPJT4G8ZrwHJ7GI6Nje3uDjhGz1Gw05h8A4BMckPIDmosBN9UfaX3mox35
         uPglILeBHXGRd6rZ12C8tZNry9GHGlqKJMv9ycWzLZ73dAdzPT3fO/OCTvo526xwPYbd
         Pj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=aYYfm+vIRRwS8+uBU3AWzg+SbxWwC9WZ5LnrTr11tTs=;
        b=AycLwM0QQU7uFsf36ogRZtqzvH5HFGu6HLaB8i3AoaO5vsJv665pctQpBxM8NjlJo3
         Hto7sX+B8eHcvc3M3qNd0cArzCNY3i3gbfUbP1O/V5jQoZOuxFO2gE9YX/Cf21w+h3w/
         70Xjfua8HBtT++yzFhSjaYIxOajXP+NUpUw5ocFUEM1nznFiI5ru3c8aHcHI1hAWpaVP
         HDdaBLaTA46JBhJpvqKw38xdRX+Zsy5YBfyJ86FL3oX24nJ78OC0aSLdkzDdf1EC/Y7H
         6M/z/fhiZb52zOMe0bCMnHJZeD5daTtb9yVnJvAoDmiUeqMlT0vV2777e9ogfAAU98KT
         qT3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y0bRoBWs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a51si33709782eda.161.2019.08.07.09.24.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 09:24:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y0bRoBWs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvOjz-0001tV-PS
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 12:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41543)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOjM-0000km-C0
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 12:24:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOjL-0005bx-C4
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 12:24:04 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41454)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvOjL-0005ah-47
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 12:24:03 -0400
Received: by mail-pl1-x644.google.com with SMTP id m9so41408124pls.8
 for <qemu-devel@nongnu.org>; Wed, 07 Aug 2019 09:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aYYfm+vIRRwS8+uBU3AWzg+SbxWwC9WZ5LnrTr11tTs=;
 b=y0bRoBWsit3vYVWoy2IIyQk2NlSE9Whdckg2ww8rJWfzkOyqG34pue44La9x5ZZXWM
 qrQe/8ZUXeINHn01gTY+5T2q4i8qP8tGe/+c7uVc1nZntD7ApW8gWrsaOHVqaigbYFXq
 zz7aLv6I2zYmeG5Jv/EtpA7A2X1U5ftBtkok6NKqk/4GZgVsklw8N6uD0f3eETNB86xK
 Slx0/+AvvMaK9/r3UPLrfytNDzazCOsPMzugsLRpTNma7avbpR0/5ZnWL0IPFj1rAD9i
 uSTrIk9RTgXOESR9qRVIFIsh1YOgv9PGBfO3EBPtzIVvFbU87YFURq+XJmUikprQhf70
 axPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aYYfm+vIRRwS8+uBU3AWzg+SbxWwC9WZ5LnrTr11tTs=;
 b=Pieoa7CQgUFALVidRrI+fsnuY38BTzavaN0eUI1/N2XqT3U8ZutIqt55bBqQhX3WBF
 YUARDOaGj39bzyeBNRbKAcVkoFbu2ry0QY6stQgDZJWIDbZ75rzHI0eV5AFEmww01np1
 7bZ0AQcHqyxTWuTyoPXoq4U651kmRD9q6sggE4WGmwa6eswI7qGpe/XAF38InkGkwI72
 47qnLRVp2gqQtfjJeFfQCP+AVO5Pl47AgawDfFGMvFOFcB7p+nYx5UYBKTuFHRNTsTZo
 D6odR0Ik8Oo+qb/d1BLC1PH7vhWX5YzahBHfB7DhA2vU7AXYswkvaTOVxIc7wHG9lHXS
 Czuw==
X-Gm-Message-State: APjAAAWZr8gOpKU+1YyToc4q/wXvi3y9Czo1aTM0KorrMRuRqCBWtZkq
 n+0D5n2yUpcqHRn3VBxOZmjQ+A==
X-Received: by 2002:a63:e901:: with SMTP id i1mr8256677pgh.451.1565195042061; 
 Wed, 07 Aug 2019 09:24:02 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id j5sm107874000pfi.104.2019.08.07.09.23.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 09:24:01 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166747494.26346@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5afaa158-e9a4-96c5-841a-e4ffc041b35d@linaro.org>
Date: Wed, 7 Aug 2019 09:23:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166747494.26346@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-devel] [PATCH v6 18/26] exec: Delete device_endian
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, imammedo@redhat.com, sagark@eecs.berkeley.edu,
 david@redhat.com, jasowang@redhat.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, laurent@vivier.eu, keith.busch@intel.com,
 jcmvbkbc@gmail.com, frederic.konrad@adacore.com, pbonzini@redhat.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 pburton@wavecomp.com, marex@denx.de, robh@kernel.org, hare@suse.com,
 sstabellini@kernel.org, berto@igalia.com, proljc@gmail.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, mreitz@redhat.com, hpoussin@reactos.org,
 joel@jms.id.au, anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 rth@twiddle.net, philmd@redhat.com, green@moxielogic.com, atar4qemu@gmail.com,
 antonynpavlov@gmail.com, jiri@resnulli.us, ehabkost@redhat.com,
 minyard@acm.org, sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, yuval.shaia@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, shorne@gmail.com,
 sundeep.lkml@gmail.com, jsnow@redhat.com, david@gibson.dropbear.id.au,
 kwolf@redhat.com, crwulff@gmail.com, qemu-riscv@nongnu.org,
 xiaoguangrong.eric@gmail.com, i.mitsyanko@gmail.com, lersek@redhat.com,
 cohuck@redhat.com, alex.williamson@redhat.com, Andrew.Baumann@microsoft.com,
 jcd@tribudubois.net, andrew@aj.id.au, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, kbastian@mail.uni-paderborn.de, jan.kiszka@web.de,
 stefanb@linux.ibm.com, andrew.smirnov@gmail.com, aurelien@aurel32.net,
 clg@kaod.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZCcuvi6pSDos

On 8/7/19 1:32 AM, tony.nguyen@bt.com wrote:
> device_endian has been made redundant by MemOp.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  include/exec/cpu-common.h | 8 --------
>  1 file changed, 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

