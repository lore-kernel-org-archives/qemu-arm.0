Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4065725lfm;
        Tue, 30 Jun 2020 08:33:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6exzrboF+MTtBIJ7u8OblE/IFUyW7mblRA6OOUUTc20wF0vpLMY82oBKuz5eO5Xbkfp9+
X-Received: by 2002:a25:ce46:: with SMTP id x67mr33398756ybe.124.1593531181527;
        Tue, 30 Jun 2020 08:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593531181; cv=none;
        d=google.com; s=arc-20160816;
        b=ORUMYky8Tn9vDDMwiU26qsU2Ot8YMEB0CHemJ/UofWT0kcZMg/M0SGzGUI8LkpMlEU
         ptfct29YgrZCUI/MNCsgIxIXXf4bpnp8z7szvHTOjEwClKADaDKnjfV/a7mfk9nFNZ/u
         XXl/FfgmNqxuGvHOpF4mltPjv+l7rvh85XGa0StMeFW2VTKeQFCfLRXaARf297zcGY2Q
         eJDhpdEjni4ljqCQkTLqwCKeC4CHd3vMAWkuZZUNNL+pBvp/LIIX2NQ1j5pVIPxjqipS
         qW3rp/c9cKpMcFTm8+9xj27InPqpX+xl21wvm2+MyHuf8AEy8lDRPcnAcLFZzy8EK9vd
         SumA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gtsu4DiQ6NkNadeQUTLOsZxIVl78KlWuuU4+dlvfX00=;
        b=nT4M1C2H92MaCUmX/QAIwkk7T5i4zqvcZAnzaf21bamukTLwXmz6WvsUt/L2ynU9KP
         qBtWgh473oaXNLdxNH317vcdEKJGiqcqHBAZJDTf8a8Y5s/uq6WMCKQ4I4mtfOkm5BIY
         L1hZDPhDzyIZoMmJ4zhjZIXSZpQsAhM+kzhlPb6ACEpReV61QjJcflA++JBGtaJ9CtHz
         Lgop4hJTlKnQLkQiDYxm1BC8qjrhI9RMAdKlzCFyjeMfpVobJv5jmavPRqjsvy8JjFsg
         QB5PeCwGO6gbjWIMTboCdF2RqXIhaz1l5ME2w2tc8R/nE34JbLmM2vXWBoNo7QNNKapZ
         G6XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SlnygmSH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c198si2684002ybf.293.2020.06.30.08.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 08:33:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SlnygmSH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqIFo-0002SO-V2
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 11:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1jqIFY-0002SD-JX
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 11:32:45 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:35453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1jqIFV-00029C-Hm
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 11:32:44 -0400
Received: by mail-ot1-x32b.google.com with SMTP id d4so18746613otk.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2020 08:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gtsu4DiQ6NkNadeQUTLOsZxIVl78KlWuuU4+dlvfX00=;
 b=SlnygmSHaPNqnmvSCdoeXJGgcNqqibns6JhXQfsq2qZk98xpwL046vagHjtV20l78N
 S1g948vBv+qV9iZiOLhw9K8P4NIrYc3raRn0Nar8i0eb6biNeJ+NLHdhv5AxjW5bjNoU
 wYTwaE3JCMpXbtUcvaQlEx87UsoEJb4cf5Ej+cartgkUWVJjfFmSpSROdZSIsfiXtAaN
 tXTRfxjZQ5dPN+tWDtSCok8L78hcDECIeCcccn9uC0f+E5faIIt2vTiWK/pFuhMEpxNZ
 2ouqJUssg63XurolBGhTQ1XgBMLIN0krljNVrEIDPcxCRTRUTmKigl9YegR3pouXaj+n
 CuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gtsu4DiQ6NkNadeQUTLOsZxIVl78KlWuuU4+dlvfX00=;
 b=B7yslpa5TIxBOFqSkDZvHioy7nEcNBiypPRnuD/faeKsZQQ/IF5e0Nu8wXBKbk5alW
 JV77HCLxO2cLfsUQhUX8+IduL0aEvKXxvj7MaodtDZjWvt7dO6NJ4YDIbHDHgUR1iNae
 1NjYfnYfFqBQ+d+TfkG9/4bY4cOth/90j9EgCUa9aHiIifpVGNn8eWrDtEGN9x4rITzo
 ivMezcKxU5dsK/ocSrUVyrkTp9PjZAW/TZW/NuSLt6tVyu10W9w0iXlyW0wVYtPkMcPz
 KwtbZwSjXtYwjKPTInU7HWH3SWJS4U/IwmVQXBkl1OC7quyz4YP4Bpy41elUs3xfXWvj
 Yavg==
X-Gm-Message-State: AOAM5334p6Bk1neaJ14xHXydZqIFwZF6D6MLNX7gt4/Df4gNo19mUL2Q
 c2ReMvNNCdintIe2mgH5+rDqVpZ2/wt3km34cTQ=
X-Received: by 2002:a9d:2067:: with SMTP id n94mr19280459ota.78.1593531159910; 
 Tue, 30 Jun 2020 08:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MHfoubt1g2FzcjTw3a0vNr7X2T8Jb+nYoc4_x=Z2TP51afKg@mail.gmail.com>
 <a7acba46-5a9a-5dd2-71c6-7e4586485823@amsat.org>
In-Reply-To: <a7acba46-5a9a-5dd2-71c6-7e4586485823@amsat.org>
From: Erik Smit <erik.lucas.smit@gmail.com>
Date: Tue, 30 Jun 2020 17:32:28 +0200
Message-ID: <CA+MHfot6FdS2yT0mEsCW36bCfwy-WY-1KPQ-KDfYBKzTy=Gd7w@mail.gmail.com>
Subject: Re: hw/misc/aspeed_scu: 5d971f9e breaks Supermicro AST2400
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=erik.lucas.smit@gmail.com; helo=mail-ot1-x32b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eUH09d8yHTyM

Hi Philippe,

On Tue, 30 Jun 2020 at 17:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Erik,
>
> On 6/30/20 5:11 PM, Erik Smit wrote:
> > Hello,
> >
> > 5d971f9e memory: Revert "memory: accept mismatching sizes in
> > memory_region_access_valid" breaks Supermicro AST2400 u-boot.
> > Supermicro AST2500 u-boot is fine.
> >
> > The u-boot tries to make a 2-byte read from address 0x84, but
> > aspeed_ast2400_scu_ops has min_access =3D 4. When I change min_access t=
o
> > 2 or revert above commit, u-boot boots again.
> >
> > Is changing min_access to 2 the right way to fix this?
>
> If you have access to the datasheet and can verify, then yes.
> Else I suppose C=C3=A9dric, Andrew or Joel can check for you.

I do not have a datasheet. Aspeed seems quite picky about sharing this
and I'm just a random researcher.

Best regards,

Erik Smit
