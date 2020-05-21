Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1717959lfb;
        Thu, 21 May 2020 09:21:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvqKLFylv3RfjvxjQ+czlyGcQxGdm7SeiLhJiYaSZLmTPrySQeTfXnBwYePV68WHvFxuxB
X-Received: by 2002:ac8:361b:: with SMTP id m27mr11515089qtb.60.1590078065899;
        Thu, 21 May 2020 09:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590078065; cv=none;
        d=google.com; s=arc-20160816;
        b=y5J8WEVm2aPmOVFora4ySCKa91/GIy7vim+ZUyxyTKhCDfghK/LYASNT5As/i6LHKq
         iWMsLL6rLJrPjBIwp7E1yopq+pFrSgFNn/s3Mx2v/52QQtg3+PBnrenf5VLF+HNFZrZv
         W0QgtL0FcLitXD6QDHseBdfm1eqZTGSx/2mKux+MpQeaOT9JbKZQbcKaTd7A7HfHFOBT
         sJV5Jdlg/Obu+0sd85Ktb2E/7brfLuVoRf15Q8mYzOm/8V3RR/q+U7PfvV/rZS+ydLFq
         PzcKU+3z847oSwlTVidKudvnS0K9gBf3fn6GMNYUnY3BmU0vcWVYU5eH8siHGmUQLKiS
         /Vww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oKnMYKMXeLm/ukNnG5YEfp69hLPR73f0H1hgSgz5CUw=;
        b=dJ+HvD903/3noTVfGUXef66GdrbHYtFUh5Ej3qdrFr5fYMFdM0j/Q9l2KSGABpnKzr
         NsULVto/UVYCf+XROLWrXf5c07odnrGrNmdbAXK53ip/p+hsuBOe12slUmcpxCovJ/3j
         HMph98vj4wAPb+0HsWRJnHVLsnmdYOJxXsQSVmof2cFopYIS8XuQzGrGN6g5m9bt/3ri
         rL+AT/nnxc6AoGl/FfMntwSZTMgRfWVyaCeVI/04sD8sGHLdylIanOew/dKO5ObDGL1Q
         TeOHgPD8NL+TFWDi/vodgGrPxPYnoz0NHGzZkuWw09mxbmQu8gi+iJISFWNUqqcKkf1A
         xadQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OHCCsaL8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si3539664qto.282.2020.05.21.09.21.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 09:21:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OHCCsaL8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbnwP-0005mz-Au
	for alex.bennee@linaro.org; Thu, 21 May 2020 12:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbnvv-0005mS-Bo
 for qemu-arm@nongnu.org; Thu, 21 May 2020 12:20:36 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbnvu-0001d8-JX
 for qemu-arm@nongnu.org; Thu, 21 May 2020 12:20:35 -0400
Received: by mail-ot1-x342.google.com with SMTP id d7so5936559ote.6
 for <qemu-arm@nongnu.org>; Thu, 21 May 2020 09:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oKnMYKMXeLm/ukNnG5YEfp69hLPR73f0H1hgSgz5CUw=;
 b=OHCCsaL8DjcziR9fu6mwyytp5QcO5ArGa5yUwBs4H2LZmcpaM0yZx1aVPM2ngUbVLV
 juqvSwrSTopRymW4kCFLEmHGjUVHWUiH61kNkIYMFbHmje0Ij0rSSniPPQsOjKS/qw5H
 3e+aU3a9xK6sTUbW4b/Jd0jLhka/63uUeankXLmI7VDaqzqu7RQa8N7eDcoHK2UgKk+9
 1Ge165iZRUALn1WB1kR2sDTeRpWrFvg9wuHCHYejBuW9TGN3PJAGp+91Fwab9OSTk8Li
 a4Rf3Cl3FwLu7ra0dNhK4Uu2L6KoqrP2X3hfsT5Br2pWBZglNftIdne0Ld7Uh1l2DxEp
 7lPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oKnMYKMXeLm/ukNnG5YEfp69hLPR73f0H1hgSgz5CUw=;
 b=uLOKmXn/QmiNMnsWCQGDtpYyrZCzW4IPP6LKSzOO29dYZ2vxyMOU7tpZg/sa4uuhqF
 Nqny0L8HLfeNhH43Zj/t8zI7IsLTyILlIVpxt8fJz2AUt1K+vhKz7t5wGrOea0sPuhRs
 t87KNSoEs9zCgXhVagid3pWYZpNYO9Uh+kruq9i6pKK22ySNnLOJb+zNfT5kSSk7wwFM
 mxFTkomQmuU+F9KF+KE7R+ihHGXXR0Ocsc+x7pq0vVeMHn0AXJ2k3w++kevvui1PmGTY
 ben+JLPGtzEoQPH4TLdT3ozY2W4T5E0/3QdziljfadPMrohNN3zxOkavRNUQEhuleWev
 +USw==
X-Gm-Message-State: AOAM531iO5FeYFxJZOLTgr8nW8FYlQ/jm/JQlh/dq/AuxbuZlL9O0o2e
 DoT3eG/0dyapOSv2ljkg9h7rKHFbzhARBiIfHHxswg==
X-Received: by 2002:a9d:b82:: with SMTP id 2mr7276227oth.221.1590078033295;
 Thu, 21 May 2020 09:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-4-armbru@redhat.com>
In-Reply-To: <20200518050408.4579-4-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2020 17:20:22 +0100
Message-ID: <CAFEAcA89weeb76p6-kW8PYxMpYi+8H53AT2c6FWQwSCqSGnuqA@mail.gmail.com>
Subject: Re: [PATCH 03/24] sd/pxa2xx_mmci: Fix to realize "pxa2xx-mmci" device
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f665xDGL6YDU

On Mon, 18 May 2020 at 06:04, Markus Armbruster <armbru@redhat.com> wrote:
>
> pxa2xx_mmci_init() creates a "pxa2xx-mmci" device, but neglects to
> realize it.  Affects machines akita, borzoi, connex, mainstone, spitz,
> terrier, tosa, verdex, and z2.
>
> I wonder how this ever worked.  If the "device becomes real only on
> realize" thing actually works, then we've always been missing the
> device, yet nobody noticed.

It works by accident: because the device in question happens
to not have a realize method, nothing breaks if we forget
to run the realize method. Undefined behaviour: we happened
to get lucky in this case.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
