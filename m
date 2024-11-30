Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp1307321njk;
        Fri, 29 Nov 2024 22:15:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUA0hkGZEph4wmZ4ivksCEtBGcjGeGm8bxHLH5It1jpeDBP+4YBn5KHGlSbbJcAgrPzkNXq9VXI2O5Weg==@linaro.org
X-Google-Smtp-Source: AGHT+IELc2ERiyfg4IHZ7f7zKm365J2v7dt53dF6Uvp8y+ISoHffHxE3IelvJnroBbVDdGzZIb14
X-Received: by 2002:a05:620a:7186:b0:7b6:91a4:845b with SMTP id af79cd13be357-7b691a484admr389329985a.15.1732947345748;
        Fri, 29 Nov 2024 22:15:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732947345; cv=none;
        d=google.com; s=arc-20240605;
        b=eGbx0pICA/D1aV63YkLUNFpju+JsyVfetRWXImWPFV9OlecKxSbi0vpQbzrnMcaEsJ
         Dkw51E7Mmo7nuROsrC4CKmSa7WVVioo33iJ9wFu0GWK+R2pTN3xz0TujCl2ufMUmadT0
         bw+BL4wSLUQ0uhGBOHIIOfGdTol6bjmvcTgZLzJGC5Y8jggDG8MVPWQttA+VsBQAQBQd
         X0Wc0pRiA1A5aeJPAGsbuZIQbgYPJubPSdHOGeMQWEomM9krxAHXX3wbqHULblXW+ggy
         4QDrymAnjZ/NSh7F66dsgakD2VMB7sNPWviyLqqET5ny9XGtWn/vt/GX0+QHLMAr9uiF
         IrUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zsppy5mifOqwG1NxW07VQAvccK4JcXuvMoQenyGT+Gc=;
        fh=NMCjjLYrHVId89KCH6ticICPFCMBy8Y9nHu9gQlOMSA=;
        b=ealjTbjZ24HEfwwJQeIgdhvaUToj9F2cFkB7rkrrFWhTdUwAuA/GSvK7S6xWNmnhpg
         ss7rFA9z/A+JIjbzL74VIX9bbTcir/6nAzUosyUPWYVqF/pPwwn1+caaXKwU65r/R1bi
         mMLnlt70yhVC4l0oGsbdbREGNdMxaGOIfVbO4phRiykZs48BvDXSQhKUYW2hqgraEHmG
         SAwfuC11Uao8m/lEKsgl9fNeE+zcAa9thDMoBxkv3Dn38zZhIvc/tZVhV262NWayf8Ag
         0D6SsvowoxscPC4HvFEOnJqqUSmqmvEcLzJKnn5FlTwSOqkFWVxkkfoaxIOw5MSGYfU3
         Bk2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="ViOOAz/6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849e0dabsi615411385a.548.2024.11.29.22.15.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2024 22:15:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="ViOOAz/6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHGlc-0006j1-Kp; Sat, 30 Nov 2024 01:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGlT-0006aW-Cy
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:15:35 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGlQ-0002lP-4D
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:15:34 -0500
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-7fbd76941ccso1806455a12.2
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2024 22:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947330; x=1733552130;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zsppy5mifOqwG1NxW07VQAvccK4JcXuvMoQenyGT+Gc=;
 b=ViOOAz/6GAW4HBd3SpXLAT0eVtuaglYcucFnTWXAwnstIwKS1o0b3RJ9VfMzDxBFrS
 henavile58fat4S0ldfcIt7bDzYwd17S6em4KxEo8PSJ0QNSp/+Z05J2y1Ler8GL7kkD
 leRq8KUC6W0SXymD0mY5tbix6g8G9kmpb/Vcoce8TQtNULBml7CZRIGRV1odsV8gSi5Z
 qhry41aHueA/SYFikLuWOJDB0zTOw3SrsBUnIqPTVIrsZ+M6ZCfwznmSGgLDl1dfGAVl
 T1W7DrjJ8qgsb3QFSr5sWw4PmbSO172rVXfFvOn/UEo0qKASk7GIZeBBqrNPoM0cTURx
 qE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947330; x=1733552130;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zsppy5mifOqwG1NxW07VQAvccK4JcXuvMoQenyGT+Gc=;
 b=NSQHZFbRdf0bw6FYEsPdsWV7zrTewqByoa5OvVk3qxKurof+cUeP/v5sFcSyLW/AQo
 l595MxzNFmBVmmRzkag7cE4flK5V0OGlhuYXghvlrYYw19WoaLCrja6JlyiiE/AJ0ZF0
 yDNbBX7Jhw4M3HEAIGg7C3BNeApbijb4SJey11PPW85r+zwabkXHAfn2o0VQNJC5plsE
 vDhP76b9LQHwhI2lLB+wn/pGm1gFJNQv9f9rTymrG11XHAg8xoyUzMhOqTzWtyUzQ70r
 qarTUpsR+my6fFhlsG7HSvQ29cA6NGNpeHz41n1cKWX9cZvXB9cJRzIrI4d8oaA3l3Ww
 euAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8i5qJllKxmVRvy4ib71fjCgOegltCkMAIy92hj36jNufl226EQBiV+mtxwGSTzXuP3SeDrUVj+g==@nongnu.org
X-Gm-Message-State: AOJu0YzHFnZwYf9Xl5rvwn2L8B0mhdFfLNr0BvJo5PHNi32GVutskxBU
 HAEnI5Hm3rWntcLaaZMVs2ClE+CugNAqfyWM99xml/dFIEFbatghYG3edqiJo0U=
X-Gm-Gg: ASbGncsL2roXYwNmjl9yci6ZcMfTr02ICYxZ7Mt6UdlMsjCI8VwLALkePA7A6ytsAni
 8AdNA96iJPlgmmohzNCk62jONFh4s58r1+Z9P8lsDANgnU92FWTnvDO3wVvpNUe1Tb2a59o953x
 mVx/LD5AxTQPvQ/XOFDt4mY864E2FqFc4+Ix8x6qh4jnCQQ1/ai6o1TjVbD2tlsTjdmEiCluZDg
 73Tp93fnwYhIB5be5YZGYBOIQ1rum7K+sOguSrRrl1uem0mU3vIDR+GhJooZmE=
X-Received: by 2002:a05:6a20:7349:b0:1e0:c8d9:337a with SMTP id
 adf61e73a8af0-1e0e0b4b612mr22970054637.27.1732947330730; 
 Fri, 29 Nov 2024 22:15:30 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7254182c817sm4488095b3a.170.2024.11.29.22.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:15:30 -0800 (PST)
Message-ID: <9930c64c-f323-41ef-a4b7-30e39fbf83bf@daynix.com>
Date: Sat, 30 Nov 2024 15:15:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 08/15] hvf: arm: Ignore writes to CNTP_CTL_EL0
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu,
 Alexander Graf <graf@amazon.com>
References: <20241129152506.59390-1-phil@philjordan.eu>
 <20241129152506.59390-9-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-9-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hPWQmjKU6gRo

On 2024/11/30 0:24, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> MacOS unconditionally disables interrupts of the physical timer on boot
> and then continues to use the virtual one. We don't really want to support
> a full physical timer emulation, so let's just ignore those writes.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
