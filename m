Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3244736ejc;
        Mon, 16 Oct 2023 08:04:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtTPViIE6z0IeWTHaCv2a5DasdsrFmWm5f5U6/T55oq7oKuYv3h8jqs9vVaQ1fD/05od3d
X-Received: by 2002:a05:622a:1452:b0:416:6074:ba8 with SMTP id v18-20020a05622a145200b0041660740ba8mr38723358qtx.29.1697468661845;
        Mon, 16 Oct 2023 08:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697468661; cv=none;
        d=google.com; s=arc-20160816;
        b=lGb0y4uM6EY23qMGoL2meFWVMXIk6L1kwJWWPE71EAha4H8UURSa+jvaNydkyg7B2X
         edXxjH6CB+nOM+s4SfhtOPQf9VOIGqnK5Lh8dmYKNmDSlgw/bcAGn5JHAyCVy79gwgVl
         3SVw56Xhbympxpw9gYBq+2eWFv3xGj1vWL5IYb29a9Az08sbuHvwOf0wzW9TbXkGEJ+G
         req2wvZwiz9shVnjS3zcauTDOZ+25ebeF7geqOX+8WZs1jNDRso0RgHrGILo0beiw4Pw
         bJlOExzKjC9osVIgpdjfo/qRDLo0zDeBKGzNw6s0C+PSUaZ1uWiM0nNmApd+fO4BA2u6
         FmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vWBt0ThzpcXe0XqhBzN6SSKL4Xm+A/nuzJrFtiDIs78=;
        fh=2SzsGb0fa9qQ4jf3twhvSDv+Iw7fOavVjMgN17KrMH8=;
        b=ChBylYzB9LHtFaB3QXhcmq47oHSomZd25Zkls+TXkwh1nXcDZimzcheZFIZHMpuj9l
         jSle69zC5+mFbyV5jMyKDEEQEQm38lbgJRc64OT+fJni6q9Opin4sBzOagFIRzLqNuzP
         JmQFTdA7l4AA54uOtGKdjakGCbLwXWlXp9ng994wC2O307ar8icKh10qtMq2tYj+fOWC
         ZOP1LMtkVOmoBS45zGDJUr73w+J3UgrFgRBrBMb5BBgtU4tdQ0oECXXFA8ss8F8YiH1x
         gFdlu2VMl86jW3Pz4Bc/d/XCu2o1hwj28+OMMXbK5BUM8PMxv8rShDVq4jWL1YPuziqk
         hkIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vaXmHmW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16-20020a05622a015000b00419997580a3si5352498qtw.710.2023.10.16.08.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Oct 2023 08:04:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vaXmHmW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsP8b-0001Yn-He; Mon, 16 Oct 2023 11:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsP8a-0001X7-Dh
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 11:04:08 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsP8T-0006Yr-QU
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 11:04:08 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53b32dca0bfso9597800a12.0
 for <qemu-arm@nongnu.org>; Mon, 16 Oct 2023 08:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697468640; x=1698073440; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vWBt0ThzpcXe0XqhBzN6SSKL4Xm+A/nuzJrFtiDIs78=;
 b=vaXmHmW2MstT5TqF+Vm73L9An2v/DNyYI88ARiZuzhcOP4wmz0tX2HgFhjyP6shW/E
 HMm2Mo6tnWFXyw5O6mxlHjX7YsG4g/Dh7FW5E9J/Kb6IpcnjfwC7vwc9OFqyGLzrdea5
 yVmjet/hOrWqXfq7eePGu7B8K8zPGTKrtIfOSgX6nRO0nRg58hflhHrQKrilwqINhCki
 HS23IB9rDBEUg5KfbiQ8scIYr5nc240MTNnx69m+/NgYov2k+S3eSAbUAxgRfNXEv8Qp
 Pjl+oePfoa8IWR5cFPD16fFCjLBHkNYcLbSu4FxgA18bXQ41FUj9mvvKOTZ283ubxtQw
 LyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697468640; x=1698073440;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vWBt0ThzpcXe0XqhBzN6SSKL4Xm+A/nuzJrFtiDIs78=;
 b=MAy/pODnfIVNL57wRuMedvD7RMObz1I2X9QEedGoNPhnmdySR6V4SHiNLXDYgWd812
 rwZVRTCyvM9RwUVR1odtmnbvYFSZQx7HF8azPabkIAOBdkxAClTZpmLVpkBvS3qmBd+k
 89K9bP002JBqwr2WO4wUdbOlcUl53g1bP/rxs24QIzEZ+wH8INP0wwW1+T4FBpOOwVo3
 X5uPFTDcUjJzX8Vm8HsxpC9txbI/iuxBInN5EIxtn8ZKq2Iqsy59Bzf3ttjMwF4sRoZd
 bj0Yuh68X66fXL+7yrn/xSZRtBHwDQngmPnNqiqGaDgf6c3yETew7bvHdWv8a3Sy5t+q
 vRHA==
X-Gm-Message-State: AOJu0YyDTBzf7wLnR1GeL0Nea/VIBHui7i9ZxPKndUn7pWWWTaO7wFjR
 +ZAw9EMp5LTl69r8AeG2p6amajtwO3U8937skTvKUg==
X-Received: by 2002:a50:d619:0:b0:53d:e91b:7158 with SMTP id
 x25-20020a50d619000000b0053de91b7158mr7099309edi.0.1697468640250; Mon, 16 Oct
 2023 08:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
 <87o7h2hey5.fsf@pond.sub.org>
 <CAFEAcA-LQP_dQ0mjeNe8nOtMVy22iwJt2yfG5m_f4oQjQ9ts7w@mail.gmail.com>
 <CAAjaMXYfu2rVVUkwAczqQRHxgFrYr=hQHP_UGn7LVUks+DFz4A@mail.gmail.com>
In-Reply-To: <CAAjaMXYfu2rVVUkwAczqQRHxgFrYr=hQHP_UGn7LVUks+DFz4A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Oct 2023 16:03:48 +0100
Message-ID: <CAFEAcA_fLBe9CuWFYpeuejj8dcerhFtPNX+iVaVFvH4SXx1oAg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/78] Strict disable implicit fallthrough
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 "open list:ARM SMMU" <qemu-arm@nongnu.org>,
 "open list:Block Jobs" <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: pJDx+AtARpuo

On Mon, 16 Oct 2023 at 15:58, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> Hello Peter,
>
> On Mon, 16 Oct 2023, 17:13 Peter Maydell, <peter.maydell@linaro.org> wrote:
>>
>> On Fri, 13 Oct 2023 at 13:42, Markus Armbruster <armbru@redhat.com> wrote:
>> >
>> > Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org> writes:
>> >
>> > > Hello,
>> > >
>> > > This RFC is inspired by the kernel's move to -Wimplicit-fallthrough=3
>> > > back in 2019.[0]
>> > > We take one step (or two) further by increasing it to 5 which rejects
>> > > fall through comments and requires an attribute statement.
>> > >
>> > > [0]:
>> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a035d552a93b
>> > >
>> > > The line differences are not many, but they spread all over different
>> > > subsystems, architectures and devices. An attempt has been made to split
>> > > them in cohesive patches to aid post-RFC review. Part of the RFC is to
>> > > determine whether these patch divisions needs improvement.
>> > >
>> > > Main questions this RFC poses
>> > > =============================
>> > >
>> > > - Is this change desirable and net-positive.
>> >
>> > Unwanted fallthrough is an easy mistake to make, and
>> > -Wimplicit-fallthrough=N helps avoid it.  The question is how far up we
>> > need to push N.  Right now we're at N=2.  Has unwanted fallthrough been
>> > a problem?
>>
>> Mmm, this is my opinion I think. We have a mechanism for
>> catching "forgot the 'break'" already (our =2 setting) and
>> a way to say "intentional" in a fairly natural way (add the
>> comment). Does pushing N up any further gain us anything
>> except a load of churn?
>>
>> Also, the compiler is not the only thing that processes our
>> code: Coverity also looks for "unexpected fallthrough" issues,
>> so if we wanted to switch away from our current practice we
>> should check whether what we're switching to is an idiom
>> that Coverity recognises.
>
>
> It is a code style change as the cover letter mentions, it's not related to the static analysis itself.

Yes, exactly. As a code style change it needs a fairly high level
of justification for the code churn, and the cover letter
doesn't really provide one...

thanks
-- PMM
