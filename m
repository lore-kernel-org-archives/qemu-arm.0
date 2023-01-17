Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2499523ejc;
        Tue, 17 Jan 2023 08:03:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtvAnlBEAW74cacLsL7bU9NLkHCxll9hbmSMHD5EgHsLdDXossQPAhUWmCNR8NYTIEAwXl/
X-Received: by 2002:a05:6871:4809:b0:15e:a1af:491e with SMTP id qc9-20020a056871480900b0015ea1af491emr2215074oab.59.1673971404700;
        Tue, 17 Jan 2023 08:03:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673971404; cv=none;
        d=google.com; s=arc-20160816;
        b=FUF026Z6yT1VVLM60z+mr++gFg7GgmV9/uc2pECVyEMHg2wzg5fiBv/Nh1YWGKvxUf
         0Ha520ldTdbe5RbX5BPG8EvScaryRhKI4WgtxjJV4djQJVkMSZByfJaiULHMJLTiwPmK
         9Bi6z8xeS98VfKQ9YWMsS9e8ycNoEIxXqgiquLrtI7rYJ19fIQ8KUyhGTskURhIQ/eY5
         jC3VYcm10AJIjf00khjZjmEEDE5KdHAsPoOe0fMRf+nFuCXe+B1c/aiU6D+95WJeJ6Ti
         J8xkQXEQ3yoNA7wGMMVNk0Vahfk/zOSDvRns1Y/61KOEngln1Vkba+UWSXasSB7qo/uk
         E8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=werl2WV4XexszKNFGTltNvTkij81DjKUDbHjec/VS9o=;
        b=VyQeRIzK+YLKxeKaLyBBWfuL9XhnP1WR+YmoPggEwQjVP7NLSRI6NV70oxGtnVcCf5
         iRij2NKWYh0hKxLwDTnIdP76HT57xFzXOm5YuuG06JE5YAmGZFHh9f/PEMFs8DA1xlh7
         tXpAZovKuG3smI5XP4apiehHUAghm3fKt3lXSLkQGpxCLvHt8yNS6etSpxBZzeaCYoJ+
         LOuMoOg9Cs/MH2wLYWp6uTcy9cqm+DYtF+Jq2HJWQjfAchowUhT/LjRnc8JUv+zQ1Sfq
         Q6gnVrc6ha/Bj62s6G1G+RhYgaQAYh/xe3NqrlFWGZdhWS947hYJtN4zVVXLnJYB1XVl
         n2oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RckeIScZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020a05620a404900b0070685691bb2si2186559qko.46.2023.01.17.08.03.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 08:03:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RckeIScZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoQb-0002qi-NB; Tue, 17 Jan 2023 11:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHoQV-0002lw-91
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:03:07 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHoQP-0002Bw-8O
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:03:02 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 x2-20020a17090a46c200b002295ca9855aso6668496pjg.2
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=werl2WV4XexszKNFGTltNvTkij81DjKUDbHjec/VS9o=;
 b=RckeIScZN5JJnEHZkuB1wY5xGA+x/lWi9KVoZtySYM2tse/Hbndx/ha2LXRaTPpao2
 TYPNIYyAvvj2lTvDSKfPUfT+JqF+FCBwvRffwUEKV70Sj4UezMUld9COHfkIZCgMvk5f
 QrFGu8nEtK8WsEu4Y9HaTCbYQkpZHe6AP866aqpNWvbDXuUROTSodnLFQHrU2A+g5FwI
 XmpH/VTVUkCNBJQHJZ5rNLQaUORpBP1yYdAh/eHe6reNAOlo02lzj0Pl8QE25gVYFhyI
 PE83T8mgSJeOZKwRQ+9bxzw4AIoCr0fGX8L7mYUMC9ErX3PVBSe9g7z/dGhCUNDN81dz
 F+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=werl2WV4XexszKNFGTltNvTkij81DjKUDbHjec/VS9o=;
 b=ddBbP1ElOREQRm+G4eY9O1Q43lzdfcu4MLUfdjnd5gmslU8ZRtCChMLEyfFBkkZX6n
 l5r1Cehot1jxWa88uAPXrLnl1wywFWoFuABLKpVCrEKhnRjC2EcGVGgu+A6i8kzp3qpc
 vIX2k9cXVol+wmbFRNHOa6HycmXt2DW7R1FJCMkMekFcPkzhLU9P/S0bNGYcm4z2SKBY
 zDFGVrTKKpUDRwojl1NSqiwyn7vDDRxos2FNpY3KUx6ZynHQ+5RXlnzEQa9K81EiJfzQ
 44iUlUwWfS8kYEHUdOcnN4+ww6fSYCS5GihKPXkeWZltmtYwYwoJ2Cye8wZ9lSh43JL5
 5wcg==
X-Gm-Message-State: AFqh2koWsukYe4WmUcesr8DRCCc96yFBjInwUZvZkei443dHkadT18Bw
 cSlGdrxbp1hLxwQoECrBZmpw/FzchP+Mh/0Bv0HAGA==
X-Received: by 2002:a17:902:bc46:b0:194:45d0:3b2c with SMTP id
 t6-20020a170902bc4600b0019445d03b2cmr345574plz.52.1673971379707; Tue, 17 Jan
 2023 08:02:59 -0800 (PST)
MIME-Version: 1.0
References: <20230106172851.2430-1-eiakovlev@linux.microsoft.com>
 <20230106172851.2430-2-eiakovlev@linux.microsoft.com>
 <CAFEAcA-VkWjSO84dCmoeKaO0PEFydi7Bj2gXhBYDatGpuCuc_w@mail.gmail.com>
 <f5af2eee-e04e-fadd-8bad-b9ec4a2a1998@linux.microsoft.com>
In-Reply-To: <f5af2eee-e04e-fadd-8bad-b9ec4a2a1998@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 16:02:47 +0000
Message-ID: <CAFEAcA-UuXdF5-akaiu0Nsg1c4T6pnQbpBh2pDK0gpc19+RrGw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/char/pl011: better handling of FIFO flags on LCR
 reset
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, marcandre.lureau@redhat.com, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: SvjLoQ+PI3g9

On Tue, 17 Jan 2023 at 15:54, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
>
> On 1/17/2023 16:24, Peter Maydell wrote:
> > On Fri, 6 Jan 2023 at 17:28, Evgeny Iakovlev
> > <eiakovlev@linux.microsoft.com> wrote:
> >> Current FIFO handling code does not reset RXFE/RXFF flags when guest
> >> resets FIFO by writing to UARTLCR register, although internal FIFO state
> >> is reset to 0 read count. Actual flag update will happen only on next
> >> read or write to UART. As a result of that any guest that expects RXFE
> >> flag to be set (and RXFF to be cleared) after resetting FIFO will just
> >> hang.
> >>
> >> Correctly reset FIFO flags on FIFO reset. Also, clean up some FIFO
> >> depth handling code based on current FIFO mode.
> > This patch is doing multiple things at once ("also" in a
> > commit message is often a sign of that) and I think it
> > would be helpful to split it. There are three things here:
> >   * refactorings which aren't making any real code change
> >     (eg calling pl011_get_fifo_depth() instead of doing the
> >     "if LCR bit set then 16 else 1" inline)
>
>
> Yeah, tbh i also though i should do it..
>
>
> >   * the fix to the actual bug
> >   * changes to the handling of the FIFO which should in theory
> >     not be visible to the guest (I think it now when the FIFO
> >     is disabled always puts the incoming character in read_fifo[0],
> >     whereas previously it would allow read_pos to increment all
> >     the way around the FIFO even though we only keep one character
> >     at a time).
>
>
> That last part i don't understand. If by changes to the FIFO you are
> referring to the flags handling, then it will be visible to the guest by
> design, since that's what I'm fixing. Could you maybe explain that one
> again? :)

I meant the bit where the existing code for the FIFO-disabled
case puts incoming characters in s->read_fifo[s->read_pos] and
reads from UARTDR always increment s->read_pos; whereas the
changed code always puts characters in s->read_fifo[0] and
avoids incrementing read_pos. I think your version is more
sensible (and also matches what the TRM claims the hardware
is doing), although the guest-visible behaviour doesn't change.

thanks
-- PMM
