Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4761456njc;
        Tue, 27 May 2025 05:02:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6p7mkm+DhoMtDg1WU2d8+vx/IOeccHU6MT19OJ9m5kuLYevrWB8eqEa4zgLRfDnHY+ga2G6kwzNGQlg==@linaro.org
X-Google-Smtp-Source: AGHT+IEARvMsYdz3grHJWradmxPVAvZTEmd3eGj8O3JrXoCE8gIZIQyDEP+zX5nSLt8sDe7DXnxQ
X-Received: by 2002:a05:622a:1bac:b0:49d:89bf:2975 with SMTP id d75a77b69052e-49f4655a1c4mr223601301cf.18.1748347372239;
        Tue, 27 May 2025 05:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748347372; cv=none;
        d=google.com; s=arc-20240605;
        b=lSnFg7JM+4YJilrY1FPzl8BVxIOXtyi2aW1VtW3UgREXgPMa0PNjEZ9XoS6kU/9oEd
         fkPkfAz7AKPGJvh7jMeTc42dDTSmIXsxnl6spLjcTfd5qwBJxbwH6tvzUux3Dx4Am3Bg
         nzb5sFeqU9isfM6l2g6h+LDKPVoWGmSMmMdbqP+GdQAWx+SBTe4/GFbgb1haFC6P9Kv3
         LhPdrE1XgcwHynujAHrTXEg4qpifN8L/ZZzQ6mbfDPwlgu6E/hNb/l6/WoTfMHXR+hfc
         BBiEYbTrZGGz27HFmU5jm1rHJQk2aHRk5iPSWbaSBFZkMomXcK0EmRsfGE6AjYtUh8m0
         SVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:subject:cc:to:from
         :message-id:date:dkim-signature;
        bh=uG6LDhkeqdRS6tB7aWFDJqX2y+bC/erBq1D1W5Dyq/E=;
        fh=YSzsmHBVxrdPESpPegyfn1EKuQwVqHEVQP/gDhdU2pE=;
        b=NLj0lREKhZUIAO13XKlZ4ociI/PVilFtZcAu/yJtJVGfaiVjS9+L8G7ZvAsATclMI+
         z+tz3sznQ8PPi9aHm6UcKRgUSv60gSpjr+CMGzRhDIze5gSWxEhX0tNUp4o0vZytNkv4
         vTvk7JFPcgWrDRuYkiLGzN89VBA3/QAsRAa+FCooH4a5TU9pxoGf+MeUmy3qqoLbq03o
         BvEdKnTx5u72sXJH3k/U5lUCf7pzH6chtkUZTACfuCPGaJBtxWaA9VYacGp1Q+Nm3plw
         lzm/4HEYP3Nu5oYU9QauekrgU0kNOOyBOGq0VWKCiiXjxFRRfD1uvBhE7IHHsYRAHS/o
         T5/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=rv9V660k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae565559si260761681cf.282.2025.05.27.05.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 May 2025 05:02:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=rv9V660k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJt0a-0002Ye-AN; Tue, 27 May 2025 08:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1uJt0N-0002Ti-7R; Tue, 27 May 2025 08:02:10 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1uJt0J-00051K-PJ; Tue, 27 May 2025 08:02:01 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 407675C5703;
 Tue, 27 May 2025 11:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E773FC4CEE9;
 Tue, 27 May 2025 12:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748347316;
 bh=GzwBNftucR2TTDA+jkCP2BEgHRGm6cfj6GYLnBFU2s0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rv9V660kGCZC6HH91Pe/hh7rP5U7REIRh03LMz7/m6zHIdM+JNZfkPn+ul0V6+Z2q
 JuVlLjdgIGzV/SLyezqc2MWoeirHGdBpkDVNDlToM6/Fd4UM0DSLjOY58JST9aBjaB
 Ie35L9EnsPv5bXagqD98AYXato73IoeZPPdVLnTaf44ggNfG+O6DO3MRM/EK0s45Hm
 GkJvee5sdxe7kIMuIV6Ws3YfRKs4HkV+ivQanigvC9BwsKTfr+PEuVUFRSUYssxZn7
 g+4u0pP6FKwLVrGMhS88jWkAjMIOSFifgfQ2QD2QPW/IOn+8T4M0ukGR2Yq2bBTPGA
 uETCMXSU2Lw0w==
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=goblin-girl.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1uJt0E-000rtP-KG;
 Tue, 27 May 2025 13:01:54 +0100
Date: Tue, 27 May 2025 13:01:54 +0100
Message-ID: <86ldqidzyl.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Miguel Luis <miguel.luis@oracle.com>
Cc: Eric Auger <eric.auger@redhat.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "gkulkarni@amperecomputing.com" <gkulkarni@amperecomputing.com>,
 "gankulkarni@os.amperecomputing.com" <gankulkarni@os.amperecomputing.com>
Subject: Re: [PATCH v5 0/5] ARM Nested Virt Support
In-Reply-To: <C10D9293-32F7-4834-9CEE-6AFD4BDBC30E@oracle.com>
References: <20250527062534.1186004-1-eric.auger@redhat.com>
 <C10D9293-32F7-4834-9CEE-6AFD4BDBC30E@oracle.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: miguel.luis@oracle.com, eric.auger@redhat.com,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=139.178.84.217; envelope-from=maz@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: +t4d60HsYOTj

On Tue, 27 May 2025 12:33:23 +0100,
Miguel Luis <miguel.luis@oracle.com> wrote:
>=20
> Hi Eric,
>=20
> > On 27 May 2025, at 06:24, Eric Auger <eric.auger@redhat.com> wrote:
> >=20
> > Now that ARM nested virt has landed in kvm/next, let's turn the series
> > into a PATCH series. The linux header update was made against kvm/next.
> >=20
> > For gaining virt functionality in KVM accelerated L1, The host needs to
> > be booted with "kvm-arm.mode=3Dnested" option and qemu needs to be invo=
ked
> > with: -machine virt,virtualization=3Don.
>=20
> For the current kvmarm/next the guest also needs
> =E2=80=9Ckvm-arm.mode=3Dnested=E2=80=9D I believe.

No, unless you want the guest itself to be NV-capable.

	M.

--=20
Without deviation from the norm, progress is not possible.
