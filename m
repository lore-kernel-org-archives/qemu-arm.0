Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp887328lfm;
        Wed, 8 Jul 2020 17:06:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmlssYxTVTRwU8sCgey24XafC0BXb7O2Fi9sq/x+ZKU+r0AcTHsqfrSv8jkYCGI14k3e22
X-Received: by 2002:a25:24d1:: with SMTP id k200mr98057144ybk.247.1594253211079;
        Wed, 08 Jul 2020 17:06:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594253211; cv=none;
        d=google.com; s=arc-20160816;
        b=rn4OYiTk/brKqqrNQYelK+C9o3EP+5vhx+EvjCtrfkb6P4t53t/1cRuh+kqUEFtyDQ
         PmIsrTJPwFKKR4Z9MT5HblxpyMMQ7oprUY8Pww2voGFH9ts+RkXia42NWpYXo8EGHxx0
         jSE4TZws/Swtg/idPvjsixp2VuoJ9lrL6g3bm8xJOdlsUmV3sWpoT6Ixc0k+PsqdOwK8
         UaXdotpmZoWwUy9gzQeca8qbJ2kkM9yYQkN6lGJ5DK8uAIXfWC0TaSDAfKZ5QlksKVLW
         3kWnaGwoP3uek8NNCWBd/yHuv4NPi1HizZWhz+a7w/HaynqhiE7fVcjjeUUlyBEG1uqb
         24Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0QjbGbfdZrC4ER9Op5TZkuMTIqOSXOzGsj5W0a7/Z28=;
        b=hZd38mPIYbnGS2xfhQg5Ca6gPUukW/SQ/ITe9501LlqZ2pCTGqmv/+uzmBVrwxjJyd
         sHQdZ1f6+OiYP1TD0oS9UtMOgzxu+wQ6z5e4RvZNQ/6nJ6xyk6o+5opEm6b2kPe+k6Bg
         ATYFrnlsKjnQOt7D+3drG1CDyXpUmf7LVy50wQvm7snnwd9L8kwSNraNnwULXP+MrUe7
         7wYvgOtLaCAkHDOe6gqh7bGXt2f57kHNPjMZUmnPD5y8t1J304OtjwhCk1K9EVK4qLlV
         d+MAm92lrLrL6frVhCvD7SZeZi/nhmq0Cx1E9L6bElYBmWVg9ytSolENcvCZ0+9O4b12
         AEVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=gM5jz38Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l70si872760ybl.382.2020.07.08.17.06.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 17:06:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=gM5jz38Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:50722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtK5S-0002V6-D5
	for alex.bennee@linaro.org; Wed, 08 Jul 2020 20:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jtK5K-0002UR-3n
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 20:06:42 -0400
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42]:40017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jtK5I-0005q3-LB
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 20:06:41 -0400
Received: by mail-vk1-xa42.google.com with SMTP id n137so45950vkf.7
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2020 17:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0QjbGbfdZrC4ER9Op5TZkuMTIqOSXOzGsj5W0a7/Z28=;
 b=gM5jz38ZhokgtSHk4gJ9CoFWqhE8Yryxdl/eXz6y+qXpmVJuVPgiaw6V0GMdPdyohj
 9rKup83NjrvQvlQEbk74BZHVMwHTbxVKgaH/s0cd+5ExSHws4fYgbwRoRHuiwVXIAwcb
 6se59hrOYyPbwe3sXL9iON1mg3jsEgA3YTmdNiMBy383N0MRTeYObfPgOHO4nDUAgEda
 wXvOstpgcH0dxJwPoPzYBTY6AkvJozkEk5mWRd8uM4Nc3VxbF0oI1i/C5Sn1hrcDllun
 lSxoTiY8HhxUSoDXIEumVBumS064WlBwx6gv/dmqvCdGu0JPg9eWZ1r8ifLAQr8kNlmU
 pZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0QjbGbfdZrC4ER9Op5TZkuMTIqOSXOzGsj5W0a7/Z28=;
 b=oIEKrKYbFXNJQHiTOO7abFy1Nvcad6XvpI+rEtqqZ2F20meq1/Uu7be+pIIFpJ0Onq
 htV1S/ma3ECIxF2aFhD9swPk75ZmZGI/QjaG+y7uENN4TVY3bQBBxwc9nFrogCQPgLxC
 +7XXmh83VSfUWcaerBGqzO6xemEztUY7XqTr4m/yNOLjr6FNI214v2F3Sct9sLA+gpR4
 0Lsw3WfPmGEO0X8zv9cjE8rO237ai/cKMeQoiIV8SJyW4PqFq9UJxW4yWIC5R0RB+f4I
 Yd0rqqoWjzJ52lJxJmJyVSGixsbyUdKx0LzqoEEXd/1H/o12S7o6Zj/iDMJ/zWG3zPpj
 9izQ==
X-Gm-Message-State: AOAM530JfrEjmwHOkJs3LhbQtMfpVayDSF+ebDBNULEJSIdMIW0RxByK
 WTQvaJld20Ya6jzdoEa8VUHbXPcRiF2QLZ861JJ5sw==
X-Received: by 2002:a05:6122:130b:: with SMTP id
 e11mr12160252vkp.20.1594253199000; 
 Wed, 08 Jul 2020 17:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200707184730.3047754-1-hskinnemoen@google.com>
 <20200707184730.3047754-6-hskinnemoen@google.com>
 <4b7130f2-032c-3067-b2b6-876a2b17b707@amsat.org>
 <CAFQmdRYi5QFHbcWQH-bWqAsSCidzYMedC8n+mib1DPpJuEy-Rw@mail.gmail.com>
In-Reply-To: <CAFQmdRYi5QFHbcWQH-bWqAsSCidzYMedC8n+mib1DPpJuEy-Rw@mail.gmail.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Wed, 8 Jul 2020 17:06:27 -0700
Message-ID: <CAFQmdRZdUKvmi_eKdtCnR8uP63sRP9X0Z7oxZES56mtSz_=7FA@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] hw/arm: Add NPCM730 and NPCM750 SoC models
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a42;
 envelope-from=hskinnemoen@google.com; helo=mail-vk1-xa42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vBV2peaiUa5J

On Wed, Jul 8, 2020 at 11:13 AM Havard Skinnemoen
<hskinnemoen@google.com> wrote:
> On Wed, Jul 8, 2020 at 10:31 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> > On 7/7/20 8:47 PM, Havard Skinnemoen wrote:
> > > +typedef struct NPCM7xxClass {
> > > +    DeviceClass         parent;
> >
> > Similar comment that elsewhere on this series, if NPCM7xxClass not used
> > outside of npcm7xx.c, keep it local.
>
> OK, will do.

Turns out it is used in npcm7xx_boards.c, so it has to stay where it is.

Havard
