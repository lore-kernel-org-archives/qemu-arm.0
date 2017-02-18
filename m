Received: by 10.25.77.65 with SMTP id a62csp679359lfb;
        Sat, 18 Feb 2017 09:46:37 -0800 (PST)
X-Received: by 10.107.20.78 with SMTP id 75mr10681512iou.99.1487439996969;
        Sat, 18 Feb 2017 09:46:36 -0800 (PST)
Return-Path: <mdavidsaver@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com. [2607:f8b0:4001:c0b::244])
        by mx.google.com with ESMTPS id j10si13473156ioi.87.2017.02.18.09.46.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 Feb 2017 09:46:36 -0800 (PST)
Received-SPF: pass (google.com: domain of mdavidsaver@gmail.com designates 2607:f8b0:4001:c0b::244 as permitted sender) client-ip=2607:f8b0:4001:c0b::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of mdavidsaver@gmail.com designates 2607:f8b0:4001:c0b::244 as permitted sender) smtp.mailfrom=mdavidsaver@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: by mail-it0-x244.google.com with SMTP id e137so6660243itc.0;
        Sat, 18 Feb 2017 09:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=FeHZfoL5f9GNsRFj66x4XfSQtKmPzFN+R+gLnwwGVN0=;
        b=oULWwOg38Oq6MReid/z4CE8FpMoMDSTttdVq0BZ5BMat76oK9JCbMpxoN1Li+1LAES
         xfDlYv/IgBNwtAcwCDvJwTEq8N6bMaOmw+zdzbxOx0fpA1dhkc+S3ZHEhAMC7eaxaWM9
         hIILb23SEhao4DA6C4Iff1BE5Z1aPgGSSuITHdCI7gkLZ2iSntGU5479Td7SATFEBMsW
         hXJt88jWMw7YLuGKUgar0xKB0DsVNtsXNz/12pP3/vJk8d8/1Vi/uUOSNpaF4/Hoapug
         DBoVHGLn3nVEKpEBLG95guftB+PA/J5EIroHvpOQ2/BrVkEXb9lx8qFBUKkNi8h/T3dV
         Cj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=FeHZfoL5f9GNsRFj66x4XfSQtKmPzFN+R+gLnwwGVN0=;
        b=riALVDqdaUhVcgIGGZZ1vJWdwuCLjoAt31OI8aXhSHld3kMzfJaN8OZbeE1mc1B5Fc
         1+2alqnL1CAiiATmjvjsQHTzAouZeLzPftT6nu8BdWC81ZMljKOGpdJYEMfAl8FL6Sw4
         4l14Vt4KKLEG/Pk+4zx1PsPwj9w3rY73u2Uqk0eA2LPClgjlqJfVJPBAHgyXmmGOXim8
         Nl6PP4kfXXxCAcs4nXQh8vpTdGbYz96+9klAxDfQomP0uHnu0nepHPAIx7e8bqrRF2Wm
         6fgTAg6uT/HZmkE3ZewOQaQYO09FbpMe+BExch9j7UWox0SX1MokCGqR+CVhrk28oCD1
         1llg==
X-Gm-Message-State: AMke39lx8aMoNWT06oEMPdZeB5ESdAuPK4mV+S19hIOltMlMf8LiUqxTdMhPsd+f67uRew==
X-Received: by 10.36.84.138 with SMTP id t132mr10754412ita.100.1487439996503;
        Sat, 18 Feb 2017 09:46:36 -0800 (PST)
Return-Path: <mdavidsaver@gmail.com>
Received: from [192.168.43.106] ([172.58.136.227])
        by smtp.gmail.com with ESMTPSA id h69sm2593881ith.16.2017.02.18.09.46.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 Feb 2017 09:46:35 -0800 (PST)
Subject: Re: [PATCH 3/9] armv7m: Rewrite NVIC to not use any GIC code
To: Peter Maydell <peter.maydell@linaro.org>
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
 <1486065742-28639-4-git-send-email-peter.maydell@linaro.org>
 <87mvdnvcxx.fsf@linaro.org>
 <CAFEAcA-PFJp_9=NOCFqiQp=xF6Y-TnmE3bfU3zDa6xH7nK2Zfg@mail.gmail.com>
 <CAFEAcA8X1qvweDHBWQjZwH68xWdn4K+Wfqv0yRhjM5QCxd=VBA@mail.gmail.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "patches@linaro.org" <patches@linaro.org>, Liviu Ionescu <ilg@livius.net>
From: Michael Davidsaver <mdavidsaver@gmail.com>
Message-ID: <1e2962d7-1b50-9543-3e1d-9c388d4167c3@gmail.com>
Date: Sat, 18 Feb 2017 12:45:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8X1qvweDHBWQjZwH68xWdn4K+Wfqv0yRhjM5QCxd=VBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: cq7d3W33+HKn

On 02/16/2017 09:11 AM, Peter Maydell wrote:
> I haven't actually checked real hardware behaviour, but I think
> we can fairly safely implement this as not checking the IPSR
> exception field. (We might as well go with the "reads 1 in
> handler mode" choice of UNKNOWN that the M3 documents, though.)

For what it's worth, I dug up my TI TM4C1294 eval board and re-ran
test10.c [1] which is designed to probe this behavior by nesting
exceptions PendSV within SVC.  RETTOBASE is 0x800 in ICSR.

> 1..12
> # BASEPRI mask 000000e0
> # DEBUG prio 000000e0
> ok 1 - 00000000 == 00000000 ICSR
> ok 2 - 00000000 == 00000000 SHCSR
> # Call SVC
> # In SVC
> ok 3 - 0000080b == 0000080b ICSR
> ok 4 - 00000080 == 00000080 SHCSR
> # In PendSV
> ok 5 - 0000000e == 0000000e ICSR
> ok 6 - 00000480 == 00000480 SHCSR
> # Back in SVC
> ok 7 - 00000003 == 00000003 Back in SVC
> ok 8 - 0000080b == 0000080b ICSR
> ok 9 - 00000080 == 00000080 SHCSR
> # Back in main
> ok 10 - 00000004 == 00000004 Back in main
> ok 11 - 00000000 == 00000000 ICSR
> ok 12 - 00000000 == 00000000 SHCSR
> # Done

[1] https://github.com/mdavidsaver/baremetal/blob/qemutest/test10.c
