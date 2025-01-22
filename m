Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp598782njc;
        Tue, 21 Jan 2025 23:00:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWNUanUTufU/Kh2XxgD1zx62JsnfIs2pO2IMKCLAcoewnzulZZKPbPLU68CJgs8q8SIoT7hxNoewpXvUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH1DxJNIsQxTyOLToCoeXEv6mk9/i7YHiawlEQe8/zSw5nmVaNWtNjCi/4xac3CtGnMY+Iq
X-Received: by 2002:a05:620a:2988:b0:7b6:eb2b:b49e with SMTP id af79cd13be357-7be632103abmr3393322385a.6.1737529243809;
        Tue, 21 Jan 2025 23:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737529243; cv=none;
        d=google.com; s=arc-20240605;
        b=eLM57JCeVIFc3J4WZlxGpDRh5HCkjBuJW9Kg79wjbaRurSKQQfvpi56vZ8Vc0OvvsF
         RRvwaUm57BLfm2uK9sIERAFeuAWWvOBfDFqWehoxn3r4SENaivRk5xuj+6tM7EGWSpKv
         tB264rpxEb2fnznaIy2uu3ZYBs2+/o/VOseZr1N77ACwb7qxXvRZVcCZV1ihpZffppvp
         5169knh6EOvZjFR7YGrQq37f5HkM1fXJJLA2Yq9UAjJJLbp6u1Wwe6i43unHD1KauRP/
         uspa0Rm8wCU4gkjY+8ZACmV6XBvaIEkoogH9o3Lqc94HvcoxSoc/2EbSIeV+AmY1I6V1
         Mkmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NI0j9R+3KAtfEBOTgbxJkdlt8dgNVhmXhVvTh7/Ulek=;
        fh=WmyTNzRGack75CxKGFEwCFc4ZErGJNru64m4uVKS2EY=;
        b=FZztKnOWncuBOevnSakcwCwcJOdQzScFBqYEbe+HkceGPzqZDEi/jTVurLt2QzkAYS
         Ju6v8iAvTXFa7PUen5GTEHSGAT+e1I4GPmSDN4PitA00s0mGB1P8EwAXD4HpdtBQ5iwL
         BAZDcX2Shg6pStzOOi2HRnMGBASf8m1rXFp+0UgprzG5qkT9XATKEwTBBHxamGEqKM9+
         38+ra4MUeWMO4l/YjGqtBMSDrmCYGceoRl/8tlT2SABA5e9pfrR32yycYbBlhj2d7Mph
         6QC+2GjKShti7gTuknPPK4xv8frgLeIPf10aswpJQk0rqnke9IQAkR24RdXnx4ZXWH1/
         9E6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kGML5ETX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614cb53asi1426922585a.341.2025.01.21.23.00.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 23:00:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kGML5ETX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taUj7-0000YC-M9; Wed, 22 Jan 2025 02:00:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taUj3-0000Y2-Gs
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 02:00:33 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taUj1-0005Jj-L7
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 02:00:33 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-436a03197b2so45194975e9.2
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 23:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737529229; x=1738134029; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NI0j9R+3KAtfEBOTgbxJkdlt8dgNVhmXhVvTh7/Ulek=;
 b=kGML5ETX+kKbPYNO8FuYHPKo8TYiwyr+kCDXwcx3BdvjAUCAY5JzhfKA4zIqRlRY9l
 Chaxxk3Ibazb4PxEU0W38sFmXCGEDcJd4c8b1QHUy/I4phKjljivmgpJfM0ZhS5QXLO4
 BZyti/n3k3JhupValpp/VDZXbgrZh0Fq8yqn67zy1p/d0lcdnj/OZLVFHDvptLUJL2QI
 eOp3GwXNe49IsOObYqBsSqbjE8J596qKS3AauJZIJaEiLUDP6PG5IX1aAmpicL7WvSFz
 +xtAl0bKUXAf9z+w48epChU5pDP94+thttWIbUM88Oh9ruNFWd79vxZS7P5ZFAVOHewr
 iZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737529229; x=1738134029;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NI0j9R+3KAtfEBOTgbxJkdlt8dgNVhmXhVvTh7/Ulek=;
 b=mxH7bKuQ2dB3AAOdglGLuE5iJL6ZBqpAyIeEkwRFCdcxBzKPoyVmm2j12ZkIyVeHX7
 tio5AfY9FFseDP/bvL/pYzQN5C28eXVzSBEF1Wo4xmp8O8hzG6o+9w4CVRY6CKPXmuwV
 bBI+EPwN6JO6GZuX3ET6YatCTbLKApj7PsZUCTYQbFXyHsiQaIJ62p5wSVvXUPf4MfeN
 WJ3ierdqEvuxHSumS5IsMPMFVwcMfK+Tt+I329s++qAyvUbPDJNz6k9Rot+p+Bjc2QSk
 9naGOWlqn4t93yV1acpQmElWlvc8TKNrmaHJTWzvgEzcfQTRLYo5hkg1m38SSIC0m2fn
 qtRg==
X-Gm-Message-State: AOJu0Yxx2dnlJQ2/MjUbj0jXGpq+hWolqI34u7AvTJ6VKflRgARc/FWV
 Y4Ap3I8L4aqSqF1GkG0JYIe+PIOSstJQNSLGLw7tKSc5FEoamtWAl3j6wFj/WwE=
X-Gm-Gg: ASbGncuGshwQvXiMjHNBLRbUfQ22k60hPKLkIxo3kQkorx4BBs/NOpZ1hPcBbx3/n6M
 WIS/cl2ex/a0HGIYGo5JeJKXQQSf1NGv5HyBaD+bQk9lnXOtZwv6DRUKotQL8GzCA/b2t+v7SxL
 uwmDMQeErpHIXE13MHvELtkCBX2zgA+gJsI7pI9ah+WGFbTFDr8UvQBz1Fjjun6WSQpSXqIQUjD
 zQK3vrKKORP1bl3RwGxn0Wyp7el8HFYwZGfXJUucgeWJ+ZF0kZMxaVD0dcKdvoT2lfJ1AAFF/Mp
 PCx3mvihjpMr5xWbDC7MMpfqLeD1yTmOCQ16Aw==
X-Received: by 2002:a05:600c:5012:b0:434:9e46:5bc with SMTP id
 5b1f17b1804b1-438913ca718mr209774425e9.10.1737529228511; 
 Tue, 21 Jan 2025 23:00:28 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31d99ffsm12344505e9.29.2025.01.21.23.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 23:00:28 -0800 (PST)
Message-ID: <baf090cc-decd-4d6c-b857-f970b5acd766@linaro.org>
Date: Wed, 22 Jan 2025 08:00:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/misc: i2c-echo: add tracing
To: Titus Rwantare <titusr@google.com>, minyard@acm.org, its@irrelevant.dk
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
References: <20250121105935.3069035-1-titusr@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250121105935.3069035-1-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: 846lZQHAPOGu

On 21/1/25 11:59, Titus Rwantare wrote:
> This has been useful when debugging and unsure if the guest is
> generating i2c traffic.
> 
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/misc/i2c-echo.c   | 8 ++++++++
>   hw/misc/trace-events | 5 +++++
>   2 files changed, 13 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +#i2c-echo.c
> +i2c_echo_event(const char *id, const char *event) "%s: %s"
> +i2c_echo_recv(const char *id, uint8_t data) "%s: recv 0x%" PRIx8
> +i2c_echo_send(const char *id, uint8_t data) "%s: send 0x%" PRIx8

and queued using 0x02% format, thanks!

Phil.
