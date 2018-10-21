Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1752380wrt;
        Sun, 21 Oct 2018 06:09:10 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62DfhLyVcvRWfxgJL3NA9J9yoE/DH2K5DBsjpJmEheJTf86HGvjBt1RfEJ/qJWwszCpGhrz
X-Received: by 2002:a37:8e01:: with SMTP id q1-v6mr39873161qkd.59.1540127349916;
        Sun, 21 Oct 2018 06:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540127349; cv=none;
        d=google.com; s=arc-20160816;
        b=pdJDtpUMVJSNrPtQa6u4MRlHNJrqP3wHqU7wo51vEFS3GNdM1SXLirQqObBahf+LH7
         o5B89JzYfTH00CTXr2KvLlVIsosQ2AaJyZ5ISMEmZcfvo0b4Fix1l1LkpE+3SGpgkHVw
         WD/iShEq7fHT2AmKLQCGGLx+l4C9CfxU6WkjFY8K8VJ3SEDjeNXH2NV4aW8XqF7RBLI2
         ko9uyxHi3/hZy6NYLkQmYcNAGi+1NPtxt0a0g51xIDuf9Rp0uqIy8Etn9IuZVr1NuYzA
         FxRNiViJJpvWgI+gGHve3LrGb2IsWXtQAKl44LNpjXtrW2zWt2F+Y90rPYPMEmHs1Afu
         IOGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=LmlMpcj7n2Z3FDSklQ9GgNGF0ZXhm0/Fpfh0ePe00VM=;
        b=Ivk1UptlJcO5qoWW0zvXbfA9eo1JflAUk5xuDWHjl8IlJyGrB5wJwm2jdq1IgFqI0S
         MMcQex8RiayXRqu/M5vjchj83c9kXXL27oL5gaxDZUaB8McU5U7jFpoMpZ++w6dsvwvO
         mET0I3rppxjdlYnXgy6ACcGTQY/nays9xiJdEJETzm2CyCl6skZsa8WM8d0ZBjnsDl81
         mu7cVGbSheHRpngX+QEitHWxO/+xN6aQ42+X2goj/l8Vfa6xIInCVELDQjrZRYkOEMeF
         fv5NUI+qAjy2HwCpaAKQkERj4oN8wNwjtZo3qEMCy5ECh3PzQbsm6Mg0UykFQFAFHjxV
         Vozw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vcb3ZtCw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f23-v6si1576059qvd.124.2018.10.21.06.09.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Oct 2018 06:09:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vcb3ZtCw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEDTh-0007qh-Aw
	for alex.bennee@linaro.org; Sun, 21 Oct 2018 09:09:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gEDQi-00057Q-5S
	for qemu-devel@nongnu.org; Sun, 21 Oct 2018 09:06:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gEDGN-0002nI-GD
	for qemu-devel@nongnu.org; Sun, 21 Oct 2018 08:55:27 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gEDGL-0002me-HI
	for qemu-devel@nongnu.org; Sun, 21 Oct 2018 08:55:23 -0400
Received: by mail-wr1-x436.google.com with SMTP id f8-v6so2467386wro.9
	for <qemu-devel@nongnu.org>; Sun, 21 Oct 2018 05:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=LmlMpcj7n2Z3FDSklQ9GgNGF0ZXhm0/Fpfh0ePe00VM=;
	b=Vcb3ZtCwXOZaC2xs2jgrC3WAr4zQHYSCKX4GBLNOmmfObazbn+Sr3CB5lTxijVUpeG
	8sd7c0GoU1WnbqzNCEZtTUPmeH+YcxDBl01FHi01e+Y6j1fIKWhcgHYG1fJyFWFdZm1D
	LC0uGvVsrjBnmVc8fyRLTBzoqn3vdVCmttDSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LmlMpcj7n2Z3FDSklQ9GgNGF0ZXhm0/Fpfh0ePe00VM=;
	b=oslt9RFJvrjGAkNBgmx4aYWde02d7ll0O2vl0khCuuNK7OG1bmJqNlYTBAQo0Hecrn
	ZfCYKhhA1N0rqpRlet8gGJINlncmvqWamzFgAi75nsXQs0nobT73y6Eu9+oG5NhP5Nbp
	9fEQeDAasrt/ngdhehbERagRotR5Bd/rjArsEvC8aAm718YTB6yiA2iNa9Wtqyi33+lY
	xQc/agGclOurg80GB/JJkrisaugGuheIhmvWGUNOHutPb/2A6a+foPHaaw02Y2anDM4U
	49zMRyl21WabaVGdicNIgCPitTw89W67dReDSJ/JgubxsWfFoFZJv/k8y4keyurWbo5H
	Djog==
X-Gm-Message-State: ABuFfojkLNpeW2RHXa3g/6Ph3ooa1thP8eeMpPJxB5+70mbjJo5kQxY0
	n0Jt+Wh5ddkAideg0MXkKPrwTA==
X-Received: by 2002:adf:8bc5:: with SMTP id
	w5-v6mr43550465wra.110.1540126519900; 
	Sun, 21 Oct 2018 05:55:19 -0700 (PDT)
Received: from cloudburst.twiddle.net ([37.205.61.206])
	by smtp.gmail.com with ESMTPSA id
	l11-v6sm42599284wrn.61.2018.10.21.05.55.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Oct 2018 05:55:19 -0700 (PDT)
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <20181019010625.25294-1-cota@braap.org>
	<20181019010625.25294-10-cota@braap.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ca710406-24de-df61-5cf3-72ade8d436ef@linaro.org>
Date: Sun, 21 Oct 2018 13:55:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181019010625.25294-10-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::436
Subject: Re: [Qemu-devel] [RFC v3 09/56] arm: convert to cpu_halted
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YRv6BALocqKR

On 10/19/18 2:05 AM, Emilio G. Cota wrote:
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  hw/arm/omap1.c            | 4 ++--
>  hw/arm/pxa2xx_gpio.c      | 2 +-
>  hw/arm/pxa2xx_pic.c       | 2 +-
>  target/arm/arm-powerctl.c | 4 ++--
>  target/arm/cpu.c          | 2 +-
>  target/arm/op_helper.c    | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
