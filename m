Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3427397lfm;
        Mon, 13 Jul 2020 09:16:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/81Pas8oKzb34cgNkSsptiYwNwq+LnBjK7YwdZh1gdkwJSC69Mx/HLy1/E6b4eFVRmLiR
X-Received: by 2002:a25:aa2a:: with SMTP id s39mr1072760ybi.507.1594656960301;
        Mon, 13 Jul 2020 09:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594656960; cv=none;
        d=google.com; s=arc-20160816;
        b=nL1E6PzuXntxd9cwHfn2VnvNzPRY4rk3m/PzJG3kbP+CPEQymsBd72sCPie8DG8Ut5
         ZbkYeHaQ+Z41LARbSyAmJIXrsO3IpnU1aFzXJVsXELcwGMU/oVhwJG9pJ8zRnUmZ2U0X
         +czdGd/oJKR25m0Zk5x4KJz9BBhZ9cYab73WDJ3v6sNGa3yOzWzhcc1WmnkqyKL1R8xD
         jfZvByDH1P4AQKRXjlJ6WGBerY2SCYEdMibzD7lqbe0FNu1AGsfGZUKnCAxid2UfCFIN
         gsSe2hdx/AQct0JwMie4STSDJS0DVWADUdjvyhay1yqk7BAnsn511c/E2LrZ5y8+4YBR
         S/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=orzPIWVnwHo2G6bvPdgUpXbljgj2/uj4fcJ5AHejZmE=;
        b=qR9p7YLcnlbZN3CVQ1ROJ2YNu0LbcDs5dIRtZvkIE+n7SyrpXxJdLf6knB2AnUrThx
         cHCG2Shq1Nj5znJ9DiASkpVuEv4G128bjLTrjkPTBjrNzWDGpf2hvVJt7ZM9Y1lYW6uR
         jphBuuwtMUGH4UUF291Vc4+giDIQfltK7koV6RTjcY+grcXS9Dp4j/+EfeBON3r6mzWr
         IvgxQPB7YKATki9ey5DfK6hpH98JkYdly3ZuMdYdBLJ05uufoyd8Sl1ZzHxwItWmeRLL
         PllAqUpmmKV3O7WHSo2OtWV2YMYLRIJx9OT53xLdzjSXsbgA7icoxHspZUgPvIGUltss
         tSfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KVsRwm19;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u127si14870482ybb.412.2020.07.13.09.16.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 09:16:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KVsRwm19;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jv17X-00033x-MB
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 12:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jv17P-00032l-1m
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 12:15:51 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jv17N-00025k-4u
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 12:15:50 -0400
Received: by mail-ot1-x343.google.com with SMTP id c25so9934290otf.7
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2020 09:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=orzPIWVnwHo2G6bvPdgUpXbljgj2/uj4fcJ5AHejZmE=;
 b=KVsRwm197wKiC4TuP3EuldNzv4nyRYmF+iYL3uIc15hcVMYyKg74UU4R42PfxTuJIb
 WZ9KE4VFyVyN9ou/cHSbJLhBM1stFjOBsJZCrqDSR9qd8aBBkv2fEunGzyCe7cbKqjZ+
 8ksPcv9d/NB2XOv0vGbUCXNCWt1XmOkNkjH4/wpwkme20bhCoPLN3W8qPR3J4VXwWTtw
 joj2z3Manvq2XOndisG0AC9yfLIm3pLII5ca4aYNVHEJ/lhXmUVEZVRhT324sqEx7XJ1
 UJUG96mE2m1GJJdYj93XlGEswRCSxrR8jfZdq3XOYi2vpWE/wqaH5H0bADNqujtqTfDH
 trTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=orzPIWVnwHo2G6bvPdgUpXbljgj2/uj4fcJ5AHejZmE=;
 b=fTjE92sH2T12QKbq4NUCnQ7cMm+iK6beLpLQ1tvI/XTJBx/l++vSDktDCRNautWQw6
 KMlLcZsJ2H54JNhVK7/YCJZyfqjR5YLq/Ji9nq3OjaX1J1O3lnkfv/WMyMvxeKYj8iAJ
 1F2PlN16tsnZXXJTZpWBIcth8q3A1SpKipPaRHfRpnBAbtFfE/O8ZJksEnlREhkysAda
 MAA6PScM3eiViJ3Txwc8/J6pBwnYO7qkWT20nUwjBy/bgoVsbEGxapS0pQ4DantEyjTi
 +85xoHoNU8tM7rBAN3DXVTvr2vUhwDMEC76a1pOub5RrNuhujdxZGWYB+HMbDqsd5+pg
 cSxQ==
X-Gm-Message-State: AOAM530whSE5XH7tfvH1taCZ0X02t7XcESaKwGCC5SlBHL2bbjJSePjk
 k6OUXqgXa1MwyFrLC/cx2D8WaM81yFRiqP1F6S7BQA==
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr294919ota.91.1594656947378; 
 Mon, 13 Jul 2020 09:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200710085417.638904-1-mcascell@redhat.com>
 <CAFEAcA-pRXOz5JVcwHa8=oaeogwaOK0YVXYQiJUpdM_rFZ+QTA@mail.gmail.com>
 <d7affe2b-0a2c-4e06-a874-daccf16bd136@kaod.org>
In-Reply-To: <d7affe2b-0a2c-4e06-a874-daccf16bd136@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2020 17:15:36 +0100
Message-ID: <CAFEAcA9=_RC0w-EgjdPw=UWXZ-ufHjkeDWTMj_jXfSQL8G9GHA@mail.gmail.com>
Subject: Re: [PATCH] hw/net/ftgmac100: Fix integer overflow in
 ftgmac100_do_tx()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Mauro Matteo Cascella <mcascell@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, ziming zhang <ezrakiez@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GLRdVqgI40BI

On Mon, 13 Jul 2020 at 15:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 7/10/20 1:33 PM, Peter Maydell wrote:
> > Andrew, Cedric: do you have the datasheet for this device? Do you
> > know if we should also be flagging the error back to the
> > guest somehow?
>
> zero is the only invalid size of a transmit buffer and the specs does
> not have any special information on which bit to raise in that case.

I found a datasheet which might or might not be the equivalent
bit of hardware -- does your datasheet have a note on the
TXBUF_SIZE field of a tx descriptor that says "When the size is 0,
the descriptor would be discarded" ? (Though I found another
random doc that just says it's illegal...)

> I think FTGMAC100_INT_NO_NPTXBUF (transmit buffer unavailable) is our
> best option and we should add an extra 'len =3D=3D 0' test in front of
> the dma_memory_read() call to raise it. A zero length is not considered
> bogus by dma_memory_read() it seems.

My best guess at "what the hardware does" here would be:
 * TXBUF_SIZE in a tx descriptor can be anything: the h/w
   would happily allow you to assemble a tx packet with a
   whole series of 1-byte sized buffers, each with its own
   tx descriptor
 * zero-byte tx descriptors might just be marked "done" and
   skipped over since they have no actual data
 * any checking on max/min lengths would be done
   only on the accumulated total-packet length (we do this
   this way already for the frame-too-big check)
 * I suspect "transmit buffer unavailable" means "the ethernet
   controller needs more data but the next tx descriptor
   is still marked as owned by the guest" -- this is certainly
   what we currently do with it, and that doesn't seem like
   the best thing to signal for the "tx packet too small"
   case. It's possible that the hardware simply sends out a
   runt packet of some form if the software tells it to do
   that. My vote would be for handling it with XPKT_LOST,
   the same way we do for over-large frames. This probably
   is not what the hardware does but at least it's a
   coherent thing that the guest might be expecting to have
   happen for a tx attempt and it matches the fact that we
   really are not going to put it on the 'wire'.

Side note: I suspect that any failures from
dma_memory_read() and dma_memory_write() should be
reported as AHB_ERR (currently we have a mix of
ignoring them or using NO_NPTXBUF).

(It would in theory be possible to test some of these edge
cases on real hardware, but that kind of bare-metal test
case is usually a pain to put together and way overkill
for this situation, so I don't think we should bother.)

> Is address zero considered bogus ?
> If not, we need to check that also.

Writes to address 0 are fine, it is not a special physical address.

thanks
-- PMM
