Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp473562lfb;
        Fri, 8 May 2020 13:28:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypK/dHAvdK8VnnBrGyGJtfEjOSMALHvmVgHz+jqAAcSAXVd1PCsFdgPk4/is9TTJWajxM9Bh
X-Received: by 2002:a37:5d42:: with SMTP id r63mr2507857qkb.317.1588969701007;
        Fri, 08 May 2020 13:28:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588969701; cv=none;
        d=google.com; s=arc-20160816;
        b=NsNnytlS4elNlNBwspD3zBPRp1hI6xuXqxotCqAS+egybShoS9YghMi6wJr1JbmFfy
         YcNLI9TVooJ6+ZTj4QKfTnI0lgobkUxDsQLXIBtwCze0rig0jhTrXKLZNxDt8/iyHqXS
         8OI2Dx7/koEXU6vThrLqTWb+J68PLqZqFtUj/k/FzAzMPXqlJEHfmPfFV+x2iMJu0NYs
         MHeu48IMLsBihJrFLFxXEox1n/NKHKtOTJKYCvj64UqAdYuDS2hZIJHTq2eO34/YR7iY
         7+9PnpR6Fx/3urAbitxas33m7TISqvLeR05Z0gbB6TM8atSNKtr52XrKDunvLDQH5KAK
         tA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lxw5IHXH7meg3SrMIDtx2FvU0tJPa/DrNR+wxpAD0c0=;
        b=s8RwgkEmb/oYivsAiSLQzcmC3UEQcg7lB4EtgQ7d+hf0k83CHrveciJU1/T66ZTzaM
         9ihKVedLSkguLh/L05ibwaTJfkaXwlDJpoE7msgI9ziVSEaIVugfCJFYQC3uwuUSkmRX
         pdyu1kToUZ3nwvh3djFWetVvNXD1vQXg5FS3MoNRUhUJJpdbLDTitHtF8bcNMA1tE+Xb
         XkkP5N0SP85CfpAL2YjLR+zYEKF7JXErqxzN0Aky1Z8FSH5wReXRaHjlsgOltWllhbcu
         WklGpYpiL8RS++LetW9rxWARzmcY4d+AUciIreOv8vZPvS7AH9GRSE/Mbt9a2BPTScNv
         TjJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H6g+CPJx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si1626227qvb.59.2020.05.08.13.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 13:28:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H6g+CPJx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jX9bY-0002CV-AP
	for alex.bennee@linaro.org; Fri, 08 May 2020 16:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX9ZE-0007K8-AR
 for qemu-arm@nongnu.org; Fri, 08 May 2020 16:25:56 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX9ZB-0000Rd-Vy
 for qemu-arm@nongnu.org; Fri, 08 May 2020 16:25:55 -0400
Received: by mail-pl1-x643.google.com with SMTP id u22so1215745plq.12
 for <qemu-arm@nongnu.org>; Fri, 08 May 2020 13:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lxw5IHXH7meg3SrMIDtx2FvU0tJPa/DrNR+wxpAD0c0=;
 b=H6g+CPJxdfnkp4vqWCk0u/Pz4Nf/EAZgIPYU4kEOED5n8hgyvmU2uwnFdElCSYx/oW
 fD31nbWMURE/ZqcJNy/WpORBKQovxjk2s5R293pE20GOOIxncQujfsI3O1w4bI1U94Vn
 me5qXW/0l0XYAc/GcqYCzg7Fxli3HznLVhQiXDanO7kdLaraFNmXTkUOoGnIHyCX99Rz
 LJcuqHfDR/jY2umvuV/IX7kLFBSRLphGF+TleD7Ye9ZNaIIo9itBSotoKbshUL0+Eq0j
 FwI9GBVJN1hPqClwRGrCJF6F+/I4rjvpcXVyFopRt0oUfGofv7BZHkAE8C+WzUWitY6r
 +lhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lxw5IHXH7meg3SrMIDtx2FvU0tJPa/DrNR+wxpAD0c0=;
 b=QzLkkWmh/fycOSpyljeFIMg9mrVNOcZHqds4b75mGV22N6C+yfn7NUPaLpbRvLZYL6
 ds6HwnRu7XHTKX+0m0VB7u7l02Y/dIi6I2QpLuneLagyRw+53FBe4rQIblpCB13J8Ii3
 U5RxsURKXgpIx3bMvYIkXJZ5uZ4TVYe1EfBYXvVxKPNWIrl8gwYQFtEQpBmMXV+IfipL
 KUDoO5Ua2L5ha3BSFUGGDaH1/zcycgeHcGst3dTYNB+BX40sCGywNyXswTMP6acVaqgk
 o1/Rt75+5WmFbTF2ZkPQVrhrbSOcGUJ+DSOaRLxv9qEha0JA4j93i3FcTl22tQ5R8BAy
 bBzA==
X-Gm-Message-State: AGi0PuZHczUuA3AVHIr5o2w1qpLRJt431HRZMnN8Bd6IMN3DF3s2MfFz
 jDWkseymDOkAP1/tfVTO6oy5dQ==
X-Received: by 2002:a17:90a:d983:: with SMTP id
 d3mr3595883pjv.209.1588969552240; 
 Fri, 08 May 2020 13:25:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id m4sm2558926pfm.26.2020.05.08.13.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2020 13:25:51 -0700 (PDT)
Subject: Re: [PATCH 4/4] exec: Rename qemu_ram_writeback() as qemu_ram_msync()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200508062456.23344-1-philmd@redhat.com>
 <20200508062456.23344-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eef8407f-55ad-9c1d-bfb2-48fe3707aec2@linaro.org>
Date: Fri, 8 May 2020 13:25:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508062456.23344-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lTZkST9KOIzw

On 5/7/20 11:24 PM, Philippe Mathieu-Daudé wrote:
> Rename qemu_ram_writeback() as qemu_ram_msync() to better
> match what it does.
> 
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/exec/ram_addr.h | 4 ++--
>  exec.c                  | 2 +-
>  memory.c                | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
