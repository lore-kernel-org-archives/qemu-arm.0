Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp903758lfy;
        Tue, 28 Jul 2020 13:02:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwstmDmE63KdbZs5J4eV8hwKmvQxkdUIAIlo5UIP6rf7sr7EY6WgAylfSiRGtS98zKS+ZyG
X-Received: by 2002:a5b:445:: with SMTP id s5mr45723081ybp.26.1595966568537;
        Tue, 28 Jul 2020 13:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595966568; cv=none;
        d=google.com; s=arc-20160816;
        b=bubTC5UHxG9sbh5tFbZVt+c4CrubcoGk39Z9NSlwLVnwnUU+dEtVm3cYVLSyWRpbny
         UtmWh4MUV7vxEIrCX/py338fj6v88IN2TlA6dSFu9EYsMQHPBnwfBCnBVtfRAWn7WOn9
         oQFESn3N9IF8yvitutg2Otp3qvNiJOqlIEnYIDxtQQfvgXfJTobBMKsQKnxNP3dfvl6k
         CF/dWZqiTVJtEsKEJdUybr1YpoB0lg4KKD0TigwyoZJQFmz2cuuR7eczaqVcCdzWs18j
         usaBCNDompFa4xwtaUTMiEJr16WAq8UWdaG70O2oXiaPPshpo9KquOsWfqQzOB3rfTEN
         dGVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=usdZRLSd/wT90FBrz10IlG+LjFCiZurQ+ZW3PQa3qOY=;
        b=IJ+mN/x3zEm+Uh9/tNQwMwuposimhPhfwuZF/TcVP6kN1fVoD82eYcq79NC5yWPLfV
         lYgPjNd2p+zZMPro/gCMTaOFoU0VlfO7P81RvFP7tDTsKIc3k8Ih1drTl0kub3LF2++W
         oa7YUAJ5YfC40zlk4yJkGqLRm1swrVDXaVSS2pzIxVHpC8kGbI7Ep59C0QxodgpaitvF
         dUNSVXVqC9M0SnbrzSNtMAlqP6u58OEUpuQeRRWTEfTZWglwPVNeD9CxM+hvWMVz7y/L
         qOS4Fi7ew44JwZxqBJENMEoxb/WU7hopz+IiIyw2KgMsUODdxQFA4bE/PSswEfIY509S
         omzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rkcLPKmW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si5265704ybw.299.2020.07.28.13.02.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 13:02:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rkcLPKmW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0VoF-00055K-VE
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 16:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k0Vmc-0003tK-J2
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 16:01:06 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k0Vma-00011u-QI
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 16:01:06 -0400
Received: by mail-pl1-x634.google.com with SMTP id q17so10524064pls.9
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2020 13:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=usdZRLSd/wT90FBrz10IlG+LjFCiZurQ+ZW3PQa3qOY=;
 b=rkcLPKmWFs5ViQV75d0tzHdP521e8kfk071NVAGFykOzy8eTApjNsphTF/I/Ga6gq9
 Up0Ok2nOwnkc5dNHVYuiO60lvcYJ60dfFYeUES4Tu47Abrs6SKxAzgevyik71HiztSfB
 bhc2/p/3QnfgGHYdrvSm/NEzs1HV1DpKu+K7lZOign2L7LltQLEczFupXcKG3bGRRpOt
 3a7gfOK0RmBqsY0ldLfsaJ/yzeFAk8LcJ2vqRzP3SEkax8dQPcGke09yNAeAa68rL7tL
 DFLztlyHuC+FDe3/oCutdJa5aZkRol9BAjKAd8gVN+8IhYzYpYCrvKOzFE7sC34m5DKM
 8vTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=usdZRLSd/wT90FBrz10IlG+LjFCiZurQ+ZW3PQa3qOY=;
 b=d9rfGLt0xLz3ey+NtdqUxCq7xERSXz8MbCRYqHagscnzXBkDs+FqnM3wYDgJ9Zn/N0
 aMfzyZrXYgAHwZD9UiknsAIhu19WNCpf27WoQv3qd5Cv4wefyIzEdHLyIBmzXdvsug5v
 QoPtAdC4OsZwJkuPRq84zGDN53Inqr+Zec+jNF3T9zCqL82s2r3V8He074lKhMGgAAr1
 vTeJhoSYQcwyrlPVLF0DArJSrzCYO/2lmCF8HfV7D1s3ovisIZ1reKRg2M0hPf9Af8zK
 ekxVMoV83vJxnG8KNQHG0yYIgTZWUkZdVmaV7KttXwkdALSDNra2nM2i8fnKuFPT7EhV
 XebQ==
X-Gm-Message-State: AOAM530Fb6ZaNxKLxi0s2fPS9C7HRYnJ+ekaO0hvLLnbiP3P6/G/mnkl
 YHsc4ak5q793gtbRNPd2zZM/zCNp8HQ=
X-Received: by 2002:a17:90a:f290:: with SMTP id
 fs16mr6024142pjb.35.1595966462719; 
 Tue, 28 Jul 2020 13:01:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t63sm5314091pfb.210.2020.07.28.13.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 13:01:01 -0700 (PDT)
Subject: Re: Differing PAC behavior between Qemu and Arm FVP
To: Derrick McKee <derrick.mckee@gmail.com>
References: <c5b4e931-f475-d0ab-70d4-0100cdb55dbc@linaro.org>
 <CAJoBWHxBv8L1nS_rf85kKPeWkq_E3bTvoMqNu1TRZZvYwg7ANQ@mail.gmail.com>
 <CAJoBWHwLX+GUTZoniC-SNjpghY+h2SaN=JjVnOk7Ux7DByR3jA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ef5e106-3d74-d2ff-a9ec-6a93e019855f@linaro.org>
Date: Tue, 28 Jul 2020 13:00:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJoBWHwLX+GUTZoniC-SNjpghY+h2SaN=JjVnOk7Ux7DByR3jA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PGs/2uvHBKKP

On 7/28/20 11:15 AM, Derrick McKee wrote:
> asm("pacda %[loc], %[mod]"
> : "=r"(result)
> : [loc] "r"(addr_to_use), [mod] "r"(modifier)
> :
>   );

As an aside, this asm statement is buggy.  You need to use a matching
constraint to force RESULT and ADDR_TO_USE to be in the same register.

Like so:

  [loc] "0"(addr_to_use)


r~
