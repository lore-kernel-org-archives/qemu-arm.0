Received: by 10.25.0.6 with SMTP id 6csp330702lfa;
        Fri, 12 May 2017 09:50:50 -0700 (PDT)
X-Received: by 10.55.169.193 with SMTP id s184mr4480982qke.118.1494607850002;
        Fri, 12 May 2017 09:50:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494607849; cv=none;
        d=google.com; s=arc-20160816;
        b=NhCm6WjFf3raVX31lq0NDpimCyewWRq1/NjbSCtW9b0L7ObDxvDkImfgMH8N5ZL2aH
         7tpuFuRbga3eIKeGL3/Xjbur/2ci04X9TGaog0HFcRzaCQVew4zIvXq/kU2yk/FC4YU1
         WjRpSV13kf1gBm5DyvrYG2dd+VPzNROmdmRfDFhdQ+SBowOGUH98wkvuLF2Q7qHXymOo
         iqjOH7KCoKw4ZS8tPnkWmcX4vtMrxC3g5LVCfFnMjEkI+bSlAoAMkRvaZrjxLlCcAbYe
         y8qL4e8j0cTgeuehbUtXd1x+kdCByRXBWrr9k1RiftD8H7JgPMDqwgQajMt6z74nPJBy
         i+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=XysmBFVh4cz8thDSHh7pF0ieWSvZwMwQFcpBkLzW6OQ=;
        b=G17l8NnJBmn2jIR2uettV1PA+ZMws3SNL2BoDn/FX/njRJq9VtDEmwucL7N5fVvNSN
         C0FL5xKBQI/uFBUZcdfseVtTd0h5RsS9JrHdflgiFRvNhjF54PvScNQVC8QnYlCLc23O
         pcWHEf+JSrEdsqIQb/YazMtMRHWx4KmlOEW+sq8Ywr3i7Dd18HVm6HzE3vq8tEulh95/
         A1hK2NCeDyf6GQdO+hvijefqAneLAvcgKdwisjgLhgkwYNnP/Etpnacj1bLzEx18oDXX
         vVNNhvcbfeBZynZIEEUUBQGPof9uYs/NW4D4yo07YjiyBukWxROnf/n+jQm2GmSB/Ecn
         4OlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h12si3822202qte.190.2017.05.12.09.50.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 May 2017 09:50:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54605 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9DmB-00064c-Dw
	for alex.bennee@linaro.org; Fri, 12 May 2017 12:50:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1d9Dm7-00064V-W1
	for qemu-arm@nongnu.org; Fri, 12 May 2017 12:50:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1d9Dm7-0004gi-9R
	for qemu-arm@nongnu.org; Fri, 12 May 2017 12:50:44 -0400
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:32935)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1d9Dm7-0004eL-5F; Fri, 12 May 2017 12:50:43 -0400
Received: by mail-qt0-x235.google.com with SMTP id t26so46086350qtg.0;
	Fri, 12 May 2017 09:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XysmBFVh4cz8thDSHh7pF0ieWSvZwMwQFcpBkLzW6OQ=;
	b=gR9kmPmhBvpUFF1ObERCuT93nHcwima5X4dQWMG/9l/AM/tKUjJjejll05nrFqkiB7
	8MoC2DoUlU60cr+ewI714FYDa22TTYuGhzztWy0U2Sdx0PFpJE5TTg+G2ToRcpIOOrUx
	ms4LG2X9BsLWO+RCXGd7xaZJ+dOwiNVOKgHsc/GKOW5tDeem4TJeJnXi0MNel9BhkdV7
	cHnohIVoz47Ihk9pMOOOwcnG9NExqzF9wxJHZ9DrR/aFHutvlSD1qMIFBuJ1b9JwbVk/
	VZcmLKhrYGNoXt7OjtpvtTDzxQBz4q9+48+UUnEFrQi+HYkCrOaCxJxMgNJfdPApTZIE
	pyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XysmBFVh4cz8thDSHh7pF0ieWSvZwMwQFcpBkLzW6OQ=;
	b=HPmqs9x/7HNRyWQkdcNI4ynhndlz8Xda/6dUIv+q1w1fok09XGx23SEnnXwYnTS8ts
	NsBQoR5s794TlgUkftPBJSBLS6KuyH21DB2UyoKs2QBfkiP2KCn4yn2SkeNfFqleIhVv
	icGNLbVM04Il3dAimm7z7c/OmwFM4Ap/76h1Cww7eoaJWl9QfIXPrpxMG7vndcxv/4VA
	w4VNgFfmOXqAr63RlXOFQgn1+x4/N5XKQgbIbVPxzr4IgN9prO2D3fTa8S30Dwj3bi5D
	JlcqukYLn713ch9zNjLXuoUewpNa6sssEbDepM8f9JcbVQNsYLIIjw92NnoRzZ3bdfCK
	/ROg==
X-Gm-Message-State: AODbwcB6VjV9tWMgKR4ynQFO9S8CxlwHlK86szglXks4bZHFeP7Vrnym
	Losk+EYB/DPAKQ==
X-Received: by 10.237.54.193 with SMTP id f59mr4494954qtb.63.1494607840902;
	Fri, 12 May 2017 09:50:40 -0700 (PDT)
Received: from bigtime.twiddle.net ([2602:47:d954:1500:5e51:4fff:fe40:9c64])
	by smtp.googlemail.com with ESMTPSA id
	v7sm2652420qta.13.2017.05.12.09.50.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 May 2017 09:50:40 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org
References: <20170512033543.6789-1-f4bug@amsat.org>
	<20170512033543.6789-3-f4bug@amsat.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <f447c23f-f63c-f3bb-a1b9-f63e5aff4063@twiddle.net>
Date: Fri, 12 May 2017 09:50:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170512033543.6789-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: Re: [Qemu-arm] [PATCH v3 2/5] target/arm: optimize rev16() using
 extract op
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pw+lntHI9WPC

On 05/11/2017 08:35 PM, Philippe Mathieu-Daudé wrote:
> -    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 16);
> -    tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
> +    tcg_gen_extract_i64(tcg_tmp, tcg_rn, 16, 0xffff);

So your new script didn't work then?  This should be "..., 16, 16);".


r~
