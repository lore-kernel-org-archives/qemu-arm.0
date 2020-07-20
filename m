Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2058719lfm;
        Mon, 20 Jul 2020 02:15:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtMZ+5GzQo7afsZVsS5t2rF/uHeFWGOfaWMMuf/PKeYKrConupaR6r0YFea8+Db3QoZodn
X-Received: by 2002:a25:d4d6:: with SMTP id m205mr33628797ybf.7.1595236501867;
        Mon, 20 Jul 2020 02:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595236501; cv=none;
        d=google.com; s=arc-20160816;
        b=v00H1nJFGjKTxKp8z35i7fGk+KZDTQp8rNj7TUsoJGv9h5hKQCrfQaL2fYpWTY1vIe
         39y/yKhZYeIPaFI73OjJhI/csDHfcoFCKEKWpEDum3cmfFbYDMo1AMdOvhYag34tz8ca
         oeEnOp7GfvM2zPCY9JxrtOCzLsUsWjMqgroRxjm9qz8Ga2s4w6ozPGnY09c6M9W6YSGO
         uwWDI4JAKcArD0OjAGtE1XxIf9fhrBybV5bpp1K5y9hL2I7iUPKyt3yQs7CWb587zYkk
         ul3Iw1yO1DHKqHEQkVgcEU2Mv0Wms52c/3obhRUELU1f3MNEDwxeVcAGoCa84fDPHFlE
         nbeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=d+whMWSfIDFt3TpeZWPgYbGftykB3ke3qgvp5C039gY=;
        b=U8FWTUxFU2sWo2kQ18llOd8UCTnc3IrrYItgIl5eCxVYmYCl0SFmh6zww2+uSrb5e7
         6B16VEq6N3Y/XNvlOv9ju0AsJ/dvvqpLcb1/IvG3vpPF8lnvbM99vL0d7PyZnFnambqm
         MAwNsLWSEQv/Ec4KaWreNlNL5Q3sFaPt5pBWhEiSW6qGcaSna6wbJod2SNkPEE9OjOTq
         4JBZTPvCmpl6I8IHUwN1b+sxCjaj/pTbZE5g9nroJd7dFBUegozbYYkfx8vKzflgjjLN
         Y+4IyARNYOzDpJ28o8u5xkRCGjvEbt2x8lHGBH63YhNCvJFtaD3VFB3wsXURlqnGgP9e
         npKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wFWJ95e3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v67si18262112ybb.90.2020.07.20.02.15.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 02:15:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wFWJ95e3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jxRsz-00086P-9P
	for alex.bennee@linaro.org; Mon, 20 Jul 2020 05:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxRsr-00083O-24
 for qemu-arm@nongnu.org; Mon, 20 Jul 2020 05:14:53 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxRsp-0000cz-EB
 for qemu-arm@nongnu.org; Mon, 20 Jul 2020 05:14:52 -0400
Received: by mail-ot1-x344.google.com with SMTP id 18so11596560otv.6
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2020 02:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d+whMWSfIDFt3TpeZWPgYbGftykB3ke3qgvp5C039gY=;
 b=wFWJ95e3t/VCj7+G3JYo1aieG1+ejHBzRgE/evE+nHlAz6ZqqOzcLHgUPA+lTcsZBB
 CziJZdRAW1TAR0cqioENBbjHCnxEje/2qnLa680U5bOMaUoyZfkmQQVB4NbA7tV26933
 +PSvjk7gyn7y7c93KbmgXiwIxjsfd74bYZZOjd4Oh97T8umgZ6cmdpRgLpPEeV+hU1YM
 +Z7m4d0e9vEauW6HUmZ74aHDw2uIkwvi1xL5jzTa07tynxvl3JUS7cm8zKso6FZRPBCO
 ZdJIea6Cim76XgTgjezJVlG74jFIGgkTtzytmACj80IvPtZeUAQh3yftvRWt+V1Tmy5W
 6NvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d+whMWSfIDFt3TpeZWPgYbGftykB3ke3qgvp5C039gY=;
 b=KdUNFPFzmw5kgJA44O9AF/HpdBBeSLIa7naGG8VfC1D+f8SKj7uGwJ8hby6oTIVtoD
 10TTW5/UrgDOKlqi2RKmEoNnPF1m+vcUkh1leVG6DLxjsSJ3E+q+a0Lt3djUpQOUCt+S
 UO1CbWDhB1sIvoUTPAPmaCiZ6v4BnT0dBWzKMYeNi9FoAEkPkk6l9fuYgdP/66QfTtBa
 uKGvNNJ+PWc+v96Wt3pOJhhMEk6OUVc+8QVIF9SeN6Ktz7be0HY2AWSGck+pQN7APQjn
 Q4uG45rAUrRhMgUJ0Ucwp0wPvZBsFKYsjMSBjCZDJuHFbcwz56c9q1k+RhVWK9wgffH1
 RSQg==
X-Gm-Message-State: AOAM531yLuqC4uSPIKqRggoeZN+efKc0EgA/6HkQOaeFGRYESmNF56cA
 8r1S0I5A1Jqm7DVZ9UCyRaXfN6AxqvLFLZ49woEWxQ==
X-Received: by 2002:a9d:7303:: with SMTP id e3mr18192653otk.221.1595236490044; 
 Mon, 20 Jul 2020 02:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200710091940.641296-1-mcascell@redhat.com>
 <CAFEAcA9XQUcdiy2x18Zr+EYDaJ4hY-1Bd-DgL6-j6sJi5Ow+Gg@mail.gmail.com>
 <df0eae88-2bc8-04fa-feb9-7633ba13d635@redhat.com>
In-Reply-To: <df0eae88-2bc8-04fa-feb9-7633ba13d635@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jul 2020 10:14:39 +0100
Message-ID: <CAFEAcA_2zG1E1COPTi78DY2V2-e8sJwc-s0c7cCfm12U2DE00Q@mail.gmail.com>
Subject: Re: [PATCH] hw/net/xgmac: Fix buffer overflow in xgmac_enet_send()
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Rob Herring <robh@kernel.org>, Mauro Matteo Cascella <mcascell@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 ziming zhang <ezrakiez@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nPwTO9Ju5kCp

On Tue, 14 Jul 2020 at 10:09, Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2020/7/10 =E4=B8=8B=E5=8D=887:07, Peter Maydell wrote:
> > On Fri, 10 Jul 2020 at 10:20, Mauro Matteo Cascella <mcascell@redhat.co=
m> wrote:
> >> A buffer overflow issue was reported by Mr. Ziming Zhang, CC'd here. I=
t
> >> occurs while sending an Ethernet frame due to missing break statements
> >> and improper checking of the buffer size.
> >>
> >> Reported-by: Ziming Zhang <ezrakiez@gmail.com>
> >> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> >> ---
> >>   hw/net/xgmac.c | 7 +++++--
> >>   1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
> >> index 574dd47b41..b872afbb1a 100644
> >> --- a/hw/net/xgmac.c
> >> +++ b/hw/net/xgmac.c
> >> @@ -224,17 +224,20 @@ static void xgmac_enet_send(XgmacState *s)
> >>               DEBUGF_BRK("qemu:%s:ERROR...ERROR...ERROR... -- "
> >>                           "xgmac buffer 1 len on send > 2048 (0x%x)\n"=
,
> >>                            __func__, bd.buffer1_size & 0xfff);
> >> +            break;
> >>           }
> >>           if ((bd.buffer2_size & 0xfff) !=3D 0) {
> >>               DEBUGF_BRK("qemu:%s:ERROR...ERROR...ERROR... -- "
> >>                           "xgmac buffer 2 len on send !=3D 0 (0x%x)\n"=
,
> >>                           __func__, bd.buffer2_size & 0xfff);
> >> +            break;
> >>           }
> >> -        if (len >=3D sizeof(frame)) {
> >> +        if (frame_size + len >=3D sizeof(frame)) {
> >>               DEBUGF_BRK("qemu:%s: buffer overflow %d read into %zu "
> >> -                        "buffer\n" , __func__, len, sizeof(frame));
> >> +                        "buffer\n" , __func__, frame_size + len, size=
of(frame));
> >>               DEBUGF_BRK("qemu:%s: buffer1.size=3D%d; buffer2.size=3D%=
d\n",
> >>                           __func__, bd.buffer1_size, bd.buffer2_size);
> >> +            break;
> >>           }
> >>
> >>           cpu_physical_memory_read(bd.buffer1_addr, ptr, len);

> > This is correct in the sense that it avoids the buffer overflow.
> >
> > I suspect that we should probably also be reporting the error
> > back to the guest via some kind of error flag in the descriptor
> > and/or in a status register. Unfortunately I don't have a copy
> > of the datasheet and it doesn't seem to be available online :-(
> > Does anybody have a copy to check ?

> I tried to download the datasheet from [1] but it's not a programmer
> manual.
>
> I think we can apply this patch first and do follow-up fixes on top?

Yes, agreed, since nobody seems to have docs for this device.
This is an only-happens-with-malicious-or-buggy-guest case anyway,
and the highbank/midway (only users of the device) aren't important
or widely used machine types any more.

I suppose we could add a comment
/*
 * FIXME: these cases of malformed tx descriptors (bad sizes)
 * should probably be reported back to the guest somehow
 * rather than simply silently stopping processing, but we
 * don't know what the hardware does in this situation.
 * This will only happen for buggy guests anyway.
 */

but anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Were you planning to take this patch, Jason, or should I?

thanks
-- PMM
