Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp564195ejy;
        Tue, 13 Sep 2022 11:22:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Q+aO2cMUYVD1t/JbmpyAcRgBvJUF/BtzsvxqNPn6hdtBYEkICyPoSBgJz/7DZ3DYRybGI
X-Received: by 2002:a05:622a:206:b0:344:a554:e555 with SMTP id b6-20020a05622a020600b00344a554e555mr29815466qtx.187.1663093344770;
        Tue, 13 Sep 2022 11:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663093344; cv=none;
        d=google.com; s=arc-20160816;
        b=vFEampQFC9XteqOMrmYqcO+0y772S0CyVZOsITDSjm0aV50Egu8mOldwHdpALXsTjW
         3EbdMkBbgKK0BHjKVzdIJoGvOzzsFoRkbDoVS0NAOf7eQGjYtAFrHs4RWWklkhBPDoZ/
         eRDVeKvd+0UAsFG+mPz/0/U7o5hy+dMneTBIKGYIK9ExujteI1LAlzmeVdUC6+BDYGus
         uwCt2w71eajMYnJjfBsuGSZ7LHwdWcwKHo01kN/JSW9OUETpJfcTNqfxUv6kT4LXNvmV
         MvkpWUWqwWuHyK+UvWwKBAcKmrcILuf+Bkg4hXcWgSmqUDRYJHvz2ww5l0/94gD1MJGt
         IOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=73X7tjK24eyeMwRo5SkXom90dYm0sSUaWjd90OYmkp4=;
        b=Cpc89Wf3zghGshtFIpty5JSP5Pjk9whQygjxUvs85H30afvrlDfphFIHHBRhfahHp5
         WhNztV4bWb0QPb8uWpLGLmQPgtAUvSTWEldMBh/pgOlD8KaO9SbNvxUx/+DmHsxh5EK8
         JL3Z7wX4hT6kzRlruOaO3n0i01NQ/r6IocglOTAGuq3q/m0uZGwQo1gEdiIAF2RLcNms
         2fcN35t9OvobOzdL4I6dyvJgzIqfN9GJzk0U2FRjKBLQigag3aLcpowf5w7IN2gTBHzt
         nnq2qIgqILl4oKflOyVSwioqPiPkvB8vePCPoyueNSHkUFTKUmCew1TVNjmB/8Gqebu/
         PODw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Qu/O/4Kr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020a05620a290e00b006ce622e6cb8si13894qkp.724.2022.09.13.11.22.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Sep 2022 11:22:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Qu/O/4Kr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:54168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYAYC-0004fs-9X
	for alex.bennee@linaro.org; Tue, 13 Sep 2022 14:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1oYAXT-0004eB-Np
 for qemu-arm@nongnu.org; Tue, 13 Sep 2022 14:21:39 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:35738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1oYAXQ-0007Nn-8C
 for qemu-arm@nongnu.org; Tue, 13 Sep 2022 14:21:38 -0400
Received: by mail-pf1-x435.google.com with SMTP id e5so12553360pfl.2
 for <qemu-arm@nongnu.org>; Tue, 13 Sep 2022 11:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=73X7tjK24eyeMwRo5SkXom90dYm0sSUaWjd90OYmkp4=;
 b=Qu/O/4Kr8m6ElbRpxlxnefVOk/lX2UhgY0DLxyzrY9Bv/ghlq8l+ZPjczTCRIBt5bm
 ZzJkHyKIgR5ilKgSgDV4Jdh8yKmj2Q1tNtOgd5rN2nBzeg9h3bCFjOuj081YUHg5Zfsl
 nTyT9QYIyTl3XbdyFTigmganhtMbhY4mV0IpDCWNusuB9T1kQPlHbKW35XYdqJV+ISLD
 DS1UD4vBHITC8QHq0ZJ2bljgy+eTzoDurWmyX/N4Ej5USqkWBE/o5KFb1NH/U5eWD3fs
 YedpQmBmCNcEnTmfJSU09emmO3rIOv0qranI0OjTkIh3ZXrWklCAVjof2imhBO0O1P1R
 lLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=73X7tjK24eyeMwRo5SkXom90dYm0sSUaWjd90OYmkp4=;
 b=ScSvW5SBh1GOnbjUet+sk+cj9PJIlr1RIX6fy8DKsrrtNETDkQtoGNaZUvIVTxyRNe
 6PmFrQ8xw8B/4Ney5xktkhgjNMKYSCaBBFqrUoaBSTEYaaA6gPWnz+8wEUkJXASTMtcb
 QZQ2b6Mx6GAaaHdKPWvUU6FBx3kDmzQSjV219YXJi9ox1/SxRjuwTm6NbSCSNXCY7OSV
 5iD00+3qDFywdYsnFmJAS9HG3VqFSAYxSF0lTVxJj/whG7gx62atA/n3Mr57a8XGAvln
 s8F1PibjiCYzbVbsns3epQ6JdE0743ypdzsQ6HO7zkkS/5RnegQ+xmT9p1WztL8wVhLA
 9GOQ==
X-Gm-Message-State: ACgBeo1LwL6ZgRogcSiwxyju12cz23C2sVdvbcEfOcSFFrQlz9CT4xGx
 f//KZl0WFZ3/aroZl+LIJCWiOQ7yzzeyyMuHA80mOQ==
X-Received: by 2002:a63:e055:0:b0:438:cd8e:f263 with SMTP id
 n21-20020a63e055000000b00438cd8ef263mr13539787pgj.378.1663093293725; Tue, 13
 Sep 2022 11:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220906220552.1243998-1-titusr@google.com>
 <YxuZ95ppk9lZ/23g@pdel-fedora-MJ0HJWH9>
In-Reply-To: <YxuZ95ppk9lZ/23g@pdel-fedora-MJ0HJWH9>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 13 Sep 2022 11:20:57 -0700
Message-ID: <CAMvPwGqjfRrvx7uv0PNQK14VMbjf1wEK_w2LaELL02f91srWBA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Initial PECI bus support
To: Peter Delevoryas <peter@pjd.dev>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, patrick@stwcx.xyz, 
 iwona.winiarska@intel.com, tmaimon77@gmail.com, quic_jaehyoo@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=titusr@google.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xDK6wR12nvDu

On Fri, 9 Sept 2022 at 12:54, Peter Delevoryas <peter@pjd.dev> wrote:
>
> On Tue, Sep 06, 2022 at 10:05:49PM +0000, Titus Rwantare wrote:
...
> >
> > This is something that can also be extended as other parameters arise that need
> > to differ between platforms. So far you can have have different CPUs, DIMM counts,
> > DIMM temperatures here. These fields can also be adjusted at runtime through qmp.
>
> That looks good to me, seems like the standard way to do it in QEMU.
>
> >
> > A lot of the registers are hard coded, see hw/peci/peci-client.c. I'd like to
> > gauge interest in what potential users would like to be adjustable at runtime.
> > I've not written QEMU models that read config files at runtime, something I'd
> > appreciate guidance on.
>
> This part I don't totally understand. I also barely know anything about
> PECI.
>
> Is the register location for things different between CPU generations?

Some things seem to move between generations and others don't move, someone at
Intel would know better than I do.



> If so (and I expect it probably is), why is there only a configuration
> for Sapphire Rapids, and not for the other ones?
>
> Is that because of PECI protocol changes between generations?

I haven't dug into the other machines because of internal demand, but
I've found that
with newer generations, more features get used in addition to existing
ones. It's
possible these features existed on older machines.



> In which case, maybe there needs to be a notion of PECI version
> somewhere?
>
> Also, I don't understand why it would be adjustable at runtime, do we
> change register locations during execution?
>
> I would expect it to be part of the board definition.
>
> You could provide a bunch of sample configs for the CPU's that you're
> testing for, and the board configuration could just select the sample
> config it is using (corresponding to the CPU model).
>
> That's the model I would imagine, but I might be missing some important
> context here.

I think it would be nice to have additional registers at runtime, at
the time of writing,
I don't know how much of the internal workings of Sapphire Rapids
Intel is willing to
share publicly. If users are free to separately define registers, I
don't then get to
worry about this. e.g. I'd like to simulate errors from the memory controllers.



Titus
