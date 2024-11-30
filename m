Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp1307495njk;
        Fri, 29 Nov 2024 22:16:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWdfHlReIkf0HOmyf8IrEARqUCy9WWQqKcQn0w/hnhXEA/u0xr8tikx/h22hKmvAdjlZq+wFaB6s/w6MQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGOg6qqUo8XhjYAE4TBhHKss+b244ld9FtSFJIfy1Jd7yyZWpT8kuNrzH12DbNv91uZpm6X
X-Received: by 2002:a05:620a:4549:b0:7a1:df6f:3625 with SMTP id af79cd13be357-7b67c487092mr2365113185a.37.1732947382855;
        Fri, 29 Nov 2024 22:16:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732947382; cv=none;
        d=google.com; s=arc-20240605;
        b=b/HSGLrwSsTbGPAEhbASdpRiMQFQec7l1k8Os9A8lbqLrDD+thMJMNJR3p/1Oc4sqs
         sJX/6OwKB8xeXPLbqYsaDSys7JBUHppfoPJ0gl9cFrAaXljlNGbckxSrbMPoOdlm7VH7
         MZVsKZJyJW0qqa1DQFpi03Iu2/YlrbJ+cJaIUNRZJE9Uw2kI7DV86hmLwUaF0Dx67p6E
         oUAoAVmOLAqIlZ+KwotT+kPIsMOLXuBh53rOLbhFd3vyhuB156l6QHFvHLv7RliSvr0g
         Z8GyNQ7lzjBkl/dKZm/PpH4fidWT+0VWK8nVo3JHQkwGBttf/5AmJLGMR9dXaoLzx8hu
         GGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=edTZ+SkrnE/JMBfnnHqKmdSdnVM2/S+y9Q27JWUYvuY=;
        fh=grpfRNSn791zgSP/xuIiVlTlL/I9hW4VHzhYh4LBFmg=;
        b=FJfKMCyyFhPpNnoYKLDjnFbQ2VUWl49gj5gqtYbOAl7NUW9xblWy+AmfJiuVobjFiD
         kUXFT52Z/Dv3HrGMAUjq/FV9P6eJrq7oh9zR4HiFRhVu/QFnAPwPPoa8RMSAWcPmzfJL
         Klbw2AcX5X7/R31iQSWIJDPpcnA9wPXS86p5AwRYpoD0w0OC2SOCrvy25UKgCu0w4D6M
         5gkrQJUuaOp2DDSC6773/bzTnXjnVvKbV2mpVwEC7ldGCi3UrjQDK3Qrn9pKnGKUN0In
         EpbMkVdT0K/OzNm46anlSk6n5+M01dL8TNihXM3fNSpfu58/A/bPcabHhwrsOaozg+ae
         mjaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=2bXZe2YW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b68493fab5si618443685a.157.2024.11.29.22.16.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2024 22:16:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=2bXZe2YW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHGmA-0007OV-FV; Sat, 30 Nov 2024 01:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGm7-0007H1-1M
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:16:16 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGm3-0002tj-DW
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:16:14 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-212348d391cso20593815ad.2
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2024 22:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947365; x=1733552165;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=edTZ+SkrnE/JMBfnnHqKmdSdnVM2/S+y9Q27JWUYvuY=;
 b=2bXZe2YWuXB3Y/v/48XHvcM41ifr7J5f25bSSTpSMG5CmsQT4Lz7rJ/8Ei8kFJfm+Z
 Io7S9zwNya9u6b2C7Pk7dk5bFasxDtgV5SfQ5H9pvU31tcKcy4Oi94jL5RkUeMETmkxX
 2e8ikyhUbgPL9L8u5LwVAP2Vo/Z9TeMDTX5o5kvzmlPijnuoXLRTmLfxR45g/uh/vtz/
 ncNPTA+emmGdaC/Y+QA309myI0XJDg5sTVVLClxacXB3bCv/fL202Hz0iAFf5/iqgyzr
 qmm5Q3ZC5xqfxPs2Yetc+eOgwTXpqT4mnO1LXIRRCKWin79SMpIvqP5tCGqBRrprSvW9
 3I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947365; x=1733552165;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=edTZ+SkrnE/JMBfnnHqKmdSdnVM2/S+y9Q27JWUYvuY=;
 b=IB4V+GhvtoXCs1ngrDozGUvcbLDXDfMW1nwNKrNGGFdSTlfpGbTJOIomtx1ZlgKYos
 PIjL6OUZcvQ8yoUvRglcSBa9/RYEpBiID0qqNp8qsWReZxXUKGh0ArkqEjrmV8kZfNvG
 SSPYhxJp34/3pK2OFTCgoukUbwSBEYLb/D5GyLGAM+qdLAPiMr4blRbfKr3HiZp1AwbZ
 cakkiKKFVd9REdb0paTLVBjtoRP5/5r12Rz1yhPJM5iqtdVXvtDITnJnzRdej8bsUkv2
 dnCS3Wyy27glzHSDMsKUTKMivGkXw7iiGkrUtbT94meeALbJxSLeNQhOnzUzqTILbzZN
 Edlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz0y2JTa0MpLiSKuZL832SuSKhoO19vBtA0BSpRTvlwljSqRV862rBZvhcH4azHsa05193JZ+H+g==@nongnu.org
X-Gm-Message-State: AOJu0YwFvoAoIYdOh7OMWRmZsSkLqzuUx8GeXfFFztrsST/MJmvlQq/V
 vd+7kxJbZZdBI9d+M2Rm+Ypu0zrwUzuAM85BmZylGtM8pmSczXimhrK3pTgtJaY=
X-Gm-Gg: ASbGncvRFTBTM/LiwYE4CljNEAjzU1yXP/vmXthjfvaqocO6fL9HmCRqQqpjMFddO0S
 ZEi4yI8wszZA2uRvIeMge1Ag8bfi2XxBtONuamjdKBhsxxUXJrYARUQur0X3yI7ckGXyyMJ7PD9
 kiOvFpq5rPozF7oCLI7inctlI7yO+y0RYhgm6mN2nYc39zZH7BDNr0m5EKM0wEo+HbIyfOjYPOL
 iqZlai1XwoNGjAhOR9ReX8XRhLpfXp5iFxSlps5uLoXUst3ytJqg07gUoV7ilc=
X-Received: by 2002:a17:903:364d:b0:212:66cc:8110 with SMTP id
 d9443c01a7336-21501f63cf0mr188002365ad.51.1732947364737; 
 Fri, 29 Nov 2024 22:16:04 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215413d3408sm22526655ad.159.2024.11.29.22.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:16:04 -0800 (PST)
Message-ID: <2a9bd2dc-9030-4074-8e51-8f902051a3f6@daynix.com>
Date: Sat, 30 Nov 2024 15:15:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 09/15] gpex: Allow more than 4 legacy IRQs
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
 <20241129152506.59390-10-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-10-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 80I3A0wBd74T

On 2024/11/30 0:25, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> Some boards such as vmapple don't do real legacy PCI IRQ swizzling.
> Instead, they just keep allocating more board IRQ lines for each new
> legacy IRQ. Let's support that mode by giving instantiators a new
> "nr_irqs" property they can use to support more than 4 legacy IRQ lines.
> In this mode, GPEX will export more IRQ lines, one for each device.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
