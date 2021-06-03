Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp101265lfa;
        Thu, 3 Jun 2021 03:31:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy6R1qONqO3HubuFIEeDYQN8ue6iXrQejDhitD3mRHSGZUDAYN6uldzgbMypQvX9+GTbPE
X-Received: by 2002:a54:458b:: with SMTP id z11mr24022150oib.177.1622716260086;
        Thu, 03 Jun 2021 03:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622716260; cv=none;
        d=google.com; s=arc-20160816;
        b=huPLDTI4Xrilhi7Qeiu8pDOVbnNOW1c4plgJlOpXLqSySlMy1B/MLgP7f+Qx4tK3RG
         6SN2lRKcoatDevMs2TPQiNEbeqmcLvkyivW01UIf2uXiFE+UGBFk7BL2MGPcY3Cxbes8
         KFH29dlTWM7XPSwPdtOzRQ1YLprgRy1Lx2+fyyT74ag+jr8AOYuzcuYdX6RQI+ldwrDD
         QajtS/oJJcdhycJZak6nOr0723Ze1iggnKFDVMgQ9OHupFy2a2ZPSO+gKj6pdIaJEQzD
         lAqWbWM4gDlYNTc6hU1uVVHW0TKyJ2XjBG1WBEQXRr3ilVWa500VEJ/K14h3Fqg/xBrw
         bDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g0BP2ff03ZPP7dKcCglzKrplPuwWosa6ih9W8QfTk7g=;
        b=pgn7iQZQtLbhBEjvTlYDM4HDsX4dFi4QHOwjObrCryX+fmCBCUGEwsfw/v1zgcww63
         D+eY39qMf+GFow+GhUo95/UKvDklm5vU56vIMj77xmGMzSwG878fVXJpzLGHJZb3hIrh
         tdDXPhUOiCJHEIQ0ZZtnMw0fWN6ubezZAlYAPUaGccUKLUpBNiD7ipL1kVFvXwfbEeaN
         Kn1jWpI449qNUhggkzMAsmYvilPaQVJfyqfNR0xp3gY6rCzXW2SOxdVG6ozdgzMdm87p
         Uanf/fObmA5xpuzgQQmutWxp0za+IR3RaTuBttwStyjV1Ne0WNGHBO5yrrqw7mBEsN0A
         gWKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UYN5LcbH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14si2649842otb.278.2021.06.03.03.30.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 03:31:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UYN5LcbH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lokct-0001et-AS
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 06:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lokch-0001ej-4A
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 06:30:47 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lokcZ-0000Ij-8G
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 06:30:46 -0400
Received: by mail-ej1-x633.google.com with SMTP id jt22so8477436ejb.7
 for <qemu-arm@nongnu.org>; Thu, 03 Jun 2021 03:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g0BP2ff03ZPP7dKcCglzKrplPuwWosa6ih9W8QfTk7g=;
 b=UYN5LcbHBG/a0wFPIbzZwxHQ1ztjlAem3p94M6FHw5/EGeEu/hksYUXv/7o87+CdHX
 MeFmUhC+DRNiiYS3V/yAFyqQBhaRJFYT942mp7hdekLDBneI2mXQ4pub3SHPnEXksuc7
 2qy3KbZxu8+6n5wurMkegQ3n1WHA5rdeU2qSjU4Hoc4LLdiIIFZJhbtCxL9KZ/YFy7Dt
 sM0TIGCsarVxggzQUMmcuPlYnHWljdKkos8AePiiqdWFWj+fXDZNWcgyVrV0FQNGcZnm
 WYukoDRfjSfi6Hye7BXoUXqTAoIVmYfmnm3V/pp/gXykE0Q48GO/uOX1xLrCcc2xvMVB
 HsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g0BP2ff03ZPP7dKcCglzKrplPuwWosa6ih9W8QfTk7g=;
 b=T9Ka8ymg0/uFGsYtLOd+KB3TMjF+qhj0kD5k3m3WfygL3h1cBROSqTuFO6j7Vx0Lms
 LHIJcdT0OOrsBCBdeeDXe6qb2oa5cKWSUsW65gMTUzal3hTsNbVSCWuP9k2C/r++Iltr
 pAsB8xYtLluYWBQKJenf4FR8t3aThO8RFgaCEwW9pDtfl7Nd43XekzIEQa8viM4oqQ5/
 1KUF7RqOldyqyGHEenNDUGOgFvOHYiHGTlWR7momocyp2TNHLIKZq6t9MfTp2wQHrpLZ
 0ihfRTkjD0U25vgPE1i3crbkqFyDVmEdrfRoeRZzKlG770zgHRvfagZGcxoDWLFBhO01
 K5UA==
X-Gm-Message-State: AOAM5313TYnFXJyWHl5ftsB2FSKgerSPOaCZDVdmogbY80iwDFYcTw8M
 NJ5YjOMU3o3EzWex7QaMpg+yFovuZ/Xwfx2izMCDXw==
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr38047017ejb.407.1622716235273; 
 Thu, 03 Jun 2021 03:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210526121847.1935454-1-jamie@nuviainc.com>
In-Reply-To: <20210526121847.1935454-1-jamie@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 11:30:02 +0100
Message-ID: <CAFEAcA_ug=+-TjUUy3oRcf692ehC9eg95U=kX5wfcsKdOCNG2Q@mail.gmail.com>
Subject: Re: [PATCHv2 0/4] target/arm: fix missing exception class
To: Jamie Iles <jamie@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: weNX/llWfHaD

On Wed, 26 May 2021 at 13:24, Jamie Iles <jamie@nuviainc.com> wrote:
>
> Thanks Peter for the suggestions, I also added a patch to switch a
> couple of cpu_restore_state+raise_exception pairs in stack limit
> exception handling for both v7m and v8m.
>
> v2:
>  - fix raise_exception_ra to restore state before raising exception
>  - remove redundant do_raise_exception
>  - remove now redundant open coded raise_exception_ra from MTE and stack
>    limit exception handling

Applied to target-arm.next, thanks. (I tweaked a couple of comments
and commit messages.)

-- PMM
