Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp734058lfy;
        Tue, 4 Aug 2020 10:28:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/M4AdpEAL5yUi8ujEgXdHWcMQql7K2qOv1O21t4mxBKNZb066Gd+ofnyYUvOvsTHTefNE
X-Received: by 2002:a25:870a:: with SMTP id a10mr36839677ybl.257.1596562111668;
        Tue, 04 Aug 2020 10:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596562111; cv=none;
        d=google.com; s=arc-20160816;
        b=N39MZw0zjRrmAacLmq9hPy0ikFtvtbNl87X1ctasTNMdEb9bKowIbqaELlb0g2g1bC
         7L48LZgdUfE0GU9JPZcNzuFoxBFpg5mF0tNFV020YfFCJpZC/nJubt2tQRJWneAxIsKK
         Mbpjc7KQd+jiYL6WBdOA5FVEnn0oqgpUTTJEMi8/7jWL8+dMReNTPqg3pL4Krf/wp0yI
         yvh71slUG/CEeVSoNKmIRKomlMZ+Wmu5705gU294bPZ8YjAzHOQ1gfW6RdZQ0ZB8nESN
         KkRf55odCDp7x4Rdf9XCUDDejbr5XTiU1dyrPPWuu97ihcVU8PXdkBcwpxCAYQHW1HYl
         pktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Tj9S+jt13dZL2uqzI9eNoiWm4249m0G177wh4qUTsLY=;
        b=b5VMP7PWxBfkO9zqbXkNGTAqUo8MRgFYO9mnFYYtX2g7OuZe4/xGVRyduK5pSX++L3
         ysPoptyoaWqkFW3u3Va4NjzIV21u8O7ygApf2fpRZX69fjbCRNPQ0YhIwh47sXYfi2wb
         2d+Eo74hEdVkxgW9/REdcbUSj1+WC8emTJL9Gb0oVV5v1weiJTMYbJwulEbojmZ3NqXy
         ipQnzyXe3cyH2FLS3on2a57LF6Pb+p5svMHFBXgrF2IyLFIulxFRahyrsguYI7VBW8SE
         HbWZOuyB17pYZXiRxPvkCvuwYMYszdI4F7ENFCg1F9zAFvkclfchY92TAy9/H5N/jSan
         Mj6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=UIuApx8B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x135si8745658ybg.443.2020.08.04.10.28.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Aug 2020 10:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=UIuApx8B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:56338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k30jn-0003ZM-28
	for alex.bennee@linaro.org; Tue, 04 Aug 2020 13:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1k30jf-0003Yw-72
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 13:28:23 -0400
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44]:41617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1k30jZ-0000j5-Q8
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 13:28:22 -0400
Received: by mail-vk1-xa44.google.com with SMTP id x2so1302926vkd.8
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2020 10:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tj9S+jt13dZL2uqzI9eNoiWm4249m0G177wh4qUTsLY=;
 b=UIuApx8BVdeKf+fvNvxSiPK2Unzk7r/kZkxr+dBK1A7cWybGTTG2a3Gs5uvOA8mfVE
 vMoEmpHKRF/H1DQYpxMcWbMK8+O1GU7UXL50EvUpmsLmUf15Xw7sRaEH7ptxqGNOxDKJ
 is/VvklXKEQymkUlMeq79ZPFLKrq2gWSfMYX3Nn7hI1/SGwgH3l6KXgpTet7FzkwjCJA
 /aVLt68xKIJQJAWeDbhl6VASmThHqjjUisOZ+xcu/bxNq0070MtNoeMQYeHJO49rVrzh
 TKFRR2FWCZrZ3kcV9jBHZ00PBZaPhyunBFxd3kHsH0/x/aW24OvmvJI7mws2O4XSh5J/
 ZaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tj9S+jt13dZL2uqzI9eNoiWm4249m0G177wh4qUTsLY=;
 b=VffBAq8bSfZqyG+sie+x8UaBob4xGA3hC+o72RyZ4I8YYRnVe5frhaI0RsOWJ7Mg/p
 sHcTUQZVxrxUJ+reGmWX5q9m+a1lg+vXFs/9hnAaJQmgUSB3xKvpukl7JhIun9O5KKGc
 Y3nDYA3bIcC45DUywv+E8IteS5wMnU0RsBcmhYmZp1vj/gMwJ7Zv+/KCNGQyZFrjycYy
 qzmUmeHb4qcIfi+vHCM+6tx/aIL9ixqcyJNPJJet84n6Wlb/HxHt6P6/G4KQCJIWyjTA
 d9483OF39RgL2uyVEnu6bTr3LSqzGrPQTgRPt/NU6lkqbRl4ZIfw2rXu5NlsDblx3Jlo
 ZPtQ==
X-Gm-Message-State: AOAM531ugfERoP4teOZvPuQ1w014VmhYxGm3LT7jJr0+ndHV7b5GLOgz
 vfomwP7IxY9Sq8+Am18IgSmsdwDso+pYRZ24fIJ3gA==
X-Received: by 2002:a1f:f8c5:: with SMTP id w188mr8354044vkh.15.1596562096216; 
 Tue, 04 Aug 2020 10:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200803222656.63936-1-pcc@google.com>
 <CAMn1gO75w=oaCp2TjhFzr2nrbKhHOP6Q20bnvuuAzgSVe+thMg@mail.gmail.com>
 <1c14ed0a-da1b-a265-d5bd-2dea42764032@linaro.org>
In-Reply-To: <1c14ed0a-da1b-a265-d5bd-2dea42764032@linaro.org>
From: Peter Collingbourne <pcc@google.com>
Date: Tue, 4 Aug 2020 10:28:05 -0700
Message-ID: <CAMn1gO5nBvra0saJ53zY5fWYo_Jm0LReHmOSyYwsCGXES66fAA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix decode of {LD,ST}RA[AB] instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a44;
 envelope-from=pcc@google.com; helo=mail-vk1-xa44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KEyxKZmcb0nO

On Tue, Aug 4, 2020 at 8:41 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/3/20 5:21 PM, Peter Collingbourne wrote:
> > On Mon, Aug 3, 2020 at 3:27 PM Peter Collingbourne <pcc@google.com> wrote:
> >>
> >> These instructions use zero as the discriminator, not SP.
> >
> > Oh, there is no such thing as STRAA/STRAB. I must have been confused
> > by the name of the function, disas_ldst_pac. I will send a v2 with a
> > fixed commit message, and another patch to rename the function to
> > disas_ld_pac.
>
> It's called decode_ldst_pac because the Arm ARM section is called "Load/store
> register (pac)".  Page C4-311 in the F.a revision.
>
> But yes, there are only loads defined in the section.

I see. Arguably the ARM ARM section is misnamed then. There is a
sibling section named "Load register (literal)", so there is precedent
for naming a section after the types of instructions that are actually
supported. I will send mail to errata@arm.com to see if the section
can be renamed.

Peter
