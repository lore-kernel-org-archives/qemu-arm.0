Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2301127lfm;
        Thu, 30 Apr 2020 12:54:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypLZ/15+CQpCf+TSDQ3Rbx+KSBUQTq5+QneqK4PRhyrJE6onOtC/wpBXkZuRcsirHZnt4if7
X-Received: by 2002:ac8:4e44:: with SMTP id e4mr157925qtw.326.1588276468723;
        Thu, 30 Apr 2020 12:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588276468; cv=none;
        d=google.com; s=arc-20160816;
        b=ZxNyJDkYhiaUyJV27sTMMuFimp1f6Hl73KFCJ4UR5ujfK6G8IwBqOf4IaCJjT/30Al
         zIjgQvWrZUkonqJ4zfda5HNOc+hD0/xaqWZO2SzdDsFGqWoIRR0cR/MAydm5IFVy2CFs
         Yb5aQwRMjqxlWkoee0mg49a+Y5ZjJcjQS3SzMnQcesKeaTBL9OskWvuqt55rgRgiCG/t
         Qa0ytGEB5pc1Ab5nlctGm6D5oGVcuCl3DCvMrjaWNgTHYkBfOwYwu4LvaGFCE0mscPIR
         jXox3tbDllfp3bsHmViX/phGEK8SVf8PIpnTD7lAjAsmxezTzz+Bi5euxLuCc5LVf02H
         obdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5CqyjSpeZqqR3LzV6LwSAhwRgLGWMCp1QYDDERvst6I=;
        b=Un+FK3heMiSlTVjiHUS80ScQXk3VWGeCdfEWU/+vaTBKONywJ0cqC4fQnDf3HO17pZ
         C5vEKsCIQnO90lKdLkia8jTjs1tpwqO8dgtqVi9qLIum0p+WdUbUYqnYfkLgF59DXT8P
         QV+hFCjAp/SWlvmIOMm0xsvk1brUiHjd98rSUWEGEwcVtY+XXiHVanopCQjtC4XJHIwa
         RvQlkuk6YZKu98Tw5Cp7hkwrPBa4FVlQr/lJD37JTKNZJ0E8q/VOgWvTuysJ3pga0mDF
         aQJ8C2LpGs18SSlxEkuSKAY/bFCRUIGGkgn6qaYDh9CYPMEybuCaneZWe9j3RrkdqItl
         4F+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gJQEli4Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id p3si346695qkg.182.2020.04.30.12.54.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 12:54:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gJQEli4Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUFGO-0005HU-1Q
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 15:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35380)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFFP-0004dI-7A
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:53:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFCl-0002ac-Vo
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:53:26 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUFCl-0002Yw-9J
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:50:43 -0400
Received: by mail-pg1-x541.google.com with SMTP id r4so3375691pgg.4
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 12:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5CqyjSpeZqqR3LzV6LwSAhwRgLGWMCp1QYDDERvst6I=;
 b=gJQEli4QGptQ6J2JeDc39eTvoDX5/HNheIqbLIboWLx19KTwy+MrqfOAS++soWRDMK
 +Drnb1sDAvM53nMyXJzxjcUB9kMyiL0dhMVI7LtvQ0mX4GfhAXf+nI/n3vlNfxf5x84d
 OCM3f6R3S1VG7cPQundp66ivEOpEGzF/s3qKtGX589f1HNWb0Ey04ILzypvjKtJPCL96
 0ejx5tqvrjr3isK/UD/bRIT7Sqc8DxlF89NdWS2TMkyNn9fbPOwZ36MxWIPMKuDL4xot
 9CE3ie1/qWfSAjKd2UbhLaJjCLsutyqiJ0ur+WoLhOJSOF6zd6zSgKnetspT29ELoII9
 tRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5CqyjSpeZqqR3LzV6LwSAhwRgLGWMCp1QYDDERvst6I=;
 b=shMg+/S8SwZPa2wJ8Sdfu5gxQdnNNfX2HcriuK5VKDvV//W3q87XlrNcxJcIRK7Iw1
 K5igrj4ZCQBEOScWFbzpZ9CN+n5kc4j6Nrr467ZP2PS70ZjYXvP12guihtdEZK5bPrUp
 QPS/bES9DHEuXyRydizh1p6z2EAOQXzZ5WlEiKnGnEb53U49pc+3qSrE0L51zz97Sf+G
 MzRHsloFINezuk7gypsZGw2+Ig/tFdWm0NsBj/9m3+8dsAhlZKvCuzxFEyZcwLpqwrtr
 +cebWVsvjbmI/s5cf8vHPzCwmjBV68MMpgdcx/BZ51dew8dLyJm5reruxF2FInTuOKvd
 +0mw==
X-Gm-Message-State: AGi0PuZgVPwvPaXYsva7r6znH2hxhdvpWlRxfNokmDwLEtuOKu/fw3Gl
 FRO17cwOFkaYJAzAumeCyrHjhw==
X-Received: by 2002:a62:e50f:: with SMTP id n15mr391862pff.22.1588276241557;
 Thu, 30 Apr 2020 12:50:41 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id y16sm522078pfp.45.2020.04.30.12.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 12:50:40 -0700 (PDT)
Subject: Re: [PATCH 18/36] target/arm: Convert Neon 3-reg-same VQADD/VQSUB to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fa8bd23b-cbc1-e8ab-e9e6-fcec45064ce5@linaro.org>
Date: Thu, 30 Apr 2020 12:50:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::541
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
X-TUID: 3ZdqY3NWFKXx

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the Neon VQADD/VQSUB insns in the 3-reg-same grouping
> to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 15 +++++++++++++++
>  target/arm/translate.c          | 14 ++------------
>  target/arm/neon-dp.decode       |  6 ++++++
>  3 files changed, 23 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
