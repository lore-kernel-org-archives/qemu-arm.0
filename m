Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5388943ejb;
        Tue, 7 Feb 2023 06:03:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+FCpSOSMp469pggaqQrqpFFiQoijUiBCUPV5gy+6c5lpJlWVvjlh4jcPm2F4CDvj1FXgVB
X-Received: by 2002:a81:e347:0:b0:527:96c1:1a84 with SMTP id w7-20020a81e347000000b0052796c11a84mr1405299ywl.1.1675778613209;
        Tue, 07 Feb 2023 06:03:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675778613; cv=none;
        d=google.com; s=arc-20160816;
        b=I8WAMK3r8OAoP8nX0m+LaDk8nJSjMg4W0gQRAYgqnUvdzdxARFSO65ttXM682mapp+
         MKVwtZNw3jBw5ohr02N88eMKD+injIGSJnoPeyxMUzy/sgrQ7DL1MTOE8PXfTTv0JrIE
         XWFxFkHPPtpR0ebPLslr1mMfu4SvRjpMALrhWxF/YpwPaHF5WdPd//6phG25tduL4b3S
         GjaY9ZxgqHYPIhXAMNvoizaSWS3I3bFkKnqHX3Qa9em/+J1Q0VU9j8/Zm50gPPkU0687
         LyLglMGG3AmvurFmI8v5peS9kluI9wrENpww/45KrKfe6sJRuR78gRdx021kViPJaJPW
         xaPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Z5aR+pFIII+/laXjfu4tk1cpTn732TBoBK1sRjibcbA=;
        b=Lg+DAPaXDXz3zHHmwKvqd2+VgpTFmY7+IMjIV/4/2+PW293Ot6LjIiiWESj6pUfWt8
         NHGs1+nmLIJp6boGAY8pwao7Ylqbn7A6N44IZDF3boPh3n4Tgn6gYnrPYWEYsZ0zqAJG
         lOWepANo3IznhrQwdpnmfWN6fTl1AleTwUDcXG8KyOXAhhEgDtzmLllFH7FdlL2ouoc2
         N9F1i+sgKvWDCKLNBc+//4dHMc3TwSLIou7GcCmb/bezKNwV1jajzA3xfPGKGujHXcdM
         MEqvB2o7jRmFAniTTZkw0YXZBkKd90N/LUqNdprfooUPcEUR/Eo9Zo3QQ2bulh7OIZnv
         4QAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dMSYQ3/A";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15-20020a05620a290f00b0071e5ed079besi14285807qkp.71.2023.02.07.06.03.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 06:03:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dMSYQ3/A";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOZ6-0002xU-7C; Tue, 07 Feb 2023 09:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPOZ4-0002mw-3C
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:03:18 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPOZ2-0001nU-FQ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:03:17 -0500
Received: by mail-pg1-x536.google.com with SMTP id 5so6554228pgd.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z5aR+pFIII+/laXjfu4tk1cpTn732TBoBK1sRjibcbA=;
 b=dMSYQ3/Amc4H+hU4c71AySUVBkFDdxotIJcWR2yg+7XrfycRks6sEBgrM82zTNygdR
 BAspKcbBwq5YmoI1bl1FiDBebjqtfVbOuy2o+O2qnRqHn2KTrIu33Qz+HUAX4U9jeOzH
 v51hTblnGIYZMVTctpnG1enmEKIw7d5B/8/y/1UBhVbKf1yLH5weJQ+6kwUMJ+tFuZrO
 mbrQ8f4HdgJaZvCxf/osZVN7myI/W6WyqregnVpgIUpQ++r6698tYnylaUyUiA+YNmz2
 fiCzHTtfx9N9qliU1pN5d4psctuLomjRA1TQmYxjRoVCiVji6Q8hDZ8o4xDtxfHipgLd
 KOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z5aR+pFIII+/laXjfu4tk1cpTn732TBoBK1sRjibcbA=;
 b=C2cBQG0FdNH/ItLT9HUd/ha99BKVEd2PS9zpFk2EbuMWt+b/MBAEgG3cKKuefcVTJl
 HR43Dta6yX82LZ42PqKMYxO39NauG1S36GWTtbsidz5OMUOYu1L7Sk9JV6+L8yQOH+XI
 iAVlMD7/O1Z9qYO/PbUt4orG02Ja8+LS4pFblQBJlaiU0B93MI6IjdRmGvpIU1rJ47A4
 2LiE9DVttczxnTtefoutAmoSmD2fBcSU39ISCVUB8DwJFL9pXs1hv2nZs9TRvoIREclL
 bEM5vq+ta02HtBPFgQXuZiL0AnaI7l+M+YGddjClmE1S/L23uZylQgzk76lyoBAI70P7
 /r3g==
X-Gm-Message-State: AO0yUKWt1kctGJduVFCGg4SOr4pbNcZjYoJYMInBX3+hpDMDhj+q0M3A
 HBFdpMM5MxOksN1n/+VWAFG4ZhDXnijONjEm4lF7/g==
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr792867pfb.48.1675778593942; Tue, 07
 Feb 2023 06:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20230126141120.448641-1-smostafa@google.com>
In-Reply-To: <20230126141120.448641-1-smostafa@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 14:03:02 +0000
Message-ID: <CAFEAcA_gdg_bUwasDs0O54qL5_2=DEMzAFu22x4d7mrx6W5vLA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/smmuv3: Add GBPA register
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: nzx8XnR0LAIS

On Thu, 26 Jan 2023 at 14:12, Mostafa Saleh <smostafa@google.com> wrote:
>
> GBPA register can be used to globally abort all
> transactions.
>
> It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
> ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
> be zero(Do not abort incoming transactions).
>
> Other fields have default values of Use Incoming.
>
> If UPDATE is not set, the write is ignored. This is the only permitted
> behavior in SMMUv3.2 and later.(6.3.14.1 Update procedure)
>
> As this patch adds a new state to the SMMU (GBPA), it is added
> in a new subsection for forward migration compatibility.
>
> Property "migrate-gbpa" was added to support backward compatibility.
> However, if the GBPA.ABORT is set from SW at time of migration, the
> GBPA migration will be forced to avoid inconsistencies where a qemu
> instance is aborting transactions and it is migrated to another
> instance bypassing them.

Nothing ever sets the migrate-gpba property to anything
except its default 'true' value, so this (a) means that
it breaks migration compat and (b) seems a bit unneccessary.

Can we say "migrate the field only if it is something other
than its reset value", not have the property, and get
migration compatibility that way ?

Otherwise the patch looks OK.

thanks
-- PMM
