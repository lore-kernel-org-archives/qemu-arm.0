Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4714269ejc;
        Mon, 6 Mar 2023 06:33:03 -0800 (PST)
X-Google-Smtp-Source: AK7set91BP7Z1UdtsXcuBlzng4o5dg86GZe8VCzaW4dRvErJKo4mftyEj6+ql6TlYhAm5zdTcYnV
X-Received: by 2002:a05:622a:44c:b0:3bf:bdb8:c64a with SMTP id o12-20020a05622a044c00b003bfbdb8c64amr18993161qtx.49.1678113183116;
        Mon, 06 Mar 2023 06:33:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678113183; cv=none;
        d=google.com; s=arc-20160816;
        b=mwPXv6tDF5jVUVvrROwZ3Fvhm6e1XIoWseehAnlvx3lzar3Oay4mqq0SwiQy91PYOp
         BmvNNAJz8yGL/q/hBe8dJgJh9s8fXH+SLNRDjDiK9HSCP7bJObahLO4Sckkw1lwpDrxu
         G0Ps7A+YEN/TitCJ929hyea3hgs1IlyXPizRI90ZGznym38Ryqu6msS8DXUf2juSVfP8
         6YGYUIjfogRtIXF2S7vj2z2RFvAEDvnsVp3tWL8DKZGVDIPUt/BJIJrKD4eS+IskvTUd
         TZIZCsYaHc/NTWwuJmAk73Jd+FAg0pRjjBo1y3mU0IJBrzw1X051dfLXFOULZ/o4mkLM
         zlfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:in-reply-to:subject:cc:to:from:message-id:date
         :dkim-signature;
        bh=29EixLpyxHxsE1C8b/OtrcUeP5cl8l/f7KkXpG6RoSQ=;
        b=ZbnbBtlSZnfsy+9gbO9G9ZJdMFRHGnn2z5wvuvwehP/OcZHEe6F3P5r5my9tso97Hv
         Kn/f7AqahVXWYxtpZIoSYUNb5rCioRp5XfbCtvxe7oR9pJzek3N1KU7m3rnB8/Kl64Fj
         oe5yoYUlu7tGN1h3OIvW4d4nlQiPhuLNytiKJOa1aNTUna4aDomw7w/5bsC0RCb6clx5
         P0ZfvIAImaELge7a2vT0eOfGCLxY4MLSdh/vU+rF44y+B7si8w0G7HUJJ9RaEe0eMyRY
         /G7MEfgXuO2yf5rUGE/74SgKQeyMyticxCLeyXKCiTjIqLi+vL50n2suR/kbvufgTXw8
         hlQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=mxA8CViU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20-20020ac85814000000b003aedf4417fdsi7312899qtg.614.2023.03.06.06.33.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 06:33:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=mxA8CViU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZBtS-0004hJ-UV; Mon, 06 Mar 2023 09:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1pZBtS-0004gE-Ad; Mon, 06 Mar 2023 09:32:50 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1pZBtP-00054U-Ta; Mon, 06 Mar 2023 09:32:49 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B8C2AB80E55;
 Mon,  6 Mar 2023 14:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC30C433EF;
 Mon,  6 Mar 2023 14:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678113158;
 bh=6metGQJLLrMIQV46HL1rHuWCjpPItz5EEpI2mdssYmI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mxA8CViUGcBd5JTsSkVRDV1Ju3DwDKl0DYjS1Cod2g9WsXItj3yq68ptU7Q5DHj6S
 wwTRqUpyv3NnHz3OqVq3+q25+Hd6Inaswfx8SBY7VjRGSyz8VcghiNofu+iZENy9pt
 NP4QR5lfX2BJfYevphtARkGkJS8IFwD55SE7e0JzJcAwUdN8Cg6zf77RTrycwKRUQ9
 6rhQ/xIskhYtwGkWLdK/M1q98XN7qIqO7l2EfnzeB6gdwD1yGORjCbQzHOr9cNPEhQ
 u1xXB/tkN0p9BdwnGeui44vFmkn9F83DyOG/uuXesXCGL7B4k+3qYVR1cwZhMjGBnm
 z4wpUsKjZdmig==
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=goblin-girl.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1pZBtE-00FEK3-Ax;
 Mon, 06 Mar 2023 14:32:36 +0000
Date: Mon, 06 Mar 2023 14:32:36 +0000
Message-ID: <864jqyympn.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>,
 Andrew Jones <drjones@redhat.com>
Subject: Re: [RFC PATCH 2/5] hw/intc/gicv3: add support for setting KVM vGIC
 maintenance IRQ
In-Reply-To: <CAFEAcA9ZzN0Xokh4kFcxtpv9hU512Km1EcaJHLG3JznVDF=Tew@mail.gmail.com>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-3-miguel.luis@oracle.com>
 <CAFEAcA9ZzN0Xokh4kFcxtpv9hU512Km1EcaJHLG3JznVDF=Tew@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/28.2
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: peter.maydell@linaro.org, miguel.luis@oracle.com,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, haibo.xu@linaro.org, drjones@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=145.40.68.75; envelope-from=maz@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dVbSj7xfP9/b

On Mon, 06 Mar 2023 14:02:33 +0000,
Peter Maydell <peter.maydell@linaro.org> wrote:
> 
> On Mon, 27 Feb 2023 at 16:37, Miguel Luis <miguel.luis@oracle.com> wrote:
> >
> > From: Haibo Xu <haibo.xu@linaro.org>
> >
> > Use the VGIC maintenance IRQ if VHE is requested. As per the ARM GIC
> > Architecture Specification for GICv3 and GICv4 Arm strongly recommends that
> > maintenance interrupts are configured to use INTID 25 matching the
> > Server Base System Architecture (SBSA) recomendation.
> 
> What does this mean for QEMU, though? If the issue is
> "KVM doesn't support the maintenance interrupt being anything
> other than INTID 25" then we should say so (and have our code
> error out if the board tries to use some other value).

No, KVM doesn't give two hoots about the INTID, as long as this is a
PPI that is otherwise unused.

> If the
> issue is "the *host* has to be using the right INTID" then I
> would hope that KVM simply doesn't expose the capability if
> the host h/w won't let it work correctly.

No host maintenance interrupt, no NV. This is specially mandatory as
the L1 guest is in (almost) complete control of the ICH_*_EL2
registers and expects MIs to be delivered.

> If KVM can happily
> use any maintenance interrupt ID that the board model wants,
> then we should make that work, rather than hardcoding 25 into
> our gicv3 code.

+1.

I'd eliminate any reference to SBSA, as it has no bearing on either
KVM nor the QEMU GIC code.

I also question the "if VHE is requested". Not having VHE doesn't
preclude virtualisation. Was that supposed to be "virtualisation
extension" instead?

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
