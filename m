Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2887259lfm;
        Tue, 16 Jun 2020 12:14:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7Qh1mN2UzRNrz6Ig1A6VHdZbZmV102mSKWbHIWB9DUa3Zko8LIqv2E1chFdB/i+6/E9Pd
X-Received: by 2002:a25:5044:: with SMTP id e65mr6547821ybb.98.1592334868320;
        Tue, 16 Jun 2020 12:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592334868; cv=none;
        d=google.com; s=arc-20160816;
        b=dfRMxqI3vSnUgqiIxItPRMDyjdoJe7emdlU/Nd8UBEpP241CW7MeIwR08PVkBd1vBE
         G2wbKaI7ppU8vr/eu10E+JVurcXPg84c4WsbDZsKAzk0oD4UYHmV8QkYcjRenJ3Ur11o
         ywbNLQhFoh0BUPM5rgixwI0lqyK8fZC25Nz9jfmOn3tes4By6BaX0EndSm39Z39rc09a
         AkkqOLovUbs1vc5+CLsRAzOcb1/AhQ9V0E/FHA5la8AtcGCeM4VI/Qww/YjR8+DfyxPH
         3S/+X9TNAf/iFmqiD6Be+4GsszIccyO24hCBshx0xfFrDG6CW0f+vVn5ZMk8ZARMNtg0
         zGHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=E+uSJAmjqneFK8rKzf6jR9rMRCMZMpc2wWay7eGyotU=;
        b=ufKvifgsNjscbMdOn7o2bPfHGXNQ/vRXidJWg9MAxXUvR9xuzBHWqvUgFEfYycefnx
         /P+fBvs/7meVx+MWNKiawq9MEUWfFE52HUrFWsTW4uNRbET8RVl007/rBYp3CZ4KKAxV
         Y8deGLrmLyWxZlbXGHI9GkmZSX3IOXFpMUg1v1cWZkVSKblSPvDlB9WjyidGetaO0uuT
         /48cx79aZuX8Sx/j7oR8Ezp7cjeCj+yXI6lEimNRJzgI5vjH/MRe7x8szast1hppagP/
         udiwmHlFYAtIfc7k50Oqh808VdjsawXUFSv/Y3JHMIBHJWyxJd9pu3eccgzczxRZhWIe
         +EUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ni4HzdVE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v88si17268111ybi.197.2020.06.16.12.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 12:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ni4HzdVE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlH2R-000152-O6
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 15:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlH2M-00014q-A1
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 15:14:22 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:36833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlH2K-00040i-LO
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 15:14:21 -0400
Received: by mail-pl1-x641.google.com with SMTP id j4so5562615plk.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 12:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E+uSJAmjqneFK8rKzf6jR9rMRCMZMpc2wWay7eGyotU=;
 b=ni4HzdVEeBiXyWErKo47uW5DHlapQbEcG5efn9DnGljzJ1wPn5VHVP6ArUsY75KBp5
 +/MBmvUjV0HcK1DfWOjPdkle6E2ZxtNG5Z+59mIJ1ZYz/ZINgaBVDxLtVQN0P/kuWvrm
 Qz2DazpWxq5XtTnqYps+5lSCbdZnNB1AW8FrZ+L6fv2NTtEqpujfxfK2pguBuEz7y0hM
 3iEGDYgBRKtJpC1xAuafvJqe93ZvVsnLghMf7YK9JaaXgZbTrb59nu14nM/Xju4spn4E
 rKmk1PK5fKXr/00CHX4C6pKvaU7oCbEwcS6aEPjM/cgRW+0ahDaEZwPDBi6KkJkXncr8
 WynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E+uSJAmjqneFK8rKzf6jR9rMRCMZMpc2wWay7eGyotU=;
 b=iJrsizw/1+kPKneSVrCxkGOlYgbNUWz6BPJ0soBlN5WS8TwmDRcroJ5/GfwgYIm6kJ
 CfMXMOPguZHcUx3DpLBXccDe6gnpQzXRJsCWsjwPXkrd3qsOHrAwc7cHp2bzv10bc0KX
 515mNkWxfh/nFzVDnfXEiPON3kYZ3HL9GKgTUk6lsK/qedY7fvy5VH6jBa3s2hQPIbsC
 gVx0MGfev+cQhwLPlWrSwroaGPBhQApSmhLXFfnja8eP0O9/9An53k4grC1xCTfI2dtW
 HEWuC5aOVdyAcHUS/+sYk5MytyQaFACe7+Tmi5ZfLNROZP92UvanWfM9E9q78H2eA8GE
 UP0w==
X-Gm-Message-State: AOAM5300O3NfMBOJP7gnxzTHii95n/FryjSc8AZYA+uSrSvNgTS4NfAC
 zg4ryRuDOKxTgMDKqaUG0PMrQvi7NG8=
X-Received: by 2002:a17:90a:db16:: with SMTP id
 g22mr3927082pjv.26.1592334858835; 
 Tue, 16 Jun 2020 12:14:18 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id i12sm18235596pfk.180.2020.06.16.12.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 12:14:18 -0700 (PDT)
Subject: Re: [PATCH v2] target/arm: Implement SVE2 fp convert precision
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200430132813.7750-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <329e48d1-f1ef-b73e-24ed-f4dc90f414e9@linaro.org>
Date: Tue, 16 Jun 2020 12:14:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200430132813.7750-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dgcmGVWrlpuW

On 4/30/20 6:28 AM, Stephen Long wrote:
> Implements FCVTLT, FCVTX, FCVTNT, FCVTXNT
> 
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> ---
> 
> Fixed a compilation error and collapsed the translation functions with a
> macro.
> 
>> Ignore my previous patchset. I missed the insn FCVTX and I ended up
>> squashing those commits into this one. At the moment, I'm working on a
>> patch for the SVE2 bitwise shift by imm insns.

Having missed this just a minute ago, I squashed FCVTX into the adjusted v1
patch for FCVTXNT, using do_frint_mode.


r~
