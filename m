Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp654171njl;
        Wed, 2 Oct 2024 00:24:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUV9LkLxL+MqDzYXUxMUmx0fIn4lii83cRl+ZvxgKRNlGOkTkpoLHzQx+xoOra7ONLPF+JeGj+uT7GlYw==@linaro.org
X-Google-Smtp-Source: AGHT+IGcP0Cu1aMYCNqcZCRww6NpdV4ILkXOeF95ODR4zG2BqGkXkHl2q5V+oArIiEGNm8jX9PXb
X-Received: by 2002:a05:620a:198e:b0:7a9:b8d1:a27 with SMTP id af79cd13be357-7ae62740ab7mr318550485a.53.1727853899426;
        Wed, 02 Oct 2024 00:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727853899; cv=none;
        d=google.com; s=arc-20240605;
        b=kKVvkdrJXdBP5vpEa9NHhW8OSMTPK2MDypMxJcSUyOMVp721QY/RZasE1AZ5/Mhxph
         lkJK9iCPbRHjUjMSnwzUrkUE/VublZA+/W05e3tjil43xTxfDGcGFXrqrLH3WG9acsMs
         nL5q19duPHYGa7mcfLHCyWvC/4/068chzOVUamrjfLGG22gZVNITMt4obOm4mj3q8TVa
         7K9YW8m+2vgbfesfEPiayrGIeOW6uLAhVcq8By0UOho6s2CcB/WbD6NKNLGa0uk5vGmQ
         /C8AMyKYam/AGgwSQiOP+X7aRJrFpifS0PtZUHm/aT30/UbymO/HW91WJyZzsjU2FE7+
         vekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=x+yNnlpwhiZpabLHZVwIMl3B7TF+vNXNQHUE0P2wfOQ=;
        fh=C1PZL1t9cUUW3ljoduEugI04rUVRdOPf3F/EvW7TT6M=;
        b=V5qveNwt8fpcA5rdokLN+ZyHcZ04Jzsd/XF1lpjADyjpLlVtu6yVDpjgIq4u2zPAAs
         Zl869X/IGmu6pHD8aw5C8VTgvbBcXfJOczo5zCf5rD6iNqEnX9exe4tVdFgv4djKpvdz
         2XsSYZCifgyHA/COaXP8LmHWJ2wuuY5kPTqUr+0m3g6KgXNIbRMzxWM3H+ENH+os9awC
         +zyu4948XMFNuMfEvyxs5c+vRCUI+cNAyng0/M1YVhAYXnvDMeFwHO+56HBb1qVwrp+G
         ee+d3FIjK/J+DR+jz/PDvrJQ7l20TjAeWh/8pn6FOpyEOGT4dz2Mp3hfO3FhBU+r8kwi
         PS8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Q0drN2Tg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae378713c5si1241627185a.621.2024.10.02.00.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2024 00:24:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Q0drN2Tg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svtiU-0001zJ-7a; Wed, 02 Oct 2024 03:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1svtiR-0001xv-7j
 for qemu-arm@nongnu.org; Wed, 02 Oct 2024 03:24:07 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1svtiO-0006GU-FT
 for qemu-arm@nongnu.org; Wed, 02 Oct 2024 03:24:06 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-7db1f0e1641so1926019a12.1
 for <qemu-arm@nongnu.org>; Wed, 02 Oct 2024 00:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1727853843; x=1728458643;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x+yNnlpwhiZpabLHZVwIMl3B7TF+vNXNQHUE0P2wfOQ=;
 b=Q0drN2Tg4QVwxwQs0W/luHpIE7lsU3NtmvoWVVjZaekzdfyLcJq+pp49fAXMl9UVUM
 wfUW6iposQ+wXX2uNwk3SpC1jLw6OrJTnSkuydNFsLN6ZZZcZSn/txHQdB4oIjdPGt5N
 K5QFWz41OwA0dxi1/c1F8X7F4qTyx9ILkTafF7iHe0nioBtryc+ppGrZ0EkZct5nfBla
 UjvARfhfal5SAJuRiDOcWu1MZQGgMRY56LF7ui8/YDKZNk7wOg8U6C4MtyzwCMTBeZZJ
 HFlbTwAv3QbRbOTDZ+XaKEsDvwnK/0b39ZxHJMvnwxqcqm6/+LzIv38k1te/hZYZeZOe
 rjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727853843; x=1728458643;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x+yNnlpwhiZpabLHZVwIMl3B7TF+vNXNQHUE0P2wfOQ=;
 b=BPPNsN3XbTePlNjlYONUsvzPWStFYXLlkseAFLgd/k86jEJZnIpQAarG5OJ9oVSNwj
 X6M66klaMDCJEFFYfXtljOWza3VV8BgmTOfRSEhG1fRLiB4TZOvf4OjvYJYVImU0TjhC
 LWDiPGGPqs3sIc3w0bdiD6iM0D5O+ON0JEjTOLe7sawvtOkI86/UfHWRQe8EumL/PCW/
 kjJ8fY7bAShK82CDkxhc7cqCCKz2Eh8OV9DliGEfJLRUz5JC6//cwfrvo7KC8XrMPgdM
 sODEtCTgR+mHDGk5ksD622NtCoOyeunQWZOx5d2KIAJ2gucvtbNNK23TqSPbWhzM7QML
 9uTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOn/LV+tD8QCeWXzj4MMs5x6KoznYQx+SZ4mXY92XpHaHXkeXIvW8WtoXbcwFRO7ctyfLCvWQWlQ==@nongnu.org
X-Gm-Message-State: AOJu0YzOvzIXbq4xbDkagMiErnsZyY1io148mOpkFSD/qX8FjcsduqzX
 pK6G0i92mQnE9b6YU2gA/jnRKuHsUdZP0HlXfpMuvn3ce6gh516iLIomL+TYtfE=
X-Received: by 2002:a05:6a21:2d8d:b0:1d2:e458:4063 with SMTP id
 adf61e73a8af0-1d5e2d9e263mr3185688637.33.1727853842686; 
 Wed, 02 Oct 2024 00:24:02 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71b2649a2c1sm9175411b3a.35.2024.10.02.00.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 00:24:02 -0700 (PDT)
Message-ID: <8a18ce67-8a38-4567-a903-38d5ef687b57@daynix.com>
Date: Wed, 2 Oct 2024 16:23:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/14] ui/cocoa: Adds non-app runloop on main thread
 mode
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org
References: <20240928085727.56883-1-phil@philjordan.eu>
 <20240928085727.56883-4-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240928085727.56883-4-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: N1EEDDuiD2PN

On 2024/09/28 17:57, Phil Dennis-Jordan wrote:
> Various system frameworks on macOS and other Apple platforms
> require a main runloop to be processing events on the process’s
> main thread. The Cocoa UI’s requirement to run the process as a
> Cocoa application automatically enables this runloop, but it
> can be useful to have the runloop handling events even without
> the Cocoa UI active.
> 
> This change adds a non-app runloop mode to the cocoa_main
> function. This can be requested by other code, while the Cocoa UI
> additionally enables app mode. This arrangement ensures there is
> only one qemu_main function switcheroo, and the Cocoa UI’s app
> mode requirement and other subsystems’ runloop requests don’t
> conflict with each other.

gtk and sdl need to run in the main thread so stealing the main thread 
by setting qemu_main will break them. Please investigate the possibility 
of running CFRunLoop in another thread.

> 
> The main runloop is required for the AppleGFX PV graphics device,
> so the runloop request call has been added to its initialisation.

Please move this patch before any other patches that require it.

Regards,
Akihiko Odaki
