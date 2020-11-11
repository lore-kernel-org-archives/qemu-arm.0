Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp560211lfb;
        Wed, 11 Nov 2020 08:28:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMR2INdJFvVaRGngr70vkbBu+yhS8SEVUggwozhm87IOlZO10rIKdLxKI70gIhetfh+II3
X-Received: by 2002:a25:7453:: with SMTP id p80mr17600598ybc.31.1605112098176;
        Wed, 11 Nov 2020 08:28:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605112098; cv=none;
        d=google.com; s=arc-20160816;
        b=qxGfAfcmU5wd7z5VE8A7tsZW14Nqp/gLyE2wkJIX90e9FClRcWpWc8rkMoBo1OsQxr
         cM/DubbPAOfd5yg3hH0MGORWWOckONrNYpqG5h59xC1jN27SOoPBlqd07MQJxEDZbuRN
         NsD/KYv61K+a4oZqB2u2NGu68v4rsgXUu+hwo+HPBMDIajMDLM90dXv20OYorUroTAfP
         SI8cRCmNQ0yIhYLu7GJQX2Rm4RHVOXND0IFEolJ5aZlM9O+9JnikfTUwQeDB2iJ+5dpI
         aF8BnlpPeSoFiXUx6IEGysYjmkv7b8oHFprP+dNlJ39DsgVG+bPnM589VMs1XYqHCLnf
         cxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XXdJYMfM44xRP9NFNPlUK6ahc2qQUbcJg1UILLNLaWE=;
        b=XtIgxAtriNNYBwAy/AtngVX3kAjjoaC13dBQqnSVpvGlM4YrwmOB39ajObldaa7g3m
         NhJydGPSuYiyE+4vP3oiMJmE4QTI/ZOOSMa55+/NMPBrY6/T9tQtZqqNNOmTlTRUwfmu
         n7b5pM0L6hw92R9Zo1lxVgpevmaMqrr02S2mpUmIj+ObWBT7hXT7tDGtOVl+8pCyYQYe
         kjUyXdGSh3U0O2jkisRkWaMW//xAwXbqR3XIcSCWaQhlOt+JvfXeU9Gi9J+DPMpWfuxR
         3j0QAzWrRgU5Zl4n9+AB0jGblv3HSqmVK50IMopD55iSA9dCSGibcxamSLgNtsVLpWIX
         wlkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j/thcT37";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t39si2538253ybi.74.2020.11.11.08.28.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 08:28:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j/thcT37";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcsyn-0002No-G9
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 11:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcsyJ-0002N3-6m
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 11:27:50 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:47075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcsyF-0002nH-Gc
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 11:27:46 -0500
Received: by mail-ej1-x633.google.com with SMTP id w13so3520915eju.13
 for <qemu-arm@nongnu.org>; Wed, 11 Nov 2020 08:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XXdJYMfM44xRP9NFNPlUK6ahc2qQUbcJg1UILLNLaWE=;
 b=j/thcT37pwtqV+ucEQTpc1HngbBwLCGrn22Y/t38RzH5p0i/jLbCSpC3H4KpnB6dIM
 bxRWbyp2Cq0lUXqOsfrGbh5n5Li7a8niG4G37Fxa1BK0Z2vUpaXRuMfrY7bKENB3Va8j
 HPShzyrAcNKkXLZbKNuAQnjUTPBvYiWN/3/tdiE/J38Whpq5rHy5PqKlVslI/d+K9k12
 u4G8Iie+0KsUTviqxlLnrLXMnvbb0umOb4TudEtMW4T+jNUOYawuBMMY3nFWfJi2iMrs
 pELFNvNypyACdALuQBOTMmHKPZgExiy5bprC7Nva90jR6TerddqOLv0j5sYvGfrjq9uU
 0ZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XXdJYMfM44xRP9NFNPlUK6ahc2qQUbcJg1UILLNLaWE=;
 b=VoM1KvNNJfZ4iAuFhbjmWy1xwd8IQrpXqTTULEJ7GDFuojevgb+AbLHMjEhQp9eC9H
 cMQpSZ7OtRsWHuBSeOm0UxrlqW58Zi7+uP82JzrYefxlgDtIufEAC/r5Q1HZ1ePpDsrk
 VMgnnNYp1APWlnHFEQ+9n3Ncs/YMfiJ/w8e4SE6rn6WAmfgeNWPKI0d/W4tIQ8u/KyNr
 NhGNxur0LxXyiO+kNJy989OlKEs8ro3z0TQ+UQbJMTjph3mLzl4XEy10n4BCWDwBgf/t
 HwGR0A+7mDsRgAV8f6Vk/GTDc8/ifhfMmsh/yM6ln/nmgkn2Sh+oHY8p+1kNthx1iN2w
 kJyA==
X-Gm-Message-State: AOAM530IRv/Ha9tX4RegSURrOXieWKIv8xi53AC+pCXPETgPY6NLwSYE
 s7vA2IJDj0l5ddGzSWeRB54JFeBRNtucdxgdKcWIZQ==
X-Received: by 2002:a17:906:6949:: with SMTP id
 c9mr25921592ejs.482.1605112061387; 
 Wed, 11 Nov 2020 08:27:41 -0800 (PST)
MIME-Version: 1.0
References: <CAB+VpJkthrifUseJdx667T_UL=579ySZ=v6+aW8bWYBcsg08Wg@mail.gmail.com>
 <CAFEAcA_RCZfCjk2_KQ=_9fhz1O6A6Ev+GNAOTmGThnAHBaxs5w@mail.gmail.com>
 <CAB+VpJkQR0kd1MY8jnv+oCVKzGq1MJR15ed1tG-MO2-d3R41Vg@mail.gmail.com>
In-Reply-To: <CAB+VpJkQR0kd1MY8jnv+oCVKzGq1MJR15ed1tG-MO2-d3R41Vg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 16:27:30 +0000
Message-ID: <CAFEAcA_p8_WfVYtxAiDJS2P2Y622Xcb-k01AJzkqtBy776Co0g@mail.gmail.com>
Subject: Re: Error while configuring Qemu
To: Rajan Singh <rbsingh1983@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LDfvmWlMi5YY

On Wed, 11 Nov 2020 at 16:06, Rajan Singh <rbsingh1983@gmail.com> wrote:
>
> Hi Peter,
> Thanks for the information.It helped me.
> Now I am getting an error regarding meson.Could help to fix this .
> Here is the screenshot of the error-

Please quote error messages by cutting and pasting their text,
not by taking screen shots.

The error message from the build seems clear enough to me:
it could not find the pixman-1 dependency, so you need to
install it. The wiki provides some information on installing
dependencies on Linux hosts:
https://wiki.qemu.org/Hosts/Linux#Building_QEMU_for_Linux

I see also that you appear to be using Ubuntu 16.04.
This is a version that is older than any Ubuntu which
QEMU currently supports. QEMU may still build OK, or on
the other hand you may find that configure complains that
it requires a newer version of some dependency than is
available in the Ubuntu 16.04 packages. (You can in theory
build such missing dependencies locally yourself but it's
probably easier to just upgrade to a newer Ubuntu.)

(QEMU's distro support policy is documented here:
https://www.qemu.org/docs/master/system/build-platforms.html
For distros like Ubuntu with a 'long-lifetime' type release
(like LTS), we support the most recent major version, and
the previous major version up until 2 years after the next
major version was released. So we support 20.04 LTS (the
most recent) and also will support 18.04 LTS until at least
April 2022 (since 20.04 was released in April 2020), but
anything older than that is not officially supported and
may or may not work.)

thanks
-- PMM
