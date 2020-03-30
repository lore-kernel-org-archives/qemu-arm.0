Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3123476lfi;
        Mon, 30 Mar 2020 12:42:12 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt4iHLnq/njSIiaXlyKRUYjH4+HuUTBp31EHg0c2gq0TQ4njDWXBQNlN8nYyAsUhjpcdMc1
X-Received: by 2002:a37:8645:: with SMTP id i66mr1765701qkd.229.1585597332677;
        Mon, 30 Mar 2020 12:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585597332; cv=none;
        d=google.com; s=arc-20160816;
        b=Uu/U35PRDMCvm/dFZ52H/6dV8+ZxFTj0ZMjGhaiJR6oyvJa4sX4YBnJI5XuzXB1Jda
         +ov57AAWjchVZF+XKLRbM74mfr8+1/GTa3sicJpy4VyY9uuP+fLFwCRM3f6YvjGlXEAQ
         LXM8lsesWbZEQE0L8WHH8J85A3zOLEPgYuNp0hFpFhHV472zj8NVXYfTE2NSSti/pt7t
         QsIvRaOXS3RpgwDFOJo+70Uej0G16eQkXx1CvnKmxpH4yT9STaFOWx6kCf+Pl0vmUajh
         O2+x+2F5XrZoaOZEIITp+tEu3rIYEG1hITUjdtIrM6AqdM0Yo0g8FTm0hjHK2S5XsXg8
         XkPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YVbiY7GicWHT3QX2CL0ZaLYnW3hIV9PGbNKqy4yfuX4=;
        b=WlT5iMJCUqBBKZ56cUuhDZE3JLC2fAc4VJUK/HmVnUfpvDdGhqGuxDo7ig/4C7EKzK
         h2bJMqEJRqJCGCD4/WZixiWw5623jWQNbwTdKlpbVZWZvPoXqLky//YWo3jUjckHd24Z
         2P28pReXPpMBqLMJgVFFYBePmI7pHoc1jnDGZ6Pj8lpiDBp7N09ANbPU7XObkmZxT2QI
         SAjN19ceeNiv456OKhw2Vef1+DSG36CSBoA2Fbf3X85GSphriCHQYbM6ypn8kPua9i4b
         //1O0VEhVUPDCevCcHgrXcGGW8yUc5hyTcrNhHzjqzLSAn3A5t8D9aLkW0uFy/D5vvHV
         oXkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jtibl0eq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19si5998787qkl.169.2020.03.30.12.42.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 12:42:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jtibl0eq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJ0IV-0004rW-RU
	for alex.bennee@linaro.org; Mon, 30 Mar 2020 15:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57698)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jJ0IL-0004qj-Fm
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 15:42:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jJ0IJ-0000wq-OS
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 15:42:01 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:46207)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jJ0IJ-0000v4-59
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 15:41:59 -0400
Received: by mail-pg1-x541.google.com with SMTP id k191so9136946pgc.13
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2020 12:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=YVbiY7GicWHT3QX2CL0ZaLYnW3hIV9PGbNKqy4yfuX4=;
 b=jtibl0eqJ5Fb5OJAP7gyy6d1F7TQFrpPmDl1/wEHmLi6SCO+gmj4hwoatDeOCruS5t
 a1Q36bq8UmxKLrNQ1xBZ1DgS6bnajkYSH8gt4vr6yCWi4aeLz9i49fMyKp2PO+UFnl+b
 ZajQ3pdxIbS4TpiaxGRqTAv2eKEeKRzpqsbXYmc4GHJYJa8GBXzKcANSaHkmH90RMmXi
 07sQVWckmoToJ1uzHzs18Ilj97IxF91m5b0mdxYSB+znoh0koAnIpri0Mi0PITwkbqlS
 yVcqBP7AN0alzQynrMA/YjksgMCevlBlofGm2WHnFOAR8+XYB1XD00FTARajm8QSbB5+
 h90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YVbiY7GicWHT3QX2CL0ZaLYnW3hIV9PGbNKqy4yfuX4=;
 b=BMv+an7pFcJiKaFEpQnxgTgByDgWTwE7U/Vi8zPCq0VUNiqBjG5FGSGdq/InZxkAmu
 IoehfGDrtr/wIJJDwaX9MxDo/uV5YYa3iRNIHIGVKZYo6UdDyFLQxtIbFlYQsB9bzAkL
 ZR2tdXdkgBLpoXyGw/qs17a0qyYpFSwZ1acwNNoDxlOkt2YBFzU41R7Q1M1mFcue1YS3
 S17WnzEJWk8WMfqOg0XrBdtDl3uPdLPKKSoa0x9mtp/L3pcROQ553kP5gPUZkSBeiqlV
 yP2IIB5XaSJQ1szO+rkg6Q5OroXFD8WxU8u3VLAZwK1GWYxVQJF4mFx3BfFJDyVUGQuV
 DeOQ==
X-Gm-Message-State: ANhLgQ2QU4S663ViQ1rbfgU+7UGRrUa/vljTq1qO2dWLnx+S41O9jGis
 U8tEUfUzluSF26KBKEwyfzDemA==
X-Received: by 2002:a63:7b1a:: with SMTP id w26mr13432725pgc.298.1585597317827; 
 Mon, 30 Mar 2020 12:41:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id w15sm10840325pfj.28.2020.03.30.12.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2020 12:41:56 -0700 (PDT)
Subject: Re: [PATCH for-5.0] target/arm: PSTATE.PAN should not clear exec bits
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200330170651.20901-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f24744e9-73a0-5f09-0b41-5ea49f41b8cf@linaro.org>
Date: Mon, 30 Mar 2020 12:41:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200330170651.20901-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
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
X-TUID: t9IQjaP44LRb

On 3/30/20 10:06 AM, Peter Maydell wrote:
> Our implementation of the PSTATE.PAN bit incorrectly cleared all
> access permission bits for privileged access to memory which is
> user-accessible.  It should only affect the privileged read and write
> permissions; execute permission is dealt with via XN/PXN instead.
> 
> Fixes: 81636b70c226dc27d7ebc8d
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Compare the pseudocode AArch64.CheckPermission().
> ---
>  target/arm/helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Oops,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
