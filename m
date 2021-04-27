Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4931707lfb;
        Tue, 27 Apr 2021 09:17:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYbkoVHVe5+y/NkU5JZDFBuVLamoqzvWwwMvrUg0sHxLCJdL+2R6r9V+Ix6GTU7KXN8L3v
X-Received: by 2002:adf:9148:: with SMTP id j66mr30635538wrj.124.1619540266905;
        Tue, 27 Apr 2021 09:17:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619540266; cv=none;
        d=google.com; s=arc-20160816;
        b=gCGqKYgoCCD3vuFGqp3q6k2uTE+i4pmKhcwQOZNGVFchi4q8l4q8X+JjcCb9mya8w7
         kAxG3i2lBAhNhBd+CvAc4UEc5hzo989BNaeZI9vliKmaRKi8LUnZBXb0W6jSfN9JmpDS
         MsIH4xFBhuE6fZGVVP2UjulvcPRcml9Ae3vcZePsC2RPic4ylqmOVERESkFffDm/OOba
         eDpUmClPAZdNCUu8a2WEUcJZHEmYGdgTSUT5vyLhgQ+yH7jioV78c1JcF+s5F2OwKA3x
         KLEpDBosN0eZs9g2y3RUf7Eg6PkalO+jp/ZsFOiPmX5UHpfmjSniuJiDy92Xrd021zDE
         wlwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=hPHV6JwwzqvZQS+Oj68p4fzEHbk8VRoyq+VeA6+5S1I=;
        b=YLf8x8GLp9d8DYqnbrkysdmYVssLdLsNHx94xFWmz2OKF91e0NUfgSzyKlUghKcCjn
         aYc+eaksWJAegGjoVHUpxtSoly2h57wIYf4M+QT88MXGDBcMZUL9xonOolQxabn4Qqt3
         Zfqh+DwUSHvQgpJXHUW2NHz90dHMjpm4JrSiWq6Bv1LSy6vzmH85wZZakfvUuKv4gPkt
         evZB0lSMQl3gDed5tpAmXzxbvvwiDvhQ+65s2Af6UtwUCIVJY02wZdDTMd6W3BqTn5+M
         2lqBobiiLabUP2i8NvkCFDpQR+8bMEfkBv7OBpjAUhJY6mHanlrWcQae39qN6bIwNoNY
         5kAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CsxXYkT6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si2891171edv.176.2021.04.27.09.17.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 09:17:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CsxXYkT6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbQPB-0001aE-Lw
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 12:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbQP4-0001a1-UI
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 12:17:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbQP2-0004Ai-IL
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 12:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619540255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hPHV6JwwzqvZQS+Oj68p4fzEHbk8VRoyq+VeA6+5S1I=;
 b=CsxXYkT64RcNyXe7N4qzORPTDnM9Cuv3HDq5TT/hX22BWFQGQb1zg7gTv1n0FftUYi7/xv
 /xsTeyYTDRlugTyvymUdYivX81f/ecwc4wtGsNs02gadtfe+YJKfeSjozqHEFVVJw+otZW
 J7DuKhL9wK+SXq5fuKFYToXB9/JD0y8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-vms4IZ-xO6KjJu_v2b4LrA-1; Tue, 27 Apr 2021 12:17:33 -0400
X-MC-Unique: vms4IZ-xO6KjJu_v2b4LrA-1
Received: by mail-ed1-f71.google.com with SMTP id
 w15-20020a056402268fb02903828f878ec5so25199132edd.5
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 09:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hPHV6JwwzqvZQS+Oj68p4fzEHbk8VRoyq+VeA6+5S1I=;
 b=Xku6kbShbLmYt25aPzJNZjmp5TcB6vwJuwXJBbRCETCvL1vnxBL2woh3jhKt9pfcA1
 ctNKktZKkY7SEN3yb45kCaFIFPUN6i+aaX+s0Oq+TLjVlIGGRHCdyA6lAeagW+hh9MIm
 nAsCr3x4I7xZLecl7yAMGEUtZQDgNo2ImdslY/wlJyYTeBUAk5rdiLRYNAKU3OV25FtR
 B0CPOtOOEmT+Hi0oz7P+oxNre8gN6Kld/u1xjdweSftnZiomFjjDSqGGZkJIQvbixtMG
 aQhiraud1u1cZCMZeuJeB+lyj0PQLyNoxmPLv33JNTwAr4BGMziQ6w91LxPHO1qIcKvN
 E9RA==
X-Gm-Message-State: AOAM530RPrKvHkif/WAhtJeowF6CbuWqicC+mFMMmqWHHfT98Zo7W335
 XPsc9wiv/JcbyYTWkp5doGfmVLA9eLNpzXf8H2IFnNwqezF95kGjOTIGLzW6gDUnPbc+Koz6dF0
 pU3bsvTyOUqvX
X-Received: by 2002:a17:906:2b05:: with SMTP id
 a5mr24381968ejg.446.1619540252678; 
 Tue, 27 Apr 2021 09:17:32 -0700 (PDT)
X-Received: by 2002:a17:906:2b05:: with SMTP id
 a5mr24381939ejg.446.1619540252387; 
 Tue, 27 Apr 2021 09:17:32 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id ch30sm2748215edb.92.2021.04.27.09.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 09:17:31 -0700 (PDT)
Date: Tue, 27 Apr 2021 18:17:30 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization
 support
Message-ID: <20210427161730.iag4a4usqtiy3bgs@gator.home>
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <CAFEAcA8a53rCGBGVr_mb0fVJPXFaCShGTJE0bh=L5Nvw6ATz6A@mail.gmail.com>
 <20210427095458.3hbckyqbmfztcmge@gator.home>
 <CAFEAcA82VJqgD+B4gCr1M0n5oV869rBdoTzNS6xSs0f2f8iFvw@mail.gmail.com>
 <20210427144819.fiecdpdgre7tznvq@gator.home>
 <CAFEAcA_hvxAmodWKdEUQH4as4vMuaDVGDK7C6KeZ3-TBbPxEFA@mail.gmail.com>
 <CAFEAcA9CoW7JSdF6mT3gJOterYDAFQrYd5Czt0rZOpogTewNNg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9CoW7JSdF6mT3gJOterYDAFQrYd5Czt0rZOpogTewNNg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UtvMTNaDIZU0

On Tue, Apr 27, 2021 at 04:01:10PM +0100, Peter Maydell wrote:
> On Tue, 27 Apr 2021 at 15:58, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 27 Apr 2021 at 15:48, Andrew Jones <drjones@redhat.com> wrote:
> >
> > > Since these types of features seem to blur the line between being a CPU
> > > and board property, then I think I'd prefer we call them CPU properties,
> > > as they come from the CPU manual.
> >
> > Conversely, I prefer to call them board properties, because that's
> > the way it works in hardware: the hardware board has the necessary
> > support for the system-level feature, and part of that is that it
> > has an SoC or CPU which has been configured to have the properties
> > that are needed for the board to support the feature. Having a CPU
> > that nominally supports a feature is useless if the system as a whole
> > doesn't handle it.
> 
> ...this also means that we're consistent between boards: some board
> models unconditionally have support for a feature (and always set it
> on the CPU, GIC, etc), some don't ever support the feature (and always
> disable it), and a few offer the user the choice. Having the user
> use CPU properties suggests that they can, for instance, plug a
> has-el3 CPU into any board model, which in general won't work.
>

I feel like this can be looked at both ways. A board can have a supporting
CPU or a CPU can have a supporting board. While a CPU is physically
mounted in a board, giving it a natural "physical member of" relationship
to the board, a board's design is driven by the features of the CPU, which
leads to the board having a "implements dependencies of" relationship to
the CPU.

I think the way we look at it depends on what we consider our top level
requirements to be. If it's a board specification that we're implementing,
then we clearly look at it from the board perspective. However, for mach-
virt, we don't have much of a board specification. We want it to be a
minimal board that supports VIRTIO and CPU features.

Maybe this is a place where our perspective and interface should diverge
between mach-virt and the emulated board models?

All that said, if we'd rather start thinking about system features, then
should we rework 'pmu' and perhaps other CPU features, which might better
be considered system features? Also, is the '-M virt,\?' type of probing
sufficient? Don't we need some sort of probing that considers both the
board support and the CPU support? 'virt' might support a system feature
that '-M virt -cpu xyz' does not support, right? How do users (libvirt)
know if they need to probe both the board and the CPU for feature support?
How do we probe the CPU's support for the feature if we don't want to
expose the feature as a CPU property? And, if we do expose the feature
as a CPU property, then what should be the response to enabling it without
the board property? Error out or imply its enablement when it's available?

I think we need some sort of system feature document to explain what a
system feature is and how it combines board properties together with CPU
features (which may or may not be exposed as properties). We'll need
to document how to properly do the probing and we'll also need tests to
check all our {board-property, cpu-type, cpu-property} misconfiguration
possibilities for proper error handling.

Thanks,
drew

