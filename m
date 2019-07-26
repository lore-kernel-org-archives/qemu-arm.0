Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11925366wrv;
        Fri, 26 Jul 2019 06:36:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUq0wIa6Cj4TOeiJsBvJ+kBHHUYN+0AEWnN8LccEGvaE3+VbX1KwBcG/j/rAzrSoeq43gC
X-Received: by 2002:aa7:d845:: with SMTP id f5mr82344522eds.78.1564148203737;
        Fri, 26 Jul 2019 06:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564148203; cv=none;
        d=google.com; s=arc-20160816;
        b=Z5KoHz5TzZ8Mo8NECF8tJ0eQVgtbExr6MmtyHGgJoPgkBFfDtdPxunV+angI6lSYPy
         aO4BwiUa86WiX3OIJc1Z6TPpn1zV/r61BmMH6gDimyrbKp3XPTiJP1pxdFq8xXLGYbUD
         QxNKIzZu8RY19Qwbn9pLWnN6bsxOFymwIWAaGNYnjmI7yNuJb5nQsqEYHOBe6kxhkFMJ
         gM5mZv9eRC9OD2PmM9ccdqNSslZaGS/j1C9MOkdgeQ1NkIug2xCO/wOU5fDmAiihfuG0
         0Ih74Tpyk3QA4xBfyVfWMNwGk0Lohu0IpPMQSCoHboHe+TgTuXsTS5KlxnTq7lEuE/8v
         6t2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=inCfA/W1i3z3z5tOp8rEtDeZ1u+OtDpBt/sTzcc9ZUU=;
        b=Lv6dINgnBSck73jmzo/zk4O+2Wnu0gZpdaz9N2vL+6+mpJXyLkwisHGhv2ILlzTzRP
         JlEV9iKeKg8gKRTmnKvhirvCHqLKuU+NKkZjwfZiYAnBYsX9agAborXvHAeFCZ9VBPk1
         afgTu4lPfIb49nhROYHKJVO1VpMmfjA4DOdl77a2Kk4G00bS4jwDxyMR7kcm9nv3lWBZ
         QPr8f1JWj/hElMfdaEFbX//g0S8AtjKsOButt3+OJH/Bdq04KwkWA/EzbHHikLAj0cTJ
         S3SF8e9jwfgY5j2XoLPN2HX8DdgRVIYuElAKoyno3Sr29iYBXuUgXKaNHax/5+dMQndj
         hP3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GYG7xBhG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si10946018ejj.399.2019.07.26.06.36.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 06:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GYG7xBhG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr0Oo-0002MN-Gl
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 09:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37845)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0Ok-0002Ik-Jn
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:36:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0Oj-0006Vf-Jn
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:36:38 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:44242)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0Oj-0006V4-BB
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:36:37 -0400
Received: by mail-pg1-x542.google.com with SMTP id i18so24811749pgl.11
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 06:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=inCfA/W1i3z3z5tOp8rEtDeZ1u+OtDpBt/sTzcc9ZUU=;
 b=GYG7xBhG/I4RR2zG42MXpywdoDx53ynyqL1JtuDsAOvcYsFjW0ciCGc/8HNtxdKHJc
 MvFTv29/LFw7CgRF3/CdkwoFyU2LW4z9jKMcZBag0BAidLEToiMSeX3ZhkPyWufJEnYi
 0f3dUEPwmQdZvLpZe6gsOYYZ997MxDjFt5RR/UgOv6htqm5TBaBcifS+5A5rpi8o+IBM
 dDSYVBBnjYmzNH+acf1LXBQid3TwLc3PwjCUjOux4kwdW7rAsG3G/CQWWYNUY0i4wYKf
 uvxi4Rrl6SEr2usQq0JdK7Ph9/q18pvpaR6MyntolCf7CzmkSgrw+L1bCmyVcmi1B/yZ
 +QWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=inCfA/W1i3z3z5tOp8rEtDeZ1u+OtDpBt/sTzcc9ZUU=;
 b=tvTXUGBsw8tNC0N0gQv5kjCObV3cjkAatUIRYmnaMFcutsKxq6Q2fyDK7eMz4ik9FT
 63KUtOL42aanRWt3/3EV9JwErVhRxOEpP58MQr+zYQJKGpJV3UZ4G0u9jId+PtwwNql/
 3XYMc75Mn3lZAzV0LnEhdeZAE6WPqJG6FeLvfZRbL07u+c0KzXP8921bhPtwhcHIx97X
 0a78KSeo/rMNmd37dhNS00hBw5bZOSVoSQzyC5lgpe5puk2lLlVLXb6CKNT9dQ7NdHEa
 /oTvSlJmXiSpVUxiWsq67wrWFA2XdZgnVhBZTnjNBk9wDgbCGJ+SxQpWBURnXE2APdwZ
 Tx6A==
X-Gm-Message-State: APjAAAVD+bTKn14UNvrZlUOARsZHMpCt8V3xTmRK7tDADRW7XBtI1KvK
 lWE9WxtY/A/ZZK2w0mhLs1nshg==
X-Received: by 2002:a63:5459:: with SMTP id e25mr26268824pgm.366.1564148196060; 
 Fri, 26 Jul 2019 06:36:36 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id 67sm14849813pfd.177.2019.07.26.06.36.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 06:36:34 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123434793.89101@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2e89740b-58e7-ed7b-834a-f94fa76f3cd3@linaro.org>
Date: Fri, 26 Jul 2019 06:36:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123434793.89101@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 02/15] memory: Access
 MemoryRegion with MemOp
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
X-TUID: ztaJYZ5Fey70

On 7/25/19 11:43 PM, tony.nguyen@bt.com wrote:
>  } MemOp;
> 
> +/* No-op while memory_region_dispatch_[read|write] is converted to MemOp */
> +#define MEMOP_SIZE(op)  (op)    /* MemOp to size.  */
> +#define SIZE_MEMOP(ul)  (ul)    /* Size to MemOp.  */
> +

This doesn't thrill me, because for 9 patches these macros don't do what they
say on the tin, but I'll accept it.

I would prefer lower-case and that the real implementation in patch 10 be
inline functions with proper types instead of typeless macros.  In particular,
"unsigned" not "unsigned long" as you imply from "ul" here, since that's what
was used ...

>  MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>                                          hwaddr addr,
>                                          uint64_t *pval,
> -                                        unsigned size,
> +                                        MemOp op,
>                                          MemTxAttrs attrs);

... here.

With the name case change,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
