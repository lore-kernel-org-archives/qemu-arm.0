Received: by 2002:a05:6214:acc:0:0:0:0 with SMTP id g12csp4901674qvi;
        Mon, 26 Jul 2021 12:50:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbJ5vJq9TYtu7zQrllw/WZ36amb3HqFedEFLurIicocSYyugPxbZ+Zc3sHfsnHvcZhjM1d
X-Received: by 2002:a05:6602:2801:: with SMTP id d1mr15984810ioe.73.1627329034901;
        Mon, 26 Jul 2021 12:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627329034; cv=none;
        d=google.com; s=arc-20160816;
        b=mK1sJ/CL5I+UPnB+4y8NG7NrtZnsodl1enNQqydNDMqjMkyf5uoojhIVmQWBWffB3C
         HNYiXqtA+iOP9XuYwlwLfUBzRhIxy4+/7d+h7kJNa3wHcnhSdV6rq3ioOQW8BtvCMpqv
         3zN4FF26jLy3pxOb7ZZRDxKW4brcOTyGP4PVCnTitNLS2++ck8ujfGsppvgpL8bsnnwD
         NDKw1ByJJPEwO+qmp/T2RXz8ot+CrCYiZ8X/rwN80xmXYd5A0I3EeNY+OLeHBfvjVlVz
         JldcKuSK1UDM1rskQXC8gqOwFcM0wRbXBvEJm9DagnaifWrd92VAAfC6tEbaYwAdFKj6
         uVIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/a70QBgbIE7hQypRWMRCRGdEit5b4RjdP6E1ZyGbBkg=;
        b=H9wJrjrv60OhHb7zzsp9qlPo/3reUVzi6b+ThLz8iYuAVKzDT9TpzIRFlcFmRCoa0u
         e6JK0QXvMeUhX7iN69bHbrbO3Xy8Uu0ay0ZJ8VFY+ZjN55jlywPCa9TgR7V470uygmUL
         PZOGmUOwALO3mPXYAvfJPxWrfwT540GcgKo3V2aM4G3ZsDS+16lsrReielB4GCIz7TEJ
         TEq0nlfAS4KeEAfKilxK2R5vanhiSnT4IfuzIxW9YFqhGywO8jTNz8X3rvlTptwHGz5u
         UtFFu+2xbNjrTe6tealpILHEmr3CDJbmxlsQRWbWaqTkOsQXiQ1OEcCfWWrgaFfgFMQn
         mTew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCcLMY3G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si769064ilq.105.2021.07.26.12.50.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jul 2021 12:50:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCcLMY3G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m86cU-0004aO-CL
	for alex.bennee@linaro.org; Mon, 26 Jul 2021 15:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m86KO-00078C-Gh
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 15:31:52 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m86KM-0007X7-Rv
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 15:31:52 -0400
Received: by mail-ej1-x635.google.com with SMTP id gs8so4690576ejc.13
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/a70QBgbIE7hQypRWMRCRGdEit5b4RjdP6E1ZyGbBkg=;
 b=pCcLMY3GUlaoIAVB7w0e1mQAQNpiQMFoDVSDuv93Gam6++hlTSQuaM+OsAs10q34Le
 2goYlsAeK2/Ngg87zTJgWQHeLHqAxXj1Db3nxXnSKTQTjzu8I7Bv1f5/oMiGxLK+fqGk
 M4hdG/ENvOkB9tLN1I3DH8U/4hOcb9yM3uA5qcYHROkxgLkZ6ysYW73I/wECYyg87GV8
 EJSMGmnw99Lvw3A9yEdtv0PzCyxZVj9FzOHApVZsRdoXgxEfrGyYpxkwtEMqL26pE7uH
 eJYaaCtmMZsXK/EGfPKKdKTlzGhdlLYEc+bcTeLh4FKBY54XkhN17d2s2jmvEiOXa6pc
 Yk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/a70QBgbIE7hQypRWMRCRGdEit5b4RjdP6E1ZyGbBkg=;
 b=dUvJ01OeCXazoc/a8uNotttgeKSSuveamq24mnPgQOu96ihLfFnNOn3x9KufveDyDZ
 JqEdVIuUKbirGJ5AovAfA/Ph7ubbd1Edhw5Y4glZOTFoO7UlOU+o6q+Vv6sfq+Bbszga
 1mFU2Q8qfi0yd9G1DDFXASTzkVuOiUaVCSOmP2SMiLwJ2qHmGcjfVqrN6uhD85SWV6H4
 IQepMbCw0vA41gd7M13bj7KFsQmdGQ3w6GpSN1uz9ucdhP/4iqRjHT9xrSYJ++a5EWkj
 cjKkOsc2zisbHmnO/T6aoUqyioCqBD+OPjEHXwEyy5oYLpmBJvh12WDuAoq2Sn8lbatr
 ZohA==
X-Gm-Message-State: AOAM533V6BlOYMiuyAeaxwnTmrYfadl0EHwdYjg+cw+fKR6/ME0QfyXS
 p5ax+XdVMK2naembq3vO8d09ruWDQmV0sylirAiKKw==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr18453360ejy.407.1627327909205; 
 Mon, 26 Jul 2021 12:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210723203344.968563-1-richard.henderson@linaro.org>
 <20210723203344.968563-4-richard.henderson@linaro.org>
 <20210726145951.g3ywwhcfstmsi7vi@gator>
 <df4f3bdc-5110-b321-e173-1a911b7e7c4b@linaro.org>
In-Reply-To: <df4f3bdc-5110-b321-e173-1a911b7e7c4b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 20:31:07 +0100
Message-ID: <CAFEAcA-rYcMEpLJ1fepDY+GmP7Jz-jxEtuuHWRM15XRB+Bfemg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target/arm: Add sve-default-vector-length cpu
 property
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nxgysi77d+A9

On Mon, 26 Jul 2021 at 19:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/26/21 4:59 AM, Andrew Jones wrote:
> >> +SVE User-mode Default Vector Length Property
> >> +--------------------------------------------
> >> +
> >> +For qemu-aarch64, the cpu property `sve-default-vector-length=N` is
> >> +defined to mirror the Linux kernel parameter file
> >> +`/proc/sys/abi/sve_default_vector_length`.  The default length, `N`,
> >> +is in units of bytes and must be between 16 and 8192.
> >
> > Hmm. If a user inputs anything greater than 256, then won't it get
> > silently reduced to 256?
>
> Yes.
>
> >> +If not specified, the default vector length is 64.
> >> +
> >> +If the default length is larger than the maximum vector length enabled
> >> +with `sve<N>` properties, the actual vector length will be reduced.
> >
> > Here it's pointed out that the default may be reduced, but it implies that
> > that only happens if an sve<N> property is also given. Won't users wonder
> > why they're only getting vectors that are 256 bytes large even when they
> > ask for more?
>
> I guess adding that 256 is the maximum length supported by qemu should be sufficient?

Could you either provide a fixup diff for me to fold into this patch
or else repost a new version? (I don't mind which; if it's just a
docs tweak fixup diff is probably simplest.)

thanks
-- PMM
