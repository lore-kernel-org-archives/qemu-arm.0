Received: by 10.223.159.82 with SMTP id f18csp999167wrg;
        Tue, 21 Nov 2017 10:15:47 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbooI5N7kePpLQswHBU2nQ3xp2R+SH5r/lCg+A6celb/sRRfQ00IMorlJrhhz6/oPakl/DO
X-Received: by 10.37.252.36 with SMTP id v36mr12037229ybd.236.1511288147485;
        Tue, 21 Nov 2017 10:15:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511288147; cv=none;
        d=google.com; s=arc-20160816;
        b=onoSO166vGCrX9mDG5sPoR1nRBTff7XFGX+n1fnzh/LDRherOgZygnHdb2XQRnAz38
         g0Qr1XMKh0h3ywwstLnSO86Tg+MZgDSjrX9pwIWsp6Gk44C7/seBRYG79h55UmXEvkZo
         IdAFbaX3ZuQwbdVK9gub3S512dZVv/CD/K92i71B1pj6TRx2D9H+K88yhMWGnmqz3cyO
         /wschdiPpgNej959KcvQLSB9mm4W/N8h7KO+1VP8gtAjAbNFS6vn3bl41BBJ2xPbzfto
         ycxBvzZsRVReH9J8+t6WpBb1qVJCMtXThqo+ovoxz3dUjJnh/K9CkbbC8mqFxypzp+3z
         nvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=OmlsuDEfeCNWFjeL6zC+6zenoncsaeIc6h6+YyBVZkE=;
        b=F4tSgrhpddvLSvXSEgduO30rsEDierKdKBB6anbz+uXyeZNbBfi/TrPLfCgWMvg/Q8
         93tkxIPXkRvEXdzyasoO3TWXEGzBIqrKrS1dyAyvH3u/bIYONftxOLeVkD89O/tCVOFb
         kuwpnMuU1BAKknwsfaOtsEDMlc03GD9wrAktGvycIiJ2jxzd6zRI+OQTD00deaNiJOVq
         vmu3q7c7mHkGQkjSoou66nPnEiH+QBXJUTcJjkhCvDcknjsz385aL5SpKhgqHA5cp4Fj
         xwa5cB2ba2NKAgOGZ9ww3nuF+c32oS3qhvI/h4mdVl01Xg7AJYvmf0JWNqDPQ7C4/05V
         2bWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HSq0GoIe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 129si2974489yby.653.2017.11.21.10.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 10:15:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HSq0GoIe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHD5G-0005Sv-V9
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 13:15:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHD58-0005Sh-Cv
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:15:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHD57-0002Mj-HT
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:15:38 -0500
Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236]:33903)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHD57-0002MM-Bw
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:15:37 -0500
Received: by mail-ot0-x236.google.com with SMTP id o23so11338708otd.1
	for <qemu-arm@nongnu.org>; Tue, 21 Nov 2017 10:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OmlsuDEfeCNWFjeL6zC+6zenoncsaeIc6h6+YyBVZkE=;
	b=HSq0GoIeea+uKo42DtFQLPD2CmA4uZ12gL8CxWUvHawne2laD0RwBl+PS6oSrvlRwf
	el0nTTHn9lfehGzaaa0wkNej51F50Tf39xL1/2udYKATRIZe6VMpYRSYMfKTozKq8klu
	5/2IWAWqkd8boFLyul+uFlWTYMlXzwo+Iip9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OmlsuDEfeCNWFjeL6zC+6zenoncsaeIc6h6+YyBVZkE=;
	b=ppefqnn8LnyCqM7331i4EOO50npZmV+os4Nz6hzM5MmTyS5lvzi9RF5uEka6X5fMuI
	8Xng+a8+ChSv2lBQlSZFQRlOTUpNSzKzB4Y1IQ09S2WGFO3mNGGF9uBoTh1LfyqbNaFs
	NwS9+BJqa22BUMerOfeN74Jcsbel+IPgt2MoA4hyRbEo4uFXCXxPkgtN8FczlAm+poQ3
	m4nwMX43RIFTCKlERg95wYp1eL9bIluabua8HPWoT94YLZqwFruKV16tlaJ3uBCsrhRz
	ULiirhXTutlGfqPxWWXI/3jTZYIlDocHTxpp1ubVqF2FsmWllJ2RzdmeIybGkCnnhiD2
	zL9g==
X-Gm-Message-State: AJaThX5w8ZLyrFaKyFkqLKh07j/XgVj4npJS6vcI1rUW40IgEQzXGxmn
	U4lN+s+WnptHeHC0GazqaQbBDpuedu4qOIXU50ONuw==
X-Received: by 10.157.40.7 with SMTP id m7mr11809366otb.91.1511288136742; Tue,
	21 Nov 2017 10:15:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 10:15:16 -0800 (PST)
In-Reply-To: <20171106154813.19936-16-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-16-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 18:15:16 +0000
Message-ID: <CAFEAcA8mVUPJSDqUJWAzOo3d=BgBO7LsQczRE-NubmK4hSzHOg@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::236
Subject: Re: [Qemu-arm] [PATCH v3 15/30] i.MX: Add code to emulate i.MX7
 SNVS IP-block
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2WDdH19qPCap

On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Add code to emulate SNVS IP-block. Currently only the bits needed to
> be able to emulate machine shutdown are implemented.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
