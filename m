Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp251949lfb;
        Wed, 11 Nov 2020 01:44:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8jYhXUq6+AACEVR/ot93vDW3P34fNOUgpQnZhGM5iIU4Q18b4VDiPM6Kc3FZuqA8+jjMT
X-Received: by 2002:a25:905:: with SMTP id 5mr1101912ybj.44.1605087883277;
        Wed, 11 Nov 2020 01:44:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605087883; cv=none;
        d=google.com; s=arc-20160816;
        b=E8XnUkUO2u+y3h4AwfQNX1McAzFAXjt362R8ednssAr5MH/JgHqgQheF772HuNCrmX
         6wwhH7uteCnYiRFnHFiUtOtn0Tfekz1RCO0VLKwZIf3V/G2NLs5nF5cdmhDQy6e6nbkW
         47nM9zGX/aftx7XZt+4PuOhTCtTEGcf4wnpWrSowTyReJV8SYpsLrryf/5B+GUW03/S3
         FCLyQKPWVxW180U7qm+1YpaYAAg6AMkXl5qCpoxFp2zgDmNL67LQsSqOkXsLMF8qXMB/
         Yx3jbANv5IJX/YU+zNb0MnZNsIEbmb7xWU8HmmffOEdLzHNH4wBMjVfQp/bCLRJBEeNT
         QP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TDnsUpOqKGSNVj5mjA8xZ9XQCcQJBMjH7XUlaWfozMc=;
        b=ThrWk938ZP7gZL7roBrw7C0aAlG2FpT0eP4M5AEqaZIoR8nefp3bTA3eChpuRuRcft
         sRnN1pytKXp0lYHmgqPUMvUJD9UK+MNQrsCt7UpNBaDR38x0Grb/+ZQkE31IE2/+OFZ9
         FJk0eSVv6h5CQ3wvug8mUn0PlYiRTS+7TIxaHtabXK19lsP4xQqHI2b2i38/CU5+TOuw
         +ZALSCmnnLoPvTv2oA+45ahz0dgaeDe+XBDp174FsSjRyEm6f6zfqeEOvz1Mv8jP6Ku2
         WzU7gp+7cfyujcUOAY52CCPhtpWfeWqgcKeQqNvdOkJ0nSs94/0R4sG6pW3me3cUpm3Q
         apvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WcjO9wWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si1892599ybp.153.2020.11.11.01.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 01:44:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WcjO9wWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcmgE-0001Z1-N9
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 04:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcmg1-0001Wv-Lv
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 04:44:29 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcmfz-0005ig-LR
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 04:44:29 -0500
Received: by mail-ed1-x52c.google.com with SMTP id e18so1597995edy.6
 for <qemu-arm@nongnu.org>; Wed, 11 Nov 2020 01:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TDnsUpOqKGSNVj5mjA8xZ9XQCcQJBMjH7XUlaWfozMc=;
 b=WcjO9wWcJ4RICZSi78ixMq/+yCOiJesZfe7A8+EjldtK+qMMWxVQskPn2Hf9YU+nzC
 XSNJF5Hf5KsK0Bbi8I0CFaA+GAsw0f7jTFl3MWtFDgiLk4k+MIf+Sctb8SvMg+mbAcQH
 Gax5YY1XWenr7omIhzO8biEmsy6iZo+3CbZolrMyZAZfIKeeDip79Wr7wy52IFREd3H1
 CcYAWqS/M1XzmVqJTuW3LhioCx8yZLpjdK0s6LItuBYdf6DZCtwm/kZV5wQFc0K8YSTY
 eKXS+pZMGXwW4uIMbvpAiJdPfKcsEc7+4wuKZzI5I9gfxlBySy3ytaskRrtyeKF8NcKZ
 UgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TDnsUpOqKGSNVj5mjA8xZ9XQCcQJBMjH7XUlaWfozMc=;
 b=VcRvv/P83W0E6k4DOEjIMiI0TqpQ/0FWTEn1dO76SwmZpBQaVfwblyOiVLf9YCnIB7
 DAvqJpzV3WuTx9Dn6/Fy3mcKIjggO68OiMpF/nljtQunkLYFua0W4ZTCU1Q3+BYRXbmP
 ibTGYNSqJ/iO/PfL+Tz6FYtINEXsM7BPuO2YeMr3YSiy/KwUAsoN08Z+lq0EUFvXDjj/
 yfGZm+S8GsFm2+5T5LMSwgWEminMPRn9P7zYUlo6QrinD+yOMoqojxsUHoa3dfE93D76
 i3IwisA2PmfaufUgsUGQYlfVeZvl1PJSpd0IochU388XPrIsETUR1q8l1XkIvfCvJlGD
 nazw==
X-Gm-Message-State: AOAM530ZPwxJhkXqVBMpXwlRKZ1xRzk1YQ+4oSeVc9q9Z/76uW1biNOu
 IeOm6ViFupx4sj+ekQBVlf+QGw7/yNKjNpG6Pp5cNw==
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr4186612edb.52.1605087865978; 
 Wed, 11 Nov 2020 01:44:25 -0800 (PST)
MIME-Version: 1.0
References: <CAB+VpJkthrifUseJdx667T_UL=579ySZ=v6+aW8bWYBcsg08Wg@mail.gmail.com>
In-Reply-To: <CAB+VpJkthrifUseJdx667T_UL=579ySZ=v6+aW8bWYBcsg08Wg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 09:44:14 +0000
Message-ID: <CAFEAcA_RCZfCjk2_KQ=_9fhz1O6A6Ev+GNAOTmGThnAHBaxs5w@mail.gmail.com>
Subject: Re: Error while configuring Qemu
To: Rajan Singh <rbsingh1983@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: CW0VJx4yl0wh

On Wed, 11 Nov 2020 at 01:11, Rajan Singh <rbsingh1983@gmail.com> wrote:
>
> Hello,
> I am using Ubuntu16.4
> When I am trying to configure Quemu by below command-
> ./configure --target-list=arm-softmmu,arm-linux-user --disable-vnc --enable-sdl --prefix=$PWD/sysroot
>
> Then I am getting this error-
> Using './build' as the directory for build output
>
> ERROR: Cannot find Ninja
>
> Could you please help me how I can fix this issue.

You need to install Ninja. See the release notes:
https://wiki.qemu.org/ChangeLog/5.2#Build_Dependencies

You should also read the "Build Information" part a little
further up that summarises some other changes here.

thanks
-- PMM
