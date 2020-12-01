Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp214896lfb;
        Tue, 1 Dec 2020 06:37:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvM6mQnlwldWY0pkzVOzqNzCLDZ4Im3wOFEhIBZvu2+RyJuuAfk4hw1ywokIYlX7VUjkld
X-Received: by 2002:a25:6949:: with SMTP id e70mr3680300ybc.313.1606833455657;
        Tue, 01 Dec 2020 06:37:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606833455; cv=none;
        d=google.com; s=arc-20160816;
        b=XETy3oMuIrg8JyrXo3qLof5a0zWhTeKHa9oxEVoW2pP4jIZepCF0rmlhz+U2MPrNqx
         t5rz5j4xX3tHs3EwBU/tWhd1a1ggGA0QPipKK+8K874yezNW3qHFo5zTYJqCq1sZHwDF
         JJtcBCCMRITGnm9yDAs5Sh+6qNttnQ2whsopIvrdFP2uOG4AvISo+ScpcC6v0dYq5Aa9
         za3IP2exyCPaBcEbXjnSoAc4TMROE/pI+sR3iLkq9DC7glxbdHOcoaF46EUO1q1LeLR8
         tSKRg7bVQvLFwvMSzcW7oBKgsynq0O9dPtHVV2xi2aa3YCdVFQ8hSICNtgBLDDbEZCMv
         vhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=D9UGCUyh9UPMx+1aY//Ix5B2/LcCnYvndjmH62WG/r0=;
        b=uybX43Q8EdYhkK4dRsdCoLnDMTrn5cl1BHZUrXktnilnFFYF7pg2+cVz+CLfAAJNVl
         jb5KIP9z9yIo/mbyvUyeGLJlJ1rR3Y4u3CQvpm+o2JQcuokGI5csL+hztT4HtTu5tUBK
         4/mbuvcKMn/P58nH7G+O7WVZCO65FqUXyHUR1M8sIwHGrgBHlH7w9erhrBxtDgUPIqNW
         8+tVrdyWlqtzHA7/vQuEi/lJfr8PRgz/UWMqCI652HYT62Uu55+i7fysr9ol+CQwDP8W
         Rk7HBSRtUwFDjBUipNdH9BMZLpaZrpIle6fH3LogMWC76DENCYJxC629PlR/9TULnIkK
         89ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ks6PrpMG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b127si1758648ybc.390.2020.12.01.06.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 06:37:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ks6PrpMG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk6md-0003GV-0V
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 09:37:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6mN-0003Fq-Cb
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:37:19 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:40978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6mL-0005SH-BF
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:37:19 -0500
Received: by mail-oi1-x241.google.com with SMTP id h3so1931676oie.8
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 06:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D9UGCUyh9UPMx+1aY//Ix5B2/LcCnYvndjmH62WG/r0=;
 b=ks6PrpMG3v0aHTrCf3A2IwxS11Ai+GzFBaP+AgPOOVI7043yi/kRC+fWkR7mbOkKVd
 D5PJi+zThgdgQxgSZHzC054pzJQGf+/zaJbLx1oLPJL0T6EXjBCEyR1w0wRJe7SIv6/+
 L/yHIfFzw5z1nbcsk2oUzVnt3fKM/QYmXd3x6WZ7Sim4GmaiHhB+3DWcHiZ5NZzQG8+2
 5At7OBtbyNbwXyaCU7+fG17ym5PpbQIezRFoMisYf3nymZf3Mk0PNlb9gG9P4Z4nmkC4
 eUTd07IGqz/HgOApkTGQPlrlAB5qRErG6VcibdGcsbWLoa/3jMEZxkhatPAsEKjJIgJk
 RZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D9UGCUyh9UPMx+1aY//Ix5B2/LcCnYvndjmH62WG/r0=;
 b=HtY4zLwPZrFX5Dl3Cq9MH7e3EV+YpLPBF/hHliYerCmey8XHrAvvaAui8FsIYUd+7D
 BxYdfJzfJJvB0cI1ciaUIs/+6QXbb/oCOegJuJXLpQp0+kEHrgl4apQP/vEze+FBO0Nd
 kFm3xvvgzXr8cMUKXrizd6M6+kWIzgaCx7aOEtDpn9VRT7vla4wQ3GORxksiKSYZlUMm
 LhqtQd2YnOKdQuaZN+uZDP4AsRQHkWGJofV1PUdqD/xUr6paNQIWb8uhrHrY4wpUjyxr
 RlkxD5lAiC9I88RhFPBjvYNFLXfIYZ8uYVOBUgqjDMHY2zXuSFC6uutR/wr8xmwMkP/b
 Ghsw==
X-Gm-Message-State: AOAM530CFMnWVk5V0qK5R4LYs6C9uSLmAXM3+fUqvdCivbrelRGxktiu
 P5p0FVStOda/DoVT8OHbRoYGlwUlUbEMgSpG
X-Received: by 2002:aca:5a86:: with SMTP id o128mr1350546oib.23.1606833435085; 
 Tue, 01 Dec 2020 06:37:15 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id h20sm397147otj.57.2020.12.01.06.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 06:37:14 -0800 (PST)
Subject: Re: [PATCH for-6.0 00/11] target/arm: enforce alignment
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <CAFEAcA_0=iTLma9KgmW3jDhP=JYDaT9rVHZO5h3yaFDm8KUAnw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d27f5391-ac7a-6822-8fb6-7ee1e6f0ed45@linaro.org>
Date: Tue, 1 Dec 2020 08:37:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_0=iTLma9KgmW3jDhP=JYDaT9rVHZO5h3yaFDm8KUAnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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
X-TUID: 7mZfeHtVSrld

On 12/1/20 8:27 AM, Peter Maydell wrote:
> On Wed, 25 Nov 2020 at 04:06, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> As reported in https://bugs.launchpad.net/bugs/1905356
>>
>> Not implementing SCTLR.A, but all of the other required
>> alignment for SCTLR.A=0 in Table A3-1.
> 
> Any particular reason not to also support SCTLR.A ?

No, it's just a bigger job.  I'll put it on the to-do list.


r~
