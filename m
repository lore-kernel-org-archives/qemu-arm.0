Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp117375ejc;
        Fri, 10 Nov 2023 21:51:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYrAf/qV24nGqhNKp63NCEkwvic3qAJEYQkVHtDoj5httZ0AlRoneOUEJsDxd3dTknexK+
X-Received: by 2002:a25:23d1:0:b0:da0:3792:55a0 with SMTP id j200-20020a2523d1000000b00da0379255a0mr1052440ybj.18.1699681918470;
        Fri, 10 Nov 2023 21:51:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699681918; cv=none;
        d=google.com; s=arc-20160816;
        b=J4s/0qmXbF+70hv48ito4pM6FGJ3g9mzohIcQ38zJb6k3a0vLZhq/8x+D+BecXg06P
         YWmq3RmYWhnPnio2M3K8o9iswMwgzyqK21qmipQucyIDNUJtL52dciBLr7u6vGp5HkdN
         IV6F911jA7EBSi+LuxyVzyA5fWFFCamn/QNO+GFbisRHWCnZi6jYvlQydlCSL7a3L9pE
         nHmdu3Ro4vFk7dMYYA7lyH0uzxEtZn3Mgg2rNpaSptTMKAZ5Ce3bNNCU9mGwPU4scS2w
         QbfkkW9/NBso5IppMHyEEg7gRUdG0RQG2jPAHZevdNWoFWc5yQRsm6ecCjDv+kXZAn/+
         u0DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zJ5VvU1m64FTzdjXEozdrNn/3uIRbgSLenPAVgFZPMQ=;
        fh=/0zWyIoeZjV/OkKRjg4JusOiJslaTzjseQwrTu37Ygk=;
        b=Fv6bcTLqyqZv0ISiGIlUZJKX3CI/ASVx4b1qJfbohgJG4xvxFFYwd5JS0Rjb7ZJsoo
         KP2ngWCIncqmpKusTIAv6OgymSHfB7rHEsVy/7S26Nq/siHwO1WKNbW5RvBzfWILfpWz
         Utb2EvCNJbD4du/4wJBcKbr24EGdCCrVFzWRz+LEJOFhgRtNLJvAyRX3l2igajNF5yHe
         IqNR0OYbNN8QfKO9wDrKlyxTCWI2BZb1KL5cyNy7/zNZWgKHZUpEPBUijhd0fDEOSgU2
         k91+GRMAV06W+udoQgpU9EfwwgjkttoYRYlVpJULR8YP1sY0WpQ0RnEbV4MYnKFKlq3U
         qDtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AiX87XY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020ad4498a000000b0067540fd3ebasi996144qvx.269.2023.11.10.21.51.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 21:51:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AiX87XY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1guJ-0002Wx-7k; Sat, 11 Nov 2023 00:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r1guG-0002Wa-9I
 for qemu-arm@nongnu.org; Sat, 11 Nov 2023 00:51:44 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r1guE-00039X-Gu
 for qemu-arm@nongnu.org; Sat, 11 Nov 2023 00:51:44 -0500
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5bcfc508d14so2178085a12.3
 for <qemu-arm@nongnu.org>; Fri, 10 Nov 2023 21:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699681901; x=1700286701; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zJ5VvU1m64FTzdjXEozdrNn/3uIRbgSLenPAVgFZPMQ=;
 b=AiX87XY6xK1PyJUwDkEU3A01ddWr1priGF6ZKwbpfBjhR70HcqtDpT264LhLjPFR0X
 RnVOehG4NW36KtvODgj3zEASY7UMHpi2T7bMhxz4vFDI8OmpP5zHl40QBKA/OStDyVLW
 3NgtMpIfC8RxU8l5kN0HJlxHGd4dJfAkYB4d9CTm5StOYfvJeqs0FXkO+GLT0CFnjPqW
 gi1IFAJbMbq4vWPu5W0fg65ne9Kxq0KR42lbPBW0OsyTKlI9X4K6ywMmLb4Y3w6Z0prw
 18JpB8HP5Qx9MEOd92rHuhVFqj43WV4uA6qUaEeyP0/uoM/i7QDxfnAz4EI60PIxSAsC
 hSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699681901; x=1700286701;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zJ5VvU1m64FTzdjXEozdrNn/3uIRbgSLenPAVgFZPMQ=;
 b=MmVj5R3zt0mLNjffFO/F+ktiaS7eEQ4KbMYYS95B20AMXqpbmeYWcsCEEgBHdjYhMQ
 cHqOQy/rQPViWoUi9dLrJbF3iNhyc+GxHX2nm5ANY44v7p7i2hNQt5qIF59CtrrbvkCq
 FxAQwRdeZxspsSGSm6ihF8VINm9Y/ThRsYIjtYHU0LtVpjsk1FTOwAcMVVu80sWIZ/mT
 YhZKBdQ2PCN/Km+7RPNe2ZLr8k2GpmHSPNmP30OeumNpLJk1erc0ZVrIrOb/VC+bAV/d
 RqQSP07eptOR8Q1C24YC+hoSqHmlyO+6YJyzGvAN2EyVoV+7q1xDjCPbWUTpP449hGw6
 BWGA==
X-Gm-Message-State: AOJu0YzY+4bmkzDY1qA5WuvHM7fh08QYeKHwIPe0ty5/FiwuSnNnDpSf
 MzY5rGEj9vdXF8gUHrWGGyxxnw==
X-Received: by 2002:a05:6a21:7788:b0:181:a52:6cf9 with SMTP id
 bd8-20020a056a21778800b001810a526cf9mr1365410pzc.57.1699681900708; 
 Fri, 10 Nov 2023 21:51:40 -0800 (PST)
Received: from ?IPV6:2601:1c0:5e02:2a20:9468:28a1:6a05:2d17?
 ([2601:1c0:5e02:2a20:9468:28a1:6a05:2d17])
 by smtp.gmail.com with ESMTPSA id
 r4-20020aa78444000000b0068fd026b496sm615403pfn.46.2023.11.10.21.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 21:51:40 -0800 (PST)
Message-ID: <99341360-6e29-406e-be22-f761d2fdc9e2@linaro.org>
Date: Fri, 10 Nov 2023 21:51:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/tcg: Forward probe size on to notdirty_write
To: Jessica Clarke <jrtc27@jrtc27.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231104031232.3246614-1-jrtc27@jrtc27.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231104031232.3246614-1-jrtc27@jrtc27.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: rAPuseQJSdgp

On 11/3/23 20:12, Jessica Clarke wrote:
> Without this, we just dirty a single byte, and so if the caller writes
> more than one byte to the host memory then we won't have invalidated any
> translation blocks that start after the first byte and overlap those
> writes. In particular, AArch64's DC ZVA implementation uses probe_access
> (via probe_write), and so we don't invalidate the entire block, only the
> TB overlapping the first byte (and, in the unusual case an unaligned VA
> is given to the instruction, we also probe that specific address in
> order to get the right VA reported on an exception, so will invalidate a
> TB overlapping that address too). Since our IC IVAU implementation is a
> no-op for system emulation that relies on the softmmu already having
> detected self-modifying code via this mechanism, this means we have
> observably wrong behaviour when jumping to code that has been DC ZVA'ed.
> In practice this is an unusual thing for software to do, as in reality
> the OS will DC ZVA the page and the application will go and write actual
> instructions to it that aren't UDF #0, but you can write a test that
> clearly shows the faulty behaviour.
> 
> For functions other than probe_access it's not clear what size to use
> when 0 is passed in. Arguably a size of 0 shouldn't dirty at all, since
> if you want to actually write then you should pass in a real size, but I
> have conservatively kept the implementation as dirtying the first byte
> in that case so as to avoid breaking any assumptions about that
> behaviour.
> 
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Excellent test case, thanks.  Queued to tcg-next.

I had a short go at making this a standalone semihosting test, rather than needing a full 
kernel running the test in usermode.  But my quick attempt in C ran into conflicts with 
our boot.S.  Given more time I'd just do this entirely in assembly.


r~

