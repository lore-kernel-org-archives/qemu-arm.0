Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1867888wrg;
        Sat, 22 Jun 2019 08:58:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzgXrFPWyAPehp7Q5j247HWeQIyW6mYzjngSXEoEFP7as3xmwNILgOCkog3H3+q5SRJj2Ww
X-Received: by 2002:a17:906:3756:: with SMTP id e22mr41092802ejc.72.1561219129451;
        Sat, 22 Jun 2019 08:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561219129; cv=none;
        d=google.com; s=arc-20160816;
        b=aBXHStVl1S8P1QuJuQxaOc54CZOC25wK97smjm0tgyiTOqu8x3A9kM90Huz3QgyCc/
         DymO8o8SaRJacwTiwl52kRO7pA4rp0vadDxez7OvU2ZelFTmAH9O3SXNiMtNbJYKS0J1
         M0hfYFzEovHjqEwaSptmt804TVrATiVSnDJAWefcxXOCOyVQDcHl6ECkSJtAjDm2uwKh
         wRdD/cRURRiVNea4VWuFgTEki4gmuJXzC41KrtaBU9J38BG0xReEDViuF/Z2zHTeKFSm
         I/s4UpcCToZwV0r5b6Q29HoRlpS8EvLEITg/Yam/UnufTucXLdzoryDvIK5Av4+paRIe
         HvBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=imCTxdPEt5J++AIJaO2+JaMor4MuSWehoKKHw0VfX4A=;
        b=O3YwhoiSUqmPShy0gVoY0odvCfgC2xxPX5hQx06OzeFRaPkk2LXeDZOB7wJ1SmwiAs
         kkbUximjATLXEww7DLJMB9i2Lm7GEQi6ffpczZIOmnMsHDfkQNZUgi8AjAbG73olbi3U
         z/6woJ/gg5y2DLSIkpzf2UfkG2QMORLQMl7+Sye4Vl7JAVmkv7tlzdaVZxCywrnkIyqI
         Is3C3hmsISGdnNe5zDevSMU+UstMuC3v48i/9QqoECz0Myba+WmSFXJXzzVvy+F3YBba
         bFzCZDwGHm3cVlWsL9lEs2Qg+LtmYjMVUcn7if/o2xvvOSs3+pCzKY10Voqp+ZNvLxSp
         uUcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ldsJyRj2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w42si5292653eda.142.2019.06.22.08.58.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Jun 2019 08:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ldsJyRj2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41432 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1heiPg-0003vj-Am
	for alex.bennee@linaro.org; Sat, 22 Jun 2019 11:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43507)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1heiPW-0003vL-S3
 for qemu-arm@nongnu.org; Sat, 22 Jun 2019 11:58:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1heiPV-0003Jf-Ns
 for qemu-arm@nongnu.org; Sat, 22 Jun 2019 11:58:38 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41686)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1heiPV-0003Iu-H1
 for qemu-arm@nongnu.org; Sat, 22 Jun 2019 11:58:37 -0400
Received: by mail-ot1-x342.google.com with SMTP id 43so4502570otf.8
 for <qemu-arm@nongnu.org>; Sat, 22 Jun 2019 08:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=imCTxdPEt5J++AIJaO2+JaMor4MuSWehoKKHw0VfX4A=;
 b=ldsJyRj2+fKmIGTN/FepHU07GBewmcV4938R+cDf6IP9HCBBxCWoMjYXbIqn9aR3OO
 VuWPkX3NYZ67BaKdAsut5AQ1odEEfxNk1fFYGa3Dm/tsyBoxCs43+qGoAsism/6mdoJp
 Ulcp1MxrdYRoFej7XJlOoOiNEL9lencHDWvjUtM5YOCzrOEPkvD2cZXMKFD+kR5eFQ1u
 ixk+393vFHiZWAWW17eTbG9S/tKXbT+v6o4TcNLbx5HsBpfuigZeeMCcRGntCGh1xwWs
 QtMbupFv+ocIkyGppjKyKaHDMkhG0L3GkK+GZBDL60GDK/ikuqCEJpI7NB5Ph72M8X7I
 ipKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=imCTxdPEt5J++AIJaO2+JaMor4MuSWehoKKHw0VfX4A=;
 b=anFhYSHa+fkbuXuXm+0ZOSk1e3UHebnV58fVAxEV3aMw2PxHYLRDZkKbXZrI1bJgKP
 zZ6zcMzz2XIgwwzbP6hJlBeK/7EW+mJaoAHmvNoH778eV9TyXKi+Qjk4JSlA51J8s0Tm
 kDOYadSgz1ijiAKG/SLlcLqdsiGjA3tSbXLsU4Oh0hurwUJ4q9UsOw8o7bPYs0g8pIhV
 vQDMvyVnx/VSEec4CV5eT5mDeIqoAEVmcYp9Vf/Xwz+KsNwRf650I6t8b4k08EGOVXbo
 tieZV21DvMef3N0iqB/H5vqj6yLDsO6HMdCF6E1v6DBbVnu/gb3juDxe5Xe4WEvipUPi
 NzkA==
X-Gm-Message-State: APjAAAVLHeS2GiJwOz08v/wC7JzEIaV0xBmJ8PNAq2tcR9XfTUL08EU7
 spWr14agmpGVcfmOjddzcisvnPlHD9D7PKQeLeBJxw==
X-Received: by 2002:a9d:711e:: with SMTP id n30mr22171787otj.97.1561219116481; 
 Sat, 22 Jun 2019 08:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190620222314.2670-1-wainersm@redhat.com>
 <CAFEAcA92m9n7FR2a6=ecnr5bn-Sq97LZRxHRuzWO-OcbdgA4fw@mail.gmail.com>
 <20190621190421.GA679@localhost.localdomain>
In-Reply-To: <20190621190421.GA679@localhost.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 22 Jun 2019 16:58:25 +0100
Message-ID: <CAFEAcA-x_GSxiULrxvRj7dtCLM-r4YvRpwkVosW+1SutAUJMoA@mail.gmail.com>
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [RFC v2 PATCH] hw/arm/virt: makes virt a default
 machine type
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ju9mwB6IyIHP

On Fri, 21 Jun 2019 at 20:04, Cleber Rosa <crosa@redhat.com> wrote:
> The experience acquired here deserves the highest consideration, but I
> can't help myself to wonder if this isn't one of the (conceptual)
> reasons for parameters such as '-nodefaults'.  I know QEMU doesn't
> promise the same behavior across different targets, but that could
> improve considerably with very cheap actions.

Yeah, there are probably improvements we could make. The
usual constraints apply:
 * we don't want to break compatibility with existing used
   command lines in the wild
 * ideally, we should be consistent across target architectures
   and across machine types about how things work (this is
   an ideal we obviously don't live up to today in many places)
 * we don't want to back ourselves into awkward corners for
   the future (the qemu-system-arm default machine type was
   originally 'integratorcp' which no doubt made sense in 1998
   or whenever it was, but was nothing but confusing and the
   wrong choice for 99% of users by a decade or so later.
   x86 is kind of an outlier for having such longevity of "all
   hardware looks basically the same".)

> You can consider me biased (I do consider myself), but trying to wear
> the hat of a user first interacting with QEMU, I would expect a (any)
> reasonably capable environment that can represent the given target.
> That will probably be a different environment than the one I may need,
> and I think that's fine.

I'm really not sure what you're trying to suggest here; maybe
you could clarify? If you specify a target (ie a machine type),
you get that machine type. If you don't specify a target, then
we can't really guess what you were hoping to run and
magically pick something that works.

The main problem here is that users expect "all the world is a PC"
type behaviour, ie they can just provide qemu-system-arm or
qemu-system-aarch64 with no command line arguments except
a guest kernel (which is half the time something they found under
a rock or extracted from some firmware image) or a guest CDROM
image and have it boot, because that generally works for x86. It
doesn't and can't work for Arm, because of the much greater
diversity of machine types and the way that kernels are often
only compiled to work on a specific subset of machines.
Making the user specify a machine type means they do at least
get prompted that the world is more complicated than they
think it is and there are decisions that have to be made.

In any case even if we did default to "virt" the user still
has to specify a CPU type, may well also want to provide
a GIC version (gicv3 being better than the default v2),
likely more RAM than the very small default, they need to provide
all the virtio devices, and so on and so on. So giving
them one option they no longer need to specify doesn't
really make it any easier IMHO.

thanks
-- PMM
