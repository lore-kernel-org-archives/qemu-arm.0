Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp253497lfb;
        Fri, 8 May 2020 08:32:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypKFBHojUyQIQxLf5pTC208EV+wLcZAtcduAciZ8XNDzpxNX6/lJGw1hnC6StUPjR8mrt6Jj
X-Received: by 2002:a05:620a:b19:: with SMTP id t25mr3164247qkg.428.1588951944573;
        Fri, 08 May 2020 08:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588951944; cv=none;
        d=google.com; s=arc-20160816;
        b=JmDeJm8k2DYDblyfELTcWCb1M1/0fV1ttnkCxP3x4CKTNjy9VbGCiduW1HP5Il/1Fl
         zEN27JZ6PuRzIzg4Dumq+2R84fbrHv+MW/wKHxlMAlwxxPoY1A4u/AJwDl6iZejR0Jj4
         PeWXZVQncLUsiYDcVk24Gt4+PY21qaJhwAstrTiqL+g8LwdyaaYyEYg+Rs7nPvRTCmLJ
         jpMb+SV39Fk0BbbozrUcGLg9fwRV+76sDQjFv8JH2ek7OFO46DiCgH2l1NHou9kIOXrz
         d63kogrfaV2g9QqraMPbc/pYS/qPUJyplZRG5Ma9+LCJn2eZoYsaXe50fAy+6+b+Ikke
         lPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1PQ1zQ4t+iMGhM0XL17e3vyoRaws04JFW++AeBDNqMA=;
        b=kDvwDZzFzgIHXcXfeE1hvMn2oTiM171imOwhCL2LRwoeX3KNN9bhrlBnh7WuiHlBst
         owJcvFYTT8uPItvzizJ2/3icYWqtePs6HFadGz/X5wL8/FgI/azhBsFkkatHTV3DrIMt
         NDkrs+zpUAaaY9k/U+sUm2zc7ibI3SWVXCD7ONdrBvA8Id54SPqrPFkltbYOAgFlztvO
         GEs9yhG7vrdEjhZ7a/g+wlLQXBHoUHzBJrItquRVaM9zN6f6zlRg0ciZ12Tul1Sa/FrV
         z74M0yKclG6ZPZ1GVZR49aZj/e45y1Xx+fos+lqej9NsbmCPVwbQBUdhukoSEpjgMsw1
         2INA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="oSgQhyu/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id q3si1322048qvu.196.2020.05.08.08.32.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 08:32:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="oSgQhyu/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jX4z9-0003gX-VW
	for alex.bennee@linaro.org; Fri, 08 May 2020 11:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <beata.michalska@linaro.org>)
 id 1jX4nx-0001dh-LU
 for qemu-arm@nongnu.org; Fri, 08 May 2020 11:20:49 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:42609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <beata.michalska@linaro.org>)
 id 1jX4nv-0004OM-UH
 for qemu-arm@nongnu.org; Fri, 08 May 2020 11:20:49 -0400
Received: by mail-il1-x141.google.com with SMTP id t12so1725624ile.9
 for <qemu-arm@nongnu.org>; Fri, 08 May 2020 08:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1PQ1zQ4t+iMGhM0XL17e3vyoRaws04JFW++AeBDNqMA=;
 b=oSgQhyu/QAnOpJuhTk9AOSr8lfLjk8RBSpy/OTg+dvC4swQut2oye5lJgspvl0y9Et
 99RnTdsZo3RSVDZafJqxzChG8YsqoboYEFXFMfZZ6jBnK5bzthYeFeaUR2fmwQhGbUgl
 N2PFjqODsalxHJ9e2D3Wd2yWUG1ZmAPp8VLruvEL9K+3wuOvodG3e7ZDbVHKcdZJv7T2
 xx1ESm4LLzs3wym64mfFcTmdH1PbsVjpG0T3AKpxnZB/Ompu8o9bkyydRQ7yhZET9k+H
 aUY5J0O88u4hKGurpuTTpFUN4HrNi3BWOw5s6auW1rejcPIZx0PkFbakG0I7GqftR66B
 JC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1PQ1zQ4t+iMGhM0XL17e3vyoRaws04JFW++AeBDNqMA=;
 b=PtvADKlSPDyYbEjEZXfpi20U62dyJwyMT/SyKUOTxQDVxEVqsXYIzwEwfETgwLcZnk
 qpAauTseky+vFzFCUcQDkSRIKzvLMv6EEdqbqLWGASW5IrWYIVPIG2AkSweVt7ovUyuS
 Ztk/6S+dJT7RoopkD3p6vBhhXmVsguGRENSEWwU9xGMuurbthSsE7cjYz9oEJghGmBnc
 m0tt7CWsFTqtskwClOYgHEHfb/2CFcqH7Z6rLVheQ2RhkyYZF4gKa6DH14K8kH8pkmJY
 nX/v5xyyTid7lmhYcqAso8CfjJD1w79nYsxDB5Ol6G2m0a9Gv1pXRgjPqKxdpDMnPnzI
 ozRQ==
X-Gm-Message-State: AGi0PubKZ1f28BUeAvHNUONVmYsUAK4Vvq0ObH8OHpWiOIq4edHq4zay
 ie0sm0b1j6tDWhoOpmD1o9ENaGnRMAkdRXcDBaMEqA==
X-Received: by 2002:a92:cb42:: with SMTP id f2mr3447717ilq.101.1588951246491; 
 Fri, 08 May 2020 08:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200508062456.23344-1-philmd@redhat.com>
 <9396e0cb-388a-e08e-c066-82a60708ecdc@redhat.com>
In-Reply-To: <9396e0cb-388a-e08e-c066-82a60708ecdc@redhat.com>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Fri, 8 May 2020 16:20:35 +0100
Message-ID: <CADSWDzvECqOXzusk=tj8r4z-E5CDZn4TNG8PJ5pxLHAn3saOzA@mail.gmail.com>
Subject: Re: [PATCH 0/4] memory: Add memory_region_msync() & make NVMe
 emulated device generic
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=beata.michalska@linaro.org; helo=mail-il1-x141.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kYmYbsjPaUZr

On Fri, 8 May 2020 at 07:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 08/05/20 08:24, Philippe Mathieu-Daud=C3=A9 wrote:
> > It is not clear if dccvap_writefn() really needs
> > memory_region_writeback() or could use memory_region_msync().
>
> Indeed, I don't understand the code and why it matters that
> mr->dirty_log_mask is nonzero.
>
> mr->dirty_log_mask tells if dirty tracking has been enabled, not if the
> page is dirty.  It would always be true during live migration and when
> running on TCG, but otherwise it would always be false.
>
> Beata, can you explain what you had in mind? :)
>
It has been a while ... , but the intention there was to skip the sync
if there is nothing to be synced in the first place - so for performance
reasons. I honestly do not recall why I went for the dirty_log_mask,
as that seems not  to be the right choice .

BR
Beata
> Paolo
>
