Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp22893wrv;
        Fri, 26 Jul 2019 07:49:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMEp2vSr1ZDX/ATgXEswpDYvxUw70pIcX3SQ96m+vtpgMOVkQ0+P2o0YsxzEVY+gBGtA1V
X-Received: by 2002:ac8:c0e:: with SMTP id k14mr66405371qti.72.1564152544685;
        Fri, 26 Jul 2019 07:49:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564152544; cv=none;
        d=google.com; s=arc-20160816;
        b=joTX33Ns7kriC7CAYSANZCtad0eC6F4r39uuaSF2T+55Usy59OYbMU+rE4Jea2tuZn
         /4fwE9gwP9PoFrULkhZwRItUWwPKj2/YXeOfKKvqt7HxEpGys41AXyNfHgGVdbOPeiIu
         KOG9K065bg3ueZJVOab4Xx+EX284i/fcgatp3KK4xRVciDWENbQ7Kdf6P2hWWndkDwfP
         eSEoQnvgYJDQ+WzJXLEvxxujCKETfiCBt68gDyqXmObY3mpcw8mI7ORAJFXdFtNLWcoa
         FFkZ8XYOKntCs5G2xPyRS/Ui+/v/cYVBWgIbhorYvfknnAgTmVY+IK/ZB1gr57XLZCc9
         RNgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=JGG+6GSjniBgQfc0XQuvOZiWJplQ8Gy5+cpliYGgZ2s=;
        b=RcqNjZMdhG5Ysbm61208ydqUK31SlejosQo6C6YF/2Xu0H/5BrC7aIoQ4/Q3gq7BdH
         8ypGVbgvzMSy2K/Jx9CKTL+HvbGwrNEokAini7G10vAu4ptIs951NwhNKv+CDkJOdpKU
         Q8VWDuI1tYAOOhV2VvOwCgnpHktVjfsLMsKeeteAOe8RIkvYToipqCopzkpOb7AsEjCj
         nUi+UY1i2+WUQmAU7hn8FYQ7Y3uQzYxZNOnX08F3GD7szd2UQaT9v3Xei1xZvzviAxDq
         oiKuk6m0/jLldccKAVuAYce4r6tiHc/R0LuWLbNUObcUJK7GmNeo3C7gISCy3ahGo8UQ
         goqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JhJjCHD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3si32965718qte.268.2019.07.26.07.49.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 07:49:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JhJjCHD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr1Wp-0002IS-NI
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 10:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52488)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1Wj-0002Cv-Bh
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:48:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1Wh-0004wf-CW
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:48:57 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38137)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr1Wf-0004t8-D1
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:48:54 -0400
Received: by mail-pf1-x441.google.com with SMTP id y15so24640920pfn.5
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 07:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JGG+6GSjniBgQfc0XQuvOZiWJplQ8Gy5+cpliYGgZ2s=;
 b=JhJjCHD10gsgmX/2XjtoOgFJef8Y65lBbTFsRrM70sYWF4vV4k5FEL46+Tea/hgfYr
 IDbmKvK5hWzs9PzEv0n65B6Y40IDybg6RDB8y46RtBP84fTJ3yBVv4tEjQ3OT5mlMpUX
 dRkXD3a9zQ1xlHP/G5pNteqFWX/my7RWBnhNqaJzEuPUUtevgVmcaIi68mdDxeYbqRL3
 oyeA0LCJaGi5Yw/flTECnj42Rnfi7QWBYbx3Yv++KeJUQRceV90lCI2Iqk/phNBCqXE0
 tOMCiYwVoDNrgdPjJ+QZgFwAD9ykFcQIYiEi3Hd8ku2mfmTRKZlY3ynWWPwYupNzdzof
 VGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JGG+6GSjniBgQfc0XQuvOZiWJplQ8Gy5+cpliYGgZ2s=;
 b=H3vdyn4VX7I0ABT3RxuDWLdgt0pSB1rmMX/t+4ZwF5a76XuR4bvDhR7ZysNn2bfLT6
 fJnhC0GzFnnd9ZQeshFCZGNbk1exrBJ4uVWK+4FI+eWN2BVr19mNXOlKrw2aGLBJyVfz
 G2NW+Pxjx44DjEz4gXcMf6wSu1hi2hm01hDxSxxww58cYaMp59ggMc3arlw9fKqTF+hF
 J/NzJ+C+avrz5mvmu7W9a1GTM/3zEmADqkR1x8fc+H3FAag712tY5eiimm8m/qfCpp57
 tqpOFVMjsHlPF6CzQuiSJU69AN8CzF8MCaxy21nURwi/A6JRR21kS4h9w3X+O2aHgArs
 0PPw==
X-Gm-Message-State: APjAAAXHeCSqNOZ68MBsZEXUVzcQ0H3TlgVNNqTjbRutgifP3xlfNnCd
 eIeWyiVadfqdCs5qNNKSV/D+5A==
X-Received: by 2002:a63:7a06:: with SMTP id v6mr92713232pgc.115.1564152531555; 
 Fri, 26 Jul 2019 07:48:51 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id f3sm83570723pfg.165.2019.07.26.07.48.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:48:50 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123690507.53193@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b0d92bab-8302-4fe5-d7c2-16c7193ffd7e@linaro.org>
Date: Fri, 26 Jul 2019 07:48:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123690507.53193@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 12/15] cpu: TLB_FLAGS_MASK
 bit to force memory slow path
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, alex.williamson@redhat.com, arikalo@wavecomp.com,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z3I1M0Xw9ain

On 7/25/19 11:48 PM, tony.nguyen@bt.com wrote:
> The fast path is taken when TLB_FLAGS_MASK is all zero.
> 
> TLB_FORCE_SLOW is simply a TLB_FLAGS_MASK bit to force the slow path,
> there are no other side effects.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  include/exec/cpu-all.h | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
