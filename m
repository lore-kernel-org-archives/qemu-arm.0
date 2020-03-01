Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1541119lfg;
        Sun, 1 Mar 2020 09:39:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqzzRmYv5RbV4okHry7iviqS1cnHWAcoGn0nebh0NLRfIINp1wxOL1PEe7O7UB7Oxza7CRiA
X-Received: by 2002:a0c:fb0f:: with SMTP id c15mr11518989qvp.209.1583084362318;
        Sun, 01 Mar 2020 09:39:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583084362; cv=none;
        d=google.com; s=arc-20160816;
        b=lFJUL+fn54IH9DjB+x7++r+sQ7aTknaPwC1hcKPtVtt1ifDS+8vbhQCqxJuZbnbLNl
         bf9DioFTScVMI2HM1HAphGV9yB21LJohgx/vSzFv1xze9ZXYll0/sx7Ww1aplicT1at0
         Vk/Uui4IOI+qSv19+sHDl224kG9ZYlv/P+IyWo7YXewfgwF88BEqK9GXFhSpJDL81jZr
         Ob6KO05t6Cxj6XJ4Digy7uoS4EDauHc/HHqk0YgqAUkAJucmK6ZxZ6GA0JROli1SgxFP
         eO00JxJ8u2a64UlJdmWqHzzIoCCL1wCaFuiYbguVHXzhicn60ybiseClIOKcVfXVvqX2
         iy3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zPf2ELswWbCzCNFcU/z1N+mq3I+1pGGuQpnnhEqMtVY=;
        b=W7F5BNsKXngObyfQQETw7bsS88WJQ4lFiJ0IyDwUZQOzc/DdKA//BSmznkfB27gymC
         o5xXfQRTtvdaOitLOd+B2lOZD43mhpffSBQMNwj2YuuQN0+I0uZiJaATATRjXlUtglwU
         xYCNa2BKsyzXNL4ZmkUYaanwm0kX3QW1b7IoeDBt0B/1PHG8T0bwajxxRzEwv222+okz
         iCpDhRcUCCB3ktnLOFJUOb2wxOOmJ6icqL5u6OL5DdJQh4Imtr70KZJwNIcgwD2JK1Sv
         06wxazeqTrxIMwf1kDXq1IyjjqXPIByp4p0895oIn8GovMK4rytema9uEMSzGlfMMCAy
         4wCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qsDnRFKi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15si3665942qvk.0.2020.03.01.09.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Mar 2020 09:39:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qsDnRFKi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8SYj-0006fp-PL
	for alex.bennee@linaro.org; Sun, 01 Mar 2020 12:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60628)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8SYa-0006fQ-LZ
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:39:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8SYZ-00055K-MV
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:39:12 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:38773)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8SYZ-00054r-FW
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:39:11 -0500
Received: by mail-pl1-x641.google.com with SMTP id p7so3244834pli.5
 for <qemu-arm@nongnu.org>; Sun, 01 Mar 2020 09:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zPf2ELswWbCzCNFcU/z1N+mq3I+1pGGuQpnnhEqMtVY=;
 b=qsDnRFKijUsyNilUPJ8pe4BIY09jF058/idooEHv+OwsWIYi9g7kpq0h52y3Pe0U5F
 t8G9bdv08k7Ovhlhh+6jZbEd4Ry15ibW/V1P6IIepLcfGAlBbR/IGuFHtUNc87adjk+y
 dihsWf0NxFfxqmotSrYJR5Y83L5erP73I+kuB/aeWHYiLYepMxueb1gz+JuopmeHaYHp
 o02rcEBH60aqRZ47DgD0O8xc7QNaXlwK6+3fR0aSMWCphJbi2D4l1U6lYIQsRx9lPxrV
 nFPY/2Q3S+O5JrGLG3KUCQydvnyw9h9+qaFUzUtpkyUOIYnhhL/CyHTSs0i+Y4ZLOatn
 9DAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zPf2ELswWbCzCNFcU/z1N+mq3I+1pGGuQpnnhEqMtVY=;
 b=NsZnPZzRoc/XjU2z5ET41bFK+KVXc12XP9iYjY2dI9nsyCaeQoF15jT0h7bsnPC5Kc
 opWV9SgF72FF1AIzQ69Mxa91l2gTt1x8j15qr8JQHlcB0mz7795XuUvLTOGoE6jWl6hP
 KCqv+uJZL6W4KX67liHyGHTjpHuqHe7vyltEkjedl6dB4kyJiHuxfiYECROrnQhLSZAX
 lLgkIVwdeiu7vx5gDST5KTSfsBXCRgNlVvza7WE4EhA1rbfyJDnAhs5vwNGQDV1cE9vk
 g088b9Uek2bLB7ns1YO1eMsyiBxjPW1JnFoBFqKjdwERWvGQSLa+Fv4wICU4qskwuOI3
 h9mg==
X-Gm-Message-State: APjAAAWI2l9djhqUI+CzGF58/lzZ1vZVbTONUqtH8NFol5Kuhib6eczU
 30ZYqpy9GOYhhpKgQQXotLBopA==
X-Received: by 2002:a17:902:7203:: with SMTP id
 ba3mr13745352plb.249.1583084350136; 
 Sun, 01 Mar 2020 09:39:10 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 22sm1577573pfc.14.2020.03.01.09.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2020 09:39:09 -0800 (PST)
Subject: Re: [PATCH v2 1/6] hw/arm/virt: Document 'max' value in gic-version
 property description
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200301104040.15186-1-eric.auger@redhat.com>
 <20200301104040.15186-2-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dfcd4971-f581-52ef-4726-a524b336f889@linaro.org>
Date: Sun, 1 Mar 2020 09:39:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200301104040.15186-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XRKjlWhiy9hs

On 3/1/20 2:40 AM, Eric Auger wrote:
> Mention 'max' value in the gic-version property description.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
