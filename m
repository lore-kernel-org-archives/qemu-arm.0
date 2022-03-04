Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp119442lfo;
        Fri, 4 Mar 2022 15:43:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUyIo/RwtHZq3zZCpZuAAFzt7jCATJO6EFzFxhWQtug8FOlauF4WfS0XE/6JENq/xXFUvh
X-Received: by 2002:a25:e0cc:0:b0:629:17d1:7ba9 with SMTP id x195-20020a25e0cc000000b0062917d17ba9mr322072ybg.200.1646437432739;
        Fri, 04 Mar 2022 15:43:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646437432; cv=none;
        d=google.com; s=arc-20160816;
        b=RsrrhIIIJR9GQP0cLzq01ojyjzM+98OBXor7Fv1QVtDkLwLVuAH1X8818zd+UM4WgW
         oCOe402TgrXznqW99o7r/KFNRbK76uVriz8lCIz+VAjosCNWlHYnn2plIdpyMLoiXwF6
         D6AlGIzcggcQkpupsiB7dFay74Lj7XR7Gi8VTUfS/u1zXPFoY2hRtrbx8bwNSfN5tXZJ
         smUaDm4q4QWywqrig+GEzP4JwDeGs+bXi1xr5L6WoQpOroUA3o3RzKzC3AjwPmtZht/1
         LhL4I9E+KwODl3klhR+YKJnoxew8aDyeseHt+G4bp+gYBv9iZsSSwoVZzQ2Xm4CKMOif
         MoZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kRqs1yUy3Hy2Jh9AbP/seSdeTZP/Cdtr+ApNmnZ/uyM=;
        b=cl21jlTqABBR1gmN9dkFelocgoVdGdmvtllKS/glB6/BpgfOo7KtqykPy/1iQCoR5x
         putm05+ZPK0lFeik728AIYUdZphaU4gdq6IIVwQ0yw7d6sKiEWLNSXFtPSaznlm3SYyC
         9HlK2RiWBulRK+dp/Xm0ll7iKdBZr2idxirEdJ0fvFDRo+DmTetpotLH3zg3n3SnIgqg
         PY7LXIHAoYg7O2kkyZdPYS8Ij/l7KpAhF4vy9XSp3DWAth+ayozqGPbi1uhv67RrilK6
         AMVZsI5Kx0KkZ5Y8Di/OrY6e/FbXzI7cbOFj4jZsy3n2udsqpNLZBn6DnxH8UUIeyrO0
         PdVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Ps/xAP41";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i62-20020a819141000000b002dc3c57339bsi4530531ywg.353.2022.03.04.15.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 15:43:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Ps/xAP41";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:50712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQHaS-0006k0-5w
	for alex.bennee@linaro.org; Fri, 04 Mar 2022 18:43:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1nQHa3-0006jg-04
 for qemu-arm@nongnu.org; Fri, 04 Mar 2022 18:43:27 -0500
Received: from [2a00:1450:4864:20::52f] (port=39883
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1nQHa1-00042q-IQ
 for qemu-arm@nongnu.org; Fri, 04 Mar 2022 18:43:26 -0500
Received: by mail-ed1-x52f.google.com with SMTP id g20so12657253edw.6
 for <qemu-arm@nongnu.org>; Fri, 04 Mar 2022 15:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kRqs1yUy3Hy2Jh9AbP/seSdeTZP/Cdtr+ApNmnZ/uyM=;
 b=Ps/xAP41f5VDpPxGztxcg9Wih8NaGUPYllZxbUJDQP5qnScYPs94CCOc3bW1TD6uvo
 wC6nbdjc7M26wv4MHJstjN8bE9X50KxdjGJMwzHXQNyBIeZIdk2eAjHxEavk+PEq0/kT
 Bx8xkd2WUF8M57DXSSAY7tEcJx75EyPkxGXKfyF6oyI6MVzfJSkYWfnYtpSeod1DZED1
 Rp1M8++4eZWghpmQnlfm/AgKn1zzEgZm9nlUPiNOQjBbzlrbjc40mPCzcDMPSX4WZhCE
 kT5rbydeAzB7qfRhFVQtCRdsHaQy9pveRSG2eLG748js8Nt9Ky/HOB4ATzMjbfvJjmy3
 HsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kRqs1yUy3Hy2Jh9AbP/seSdeTZP/Cdtr+ApNmnZ/uyM=;
 b=hF2ofArCKvTZEObXyTZRkY7rhQwiZQ/9ChFwwQSbLbrnkjQC+ntQTffL4Sseh6TSao
 HuYXTnBE8viT/FMBZiE/voN1+Ydaik+dMvos1QCYU2vzCOWE5MBTK9fuEj1ekFoWYufg
 wb+yzztOIrW51TeBbnu51xHAzkGdDt3iqO2YOdoRUzKFRkMwCjoeZDd0c2A1fsoo7JTr
 Vn7zP8eQHJWjhDsd+JxIG4MI7r6UWqx5Er6HI92qYjSUu8WKCchp1E02TaU55M3a+Et2
 CW2rtfs0xxirECB5Uh/D3So79x9Ce5K/F4dv4nWSFWBOcDCQHw2bwpmgJzpZqwgynFFj
 DG3w==
X-Gm-Message-State: AOAM532piMK2IBQ1hJAjPdywWwlapqpcByeOHGzmV8eE9BfIt+8nIdwJ
 4JDb+4/YdsCPSDBtBQ81XzHURJlUM4hz0PH90Q6+0Q==
X-Received: by 2002:a05:6402:68e:b0:415:d29e:dfe8 with SMTP id
 f14-20020a056402068e00b00415d29edfe8mr805081edy.351.1646437402415; Fri, 04
 Mar 2022 15:43:22 -0800 (PST)
MIME-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
 <20220304214354.GL3457@minyard.net>
In-Reply-To: <20220304214354.GL3457@minyard.net>
From: Titus Rwantare <titusr@google.com>
Date: Fri, 4 Mar 2022 15:42:46 -0800
Message-ID: <CAMvPwGpzO3VyCqGJY28QVQoo9AwYxxrvP3RqPS6JTgpTk8ojtw@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] This patch series contains updates to PMBus in
 QEMU along with some PMBus device models for Renesas regulators. I have also
 added myself to MAINTAINERS as this code is in use daily, where I am
 responsible for it.
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=titusr@google.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H6imE7TnsedJ

On Fri, 4 Mar 2022 at 13:43, Corey Minyard <minyard@acm.org> wrote:
>
> On Tue, Mar 01, 2022 at 05:50:44PM -0800, Titus Rwantare wrote:
> > v2:
> >   - split PMBus commit with updates into individual fixes
> >   - renamed isl_pmbus[.ch] adding _vr for voltage regulators
> >
> > v3:
> >   - split uint refactor commit and removed commit renaming files
> >   - rename rolled into preceding commits
> >   - update commit description for uint refactoring change
>
> This all looks good to me:
>
> Acked-by: Corey Minyard <cminyard@mvista.com>
>
> Do you have a plan for getting this in to qemu?  Like through the ARM
> tree?  I could take it into an I2C tree, but there's really not much
> activity or work there.
>
> -corey

In general PMBus is more specific to i2c than ARM, but I'm not sure of
the QEMU implications.

Titus
