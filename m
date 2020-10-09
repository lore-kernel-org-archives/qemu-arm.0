Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2687166lfq;
        Fri, 9 Oct 2020 15:36:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1VZMNIvTr4KZ4iDnaW2GWHYwBN42bGacAajtTG1tDA+SwfaY+Cr6YX/ObtITraBLHF4Dy
X-Received: by 2002:a25:ab23:: with SMTP id u32mr20986686ybi.221.1602283008485;
        Fri, 09 Oct 2020 15:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602283008; cv=none;
        d=google.com; s=arc-20160816;
        b=ozsZMyQnT4keBVsBJ0Z3liGY6QLz33XUoP3U5P7NrrJ506qqIgxmFG/6fMLHhIVejX
         xJUb9NYqwt0Wp0KZT57/htl8cXwhdKYV1vF4GhPjeGV8/4aRwSygPEAoSkp4Blxq5BXX
         +Voi6iR0KsHAUfoJuMDODiURdDDwGBT7n7mgtZkAqZ6cMD+tNbiFajSG2mPhMPz0pmlY
         UoVc+qCacx9mSSnbF+qyLnYM08mFNogx1KfeU8EaQQpzJW7Ia8Tgst4FHRz05obIXi9j
         g1aDWjmJc+T1UI8k37EjfK1r6bg31iAXfufVrsvWK/5C/EmoxtRr/1U0kjzPBhXtGUR8
         2cDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XQLnnSYQgsL2EXTFm7J7JLzUrbT2tCtd8RHoq/78vDM=;
        b=0of/Mh54kLIj/JAV/jMBFNv/dGVSk4Dsw3D+b/LF6J8Psiunf1+Tdym39c9wy3RdL0
         TAWoeWmnBLj78/8eOyf8O0tG2N+4UxU7Krt9aP94+bIBbOQYVN/QgAY9GC2T4HrY8nZF
         EtZHPpX0TvGQQ8bYVuaeYonZGgT6XJu8nz9mRwqQofyIPMhpVsvj5ViQjNfVLRVfpKEN
         NRxyRwZHbeaveLZ7+D+uOH5MTSX1AT62j5vZXHwHROkRF+Bjomdlk+NraM5DXiOf8DQi
         ULu4IpYXYZqB8GYISWQBTb9vSOf8ZtinehQ62EY/50EZ4mrmygW8v6L1z+0wr/Q9dW7u
         /naw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eX2Fr3Dv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12si9810050ybc.497.2020.10.09.15.36.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 15:36:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eX2Fr3Dv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kR10J-0004Jb-TL
	for alex.bennee@linaro.org; Fri, 09 Oct 2020 18:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kR10B-0004JI-BH
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 18:36:39 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kR109-0007yN-R5
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 18:36:39 -0400
Received: by mail-ot1-x341.google.com with SMTP id m13so10388413otl.9
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2020 15:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=XQLnnSYQgsL2EXTFm7J7JLzUrbT2tCtd8RHoq/78vDM=;
 b=eX2Fr3Dvh5surWfJwIDQ1hH/VtLy6MkTRkH+tE+ivzliz8NcQko07mZfj6m54QeJNB
 bmZ3fbKfT0FFIK/51AmWIZq2tVxIfmFpsv6eE07ESWoX0pqdLNBv5lYXm45ucCC6t69A
 Z1wmNKUMuLFa/yQB1pMz6U/K9CgabsOeNfjg6AqTtigTNvBAOUXquyY1GJ/xFGkNM/NS
 E8asNVf2BrinslXKvnVQotiWElhK9D16OSikLHIt6iUHrebSFP9y+oOCPhW7ZIAD9ozN
 XyI/MeijDV8eo3P2X49Fv6tkgIbTc9dHgSJWgXnFu4eqH9FQ9WzkdjSSLDU9A6eY75+t
 wAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XQLnnSYQgsL2EXTFm7J7JLzUrbT2tCtd8RHoq/78vDM=;
 b=ViEJhlzYPY5M1H5o7asEdTGQ26W+gbrmksTGgmM6mJLVtoODx12mw8WDt4x+oIMDmg
 4a6xLfZ879AAfMRFPn9AVdhnge9Yd8negR04r20U7sxjsmDTERHgHUXfjobD92s9Jmgm
 hEUub120WJ4IMn67cfbMb7xBTiEk/LgaUxsMIXEd/gUImAT7zUpDOIzDPOC4U2cFjAAq
 V9ljM0aDJ3exPoldbeGBXB/qBR5+6BN/woIg9iaPV3qQTunXAb84WSpcoulRsRUaZWCN
 6wm33Nd4Xu23LyljEnuOk45YhAQOyAtpFdTS8x2Fh3HAuWmZEsM2si97yZq9UWHln419
 d4gw==
X-Gm-Message-State: AOAM533Kx21NUaWoHP5YBVzg9tTS/cjbYVK/2qGUfpy+nREJHxKKYc43
 brcUyGGYYu2RJ1fZ17wZ3kYkOQ==
X-Received: by 2002:a05:6830:149:: with SMTP id
 j9mr9111919otp.187.1602282996655; 
 Fri, 09 Oct 2020 15:36:36 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 189sm7499055oid.40.2020.10.09.15.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 15:36:35 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Fix SMLAD incorrect setting of Q bit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
References: <20201009144712.11187-1-peter.maydell@linaro.org>
 <CAFEAcA8BiQcJJr3hkzTqnFLpYtXf1xbDf+GpgvYnPjJr_FAEUA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <21d142c5-d651-269a-8fbb-d35a743f1945@linaro.org>
Date: Fri, 9 Oct 2020 17:36:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8BiQcJJr3hkzTqnFLpYtXf1xbDf+GpgvYnPjJr_FAEUA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.208,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k+bJ1IrJg36V

On 10/9/20 1:48 PM, Peter Maydell wrote:
> On Fri, 9 Oct 2020 at 15:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>> +        tcg_gen_extr_i64_i32(t1, t2, p64);
> 
> Oh, I forgot to mention, but it looks like extr_i64_i32
> isn't documented in tcg/README. Is that because it isn't
> really a TCG IR op, or just an omission?

Because it's not an IR op.  It's the combo of extrl and extrh.


r~
