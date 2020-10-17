Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2243113lfa;
        Sat, 17 Oct 2020 02:01:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwKHSTXrUdHwMtKpUsQd0KgwncxCLtYO9ChkZJdkEvkZXH60Oj2a0iSfvwnCJi8nfy+R3p
X-Received: by 2002:a25:40c5:: with SMTP id n188mr9650679yba.514.1602925282907;
        Sat, 17 Oct 2020 02:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602925282; cv=none;
        d=google.com; s=arc-20160816;
        b=Hr39zmKnIALww46oeo2kkXPHyf14TPTsB49sEXniIsg4iuTAE6bcEv/h6Y7MDdOQ7I
         RknSL+V+oOVs7W68fyGyJsrXa2POTmO2XVKQAGgCJDmcghvA4MDL06wcPAZAbvDXE+XO
         1Kyg93k2cUIKzRWK4wrMOS6OAVmovnmnxwW+6romDNf63L3Wp43pQyKggkUfAS2tiB8F
         UZ7GTOhDEw1zpgcJAgP/fYFlWj6c8IDv+MXsQPOUkM+MUb2PqyqBUaG59lydgED6ZAdl
         T4LAQKHAX9bw/1GCCluk49AuATfNI/1u3bRrRuadbWW//eXrlDXkOpJJfQO/vAlY+3m/
         HQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bpXsfm4nElAo3/Vp04pbwGk9h9ecaa4MekgnAovqwQo=;
        b=Xbr3b6AGfT0MmdnA4mF+JUpoWOodVwLb00vpOgw6AY5GgKMPIMhqN5C96WgNpKyL94
         GoJ4WxAw8wwiFoe/B/pgQHyBEe+7ZPwUDNYRt6KVBf/QJ64Szc1MzBF9TWqMch0XEtOf
         ul/WLtE82J/aHikxYlZZwj3u6N7VGpzPXY1pLk3BO7YCIsLdOTbnOFharPzVmrXlvpzK
         h9GeFVntIi57L7gD37JTkHMTssgSUKPH0c0ZRgfFX1PCifVJtvJfVn2MP+ivTAZkDGKH
         jLXSJxVpcBiI5j5st6IIJAb8lHz6mBuTQy2/tx9x4//uf236jfrMuNUyc31Mj+BRQPxX
         3vhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=r+A312Ue;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si5309410ybb.10.2020.10.17.02.01.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Oct 2020 02:01:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=r+A312Ue;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kTi5a-0006xl-7a
	for alex.bennee@linaro.org; Sat, 17 Oct 2020 05:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTi5Q-0006wa-AS; Sat, 17 Oct 2020 05:01:12 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTi5O-00043G-OT; Sat, 17 Oct 2020 05:01:11 -0400
Received: by mail-wr1-x444.google.com with SMTP id h5so6053514wrv.7;
 Sat, 17 Oct 2020 02:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bpXsfm4nElAo3/Vp04pbwGk9h9ecaa4MekgnAovqwQo=;
 b=r+A312UeYhDrPu1h6Id7c9ZuEIyZxEnzwAvzCHBuG4ncBByylmcyEXuQ6U6/jyvPf7
 L4ecYm6xxCA+RLg6Oc3oZwP+H2go077IHuknD46Xa90fOhTLTu7MhN/JyhnNu/5UzjrI
 0VzIUdnxn6hHprGa6ABjcLD82vzM1O4gnqqjg8zCpiPWtgGwm9+cbeDbxNL/Fpx9L9AZ
 4noC9+FDF183oMRnqle6PVaaEqRuz9QJbRuS0PnUUFIPTnh7J7nKTxTZm4dGRkmx1Uwh
 O4P7iyP7aRhcnpknYHLGwa3ZWvom555WHVHoYPSLakMoQP2kSR+qqLj0mdi3iO/Q8/ob
 sksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bpXsfm4nElAo3/Vp04pbwGk9h9ecaa4MekgnAovqwQo=;
 b=PCu1MxCLBhbU594PnpqPflTciMSDq+Fai5EUyq9lG+Ts5CkDX/OqixvEe4bNamYtGu
 XMBV8qZTb7El9PKZypw2mWNktG/nVLpglblECU8pXv+7GK5kBYkpCmrZEOxIQNQXy6EE
 jrwZAlj8177cApRqZaZT1H0ofWngn5BCOclmSBTzm+3iOkRU9Q1eaSU43tGcj+W7hjPc
 hvZMV/vQPLkenLUfdfe9F1bS3sEA53/fqxB8GgjoPaoi3X+urELG0nn32XKszjW4Cti8
 Wqu36tEuFjWfJpgZuJkDFi/flAbATXKvrKs20VuUNdLzkLil3wxNB/V8Jfooh+7XYzY3
 ioig==
X-Gm-Message-State: AOAM530g7WNdM0XfuxdgwJVXhvHD0vzCcSkAt0kbslPyTGDYbBdpiRh+
 rtupb26iJAf7ohJFfouF9pGyyXr64Yw=
X-Received: by 2002:a05:6000:1d1:: with SMTP id
 t17mr4537843wrx.164.1602925268642; 
 Sat, 17 Oct 2020 02:01:08 -0700 (PDT)
Received: from [192.168.1.36] (117.red-83-52-172.dynamicip.rima-tde.net.
 [83.52.172.117])
 by smtp.gmail.com with ESMTPSA id h3sm7741003wrw.78.2020.10.17.02.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Oct 2020 02:01:07 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] target/arm: Fix tlb flush page vs tbi
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201016210754.818257-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <365059bf-a091-327f-dd09-2e134e3dc547@amsat.org>
Date: Sat, 17 Oct 2020 11:01:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201016210754.818257-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.253,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lV2qGdbRc6XB

On 10/16/20 11:07 PM, Richard Henderson wrote:
> Since the FAR_ELx fix at 38d931687fa1, it is reported that
> page granularity flushing is broken.
> 
> This makes sense, since TCG will record the entire virtual
> address in its TLB, not simply the 56 significant bits.
> With no other TCG support, the ARM backend should require
> 256 different page flushes to clear the virtual address of
> any possible tag.
> 
> So I added a new tcg interface that allows passing the size
> of the virtual address.  I thought a simple bit-count was a
> cleaner interface than passing in a mask, since it means that
> we couldn't be passed nonsensical masks like 0xdeadbeef.  It
> also makes it easy to re-direct special cases.

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
