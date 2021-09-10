Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp984574lfb;
        Fri, 10 Sep 2021 02:31:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMfrQsKBSsk5WjJS9pKO2G1+YZpNqUinQXYEnrUz840TFtnJGTAKgPFSWj4pFBsZWRYofj
X-Received: by 2002:a92:6904:: with SMTP id e4mr5633606ilc.311.1631266314767;
        Fri, 10 Sep 2021 02:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631266314; cv=none;
        d=google.com; s=arc-20160816;
        b=b76Ku2XBBK6SeY5A1mvAm3Y7huU1Noxc1yRUQWrd6B1Ms5cApnL4X5jhm0y0Knz70n
         QJ4UWa1GntMU7kylSVPCGBizuF/29kpdxUbizu4iw8EbE9sVEh6dL9HNx6eOM7moDazk
         ZO/prLdFugb18tsNY3sUcBx1vADUUhUsi5JihmglBm9oUIVvZt3aMvu2jKU++/T6kgbc
         pH6K6+KTGCVxm75tEFxYBXNTOHN/EMhB/I3kUhkN0Khk2tlUZcysAnx28RiRjjDyBBc1
         PDd8P7SzU2gNHL9TZjz7N/YX43sdviQkn9edPb0KvzUXaC4e3Hjwx1UbrF/mH4sfyAVS
         6QOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RpAQ7vNrv0bASmLyuLZvnjH8wlkQv7MQ5QwSC9XkwA4=;
        b=DsbmaJmif+rJuXuAB6cUrVRoVb24H0W1BFOj23U99bxlZB0+ANQjZCZuzLNbFCJRRd
         83C05kObXtRxt7aIwaZEhQEeOsxRIRAFt57HeUh9NCj0SHwUARLkoQXPJPMdcsHrUinu
         1c6zKFffZjb3w0Ny8zgMV/GSFpXUc13Co62+292eDsUbGRW/HlxbOhsQfPQt0e7zb63A
         8pFfDnJKySEbNuT15k4fqG/vrnCrsKYTrVjRtYDGx4RLsWqpm/LT5EDwVSRGj+TeQSwe
         Wog3dyALk15Vj5GlRpS3SvZw+ilCkYTGN8Es67RCU9DGyXpoW1kCHKDbk9KsSHzCLVhI
         KaQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UOSBZBxM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 131si4117438ioa.3.2021.09.10.02.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 02:31:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UOSBZBxM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOct0-0005IY-5M
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 05:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOcsY-0005GU-Ga
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 05:31:28 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOcsV-0003Wi-2W
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 05:31:26 -0400
Received: by mail-wr1-x433.google.com with SMTP id w29so932286wra.8
 for <qemu-arm@nongnu.org>; Fri, 10 Sep 2021 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RpAQ7vNrv0bASmLyuLZvnjH8wlkQv7MQ5QwSC9XkwA4=;
 b=UOSBZBxMMQ+p1jJPRw60jIJjumaIQmhqU0H7fMXMP3+qRUxs+NebOb5CurflMCI2n9
 bZPeBK3X5O0DLEkgMwqEVpkKnZmXZf0jPQc6NkmvMFi0FA6oArLTdQqphhMkGQCmuIYM
 jn6v+3dsM+KvQPvDSWDzKhtFb3l/2r7kt2vQZWpnUO7nVDIS5o1S5RUxFYGfNa+g/rtD
 wW2di7IOZkAggjl5JkVyK2NrQTVf2iYI4MulrqVkVTaVeSYIKaQAMNtsQHFMe6JFWjsf
 8Vo9C0BPsfNWvTBBtbTsgQkKYoW4M3hXti7jkYTwB8unKybadR/zOmVC2vVuD2eRIcLs
 h3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RpAQ7vNrv0bASmLyuLZvnjH8wlkQv7MQ5QwSC9XkwA4=;
 b=mRupu+fWq4p5HZkgwfdtYFVajt6gaT0humCV5gw6LddPVdfAKHRkj9Bl9VgtReejmR
 ee+Dlwq2cy6Kq71/FElk5rb9M9kWwYqpwqjpY6ABEsByafG9cMyPDnJ2C52kaQqvwVuZ
 vhJIeR+p4+1DuMy20C2mPydVcdYnq7ur2ZXX2ttHUePzYJtldnMqo6RMCNB1+xPlTcds
 /AT5Eo2SmjRijRkmrXcZY6fg0us68tY+rz5fz1Ikt7lm2hO16URBdqAWOuhHBfziSUGM
 6KdZDGYLSQl+EVyqmevLGG7OXDZf+qmjhD1Ie6HV1UVTb4cTPZShxLI+RWSiTEr25Ye2
 ORMQ==
X-Gm-Message-State: AOAM533RHgy6JDERqiNNunNxb8MtVRItSrwOgxZu8xC60y8mEwMWXuF4
 WPxG0KsvKJv1E3EMTyw/4XWtu8F7J7NDIpd5555nsQ==
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr8470457wrq.263.1631266281438; 
 Fri, 10 Sep 2021 02:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
 <CAFEAcA_xUSMEoT34fkwiGef8D5Rwfkvre8o03YqgEw-qD86o=Q@mail.gmail.com>
 <d2263937-aa85-c51c-9a2b-bc50043e10c7@linaro.org>
In-Reply-To: <d2263937-aa85-c51c-9a2b-bc50043e10c7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Sep 2021 10:30:31 +0100
Message-ID: <CAFEAcA_Swe0LE6m2JocLsyuV1ioDnK3N0y_hJ2QAXW86UxC=dw@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: YX1LzOUbJwVR

On Fri, 10 Sept 2021 at 07:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/9/21 3:46 PM, Peter Maydell wrote:
> > On Fri, 3 Sept 2021 at 14:58, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >> I think you need to go ahead and end the TB and resync immediately.
> >> Just set dc->base.is_jmp = DISAS_UPDATE_NOCHAIN instead.
> >
> > Is there a rule for when we should set is_jmp to DISAS_UPDATE_NOCHAIN,
> > when we should set it to DISAS_UPDATE_EXIT, and when we should call
> > gen_lookup_tb() ? We seem to use all three methods at various points
> > for "I changed some CPU state and want to end the TB"...
>
> UPDATE_EXIT is for when you need to return to the main loop; UPDATE_NOCHAIN merely avoids
> goto_tb.  Direct use of gen_goto_ptr should be reserved for branches (which I think is
> already the case).

And what about gen_lookup_tb() ? As far as I can tell the semantics of
this are the same as setting is_jmp to DISAS_UPDATE_EXIT: the "set PC
to s->base.pc_next" happens immediately rather than being done later in
arm_tr_tb_stop(), but I don't think that should make a difference.
Or is there a case where it matters?

If gen_lookup_tb() and DISAS_UPDATE_EXIT are the same, maybe we
should get rid of gen_lookup_tb() entirely ?

-- PMM
