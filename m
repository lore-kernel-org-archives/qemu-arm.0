Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp634349lfg;
        Thu, 18 Mar 2021 12:04:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9Gq5njc55im1AN/crsYCoEm7OCOqwAyeugWLO3obFnvQcy9mjJZkY+531Om561csfgHoS
X-Received: by 2002:a05:6e02:144d:: with SMTP id p13mr45498ilo.206.1616094264787;
        Thu, 18 Mar 2021 12:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616094264; cv=none;
        d=google.com; s=arc-20160816;
        b=sr4/Vjg65bnrTOm102TJ1sEmscNdKqiMS5jbRpjzaHoVWv8TTU2xXyYE7Y50uOJyjO
         kQSGN54st7236b6Gv7JRcFaRlg3LcQWTXal1MEFD2dRuOLoVgCTuckU8CCLkVO1ln0IZ
         yzVu04qSyOyk+Egced1ZjPU8KnsXNq/mJLkV2QmiqDnoM61Seedc6foYAUDVGoocKUrB
         /3VB0/geuqKfOoDPUomUzwIbPGq/UNMAomW/3AZdLMimIBWX0bB4VrX0kA4ccnquBhSY
         hdbNq24lSa0DNrMqcFhIxJyu4DKvBCOAly8rJhm7ryhoCvNhVT5ctv45mcO6zmLdHhSJ
         i8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9njPiepWO9q+2W5ygbyr0iVoktGZPwDQO/xaLoNQV/M=;
        b=qOzaeN4oWLHzKAO7UkjZk5aZK3u0MXukPflXccYqaGfR8zhJNp/7VgUXwlTSbzkMqQ
         /dTwhE9Mjfsn1LcC2U6UtVAWTVDlcTPhTlEzMUW49NSTYF9uqHlHCYX7HoW9h1c88q2k
         QBTM+KkG9VKr/nj5FSZ4XcyUlXLlL1b4R6qRoxsnIoAu/vmqXad7id6rRWxMot9/7t3V
         YKHaQtoHINqF4fG3/nVvqTR+nBdoXUpsFydy0+lDU2Zs1QLWNN/mbfb74+DMTKGeE/NC
         tmpSVCEO03kFfZJICFWa3SXBwzCc4VkFIe6QP7Dzb7ZHEsFyejcMHW29XtjDuRzk/br7
         bX0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wzK6en96;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16si1736667iog.103.2021.03.18.12.04.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 12:04:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wzK6en96;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMxwW-0004sU-30
	for alex.bennee@linaro.org; Thu, 18 Mar 2021 15:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMxvQ-0004E4-Aw
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 15:03:16 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMxvO-0005TO-Q4
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 15:03:16 -0400
Received: by mail-ej1-x632.google.com with SMTP id w3so5645648ejc.4
 for <qemu-arm@nongnu.org>; Thu, 18 Mar 2021 12:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9njPiepWO9q+2W5ygbyr0iVoktGZPwDQO/xaLoNQV/M=;
 b=wzK6en96y99YoMMyBMTbi+8LRMTmxrgkEd89S7WMN7FBBPBHH1gqvbRuI2LnM5JAb7
 c0deLzhUuGbhiz4lQ/HlP0TiY0he1gf1Zps2mxZW4mltPdjouwoPXgk52W2Ozf9cpj7/
 q2EuuD4moCEG4Y8+D+Ts0LZY1e4rF3mRv6U4fJkgINDBNE3oFLlXvogx1/AfH1AzDycO
 ktBJ+3NFZNhTqln6Psg5O6+/xGAJaLXBo4hgq1L3DpFppRzg+JubiOF4oI0yPoUf4a8v
 6jofXss3i4FUOMiiKso2fykhYRVKoLLBwiMXtai7JWa1mB0Se7O1I8N4hs2sXo1ERbgK
 esug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9njPiepWO9q+2W5ygbyr0iVoktGZPwDQO/xaLoNQV/M=;
 b=rN5hLxEPoBs60cHXBkEOnXPkcmxmOIhFKlH+JmqUs4ABgzdKwUvg/iAoAaXaOCVn3j
 a1ilWo7Qa33Y6KnShiTBWJAR0MMvnTBv1vR4kQIJrRk8Pn/PNN9HKmvj9HJAG+RqzeXM
 DMMP7IyJ+kAmDZQstjgsEj5sZ7CzN9ePenqmkVBmhT2tA7vNdaNRwlZgU3NxZJNrPaEA
 d57WT6aluAm34w3p3CaVfO4FXZ30PYATzeiXAGUijEyr96xBKuvjH1Nu7BwKYcEK129a
 vrUMHhjryy2XnwAW2dIdKeVKG6lCV9Sqt9v7HQKVSl7q8D4bAsgrybNA+H0YXo9wUbEu
 NJrA==
X-Gm-Message-State: AOAM533GnDj3HdF76Y2to+OAIIlTmvWfP8dngJu5cXz84/eJdd6jWQSG
 hTfQ3IdtIppwxVsNiuvJg/z/tmiIEwnA3npT//2DKQ==
X-Received: by 2002:a17:906:bd2:: with SMTP id y18mr53541ejg.482.1616094192956; 
 Thu, 18 Mar 2021 12:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-5-peter.maydell@linaro.org>
 <176ca6cf-f917-eb5d-a5ce-d8a98db8fce4@linaro.org>
In-Reply-To: <176ca6cf-f917-eb5d-a5ce-d8a98db8fce4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 19:02:48 +0000
Message-ID: <CAFEAcA-mZMP0LPmGKvMuUq8C_V6cG9AVpaAQ4SoWvihObO_VXA@mail.gmail.com>
Subject: Re: [PATCH for-6.0 v2 4/5] hw/core/loader: Add new function
 rom_ptr_for_as()
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ctzhmU66MKkJ

On Thu, 18 Mar 2021 at 18:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/18/21 11:48 AM, Peter Maydell wrote:
> > +
> > +void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size)
> > +{
> > +    /*
> > +     * Find any ROM data for the given guest address range.  If there
> > +     * is a ROM blob then return a pointer to the host memory
> > +     * corresponding to 'addr'; otherwise return NULL.
> > +     *
> > +     * We look not only for ROM blobs that were loaded directly to
> > +     * addr, but also for ROM blobs that were loaded to aliases of
> > +     * that memory at other addresses within the AddressSpace.
> > +     *
> > +     * Note that we do not check @as against the 'as' member in the
> > +     * 'struct Rom' returned by rom_ptr(). The Rom::as is the
> > +     * AddressSpace which the rom blob should be written to, whereas
> > +     * our @as argument is the AddressSpace which we are (effectively)
> > +     * reading from, and the same underlying RAM will often be visible
> > +     * in multiple AddressSpaces. (A common example is a ROM blob
> > +     * written to the 'system' address space but then read back via a
> > +     * CPU's cpu->as pointer.) This does mean we might potentially
> > +     * return a false-positive match if a ROM blob was loaded into an
> > +     * AS which is entirely separate and distinct from the one we're
> > +     * querying, but this issue exists also for rom_ptr() and hasn't
> > +     * caused any problems in practice.
> > +     */
> > +    FlatView *fv;
> > +    void *rom;
> > +    hwaddr len_unused;
> > +    FindRomCBData cbdata = {};
> > +
> > +    /* Easy case: there's data at the actual address */
> > +    rom = rom_ptr(addr, size);
> > +    if (rom) {
> > +        return rom;
> > +    }
>
> Should you really have this special case?  Nowhere is this going to verify that
> @addr is in @as.

It's the "happens almost all the time" case. Nothing verifies
that @addr is in @as anyway -- see the "Note that" part of the
comment above.

thanks
-- PMM
