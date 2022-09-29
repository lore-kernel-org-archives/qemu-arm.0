Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1096957ocs;
        Thu, 29 Sep 2022 08:19:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7RclTG3UjtJGjSN2K/4eM0nUam4iDgTeGN/Z/l+8gv9hNMhMiwiCOPLMcrhTGFviFLQwZu
X-Received: by 2002:a05:6214:519a:b0:4af:a1ba:b0a9 with SMTP id kl26-20020a056214519a00b004afa1bab0a9mr2968942qvb.120.1664464799461;
        Thu, 29 Sep 2022 08:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664464799; cv=none;
        d=google.com; s=arc-20160816;
        b=lXHjK1EXJ4wdl+Puv32LK7a4OVYTA2UKeAcvhQGjqe8dFQo2UxasD5k5Ky8EWVVD+2
         AhgzqHj3p+vnjtVqaABqdl1PJX5ewJdBEmB4maBf4okdAirvdK/+fhEfOeRP3yI9ueV2
         x9FLeCr8LPfh0DExEjKXrTWZ3rcwGfwEbjJC3dqHUKrXyuwsbodnoNuPUTUGj5/fBYA1
         EAZ1wR4GdcNuFNe4GE2D+eFDqL9US7jSpqe28GMIlbAKF2WvbrX69Q2GKv8xe29Y7mX7
         3sdOVWPsujCW1+2dbhsGPWK9rV4NMFT4lgug8K3zSWpuQfWwYiQrEGaGsuoy0brISHHE
         9W9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=N7XE13CzfSxZ5+9x/Zgsr/vkcoQTN7ajb390wc2WvVk=;
        b=fxT+L6bDvU4wFMUYCqcgB/7ktP2xpDl8Hx+M5UT5zCqvYq9WBmanB+ZbdFryPD4RJw
         gkcyavuqf8xJHgMusnxYQtTF72BxKn03NaDWIHDKEnKg7VYk5vGOrl7Vn/DU+6aaurRA
         fk6cvrA7jZKIF9RJru1lVnlFbsVVwabu8AOaqHOCcivNHO+DWVBELkLTvIRxmmqHGtv2
         9ER0GykOI6UDihJEFccjU9GoL3Jj1AOv3Y4EIbs3mCngbCc8a2/q4XQl+LHO+9zDuHMc
         95jykgTEvGy10DTqFdNzAXy4acbTTcOEiAbUTuQnHJoA9mo9u3PYRuVgIwrC3cBYxZfH
         EDmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lABXWMxH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16-20020a05620a2a1000b006cf9086a341si1636863qkp.349.2022.09.29.08.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Sep 2022 08:19:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lABXWMxH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odvKP-000208-WB
	for alex.bennee@linaro.org; Thu, 29 Sep 2022 11:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odtWR-0000k3-SU
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:24:16 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odtWQ-0002gL-5R
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:24:15 -0400
Received: by mail-ed1-x535.google.com with SMTP id e18so1971711edj.3
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 06:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=N7XE13CzfSxZ5+9x/Zgsr/vkcoQTN7ajb390wc2WvVk=;
 b=lABXWMxHkZeVQTZQHBQWC4Igj5MjEfwVjWBYYLtDPxKgKJNybnRLF1FfcDECVyAXve
 N9wlN0DOzxhJDFOooYOLv6yz9kvdxAxC5SJo4InkqwypLpR+3JozV0ArEuR2AoZsuyJa
 vszXwYnqqgHyMAykKac2DbhOZOliL4GQftMMbmP3APBJC6x2/Bu7ZzM6hlzpzOQsOg6K
 wL2ojVHUg2QuEPYPcKlvhurqDzwfWk8mvk5Er68FQqQuIxdPdebALq5hxP09nkMaFMeF
 l96PXlz2UwLj57F5GdMQ5Eux++jnH/EFz4mEXznXODr8yEHoQ+eRyA3XPQpd6wF2voKf
 Jvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=N7XE13CzfSxZ5+9x/Zgsr/vkcoQTN7ajb390wc2WvVk=;
 b=P1hKpliox2mWKD4ClDPdPgorGQrhoYnSMeV3fvBOigKD68/r5+O/0sbJwioadSGAor
 trE7dyM7+g0lEwDVlzhY0QfRxqcARsFntON7aG0jzkTkKtLpCmRlv60DmgWhDCmMD7Ql
 OIj8fgotr1DP9m2QZ3DGg4dJzzgV6jCZlygpRAwrJpINN695tNK47dMfcJfE7/7YUDGM
 lB86K1HOvDAGpVkCkO0Ri7KNoHJlc19/FNyZOBc9wHQuPBrrWOcfGTv8N0SkpR9YFlQX
 H2iWG3/6hT0q9ifo/OWhReqf0xp8OeVZIkgAKxYgYzD83uWbPHX1/xKjDoSoz2Hsj3ZE
 RSCg==
X-Gm-Message-State: ACrzQf2YvOJBqylLh3dnG+kRpImB9sZVWw2QQfzyK325OVnF3juecXYQ
 orWEMe43G8gdR4tekp0PCVayOUVizKly5y5mN0Ar/Q==
X-Received: by 2002:aa7:c610:0:b0:44e:9a0f:753a with SMTP id
 h16-20020aa7c610000000b0044e9a0f753amr3322734edq.140.1664457852607; Thu, 29
 Sep 2022 06:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <YyyxrNp+5XrmLi1Y@fedora> <Yy1gB1KB3YSIUcoC@redhat.com>
 <CAJSP0QUjT5nuiNnw-1AK4es3xjL57a5ZqopQ6YcqLkyYbtENDg@mail.gmail.com>
 <9535cb0b-8684-c189-6779-971882b9bd62@redhat.com>
In-Reply-To: <9535cb0b-8684-c189-6779-971882b9bd62@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2022 14:24:01 +0100
Message-ID: <CAFEAcA9iEMBxUBhpHWd8AAD6VDG-fbg_t_fX1pVCPj=0sSSNjg@mail.gmail.com>
Subject: Re: Inscrutable CI jobs (avocado & Travis s390 check-tcg)
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h9Ozg7yloT9/

On Thu, 29 Sept 2022 at 14:16, Thomas Huth <thuth@redhat.com> wrote:
>
> On 29/09/2022 15.01, Stefan Hajnoczi wrote:
> > I still don't know what the failures from the Avocado tests are:
> > https://gitlab.com/qemu-project/qemu/-/jobs/3100466535
> > https://gitlab.com/qemu-project/qemu/-/jobs/3100466546
> > https://gitlab.com/qemu-project/qemu/-/jobs/3100466539
> > https://gitlab.com/qemu-project/qemu/-/jobs/3100466548
> > https://gitlab.com/qemu-project/qemu/-/jobs/3100466537
> >
> > There are lots of logs and I don't know what to look for.
> >
> > Any ideas?
>
> These are likely the ones I reported here:
>
> https://lists.nongnu.org/archive/html/qemu-arm/2022-09/msg00234.html
>
> Should be fixed by Peter's patches here:
>
> https://lore.kernel.org/qemu-devel/20220923123412.1214041-1-peter.maydell@linaro.org/T/

Incidentally, the reason that regression slipped through (which
was my fault) is because I also find Avocado failures
inscrutable -- I do run 'make check-avocado' but I tend to
assume that random timeouts and so on are just flaky tests
rather than actual problems.

In particular in this case QEMU printed an error message
and exited, but the Avocado framework completely failed
to notice this or bring it to anybody's attention -- it
just ends up timing out, which makes the problem much much
less obvious.

-- PMM
