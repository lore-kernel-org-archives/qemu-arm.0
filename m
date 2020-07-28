Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp715966lfy;
        Tue, 28 Jul 2020 08:50:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6hxYVZEi3/k3JG/AW2D4bJMuNYtvSRVxmiqRZMj7Jo09ifUgz3yPWlrsgHyZAD9OQYYY/
X-Received: by 2002:a25:248d:: with SMTP id k135mr19315008ybk.386.1595951424579;
        Tue, 28 Jul 2020 08:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595951424; cv=none;
        d=google.com; s=arc-20160816;
        b=Do5eOcmvkb07t8RY93K3U4kzS4VKY95iEYJhx4QfOCubzH34JGia1eDC/mMehdgNb+
         kLLJzbj54I1zcqKSCwB7NR5bRmTC2kuTMVN/2rz2BiOW8ISMYgX5eKG6CJZ6579DMmYW
         qc1vu4WFsOt3EGdJLtHSADa/DP9dAn3gW6c+7vVFDUgB/KKRkmVOWPfGw6Vh3BYt3PV1
         PXAFUuq48ieymV4XUkkjIuOHSkhm5IqLXLLMmJPUdWoxJbwO0I2cJUwryXMDi7cfuqrT
         n1j2fcpszLlLxzTkN8bwDik4hq9222PfMhxfsUKC9q915JbZOBXpIz0kTVo9FHeffdbU
         slmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:subject
         :from:to:dkim-signature;
        bh=IIs+boSHFXFnHmdtO21MmlggBHDI0b3cSvSxmelo0N8=;
        b=RJyyxJKrrM+vhQyyUlyrwaPryLjesQL04k56KaPR1mCW4ani6hzlPihVV8tXLdRoes
         AjI9yqCe6mq+J4MYsY8JirSrtxetsNnO+GvHq5som5WY0vLhMedJv6Ut1eqP/yLUJR89
         rEt/L3nHF88MYWeUagZFqDk6dofPNY0jh5g1YNSo3LEb0A2ox95vpO0VytJLEOcwPo82
         KOpzX5E4D/o8VEHqysPllK3s7obG9f+6ASTBpSOyPApDqO+MLCrLt0XWRN65YdktAhTo
         HYXRFPRlUYW3fEYmDMMP4wABMmZ+VNfX+0hYAWX/5ZPsdD1lS8724BFS2L90KcTnqsMO
         jGIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QVmMR6oQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si11604596ybr.208.2020.07.28.08.50.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 08:50:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QVmMR6oQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0Rs0-0001Jn-0H
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 11:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k0Rrt-0001JL-9T
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:50:17 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:45637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k0Rrr-00069W-Al
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:50:16 -0400
Received: by mail-pg1-x535.google.com with SMTP id l63so12085945pge.12
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2020 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=IIs+boSHFXFnHmdtO21MmlggBHDI0b3cSvSxmelo0N8=;
 b=QVmMR6oQ/V/fvLV6jQUW1sk+mXGPBiE0n6sn9T5XoUEqex7c0TaXn+ugAgKP0xL9IA
 SjngWdxe7biHlhWgPGIfw7N2Uyte77oWRHBq2XiqcczqgRvEGYYUQqKlzFbrs+KndcER
 Ad/LXxbRfX54akUH3dN5Si5PH+Y3UhLrPGRMCf2ktRcCB/OQtWlXlhaM5xXmb/bn7r6u
 pi4x/OC4Y+PfEtUoddNOxCWkVDZlwSx4zarOOvCvnHh47xkBxuz8SZbdty0UjWXfLKv9
 A+S0OI9BapQRXoNU5a2By5RfgpUTMswz6xc0ymAgUrqiUFITGwb3g5zu0fGBLpo9s50g
 0Gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=IIs+boSHFXFnHmdtO21MmlggBHDI0b3cSvSxmelo0N8=;
 b=F0w0sderN+x7mKDgrAk9IznVJ3tQfcRU72UJ7yWb4TLZuAunVa9ulUs9g1lrwHU974
 ZGP3ceQUqctumYidcqRgQ3ORs20Hf2j0Kh7jeqRM++ZNgovNx/heKCdCUVKEYaWiaZYr
 bA2dTBYe9Lb6UzgfT2TIDDaduLckXQY1lrLo9yXszclqpGD2tloAcO33BesHb/JPwXkE
 gqLWhOLBxj/Uh1dWxutpmdpY+BssweOaDrSPUvr7sISavKdcSCZp5hmxSTJcJ6IgfZRi
 I535iH12cbrNXWwB9fAtyZC4hY5DaY3/54SO13O0pc598C94B37py4YS9aMxgk8NP/Fl
 MXzQ==
X-Gm-Message-State: AOAM531Eb5xWp5IFpahPYMqjbxI6c3n+66zS0mrx+F5nHDSEJrkQf1EP
 aim6hYlyN41Osk6cawWFhZ5pzjgfbBw=
X-Received: by 2002:aa7:8514:: with SMTP id v20mr10903597pfn.18.1595951413224; 
 Tue, 28 Jul 2020 08:50:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a2sm18878278pgf.53.2020.07.28.08.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 08:50:12 -0700 (PDT)
To: derrick.mckee@gmail.com, "open list:ARM" <qemu-arm@nongnu.org>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Differing PAC behavior between Qemu and Arm FVP
Message-ID: <c5b4e931-f475-d0ab-70d4-0100cdb55dbc@linaro.org>
Date: Tue, 28 Jul 2020 08:50:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CbEGfSphlOlz

> The scenario: Application signs pointer 0xdeadbeef using the pacda
> instruction to obtain a new pointer 0xXYdeadbeef.  Later, the application
> wants to generate a new PAC signature for 0xdeadbeef, but uses 0xXYdeadbeef
> as the address for the pacda instruction to generate pointer 0xABdeadbeef.
> Finally, the application wants to authenticate using the autda instruction
> using 0xABdeadbeef and the modifier used to generate that pointer.>
> Qemu behavior: The autda instruction succeeds and 0xdeadbeef is returned.
> 
> FVP behavior: The autda instruction fails, and an invalid pointer is
> returned.  In order for the autda instruction to succeed, the pointer
> provided to the pacda instruction must have the upper bits set to zero.
> 
> Is this a bug, or are we not very concerned about corner cases like these?

Well, actually, if you haven't already gotten an invalid pointer out of step
two (the second pacda) then *that* is a bug.  And an invalid pointer should not
succeed the autda.

So, yes, this does sound like a bug.

I will see if I can create a test case for this, but if you already have one,
that would also be helpful.


r~
