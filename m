Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3628608ejx;
        Tue, 15 Nov 2022 05:42:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf55gqVf0MXWhs1DKDW4+9hgnGXPY8076lfG3E8/fDK0tf9dtrgii1kiME+ySQZxh1oCb0/m
X-Received: by 2002:a05:6214:3d9d:b0:4bb:4ab2:513c with SMTP id om29-20020a0562143d9d00b004bb4ab2513cmr16486627qvb.1.1668519724326;
        Tue, 15 Nov 2022 05:42:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668519724; cv=none;
        d=google.com; s=arc-20160816;
        b=edB0Luo8bbeM0NKbSJbSaeaM/dM52C1leLpCTHRSdgcV6F3RmcyTEneuk5n6hS3WRA
         aF4GNKpxdgw0AcS7aj0XBKq8lsFBzhjpiUl6iQA858AysrcDfYDNxSMo7YwvnF7Z8lgo
         smNjlqiI87Q66nTFMSGclw6XRBRGhn+6d9GS1jnqkHF9/foQKrwxalylNxzpvlMysbOH
         YVt8fD/kM3hr1Dqs2DjhIMRE2gDxXKQyLCO6BcUoLCGdHzPPBdwlqoY7jwgG0CPI2LNk
         0JLgPPKZsmJlBehdYrJ1NAqt7iZtEIWtX6ypvkSCCWSkB4eGD+xqgVW5zZgFWHWWPBpb
         LOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vblbFXfdkSdKCoGculSe8yCKBSot76GDc0dadartqgo=;
        b=p1KUgFxoztf8SkVgjcqkgC7Ofgs3WYICSCCsG0yhR8LLDWFH46Vi/cZO3T574UzM8+
         Obz9J6Yid35ft1wK9BmjQCRqxS1+Wctiagbti+uC4H7ldUi1KrxbkGCI9CReWRCTss3h
         93HDAV6CBAQESt83RXCHFdpUO1DbXAL8AaZKLa9WeOQWBs8hHWo3WZB+YLaP0wgf9yLh
         G7ArWbl93cCoAtQ1c/8zJgKYavQ/xBHhgredFXwHycKeNbHbmfviM0JzvDKGHAy3HU+g
         cd06mzPu+oq9C5dzbats0mAtn6Ys5ivVlaqA7y2Ac8al1tOayl1epDAodQWs5jV3hNeB
         MGRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Czff3eA4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb9-20020a05622a1f8900b0039a2d64c513si7473425qtb.337.2022.11.15.05.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Nov 2022 05:42:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Czff3eA4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwCJ-0005DG-Kj; Tue, 15 Nov 2022 08:41:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jens.wiklander@linaro.org>)
 id 1ouwC8-00054w-FS
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:41:44 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jens.wiklander@linaro.org>)
 id 1ouwC4-0005Zc-Il
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:41:43 -0500
Received: by mail-il1-x12d.google.com with SMTP id bp12so7385192ilb.9
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 05:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vblbFXfdkSdKCoGculSe8yCKBSot76GDc0dadartqgo=;
 b=Czff3eA4ZXkgiiYgLE3Lnez/o6e/brKSxD6A6hY86yWv/AI0x1oY/N9ofIK0Ee3Ja8
 am+AMGXRLNvPZkPw2SYdzpntWQjobZmmeIskpTuEwjesNO64CH8szxfeV4sk5ILthDrj
 Z+A8FzFfuaLngw1So92nIum811a12tZhHHN9TGFMPbDR1r4xP4U/vUCXW+1eotdi4Y1T
 uldvCLaiaB6Hl67n808gr0Cvo2AemTEIEQDROZ+idXZlh0knxAn7gSBNELehIXEsvA3F
 1TpmjGdljJbJffKBM2iPYjw0i30of07lcS+cpQgU4cN32JJgpWs5jm0QAWQDHTHboWHn
 5eHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vblbFXfdkSdKCoGculSe8yCKBSot76GDc0dadartqgo=;
 b=tIuSgNHD+r0jS+EZAsQoTdmcZBF4yUYQA7yEwYXdIS8OMEeNTohYeuI9gnB1NxXPhx
 EFEqWsM0Pyf3KiIWpRxqWrkdAQ5JZhCXFwBVNDmXMUjKYPZMiMrNuWXvVNyk0W5kOorL
 O3D9EhwdowKQCLJvdMDD5rnPPEBaWH6CaDLdx9Fux65K/dqJ4KdQdTACUnKrBt45ZwFE
 LDJNuFtTrk7PPQuim6pvwFqFkY2zRJVPmi58tgR8A6kGDwKQQKxHlrA444LT1oCr6Bz/
 zgULt2ajnsXMnSLS39j8U2tKuV1kWWECbQEB2Qje3kdKR5cljaxPnfye4ySpRYqQEtP5
 ODBA==
X-Gm-Message-State: ANoB5pnBuo9kVKzt2ZpW3SFgJItWT8yyrodZkJqUqJNQnJgL98AxVp/w
 R5/vO1BSkTT48D9QC3ThxzSjzQCK1gCfXFfN3eGRc7fd1eW+9w==
X-Received: by 2002:a92:cf02:0:b0:2fc:81e8:db26 with SMTP id
 c2-20020a92cf02000000b002fc81e8db26mr7872788ilo.73.1668519698778; Tue, 15 Nov
 2022 05:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20221114133257.1752176-1-jens.wiklander@linaro.org>
 <CAFEAcA-ECwzbojxcjbbAketMa8NkJXg=0xsqPWisKKfiuZGPNg@mail.gmail.com>
In-Reply-To: <CAFEAcA-ECwzbojxcjbbAketMa8NkJXg=0xsqPWisKKfiuZGPNg@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 15 Nov 2022 14:41:27 +0100
Message-ID: <CAHUa44E9sjxLLmNZFo5fS3SUESsYttzP1jxa+a87O8ahQ67SOg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3: fix prio masking on pmr write
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=jens.wiklander@linaro.org; helo=mail-il1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PmCHZ4CTZWEb

On Mon, Nov 14, 2022 at 3:43 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 14 Nov 2022 at 13:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > With commit 39f29e599355 ("hw/intc/arm_gicv3: Use correct number of
> > priority bits for the CPU") the number of priority bits was changed from
> > the maximum value 8 to typically 5. As a consequence a few of the lowest
> > bits in ICC_PMR_EL1 becomes RAZ/WI. However prior to this patch one of
> > these bits was still used since the supplied priority value is masked
> > before it's eventually right shifted with one bit. So the bit is not
> > lost as one might expect when the register is read again.
> >
> > The Linux kernel depends on lowest valid bit to be reset to zero, see
> > commit 33625282adaa ("irqchip/gic-v3: Probe for SCR_EL3 being clear
> > before resetting AP0Rn") for details.
> >
> > So fix this by masking the priority value after it may have been right
> > shifted by one bit.
> >
> > Fixes: 39f29e599355 ("hw/intc/arm_gicv3: Use correct number of priority bits for the CPU")
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>
> Thanks for the fix; applied to target-arm.next for 7.2.

Great, thanks.

>
> > I've only tested this patch on top of v7.1.0 since I couldn't get current
> > to run in my test setup.
> >
> > In case anyone wonders what I'm testing, it's a setup with Hafnium at
> > S-EL2, OP-TEE at S-EL1 and the Linux kernel at NS-EL1 (no NS-EL2 for
> > simplicity).
>
> Now is a good time to figure out what's not working with current
> QEMU, so that if it's a bug in QEMU we can fix it before the
> 7.2 release. Could you try a bisect of QEMU to see where it broke?
> Alternatively, if you have repro instructions and prebuilt image
> files I can have a look.

I've bisected and learned this:
# No output at all, hangs in TF-A bl1:
bad commit 48da29e485af ("target/arm: Add ptw_idx to S1Translate")
# bl1 works again, but TF-A bl2 (at S-EL1 if I've understood it right)
fails to load some binary:
commit cead7fa4c060 ("target/arm: Two fixes for secure ptw")

I'm using semihosting to load binaries and in this case it might be
that QEMU refuses to load the binary into the memory pointed at by
BL2.

I can share the binaries (~50 meg) privately, to test with if needed.
Or if you'd like instructions to build it I can provide that too.

I don't mind doing further testing if that helps.

Cheers,
Jens
