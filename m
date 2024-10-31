Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp1830740njj;
        Thu, 31 Oct 2024 10:01:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCyWtHl/OR8FAVBCh4akDHcw3bhV08p8bbiImfVn22TS4g3iWsnevTJrutQKiVtW0pKzsiDvLKzg97+A==@linaro.org
X-Google-Smtp-Source: AGHT+IEzhkYtqQcNsRU/MahBviF8RUa8XAUb4yALJbolbHfdAURP94gk3xMipEOk+xaW6A4hINZv
X-Received: by 2002:a05:6512:2809:b0:539:e214:20e5 with SMTP id 2adb3069b0e04-53d65e19af4mr457730e87.59.1730394117444;
        Thu, 31 Oct 2024 10:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730394117; cv=none;
        d=google.com; s=arc-20240605;
        b=WZPyBQHZK2Nurvt5+Dv3V9wv6b/touJIau91QUpLDKnBFBzxr/Y6CfYqMp1CT7CdMv
         uF4Oe/4fVxAGZDLvIge5HPQ0z5g3Tgf5AXgKZTxMkLpSKsC4S6QABAQ+JNmp91jw5qAC
         ahKfZw0HDzhyWDYNQEWlI52hxRP9Oz2XKhu6x9TpjYTLIIxKluNpREn1+XbWYVNrin4o
         te5pR0uZhrAJoeuEaYOZ4wllsiWOoDvtwLTMJiWCvyjOu91pp6eog+ZiWQ1AnufHchHX
         B9Eb9iEa0wgazDKZuDMea/FSeXMWslhmQ1D5g22zasdLaohnRClRiMrvsEJt1Cf4YGZj
         0tcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DuAHEty5rg9pA/YP2ghwa7l7fMKVlChLDJn4tSrnwBw=;
        fh=s6RUzOAAUevd0Ptdx3eoo3ENypQQOwVPNGdTyDtC9l4=;
        b=SQpRPiBr62AMWTyWZNGx0O3lhvSe6tbHkNeqh2oqHDPQxrVBxo6/9tBXL/Aar/g/HG
         7z75kEYL2/JVRBPAzQG9QOtXySS8vPMInl3ZMEV6ZIm7TrsUJ+5QHZFG1PW7K1F3Rgkj
         YJD6AK6HoICYQOiKggyhOQdjWI8coWCDDwQTP1y5VFzGAWXP3ryyHFwss2hlP+PMXMxL
         wiSOOOxaGtP7yz1qIyatT5dI6FOuwo7aj83/1XkGQI1qrUKxs9zX6y+E7985/VztT6RV
         QmmRtqLlzg2AIoSk3hc7hZsXWqk1FJ7aVagUVdX8sTJusXOsj1BgAQcJA635y7YoSMo8
         RtkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nPkjtbX2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2adb3069b0e04-53c7bcccb2esi687592e87.229.2024.10.31.10.01.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2024 10:01:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nPkjtbX2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t6YY2-0007Al-PN; Thu, 31 Oct 2024 13:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6YY1-0007A0-5l
 for qemu-arm@nongnu.org; Thu, 31 Oct 2024 13:01:25 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6YXy-0008Oi-Bm
 for qemu-arm@nongnu.org; Thu, 31 Oct 2024 13:01:24 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5cb74434bc5so1425139a12.0
 for <qemu-arm@nongnu.org>; Thu, 31 Oct 2024 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730394080; x=1730998880; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DuAHEty5rg9pA/YP2ghwa7l7fMKVlChLDJn4tSrnwBw=;
 b=nPkjtbX2p2ezG5VfLG/rav9k681NCa46i0czVOoTwqfyTL6k3SmE2Jw1ebl9YqyzBB
 Tgv0i03cEU3VBkV9shDnytVL/8aoWUCm3fFXkGYoY+iI6UJzMAl7BMPikjHLlsboQBAh
 /bOCshf3G9z7HBnA/iS9TpVW7F+izAX6VqyQAb3YemAQOVhKB9R+evwrg/5+dbNEw7Lu
 d2Qidi4yii836+0rKFNg7fjn3axZi1Guo/kBV+jlfa+PN9FURA4HB/NzubjvlMhdp8Y4
 u3mHMmm5CrrUlYbQi88inh31JIK84AFrlZpmT/VIuQJPgNxqJVzKD0E/XBD1je0az6Wb
 tt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730394080; x=1730998880;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DuAHEty5rg9pA/YP2ghwa7l7fMKVlChLDJn4tSrnwBw=;
 b=fKJQXSsG4xkoD19OD2Mj23Ep6ukmZNqb7KZkW3v8UZFEANQvVan8ja44icKjhUXKWD
 28susXxnRqHJr7dtfk8qiOr2Umye+/oY1xqHKmmYFTYNLMz2n7WTlB8c7bXQOKNSa2Ty
 QTihVsIA4McI38ZBUYmUn6DXe6cVGyhTgcYGnFlmGRmtM7YV4mEQJD2oP1/sh2PUjaU9
 LW7QctpCrFyzhka+GjrZKv0WMOHjsEU8z8/ZPLwR6twLkIEXvJwQjlV0mjtMa92LVwVr
 APhTZYNJ/SsP2WkA9U06VjRo+3E+J79CjwOLWDvy0wmnUzwpnMRdeZn9zBHyQVmKTfUI
 MBqg==
X-Gm-Message-State: AOJu0YzpNX6Kij7pSTKFU5Q1Rym0dvKUAes38P+fHuU9VUe5Me7q3TC1
 z9KRH//JdbKBMQLJa/sfAaRkld4K1IheaSEnbETFJHB70RWFpPBFkolyVIQyqXtn0EpV7xPAFo6
 OsDtcYqvrWH72waT2rV6+L6Cy6h/T0GdGUTJVYPMt5tNUtfqD
X-Received: by 2002:a05:6402:234b:b0:5c9:36c4:cead with SMTP id
 4fb4d7f45d1cf-5ceb938be03mr307119a12.34.1730394080168; Thu, 31 Oct 2024
 10:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20241029151048.1047247-1-peter.maydell@linaro.org>
 <20241029151048.1047247-4-peter.maydell@linaro.org>
 <95086c66-9e1c-4013-86d6-373d68d55441@tls.msk.ru>
In-Reply-To: <95086c66-9e1c-4013-86d6-373d68d55441@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Oct 2024 17:01:08 +0000
Message-ID: <CAFEAcA_xoSkhk-dGUXw3-0hQyb1NF+6qRP-+6TpoQkFPOBs8Jg@mail.gmail.com>
Subject: Re: [PULL 03/18] target/arm: Store FPSR cumulative exception bits in
 env->vfp.fpsr
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: FYivQ4/xKHe/

On Thu, 31 Oct 2024 at 16:55, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> 29.10.2024 18:10, Peter Maydell wrote:
> ...
> > (Note for stable backports: the bug goes back to 4a15527c9fee but
> > this code was refactored in commits ea8618382aba..a8ab8706d4cc461, so
> > fixing it in branches without those refactorings will mean either
> > backporting the refactor or else implementing a conceptually similar
> > fix for the old code.)
>
> What do you think is the better way here -- pick up the refactoring
> changes (to 9.0 and earlier), do a backport of this single fix, or
> do nothing?  Note for 7.2 branch it probably requires quite a bit
> more work.

The bug being fixed here is a bit niche (I don't think many
people build with KVM support only) so I would not worry
about backporting it all the way to 7.2. I'm not sure about
the best approach for 9.0 (which is why I left that note rather
than actively suggestion one or the other) -- it depends whether
you value more "backport the change that's actually been tested
by being in mainline" or "make the minimal set of changes in the
stable branch"...

-- PMM
