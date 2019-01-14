Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2950653wrt;
        Mon, 14 Jan 2019 03:53:52 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4RxyxwTrab30mdZSgXKZihNYYjLVlTqkRh7CVhJYv4MKc0CjQBkimAaJoBRvzM24DuEDXD
X-Received: by 2002:a1c:9cce:: with SMTP id f197mr11644704wme.135.1547466832375;
        Mon, 14 Jan 2019 03:53:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547466832; cv=none;
        d=google.com; s=arc-20160816;
        b=gyKRAL/TBV1dOHgYpfeZhWB0WRhU/fum5tsVfmLkur/eWtQYAqBVf3Lh2z4pu6iIr6
         Q6yCU3U7QtFtw9sRWIwPramzh+9iTs2n1PWu32iNlaFlA4pHbyhk2NZLQNQeZydtEOv1
         i+j3NDcGRJ2nUELdBJ0MwC7kzS/njA2ZsHFO0zG2wPP6WsfkzWujBedEiLJJVAFlwY2f
         urZiNzgXNuEJsO5N4cfckH1EHTUwI2oNcQOS/7YRXIJ6+M54V8aROMkMZ/+IUn2YfoBw
         zVjRuLLSzCDzt2FZPvhssXYs5Aoykos6+GfRjFNMN09cx/vtP5Q51Up54s/dN1CmPZhO
         y4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xBphF+pIrS00eXsLvBZ6ckjmDgaT/ll478y7fTNwCQQ=;
        b=z2j6a9SrEhtz0MAmE9+c23p9m1FfIwoIh8NlhjiTM/BxBcG1fakXdMycQVYHYRb6r7
         p9sYcoTvk/TJeDZebpB5LYyEfTJIpfKlY6kZEhh7bWUM2otOzH9VZ9VliXlQGGsNEpHJ
         QYqbtoKCjNRE8nWbl/QEtQ9ICqeobMAn+JhWsTzoyiOfFx8EPDi+JUjlzKv03pOAeYhW
         8YRM9sny61y7iRiuSD5X1iN2gg9LUbTbwionLISVh+usaUfuFYhcUH20QW03Gd6CoOt2
         l31wIbIpJEX9Hih2VtwXIJ0PSgNnslsiYD94kBvCYeJ2PCtSvJCIyTTyWVcz36rC98ru
         otlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JTM787hC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si47515455wrh.223.2019.01.14.03.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 03:53:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JTM787hC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:56775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gj0oR-0005Gr-Fv
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 06:53:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gj0oB-0005EW-MT
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 06:53:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gj0o6-0003cQ-5Y
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 06:53:33 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:36280)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gj0o0-0003Wu-J7
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 06:53:27 -0500
Received: by mail-oi1-x230.google.com with SMTP id x23so17615741oix.3
	for <qemu-arm@nongnu.org>; Mon, 14 Jan 2019 03:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xBphF+pIrS00eXsLvBZ6ckjmDgaT/ll478y7fTNwCQQ=;
	b=JTM787hCkCPH1SY7uE/9a27GL3UGkfv0qIkRboZhjt7zRkmjUjn1iwVqlN/75iO58T
	JLXcIlWkAtx9XbSUCb7ZtNWuyRTTdCVeMJRm2JF0DQAV7uQk9Wb9viiQ6fISoaW4sXE4
	E9uIioXPiHWtHrswkva+9faHXzUWvCAECEmkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xBphF+pIrS00eXsLvBZ6ckjmDgaT/ll478y7fTNwCQQ=;
	b=Ek/+sziNX5pryBO3w4hY6gfY+T5lTgcRzJsX2+lSuHKOu8/qjrlKkZgB9CEiP8uNwt
	1jLcZtIpF/QRIUCIEIvSstndjke0ShwM6WIGQTCOTUstN3DukBDk21hhSQ+RGTaImOPu
	NtWBkQUluLmOVM409CjO1r7o8MVi/qL9PE6bzWzmXZpO0EBDoag6kXrkcO678mSyWyWC
	7dcnjZzc53DVuzGbmWhNDEBUNAHArUHAyCgEK3ClczrSqUvopyq9ER85yHLT0Iqhv4Sn
	QfDuN/dQ33/7OnWGrMILjJm4d7ALnnACYPBM4xKcvZ/ZOD5dYeGT4cKtRMFTdqV7cLn6
	gpxg==
X-Gm-Message-State: AJcUukew6EWLNqNo4UTBZaHL0EE+gVUeUlCx4ihDwiWCyFixicGl3ufO
	Ecddlcc+Scqfnm2xt2dyxqKmIuhGWnpPQcewwwJUmA==
X-Received: by 2002:aca:c501:: with SMTP id v1mr14881421oif.48.1547466799451; 
	Mon, 14 Jan 2019 03:53:19 -0800 (PST)
MIME-Version: 1.0
References: <20190108163008.7006-1-peter.maydell@linaro.org>
	<20190108163008.7006-4-peter.maydell@linaro.org>
	<CAL1e-=gtbka64eAhVdbPyLa4+HP-OSQRg7u6+SC-8MCRgoZ9Qw@mail.gmail.com>
In-Reply-To: <CAL1e-=gtbka64eAhVdbPyLa4+HP-OSQRg7u6+SC-8MCRgoZ9Qw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jan 2019 11:53:06 +0000
Message-ID: <CAFEAcA-3CDZg8A3tB-TSQ_M+RVanqBNQh1EmPpqx0ftoqqDD8A@mail.gmail.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::230
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/4] accel/tcg: Add cluster
 number to TCG TB hash
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"Emilio G . Cota" <cota@braap.org>,
	"patches@linaro.org" <patches@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tbRUjrKXH+Xe

On Mon, 14 Jan 2019 at 01:08, Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
> I do understand the definition of cluster_index in the sense
> of this series. However, it looks to me that the term
> "cluster" is generally overused in areas where we work.
> This may lead to some confusion for future developers, and
> let me suggest some other name, like "tcg_cluster_index" or
> "tcg_group_id", or "translation_group_id".

Note also that the cluster index is not purely a TCG
concept -- it also (in master at the moment) affects
the gdbstub interface. Different clusters appear as
separate processes in gdb, whereas different CPUs in
the same cluster are different threads in the same CPU.
(And by default only the first cluster's CPUs will
appear, unless you explicitly attach to the second cluster:
this is a limitation of how gdb's UI handles multiple
processes.)

thanks
-- PMM
