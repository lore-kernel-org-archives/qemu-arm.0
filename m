Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1434319lfy;
        Thu, 6 Aug 2020 02:18:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6USXu1EMVEzH3wRumzoIuZDJ/TECLJEuV8P4OkEUWEjqvSfpYkyldWGNH1IjJDshohB/x
X-Received: by 2002:a25:782:: with SMTP id 124mr11756250ybh.280.1596705491863;
        Thu, 06 Aug 2020 02:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596705491; cv=none;
        d=google.com; s=arc-20160816;
        b=Ct9WJyxdSiTcMWP255myZY39KX3pf0FKuC5fiQGOJqz+1VCbO/AMsbsz4obegTO3+0
         WdDn0fHmmcqzTtPEZ+j82z0B6FFGunR69MkZp60yLVyz/8rlyksrqIsgPWr2EOio50aY
         gW+DNyLe1WnTLdnL/3nmhtblznGMGN4mxt+YxY0nkkQtGrvGYA8LdwqoXLuV+zdvccuw
         GxOUcLr9REY6t8wg6DkNxAM78VySNMLGnyWPpagzu8FmY1ygIcfY+kAcrOzeM9WOZ5AD
         grliHMSJ91NUQkbs6aXKhIVxpoE9LLkq0cq4UI0cAEzNkEW/49KgszJjJsCgyNEVE+CP
         6xxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DxTvDL4aYr6D+jUsHru3iFLI0rDaYdAdjro4hzMumMI=;
        b=Dl++SVML1ynVlQIb2kHMZDcv29RdCDxmoJ3PkV1XkRRAFrx/8CaRhz0gdxt/MQY8hA
         veiZ5569+m2RuWjVWvzFqss4fms+dT6YSB8TPECEIzQwV3T3f6cYwSwBNlqOcsohnjNy
         eR0z3OZuswoNUdDHsLtexVNHRCIfA1Tmq0sapOkePoOytmzZ1LmDSQDitHJYJi/GcWe0
         idyxgDxOYkyd/UYEkdeCJ+pjGjrzBrb/ungPtfKDvr7PKn6Bfi653DnoPDy6ihLwvBQ2
         QkGESFufHbYz/La6T0LbiTXjcXE5v7ts60DiDtQgWyA+Ji72rVMbCXP7s706BLctDu9W
         KJEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B7PaQlgE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12si3992316ybk.64.2020.08.06.02.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 02:18:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B7PaQlgE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3c2N-00076W-9X
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 05:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3c2F-00074Q-Am
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 05:18:03 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:39382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3c2C-0005Hk-Gs
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 05:18:03 -0400
Received: by mail-oi1-x244.google.com with SMTP id a24so21736691oia.6
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2020 02:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DxTvDL4aYr6D+jUsHru3iFLI0rDaYdAdjro4hzMumMI=;
 b=B7PaQlgEmTjVw+R+tSAGSQA6WSKPWuIZVdeSqrTTuZRTszE1qHwwJZEzosW1Wo2qtn
 PQLBO/PMSRQ7nJosivTrxuJkiULmwTmImV/CDQ2ag7cSLhYE/UC8uUw+hfyw0KF7Va5q
 pIn1gt5pHu7vdhlvtZFnHkX3Y4eaLMIRtLKqDhzTdSjNdiWCq/PJw3R8JxcxILA8U2gy
 SHWbBPOZvndMbQURuWp6l/twtf1LLJAsf0arBrOhmf0+DLgNoXvxF1lEMnOxBhqboTHh
 JECWv6RGCBgGgZFzaE9LapH1O+yDL7YWWhs38dcnrvgqfuc3OWUD8hy7M6aDE32gJCKo
 Homw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DxTvDL4aYr6D+jUsHru3iFLI0rDaYdAdjro4hzMumMI=;
 b=TqurgnRWg20DJPugbH4VXzW3RxSkfeUGv8qKe02U30u7qN8NkuATDi8U4AjHNHGQ9e
 SZQ2GlURat4xHLZffOGFQg9A/g7TrOK1jXf8L9HLFfRTWblMZW19MRO4tv9mG6KeWwFx
 kl/zo9VssrtUr6vlDhSgac8wpAKnH45iy4V+7ibDot/HenCV7u9boLj1V5UR6MbuPKTW
 NJojUDAYyL3Gpo3ZYsAQiI969bvJXT017xZRAJYaWqTh4wopp8rtwAVr5zdmZp6fYb5U
 hT9MJ7U0wMbck/9gxSHlpwqChUn3/hr6N+3fcEnBc4K8pmo4ene6yCp1ddkyudnOdmIC
 q9fg==
X-Gm-Message-State: AOAM531FwtRhPFQuj1+MBKJ9PHGdPxurW6sECKVA2/xIKIWa3RaplQwR
 0X8GZYVbBT5v2OgPLeEgdjwV+cDJo+wLyRjZNKJnjQ==
X-Received: by 2002:aca:50c4:: with SMTP id e187mr5875121oib.146.1596705478947; 
 Thu, 06 Aug 2020 02:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
 <878sf3uojf.fsf@morokweng.localdomain>
 <20200730005947.GO84173@umbus.fritz.box>
 <CAAdtpL5Mtaf7Xwu74U33eGTCAiFZNNXeCST8COwQeW8S9j8ZVQ@mail.gmail.com>
 <87a6zh3uyv.fsf@morokweng.localdomain> <874kph58o5.fsf@morokweng.localdomain>
 <CAFEAcA-Yi754zyxHd+bggjny5vXw=rrs5fm6SZCcxwVUeoTtOg@mail.gmail.com>
 <20200806051355.GA157233@yekko.fritz.box>
In-Reply-To: <20200806051355.GA157233@yekko.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Aug 2020 10:17:47 +0100
Message-ID: <CAFEAcA8fg8b-Z_fd9mK6QPurNhQYNGMhRc_r9RizYndrFC2DMA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Generalize start-powered-off property from ARM
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ViGZFT7BYgBE

On Thu, 6 Aug 2020 at 06:53, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Wed, Aug 05, 2020 at 08:04:11PM +0100, Peter Maydell wrote:
> > On Wed, 5 Aug 2020 at 18:01, Thiago Jung Bauermann
> > <bauerman@linux.ibm.com> wrote:
> > > Any news on this? Is there something I should be doing? I saw -rc3 today
> > > but not these patches.
> >
> > Sorry, you've missed the bus for 5.1 at this point. I'd assumed
> > that the relevant bits of the patchset would go into a PPC pullreq
> > if it was important for 5.1.
>
> Ah, bother.  Meanwhile I assumed that since it was cross-target it was
> going in separately, so I didn't take it through my tree.

This kind of confusion is why it's a good idea to list "this ought
to be fixed for the release" issues on the Planning wiki page. That
way I will see them when I'm looking for patches that might have
been forgotten or that I need to wait for a pullreq for before tagging...

-- PMM
