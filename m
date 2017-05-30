Received: by 10.25.0.6 with SMTP id 6csp1829881lfa;
        Tue, 30 May 2017 06:57:00 -0700 (PDT)
X-Received: by 10.223.173.140 with SMTP id w12mr8331145wrc.125.1496152620468;
        Tue, 30 May 2017 06:57:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496152620; cv=none;
        d=google.com; s=arc-20160816;
        b=uavGBnF+K8MNkA2LxhmSMduEjOYOG4FnLYuizk4iwmMysPrHd1oG65q9S7t2TwJr99
         LW/EPBfsZiRzfyenvmHrXyAV2wrVOOVE4tY7H2esAMx79k+U2HR7W3EyGGPfpPEwjSe8
         NnH/p8ZS+eflu9r2KVq1Jalog9SOpnQFFIR1n6mlQVSy5b6JHg5vRBE3r/2+UowCd86P
         mVNNkLDRY+6ECuw567nk/O0+Ms4vJAqrV80LtmmS6C7JpXTGUWDchSLAN2CNcxwc4/+M
         FZf/C8lP5v5zAtGah3CQelDbQj664U+9Et2nPNzDm3HEI+38hSi2ypgi8QXXQIN2oav9
         OI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=sXPbn1PQO4zvR7t9MPiJ0mLvbtta8+tHmw0GWingtRQ=;
        b=AXo4yrhs01eZT8PJ8Zd58SHj2PdCfog3FP/ngoyLd431M7+eaL3Psdb18Y6gs9mmgN
         SW1zHkmXwLRLF4veM00Wt7qlbYdQlK5/cNz55zkzPMP4KtCKbqeSwsgKwc2T8CWf/C4K
         xYfcV6Nxp3Fghr3ir5UiXFgamN7XW0WvsgbyaYMkixyEqLkIZ4don4nXnQnH4NJ7lPMV
         aFNG+r5VjQ7JJ1wbCjsl4zX05UCeaz4VDT3pZvqHKdiUEA33RV2QexLm3C+R4gl1thh1
         vnTPqRaiQ50x9CVNGfDXmy3WdurtwtQ4p0Ks54woMEu1OwuDB7tUiLKkmc3mEaWPDihd
         bPkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::235 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x235.google.com (mail-wr0-x235.google.com. [2a00:1450:400c:c0c::235])
        by mx.google.com with ESMTPS id l2si7200781wrl.226.2017.05.30.06.57.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 May 2017 06:57:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::235 as permitted sender) client-ip=2a00:1450:400c:c0c::235;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::235 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x235.google.com with SMTP id v104so1124031wrb.0
        for <alex.bennee@linaro.org>; Tue, 30 May 2017 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=sXPbn1PQO4zvR7t9MPiJ0mLvbtta8+tHmw0GWingtRQ=;
        b=by/NXz3s5+D6H9sAu6ad1T2tdpMPDoyVs7olsTFB4lHjsNTDUKR5q5tQWJ86ZwrDda
         YLe1PhYubzRj9ZcyMeguPnj/wy/ptraakzTCKctzfJ6p1OPR+YltideryvsSsYnlFoEl
         TFljFfGzCaowwFZUmJUPFym4YzWRcdVpEnrCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=sXPbn1PQO4zvR7t9MPiJ0mLvbtta8+tHmw0GWingtRQ=;
        b=aqMZ0XX606DoNcQxwYHHXAUBejwGOFEUOV4xYrKMtYE8E1gXaTvqcxfDR1AlhwyLsr
         NbUSwts/EtE6qraV/w3vX9lstxCNWpFqu3kj7AEx9kFtBhyMepkpNZ6Vpyf523j0EwMr
         HNM/5y8DoQ7tKhVwx4ylj8hIWJ93WcC1w2VhCzeqxVOD3Klame0J8EtgkrbABlv2wY1Z
         mC7cD2B1eFkGeXCE4TSgKL9R91yRBM6PUZaB4VqwgTUHUSCBwCDIgWKPQYrg+3ejjWWe
         jra2Un9ExZ76HDNEeZR04w5iFOPXwlCpNVLzl0Qd6llRlshN55u/48fCHmr73Z+QTvwW
         SlxQ==
X-Gm-Message-State: AODbwcCKEYut4ltSfvp/BaZuJ1gP43yj0GeSpyAbkMpInuTjaWqnlqAW
	v2PORS9XwvODw9h1X7tIUdNNbyXdYIBKsC4=
X-Received: by 10.223.150.139 with SMTP id u11mr11372994wrb.195.1496152620024;
 Tue, 30 May 2017 06:57:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.135.82 with HTTP; Tue, 30 May 2017 06:56:39 -0700 (PDT)
In-Reply-To: <CAKmqyKPBYyhT5NFRks8Z4VX=mCdQuVk5+cX4s4qPpO9PQvMMZQ@mail.gmail.com>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
 <1493122030-32191-3-git-send-email-peter.maydell@linaro.org> <CAKmqyKPBYyhT5NFRks8Z4VX=mCdQuVk5+cX4s4qPpO9PQvMMZQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2017 14:56:39 +0100
Message-ID: <CAFEAcA_NvX4=zXehU4yTdwnWCyPOddB81Que3UDsM0yVhCaFLQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 02/13] arm: Add support for M profile CPUs
 having different MMU index semantics
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: NuGf4hjUl8Ni

On 2 May 2017 at 23:23, Alistair Francis <alistair.francis@xilinx.com> wrote:
> On Tue, Apr 25, 2017 at 5:06 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The M profile CPU's MPU has an awkward corner case which we
>> would like to implement with a different MMU index.
>>
>> We can avoid having to bump the number of MMU modes ARM
>> uses, because some of our existing MMU indexes are only
>> used by non-M-profile CPUs, so we can borrow one.
>> To avoid that getting too confusing, clean up the code
>> to try to keep the two meanings of the index separate.
>>
>> Instead of ARMMMUIdx enum values being identical to core QEMU
>> MMU index values, they are now the core index values with some
>> high bits set. Any particular CPU always uses the same high
>> bits (so eventually A profile cores and M profile cores will
>> use different bits). New functions arm_to_core_mmu_idx()
>> and core_to_arm_mmu_idx() convert between the two.
>>
>> In general core index values are stored in 'int' types, and
>> ARM values are stored in ARMMMUIdx types.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> This looks ok to me. I'm a little worried it will make SMMU or some
> ARMv9 (or whatever the next thing is) work more complicated as we have
> this.

Mmm, that's always a risk, but I think it will be pretty
easy to undo this if we need to.

thanks
-- PMM
