Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D88CD8CA4
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 14:52:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWxoJ-0003b5-BI; Tue, 09 Jun 2026 10:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1wWxoH-0003Zk-DZ
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:52:09 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1wWxoE-0004aa-IH
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:52:09 -0400
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-5177d1ff061so2313531cf.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 07:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781016724; cv=none;
 d=google.com; s=arc-20240605;
 b=GxrqswUKvBAipvv9uPA77rb9LRJGnbY58InTvFywmBPzFOYH61VMsItvENraKMru0O
 9v2hqFQ7CvuqwFpdZv0kCMqgvEgQwwfVfRHHL9QQZ62Vez4pL3FF1wgENSWPiVTJy+5o
 w9BXQ32peYhG85sMEc3BaP4vXaC/38Ca5IsO4QQZY0sFEH11dKJDl0M7Rl3L33Kiu67x
 4WUBM4SMMCEZTldM8L2L1T/RR5szluc05ky4HKREm6CFwbjzpNnL08NIilaPKqUAHbQB
 rit7HXObRth0Zu/aULImSSHbo5uPNXPGyvvcn0IWzv10L038zzHqOLi1UMVjX0DP2dG8
 Nzqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mT7L+1cUtlPaahWEj6bhvOX6q91ZJhOLDtmYP2cxvEQ=;
 fh=p4Fo1Ob1yEcag41XuOGpdcdZ/WLJUYH+O8fKdM94bps=;
 b=Gsp+OD0+vQ8m0OgywdZ9s2AAYhRvQmswr7PBi89506GtSwMEShNwH1Df5jgCjqvj6D
 9b5NoZ6s128srtZM5ReT8MRaAR/1vW00/GyTF1qW1Qr8nSJ2sXOhOQZjthpDa9XkeKUh
 8/5RBcGKIrKDWbYQmcKOif9fK/r32pl574VO1LNCo4tXLtjtQO2iVOFwO70RaPOPpwxJ
 w/BB3RhzIpSc2skT8Cc8gd/HpCt2bSIlXeEezwkewzyc82uodOFK4aVfx+xo2CxH3yEu
 1uheAMlyD6fpV5d9bLDPxMmnF7mHgWh+5NAArcgTuVX9Pfjyxp1MOJ3SJ06zJ4ik+zS3
 +Mfw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1781016724; x=1781621524; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mT7L+1cUtlPaahWEj6bhvOX6q91ZJhOLDtmYP2cxvEQ=;
 b=guptycxe07D+Q47rkyJz8E6G1ni5nvujk9MaDtRU9zxbuC632g03ATblufsNM7Nqgo
 Chnak9yjXXvinFHV4DlVziqv08nreyXkmLLhIRn4W+0CHmJri90QB3x8E6bi0G0sNriv
 npLlX2SH1Htp9qpVm9Ydn6qFreiE/dqWHuhhmDu3Nu32K9zw4R4eDd2S9vMG0gmNaDMW
 wNMY+EBSdtLjr2S0amoLLPzo2agmPLXVFNFo7cTx6J2ezyQFzw+elAz4iZC5F9Je8RFU
 1NKPmbMYzqYSlPZbc8VMNUD7o0R7HKAkWUEUBvNsUGX5vdDOkIqFtr46Rz9NdbLi3Ftj
 9HOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781016724; x=1781621524;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mT7L+1cUtlPaahWEj6bhvOX6q91ZJhOLDtmYP2cxvEQ=;
 b=RezECPj8N1CmPXuAS3HSmCN2SV+55+lZo2aL4vN+T3pvfqWXXmJpCdnBFRoGdzgS1n
 02Yhs2C6wjAs0au+4aB6IpNARJ+IWffrPh7vD3JpXnzj3/OOcR+IxwHglbSf+C1TEXUm
 KAp13RHmT2Y4+anqD/oLCSxZ4/oq6U4fMRaRWj6AJQJ86VmcOJf76sQ9rzlyF2PYOJgS
 ssPkzlx3GNRm6AOM4QpKjTUY9++5G3ruap67Dw2t/cK3F4QyB67QE10qQH4AMOTUisCF
 Sb1X6epcxRTrV1tiri2N1zOZFzIVAtjtt3/A24/aMf0GfYqbHOdRb0FhPy7h32SQNTFP
 RdUQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ96RoGFg3kJuMBSqa+gzuluJQM142gbouSeVB4EgpRa+OGulzPuLFtfOwPcynW8Xi1qksmZJBaSkA==@nongnu.org
X-Gm-Message-State: AOJu0YwfKurPVzN+zbWsQpIv0Sf0D3Mo440L5UhXY/UFabSGHrOh91It
 i/6NkHZ7lz6SAgpXi8axX1KqIrRdbd91zvvNko8hetqct5GAIYtDIGDwJGNaqm4P8MGp0Iih7A/
 jgqd1VZ46OK4P+wgMencWAiSI1wwS9BCMRdMX/w0jXcx/HxvBDsAGi/Eh
X-Gm-Gg: Acq92OEuVJqiJAzlfbA82j61DFtGtnYSrnTukfdbekujVgwmBdYqrdlv4WOZFCG5Lhz
 STn7qkUsKQURVLAUkJtv8d2lZvI19JfWl3nvJ1VNrq3xTZDcn0IFU964cajTqQgtIP4lCVkVdf2
 jiTU+nvJfqBSsJSLI6MKnGrhPMC/2FAYn6Bzia6yNbsFGQ+YCKsUz2rH+m9M4BdAGHVmAa4AXXW
 SznV4xpdUGLUqzkDtAiLHlHybG2Vxaj+BjfJvgyPtvQfOVK6nVnKxhYIJ0VRx4XNAI8oI3A5qpb
 SkdenOlkbBkxhwaL3wsCw48y5uG6/CN7p7GvL4bmZ+cOmTLeLw==
X-Received: by 2002:ac8:6610:0:b0:510:f9b:fb5f with SMTP id
 d75a77b69052e-51798298a3cmr32128971cf.16.1781016723550; Tue, 09 Jun 2026
 07:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260609105626.1038690-1-thuth@redhat.com>
 <CAFEAcA9O6b02VMuto8VzaEsVi3zTqNtQKG_RcMaPnNdPXGUBhw@mail.gmail.com>
In-Reply-To: <CAFEAcA9O6b02VMuto8VzaEsVi3zTqNtQKG_RcMaPnNdPXGUBhw@mail.gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 9 Jun 2026 07:51:20 -0700
X-Gm-Features: AVVi8CcM3axo7mAEJOZp-nioF3imcVzHW2yLICbkWxeE6AKaOP-rr_nCCejynOc
Message-ID: <CAMvPwGpvpHD+Sx-HZR4FFMJB+W8Rk8LoU0256Q=vwKAdC96HSQ@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/pmbus_device: Fix a possible crash when requesting
 too many bytes
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=titusr@google.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Tue, 9 Jun 2026 at 04:01, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 9 Jun 2026 at 11:56, Thomas Huth <thuth@redhat.com> wrote:
> >
> > From: Thomas Huth <thuth@redhat.com>
> >
> > The pmbus_send_string() function contains an assert() statement that
> > can be triggered by the guest code when requesting too many data
> > without reading from the device in between. This should not be possible.
> > pmbus_send() already has a similar logic, but it simply ignores the
> > error after logging a message with qemu_log_mask(), so do the same now
> > in pmbus_send_string() to fix the issue.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3388
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  hw/i2c/pmbus_device.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> > index b1f9843f52e..6aa608a2998 100644
> > --- a/hw/i2c/pmbus_device.c
> > +++ b/hw/i2c/pmbus_device.c
> > @@ -104,7 +104,12 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *data)
> >      }
> >
> >      size_t len = strlen(data);
> > -    g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
> > +    if (len + pmdev->out_buf_len >= SMBUS_DATA_MAX_LEN) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: requested too much data from PMBus device\n",
> > +                      __func__);
> > +        return;
> > +    }
>
> I had a look at this bug earlier, but was not sure that this is the
> right thing. What happens is that the guest does something that
> causes the device to queue up data X ready for the guest to
> read, but then instead of reading it, the guest does another
> "I would like data X please" action. My guess is that the way
> the hardware handles this is probably not "add the second
> copy of data X after the first one". Perhaps it is "drop the
> data the guest didn't read, so the next guest read gets the
> second lot of data, not the first". But maybe the spec really
> does say "you can do things in the order 'ask for A, ask for
> B, read data for A, read data for B".
>
> I couldn't conveniently find the pmbus spec to find out what
> the hardware is supposed to do here. We need some input from
> somebody who knows about pmbus.
>
> thanks
> -- PMM

Queueing reads are an implementation detail I decided on, not part of
the spec. How the data gets discarded is up to the device
manufacturer.
There's a separate issue here though that I have a fix for.
SMBUS_DATA_MAX_LEN in QEMU is for an older SMBus version and it needs
to be increased.

I can set aside some time to bring the SMBus implementation up to
date, but for now increasing it to 255 will put QEMU in line SMBus
v3.3.
-Titus

