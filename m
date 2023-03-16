Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp355368ejb;
        Thu, 16 Mar 2023 07:52:03 -0700 (PDT)
X-Google-Smtp-Source: AK7set9n60kvUdp07YVf8aeMnFZRU+1olukw0cJv9uHoveDqwwuXLX/VrWrFvfGTSk9qWnMF+iOX
X-Received: by 2002:ac8:574c:0:b0:3bf:d9d2:4866 with SMTP id 12-20020ac8574c000000b003bfd9d24866mr7147209qtx.24.1678978323406;
        Thu, 16 Mar 2023 07:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678978323; cv=none;
        d=google.com; s=arc-20160816;
        b=qA33l/IrBvE6DX5QA9hlI49GoVNERBqffoac+ruADwSE9KwgoqL+9zkVQvXdMD3Bih
         dDnrUXcCEX4hBMBP5cUfNJ/9NlsJKhNsRilqnEAaow03uGBqWPWvPaHF0CKUDADfgqll
         Hs1CRz/a+6co4dqBkksEiNvxy4J7ElGNdjtdQfgbV5A1JXl0qcF0F7l8k3mpOWEwT85I
         EgEZH1Tl2OPwpGAaLKn1kNTdh4d6HywXZZfFTqzO+fKCoKB9+4StzGXRUlIjhmWJmDJD
         NO43C0BiPG9d7qgRJb64I+o8jc+QEHGcuZjmsfzjKlKSKt4mCsUJVCJOM+/ofK7MZt0w
         dSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NFjAdU8tHiD0H7mrmwcHX6+IUvYtGGgoYtjkl1kK+wA=;
        b=Uf7wpuzQ+8mJxmLh1oEn4CW9UXEr6t9p3M7JBBcdVE0SFVdjjnPV7YqKzgyj9DPiE4
         STqWcgwW81VBYJ6xzNu1BPQ5zt0nTphXD+L1JczJTf7SidFBPC6DscpnnxcnM2DzmTxJ
         xI8HUYtefsxpNElYzJJH0bd2JKWmUfNn7nHTUfRM9KPC5GvuCIs8tAiXASDyZ7fQnHDi
         u0sCUat8Q9iOeuKQ0aFdISzeZm1M+w1fS0Z+vYMUDoeBFlY2wgqxHFEswKHUNEpuzJpG
         D4wTCoK6d43K5HbPgE/S9NK5IQlxsdQ+qIE3A+E1Ovu0L4q0hex0YIOQQj0lj1P3Lc6D
         sLTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Di+p3wOk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020a05622a104c00b003bb8c60ce2fsi7590352qte.483.2023.03.16.07.52.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Mar 2023 07:52:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Di+p3wOk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pcox9-00035f-Rk; Thu, 16 Mar 2023 10:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcox8-00034n-7w
 for qemu-arm@nongnu.org; Thu, 16 Mar 2023 10:51:38 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcox6-0001mn-9f
 for qemu-arm@nongnu.org; Thu, 16 Mar 2023 10:51:37 -0400
Received: by mail-pf1-x42e.google.com with SMTP id z11so1289214pfh.4
 for <qemu-arm@nongnu.org>; Thu, 16 Mar 2023 07:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678978295;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NFjAdU8tHiD0H7mrmwcHX6+IUvYtGGgoYtjkl1kK+wA=;
 b=Di+p3wOkwfrtBnfLlgGLJsyn5I7BkFCOWhCfSOr9zK3dcDGmBiY3obNjQbb5IhzH+2
 Rh0EIHT2XThnGVVXdLPPY8rvt6l782MCGSgmD0XYA6Nf+FW1aRVWESAsJ6sLiy0Ww3k+
 tRSvYueFrpYH/zCJ8pIi7LUylzlBWJ93ucqTPn73vnXzgvZAZGq22kjgf16Yqy+bmrLP
 GKsoNqHIP8XPZtUYuWSWVZDAY1vUT/4yZMK5rfWGVeUIPieRUQ63z+Vq4wAfJU8pZTTZ
 W5ntgKyNlnuRdc1JDTZD8KXKeBLQXGc6BcDC0SW1A3V3l+OKaabPWAyRtPIqTBhs/pM8
 AxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678978295;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NFjAdU8tHiD0H7mrmwcHX6+IUvYtGGgoYtjkl1kK+wA=;
 b=I9cUTsV5nlx39e42HDay+017XZzunrSZQLS8PRT/Y66PLWXn8+SyRuhPX7t/ztSPV/
 FDc+QJi98naOQO2W478F0b4u2j0FB9kR0LnKNGUGGWNLYv5z6S7JHNrdQ8qpA1la08xx
 VHHk3KuNb4z3s/0fS3R4TR0YVPandlb8FcwxohphA75QaiRyytFUuudT/BMLGdA1frUc
 5+6VZLgtkuWU42VXVL2oUcLn0wpz8mShjSzHYC6cVSbHvjtsnnwpXIkNtXyA3nwwGzJX
 mzEg+ereQ9sjjP7ifV/19eU7BmnT4rHyi3cerjrZdgYUcxirfeBno/VALcH72DHyf6b2
 g4cA==
X-Gm-Message-State: AO0yUKXVBULI9iVx8N3YVNaZe9ei5zIBdQzRQwkFWi8u9+cIII9b+dVT
 wnnK+cl/85r/4woA4Tus8WRs01Y9ieZWsSMCjEqasA==
X-Received: by 2002:a65:4104:0:b0:50a:c06f:4186 with SMTP id
 w4-20020a654104000000b0050ac06f4186mr959161pgp.6.1678978294811; Thu, 16 Mar
 2023 07:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200313014551.12554-1-linux@roeck-us.net>
 <20200313014551.12554-2-linux@roeck-us.net>
 <CAFEAcA_PT9kD1WCn9RWVem3uEY4AvmyA5T=-ouVsq9sbvDymKg@mail.gmail.com>
 <590fdf77-5478-1d94-162b-b543873b0299@roeck-us.net>
In-Reply-To: <590fdf77-5478-1d94-162b-b543873b0299@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Mar 2023 14:51:23 +0000
Message-ID: <CAFEAcA_yZu+w2htUbXDTr_8rAZMPW9HqqFOW-fJKM_LxGm_8zA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] hw/usb: Add basic i.MX USB Phy support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: 5mU8SZ5Q+HX0

On Thu, 16 Mar 2023 at 14:12, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi Peter,
>
> On 3/16/23 06:41, Peter Maydell wrote:
> > On Fri, 13 Mar 2020 at 01:45, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> Add basic USB PHY support as implemented in i.MX23, i.MX28, i.MX6,
> >> and i.MX7 SoCs.
> >>
> >> The only support really needed - at least to boot Linux - is support
> >> for soft reset, which needs to reset various registers to their initial
> >> value. Otherwise, just record register values.
> >>
> >> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >
> > Hi Guenter; we've had a fuzzer report that this device model
> > accesses off the end of the usbphy[] array:
> > https://gitlab.com/qemu-project/qemu/-/issues/1408
> >
>
> Good catch. And an obvious bug, sorry.


>
> > Do you know what the device is supposed to do with these
> > off-the-end acceses? We could either reduce the memory region
> > size or bounds check and RAZ/WI the out-of-range accesses.
> >
>
> I have no idea what the real hardware would do. The datasheets (at
> least the ones I checked) don't say, only that the region size is 4k.
> I would suggest a bounds check, ignore out-of-bounds writes (maybe
> with a log message), and return 0 for reads (which I think is what
> you suggest with RAZ/WI).
>
> Want me to send a patch ?

If you have the time, that would be great. I expect you're
better set up to test it than I am...

thanks
-- PMM
