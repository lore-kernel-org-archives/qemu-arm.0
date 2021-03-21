Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2900047lfg;
        Sun, 21 Mar 2021 08:49:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylg1SM6dfKveg8ozpJemJUqRH28lsYCwbg/4HsHBXdOy7lveazFkZKJmM3aR0XtweEQshO
X-Received: by 2002:a92:b70c:: with SMTP id k12mr9162402ili.60.1616341762091;
        Sun, 21 Mar 2021 08:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616341762; cv=none;
        d=google.com; s=arc-20160816;
        b=HR8w4LKMttu5f66De8jdUTL0Jf24opnXuxocHgEnwsh8OIYPDJj6tBQRFiSmgCYpCa
         njIzPMgpBa1ypte4oAWcCDqpEvNgpaaUcitjWsZwO/upMchTWWqhG22uLZrMCytrQfeD
         kbI+9PTOwtXEZjgjnUGtplgegHPV5LDC9VrhZKJPIxORFH+XWkCLoBkgBLt/2WiAyH6M
         lPpXq/F5drPhsewe7ikc5es9SvLALf6yKAvNJUBFk2X5AXFqfRBpX35FmXbE9HbT+Mzx
         ezDlZ3061aqwTTweha1HYnbVVh9tMokJ9NSByFzuuPyFDu7Kv0Vl/EiQ463zpU9cCenu
         /uIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=lNYNbyaXqdBHIEs2tZqJIPEMENjnwoe2QThHgtAIKz0=;
        b=NgDUWahK6eAHurQzQAGdWsLKze3m7ssj2/1au9UtwW4idWgIPIkPeTAk0pjDb6DA79
         adz0ZdCJHcmN3V2T8MXdbvv+feOgO9Djk+rawhmMlGUd6Z4MQpeMM3CxPkuH7+qddSxU
         J49kZTwSsEbp5Q8XcGJH/EgW5DOmWmd7xDq3nfWQMyR4nZ6Fqly+Sa5Mh0olaaII0byF
         K+13UhWJCkJEdsRAAV4zzwsrlQETGFebXvgQr+jIugqpck3/fdxJvFPM/UBd8FokD522
         lDODv/agyp4lnGroPLxbK+hNS9guZ4gCeQH9GxyZl5qeC0F6OKiQTNNNlaHpuhyswauK
         9wrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EYMZvtV7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16si6982691jaq.71.2021.03.21.08.49.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Mar 2021 08:49:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EYMZvtV7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lO0KP-0007KX-EK
	for alex.bennee@linaro.org; Sun, 21 Mar 2021 11:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lO0KH-0007K1-6N
 for qemu-arm@nongnu.org; Sun, 21 Mar 2021 11:49:13 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:38503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lO0KF-0001Q5-FP
 for qemu-arm@nongnu.org; Sun, 21 Mar 2021 11:49:12 -0400
Received: by mail-qv1-xf30.google.com with SMTP id t5so7515339qvs.5
 for <qemu-arm@nongnu.org>; Sun, 21 Mar 2021 08:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lNYNbyaXqdBHIEs2tZqJIPEMENjnwoe2QThHgtAIKz0=;
 b=EYMZvtV7yMSgrEjPQGl2TXTW4R0hPdSf6h5+5s/pEG3hFwilSP9qa31jVehqcSQChf
 9SoGwP7beZkH37BaCnCxImDAEkBmL/SWbJaKgIiFet9+jfN+g6DYegCW05lx/NTRqKM+
 Kw5cmpXVLxy6AQxT/fxQheDkrc3IRmobWE/R/Pk5Sbvq2oXAXE1cD3B9CVfAHhHv2pCN
 MpWq/gqjITNodbZRRE308xgXgJZdmTaQV5lylAObXcZgd1RRlcjGJhCwDOJyoCiXqopI
 Wi/R3JY8r51yBblVOeoSWVuQc8PCTIIDrowNPwsNM5Cf3yh49hgJVZhyJjLV6ddBgg5b
 3JGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lNYNbyaXqdBHIEs2tZqJIPEMENjnwoe2QThHgtAIKz0=;
 b=YalAPKQboJqHqIO/yUNAdPtfkNLbUsol7ySJvPbtzl58OmZedbG1vCG7EJNsscM+Gx
 0OBdjiNFPCAGL/NixF2Sts1OZ1K8yyjyzcOlTf89gRUtZ0l1AoYHd3LgonuJKyWSGDZ2
 a4GntW+8CiX4NAY7yhCNnnnSIEgUi/3LevJj2RW40bQ/SNgrtp2/ueUpEqJKZgo7DRKr
 OOQo4TiA/neyf39pOwfVRIaR1kCJih4Q7Zrj93kyMniPHOEjus9bqqbCwLIgxCBimsVx
 ALaq2r59ZoF/vlAjcYGj9AA5cvFwiS2Ax8WR5EE9kxMtQNmJQe6nwrLx/YcnRhiLQPmg
 ZNcw==
X-Gm-Message-State: AOAM531XXuBkLpteHnyPqIS3QbUded5V2fcNfwmKp9lVzkxYXdquWW2h
 nEvVf1tZdYVv2fObf6M/IEfYbw==
X-Received: by 2002:a0c:e8c5:: with SMTP id m5mr2131468qvo.13.1616341750552;
 Sun, 21 Mar 2021 08:49:10 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g21sm9001101qkk.72.2021.03.21.08.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Mar 2021 08:49:10 -0700 (PDT)
Subject: Re: [PATCH] configure: Improve alias attribute check
From: Richard Henderson <richard.henderson@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Gavin Shan <gshan@redhat.com>,
 qemu-devel@nongnu.org
References: <20210320042753.69297-1-gshan@redhat.com>
 <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
 <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
Message-ID: <4c8d854e-a8a1-2a44-5a02-96a5ce5598bc@linaro.org>
Date: Sun, 21 Mar 2021 09:49:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: thuth@redhat.com, shan.gavin@gmail.com, laurent@vivier.eu,
 Aldy Hernandez <aldyh@redhat.com>, qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QjRNr3bhpXuu

On 3/20/21 4:33 PM, Richard Henderson wrote:
> On 3/20/21 11:52 AM, Paolo Bonzini wrote:
>>> +int main(void)
>>> +{
>>> +    return read_y();
>>> +}
>>
>> I think this should be "read_y() == 1 ? 0 : 1".
> 
> As a testcase returning 0 on success, yes.
> 
>> I can reproduce it with -flto -O2 but not without -flto, do you agree?
> 
> Agreed.  Replicated with a random recent gcc 11 snapshot.
> This is really annoying of lto.  It's clear something needs to change though.
> 
>> Perhaps we can obtain the same optimization by wrapping reads of the page 
>> size in an inline __attribute__((const)) function.  Richard, what do you think?
> 
> I'll give it a shot and see what happens.

What exact version of gcc are you guys using?  Something from rawhide that I 
can just install?

So far I have failed to compile with gcc master with --enable-lto.  Lots of 
missing symbols reported at link time.  Therefore I've been unable to actually 
test what I intended to test.

That said, I'm not hopeful that __attribute__((const)) will work.  I have an 
idea that early inlining will inline tiny function calls too soon, before the 
attribute has a change to DTRT during CSE.  At which point we're left with bare 
variable references and we're exactly where we would be if we did nothing 
special at all.

Another workaround may be to avoid compiling exec-vary.c with -flto.  I'm not 
sure that my meson fu is up to that.  Paolo?

I have filed a gcc bug report:

   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99696

Hopefully someone can address that before gcc 11 gets released.  At which point 
we need do nothing in qemu.  Aldy?


r~
