Received: by 2002:a0c:eda5:0:0:0:0:0 with SMTP id h5csp4487551qvr;
        Mon, 2 Nov 2020 09:28:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHOYvUoYniqPv5Z0jmRzw2FJGl/7mvbdj35tV1OGs0PXIE+MWpzptEK7eHo+xINn3uw/Jf
X-Received: by 2002:ad4:4b32:: with SMTP id s18mr11274529qvw.16.1604338085927;
        Mon, 02 Nov 2020 09:28:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604338085; cv=none;
        d=google.com; s=arc-20160816;
        b=zF5jpuZVoQ3w8db4UFPu/fK9qY+3jo6UUYnM8lQaz3U26YE8NtbT3TadXXY1YgudH4
         FaSkBccGN91HG/dBw2Rk8OqiGRorB6oMo3Rs5JyD90BmQnLb7V4HVxKjqOmiA66W+pi9
         4vQ4kUeVISbLAh/1T+MjBYy2PoB0IcwsL14W1Z4fIkVmj8FfhY0CA3iZYwu4zs9EdTdd
         cP6Wt04hSU7F4nnw3+4n+4v0QLpKBuR+ppVmdsQ4EfzJ0Olz3czW0qxQq09b1SPrR+Zl
         757kKK+5XunttvGxb2hVCIM7X+2oj5WDEp/8C3X/xfzsIjyK1fbD6TY+4lHvsZgmPkw0
         uiFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dZIWI5JAmVyE/Zg7mnv1he/B+pFzgzRP2f5+f8UXVeE=;
        b=wnkThdooOKLykwORYmULQQwBZikHECHVOJ2aMl62DQILrcvT6Uh1MzcANl09QCA55n
         j98iW/jhP6BNry26iquAb15b0k3oiSO4t4o8SEHXa9FmYyzwL0j07ZVgU/QU1/r7q5CQ
         mZTqziV2KZo1JSQKK3RYnnx8EfSu13E3Cjj/7ywvQBGxZVxuiRaVVzz2yyNHhDBUJRuc
         Ux9+G5EKmJim7mfUot4NMZUWkF5+9tAllbsVhtADuu0AYPzzwfd0eBV9uutY1kZuHNSG
         mgrgFKQO3xybPNiJPcJsoTrBmQ875jedDVDRD2Ncn/TP6jGIS6IVO2uWsFiQubdQBCXc
         dBZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=So3w0U5f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13si2911752qtr.90.2020.11.02.09.28.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 09:28:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=So3w0U5f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZdcj-00077J-Dn
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 12:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZdP7-0006BL-Pm
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 12:14:01 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:40736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZdP5-0006rO-TD
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 12:14:01 -0500
Received: by mail-ed1-x543.google.com with SMTP id p93so15097568edd.7
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 09:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dZIWI5JAmVyE/Zg7mnv1he/B+pFzgzRP2f5+f8UXVeE=;
 b=So3w0U5fdpsvZFRA6cgiFLFi6x9VbPjm4i/7SXgRkSW0Aw+a9NSZ+W+soDw5UFFDnv
 f0SwCTO8QF+XSRqbviEaz0Rc4q98b4i7Ji+c9mRY/Vg9aV7c3WxN3SDYxNYqjnqkwwHI
 opUNk23qAjuG3ck/3B6c79f+nNk8X0B+d+bdAKbF1ODPgbzyK8gyQM6CEI+3i2d7OQyF
 azvUjUvJL+FHSiPrg/AXUAiLaTg3izo3mCow24sycv5jdBbEOleSo2aHWAVZbn2TxgDA
 x7R1Ybc02IoMVYgcuy/4SSw+LD/IDtjFDx78kK3+R0clZPq+t5ARO8zn3iFMy8QAT+5i
 9vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dZIWI5JAmVyE/Zg7mnv1he/B+pFzgzRP2f5+f8UXVeE=;
 b=avLXvJGdBbbXyPUy0Rb3ObP6wIi1QfBkDIv7ugbq/6IxvKE98ov9fotRjSaJWfpDdI
 0nz4swbPwDtcxxcDyguVyySf2+8bPsV08jLGofmhx7gJSo029Dg05GuyMDOkPu2jw6G4
 h+/IJYHtGUv8BTPhOkVd3fzetWYstzg3+zwcQUdYw/Ka2RgaaukE5T1ZrdGerxNG6XZ3
 QyeJZM5goxdhlNQhnQeopflbrTQy5nAaFqjF6q17kMX+6Ajhpvnih/p2XGDOiHtYjUHd
 Hxx5G+pSiBR/L6N3vg+kV4fofcyW+QxH0iRNfnqnqdrbg6rP497JgQQvWG1KLQrSFQYW
 8RNA==
X-Gm-Message-State: AOAM532Z6xq/IfD0bCXMAVNlhMtaqxRZ6oimLN72zP8JzsQfcuK6AASh
 2mR81U4BRezJM7tYO6b3q6L8Wz3V2HsGQJ5DEVLvGA==
X-Received: by 2002:aa7:d699:: with SMTP id d25mr17185489edr.44.1604337238390; 
 Mon, 02 Nov 2020 09:13:58 -0800 (PST)
MIME-Version: 1.0
References: <20201023210637.351238-1-hskinnemoen@google.com>
 <20201023210637.351238-5-hskinnemoen@google.com>
 <CAFEAcA8YvmFA7=7+CGVpubVScuKPdy+OQdmJdfMD+Fmk+Hb0SA@mail.gmail.com>
 <CAFQmdRZOKLb6=NJoeY9U3eYq3rbG_OWGFDDZdGTf8vjVOA11TQ@mail.gmail.com>
In-Reply-To: <CAFQmdRZOKLb6=NJoeY9U3eYq3rbG_OWGFDDZdGTf8vjVOA11TQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2020 17:13:47 +0000
Message-ID: <CAFEAcA-KxvtQGsH9yT9FrVnAu4cDWjMzPx_vGoBueGYhB8sziA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] hw/misc: Add npcm7xx random number generator
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Patrick Venture <venture@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vyes2g3nZnve

On Mon, 2 Nov 2020 at 16:50, Havard Skinnemoen <hskinnemoen@google.com> wrote:
> But none of this is really specific to the RNG test, so I can remove
> it if you prefer for consistency.

I would prefer us to be consistent. If you want to propose
don't-stop-on-asserts then we should set that consistently
at some higher level of the test suite, not in every
individual test.

thanks
-- PMM
