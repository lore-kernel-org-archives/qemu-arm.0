Received: by 10.28.71.27 with SMTP id u27csp811827wma;
        Fri, 23 Feb 2018 08:51:43 -0800 (PST)
X-Google-Smtp-Source: AH8x22669y/eMksDxjL5fCMHD/NBRGgZ+0CNgLFXV7Gm6VaFZj2A4dCQzducO98NyKrCiGfgSCMZ
X-Received: by 10.129.55.208 with SMTP id e199mr1505011ywa.306.1519404703323;
        Fri, 23 Feb 2018 08:51:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519404703; cv=none;
        d=google.com; s=arc-20160816;
        b=NwVEkfnEWLhrh75670QT8oSG05J1IO5MCc8up985sKfopM9whwtg32mb/GjE3jOzdO
         aPj2X89vbHge7oXuGb7C4ou7aTpTjqoshAaOVwVf/bjz/I0FhRYUNC+meK2P61W9rRmK
         nC28nyO6n8tN6oBIiQK/iVmiG8NLg+k47tyx9nRmyWUAOBN4ScnGe43boX1+/wQF3Wx4
         OFPF5/RqLVxWgnsb72DJ4O5v/W/qy2HjxFVbt0f521rX8MP8ifHqPpzkUjf1vk1axNsQ
         IOPRYyuHpUqiPj/AMjTM4sDXMeeeN1fUoc/KigI5X26KWqIwZ390U3psSP7+Oq6Pb4DL
         NNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ZmcTti9ldTKmPEJ8MNk8TAM7pJQJdgKTCEpd3EWtejY=;
        b=pinfWEHqwL8FGGnXmTgY5jN/vmCW+9nZsaapxUqZzZJXBgfCEHC33fubCFq2r94MgF
         wamPd9LAvKvppNNxFHr/3KfTQklYGuX6mFd45cmkV9AEo8t228/8X4r3/70QdFCAEEuj
         rNkNzV/vtUxk3+6y9ioW09vrTv4J/azMxh5HHw7XYxPZTZVp0c5hyffAKpzpKSJuX5LR
         aXeaUCsY3IfOjNy1iQhYc/iX/+WP6hjHk/frEt46x8uHFZfo+vjngzxQ8c5py+bUE3V9
         T9P0x4XF+Z/xl1ETve4sND7Us+Fhqx1aPUFOFKtnTLBz0mTlCifHArLckmBdBF235GU4
         SuGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GU4Fjux8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x40si462546ywj.192.2018.02.23.08.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 08:51:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GU4Fjux8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epGZS-0004t3-Nc
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 11:51:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epGX8-0003Z9-KJ
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 11:49:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epGX7-0002Od-Lt
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 11:49:18 -0500
Received: from mail-pl0-x22a.google.com ([2607:f8b0:400e:c01::22a]:42631)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epGX7-0002Ml-Er
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 11:49:17 -0500
Received: by mail-pl0-x22a.google.com with SMTP id 31so5188111ple.9
	for <qemu-devel@nongnu.org>; Fri, 23 Feb 2018 08:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZmcTti9ldTKmPEJ8MNk8TAM7pJQJdgKTCEpd3EWtejY=;
	b=GU4Fjux8Fsj0PN/K/27GLppBpk3zeeluxIoRupgpBDGy0oJaptiDKMGgJ/BrfmT1TN
	8/JiUc/FWycMRrXKbHto3q83GZ8jJqeZPn8GGrHKZ9SwIS1EM0uhNaz5GbdKCR6CUajq
	+eCGKwPqFb80jTEMvl7g0rY8QiUnXeHsvbEpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZmcTti9ldTKmPEJ8MNk8TAM7pJQJdgKTCEpd3EWtejY=;
	b=K4tdX3JOGIY7NrYJ+zlytjyjKeM5zimMzWIVk2aInuodTYmmQh9Obxn5qVUmzg1HHe
	lUGs5JJOLZ91F5kGEjLPBlZMzUvRSdFWb4Z7g3sAWq37PF9mlx5bp0N7UmvnPIxf3W/l
	jiWCVBnhloU9VYCoqj2ALDYdx9znLnHhZLi/tRil6zSOVXtD1icdylMYaOIslKjdQw21
	pCvSd9Bahe8SCPfHlyXjyKcTBOATFooFE+6D5hUEzaexghZhh4FGUacda3QZOYRvHQoB
	x/iHRyAxhPmfsPl2sihPWQ+oEuBlB3nklbHKZn/slmMJwNQ7jXsM76EJfFnf7MvCUDvN
	uvxQ==
X-Gm-Message-State: APf1xPBerztVRaSIMUe9Odhb58miX6QS9UyE1acZOphVtI6snZvRGdy9
	LEoe5FyLwwudBQ0dJ29GHqbLtfSJ2tCVdXHD9OqhjA==
X-Received: by 2002:a17:902:bc41:: with SMTP id
	t1-v6mr2317041plz.436.1519404556408; 
	Fri, 23 Feb 2018 08:49:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 08:48:38 -0800 (PST)
In-Reply-To: <20180217182323.25885-40-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 16:48:38 +0000
Message-ID: <CAFEAcA-98xW_JP33Cv+A+WxDNVm79jay8Dm-km5LrhPJkQOCvw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22a
Subject: Re: [Qemu-devel] [PATCH v2 39/67] target/arm: Implement SVE
 Predicate Count Group
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U4WcEG5sL1Sq

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |   2 +
>  target/arm/sve_helper.c    |  14 ++++++
>  target/arm/translate-sve.c | 116 +++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  27 +++++++++++
>  4 files changed, 159 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
