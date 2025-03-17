Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2231219njb;
        Mon, 17 Mar 2025 06:12:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHASgbSVGa0bKYGofvPo5YyiLR5cmtZhqOVONmenTgvwf1ui9KgWO4h86tYIH8M4QWWhY4jq7Dk7duTQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGQKDGtnFQnAr6Uc0RZYuqjdw6ABGNmZLseVsMMf1DZ5Ob6uzQQSAXMsB0YLoBNNIS+3vzw
X-Received: by 2002:a5d:6d05:0:b0:391:12a5:3cb3 with SMTP id ffacd0b85a97d-3971cd57c91mr13041478f8f.3.1742217176143;
        Mon, 17 Mar 2025 06:12:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742217176; cv=none;
        d=google.com; s=arc-20240605;
        b=Ow5zVY0v5VmN2iOMt+E8PGyExiDKmsk9CEc25T8OVOyXN2zFGCH0WuOEEt74uTeGIj
         pw66UVHHb7E42Zp/mYLhv+FsXUkklCG+Jlob2mcRlleGZqrIVR8hDyJXLczK+dXfy226
         /HKy+mm3giGSELjigmrwAjO7xdUEZxa7boGNE5VH0eRoWoc/gNYvEmDVRrnQkeNr8F8u
         G06Lt3yjYOThWz7Js4OwEecOzp6Pz3yF4MdSOkyq917iG9V55xRIoB9XeKghvsgB0eCQ
         /DDm8nNwWgC1z2PPKiMdstZfjM7ntGaXf2F5n/GOwVBdMXnwKFeNVek9iian3L55Voss
         oATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2Jeu1KTlsKhwm7xWBMBDC+MDS3XtetflS5MPkv/qg4A=;
        fh=bi3KEZMOocjdIMPd9UnGkL37vyyjWq+QhbnFGr4qbhc=;
        b=RcczVY0mp84cmh1Eajnu8usCO6zrEOKGeF2SxEn56L16a2jLoT8QShjxUZRaJ0LTOg
         nFrpoiZ5oXYDgOVhKm5A/YRPWVi3/bqqk8wZCYrdLe1szazol2XLr4dNJsx3yJUPD2O+
         9o9lQqJH0D88zpGlsxtG5wMz68+CijxCsb9MM6xFc1lBmJdxXML0wZwIrM9+uDBU3vU8
         dYFUXaw4qa1s5SMYG4+FK5vq7OEDlAYi5NQ2T+vDyHGG3i/j7exQC2JEzC8uUHvU/YWz
         R7FfuZCRpjllLKYJ7yYMJNndwu4aq7TECs3n3qOZYl2BW+BN9mGMW3Uio/+7ftLbaZHL
         Awlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Nuh09LdT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-395ca969b01si9528180f8f.587.2025.03.17.06.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 06:12:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Nuh09LdT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuAGv-0007FQ-8v; Mon, 17 Mar 2025 09:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tuAGZ-00078f-Bp
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 09:12:30 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tuAGW-0004Y0-MX
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 09:12:27 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2ff6a98c638so3552111a91.0
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 06:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742217143; x=1742821943;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Jeu1KTlsKhwm7xWBMBDC+MDS3XtetflS5MPkv/qg4A=;
 b=Nuh09LdTnz42U2Fs8wlLqy9Js2Wju3+1l+Uk2CMjoi2XM7xEUtvxOQly0id5Gdtund
 IhJLye6T70iH+XTYV5iCaDeJRWIbqK0tYod34+HolBdJCvzdAHknZpR+aCpXjxyTfH09
 q54dSgNxtnyVb/EkOMHN4Npy1UTY/Yk3iLowWaeCnq3KV+DSv3CjQfFbNhyqg5Ghnp7l
 VlrUKMUCEvFLqY1OibauRAGXmwndoAyOSiD7Cvcxa+g/ipyApMjj49EbZ+NxcIogqrMU
 FnX+ZrVHTz6WyLcq/slY3pSk6vsE4aqGl0tSQAsNwVbHBCLSrmJFAFkh0SPWD38ijMfR
 iRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742217143; x=1742821943;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Jeu1KTlsKhwm7xWBMBDC+MDS3XtetflS5MPkv/qg4A=;
 b=bdbrEq5wW3lf4nVXrEmI9egqqSkNLFbsgXLF+uwZzd3jczSItSpVaOdayPQp16NpyN
 y+yQBeYv3r0TeTkT7V073yu3M6chCiC2blsYKfU2qYiIXnu43v+ptS6c2nsuY8UGpT+v
 9tFPEaFriB3vsOoRl6EA9dqE0XE0Yrx1buuUVrLIrmVlf7wJ7cU7pjz+0PHRAJWD1LDg
 HA/ADDp0e1wC57gCIOnedsGFkFt83jWhVhx36p8DTF7TsnvNja2vIH6d+gpk9LdKVL2Q
 E10beAIXJJq9s2VtFdewolgW4LRKDbUvc/KBr7A+xlg15QH++zf6i0XrxTnIgKIAkUeI
 UfGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZq/44CJAlhZGwhbDRIvahGy1RNNP/PG8mAnl0cVqVAyHIFrH6yU9nUh0UkzgLDFfIPZSN1EF7fQ==@nongnu.org
X-Gm-Message-State: AOJu0YzMgOzMihJh23O1bg7NoH077tda/jmoDiH/hMZh0FWDZzlO54+F
 VszdnfQyRQrmFEUZFBRlEo/vOASGeNImNLhmoHwzkk+wrhcAi3yhFyK/qhxnx0c=
X-Gm-Gg: ASbGncuAHUAtO9sDKnzx19Lo/8RGYJBSfnms2cAVZCEIYPf8rxVhdSbsE+4vX3s42US
 EdTifrvQS4IgqBFtsgYrNIbBgg5LquOaW+JfW90hhjQE3QrRIZo5DUapqzOfBW4odR6qHsRPxRN
 /wPlMZ9MU/Wl7D3/B2FwK7vhWWywc8K8Re0/mpUPusXsA4tZRBP4WrJVY0O3Gs0Oakmuf6G4alC
 W77vWXbfv9BKhJo8W49rebl98UMdOkQI42tGF2CEl+hXpyx5h6VxhUeStNhKRmYr3/cn7aproPV
 yLkwRj7opCU0w5SnUar5TJxeMn9aukr9fsOnAmPwUCxTDN6w+wt25/0r2w==
X-Received: by 2002:a17:90b:1f90:b0:2f8:49ad:4079 with SMTP id
 98e67ed59e1d1-30151c5df91mr13074562a91.6.1742217142914; 
 Mon, 17 Mar 2025 06:12:22 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301535a53f1sm6091413a91.1.2025.03.17.06.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 06:12:22 -0700 (PDT)
Message-ID: <b3ec57eb-30c3-4692-b262-184381090c44@daynix.com>
Date: Mon, 17 Mar 2025 22:12:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] target/arm: Flag PMCNTENCLR with ARM_CP_NO_RAW
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, devel@daynix.com
References: <20250317-raw-v1-0-09e2dfff0e90@daynix.com>
 <CAFEAcA9Cy_870gxNmPFykzTjXOfi0raotmA1NRpZEQKfFfB=0g@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAFEAcA9Cy_870gxNmPFykzTjXOfi0raotmA1NRpZEQKfFfB=0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Jb7CMBLQWFQE

On 2025/03/17 20:53, Peter Maydell wrote:
> On Mon, 17 Mar 2025 at 11:16, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> Supersedes: <20250314-clr-v2-1-7c7220c177c9@daynix.com>
>> ("[PATCH v2] target/arm: Define raw write for PMU CLR registers")
>>
>> A normal write to PMCNTENCLR clears written bits so it is not
>> appropriate for writing a raw value. This kind of situation is usually
>> handled by setting a raw write function, but flag the register with
>> ARM_CP_NO_RAW instead to workaround a problem with KVM.
> 
> I'm not sure there's a "problem with KVM" here -- it implements the
> write to PMCNTENCLR to have the semantics the architecture specifies.

The inline comment includes a reference:
 > KVM applies bit operations that prevents writing back raw values
 > since Linux 6.7:
 > 
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a45f41d754e0b37de4b7dc1fb3c6b7a1285882fc

> 
>> KVM also has the same problem with PMINTENSET so add a comment to
>> note that. This register is already flagged with ARM_CP_NO_RAW.
> 
> What are we trying to achieve with this patchset?
> You can't write to registers from gdb, and reading PMCNTENCLR
> just gives you the same value as PMCNTENSET, so you might as
> well read that, which we already expose.

That's also true for other registers marked with ARM_CP_ALIAS and 
exposed to GDB so I followed those examples. It's up to user what 
register to choose after all.

> 
> More generally, the gdb-stub access to system registers is
> something we put in on a "this is a minimal amount of code
> to provide something that more or less works" basis. If we
> want it to work better (i.e. more comprehensively, possibly
> with write support) then we should address that by looking at
> the design of doing that more holistically, not by making
> tweaks to address individual registers.
> 
> Specifically, I'm not really happy with adding explicit
> ARM_CP_NO_GDB flags to everything we currently mark as
> ARM_CP_NO_RAW. Either we stick with our existing
> "minimal changes to produce something that works" approach,
> in which case we deny gdb access to NO_RAW registers because
> that's easy and most of them it won't work or doesn't make
> sense. Or else we do the actual design work. That might turn
> out to mean "we explicitly mark no-gdb registers rather than
> overloading NO_RAW for this", or it might mean something else.
> But we won't know until we actually do that design work.
> 
> (see also https://gitlab.com/qemu-project/qemu/-/issues/2760 )

I suspect that some registers with ARM_CP_NO_RAW cannot be determined as 
GDB-visible or GDB-invisible based on the current ARMCPRegInfo fields, 
and explicit marking with some flag is inevitable for them.

That said, I understand explicit markings with ARM_CP_NO_GDB may 
interfere with the future design work, and I think I can still solve the 
problem with PMCNTENCLR and similar registers without it. Below is a 
detailed explanation:

The underlying problem here is that the current definitions of 
ARM_CP_ALIAS and ARM_CP_NO_RAW are contradicting and incompatible.

Now let me describe characteristics of PMCNTENCLR with yes/no table:
1) It has a state - yes
2) It will handle migration and reset - no
3) The state can be synchronized with KVM - no
4) The state is shared with another register - yes

1) the presence of the state usually implies it is visible to GDB.

The documentation of ARM_CP_ALIAS says:
 > Register is an alias view of some underlying state which is also
 > visible via another register, and that the other register is handling
 > migration and reset; registers marked ARM_CP_ALIAS will not be
 > migrated but may have their state set by syncing of register state
 > from KVM.

So ARM_CP_ALIAS implies:
1) It has a state - yes
2) It will handle migration and reset - no
3) The state can be synchronized with KVM - yes
4) The state is shared with another register - yes

1) is implied from 3) and 4); if there is no state, the state cannot be 
synchronized and cannot be shared with another register.

The documentation of ARM_CP_NO_RAW says:
 > Register has no underlying state and does not support raw access for
 > state saving/loading; it will not be used for either migration or KVM
 > state synchronization. Typically this is for "registers" which are
 > actually used as instructions for cache maintenance and so on.

So ARM_CP_NO_RAW implies:
1) It has a state - no
2) It will handle migration and reset - no
3) The state can be synchronized with KVM - no
4) The state is shared with another register - n/a (there is no state)

It also makes the register invisible from GDB since there is no 
underlying state.

As you can see, ARM_CP_ALIAS and ARM_CP_NO_RAW have contradicting 
semantics. A minimal change to make them compatible is to explicitly 
define what (ARM_CP_ALIAS | ARM_CP_NO_RAW) implies:
1) It has a state - yes (it has a state shared with its alias)
2) It will handle migration and reset - no
3) The state can be synchronized with KVM - no (due to no raw access)
4) The state is shared with another register - yes

More concretely, the documentation of ARM_CP_NO_RAW can be changed as 
follows:
"Register does not support raw access for state saving/loading; it will 
not be used for either migration of KVM state synchronization. It also 
implies reading the register does not expose a state and hides it from 
GDB unless ARM_CP_ALIAS is set."

With this change, we can express the semantics of PMCNTENCLR without 
extra explicit markings of ARM_CP_NO_GDB and any contradiction in code. 
This explanation is long but the code change should be minimal.

What do you think?

Regards,
Akihiko Odaki

> 
> thanks
> -- PMM

