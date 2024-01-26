Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp817342ejc;
        Fri, 26 Jan 2024 03:41:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqTDYxnaQJRwebN/Qw2ytPZ/cK87uWfyGIJKW1v3aDCTeJ/rgBWS4T9G3xFkSs8FAlNYL/
X-Received: by 2002:ad4:5dec:0:b0:686:1f2:4c00 with SMTP id jn12-20020ad45dec000000b0068601f24c00mr1161609qvb.117.1706269319283;
        Fri, 26 Jan 2024 03:41:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706269319; cv=none;
        d=google.com; s=arc-20160816;
        b=bWnS3IZ0z+NWe43QhAvPj6G0KBjYo+h6vLCyhgxJ36G/Ev5DoBnutPpxvrZa2oUruA
         p/wyGEQ/BLPGiOBYnNX2Ip5nTmP2bZqySivPx2FD6Or0MypJgmHDcEGmeX42s2oJ90YA
         lUZ0KF3iiBcwIP8lIEiDtLHwPi/JyW16BkBDXpRTS8+FOPYkfewT6+AaoIw/xC0r6RES
         utqZasNPdlA0cgBVJZejUwOBCVQzuSLPnzRgm22LRJq+XBlc6B47boHsbGIlU4rn7Dgi
         QFb4YF4bhSGJ3BSoIdXph7tiXTDcVF/vosTeA/fwi0wtQrrtlt9X/sMdy/qDF6Wl0hpE
         4X6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=smsoF7YI3d5cbf4R4RpQPesf7hMZC9hmlPQLc3Rlsus=;
        fh=1IiNQ7hkkOGfrkc/eyoP4DLgzj+V841bm6RLp7ScrEo=;
        b=FiQBdrjyWCxI3r63S6GPA/jbS/mmNk0ubHDBwY7vkWWmI/nVQQxhnv5t3d8Z/zwxO/
         Kmr6qiitoSPYSjfrQ1qmR37oDNdD9IeGVFoGMz5v6aaSSKEkGL4qdJzriEIaXXjT3LD1
         yShyNZmiXziGuHGoOBJo1M70bDgkjxq6nuhkiTbl5yXDa/RIHAVbjs0rg4G7t4gxQt/n
         JT/vm4SfE5kgw0shjrrn5T6/GRP5T3vv6lOYI22pYHh3xbtWhpfzse4C47Cu29N3xNZD
         u2Z2ix1b3uv8YEIPtugxzZ4Z5Vme5Gu84SiQ7wKxWO75BWeVE0c5yWmR8yUG1VW3V2MQ
         4lhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QjHcb1d8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14-20020ad45f4e000000b00681da55cc3fsi1106540qvg.249.2024.01.26.03.41.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 03:41:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QjHcb1d8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTKaO-0001FW-4u; Fri, 26 Jan 2024 06:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rTKaM-0001El-NC
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 06:41:26 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rTKaJ-00040Y-Ri
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 06:41:26 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e7065b7bdso5057465e9.3
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 03:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706269281; x=1706874081; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=smsoF7YI3d5cbf4R4RpQPesf7hMZC9hmlPQLc3Rlsus=;
 b=QjHcb1d8guduzezdwcEFlZhLXaYZFffaEu6XqwNh9MWe00MaQGq1FVtuQa7RgdCIpi
 4WkC+XIWi8/KSo4LJyum3SiF6xuyLH1gn3oc80N9YMGUPIFIuvyqMjVJmpKMC73vbPWE
 GPjrjHWifsls59t1zXf3svyl6jbI5OpRYa42heZt0xsKE2PBuLBJxyt7JNCtLXZLdG5O
 qbSW9MnOHybBnxh5Vbt8ZeJBjBVNu9Esrrwlvijk/MNOQt2h0RXejyEqKWhZMNXeA45n
 +ByEVMIAfmPwgVsaqLJQAfCDZ1L/jXOIAl0fMChf2RGMd+O4DWMvF353CR7oHWeNdoGm
 leFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706269281; x=1706874081;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=smsoF7YI3d5cbf4R4RpQPesf7hMZC9hmlPQLc3Rlsus=;
 b=VFBKUJaizPVsHoSVCfpNl0P9SR7OohyPAbednf7PkNlcNkRamN8Af9LyJY6SUSd+vM
 Go/hi3wXhnkyZ/zvq+0ile4T/bYe4Y0ZuriF2xSVT81X98aEQriRdo6lvNkpeZ5Kox9u
 ScG8//BwmsSEH7jHcZrjsNtHkVssKLW+Xqq5LxDBN3XnFLfcZe+Rv3LSsp616OudnwWs
 moRBDbQiIMA/s5dycJwEfcz2qvf0M9MP1mtBW9yE2KoNligw6xWEjuRMjPJaOrF4JPTc
 NOGPV4OMIIRJspXvFMiduK6kYPjjw2mg2v1X0aZC84wGBiJVmZicanB8vzP+p/fd5kbO
 wXEQ==
X-Gm-Message-State: AOJu0YzdE0ogqtOTgQytMktWxHhB+zpoW/b2lS/483N1MldOemobbdrM
 Jq2N6IAEtW9yzNURVU1OU5LYijFOMVBMzROeY5TolO2g5i4bEVN16fM4xkfIBBKKPG0f2SC3Uta
 v9XZd/yfGox86Y/RJeZ+RPh1Wz+BbvB6lT7GoZw==
X-Received: by 2002:a05:600c:354e:b0:40e:c71f:a92a with SMTP id
 i14-20020a05600c354e00b0040ec71fa92amr581460wmq.79.1706269280646; Fri, 26 Jan
 2024 03:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20240125151931.83494-1-rayhan.faizel@gmail.com>
In-Reply-To: <20240125151931.83494-1-rayhan.faizel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2024 11:41:09 +0000
Message-ID: <CAFEAcA8vVP0ccBzLNguT4SJqVZL8a2CvPQTa6CZJqw=GH=8o0Q@mail.gmail.com>
Subject: Re: [PATCH v4] hw/char/imx_serial: Implement receive FIFO and ageing
 timer for imx serial.
To: Rayhan Faizel <rayhan.faizel@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: l7EwFiqTqbXr

On Thu, 25 Jan 2024 at 15:22, Rayhan Faizel <rayhan.faizel@gmail.com> wrote:
>
> This patch implements a 32 half word FIFO as per imx serial device
> specifications. If a non empty FIFO is below the trigger level, an ageing
> timer will tick for a duration of 8 characters. On expiry, AGTIM will be set
> triggering an interrupt. AGTIM timer resets when there is activity in
> the receive FIFO.
>
> Otherwise, RRDY is set when trigger level is
> exceeded. The receive trigger level is 8 in newer kernel versions and 1 in
> older ones.
>
> This change will break migration compatibility.
>
> [Changes in v4]
>
> - Correct handling of fifo overflow including ORE and OVRRUN flag setting.
> - Correct behaviour of empty FIFO popping.
> - Remove unnecessary RRDYEN check in can_receive.
> - In ageing timer restart function, use flag checks instead of directly
>   checking FIFO levels.
> - Further fixes to code formatting.
>
> [Changes in v3]
>
> - Caught more whitespace changes that went overlooked
> - Moved fifo and timer initialization to realize
>
> [Changes in v2]
>
> As per Peter Maydell's suggestions,
>
> - Use generic FIFO32 implementation in place of handmade impl.
> - Moved timer_init to serial init and use timer_del in reset
> - Removed stray whitespaces
> - Increment VMSTATE version
>
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>

Thanks for this respin -- I've applied it to target-arm.next,
so it will get into upstream git by next week.

-- PMM
