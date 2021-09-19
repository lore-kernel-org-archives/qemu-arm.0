Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1571537lfp;
        Sun, 19 Sep 2021 15:23:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbgKT3BHvw3K/znqoQsjZU6Ms5/g/ZPULuIssPnvXn8ZnWK57h3dTKI85KF85qb8aTEO0f
X-Received: by 2002:ac8:7f12:: with SMTP id f18mr20639254qtk.258.1632090214577;
        Sun, 19 Sep 2021 15:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632090214; cv=none;
        d=google.com; s=arc-20160816;
        b=KBbDMcb7EzArv4Sf4yNDgDUqcDE9X+SW44vi5vWKJ+125YGT48BgqYo90uzZN4tnWh
         lbbAdLVWuNybAxTSROA1KO95X+U4FoUtaGiA0tMuwb+1FkL7IPEuzoM6zZ7c86bZ959T
         3fBYFIiCSvFANZvZvuvS+1R5nBPIzHfE8SadU2f1z6lIQAcwQlUn/mvZkXC6mPD9u4fx
         mEBUUFbKCeY8U2ssfTtESU1FFmpBdhMyFPd9EP7mfbeadxPIT3IaSSAt+u3nX/9oHP+Z
         ThxeDLR77Kp3bSbTDaudfSWFS6RLwwzURdhI0HPwa64hKPjbZMTecNGqSwy+AxGDlQED
         fCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nA4szRw8XawE9C3V6GRhMA0rrZGOp+NAQpOeeyLaO5E=;
        b=vGsA94Qa6BR3PC8igxdkkIsYo1Usfe3AAxHEDSxm4J2IbaRg8BJmjaOlo+l7Rgsw2+
         UICSrdeLS3G9WRVAyGgYdDNovXiAzdnE1/aGn59cT3DE5GRvLL9/4mCTmf6KJszo20BW
         5a9ZCXLD2xq4s0gm/ykgu9Mexed7Yvxk2wB9yju1x0+ROjt240n2zOH6M3cN1XQUoc/g
         LxY8as0UpScFdmsyfAPCMFCvPg5YJYG7vE4dSTZWS0ozQ/K93KzCN47ndYmlqwdzvKK6
         CBHUjvmf53w42019mQgaVjQEa5Jrxca+TO9HLdBzlPdLVZOV/9Ws5r0v1HehinFHmk3g
         R73w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xUx8YaMC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si4925756qkp.176.2021.09.19.15.23.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Sep 2021 15:23:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xUx8YaMC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mS5Di-0002Wo-1N
	for alex.bennee@linaro.org; Sun, 19 Sep 2021 18:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS5DP-0002Wd-Uu
 for qemu-arm@nongnu.org; Sun, 19 Sep 2021 18:23:15 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:42595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS5DO-0008Mj-Dp
 for qemu-arm@nongnu.org; Sun, 19 Sep 2021 18:23:15 -0400
Received: by mail-pf1-x42b.google.com with SMTP id q23so12353785pfs.9
 for <qemu-arm@nongnu.org>; Sun, 19 Sep 2021 15:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nA4szRw8XawE9C3V6GRhMA0rrZGOp+NAQpOeeyLaO5E=;
 b=xUx8YaMCTpf8BSwP/bhzu+58UrlRcbp+PodSZLBBx2HQxH/9EP1TQkT4LngOIwy+Hv
 ckdZordqr0lxpXucszzUfzcCGhRITUdXLrR78qOIR5Tl26CKXRrTkrUPRvyXu3D8SsJg
 YCRQgj5h7/3cLE1LffJHxIz/bETZXl0PcNBI/HfF1UbOYHIKkfqLKYcYL/jMYsW36iOn
 52UDZ8BIbTY/YeoDnGu6Q0/A+IIx1lrUi4lRPvTSlXuRfsFD6qNVHlqItV3fAOpBPph2
 IOd1MiMuQTzEFoDh9wMMNprCvRM4OgP19MAfXxfe6SOQ7LOQrqbagr1/VckmbVkB4deT
 Eepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nA4szRw8XawE9C3V6GRhMA0rrZGOp+NAQpOeeyLaO5E=;
 b=aplut9hFaM/Zgb2kH+VmN3odObu7PxnMq2Eigwugz1ATgvIO9y0eUAMEbSKb4wDtdn
 i3ae+OjHMLOjgNC/iBSXW0IZz8oPyrj3oMBMQpjfh2VhzBqraNQWe7YrSmw4Z7riEThn
 RJxOs3itDzDTxrl/WckrE7fnj7wbRx87mfTlcStGuZDZm6pNmZPfGkgKz6Jlg1BH9DTT
 X2JkZS23S3xoOON+O8FzmugYoalhDqh9c6ukGmyRknGbEi+NSwP44KysPj0A1PtTotqG
 uINGDoXHEviGkHvprR0B09SCdX+ObFOkoqyBR8f6RNho92U7FYalto3+5g25x3CqZXa+
 fpMg==
X-Gm-Message-State: AOAM532PXQwbPOh8qRvNuJqZWKVJyobk8RZgaJl72CsWqq1RWEbRuYpi
 kqvyuSA13piYuONYceFq4d2uiVirTS0CLw==
X-Received: by 2002:a63:741b:: with SMTP id p27mr20859143pgc.140.1632090191861; 
 Sun, 19 Sep 2021 15:23:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t68sm13023463pgc.59.2021.09.19.15.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 15:23:11 -0700 (PDT)
Subject: Re: [PATCH v2 4/8] linux-user/arm: Report SIGBUS and SIGSEGV correctly
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-5-richard.henderson@linaro.org>
 <CAFEAcA82iZptWmCcgonZvLTU4g+5nnEEQDdtHD5y=X7m82N1Yg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4a65af02-ae19-20c5-9ffa-3e3a7d0401d4@linaro.org>
Date: Sun, 19 Sep 2021 15:23:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA82iZptWmCcgonZvLTU4g+5nnEEQDdtHD5y=X7m82N1Yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0VPdpfzYGjUT

On 8/26/21 6:31 AM, Peter Maydell wrote:
>> +                si_signo = TARGET_SIGSEGV;
>> +                si_code = TARGET_SEGV_ACCERR;
>> +                break;
>> +            case 0x5: /* Translation fault, level 1 */
>> +            case 0x7: /* Translation fault, level 2 */
>> +                si_signo = TARGET_SIGSEGV;
>> +                si_code = TARGET_SEGV_MAPERR;
>> +                break;
> 
> Side note: for cases like this where we can tell MAPERR from
> ACCERR based on info the exception handler passes to us, should
> we prefer that or the "check the page flags" approach that
> force_sigsegv_for_addr() takes ?

FYI, the v3 version of the sigsegv+siginfo patch set makes is vastly easier on the target 
code.  For the most part the target code goes away entirely.  For the specific case of Arm 
(both a32 and a64), we retain it because we are supposed to report the ESR and FAR as part 
of the signal frame.

I'll note that a64 isn't filling in the esr_context and far_context structures.  The 
latter was invented for MTE, I believe, where the normal si_addr is untagged.  I should 
have a double-check around those at some point...


r~
