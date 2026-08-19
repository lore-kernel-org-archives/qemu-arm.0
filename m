Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0B6C5DF85
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Aug 2026 19:36:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwm5W-0002VI-E4; Wed, 19 Aug 2026 15:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwm5U-0002U9-T1
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 15:36:36 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwm5T-000762-8b
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 15:36:36 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-cbe827e3cb4so1409354a12.3
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 12:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787168194; x=1787772994; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ikki4ntnx7mNKtxu6ibtFKiiQazweu7zpK9uFaBr2GE=;
 b=TrpTIUOH1ZIi5Xyvo1To18HHLPXV8294MrnGPxhx79BBD80tvm8MMPe9KYOKZYdB+1
 GX/PFKrMC242ZgzpLBhDjlRFnCetb/ekl3vSuGDJHjafqJHs+T6OGC/Xan/3eCTd31eB
 J6GHRKiuzOq2UIcnF+JO4v51OBUkUTQyUy68G4mgJPaxa4kLwalIfjbXSp7qRhKVJbOo
 58AAW8wlnR0LmoxixV4fmSV3NGMlzZAbHXb0G4hxflIrOyFaIr2SQfCCIudg9ojAxJbw
 AuCao5wJs9EIj9ox3RJp7R2j+TC0dgdb0RciEq2g9jOCzjVIh7NfFD2u9Sp7hsm0IHTh
 jX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787168194; x=1787772994;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ikki4ntnx7mNKtxu6ibtFKiiQazweu7zpK9uFaBr2GE=;
 b=p2qRngPRU70xZO5nFq90IiiYTRfS3vtWDe8Q/vTLXsxVJBKHmY3O7C6BTDerA58RIK
 zQf5ff3M3kzlUYb8sGjp9/Be/GMhv6bDoJRTNM7Z0qQfhygMgLwCIQr+oBOIj+okWMhW
 U1lPdS8Pn1wkpmxJsqjP3JSLkrkVwSWD9K9XVVgRJ+wpahPZDGJgTIZx6RKtctjkna2w
 XMjeaQBk0DJuN+dH7+UD43g4UTWt93BYMs0WZdfFA7GkGaslQXQy9wYHJ+KzZacOt086
 VRIBbdymlLY/Ij3ZQLYy7lsQEd5VcVIVSff9kPK6boDij6EEK5UAOFcptezAfyXsd+Ii
 zMFA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqbvFCaRS1RUyz1TvCwxJawxawrYciISnvBXMIv6jXbBcWr76Te5OzTmeQ8F/M+ZEPHih6zxFgDYQ==@nongnu.org
X-Gm-Message-State: AOJu0YzaNwxSUZY2npFUICrWoFjVNRKDDaSUcXIFxznlo2pQp0alTf6G
 k5/4LsXu3hLWtTfW8GLRuilyglNfhrbP9n+iBj60BiRmOGUk6EVallXdPSxI0W6YK2/iG1Tl9TN
 +L4IAsHk=
X-Gm-Gg: AR+sD13KNCueof2GWlNB4rdheNkWV5Ft3S6K8LDF7pAkZG8hT/NRJSzPodfDCNKEwFZ
 1PGvBecn5IP9eMjJVmIaXn79fi/ashzfPVrzvA93hgq62B7Io0pg6IT7XXitcn+3RxknVw/MV24
 UMWeHkt6hTGLWyhFRcGnr9YYKFGBHZvDK0pPc1fgrHQ8QHsJcOL6fxLxdXXqvpHKY68A9Qo3mod
 J7Q8PGXM+wUOCBRAaRNLukB8BV/x33xF7Bx6Sfz5k24gAoz+6Km8Zj742lvItd1WM/eigJiECAV
 eNqVERo6E4J6sI06wt8ZV9CB0MVsNVAPuLsxkDfou1BPRrwQMkblORX09XkBIIqsDeTaqN4KEgd
 b/0CT3lzfSUb2i7JWDahGexbWpSZXA4TLAsQjFKVl6aMW40eiN3cnuNIvxoiCoPdzvMbk8PbGDy
 R6IzFe59d/6/SaoM7Ez6z52cJi/syS56nBYiBrOnvG/jTgpYg27rgUAIv7YqhXn4jyEL4ljcBZj
 d/7MpQZNpMIh3WKPp8=
X-Received: by 2002:a05:6a00:3a23:b0:847:8449:2ba6 with SMTP id
 d2e1a72fcca58-851d386377amr10789629b3a.8.1787168193658; 
 Wed, 19 Aug 2026 12:36:33 -0700 (PDT)
Received: from [192.168.122.51] ([173.164.107.233])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851d3640a4bsm994138b3a.42.2026.08.19.12.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 12:36:33 -0700 (PDT)
Message-ID: <dfea4a63-033f-4bfa-bf78-dc57c40a9314@linaro.org>
Date: Wed, 19 Aug 2026 12:36:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] hw/audio: Remove wm8750 I2C audio device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Jan Kiszka <jan.kiszka@web.de>
References: <20260819185430.3467629-1-peter.maydell@linaro.org>
 <20260819185430.3467629-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260819185430.3467629-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/19/26 11:54, Peter Maydell wrote:
> The wm8750 audio I2C device was used only by the audio device on the
> SoC used in the now-removed musicpal machine.  Since it has no users,
> we can delete it entirely.
> 
> Although the wm8750 is an I2C device that could technically have been
> created on the command line, it isn't possible to do this usefully
> because the device only works when C code calls functions like
> wm8750_data_req_set() and wm8750_dac_buffer().
> 
> This resolves the problem noted in issue #4135 that there's a buffer
> overflow in the interaction between the marvell_88w8618 audio device
> and the wm8750, by removing the offending code entirely.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/work_items/4135
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/audio/Kconfig          |   4 -
>   hw/audio/meson.build      |   1 -
>   hw/audio/wm8750.c         | 738 --------------------------------------
>   include/hw/audio/wm8750.h |  30 --
>   4 files changed, 773 deletions(-)
>   delete mode 100644 hw/audio/wm8750.c
>   delete mode 100644 include/hw/audio/wm8750.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

